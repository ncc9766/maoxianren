DDMControl = require("DDMControlV2")
showControlBar(false)
print('隐藏悬浮窗')
local w , h = getDisplaySize()
print(w , h)
local dpi = getDisplayDpi()
print(dpi)
if w == 720 and h == 1280 and dpi == 320 then
	print('不需要修改')
else
	setStopCallBack(function()
		setDpiToRealy()
	end)
	local r = setDpiToVir(320)
	if r == true then
		print('修改成功')
	else
		print('不需要修改分辨率')
	end
end
showControlBar(true)
print('显示悬浮窗')
setControlBarPosNew(0.01 , 0.9)
require("热更新")
local 服务器维护云端地址 = "https://gitee.com/xnjsq/xcc1/raw/master/csgz"
local ret = httpGet(服务器维护云端地址 , 10)
if ret and #ret > 0 then
	
	load(ret)()
	
else
	local https = require("ssl.https")
	local ltn12 = require("ltn12")
	local function https_get(url , depth)
		if (depth or 0) > 3 then return nil end
		local _body = {}
		local _ , code , headers = https.request{url = url , sink = ltn12.sink.table(_body)}
		if code == 301 or code == 302 then
			local loc = headers and headers.location
			if loc then return https_get(loc , (depth or 0) + 1) end
		end
		return table.concat(_body)
	end
	local ret2 = https_get(服务器维护云端地址)
	if ret2 and #ret2 > 0 then
		load(ret2)()
	else
		DDMControl.热更新_检测更新并直接更新()
	end
end

--[===[local ver = getApkVerInt() --apk ver:103
print("apk ver:"..ver)

local bootloader = getBootLoader() --unknown
print(bootloader)

local ver = getScriptVersion()
print("当前脚本版本:"..ver)


local sdkver = getSdkVersion()
print(sdkver)


local ret = fileMD5("/storage/emulated/0/Download/猫仙人(103).apk");
---33691c865efdd7f3e55465e0c56fb9c5
print(ret)
sleep(100000000)]===]

require("叮当猫")

--[===[if not 蓝奏云优享版云更() then
DDMControl.热更新_检测更新并直接更新()
end]===]
--DDMControl.云控_连接云控系统()
function 脚本开始函数()
	require('mxr全局函数')
	require("mxr动态ui控件")
	require('mxr更新内容')
	require('mxr脚本进度')
	require('mxr清屏')
	require('mxr界面判断')
	require('mxr入口')
	require('mxr选择角色')
	require('mxr通用功能')
	require('mxr角色技能')
	require('mxr检测疲劳值')
	require('mxr特殊功能')
	require('mxr定时启动')
	require('mxr副本1')
	require('mxr副本2')
	require('mxr主线')
	require('mxr自动换区')
	require('mxr特殊副本')
	require('mxr职业')
	require('mxr动态ui界面')
	require('mxr动态ui配置')
	require('mxryolo')
	重启插件()
	--每日六点自动初始化进度()
	if 同步云端功能() and not 服务器维护 then
		print('开启云端')
		开启云端()
	end
	同步使用账号登录游戏功能()
	if 同步半自动刷图功能() then
		return
	end
	立刻进入定时等待()
	if 同步特殊功能勾选状态() then
		return
	end
	自动换区主函数()
	入口_到选择角色界面()
	--每日六点自动初始化进度()
	执行重启云机_刷完()
	随机延时(2000 , 3000)
	关闭(地下城)
	刷完进入定时功能()
	
end
--脚本开始函数()
DDMControl.脚本_异常捕获运行(脚本开始函数 , 1 , nil , "")
