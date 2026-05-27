DDMControl = require("DDMControlV2")
local 工作目录 = getWorkPath()
print("当前工作目录:" .. 工作目录)

作者UUID = "9ac4b2d1-5274-4a02-9734-cbb758cf2ac2"--替换成自己的
卡密UUID = "eface6cd-c334-42ad-81d8-aec1d8763dca"--替换成自己的
卡密密钥 = "29696e94-03e2-40a5-827d-29cf00749856"--替换成自己的
云控UUID = "178006beea68472b99d6c14817cb858d"
云UIUUID = "d2fd188301b24487a5ecd924fdaab102"


--部分网络无法访问的使用代理服务器访问,dxxs.privateapi.xyz:9000,msld.privateapi.xyz:9000,如果是脚本无法访问,需要修改初始化的代码,如下:
local 服务器列表 = {"api.privateapi.xyz" , "msld.privateapi.xyz" , "dxxs.privateapi.xyz"}
local 服务器 = ""
local 服务器维护云端地址 = "https://gitee.com/xnjsq/xcc1/raw/master/csgz" --"https://gitee.com/xnjsq/xcc1/raw/master/moniqi"
local 卡密状态文件 = 工作目录 .. "/.state.json"

local function 获取远端文本(url)
	local ret = httpGet(url , 10)
	if ret and #ret > 0 then
		return ret
	end
	
	local https = require("ssl.https")
	local ltn12 = require("ltn12")
	local function https_get(请求地址 , depth)
		if (depth or 0) > 3 then
			return nil
		end
		local _body = {}
		local _ , code , headers = https.request{url = 请求地址 , sink = ltn12.sink.table(_body)}
		if code == 301 or code == 302 then
			local loc = headers and headers.location
			if loc then
				return https_get(loc , (depth or 0) + 1)
			end
		end
		local body = table.concat(_body)
		if body and #body > 0 then
			return body
		end
		return nil
	end
	
	return https_get(url)
end

local function 读取云端服务器维护状态()
	local ret = 获取远端文本(服务器维护云端地址)
	if type(ret) ~= "string" or #ret == 0 then
		print("读取云端服务器维护状态失败,返回空内容")
		return nil
	end
	--[===[print("云端服务器维护原始内容:")
	print(ret)]===]
	
	for 行 in ret:gmatch("[^\r\n]+") do
		行 = 行:gsub("%-%-.*" , "") -- 去掉注释，避免误命中注释里的 true/false
		if 行:match("^%s*服务器维护%s*=%s*true%s*$") then
			print("解析到服务器维护值:true")
			return true
		end
		if 行:match("^%s*服务器维护%s*=%s*false%s*$") then
			print("解析到服务器维护值:false")
			return false
		end
	end
	
	print("没有解析到服务器维护值")
	return nil
end

local function 刷新服务器维护状态()
	print("开始刷新服务器维护状态")
	local 新状态 = 读取云端服务器维护状态()
	if 新状态 ~= nil then
		服务器维护 = 新状态
		print("刷新服务器维护状态=" .. tostring(服务器维护))
	end
	print("刷新服务器维护状态结束,返回=" .. tostring(服务器维护))
	return 服务器维护
end

local 读取本地卡密到期信息
local 打印本地卡密到期信息

function 解析卡密到期时间戳(到期时间文本)
	到期时间文本 = tostring(到期时间文本 or "")
	local 年 , 月 , 日 , 时 , 分 , 秒 = 到期时间文本:match("(%d+)年(%d+)月(%d+)日(%d+)点(%d+)分(%d+)秒")
	if not 年 then
		return nil
	end
	return os.time({
		year = tonumber(年) ,
		month = tonumber(月) ,
		day = tonumber(日) ,
		hour = tonumber(时) ,
		min = tonumber(分) ,
		sec = tonumber(秒) ,
	})
end

function 本地卡密是否到期()
	local 数据 = 读取本地卡密到期信息()
	if not 数据 then
		return nil
	end
	local 到期时间戳 = tonumber(数据.到期时间戳)
	if not 到期时间戳 then
		到期时间戳 = 解析卡密到期时间戳(数据.到期时间)
	end
	if not 到期时间戳 then
		print("本地卡密状态没有可解析的到期时间")
		return nil
	end
	return os.time() >= 到期时间戳 , 数据
end
 
function 保存卡密到期信息(卡密 , 到期时间 , 登录结果 , 状态说明)
	local 到期时间文本 = tostring(到期时间 or "")
	local 数据 = {
		卡密 = tostring(卡密 or "") ,
		到期时间 = 到期时间文本 ,
		到期时间戳 = 解析卡密到期时间戳(到期时间文本) ,
		更新时间 = os.date("%Y-%m-%d %H:%M:%S") ,
		更新时间戳 = os.time() ,
		当前工作目录 = 工作目录 ,
		登录状态 = 登录结果 and tonumber(登录结果.code) or nil ,
		状态 = 状态说明 or ((到期时间文本 ~= "" and "已获取到期时间") or "未获取到期时间") ,
	}
	local 编码成功 , json字符串 = pcall(function()
		return jsonLib.encode(数据)
	end)
	if not 编码成功 then
		print("保存卡密到期信息失败:" , json字符串)
		return false
	end
	local 写入成功 , 写入结果 = pcall(function()
		local 文件 = io.open(卡密状态文件 , "w")
		if not 文件 then
			return nil
		end
		文件:write(json字符串)
		文件:close()
		return true
	end)
	if not 写入成功 or not 写入结果 then
		print("写入卡密到期信息失败:" , 写入结果)
		return false
	end
	print("已保存卡密状态")
	return true
end

function 保存卡密占位信息(卡密 , 状态说明)
	local 旧数据 = 读取本地卡密到期信息()
	local 保留到期时间 = ""
	if 旧数据 and type(旧数据.到期时间) == "string" and #旧数据.到期时间 > 0 then
		保留到期时间 = 旧数据.到期时间
	end
	if not 状态说明 then
		if 保留到期时间 ~= "" then
			状态说明 = "服务器维护中，沿用已有到期时间"
		else
			状态说明 = "服务器维护中，暂未获取到期时间"
		end
	end
	return 保存卡密到期信息(卡密 , 保留到期时间 , nil , 状态说明)
end

读取本地卡密到期信息 = function()
	local 内容 = readFile(卡密状态文件)
	if type(内容) ~= "string" or #内容 == 0 then
		print("本地没有卡密状态文件")
		return nil
	end
	local 编码成功 , 数据 = pcall(function()
		return jsonLib.decode(内容)
	end)
	if not 编码成功 or type(数据) ~= "table" then
		print("本地卡密状态解析失败")
		return nil
	end
	return 数据
end

打印本地卡密到期信息 = function()
	local 数据 = 读取本地卡密到期信息()
	if not 数据 then
		return nil
	end
	print("本地卡密状态:")
	print("卡密:" , 数据.卡密)
	print("到期时间:" , 数据.到期时间)
	print("到期时间戳:" , 数据.到期时间戳)
	print("状态:" , 数据.状态)
	print("更新时间:" , 数据.更新时间)
	print("更新时间戳:" , 数据.更新时间戳)
	print("当前工作目录:" , 数据.当前工作目录)
	return 数据
end

if 服务器维护 == nil then
	服务器维护 = 读取云端服务器维护状态()
	if 服务器维护 == nil then
		服务器维护 = false
	end
end

local 执行卡密登录

function 初始化叮当猫()
	--api为主服务器,其他为代理服务器(解决部分网络无法访问的问题),可在后面添加号一样可以访问后台.例如 dxxs.privateapi.xyz:9000
	
	while true do
		for i = 1 , #服务器列表 , 1 do
			服务器 = 服务器列表[i]
			local 初始化结果 = DDMControl.初始化( 服务器 , "9000" , 云控UUID , 作者UUID , 云UIUUID , 5)
			print(初始化结果)
			if 初始化结果 == true then
				return
			end
		end
		
	end
end

if 服务器维护 then
	print("检测到服务器正在维护,跳过初始化叮当猫和卡密登录")
else
	初始化叮当猫()
	print('叮当猫初始化完成')
end
卡密心跳失败次数 = 0

卡密登录端口 = "19443"--免费版固定这个端口,私人版可改

校验通过 = false --校验通过 这个变量名 可以改成别的,主要是防止破解者伪造回调函数,写在自己代码里比较好防止通杀破解
local function 服务器校验回调(校验参数)
	--这个参数免费版固定这个值,私人版可改
	if 校验参数 == "32195d1f2b4da21a1f20cc7c42345906f86e79ddd3baba9c169827a2b2d29562" then
		校验通过 = true
	end
	return true
end
local function 卡密登录结果校验(Sign , Timestamp , 卡密 , Token , 卡密UUID , 卡密密钥 , 设备信息) --这个函数名称最好改个名,全局变量容易被hook,然后下面调用的地方也改
	local 当前时间戳 = os.time()
	if 当前时间戳 - tonumber(Timestamp) >= 3600 then
		--当前本地时间,和服务器登录返回来的时间 如果大于3600秒则判定他失败,8成是破解的,但是也会有模拟器时间不准的情况,自己取舍要不要这个判断
		return false
	end
	
	local 本地Sign = 卡密..Token..卡密密钥..卡密UUID..设备信息..Timestamp
	if MD5(本地Sign) == Sign then
		return true
	else
		return false
	end
end

local function 卡密心跳结果校验(Sign , Timestamp , 卡密 , Token , 卡密UUID , 卡密密钥 , 设备信息)--这个函数名称最好改个名,全局变量容易被hook,然后下面调用的地方也改
	local 当前时间戳 = os.time()
	if 当前时间戳 - tonumber(Timestamp:sub(1 , 10)) >= 3600 then
		--当前本地时间,和服务器登录返回来的时间 如果大于3600秒则判定他失败,8成是破解的,但是也会有模拟器时间不准的情况,自己取舍要不要这个判断
		return false
	end
	local 本地Sign = 卡密..Token..卡密密钥..卡密UUID..设备信息..Timestamp
	if MD5(本地Sign) == Sign then
		return true
	else
		return false
	end
end

function 卡密心跳(卡密 , 卡密登录成功的Token)
	卡密 = tostring(卡密)
	卡密 = 卡密:gsub("[%c%p]" , "") --去掉不可见字符和标点符号
	local 设备信息 = DDMControl.卡密_读取设备信息() --以后都使用这个,云控和卡密都使用这个获取设备号
	local 时间戳 = os.time()
	local Sign = MD5(卡密..卡密登录成功的Token..卡密密钥..卡密UUID..设备信息..时间戳)
	local postDta = "Sign=%s&CDKEY=%s&CDKEYDeviceInfo=%s&ProjectUUID=%s&Token=%s&Timestamp=%s"
	postDta = string.format(postDta , Sign , tostring(卡密) , tostring(设备信息) , tostring(卡密UUID) , tostring(卡密登录成功的Token) , tostring(时间戳))
	local 心跳结果 = DDMControl.卡密_卡密心跳V3(卡密登录端口 , postDta , 服务器校验回调)
	print(心跳结果)
	if not 校验通过 then
		print("校验未通过")
		卡密心跳失败次数 = 卡密心跳失败次数 + 1
		if 卡密心跳失败次数 >= 30 then --连续心跳失败30次(每次x秒,看你自己的心跳函数设置了多久),停止运行,有时候网络不好或者免费的服务器暂时维护一会或者网络波动,需要容错
			if 刷新服务器维护状态() then
				print("检测到服务器正在维护,重置心跳失败次数并继续运行")
				卡密心跳失败次数 = 0
				return
			end
			setTimer(exitScript , 1)
		end
		return
	end
	if 心跳结果.code == 1 then
		local 卡密心跳检验结果 = 卡密心跳结果校验(心跳结果.Sign , 心跳结果.Timestamp , 卡密 , 卡密登录成功的Token , 卡密UUID , 卡密密钥 , 设备信息)
		if 卡密心跳检验结果 then
			print("心跳成功")
			卡密心跳失败次数 = 0
		else
			print("心跳校验失败")
			toast("心跳校验失败" , 0 , 0 , 12)
			--setTimer(exitScript , 1) --线程中无法直接停止脚本,需要使用setTimer
		end
		
	elseif 心跳结果.code == - 5 then
		print("请重新登录,一般是卡密被禁用,删除,设备被解绑!")
		setTimer(exitScript , 1)
	elseif 心跳结果.code == - 8 then
		print("卡密到期")
		setTimer(exitScript , 1)
	elseif 心跳结果.code == - 9999 then
		print("心跳失败,网络错误!")
		卡密心跳失败次数 = 卡密心跳失败次数 + 1
		if 卡密心跳失败次数 >= 30 then --连续心跳失败30次(每次x秒,看你自己的心跳函数设置了多久),停止运行,有时候网络不好或者免费的服务器暂时维护一会或者网络波动,需要容错
			if 刷新服务器维护状态() then
				print("检测到服务器正在维护,重置心跳失败次数并继续运行")
				卡密心跳失败次数 = 0
				return
			end
			--setTimer(exitScript , 1)
		end
	elseif 心跳结果.code == - 11 then
		print("未知错误!" , msg.msg)
		toast("错误原因:"..msg.msg , 0 , 0 , 12)
	elseif 心跳结果.code == - 6666 then
		print("有人尝试破解卡密系统!" , msg.cdkey)
		setTimer(exitScript , 1)
	else
		print("未知错误!" , msg.msg)
		toast("错误原因:"..msg.msg , 0 , 0 , 12)
		setTimer(exitScript , 1)
	end
end

卡密心跳线程停止 = false
卡密登录成功的Token = ""

function 启动卡密心跳线程(卡密 , 卡密登录成功的Token)
	local 卡密心跳间隔 = 60
	local 卡密登录恢复检测间隔 = 6 * 60 * 60
	local 当前Token = 卡密登录成功的Token
	local 下次服务器恢复检测时间 = 0
	print("========== 启动卡密心跳线程 ==========")
	if 当前Token == nil or 当前Token == "" then
		print("心跳线程模式: 维护态恢复检测")
	else
		print("心跳线程模式: 正常心跳")
	end
	print("心跳线程参数: 卡密=" .. tostring(卡密) .. " / token=" .. tostring(卡密登录成功的Token))
	local function 安全调用全局函数(函数名 , ...)
		local 函数 = rawget(_G , 函数名)
		if type(函数) ~= "function" then
			print(函数名 .. "未加载,跳过")
			return false
		end
		local 成功 , 错误 = pcall(函数 , ...)
		if not 成功 then
			print(函数名 .. "异常:" , tostring(错误))
			return false
		end
		return true
	end
	local OnScriptExitFunc = function (error , exitcode)
		
		print("=== 脚本停止回调触发 ===")
		
		-- 停止卡密心跳线程
		卡密心跳线程停止 = true
	 
		setDpiToRealy()
		
		if error then
			
			显示('脚本异常结束如果悬浮窗还存在,联系作者修复')
			发送喵提醒_自定义('脚本异常结束如果悬浮窗还存在,联系作者修复')
			sleep(2000)
		else
			if exitcode == 1 then
				print("手动停止")
			elseif exitcode == 2 then
				print("脚本正常结束")
			elseif exitcode == 0 then
				print("脚本正常结束（主线程结束）")
			else
				print("脚本正常结束")
			end
		end
		
	end
	setStopCallBack(OnScriptExitFunc)
	
	local RunFunc = function ()
		print("========== 卡密心跳线程已进入循环 ==========")
		while true and 卡密心跳线程停止 == false do
			if 服务器维护 then
				print("心跳线程分支: 服务器维护")
				print(string.format(
				"维护检测状态: 当前=%s, 下次=%s" ,
				os.date("%H:%M:%S") ,
				下次服务器恢复检测时间 == 0 and "未设置" or os.date("%H:%M:%S" , 下次服务器恢复检测时间)
				))
				if 下次服务器恢复检测时间 == 0 then
					下次服务器恢复检测时间 = os.time() + 卡密登录恢复检测间隔
					print("检测到服务器正在维护,暂停卡密心跳,6小时后重新检测")
					local 到期结果 , 到期数据 = 本地卡密是否到期()
					if 到期结果 == true then
						print("本地检测到卡密已到期,停止脚本")
						if 到期数据 then
							print("到期时间:" , 到期数据.到期时间)
							print("更新时间:" , 到期数据.更新时间)
						end
						setTimer(exitScript , 1)
						return
					elseif 到期结果 == nil then
						打印本地卡密到期信息()
					end
				end
				if os.time() >= 下次服务器恢复检测时间 then
					print("开始检测服务器是否恢复")
					print("准备调用刷新服务器维护状态()")
					local 恢复检测结果 = 刷新服务器维护状态()
					print("恢复检测结果:" , tostring(恢复检测结果))
					print("刷新服务器维护状态() 调用结束")
					if not 恢复检测结果 then
						print("服务器已恢复,先重新初始化叮当猫")
						初始化叮当猫()
						print("重新初始化完成,开始重新进行卡密登录")
						local 重新登录成功 = 执行卡密登录(卡密 , true)
						if 重新登录成功 then
							当前Token = 卡密登录成功的Token
							下次服务器恢复检测时间 = 0
							print("卡密重新登录成功,恢复心跳检测")
						else
							print("卡密重新登录失败,继续保持维护态检测")
							下次服务器恢复检测时间 = os.time() + 卡密登录恢复检测间隔
						end
					else
						print("服务器仍在维护,下次6小时后继续检测")
						local 到期结果 , 到期数据 = 本地卡密是否到期()
						if 到期结果 == true then
							print("本地检测到卡密已到期,停止脚本")
							if 到期数据 then
								print("到期时间:" , 到期数据.到期时间)
								print("更新时间:" , 到期数据.更新时间)
							end
							setTimer(exitScript , 1)
							return
						elseif 到期结果 == nil then
							打印本地卡密到期信息()
						end
						下次服务器恢复检测时间 = os.time() + 卡密登录恢复检测间隔
					end
				end
			else
				if 当前Token == nil or 当前Token == "" then
					print("心跳线程分支: 当前Token为空,跳过正常心跳并继续维护态恢复检测")
					服务器维护 = true
					下次服务器恢复检测时间 = 0
				else
					--print("心跳线程分支: 正常心跳")
					校验通过 = false
					--print("开始执行卡密心跳")
					卡密心跳(卡密 , 当前Token)
				end
			end
			
			安全调用全局函数("执行重启云机_时间")
			
			安全调用全局函数("同步角色运行时间")
			
			sleep(1000 * 卡密心跳间隔)
			
		end
	end
	print("========== 开始创建卡密心跳线程 ==========")
	beginThread(RunFunc)
end

执行卡密登录 = function(卡密 , 不启动心跳)
	if 服务器维护 then
		print("服务器维护中,跳过卡密登录")
		保存卡密占位信息(卡密)
		print("服务器维护中,启动卡密心跳线程，仅做恢复检测")
		启动卡密心跳线程(卡密 , "")
		local 到期结果 , 到期数据 = 本地卡密是否到期()
		if 到期结果 == true then
			print("本地检测到卡密已到期,停止脚本")
			if 到期数据 then
				print("到期时间:" , 到期数据.到期时间)
				print("更新时间:" , 到期数据.更新时间)
			end
			setTimer(exitScript , 1)
			exitScript()
			return false
		end
		打印本地卡密到期信息()
		return false
	end
	卡密 = tostring(卡密)
	卡密 = 卡密:gsub("[%c%p]" , "") --去掉不可见字符和标点符号
	
	local 设备信息 = DDMControl.卡密_读取设备信息() --以后都使用这个,云控和卡密都使用这个获取设备号
	local 时间戳 = os.time()
	local 登录数据 = "Sign="..MD5(卡密..卡密密钥..卡密UUID..设备信息..时间戳).."&Timestamp="..时间戳.."&CDKEY="..卡密.."&CDKEYDeviceInfo="..设备信息.."&ProjectUUID="..卡密UUID
	local 登录结果 = DDMControl.卡密_卡密登录V3(卡密登录端口 , 登录数据 , 卡密 , 服务器校验回调)
	
	if not 校验通过 then
		print("校验未通过")
		exitScript()
	end
	print(登录结果)
	if 登录结果.code == 0 then
		print("卡密被禁用")
		toast("卡密被禁用" , 0 , 0 , 12)
		sleep(2000)
		exitScript()
		return false
	elseif 登录结果.code == - 2 then
		print("服务器校验失败!")
		toast("服务器校验失败!" , 0 , 0 , 12)
		sleep(2000)
		exitScript()
		return false
	elseif 登录结果.code == - 1 then
		print("网络错误,请检查网络!")
		toast("网络错误,请检查网络!" , 0 , 0 , 12)
		sleep(2000)
		exitScript()
		return false
	elseif 登录结果.code == 1 then
		local 到期时间 = 登录结果.endTime
		local 登录成功提示 = string.format("登录成功,到期时间:%s" , 到期时间)
		local 校验结果 = 卡密登录结果校验(登录结果.Sign , 登录结果.Timestamp , 卡密 , 登录结果.Token , 卡密UUID , 卡密密钥 , 设备信息)
		print(校验结果)
		if 校验结果 then
			
			print("卡密登录成功!")
			toast(登录成功提示 , 0 , 0 , 12)
			sleep(2000)
			保存卡密到期信息(卡密 , 到期时间 , 登录结果 , "已获取到期时间")
			卡密登录成功的Token = 登录结果.Token
			if not 不启动心跳 then
				启动卡密心跳线程(卡密 , 登录结果.Token)
			end
			return true
		else
			print("数据校验失败,脚本停止运行")
			toast("数据校验失败,脚本停止运行" , 0 , 0 , 12)
			sleep(2000)
			exitScript()
			return false
		end
		
	elseif 登录结果.code == - 9 then
		print("卡密授权窗口达到上限,登录失败!")
		toast("卡密授权窗口达到上限,登录失败!" , 0 , 0 , 12)
		sleep(2000)
		exitScript()
		return false
	elseif 登录结果.code == - 7 then
		print("卡密过期!")
		toast("卡密过期!" , 0 , 0 , 12)
		sleep(2000)
		exitScript()
		return false
	else
		print("未知错误!" , 登录结果.msg)
		toast(登录结果.msg , 0 , 0 , 12)
		sleep(2000)
		exitScript()
		return false
	end
	
end

function 卡密登录(卡密)
	return 执行卡密登录(卡密 , false)
end

----------------------------------------云统计--------------------------------
function 同步云端勾选状态()
	
	local 复选框值 = 读取配置值("多选框_同步泰拉数量")
	local 云端勾选 = ui同步(复选框值)
	return 云端勾选
end

function 同步云端功能()
	if 同步云端勾选状态() then
		print('已勾选同步云端')
		--同步泰拉数量至后台()
		return true
	end
	return false
end
local 云端登录成功 = false
项目名称 = '猫仙人'
function 开启云端()
	
	for i = 1 , 10 do
		账号_云端 = 读取配置值("输入框_后台账号")
		
		密码_云端 = 读取配置值("输入框_后台密码")
		设备名称_云端 = 读取配置值 ("输入框_设备名称")
		
		绑定结果 , 错误信息 = DDMControl.绑定用户(账号_云端 , 云控UUID , 卡密UUID)
		print(绑定结果 , 错误信息)
		登录结果 = DDMControl.脚本用户登录(账号_云端 , 密码_云端)
		Token = ''
		项目名称 = '猫仙人'
		
		字符串数据_云端 = DDMControl.用户云数据_创建字符串数据
		数字数据_云端 = DDMControl.用户云数据_创建数字数据
		数组数据_云端 = DDMControl.用户云数据_创建数组数据
		图片数据_云端 = DDMControl.用户云数据_创建图片数据
		超链数据_云端 = DDMControl.用户云数据_创建超链数据
		日期时间数据_云端 = DDMControl.用户云数据_创建日期时间数据
		
		if 登录结果.code == 1 then
			Token = 登录结果.token
			print('云端登录成功'..Token)
			云端登录成功 = true
			toast("云端登录成功" , 0 , 0 , 20)
			return true
		else
			云端登录成功 = false
			
			toast("云端登录失败登录失败本次运行不统计泰拉数量" , 0 , 0 , 20)
			sleep(1000)
			--exitScript()
		end
		
	end
	
	toast("云端登录失败本次不统计泰拉数量" , 0 , 0 , 20)
	return false
end

function 用户云数据插入一条数据()
	
	local 插入的数据 = {}
	插入的数据.设备名称 = 字符串数据_云端(设备名称_云端)
	插入的数据.区号 = 字符串数据_云端(区域标识)
	插入的数据.泰拉 = 数字数据_云端(当前泰拉数量)
	local 插入结果 = DDMControl.用户云数据_插入一条数据(Token , 项目名称 , 插入的数据)
	print(插入结果)
end

function 用户云数据更新数据存在则更新(Token , i)
	if not 云端登录成功 then
		显示('云端登录失败不统计数据')
		toast('云端登录失败不统计泰拉数据' , 0 , 0 , 20)
		sleep(1000)
	else
		--local 角色序号 = tonumber(角色序号)
		local 更新条件 = {}
		更新条件.设备名称 = 字符串数据_云端(设备名称_云端)
		更新条件.区号 = 字符串数据_云端(区域标识)
		--更新条件.角色 = 数字数据_云端(角色序号)
		
		local 更新数据 = {}
		更新数据.设备名称 = 字符串数据_云端(设备名称_云端)
		更新数据.区号 = 字符串数据_云端(区域标识)
		
		if 当前泰拉数量 ~= nil then
			更新数据.泰拉 = 数字数据_云端(当前泰拉数量)
		end
		--[===[更新数据.角色 = 数字数据_云端(角色序号)
		if 当前角色抗魔值 ~= nil then
		print('更新当前角色:'..角色序号..'抗魔值:'..当前角色抗魔值)
		更新数据.抗魔值 = 数字数据_云端(当前角色抗魔值)
		end
		当前角色抗魔值 = nil]===]
		local 不存在则插入 = true
		local 更新结果 = DDMControl.用户云数据_更新数据(Token , 项目名称 , 更新数据 , 更新条件 , 不存在则插入)
		print(更新结果)
	end
	
end

------------------------云ui功能------------------------------
function 打印table(t , indent)
	indent = indent or ""
	if type(t) ~= "table" then
		print(indent .. tostring(t))
		return
	end
	for k , v in pairs(t) do
		if type(v) == "table" then
			print(indent .. tostring(k) .. " = {")
			打印table(v , indent .. "    ")
			print(indent .. "}")
		else
			print(indent .. tostring(k) .. " = " .. tostring(v))
		end
	end
end

function 云配置示例()
	
	local 配置密码 = "361039766"
	local 配置名称 = "配置1"
	local 新增配置内容 = "这是首次创建的UI配置数据"
	local 保存配置内容 = "这是修改后保存的UI配置数据"
	
	print("========== 1. 新增云配置 ==========")
	local 新增结果 = DDMControl.配置_新增配置(云UIUUID , 配置密码 , 配置名称 , 新增配置内容)
	print(新增结果)
	
	if 新增结果.code == 2 then
		print("配置已存在,更新配置")
		print("========== 2. 保存云配置 ==========")
		local 保存结果 = DDMControl.配置_保存配置(云UIUUID , 配置密码 , 配置名称 , 保存配置内容)
		if 保存结果.code == 1 then
			print('跟新成功')
		else
			print('更新配置时网络错误')
		end
	elseif 新增结果.code == 1 then
		print('上传配置成功')
	else
		print('网络拥堵稍后重试')
	end
	
	print("========== 3. 获取单个云配置 ==========")
	local 获取结果 = DDMControl.配置_获取配置(云UIUUID , 配置密码 , 配置名称)
	打印table(获取结果)
	if type(获取结果) == "table" and 获取结果.code == 1 and type(获取结果.data) == "table" then
		print("读取到的配置内容：" .. tostring(获取结果.data.配置信息))
		print("配置名称：" .. tostring(获取结果.data.配置名称))
		print("更新时间：" .. tostring(获取结果.data.更新时间))
	end
	
	print("========== 4. 获取配置列表 ==========")
	local 列表结果 = DDMControl.配置_获取配置列表(云UIUUID , 配置密码)
	打印table(列表结果)
	
	if type(列表结果) == "table" and 列表结果.code == 1 and type(列表结果.list) == "table" then
		for i , v in ipairs(列表结果.list) do
			print("第" .. tostring(i) .. "个配置名称：" .. tostring(v.配置名称))
			print("第" .. tostring(i) .. "个更新时间：" .. tostring(v.更新时间))
		end
	end
end

--云配置示例()

--DDMControl.云控_连接云控系统()

--[===[function 功能代码()
while true do
toast("叮当猫脚本系统免费使用!" , 0 , 0 , 12)
sleep(1000)
end
end
function 脚本开始函数()

DDMControl.云控_连接云控系统(nil , 5 , nil , 3000)
---下面写你自己的代码
功能代码()
end
--这样运行的话,脚本异常停止的时候,可以在后台看到停止的原因
DDMControl.脚本_异常捕获运行(脚本开始函数 , 2 , nil , "")]===]
