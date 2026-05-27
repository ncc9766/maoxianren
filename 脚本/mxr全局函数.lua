
math.randomseed(os.time())

-- 角色序号变量
角色序号 = ''
-- 设置角色序号的函数
function 设置当前角色序号(序号)
	角色序号 = 序号 or 1
	--显示("已切换到角色" .. 角色序号)
end

-- 当前区号和配置变量
当前区号 = ''
当前配置名称 = ''
区配置信息 = ""
-- 设置当前区号和配置的函数
function 设置当前区号和配置(区号 , 配置名称)
	当前区号 = 区号 or ''
	当前配置名称 = 配置名称 or ''
end

----------------------------------------------------------------------------------HUD_显示
-- 输出当前调用堆栈信息（便于定位函数调用链）
function 输出堆栈信息(消息 , 起始层级)
	local 提示 = 消息 or "堆栈信息"
	local 层级 = tonumber(起始层级) or 2 -- 默认跳过当前函数与调用者
	if debug and debug.traceback then
		print(tostring(提示))
		print(debug.traceback("" , 层级))
	else
		print(tostring(提示) .. "（debug.traceback不可用）")
	end
end

local HUD_id1 = nil
local HUD_id2 = nil

function 显示(内容)
	-- 在控制台打印（带调用来源：文件名 + 行号）
	
	local 调用信息 = ""
	local info = debug and debug.getinfo and debug.getinfo(2 , "Sl")
	if info and info.short_src and info.currentline then
		local 文件名 = info.short_src:match("([^/\\]+)$") or info.short_src
		文件名 = 文件名:gsub("%.lua$" , "")
		调用信息 = string.format("[%s:%d] " , 文件名 , info.currentline)
	end
	print(tostring(内容)..'---'..调用信息)
	
	-- 构建显示内容，包含区号和配置信息
	local 区配置信息 = ""
	if 当前区号 ~= '' and 当前区号 ~= nil then
		if 当前配置名称 ~= '' and 当前配置名称 ~= nil then
			区配置信息 = "[" .. 当前区号 .. "-" .. 当前配置名称 .. "] "
		else
			区配置信息 = "[" .. 当前区号 .. "] "
		end
	end
	local 显示内容 = "版本v."..版本号.."[角色" .. 角色序号 .. "] " .. 区配置信息 .. 内容
	-- 如果HUD已经被销毁，重新创建
	if not HUD_id1 then
		HUD_id1 = createHUD()
	end
	
	showHUD(HUD_id1 , 显示内容 , 8 , "0xFFFFFFFF" , "0x80000000" , 0 , 0 , 1270 , 0 , 0)
	--toast(显示内容 , 5 , 1200 , 9)
end

function 显示_HUD(内容)
	
	print(内容)
	-- 构建显示内容，包含区号和配置信息
	local 区配置信息 = ""
	if 当前区号 ~= '' and 当前区号 ~= nil then
		if 当前配置名称 ~= '' and 当前配置名称 ~= nil then
			区配置信息 = "[" .. 当前区号 .. "-" .. 当前配置名称 .. "] "
		else
			区配置信息 = "[" .. 当前区号 .. "] "
		end
	end
	local 显示内容 = "版本v."..版本号.."[角色" .. 角色序号 .. "] " .. 区配置信息 .. 内容
	
	-- 如果HUD已经被销毁，重新创建
	if not HUD_id2 then
		HUD_id2 = createHUD()
	end
	
	-- FF(不透明) C0(25%透明度) 80(50%透明度) 40(75%透明度)
	showHUD(HUD_id2 , 显示内容 , 10 , "0xFFFFFFFF" , "0x80000000" , 0 , 0 , 1270 , 0 , 0)
end

function 关闭_HUD()
	if HUD_id1 then
		hideHUD(HUD_id1) --隐藏并销毁HUD
		HUD_id1 = nil --标记为已销毁
	end
	if HUD_id2 then
		hideHUD(HUD_id2) --隐藏并销毁HUD
		HUD_id2 = nil --标记为已销毁
	end
end

-----------------------------------------------------------------------------------------------------检测游戏状态相关
function 判断_更新_下载更新()
	--[===[setDict(0 , "确认.txt")
	useDict(0)
	
	local ret , x , y = findStr(907 , 448 , 967 , 480 , "更新" , "4e5a99-202020" , 0.85 , 10 , 10)
	if x ~= - 1 then
	显示('检测到游戏大版本更新')
	tap(938 , 463)
	
	sleep(3000)
	return true
	
	end
	--地下城435,3,854,710
	local ret1 , x1 , y1 = findStr(435,3,854,710 , "更新" , "4e5a99-202020" , 0.85 , 10 , 10)
	if x1 ~= - 1 then
	显示('检测到游戏大版本更新')
	tap(x1 , y1)
	
	sleep(3000)
	return true
	
	end]===]
	
	return false
end
地下城 = 'com.tencent.tmgp.dnf'
--地下城 = 'com.tencent.tmgp.dnftest'

function 打开(apk)
	local isRunning = appIsRunning(apk)
	local isFront = appIsFront(apk)
	
	if not isRunning then
		
		runApp(apk)
		显示('正在启动游戏...')
		sleep(2000)
		上次选择角色时间 = os.time()
		return true
		
	elseif isRunning and not isFront then
		-- 应用已启动但在后台，拉起并等待2000毫秒
		if not 判断_更新_下载更新() then
			runApp(apk)
			显示(' 切换到前台...')
			sleep(2000)
			
		end
		return true
	else
		-- 应用已启动且在前台，无需操作
		print('应用已在前台运行')
		return false
	end
end

function 关闭(apk)
	显示('关闭游戏')
	stopApp(apk)
	
	随机延时(500 , 800)
	上次选择角色时间 = os.time()
	--打开(apk)
end
function 首次打开(apk)
	local isRunning = appIsRunning(apk)
	local isFront = appIsFront(apk)
	
	if not isRunning then
		
		runApp(apk)
		显示('正在启动游戏...')
		sleep(2000)
		return true
		
	elseif isRunning and not isFront then
		-- 应用已启动但在后台，拉起并等待2000毫秒
		runApp(apk)
		显示(' 切换到前台...')
		sleep(1000)
		return true
	else
		-- 应用已启动且在前台，无需操作
		print('应用已在前台运行')
		return false
	end
	
end
首次打开(地下城)

-- 新增：仅检测游戏是否闪退，不执行任何操作（保持向后兼容）
function 检测游戏是否闪退()
	
	if appIsRunning(地下城 ) == false or 判断_选择角色界面() or 判断_开始游戏界面() or 判断_更新_下载更新() then
		
		return true -- 已闪退
	end
	return false -- 仍在运行
end
function 判断_闪退确认提示()
	
	local x , y = findMultiColor(659 , 322 , 741 , 345 , "c5c2c5-202020" , "28|5|ffffff-202020|20|10|ffffff-202020|18|12|ffffff-202020|21|14|ffffff-202020|31|7|ffffff-202020|22|10|ffffff-202020|-8|11|adb2ad-202020|-7|1|bdbab5-202020|-8|1|c5c2bd-202020|-14|4|ffffff-202020|-39|0|f7fbf7-202020|-29|5|ffffff-202020|-31|0|ffffff-202020|-31|-2|ffffff-202020" , 0 , 0.9)
	local x1 , y1 = findMultiColor(517 , 429 , 562 , 451 , "d69a6b-202020" , "-6|-3|b56d31-202020|27|-9|bd713a-202020|-8|9|efc6a4-202020|-15|6|f7d7bd-202020|8|-11|efc6a4-202020|-12|-2|bd6d29-202020|-7|-11|ffdfc5-202020|8|6|ce864a-202020|-15|-11|ffdfc5-202020|10|-5|e6be9c-202020|16|-3|f7d2b5-202020|24|7|efc69c-202020|16|6|f7d2b5-202020|23|0|ce965a-202020|-3|-9|ffdfc5-202020|1|-6|a44d08-202020|7|-1|ad5108-202020|12|-1|ad5108-202020|20|-3|a45100-202020|20|-5|ffdfc5-202020|20|-9|ffdfc5-202020|15|-10|ffdfbd-202020" , 0 , 0.9)
	local x2 , y2 = findMultiColor(612 , 255 , 667 , 281 , "f7e7b5-202020" , "-7|-13|ffefb5-202020|21|0|8c816b-202020|-2|10|ada67b-202020|15|-1|ada27b-202020|-7|-4|ffefbd-202020|5|8|ffebb5-202020|15|5|a4a27b-202020|-14|-13|b5aa84-202020|-23|-1|efe3ad-202020|7|2|ffefbd-202020|-6|5|ffefbd-202020|13|-13|e6dba4-202020|-23|10|e6dbad-202020|6|-13|6b6552-202020" , 0 , 0.9)
	if x ~= - 1 and y1 ~= - 1 and x2 ~= - 1 then
		touchUp(0)
		显示('闪退确认')
		随机延时(200 , 400)
		
		return true
	end
	
	local x3 , y3 = findMultiColor(583 , 256 , 693 , 287 , "736d52-202020" , "19|4|736952-202020|47|6|d6ca9c-202020|-12|-14|ffefb5-202020|-35|7|948e6b-202020|10|-3|a49a73-202020|-50|-7|8c8163-202020|15|-13|ffefb5-202020|26|6|efe3ad-202020|29|-7|efe3ad-202020|-12|0|cec294-202020|-28|-6|efe3ad-202020|-27|1|736952-202020|-24|8|84795a-202020|4|5|efe3ad-202020|-42|-14|736952-202020|40|5|b5a684-202020|3|-13|736d4a-202020|35|-14|a49a73-202020|43|-2|7b6d52-202020" , 0 , 0.9)
	local x4 , y4 = findMultiColor(521 , 420 , 576 , 452 , "bd6929-202020" , "7|-7|ce8e63-202020|-9|-6|ffdfc5-202020|-14|8|bd6929-202020|20|12|ffd7bd-202020|17|5|d69663-202020|6|11|c57d42-202020|20|-5|c58a5a-202020|-10|14|f7caad-202020|12|10|ffd7bd-202020|-8|0|bd6d31-202020|23|5|d69663-202020|-8|7|bd7129-202020|-2|10|f7cead-202020|14|-6|b56931-202020|8|5|b56d29-202020|12|0|ffd7bd-202020|-17|-6|ffdfc5-202020" , 0 , 0.9)
	if x3 ~= - 1 and y4 ~= - 1 then
		显示('游戏结束取消')
		随机延时(200 , 400)
		
		return true
	end
	
	return false
end

-- 检测游戏闪退并重启对应角色选择的函数
local 重启插件时间 = os.time()
function 检测并重启游戏_角色功能版()
	
	local 角色序号 = (角色序号 ~= '' and 角色序号) or 1
	
	print(角色序号)
	
	--显示('检测并重启游戏_角色功能版:准备重新启动游戏')
	随机延时(500 , 800)
	if os.time() - 重启插件时间 > 7200 then
		重启插件()
		重启插件时间 = os.time()
	else
		打开(地下城)
	end
	
	local 发行界面时间 = os.time()
	local 重启计时器 = os.time()
	while true do
		print('重启游戏中...')
		if os.time() - 重启计时器 > 180 then
			
			发送喵提醒_自定义('重启游戏超过3分钟未成功及时上线查看')
			关闭(地下城)
			重启计时器 = os.time()
			发行界面时间 = os.time()
		end
		随机延时(800 , 1000)
		
		if appIsFront(地下城) then
			显示('游戏重启成功，等待界面加载...')
			
			if 入口_确认(true) then
				print('重启检测到确认')
				随机延时(3000 , 4000)
				-- 点击_开始游戏()
				发行界面时间 = os.time()
			elseif 判断_选择角色界面() and 角色序号 then
				print('重启检测到选择角色界面')
				显示("选择角色：" .. 角色序号)
				重启计时器 = os.time()
				local 角色选择函数表 = {
					角色1 , 角色2 , 角色3 , 角色4 , 角色5 ,
					角色6 , 角色7 , 角色8 , 角色9 , 角色10 ,
					角色11 , 角色12 , 角色13 , 角色14 , 角色15 ,
					角色16 , 角色17 , 角色18 , 角色19 , 角色20 ,
				}
				local index = tonumber(角色序号)
				
				if index and 角色选择函数表[index] then
					角色选择函数表[index]()
					
					点击_开始游戏()
					显示("成功调用角色选择函数，等待进入城镇...")
				else
					print('调用角色函数失败.......')
				end
				重启计时器 = os.time()
				发行界面时间 = os.time()
			elseif 判断_城镇界面() then
				
				重启计时器 = os.time()
				return
			elseif 判断_副本中()then
				
				自动刷图()
				发行界面时间 = os.time()
				重启计时器 = os.time()
			elseif 判断_开始游戏界面() then
				print('重启检测到开始游戏界面')
				按下点击({595 , 503 , 691 , 530})
				发行界面时间 = os.time()
				重启计时器 = os.time()
			elseif 判断_启动界面_发行() then
				
				if os.time() - 发行界面时间 > 15 then
					--关闭(游戏)
					keyPress(3)
					发行界面时间 = os.time()
					
				end
				
			else
				if 清屏(true) then
					print('重启检测到清屏')
				end
				if 打开(地下城) then
					随机延时(2000 , 3000)
					发行界面时间 = os.time()
					重启计时器 = os.time()
					
				end
				
			end
			
		else
			
			打开(地下城)
		end
		
	end
	
end

游戏已闪退 = false
function 快速检测游戏状态()
	
	if 游戏已闪退 then
		return false
	end
	if 检测游戏是否闪退() then
		显示('快速检测游戏状态:检测到游戏闪退!')
		--重启插件()
		游戏已闪退 = true
		检测并重启游戏_角色功能版()
		角色运行超时重启 = false
		
		return true
	end
	return false
end

-- 游戏闪退检测多线程相关变量
游戏闪退检测线程停止 = false
游戏已闪退 = false
闪退检测间隔 = 5 -- 每5秒检测一次

-- 启动游戏闪退检测多线程
function 启动游戏闪退检测线程()
	
	local OnScriptExitFunc = function ()
		游戏闪退检测线程停止 = true
	end
	setStopCallBack(OnScriptExitFunc)
	
	local RunFunc = function ()
		while true and 游戏闪退检测线程停止 == false do
			-- 直接调用快速检测游戏状态函数，它已经包含了检测和重启逻辑
			local 检测结果 = 快速检测游戏状态(角色序号)
			
			if 检测结果 then
				-- 游戏闪退并已处理重启
				游戏已闪退 = true
				print("多线程检测：游戏闪退已处理")
			else
				-- 游戏正常运行，重置闪退状态
				if 游戏已闪退 then
					游戏已闪退 = false
					print("多线程检测：游戏已恢复正常")
				end
			end
			
			随机延时(8000 , 10000)
		end
	end
	beginThread(RunFunc)
	print("游戏闪退检测多线程已启动，检测间隔: " .. 闪退检测间隔 .. "秒")
end

-- 停止游戏闪退检测多线程
function 停止游戏闪退检测线程()
	游戏闪退检测线程停止 = true
	print("游戏闪退检测多线程已停止")
end

-- 获取游戏闪退状态（供其他函数调用）
function 检测到游戏已闪退_多线程()
	return 游戏已闪退
end

-- 重置游戏闪退状态
function 重置游戏闪退状态()
	游戏已闪退 = false
	print("游戏闪退状态已重置")
end
-----------------------------------------------------------------------------------------------

上次选择角色时间 = 0
function 检查并重启游戏_超两小时()
	-- 检查是否勾选了停止微信功能
	if not 同步两小时重启游戏功能() then
		
		-- 如果未勾选,重置时间戳并返回
		上次选择角色时间 = 0
		return
	end
	
	local 当前时间 = os.time()
	local 时间差 = 当前时间 - 上次选择角色时间
	local 两小时秒数 = 2 * 60 * 60 -- 2小时 = 7200秒
	
	if 上次选择角色时间 > 0 and 时间差 > 两小时秒数 then
		显示(string.format('距离上次重启游戏已过 %.2f 小时，' , 时间差 / 3600))
		发送喵提醒_自定义('运行时间大于两小时重启游戏中...')
		关闭(地下城)
		stopApp('com.wukong.nb')
		
		随机延时(400 , 500)
		重启插件()
		--快速检测游戏状态()
		上次选择角色时间 = os.time()
		重启插件时间 = os.time()
		print('已重启游戏，重新开始计时')
	elseif 上次选择角色时间 == 0 then
		
		上次选择角色时间 = 当前时间
		print('开始计时')
	end
end

function 强制重启游戏 ()
	
	关闭(地下城)
	随机延时(1000 , 2000) -- 等待游戏启动完成
	显示('正在强制重启游戏...')
	发送喵提醒_自定义('正在强制重启游戏...')
	
	检测并重启游戏_角色功能版()
	
end

function 返回(按键码)
	
	keyPress(按键码)
	--返回(4)
end

function 随机数(最小 , 最大)
	-- 生成 [0,1) 之间的小数，再映射到 [最小, 最大) 范围
	local r = 最小 + math.random() * (最大 - 最小)
	return r
end

local id = createHUD()
--坐标随机点击and随机时间
function 点击(x , y )
	x = x + 随机数( - 5 , 5)
	y = y + 随机数( - 5 , 5)
	--显示点击的地方
	--showHUD(id , "" , 12 , "0xffff0000" , "0xffff0000" , 0 , x , y , 15 , 15)
	tap(x , y)
	
	--点击(x,y,时间)
end
-- 多点区域随机点击：在多个区域中随机选择一个区域进行点击
function 多区域随机点击(...)
	local 参数 = {...}
	local 区域列表 = {}
	local 点击次数 = {1 , 1} -- 默认点击1次
	local 点击间隔 = {300 , 600} -- 默认点击间隔
	
	-- 解析参数
	local i = 1
	while i <= #参数 do
		if type(参数[i]) == "table" and #参数[i] >= 4 then
			-- 这是一个区域
			table.insert(区域列表 , 参数[i])
		elseif type(参数[i]) == "table" and #参数[i] == 2 then
			-- 这是点击次数或间隔时间
			if 点击次数[1] == 1 and 点击次数[2] == 1 then
				点击次数 = 参数[i]
			else
				点击间隔 = 参数[i]
			end
		end
		i = i + 1
	end
	
	-- 检查参数
	if #区域列表 == 0 then
		显示("错误: 区域列表为空")
		return nil
	end
	
	-- 随机选择一个区域
	local 随机区域索引 = math.random(1 , #区域列表)
	local 选中区域 = 区域列表[随机区域索引]
	
	-- 确保区域格式正确
	if #选中区域 < 4 then
		显示("错误: 区域格式不正确，需要四个坐标值")
		return nil
	end
	
	-- 随机决定点击次数
	local 实际点击次数 = math.random(点击次数[1] , 点击次数[2])
	
	local 最终X , 最终Y
	
	-- 执行多次点击
	for i = 1 , 实际点击次数 do
		-- 直接使用按下点击函数
		local 结果 = 按下点击(选中区域)
		最终X , 最终Y = 结果.x , 结果.y
		
		-- 如果不是最后一次点击，则等待间隔时间
		if i < 实际点击次数 then
			随机延时(点击间隔[1] , 点击间隔[2])
		end
	end
	
	return 最终X , 最终Y
	
	--多区域随机点击({180,9,542,82},{756,13,876,85},{1035,642,1252,707},{1,3},{200,400})
	
end

function 计算距离(x1 , y1 , x2 , y2)
	-- 设置默认值
	x1 = x1 or 0
	y1 = y1 or 0
	x2 = x2 or 0
	y2 = y2 or 0
	
	return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

-- 安全的随机数函数，确保参数为整数
function rnd(min , max)
	-- 确保参数是数字
	min = tonumber(min) or 0
	max = tonumber(max) or min
	
	-- 确保min <= max
	if min > max then
		min , max = max , min
	end
	
	-- 如果是相同的值，直接返回
	if min == max then
		return min
	end
	
	-- 转换为整数（向下取整）
	min = math.floor(min)
	max = math.floor(max)
	
	-- 再次检查值相等的情况
	if min == max then
		return min
	end
	
	-- 生成随机数
	return math.random(min , max)
end

-- 安全的随机延时函数
function 随机延时(min , max)
	-- 确保参数是数字
	min = tonumber(min) or 100
	max = tonumber(max) or min
	
	-- 确保min <= max
	if min > max then
		min , max = max , min
	end
	
	-- 转换为整数
	min = math.floor(min)
	max = math.floor(max)
	
	-- 如果值相等或min大于max，直接使用min
	local delay = min
	if min < max then
		delay = math.random(min , max)
	end
	--print("延时：" .. delay .. " 毫秒")
	-- 执行延时
	sleep(delay)
	return delay
	
end

-- 扩展的拟人防封点击函数，支持自定义按下时间
local id = createHUD()
function 按下点击(...)
	local args = {...}
	local target_x , target_y
	local info = {}
	local press_time_min , press_time_max = 50 , 150 -- 默认按下时间范围
	touchUp(0)
	随机延时(5 , 6)
	touchUp(1)
	随机延时(5 , 6)
	touchUp(2)
	-- 判断参数类型和数量
	if type(args[1]) == "table" then
		-- 场景1: 区域点击 - 按下点击({x1,y1,x2,y2})
		-- 示例: 按下点击({100, 200, 300, 400}) - 在矩形区域内随机点击
		local region = args[1]
		if #region >= 4 then
			local x1 , y1 , x2 , y2 = region[1] , region[2] , region[3] , region[4]
			-- 确保区域坐标有效
			if x2 < x1 then x1 , x2 = x2 , x1 end
			if y2 < y1 then y1 , y2 = y2 , y1 end
			
			-- 确保坐标为整数
			x1 , y1 = math.floor(x1) , math.floor(y1)
			x2 , y2 = math.floor(x2) , math.floor(y2)
			
			-- 处理单点区域
			if x1 == x2 then
				target_x = x1
			else
				target_x = math.random(x1 , x2)
			end
			
			if y1 == y2 then
				target_y = y1
			else
				target_y = math.random(y1 , y2)
			end
			
			info.mode = "区域点击"
			
			-- 场景2: 区域点击并指定按下时间 - 按下点击({x1,y1,x2,y2}, {最小按下时间, 最大按下时间})
			-- 示例: 按下点击({100, 200, 300, 400}, {300, 500}) - 在区域内随机点击，按下时间300-500毫秒
			if args[2] and type(args[2]) == "table" and #args[2] >= 2 then
				press_time_min = math.floor(args[2][1])
				press_time_max = math.floor(args[2][2])
				if press_time_min > press_time_max then
					press_time_min , press_time_max = press_time_max , press_time_min
				end
			end
		else
			print("错误: 区域表格必须包含至少4个元素")
			return nil
		end
	else
		-- 坐标点击相关场景
		local x , y = tonumber(args[1]) , tonumber(args[2])
		if not x or not y then
			print("错误: 无效的坐标值")
			return nil
		end
		
		-- 确保坐标为整数
		x , y = math.floor(x) , math.floor(y)
		
		-- 新增对X和Y轴分别设置偏移范围的支持
		local offset_x_min , offset_x_max = - 5 , 5 -- 默认X轴偏移范围
		local offset_y_min , offset_y_max = - 5 , 5 -- 默认Y轴偏移范围
		local param_index = 3 -- 从第3个参数开始检查
		
		-- 场景3: 单一整体偏移 - 按下点击(x, y, 偏移值)
		-- 示例: 按下点击(100, 200, 10) - 在坐标周围正负10像素范围内随机点击
		if args[param_index] and not args[param_index + 1] and type(args[param_index]) == "number" then
			-- 单一偏移量应用于X和Y
			local offset = math.floor(math.abs(args[param_index]))
			offset_x_min , offset_x_max = - offset , offset
			offset_y_min , offset_y_max = - offset , offset
			param_index = param_index + 1
			-- 场景4: X和Y使用相同的偏移范围 - 按下点击(x, y, 最小偏移, 最大偏移)
			-- 示例: 按下点击(100, 200, -15, 20) - X和Y偏移都在-15到20像素之间
		elseif args[param_index] and args[param_index + 1] and
			type(args[param_index]) == "number" and type(args[param_index + 1]) == "number" and
			(not args[param_index + 2] or not args[param_index + 3]) then
			-- 相同偏移范围适用于X和Y
			offset_x_min , offset_x_max = math.floor(args[param_index]) , math.floor(args[param_index + 1])
			if offset_x_min > offset_x_max then
				offset_x_min , offset_x_max = offset_x_max , offset_x_min
			end
			offset_y_min , offset_y_max = offset_x_min , offset_x_max
			param_index = param_index + 2
			-- 场景5: X和Y使用不同的偏移范围 - 按下点击(x, y, x最小偏移, x最大偏移, y最小偏移, y最大偏移)
			-- 示例: 按下点击(100, 200, -10, 20, -5, 10) - X偏移在-10到20像素间，Y偏移在-5到10像素间
		elseif args[param_index] and args[param_index + 1] and args[param_index + 2] and args[param_index + 3] and
			type(args[param_index]) == "number" and type(args[param_index + 1]) == "number" and
			type(args[param_index + 2]) == "number" and type(args[param_index + 3]) == "number" then
			-- X轴偏移范围
			offset_x_min , offset_x_max = math.floor(args[param_index]) , math.floor(args[param_index + 1])
			if offset_x_min > offset_x_max then
				offset_x_min , offset_x_max = offset_x_max , offset_x_min
			end
			
			-- Y轴偏移范围
			offset_y_min , offset_y_max = math.floor(args[param_index + 2]) , math.floor(args[param_index + 3])
			if offset_y_min > offset_y_max then
				offset_y_min , offset_y_max = offset_y_max , offset_y_min
			end
			
			param_index = param_index + 4
		end
		
		-- 计算偏移
		local offset_x , offset_y
		if offset_x_min == offset_x_max then
			offset_x = offset_x_min
		else
			offset_x = math.random(offset_x_min , offset_x_max)
		end
		
		if offset_y_min == offset_y_max then
			offset_y = offset_y_min
		else
			offset_y = math.random(offset_y_min , offset_y_max)
		end
		
		-- 最终坐标
		target_x = x + offset_x
		target_y = y + offset_y
		info.mode = "坐标点击"
		info.offset_x = offset_x
		info.offset_y = offset_y
		
		-- 场景6: 带自定义按下时间的点击 - 检查是否有额外的按下时间参数
		-- 示例: 按下点击(100, 200, 10, 300, 500) - 偏移正负10像素，按下时间300-500毫秒
		-- 示例: 按下点击(100, 200, -15, 20, 200, 400) - 偏移-15到20像素，按下时间200-400毫秒
		-- 示例: 按下点击(100, 200, -10, 20, -5, 10, 300, 500) - X,Y不同偏移，按下时间300-500毫秒
		if args[param_index] and args[param_index + 1] and
			type(args[param_index]) == "number" and type(args[param_index + 1]) == "number" then
			press_time_min = math.floor(args[param_index])
			press_time_max = math.floor(args[param_index + 1])
			if press_time_min > press_time_max then
				press_time_min , press_time_max = press_time_max , press_time_min
			end
		end
	end
	
	--print(info.mode .. " 坐标:", target_x, target_y)
	--print("按下时间范围:", press_time_min, press_time_max)
	
	-- 执行拟人点击
	local initial_x , initial_y = target_x , target_y
	--显示("点击坐标: X=" .. initial_x .. ", Y=" .. initial_y)
	--显示点击的地方
	--showHUD(id , "" , 12 , "0xffff0000" , "0xffff0000" , 0 , initial_x , initial_y , 15 , 15)--显示HUD内容
	-- 按下手指
	touchDown(1 , initial_x , initial_y)
	
	-- 按下延时（确保是整数，使用自定义的按下时间范围）
	local press_time = math.random(press_time_min , press_time_max)
	
	-- 添加简单的手指抖动（1-2次）
	local jitter_count = math.random(1 , 5)
	local time_per_jitter = math.floor(press_time / (jitter_count + 1))
	
	for i = 1 , jitter_count do
		sleep(time_per_jitter)
		
		-- 计算抖动位置（Y轴只向上或不动，避免下拉）
		local jitter_x = initial_x + math.random( - 3 , 3)
		local jitter_y = initial_y + math.random( - 0 , 0)
		
		-- 移动手指
		touchMove(1 , jitter_x , jitter_y)
	end
	
	-- 确保总按下时间
	local remaining_time = press_time - (time_per_jitter * jitter_count)
	if remaining_time > 0 then
		sleep(remaining_time)
	end
	
	-- 抬起手指
	touchUp(1)
	touchUp(0)
	touchUp(2)
	-- 按下后的随机延时
	sleep(math.random(10 , 20))
	
	return {
		x = target_x ,
		y = target_y ,
		press_time = press_time
	}
	--[[ 按下点击函数使用示例:
	
	1. 基本坐标点击 - 默认偏移和按下时间
	按下点击(100, 200)
	-- 在坐标(100,200)周围正负5像素随机点击，按下时间默认50-150毫秒
	
	2. 带单一整体偏移的坐标点击
	按下点击(100, 200, 10)
	-- 在坐标(100,200)周围正负10像素随机点击，按下时间默认50-150毫秒
	
	3. 带相同偏移范围的坐标点击
	按下点击(100, 200, -15, 20)
	-- 在坐标(100,200)的X和Y方向上偏移-15到20像素随机点击，按下时间默认50-150毫秒
	
	4. 带不同X,Y偏移范围的坐标点击(新增功能)
	按下点击(100, 200, -10, 20, -5, 10)
	-- X方向偏移-10到20像素，Y方向偏移-5到10像素，按下时间默认50-150毫秒
	
	5. 带单一整体偏移和自定义按下时间的坐标点击
	按下点击(100, 200, 10, 300, 500)
	-- 在坐标周围正负10像素随机点击，按下时间300-500毫秒
	
	6. 带相同偏移范围和自定义按下时间的坐标点击
	按下点击(100, 200, -15, 20, 200, 400)
	-- X和Y偏移都在-15到20像素之间，按下时间200-400毫秒
	
	7. 带不同X,Y偏移范围和自定义按下时间的坐标点击(新增功能)
	按下点击(100, 200, -10, 20, -5, 10, 300, 500)
	-- X偏移在-10到20像素间，Y偏移在-5到10像素间，按下时间300-500毫秒
	
	8. 区域随机点击
	按下点击({100, 100, 300, 400})
	-- 在矩形区域(100,100)到(300,400)内随机选择一点点击，按下时间默认50-150毫秒
	
	9. 带自定义按下时间的区域随机点击
	按下点击({100, 100, 300, 400}, {800, 1200})
	-- 在矩形区域内随机点击，按下时间800-1200毫秒
	
	--]]
end

function 区域按下点击(x1 , y1 , x2 , y2 , 最短按住时间 , 最长按住时间)
	
	if x1 == nil or y1 == nil or x2 == nil or y2 == nil then
		显示("区域按下点击函数参数错误")
		return - 1 , - 1
	end
	
	最短按住时间 = 最短按住时间 or 500
	最长按住时间 = 最长按住时间 or 1000
	
	if x1 > x2 then x1 , x2 = x2 , x1 end
	if y1 > y2 then y1 , y2 = y2 , y1 end
	
	local 起始X = math.random(x1 , x2)
	local 起始Y = math.random(y1 , y2)
	
	local 按住时间 = math.random(最短按住时间 , 最长按住时间)
	
	显示(string.format("稳定版区域按下: (%d,%d) 按住%dms" , 起始X , 起始Y , 按住时间))
	
	touchDown(0 , 起始X , 起始Y)
	
	local 分段数 = 5
	local 每段时间 = math.floor(按住时间 / 分段数)
	
	for i = 1 , 分段数 do
		sleep(每段时间)
		
	end
	
	touchUp(0 , 起始X , 起始Y)
	显示("手指抬起完成")
	
	return 起始X , 起始Y , 起始X , 起始Y
end

-- 使用示例:
-- 在(100,200)到(300,400)的区域内随机选择一点，
-- 按住2000-4000毫秒并添加轨迹移动后松开
-- local 起始X, 起始Y, 结束X, 结束Y = 区域按下点击(100, 200, 300, 400, 2000, 4000)

-- 使用示例:
-- 在(100,200)到(300,400)的区域内随机选择一点按住2.5秒
-- local x, y = 随机区域按住(100, 200, 300, 400, 2.5)

-- 简单随机数函数
function 随机(最小值 , 最大值)
	最小值 = math.floor(tonumber(最小值) or 0)
	最大值 = math.floor(tonumber(最大值) or 最小值)
	if 最小值 > 最大值 then 最小值 , 最大值 = 最大值 , 最小值 end
	if 最小值 == 最大值 then return 最小值 end
	return math.random(最小值 , 最大值)
end

-- 支持X轴Y轴不同偏移量的滑动函数
-- 调用方式:
-- 滑动(起点X, 起点Y, 终点X, 终点Y)
-- 滑动(起点X, 起点Y, 终点X, 终点Y, X偏移量, Y偏移量)
-- 滑动(起点X, 起点Y, 终点X, 终点Y, X偏移量, Y偏移量, 点数量)
-- 滑动(起点X, 起点Y, 终点X, 终点Y, X偏移量, Y偏移量, 点数量, 持续时间)
function 滑动(起点X , 起点Y , 终点X , 终点Y , X偏移量 , Y偏移量 , 点数量 , 持续时间 , 抬起延时)
	-- 设置默认偏移值
	X偏移量 = X偏移量 or 50 -- X轴默认大偏移：±50像素
	Y偏移量 = Y偏移量 or 5 -- Y轴默认小偏移：±5像素
	touchUp(0)
	随机延时(5 , 6)
	touchUp(1)
	随机延时(5 , 6)
	touchUp(2)
	-- 处理点数量：如果只传入一个值，则作为最大值，最小值默认为15
	local 最小点数 , 最大点数
	if 点数量 then
		if type(点数量) == "table" and #点数量 >= 2 then
			最小点数 , 最大点数 = 点数量[1] , 点数量[2]
		else
			最小点数 , 最大点数 = 15 , 点数量
		end
	else
		最小点数 , 最大点数 = 15 , 30 -- 默认范围
	end
	
	-- 处理持续时间：修改默认范围为800-2132毫秒
	local 最小时间 , 最大时间
	if 持续时间 then
		if type(持续时间) == "table" and #持续时间 >= 2 then
			最小时间 , 最大时间 = 持续时间[1] , 持续时间[2]
		else
			最小时间 , 最大时间 = 持续时间 , 持续时间 * 2.5
		end
	else
		最小时间 , 最大时间 = 800 , 2132 -- 新的默认范围
	end
	
	-- 生成随机点数和持续时间
	local 实际点数 = 随机(最小点数 , 最大点数)
	local 实际时间 = 随机(最小时间 , 最大时间)
	
	-- 确保坐标为整数
	起点X , 起点Y = math.floor(起点X) , math.floor(起点Y)
	终点X , 终点Y = math.floor(终点X) , math.floor(终点Y)
	
	-- 添加起点和终点的随机偏移，X轴Y轴使用不同的偏移量
	local 实际起点X = 起点X + 随机( - X偏移量 , X偏移量)
	local 实际起点Y = 起点Y + 随机( - Y偏移量 , Y偏移量)
	local 实际终点X = 终点X + 随机( - X偏移量 , X偏移量)
	local 实际终点Y = 终点Y + 随机( - Y偏移量 , Y偏移量)
	
	-- 计算每段的时间
	local 每点时间 = 实际时间 / (实际点数 - 1)
	
	-- 生成Y轴的随机波形参数 (降低Y轴变化幅度)
	local Y波形幅度 = 随机(Y偏移量 * 0.5 , Y偏移量 * 1.2) -- 降低幅度，改为原来Y偏移量的0.5~1.2倍
	local Y波形频率 = 随机(1 , 2) -- 降低频率，让变化更平缓
	local Y波形相位 = 随机(0 , 360) -- 随机起始相位
	
	-- 额外添加一个随机跳变点，让Y轴有时会突然变化，但幅度降低
	local 跳变点位置 = 随机(math.floor(实际点数 * 0.3) , math.floor(实际点数 * 0.7))
	local 跳变量 = 随机( - Y偏移量 * 0.3 , Y偏移量 * 0.3) -- 降低跳变幅度
	
	-- 生成滑动轨迹点
	local 轨迹点 = {}
	for i = 1 , 实际点数 do
		local 进度 = (i - 1) / (实际点数 - 1)
		local 当前X , 当前Y
		
		-- 基础直线轨迹
		当前X = 实际起点X + (实际终点X - 实际起点X) * 进度
		当前Y = 实际起点Y + (实际终点Y - 实际起点Y) * 进度
		
		-- 轨迹计算（降低Y轴随机变化幅度）
		if i == 1 then
			-- 起点保持不变
			当前X , 当前Y = 实际起点X , 实际起点Y
		elseif i == 实际点数 then
			-- 终点保持不变
			当前X , 当前Y = 实际终点X , 实际终点Y
		else
			-- 1. 基础曲线波动 (正弦波)，降低幅度
			local 正弦波Y = math.sin((进度 * 360 * Y波形频率 + Y波形相位) * math.pi / 180) * Y波形幅度
			
			-- 2. 添加跳变点效果，降低幅度
			local 跳变效果 = 0
			if i >= 跳变点位置 and 随机(1 , 100) <= 30 then -- 只有30%几率触发跳变
				跳变效果 = 跳变量
			end
			
			-- 3. 添加随机抖动，降低幅度
			local 中间程度 = 1 - math.abs(进度 - 0.5) * 2 -- 0到1，在中间最大
			local 随机抖动Y = 随机( - Y偏移量 * 0.8 , Y偏移量 * 0.8) * 中间程度 * 0.5 -- 降低抖动
			
			-- 综合所有Y轴效果
			当前Y = 当前Y + 正弦波Y + 跳变效果 + 随机抖动Y
			
			-- X轴也添加一些微小变化
			当前X = 当前X + 随机( - X偏移量 * 0.15 , X偏移量 * 0.15) * 中间程度
		end
		
		table.insert(轨迹点 , {x = math.floor(当前X) , y = math.floor(当前Y)})
	end
	
	-- 平滑处理：对Y轴进行额外的平滑处理，减少突变
	for i = 2 , #轨迹点 - 1 do
		-- 对中间点进行平滑处理，使用相邻点的平均值加上小的随机偏移
		轨迹点[i].y = math.floor((轨迹点[i - 1].y + 轨迹点[i].y + 轨迹点[i + 1].y) / 3 + 随机( - 2 , 2))
	end
	
	-- 执行滑动
	touchDown(1 , 轨迹点[1].x , 轨迹点[1].y)
	sleep(随机(80 , 120)) -- 按下后短暂停顿
	
	for i = 2 , #轨迹点 do
		-- 计算这一段应该的时间
		local 当前延时
		
		if i == 2 then
			-- 刚开始时速度慢一些
			当前延时 = 每点时间 * 1.5
		elseif i == #轨迹点 then
			-- 结束前速度慢一些
			当前延时 = 每点时间 * 1.5
		else
			-- 中间速度正常，加一点随机波动
			当前延时 = 每点时间 * (0.9 + 随机(0 , 20) / 100)
		end
		
		sleep(math.floor(当前延时))
		touchMove(1 , 轨迹点[i].x , 轨迹点[i].y)
	end
	
	if 抬起延时 then
		local 延时 = 0
		if type(抬起延时) == "table" and #抬起延时 >= 2 then
			延时 = 随机(抬起延时[1] , 抬起延时[2])
		elseif type(抬起延时) == "number" and 抬起延时 > 0 then
			延时 = 抬起延时
		end
		
		if 延时 > 0 then
			sleep(延时)
		end
	else
		sleep(随机(30 , 70)) -- 抬起前短暂停顿
	end
	touchUp(1)
	
	-- 返回实际的起点和终点
	return {
		起点X = 实际起点X ,
		起点Y = 实际起点Y ,
		终点X = 实际终点X ,
		终点Y = 实际终点Y ,
		持续时间 = 实际时间 ,
		点数量 = 实际点数 ,
		X偏移 = X偏移量 ,
		Y偏移 = Y偏移量
	}
end
function 防封滑动(起点x , 起点y , 终点x , 终点y , 最小时间 , 最大时间)
	-- 检查并确保所有输入值为有效整数
	if not (起点x and 起点y and 终点x and 终点y) then
		显示("错误: 滑动坐标不能为空")
		return false
	end
	
	起点x = math.floor(起点x or 0)
	起点y = math.floor(起点y or 0)
	终点x = math.floor(终点x or 0)
	终点y = math.floor(终点y or 0)
	
	-- 检查坐标有效性
	if 起点x < 0 or 起点y < 0 or 终点x < 0 or 终点y < 0 then
		显示("错误: 滑动坐标不能为负数")
		return false
	end
	
	-- 参数默认值处理 - 不再强制最小时间
	最小时间 = math.floor(最小时间 or 500)
	最大时间 = math.max(最小时间 , math.floor(最大时间 or 1500))
	
	-- 随机滑动时间
	local 总时间 = math.random(最小时间 , 最大时间)
	显示("滑动时间: " .. 总时间 .. "毫秒")
	
	-- 起点随机偏移（超短时间减少偏移）
	local 最大偏移 = 总时间 < 100 and 5 or 10
	local 实际起点x = 起点x + math.random( - 最大偏移 , 最大偏移)
	local 实际起点y = 起点y + math.random( - 最大偏移 , 最大偏移)
	
	-- 确保实际起点坐标有效
	实际起点x = math.max(0 , 实际起点x)
	实际起点y = math.max(0 , 实际起点y)
	
	-- 计算距离
	local 距离x = 终点x - 实际起点x
	local 距离y = 终点y - 实际起点y
	
	-- 生成路径点数量(短时间减少点数)
	local 总距离 = math.sqrt(距离x * 距离x + 距离y * 距离y)
	local 点数量
	
	if 总时间 < 100 then
		点数量 = math.max(2 , math.min(5 , math.floor(总距离 / 50))) -- 短时间用更少的点
	else
		点数量 = math.max(5 , math.min(20 , math.floor(总距离 / 50)))
	end
	
	-- 控制点计算
	local 控制点x = 实际起点x + math.floor(距离x/2)
	local 控制点y = 实际起点y + math.floor(距离y/2)
	
	-- 使用简单的二次贝塞尔曲线（短时间减少曲线弯曲）
	local 路径点 = {}
	for i = 0 , 点数量 do
		local t = i / 点数量
		local 临时t = 1 - t
		
		-- 二次贝塞尔计算 (短时间更接近直线)
		local x , y
		if 总时间 < 100 then
			-- 短时间更接近直线
			x = 实际起点x + math.floor(距离x * t)
			y = 实际起点y + math.floor(距离y * t)
			-- 极小随机抖动
			if i > 0 and i < 点数量 then
				x = x + math.random( - 1 , 1)
				y = y + math.random( - 1 , 1)
			end
		else
			-- 正常贝塞尔曲线
			x = 临时t * 临时t * 实际起点x + 2 * 临时t * t * 控制点x + t * t * 终点x
			y = 临时t * 临时t * 实际起点y + 2 * 临时t * t * 控制点y + t * t * 终点y
			
			-- 添加微小随机抖动
			if i > 0 and i < 点数量 then
				x = x + math.random( - 3 , 3)
				y = y + math.random( - 3 , 3)
			end
		end
		
		-- 确保坐标为有效整数
		x = math.floor(x)
		y = math.floor(y)
		x = math.max(0 , x)
		y = math.max(0 , y)
		
		table.insert(路径点 , {x = x , y = y})
	end
	
	-- 确保终点正确
	路径点[#路径点].x = 终点x
	路径点[#路径点].y = 终点y
	
	-- 执行滑动
	touchDown(1 , 路径点[1].x , 路径点[1].y)
	
	-- 时间分配 (短时间均匀分配)
	local 点间隔时间 = math.max(1 , math.floor(总时间 / (#路径点 - 1)))
	
	for i = 2 , #路径点 do
		mSleep(点间隔时间)
		touchMove(1 , 路径点[i].x , 路径点[i].y)
	end
	
	touchUp(1 , 路径点[#路径点].x , 路径点[#路径点].y)
	
	显示("完成滑动: " .. 实际起点x .. "," .. 实际起点y .. " -> " .. 终点x .. "," .. 终点y)
	return true
end
--多点找色
function 多点找色 (颜色参数 , 点击偏移 )
	
	local x , y = findMultiColorT (颜色参数)
	if x~= - 1 and y ~= - 1 then
		
		if 点击偏移 then
			随机延时(1000 , 2000)
			tap( x + 点击偏移 , y + 点击偏移)
		end
		return true
		
	else
		
		return false
	end
	
end

--[===[-- 示例用法：获取坐标并自定义偏移点击
快速找图(1231 , 116 , 1277 , 150 , "设置.png") --找到不点击
快速找图(1231 , 116 , 1277 , 150 , "设置.png",true) --找到点击
local 找到, x, y = 快速找图(1231 , 116 , 1277 , 150 , "设置.png") --外部点击
if 找到 then
-- 可以根据不同图片设置不同的偏移量
local 点击x = x + 20  -- 设置图片的偏移量
local 点击y = y + 11
按下点击(点击x, 点击y, 10, 10)
end]===]

function 快速找图(x1 , y1 , x2 , y2 , 图片名 , 偏色 , 查找方向 , 相似度 , 点击)
	-- 设置默认参数
	偏色 = 偏色 or "202020"
	查找方向 = 查找方向 or 0
	相似度 = 相似度 or 0.9
	
	-- 如果偏色传入了布尔值，说明参数顺序错了，自动修正
	if type(偏色) == "boolean" then
		点击 = 偏色 -- 把布尔值赋给点击参数
		偏色 = "202020" -- 使用默认偏色
		--print("⚠️ 参数自动修正: 检测到偏色参数为布尔值，已自动调整")
	end
	
	local index1 , retList = findPicFast(x1 , y1 , x2 , y2 , 图片名 , 偏色 , 查找方向 , 相似度)
	
	-- 修复判断逻辑
	if (index1 ~= - 1) and retList and retList[1] and retList[1].x then
		-- 返回原始坐标，不添加固定偏移
		local x = retList[1].x
		local y = retList[1].y
		--print("找到图片: " .. 图片名 .. ", 原始坐标=(" .. x .. "," .. y .. ")")
		
		if 点击 == true then
			-- 如果需要点击，使用原始坐标（您可以在外部调用时自己添加偏移）
			按下点击(x , y , 10 , 10 )
			随机延时(300 , 500)
		end
		
		return true , x , y
	end
	
	return false
	
end

-- 增强版多点找色函数（参数向后兼容）
function 循环多点找色(颜色配置 , 点击偏移 , 循环间隔 , 成功提示 , 失败提示)
	-- 参数默认值处理
	点击偏移 = tonumber(点击偏移) or 0 -- 强制转换为数字
	循环间隔 = 循环间隔 or 500
	
	while true do
		local x , y = findMultiColorT(颜色配置)
		
		if x ~= - 1 then
			-- 只显示提示不点击的版本
			if 成功提示 then
				显示(成功提示)
			end
			
			-- 根据点击偏移量决定是否执行点击
			if 点击偏移 > 0 then
				local 最终x = x + math.random( - 点击偏移 , 点击偏移)
				local 最终y = y + math.random( - 点击偏移 , 点击偏移)
				tap(最终x , 最终y)
				
			end
			
			return true
		else
			if 失败提示 then
				显示(失败提示.." ("..循环间隔.."ms后重试)")
			end
			sleep(循环间隔)
		end
	end
end

--=====================================================dnf通用函数=======================================--
math.randomseed(os.time() * 1000 + os.clock() * 1000000)
math.randomseed(os.time())

function 卡图随机移动()
	
	local baseX , baseY = 201 , 524 -- 轮盘中心基准坐标
	local radius = math.random(100 , 150) -- 半径100-150
	
	math.randomseed(os.time() * 1000 + os.clock())
	local offsetX = math.random( - 10 , 10)
	local offsetY = math.random( - 10 , 10) -- Y轴偏移
	local centerX = baseX + offsetX -- 实际中心坐标
	local centerY = baseY + offsetY
	
	-- 判断当前角度是否为左右方向（0°或180°附近）
	local function isHorizontalDirection(angle)
		local normalizedAngle = math.abs(angle % 360)
		-- 右方向：0° 附近（±22.5°）
		if normalizedAngle >= 337.5 or normalizedAngle <= 22.5 then
			return true
		end
		-- 左方向：180° 附近（±22.5°）
		if normalizedAngle >= 157.5 and normalizedAngle <= 202.5 then
			return true
		end
		return false
	end
	
	-- 7个方向的角度（逆时针：递减角度，因为屏幕Y轴向下）
	-- 0° 正右 → -45° 右上 → -90° 正上 → -135° 左上 → -180° 正左 → -225° 左下 → -270° 正下（结束）
	local directions = {0 , - 45 , - 90 , - 135 , - 180 , - 225 , - 270 , - 365}
	
	local touchReleased = false
	xpcall(function()
		
		-- 从中心点开始按下
		touchDown(1 , centerX , centerY)
		sleep(math.random(80 , 150))
		
		-- 当前位置（从中心点开始）
		local currentX = centerX
		local currentY = centerY
		
		-- 逐个方向拖动（逆时针）
		for i = 1 , #directions do
			local angle = directions[i]
			
			-- 计算目标点
			local targetX = centerX + radius * math.cos(math.rad(angle))
			local targetY = centerY + radius * math.sin(math.rad(angle))
			
			-- 根据方向判断移动总时间
			local totalMoveTime
			if isHorizontalDirection(angle) then
				-- 左右方向：1000-1500ms
				totalMoveTime = math.random(1000 , 1500)
			else
				-- 其他方向：500-600ms
				totalMoveTime = math.random(500 , 600)
			end
			
			-- 从当前位置平滑移动到目标点
			local steps = math.random(15 , 25) -- 插值点数
			local stepTime = totalMoveTime / steps -- 每步的时间
			
			for step = 1 , steps do
				local t = step / steps -- 插值比例 0-1
				local x = currentX + (targetX - currentX) * t
				local y = currentY + (targetY - currentY) * t
				
				-- 添加微小抖动
				x = x + math.random( - 2 , 2)
				y = y + math.random( - 2 , 2)
				
				touchMove(1 , math.floor(x) , math.floor(y))
				sleep(math.floor(stepTime))
			end
			
			-- 确保到达准确的目标点
			touchMove(1 , math.floor(targetX) , math.floor(targetY))
			sleep(math.random(50 , 100))
			
			-- 更新当前位置
			currentX = targetX
			currentY = targetY
		end
		
		-- 最后停留一下
		sleep(math.random(100 , 200))
		
	end , function(err)
	if not touchReleased then
		touchUp(1 , centerX , centerY)
		touchReleased = true
		print("卡图随机移动错误: " .. tostring(err))
	end
end)

if not touchReleased then
	-- 在最后位置释放（-270°正下）
	local finalX = centerX + radius * math.cos(math.rad( - 270))
	local finalY = centerY + radius * math.sin(math.rad( - 270))
	touchUp(1 , math.floor(finalX) , math.floor(finalY))
	按下点击(292 , 564)
end

end
function 随机移动()
	
	local baseX , baseY = 获取轮盘中心_随机()
	
	local radius = math.random(180 , 220)
	local steps = 30
	local baseSpeed = 8
	
	math.randomseed(os.time() * 1000 + os.clock())
	local offset1_X = math.random( - 15 , 15)
	local offset1_Y = math.random( - 15 , 15)
	local offset2_X = math.random( - 5 , 5)
	local offset2_Y = math.random( - 5 , 5)
	local actualX = baseX + offset1_X + offset2_X
	local actualY = baseY + offset1_Y + offset2_Y
	
	local startAngle = math.random(0 , 360)
	local isClockwise = math.random() < 0.5
	
	local touchReleased = false
	xpcall(function()
		
		touchDown(1 , actualX + math.random( - 3 , 3) , actualY + math.random( - 3 , 3))
		sleep(math.random(200 , 300))
		
		for i = 1 , steps do
			
			local angle = startAngle + (isClockwise and - i * 10 or i * 10)
			local radians = math.rad(angle % 260)
			
			local targetX = actualX + radius * math.cos(radians)
			local targetY = actualY + radius * math.sin(radians)
			if i % 5 == 0 then
				targetX = targetX + math.random( - 2 , 2)
				targetY = targetY + math.random( - 2 , 2)
			end
			
			local speedFactor = math.random(80 , 120)/100
			local dynamicSpeed = math.max(5 , math.min(25 , baseSpeed * speedFactor))
			
			local curveFactor = math.cos(math.rad(i * 10)) * 0.3 + 1
			sleep(dynamicSpeed * curveFactor)
			
			touchMove(1 ,
			targetX + math.random( - 5 , 5) ,
			targetY + math.random( - 5 , 5)
			)
		end
		
		local finalRadians = math.rad(startAngle % 360)
		touchMove(1 ,
		actualX + radius * math.cos(finalRadians) + math.random( - 5 , 5) ,
		actualY + radius * math.sin(finalRadians) + math.random( - 5 , 5)
		)
		
		for i = 1 , 3 do
			touchMove(1 ,
			actualX + math.random( - 2 , 2) ,
			actualY + math.random( - 2 , 2)
			)
			sleep(80)
		end
	end , function(err)
	if not touchReleased then
		touchUp(1 , actualX , actualY)
		touchReleased = true
	end
end)

if not touchReleased then
	touchUp(1 ,
	actualX + math.random( - 10 , 10) ,
	actualY + math.random( - 10 , 10)
	)
	按下点击(math.random(290 , 298) , math.random(560 , 568))
end

随机延时(300 , 400)
end

function 随机拖动轮盘()
	local actions = {
		{214 , 609 , 356 , 515 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 292 , 480 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 228 , 470 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 140 , 498 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 134 , 525 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 79 , 585 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 91 , 601 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 142 , 695 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 274 , 698 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 315 , 685 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 357 , 656 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 79 , 585 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 348 , 635 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 350 , 614 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 348 , 595 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 344 , 620 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 355 , 575 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 388 , 577 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 332 , 529 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 346 , 539 , 10 , 50 , {15 , 45} , {50 , 150}} ,
		{214 , 609 , 389 , 484 , 10 , 50 , {15 , 45} , {50 , 150}}
	}
	
	local random_index = math.random(#actions)
	滑动(unpack(actions[random_index]))
end

function 随机移动或拖动轮盘()
	
	if math.random() < 0.5 then
		
		touchUp(0)
		sleep(20)
		touchUp(1)
		随机移动()
	else
		touchUp(0)
		sleep(20)
		touchUp(1)
		随机拖动轮盘()
	end
end

function 判断_是否卡图(检测时间 , 检测间隔 , 最大尝试次数)
	-- 简化参数初始化
	检测时间 = 检测时间 or 0.5 -- 默认1秒判断为卡图
	自动处理 = (自动处理 ~= nil) and 自动处理 or true -- 默认自动处理卡图情况
	最大尝试次数 = 最大尝试次数 or 3 -- 默认最多尝试1次恢复
	
	-- 定义两个检测点
	local 检测点 = {
		{x1 = 578 , y1 = 316 , x2 = 616 , y2 = 313} , -- 第一个区域
		{x1 = 728 , y1 = 315 , x2 = 802 , y2 = 318} -- 第二个区域
	}
	
	local 是否卡图 = false
	
	for i , 点 in ipairs(检测点) do
		local 当前点卡图 = isDisplayDead(点.x1 , 点.y1 , 点.x2 , 点.y2 , 点.x3 , 点.y4 , 检测时间)
		
		if 当前点卡图 then
			是否卡图 = true
			break
		end
	end
	
	if not 是否卡图 then
		显示('技能释放完成')
		return false
	end
	
	显示('技能释放中,等待技能释放完成')
	return true
end

function 循环查找节点(包名 , 文本内容 , 是否点击 , 超时时间)
	if not 包名 or not 文本内容 then
		return false
	end
	
	是否点击 = 是否点击 or false
	local 开始时间 = os.time()
	local 是否超时 = 超时时间 ~= nil
	
	while true do
		if 是否超时 and os.time() - 开始时间 > 超时时间 then
			return false
		end
		
		local ret = nodeLib.findOne(0 , 0 , 0 , 0 , {
			package = 包名 ,
			text = 文本内容
		} , false)
		
		if ret ~= nil then
			if 是否点击 then
				for i = 1 , 3 do
					if ret.bounds then
						local x = (ret.bounds.l + ret.bounds.r) / 2
						local y = (ret.bounds.t + ret.bounds.b) / 2
						tap(x , y)
					else
						return false
					end
					
					sleep(1000)
					
					local 检查 = nodeLib.findOne(0 , 0 , 0 , 0 , {
						package = 包名 ,
						text = 文本内容
					} , false)
					
					if 检查 == nil then
						return true
					end
				end
				return false
			else
				return true
			end
		end
		
		sleep(1000)
	end
end

-- 轨迹滑动函数 - 支持多点轨迹、自定义时间和偏移、持续按住
-- 调用示例:
-- 轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800}, {5, 10})
-- 轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800}, {5, 10}, {10, 20})
-- 轨迹滑动({{202, 525}, {207, 668}, {432, 520}}, {随机(400,500), 随机(100,200)}, 5, 5, 20, 随机(400,500))
function 轨迹滑动(轨迹点数组 , 时间数组 , X偏移 , Y偏移 , 点密度 , 持续按住时间)
	-- 参数验证
	if not 轨迹点数组 or type(轨迹点数组) ~= "table" or #轨迹点数组 < 2 then
		显示("错误: 轨迹点数组至少需要2个点")
		return false
	end
	
	-- 处理时间参数
	local 段落时间 = {}
	if type(时间数组) == "number" then
		-- 如果传入单个时间，平均分配给所有段落
		local 平均时间 = 时间数组 / (#轨迹点数组 - 1)
		for i = 1 , #轨迹点数组 - 1 do
			段落时间[i] = 平均时间
		end
	elseif type(时间数组) == "table" then
		-- 如果传入时间数组
		for i = 1 , #轨迹点数组 - 1 do
			段落时间[i] = 时间数组[i] or 500 -- 默认500ms
		end
	else
		-- 默认每段500ms
		for i = 1 , #轨迹点数组 - 1 do
			段落时间[i] = 500
		end
	end
	
	-- 处理偏移参数
	local X偏移量 , Y偏移量
	if type(X偏移) == "number" and not Y偏移 then
		-- 单个偏移值，X和Y使用相同偏移
		X偏移量 = X偏移
		Y偏移量 = X偏移
	elseif type(X偏移) == "number" and type(Y偏移) == "number" then
		-- X和Y分别指定偏移
		X偏移量 = X偏移
		Y偏移量 = Y偏移
	elseif type(X偏移) == "table" and #X偏移 >= 2 then
		-- 偏移范围数组 {最小偏移, 最大偏移}
		X偏移量 = {X偏移[1] , X偏移[2]}
		Y偏移量 = Y偏移 and type(Y偏移) == "table" and #Y偏移 >= 2 and {Y偏移[1] , Y偏移[2]} or X偏移量
	else
		-- 默认偏移
		X偏移量 = 5
		Y偏移量 = 5
	end
	
	-- 点密度处理 - 支持随机范围
	if type(点密度) == "table" and #点密度 >= 2 then
		-- 如果传入表格，使用随机范围
		点密度 = rnd(点密度[1] , 点密度[2])
	elseif type(点密度) == "number" then
		-- 如果传入单个数字，保持原值
		点密度 = 点密度
	else
		-- 默认随机范围
		点密度 = rnd(15 , 25)
	end
	--显示("使用点密度: " .. 点密度)
	
	-- 生成带偏移的实际轨迹点
	local 实际轨迹点 = {}
	for i , 点 in ipairs(轨迹点数组) do
		local x , y = 点[1] , 点[2]
		
		-- 计算偏移
		local 偏移x , 偏移y
		if type(X偏移量) == "table" then
			偏移x = rnd(X偏移量[1] , X偏移量[2])
		else
			偏移x = rnd( - X偏移量 , X偏移量)
		end
		
		if type(Y偏移量) == "table" then
			偏移y = rnd(Y偏移量[1] , Y偏移量[2])
		else
			偏移y = rnd( - Y偏移量 , Y偏移量)
		end
		
		-- 第一个点和最后一个点偏移量减半，保证起点终点更精确
		if i == 1 or i == #轨迹点数组 then
			偏移x = math.floor(偏移x / 2)
			偏移y = math.floor(偏移y / 2)
		end
		
		实际轨迹点[i] = {
			x = math.floor(x + 偏移x) ,
			y = math.floor(y + 偏移y)
		}
	end
	
	--显示("开始轨迹滑动，共" .. #实际轨迹点 .. "个轨迹点")
	
	-- 开始执行轨迹滑动
	local 起始点 = 实际轨迹点[1]
	local touchReleased = false -- 用于确保touchUp只被调用一次
	
	xpcall(function()
		touchDown(1 , 起始点.x , 起始点.y)
		--随机延时(50, 100) -- 起始停顿
		
		-- 逐段执行滑动
		for 段落 = 1 , #实际轨迹点 - 1 do
			local 起点 = 实际轨迹点[段落]
			local 终点 = 实际轨迹点[段落 + 1]
			local 段落时长 = 段落时间[段落]
			
			--显示("执行第" .. 段落 .. "段: (" .. 起点.x .. "," .. 起点.y .. ") -> (" .. 终点.x .. "," .. 终点.y .. ") 用时" .. 段落时长 .. "ms")
			
			-- 生成这一段的插值点
			local 插值点数 = math.max(5 , math.min(50 , 点密度)) -- 限制插值点数在5-50之间
			local 每点时间 = 段落时长 / 插值点数
			
			-- 计算贝塞尔曲线控制点，让轨迹更自然
			local 距离x = 终点.x - 起点.x
			local 距离y = 终点.y - 起点.y
			local 控制点x = 起点.x + 距离x / 2 + rnd( - math.abs(距离x) * 0.2 , math.abs(距离x) * 0.2)
			local 控制点y = 起点.y + 距离y / 2 + rnd( - math.abs(距离y) * 0.2 , math.abs(距离y) * 0.2)
			
			-- 生成平滑的轨迹点
			for i = 1 , 插值点数 do
				local t = i / 插值点数
				local 临时t = 1 - t
				
				-- 使用二次贝塞尔曲线生成平滑轨迹
				local x = 临时t * 临时t * 起点.x + 2 * 临时t * t * 控制点x + t * t * 终点.x
				local y = 临时t * 临时t * 起点.y + 2 * 临时t * t * 控制点y + t * t * 终点.y
				
				-- 添加微小抖动让轨迹更真实
				if i > 1 and i < 插值点数 then
					x = x + rnd( - 2 , 2)
					y = y + rnd( - 2 , 2)
				end
				
				-- 防封逻辑：随机小幅度偏移
				if math.random(100) <= 15 then -- 15%概率触发防封偏移
					x = x + rnd( - 1 , 1)
					y = y + rnd( - 1 , 1)
				end
				
				-- 确保坐标为整数
				x = math.floor(x)
				y = math.floor(y)
				
				-- 执行移动
				touchMove(1 , x , y)
				
				-- 动态调整速度，开始和结束时速度慢一些
				local 速度系数
				if i <= 3 then
					速度系数 = 1.5 -- 开始慢
				elseif i >= 插值点数 - 2 then
					速度系数 = 1.5 -- 结束慢
				else
					速度系数 = 0.8 + rnd(0 , 40) / 100 -- 中间随机波动
				end
				
				-- 防封逻辑：随机微调延时
				local 基础延时 = math.floor(每点时间 * 速度系数)
				local 防封延时 = 基础延时 + rnd( - 2 , 3) -- 随机微调±2-3ms
				sleep(math.max(1 , 防封延时)) -- 确保延时不小于1ms
				
				-- 防封逻辑：偶尔暂停
				if math.random(100) <= 8 and i > 3 and i < 插值点数 - 3 then -- 8%概率暂停
					--随机延时(10, 30) -- 短暂停顿10-30ms
				end
			end
			
			-- 确保最后到达准确的终点
			touchMove(1 , 终点.x , 终点.y)
			
			-- 段落间的停顿
			if 段落 < #实际轨迹点 - 1 then
				--随机延时(80 , 150)
			end
		end
		
		-- 结束前短暂停顿
		--随机延时(20 , 50)
		
		-- 如果指定了持续按住时间，则在最后一个点持续按住
		if 持续按住时间 and 持续按住时间 > 0 then
			--显示("在最终点持续按住" .. 持续按住时间 .. "ms")
			sleep(持续按住时间)
		end
		
	end , function(err)
	-- 错误处理
	print("轨迹滑动时发生错误: " .. tostring(err))
	if not touchReleased then
		local 最终点 = 实际轨迹点[#实际轨迹点]
		touchUp(1 , 最终点.x , 最终点.y)
		touchReleased = true
		print("错误处理：已强制释放触摸。")
	end
end)

-- 正常执行或xpcall结束后，最终释放触摸
if not touchReleased then
	local 最终点 = 实际轨迹点[#实际轨迹点]
	touchUp(1)
end

--显示("轨迹滑动完成")
return true
--使用示例
--[===[轨迹滑动(
{{202, 525}, {207, 668}, {432, 520}},      -- 轨迹点：点1→点2→点3
{随机延时(400, 500), 随机延时(100, 200)}, -- 时间：第一段400-500ms，第二段100-200ms
5, 5,                                       -- X和Y偏移±5像素
{15, 30},                                   -- 点密度在15-30之间随机
随机延时(400, 500)
)              -- 在最终点持续按住400-500ms]===]

end
function 扫屏移动()
	轨迹滑动(
	{ {207 , 668} , {432 , 520} , {368 , 428} , {248 , 366} , {154 , 364} , {37 , 515} } , -- 6个轨迹点 (5个段落)
	{ 随机延时(100 , 200) , 随机延时(400 , 500) , 随机延时(20 , 50) , 随机延时(400 , 500) , 随机延时(100 , 200) } , -- 为5个段落都提供时间
	5 , 5 , -- X和Y偏移
	{15 , 30} , -- 点密度
	随机延时(600 , 700) -- 持续按住时间
	)
end

function 扫屏寻怪()
	
	local function 突破峡谷()
		setDict(0 , "主线相关.txt")
		useDict(0)
		local ret , x , y = findStr(1206 , 154 , 1275 , 172 , "突破峡谷" , "ffc600-303030" , 0.80 , 10 , 10)
		if x ~= - 1 then
			return true
		end
		return false
	end
	if not 判断_副本中() then
		return
	end
	
	if 突破峡谷() then
		拖动轮盘_自定义多点(44 , 521 , 370 , 453 , 400 , 500 , 500 , 600 , 300 , 400)----原
		--拖动轮盘_自定义多点(44 , 521 , 331 , 408 , 750 , 800 , 800 , 900 , 300 , 400)
		
		return
	end
	print('执行扫屏寻怪')
	
	--[===[local 机型 = 获取设备类型()
	if 机型 == 0 then
	
	轨迹滑动(
	{ {207 , 668} , {427 , 532} , {409 , 410} , {193 , 325} , {66 , 432} , {35 , 547} , {109 , 659} , {213 , 677} , {350 , 624}} ,
	{ 随机延时(1000 , 1500) , 随机延时(500 , 600) , 随机延时(500 , 600) , 随机延时(1000 , 1500) , 随机延时(500 , 600) , 随机延时(500 , 600) , 随机延时(500 , 600) } , -- 为5个段落都提供时间
	5 , 5 , -- X和Y偏移
	{15 , 30} , -- 点密度
	随机延时(600 , 700) -- 持续按住时间
	)
	
	else
	轨迹滑动(
	{ {298 , 565} , {523 , 556} , {409 , 410} , {193 , 325} , {66 , 432} , {35 , 547} , {109 , 659} , {213 , 677} , {350 , 624}} ,
	{ 随机延时(1000 , 1500) , 随机延时(500 , 600) , 随机延时(500 , 600) , 随机延时(1000 , 1500) , 随机延时(500 , 600) , 随机延时(500 , 600) , 随机延时(500 , 600) } , -- 为5个段落都提供时间
	5 , 5 , -- X和Y偏移
	{15 , 30} , -- 点密度
	随机延时(600 , 700) -- 持续按住时间
	)
	
	end]===]
	卡图随机移动()
end

--[[
轨迹滑动函数使用示例:

1. 基本三点轨迹滑动，默认时间和偏移
轨迹滑动({{100, 200}, {300, 400}, {500, 300}})
-- 从(100,200)滑到(300,400)再滑到(500,300)，每段500ms，默认偏移±5像素

2. 指定每段时间
轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800})
-- 第一段用时1000ms，第二段用时800ms

3. 您的具体需求示例：
轨迹滑动(
{{202, 525}, {207, 668}, {432, 520}},
{随机延时(400, 500), 随机延时(100, 200)},
5, 5, {15, 30},
随机延时(400, 500)
)
-- 从(202,525)滑到(207,668)用时400-500ms，再滑到(432,520)用时100-200ms，点密度15-30随机，然后持续按住400-500ms

4. 指定偏移量
轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800}, 10)
-- X和Y偏移都是±10像素

5. X和Y分别指定偏移
轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800}, 15, 5)
-- X偏移±15像素，Y偏移±5像素

6. 偏移范围指定
轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800}, {-20, 30}, {-10, 15})
-- X偏移-20到30像素，Y偏移-10到15像素

7. 指定点密度和持续按住
轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, {1000, 800}, 10, 10, {20, 35}, 1000)
-- 每段使用20-35个随机插值点，最后持续按住1000ms，包含防封逻辑

8. 随机点密度范围示例
轨迹滑动({{100, 200}, {300, 400}}, 800, 8, 8, {15, 30})
-- 点密度在15-30之间随机选择，增强防检测效果

8. 更多点的复杂轨迹
轨迹滑动({{100, 200}, {300, 400}, {500, 300}, {700, 500}, {400, 600}},
{800, 600, 1000, 500}, 10, 10, {18, 28})
-- 五个点的复杂轨迹，每段不同时间，点密度18-28随机

9. 单个时间平均分配
轨迹滑动({{100, 200}, {300, 400}, {500, 300}}, 2000, 8, 8, {15, 25})
-- 总时间2000ms平均分配到两段，每段1000ms，点密度15-25随机

--]]

------------------------------------------------
function 拖动轮盘_自定义(目标X坐标 , 目标Y坐标 , 最小拖动时间 , 最大拖动时间)
	
	--local 轮盘中心X = 201 + math.random( - 5 , 5) -- 防封偏移±5像素
	--local 轮盘中心Y = 523 + math.random( - 3 , 3) -- 防封偏移±5像素
	
	local 轮盘中心X , 轮盘中心Y = 获取轮盘中心_随机()
	
	local 轮盘半径 = math.random(80 , 120) -- 随机半径80-120
	
	-- 计算目标点与轮盘中心的角度
	local 方向角度 = math.deg(math.atan2(轮盘中心Y - 目标Y坐标 , 目标X坐标 - 轮盘中心X))
	if 方向角度 < 0 then
		方向角度 = 方向角度 + 360
	end
	
	local 弧度 = math.rad(方向角度)
	local 目标X = 轮盘中心X + math.cos(弧度) * 轮盘半径
	local 目标Y = 轮盘中心Y - math.sin(弧度) * 轮盘半径
	
	-- 设置默认拖动时间范围
	最小拖动时间 = 最小拖动时间 or 10
	最大拖动时间 = 最大拖动时间 or 30
	
	-- 防封措施：随机触摸ID
	local 触摸ID = math.random(0 , 9)
	
	-- 防封措施：按下时微小抖动
	local 按下X = 轮盘中心X + math.random( - 3 , 3)
	local 按下Y = 轮盘中心Y + math.random( - 3 , 3)
	
	-- 持续拖动模式：按下中心点后拖动到目标位置
	touchDown(0 , 按下X , 按下Y)
	随机延时(100 , 180)
	
	-- 防封措施：添加中间点，模拟人类拖动轨迹
	local 中间点数量 = math.random(3 , 6)
	for i = 1 , 中间点数量 do
		local 进度 = i / (中间点数量 + 1)
		-- 添加微小随机偏移，模拟手指不稳定性
		local 随机偏移X = math.random( - 8 , 8)
		local 随机偏移Y = math.random( - 8 , 8)
		local 中间X = 按下X + (目标X - 按下X) * 进度 + 随机偏移X
		local 中间Y = 按下Y + (目标Y - 按下Y) * 进度 + 随机偏移Y
		touchMove(0 , 中间X , 中间Y)
		随机延时(10 , 30) -- 中间点之间的短暂停顿
	end
	-- 最终移动到目标位置
	touchMove(0 , 目标X + math.random( - 5 , 5) , 目标Y + math.random( - 5 , 5))
	随机延时(最小拖动时间 , 最大拖动时间)
	-- 防封措施：释放时微小抖动
	touchMove(0 , 目标X + math.random( - 5 , 5) , 目标Y + math.random( - 5 , 5))
	
	touchUp(0)
	
	-- 防封措施：操作后随机等待
	随机延时(30 , 80)
end

function 拖动轮盘_自定义多点(目标X坐标1 , 目标Y坐标1 , 目标X坐标2 , 目标Y坐标2 , 点1最小时间 , 点1最大时间 , 点2最小时间 , 点2最大时间 , 抬起最小时间 , 抬起最大时间 , 中心X坐标 , 中心Y坐标)
	-- 设置轮盘中心坐标，如果没有传入则使用默认值
	--local 轮盘中心X = (中心X坐标 or 201) + math.random( - 5 , 5) -- 防封偏移±5像素
	--local 轮盘中心Y = (中心Y坐标 or 523) + math.random( - 5 , 5) -- 防封偏移±5像素
	
	local 轮盘中心X , 轮盘中心Y = 获取轮盘中心_随机()
	
	local 轮盘半径 = math.random(100 , 170) -- 随机半径100-150
	
	-- 计算第一个目标点与轮盘中心的角度
	local 方向角度1 = math.deg(math.atan2(轮盘中心Y - 目标Y坐标1 , 目标X坐标1 - 轮盘中心X))
	if 方向角度1 < 0 then
		方向角度1 = 方向角度1 + 360
	end
	
	local 弧度1 = math.rad(方向角度1)
	local 目标X1 = 轮盘中心X + math.cos(弧度1) * 轮盘半径
	local 目标Y1 = 轮盘中心Y - math.sin(弧度1) * 轮盘半径
	
	-- 计算第二个目标点与轮盘中心的角度
	local 方向角度2 = math.deg(math.atan2(轮盘中心Y - 目标Y坐标2 , 目标X坐标2 - 轮盘中心X))
	if 方向角度2 < 0 then
		方向角度2 = 方向角度2 + 360
	end
	
	local 弧度2 = math.rad(方向角度2)
	local 目标X2 = 轮盘中心X + math.cos(弧度2) * 轮盘半径
	local 目标Y2 = 轮盘中心Y - math.sin(弧度2) * 轮盘半径
	
	-- 设置默认拖动时间
	点1最小时间 = 点1最小时间 or 60
	点1最大时间 = 点1最大时间 or 80
	点2最小时间 = 点2最小时间 or 150
	点2最大时间 = 点2最大时间 or 250
	抬起最小时间 = 抬起最小时间 or 900
	抬起最大时间 = 抬起最大时间 or 1000
	
	-- 防封措施：随机触摸ID
	local 触摸ID = math.random(0 , 9)
	
	-- 防封措施：按下时微小抖动
	local 按下X = 轮盘中心X -- + math.random( - 3 , 3)
	local 按下Y = 轮盘中心Y -- + math.random( - 3 , 3)
	
	-- 持续拖动模式：按下中心点后拖动到第一个目标位置，然后拖动到第二个目标位置
	touchDown(0 , 按下X , 按下Y)
	随机延时(50 , 70) -- 按下后随机等待
	
	-- 防封措施：添加到第一个点的中间点，模拟人类拖动轨迹
	local 中间点数量1 = math.random(2 , 4)
	for i = 1 , 中间点数量1 do
		local 进度 = i / (中间点数量1 + 1)
		-- 添加微小随机偏移，模拟手指不稳定性
		local 随机偏移X = math.random( - 6 , 6)
		local 随机偏移Y = math.random( - 6 , 6)
		local 中间X = 按下X + (目标X1 - 按下X) * 进度 + 随机偏移X
		local 中间Y = 按下Y + (目标Y1 - 按下Y) * 进度 + 随机偏移Y
		touchMove(0 , 中间X , 中间Y)
		随机延时(8 , 20)
	end
	
	-- 移动到第一个目标位置
	touchMove(0 , 目标X1 + math.random( - 3 , 3) , 目标Y1 + math.random( - 3 , 3))
	
	-- 防封措施：在第一个点停留时间随机化
	随机延时(点1最小时间 , 点1最大时间)
	
	-- 防封措施：添加到第二个点的中间点，模拟人类拖动轨迹
	local 中间点数量2 = math.random(2 , 4)
	for i = 1 , 中间点数量2 do
		local 进度 = i / (中间点数量2 + 1)
		-- 添加微小随机偏移，模拟手指不稳定性
		local 随机偏移X = math.random( - 6 , 6)
		local 随机偏移Y = math.random( - 6 , 6)
		local 中间X = 目标X1 + (目标X2 - 目标X1) * 进度 + 随机偏移X
		local 中间Y = 目标Y1 + (目标Y2 - 目标Y1) * 进度 + 随机偏移Y
		touchMove(0 , 中间X , 中间Y)
		随机延时(8 , 20)
	end
	
	-- 移动到第二个目标位置
	touchMove(0 , 目标X2 + math.random( - 10 , 10) , 目标Y2 + math.random( - 10 , 10))
	
	-- 防封措施：在第二个点停留时间随机化
	随机延时(点2最小时间 , 点2最大时间)
	
	-- 防封措施：释放时微小抖动
	touchMove(0 , 目标X2 + math.random( - 15 , 15) , 目标Y2 + math.random( - 15 , 15))
	随机延时(5 , 15)
	
	-- 抬起前的最终停留
	随机延时(抬起最小时间 , 抬起最大时间)
	touchUp(0)
	
	-- 防封措施：操作后随机等待
	随机延时(30 , 80)
end
function 获取指定软件()
	local installedApps = getInstalledApk()
	if installedApps then
		for _ , pkg in pairs(installedApps) do
			if pkg == "com.wukong.nb" then
				print('已安装')
				return true
			end
		end
	end
	print('未安装')
	return false
end
local 悟空插件 = "com.wukong.nb"
function 启动悟空()
	
	local isRunning = appIsRunning(悟空插件)
	
	if isRunning == false then
		
		显示('wk未运行...')
		sleep(1000)
		
		return false
	elseif isRunning == true then
		显示('wk正在运行...')
		return true
		
	end
end

function 获取指定软件鳄鱼()
	local installedApps = getInstalledApk()
	if installedApps then
		for _ , pkg in pairs(installedApps) do
			if pkg == "com.cangqiong.comb" then
				print('已安装')
				return true
			end
		end
	end
	print('未安装')
	return false
end

function 重启插件()
	
	local function 插件登录()
		setDict(0 , "界面判断.txt")
		useDict(0)
		local ret , x , y = findStr(122 , 384 , 597 , 683 , "插件登录" , "00ff88-303030" , 0.85 , 10 , 10)
		if x ~= - 1 then
			tap(x , y)
			return true
			
		end
		return false
	end
	
	local function 插件已阅()
		setDict(0 , "界面判断.txt")
		useDict(0)
		local ret , x , y = findStr(18 , 363 , 719 , 1093 , "插件已阅" , "00ff88-303030" , 0.85 , 10 , 10)
		if x ~= - 1 then
			
			tap(x , y)
			return true
			
		end
		return false
	end
	local function 插件立即下载()
		setDict(0 , "界面判断.txt")
		useDict(0)
		local ret , x , y = findStr(281 , 610 , 718 , 1057 , "插件立即下载" , "fad300-303030" , 0.85 , 10 , 10)
		if x ~= - 1 then
			X = x + 20
			Y = y + 10
			
			tap(X , Y)
			return true
			
		end
		return false
		
	end
	
	local function 立即重启()
		setDict(0 , "界面判断2.txt")
		useDict(0)
		local ret , x , y = findStr(0 , 0 , 0 , 0 , "立即重启" , "00ff88-303030" , 0.8 , 10 , 10)
		if x ~= - 1 then
			
			return true
			
		end
		return false
	end
	
	local function 插件进入系统()
		setDict(0 , "界面判断.txt")
		useDict(0)
		local ret , x , y = findStr(0 , 45 , 719 , 959 , "插件进入系统" , "cccccc-303030" , 0.8 , 10 , 10)
		if x ~= - 1 then
			tap(x , y)
			return true
			
		end
		local ret1 , x1 , y1 = findStr(0 , 45 , 719 , 959 , "插件进入系统" , "ffffff-303030" , 0.8 , 10 , 10)
		if x1 ~= - 1 then
			tap(x1 , y1)
			return true
		end
		return false
	end
	
	local function 插件缩小()
		
		setDict(0 , "界面判断.txt")
		useDict(0)
		local ret , x , y = findStr(748 , 570 , 892 , 612 , "插件一键结束" , "d3d2d1-303030" , 0.8 , 10 , 10)
		if x ~= - 1 then
			tap(953 , 65)
			return true
			
		end
		local ret1 , x1 , y1 = findStr(748 , 570 , 892 , 612 , "插件一键结束" , "ffffff-303030" , 0.8 , 10 , 10)
		if x1 ~= - 1 then
			tap(953 , 65)
			return true
			
		end
		
		local ret2 , x2 , y2 = findStr(449 , 188 , 500 , 213 , "202" , "d72425-202020" , 0.85 , 10 , 10)
		if x2 ~= - 1 then
			tap(953 , 65)
			return true
			
		end
		
		return false
		
	end
	if 同步关闭yolo战斗功能 () and 获取指定软件() then
		keyPress(3)
		sleep(500)
		关闭(地下城)
		stopApp(悟空插件)
		runApp(悟空插件)
		sleep(500)
	else
		return false
	end
	
	local 登录 = false
	local 运行时间 = os.time()
	local 找到界面 = false
	local 已进入系统 = false
	local 已缩小小 = false
	local 缩小次数 = 0
	local 首次运行 = true
	local 查找时间 = os.time()
	
	while true do
		if not 首次运行 then
			sleep(1500)
			
		end
		首次运行 = false
		
		if os.time() - 运行时间 > 50 then
			print('启动插件运行超时')
			
			return 重启插件()
		end
		local yolo状态 = 同步关闭yolo战斗功能()
		
		local 重启状态 = 读取重启状态()
		local 插件安装状态 = 获取指定软件()
		
		print('调试 - yolo状态: ' .. tostring(yolo状态) .. ', 重启状态: ' .. tostring(重启状态))
		
		if yolo状态 and 插件安装状态 then --and 重启状态
			print('重启插件中')
			if not 启动悟空() then
				runApp(悟空插件)
				goto 重启插件标签
			end
			if not 找到界面 then
				
				if 插件登录() then
					
					找到界面 = true
					查找时间 = os.time()
				elseif 插件已阅()then
					
					找到界面 = true
					查找时间 = os.time()
				elseif 插件立即下载() then
					找到界面 = true
					查找时间 = os.time()
				elseif 立即重启() then
					return 重启插件()
				else
					if os.time() - 查找时间 > 4 then
						keyPress(3)
						sleep(500)
						关闭(地下城)
						sleep(200)
						stopApp('com.wukong.nb')
						sleep(200)
						runApp('com.wukong.nb')
						
						sleep(200)
						查找时间 = os.time()
					end
					
				end
			elseif 找到界面 then
				查找时间 = os.time()
				if 插件进入系统() then
					sleep(4000)
					已进入系统 = true
					
				elseif 插件已阅()then
					
					找到界面 = true
				elseif 插件登录() then
					找到界面 = true
					
				elseif 插件立即下载() then
					找到界面 = true
					
				elseif 插件缩小() then
					已缩小 = true
					
				elseif 已缩小 then
					
					if not 插件缩小() then
						缩小次数 = 缩小次数 + 1
						if 缩小次数 > 3 then
							显示('启动插件成功')
							保存重启状态(false)
							return true
						end
						
					end
					
				end
				
			end
			
		elseif not yolo状态 or not 插件安装状态 then
			
			return false
		end
		::重启插件标签::
	end
	
end
--------------------------------------------------------------------------------------------------------备份

-----------------------------------------------------------------------------------------------------------------------------
