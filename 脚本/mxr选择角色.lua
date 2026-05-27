
function 判断_角色数量()
	
	setDict(0 , "字库3.txt")
	useDict(0)
	for i = 1 , 5 do
		local str = ocr(1160 , 9 , 1202 , 38 , "efe3ad-303030|b5ae84-303030" , 0.85 , 10 , 10)
		
		if str~= nil and tonumber(str) ~= 0 then
			显示('当前最大可选择角色数量为'..str)
			return tonumber(str)
		end
		sleep(100)
	end
	显示('未检测到当前角色数量')
	return 999
end
function 功能_点击1号位角色()
	
	按下点击({83 , 334 , 229 , 402} , {10 , 20})
	随机延时(700 , 800)
end
function 功能_点击2号位角色()
	按下点击({353 , 305 , 458 , 337} , {10 , 20})
	随机延时(700 , 800)
end
function 功能_点击3号位角色()
	
	按下点击({590 , 335 , 721 , 410} , {10 , 20})
	随机延时(700 , 800)
end
function 功能_点击4号位角色()
	按下点击({827 , 289 , 951 , 343} , {10 , 20})
	随机延时(700 , 800)
end
function 功能_点击5号位角色()
	
	按下点击({1065 , 329 , 1192 , 425} , {10 , 20})
	随机延时(700 , 800)
	
end
function 判断_1号位没角色()
	
	setDict(0 , "界面判断.txt")
	useDict(0)
	local ret , x , y = findStr(89 , 177 , 199 , 533 , "没有角色+" , "d6b6a4-303030" , 0.8 , 1 , 1)
	if x ~= - 1 and y ~= - 1 then -- +号
		显示('一号位没有角色了')
		
		return true
	end
	return false
	
end
function 判断_2号位没角色()
	setDict(0 , "界面判断.txt")
	useDict(0)
	local ret , x , y = findStr(330 , 200 , 466 , 4912 , "没有角色+" , "d6b6a4-303030" , 0.8 , 1 , 1)
	if x ~= - 1 and y ~= - 1 then
		显示('一号位没有角色了')
		
		return true
	end
	return false
end
function 判断_3号位没角色()
	setDict(0 , "界面判断.txt")
	useDict(0)
	local ret , x , y = findStr(563 , 214 , 715 , 488 , "没有角色+" , "d6b6a4-303030" , 0.8 , 1 , 1)
	if x ~= - 1 and y ~= - 1 then
		显示('一号位没有角色了')
		
		return true
	end
	return false
end
function 判断_4号位没角色()
	setDict(0 , "界面判断.txt")
	useDict(0)
	local ret , x , y = findStr(806 , 208 , 966 , 499 , "没有角色+" , "d6b6a4-303030" , 0.8 , 1 , 1)
	if x ~= - 1 and y ~= - 1 then
		显示('一号位没有角色了')
		
		return true
	end
	return false
end
function 判断_5号位没角色()
	setDict(0 , "界面判断.txt")
	useDict(0)
	local ret , x , y = findStr(1060 , 224 , 1204 , 494 , "没有角色+" , "d6b6a4-303030" , 0.8 , 1 , 1)
	if x ~= - 1 and y ~= - 1 then
		显示('一号位没有角色了')
		
		return true
	end
	return false
end
function 判断_1号位没疲劳()
	setDict(0 , "字库2.txt")
	useDict(0)
	local ret1 , x1 , y1 = findStr(102 , 470 , 215 , 642 , "加载完成" , "ff0000-303030" , 0.8 , 10 , 10)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('一号位没疲劳了1')
		
		return true
	end
	
	--[===[local x , y = findMultiColor(132,479,216,644 , "ff0000-202020" , "22|3|ff0408-202020|12|3|ff0400-202020|6|3|ff0408-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
	print('一号位没疲劳了')
	return true
	end]===]
	
	return false
end
function 判断_2号位没疲劳()
	
	setDict(0 , "字库2.txt")
	useDict(0)
	local ret1 , x1 , y1 = findStr(343 , 436 , 456 , 650 , "加载完成" , "ff0000-303030" , 0.8 , 10 , 10)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('二号位没疲劳了')
		
		return true
	end
	--[===[local x1 , y1 = findMultiColor(400,485,447,630, "ff0000-202020" , "5|0|ff0000-202020|12|0|ff0000-202020|22|0|ff0000-202020|15|0|ff0000-202020" , 0 , 0.9)
	if x1 ~= - 1 and y1 ~= - 1 then
	print('二号位没疲劳了')
	return true
	end]===]
	
	return false
	
end
function 判断_3号位没疲劳()
	
	--[===[local x , y = findMultiColor(643,488,684,633, "ff0000-202020" , "22|3|ff0408-202020|12|3|ff0400-202020|6|3|ff0408-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
	print('三号位没疲劳了')
	return true
	end]===]
	
	setDict(0 , "字库2.txt")
	useDict(0)
	local ret1 , x1 , y1 = findStr(602 , 474 , 701 , 634 , "加载完成" , "ff0000-303030" , 0.8 , 10 , 10)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('三号位没疲劳了')
		
		return true
	end
	return false
end
function 判断_4号位没疲劳()
	
	--[===[local x , y = 	findMultiColor(890,490,926,630  , "ff0000-202020" , "22|3|ff0408-202020|12|3|ff0400-202020|6|3|ff0408-202020" , 0 , 0.9)
	
	if x ~= - 1 and y ~= - 1 then
	print('四号位没疲劳了')
	return true
	end]===]
	
	setDict(0 , "字库2.txt")
	useDict(0)
	local ret1 , x1 , y1 = findStr(855 , 418 , 954 , 654 , "加载完成" , "ff0000-303030" , 0.8 , 10 , 10)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('四号位没疲劳了')
		
		return true
	end
	return false
end
function 判断_5号位没疲劳()
	
	--[===[local x , y = findMultiColor(1142,492,1184,630, "ff0000-202020" , "22|3|ff0408-202020|12|3|ff0400-202020|6|3|ff0408-202020" , 0 , 0.9)
	
	if x ~= - 1 and y ~= - 1 then
	print('五号位没疲劳了')
	return true
	end]===]
	
	setDict(0 , "字库2.txt")
	useDict(0)
	local ret1 , x1 , y1 = findStr(1076 , 505 , 1161 , 578 , "加载完成" , "ff0000-303030" , 0.8 , 10 , 10)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('5号位没疲劳了')
		
		return true
	end
	return false
end
function 翻页_选择角色()
	滑动(530 , 563 , 541 , 120 , 10 , 5 , {15 , 25} , {2000 , 2500} , {300 , 400})
	随机延时(400 , 500)
	功能_点击1号位角色()
	随机延时(500 , 600)
end

--++++++++++++++++++++++++++++功能_角色++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
local 首次等待 = false
-- 记录上次选择角色的时间戳
function 等待加载角色()
	if not 首次等待 then
		print('------------------------------首次等待时间------------------------------------')
		随机延时(1500 , 1800)
		首次等待 = true
	end
	
end
-- 追踪当前所在页码，初始为第1页
当前页码 = 1
-- 翻页到指定页码
function 翻页到指定页(目标页码)
	local 需要翻页次数 = 目标页码 - 当前页码
	if 需要翻页次数 > 0 then
		print(string.format('当前在第%d页，需要翻%d页到第%d页' , 当前页码 , 需要翻页次数 , 目标页码))
		for i = 1 , 需要翻页次数 do
			翻页_选择角色()
			随机延时(600 , 700)
			
		end
		当前页码 = 目标页码
	else
		print(string.format('当前已在第%d页，无需翻页' , 当前页码))
	end
end
-- 重置页码为第1页（完成任务后会回到第一页）
function 重置页码()
	--print('重置页码为第1页,重置首次等待为 ')
	当前页码 = 1
	首次等待 = false
end

function 点击_开始游戏()
	
	if 清屏_角色扩展栏提示() then
		最大可选角色 = true
		return false
	else
		
		if not 同步时间胶囊功能() then
			按下点击({521 , 651 , 765 , 693})
			随机延时(2000 , 2500)
		else
			return true
		end
		
	end
	--[===[随机延时(1000 , 1500)]===]
	local 开始时间 = os.time()
	local 总运行时间 = os.time()
	local 找到次数 = 0
	local 选择角色界面次数 = 0
	
	local 点击分享 = false
	local 已分享 = false
	local 已有邮箱入口 = false
	local 查找次数 = 0
	while true do
		sleep(1000)
		显示('选择角色完成,前往城镇界面')
		if os.time() - 开始时间 > 200 then
			关闭(地下城)
			显示('超时未进入可能卡住了重启游戏...')
			return false
		end
		
		if 判断_城镇界面() then
			查找次数 = 查找次数 + 1
			if 查找次数 > 2 then
				if not 已有邮箱入口 then
					if not 判断_邮箱入口() then
						
						if not 判断_正在移动() then
							
							按下点击({90 , 167 , 196 , 209}) --主线
						else
							
							返回时间 = os.time()
						end
					else
						已有邮箱入口 = true
					end
				else
					
					重置页码()
					
					显示('选择角色成功')
					同步自动设置功能()
					同步领取并使用升级券功能()
					return true
				end
				
			end
			
		elseif 判断_加载界面() then
			sleep(1500)
			选择角色界面次数 = 0
			找到次数 = 0
			总运行时间 = os.time()
			
		elseif 判断_选择角色界面_不用等加载() then
			
			选择角色界面次数 = 选择角色界面次数 + 1
			
			if 选择角色界面次数 > 5 then
				
				return false
			end
		elseif 判断_分享_朋友圈() then
			显示('检测到分享朋友圈')
			if not 已分享 then
				按下点击({232 , 664 , 292 , 684}) --朋友圈
				已分享 = true
				
			else
				清屏()
				随机延时(500 , 600)
			end
			总运行时间 = os.time()
		elseif 判断_分享界面_分享两字黄() then
			显示('检测到分享2000泰拉')
			if not 点击分享 then
				按下点击({1088 , 651 , 1219 , 696})
				点击分享 = true
			else
				清屏()
				随机延时(500 , 600)
			end
			
			总运行时间 = os.time()
			
		elseif 判断_开始游戏界面() then
			重置页码()
			return false
		elseif 清屏(true) then
			总运行时间 = os.time()
			
		else
			if not 打开(地下城) then
				返回(4)
			end
			查找次数 = 0
		end
	end
end
最大可选角色 = false
function 角色1()
	设置当前角色序号(1)
	
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			显示('选择1号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			if 判断_选择角色界面疲劳() then
				翻页到指定页(1)
				功能_点击1号位角色()
				随机延时(300 , 400)
				if 同步跳过无疲劳角色功能() and 判断_1号位没疲劳() then
					显示('没有疲劳了跳过角色1')
					
					return false
				else
					功能_点击1号位角色()
					if 点击_开始游戏() then
						return true
					end
				end
			end
		else
			入口_到选择角色界面()
		end
	end
end
function 角色2()
	设置当前角色序号(2)
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			显示('选择2号角色')
			等待加载角色()
			-- 检查角色数量
			if 判断_角色数量() == 1 then
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					显示('角色数量不足，跳过角色2')
					print('最大可选角色为1,跳过执行选择角色2')
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				翻页到指定页(1)
				功能_点击2号位角色()
				if 同步跳过无疲劳角色功能() and 判断_2号位没疲劳() then
					显示('没有疲劳了跳过角色2')
					return false
				else
					功能_点击2号位角色()
					if 判断_2号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
				end
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色3()
	设置当前角色序号(3)
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			显示('选择3号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			if 判断_角色数量() == 2 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--角色3在第1页
				翻页到指定页(1)
				
				功能_点击3号位角色()
				if 同步跳过无疲劳角色功能() and 判断_3号位没疲劳() then
					显示('没有疲劳了跳过角色3')
					return false
				else
					功能_点击3号位角色()
					if 判断_3号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
					
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色4()
	--入口_到选择角色界面()
	设置当前角色序号(4)
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			显示('选择4号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			if 判断_角色数量() == 3 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--角色4在第1页
				翻页到指定页(1)
				功能_点击4号位角色()
				if 同步跳过无疲劳角色功能() and 判断_4号位没疲劳() then
					显示('没有疲劳了跳过角色4')
					return false
				else
					功能_点击4号位角色()
					if 判断_4号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
				end
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色5()
	设置当前角色序号(5)
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			显示('选择5号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			if 判断_角色数量() == 4 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				翻页到指定页(1)
				
				功能_点击5号位角色()
				if 同步跳过无疲劳角色功能() and 判断_5号位没疲劳() then
					显示('没有疲劳了跳过角色5')
					return false
				else
					功能_点击5号位角色()
					if 判断_5号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
				end
			elseif 判断_开始游戏_不可开始() then
				
				最大可选角色 = true
				return false
				
			end
		elseif 清屏_角色扩展栏提示() then
			
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色6()
	设置当前角色序号(6)
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			显示('选择6号角色')
			
			等待加载角色()
			
			if 判断_角色数量() == 5 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				翻页到指定页(2)
				功能_点击1号位角色()
				if 同步跳过无疲劳角色功能() and 判断_1号位没疲劳() then
					显示('角色6没疲劳了跳过执行')
					return false
				else
					功能_点击1号位角色()
					if 判断_1号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
				end
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色7()
	设置当前角色序号(7)
	--入口_到选择角色界面()
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			显示('选择7号角色')
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			显示('选择角色7')
			--检查并重启游戏_超两小时()
			-- 等待加载角色()
			等待加载角色()
			if 判断_角色数量() == 6 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				-- 角色7在第2页
				翻页到指定页(2)
				功能_点击2号位角色()
				if 同步跳过无疲劳角色功能() and 判断_2号位没疲劳() then
					显示('角色7没疲劳了跳过执行')
					return false
				else
					功能_点击2号位角色()
					if 判断_2号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
				end
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
	
end
function 角色8()
	设置当前角色序号(8)
	--入口_到选择角色界面()
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			显示('选择8号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			if 判断_角色数量() == 7 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				-- 角色8在第2页
				翻页到指定页(2)
				功能_点击3号位角色()
				if 同步跳过无疲劳角色功能() and 判断_3号位没疲劳() then
					显示('角色8没疲劳了跳过执行')
					return false
				else
					
					功能_点击3号位角色()
					if 判断_3号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
					
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色9()
	设置当前角色序号(9)
	--入口_到选择角色界面()
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			显示('选择9号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 8 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				
				--随机延时(3000 , 3200)
				
				-- 角色9在第2页
				翻页到指定页(2)
				功能_点击4号位角色()
				if 同步跳过无疲劳角色功能() and 判断_4号位没疲劳() then
					显示('角色9没疲劳了跳过执行')
					return false
				else
					
					功能_点击4号位角色()
					if 判断_4号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
				end
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
	
end
function 角色10()
	设置当前角色序号(10)
	--入口_到选择角色界面()
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			显示('选择10号角色')
			--检查并重启游戏_超两小时()
			
			等待加载角色()
			
			if 判断_角色数量() == 9 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				
				-- 角色10在第2页
				翻页到指定页(2)
				功能_点击5号位角色()
				if 同步跳过无疲劳角色功能() and 判断_5号位没疲劳() then
					显示('角色10没疲劳了跳过执行')
					return false
					
				else
					
					功能_点击5号位角色()
					if 判断_5号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						return true
					end
					
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色11()
	设置当前角色序号(11)
	--入口_到选择角色界面()
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 查找次数 = 0
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			
			显示('选择11号角色')
			--检查并重启游戏_超两小时()
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			等待加载角色()
			
			if 判断_角色数量() == 10 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				
				-- 角色11在第3页
				翻页到指定页(3)
				功能_点击1号位角色()
				if 同步跳过无疲劳角色功能() and 判断_1号位没疲劳() then
					显示('角色11没疲劳了跳过执行')
					return false
				end
				
				功能_点击1号位角色()
				if 判断_1号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
	
end
function 角色12()
	设置当前角色序号(12)
	--入口_到选择角色界面()
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 检测角色数量次数 = 0
	local 查找次数 = 0
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			显示('选择12号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 11 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				
				-- 角色12在第3页
				翻页到指定页(3)
				功能_点击2号位角色()
				if 同步跳过无疲劳角色功能() and 判断_2号位没疲劳() then
					显示('角色12没疲劳了跳过执行')
					return false
				end
				
				功能_点击2号位角色()
				if 判断_2号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
	
end
function 角色13()
	设置当前角色序号(13)
	--入口_到选择角色界面()
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			
			显示('选择13号角色')
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 12 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			
			if 判断_选择角色界面疲劳() then
				
				--随机延时(3000 , 3200)
				
				-- 角色13在第3页
				翻页到指定页(3)
				
				功能_点击3号位角色()
				sleep(200)
				if 同步跳过无疲劳角色功能() and 判断_3号位没疲劳() then
					显示('角色13没疲劳了跳过执行')
					return false
					
				else
					
					功能_点击3号位角色()
					if 判断_3号位没角色() then
						最大可选角色 = true
						return false
					end
					if 点击_开始游戏() then
						
						return true
					end
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色14()
	设置当前角色序号(14)
	--入口_到选择角色界面()
	
	local 检测角色数量次数 = 0
	local 首次不等待 = true
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			
			显示('选择14号角色')
			
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 13 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				
				-- 角色14在第3页
				翻页到指定页(3)
				功能_点击4号位角色()
				sleep(200)
				if 同步跳过无疲劳角色功能() and 判断_4号位没疲劳() then
					显示('角色14没疲劳了跳过执行')
					
					return false
				end
				
				功能_点击4号位角色()
				if 判断_4号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
	
end
function 角色15()
	设置当前角色序号(15)
	--入口_到选择角色界面()
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			显示('选择15号角色')
			--检查并重启游戏_超两小时()
			
			等待加载角色()
			
			if 判断_角色数量() == 14 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				-- 角色15在第3页
				
				翻页到指定页(3)
				
				功能_点击5号位角色()
				
				if 同步跳过无疲劳角色功能() and 判断_5号位没疲劳() then
					显示('角色15没疲劳了跳过执行')
					return false
				end
				
				功能_点击5号位角色()
				if 判断_5号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色16()
	设置当前角色序号(16)
	--入口_到选择角色界面()
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			
			显示('选择16号角色')
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 15 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				
				--随机延时(3000 , 3200)
				
				-- 角色16在第4页
				翻页到指定页(4)
				功能_点击1号位角色()
				if 同步跳过无疲劳角色功能() and 判断_1号位没疲劳() then
					显示('角色16没疲劳了跳过执行')
					return false
				end
				
				功能_点击1号位角色()
				if 判断_1号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色17()
	设置当前角色序号(17)
	--入口_到选择角色界面()
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			
			显示('选择17号角色')
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 16 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				
				-- 角色17在第4页
				
				翻页到指定页(4)
				功能_点击2号位角色()
				if 同步跳过无疲劳角色功能() and 判断_2号位没疲劳() then
					显示('角色17没疲劳了跳过执行')
					return false
				end
				
				功能_点击2号位角色()
				if 判断_2号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色18()
	设置当前角色序号(18)
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			显示('选择18号角色')
			--检查并重启游戏_超两小时()
			
			等待加载角色()
			if 判断_角色数量() == 17 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				显示('选择18号角色')
				--随机延时(3000 , 3200)
				-- 角色18在第4页
				翻页到指定页(4)
				功能_点击3号位角色()
				if 同步跳过无疲劳角色功能() and 判断_3号位没疲劳() then
					显示('角色18没疲劳了跳过执行')
					return false
				end
				
				功能_点击3号位角色()
				if 判断_3号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色19()
	显示('选择19号角色')
	设置当前角色序号(19)
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		if 判断_选择角色界面() then
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 18 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				--随机延时(3000 , 3200)
				
				-- 角色19在第4页
				翻页到指定页(4)
				功能_点击4号位角色()
				if 同步跳过无疲劳角色功能() and 判断_4号位没疲劳() then
					显示('角色19没疲劳了跳过执行')
					return false
				end
				
				功能_点击4号位角色()
				if 判断_4号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色20()
	显示('选择20号角色')
	设置当前角色序号(20)
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 19 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				
				--随机延时(3000 , 3200)
				
				翻页到指定页(4)
				功能_点击5号位角色()
				if 同步跳过无疲劳角色功能() and 判断_5号位没疲劳() then
					显示('角色20没疲劳了跳过执行')
					return false
				end
				
				功能_点击5号位角色()
				if 判断_5号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色21()
	显示('选择20号角色')
	设置当前角色序号(21)
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 20 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				
				--随机延时(3000 , 3200)
				
				翻页到指定页(5)
				功能_点击1号位角色()
				if 同步跳过无疲劳角色功能() and 判断_1号位没疲劳() then
					显示('角色20没疲劳了跳过执行')
					return false
				end
				
				功能_点击1号位角色()
				if 判断_1号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
function 角色22()
	显示('选择20号角色')
	设置当前角色序号(22)
	
	local 检测角色数量次数 = 0
	if 最大可选角色 then
		显示('超过可选最大角色结束脚本')
		return false
	end
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			sleep(500)
		end
		首次不等待 = false
		
		if 判断_选择角色界面() then
			
			if 最大可选角色 then
				显示('超过可选最大角色结束脚本')
				return false
			end
			--检查并重启游戏_超两小时()
			等待加载角色()
			
			if 判断_角色数量() == 21 then
				显示('角色数量不足 ')
				检测角色数量次数 = 检测角色数量次数 + 1
				print('检测到当前角色为1次数加'..检测角色数量次数)
				if 检测角色数量次数 > 2 then
					
					最大可选角色 = true
					return false
				else
					goto 标签
				end
			end
			if 判断_选择角色界面疲劳() then
				
				--随机延时(3000 , 3200)
				
				翻页到指定页(5)
				功能_点击2号位角色()
				if 同步跳过无疲劳角色功能() and 判断_2号位没疲劳() then
					显示('角色20没疲劳了跳过执行')
					return false
				end
				
				功能_点击2号位角色()
				if 判断_2号位没角色() then
					最大可选角色 = true
					return false
				end
				if 点击_开始游戏() then
					return true
				end
				
			end
		elseif 清屏_角色扩展栏提示() then
			最大可选角色 = true
			return false
			
		else
			入口_到选择角色界面()
		end
		:: 标签 ::
	end
end
----------------------------------------------------------------------------------------------------------------------------
function 随机执行功能和黑钻深渊()--角色1执行
	
	local 已完成列表 = 读取已完成随机功能和黑钻深渊()
	local 功能id前缀 = "role" .. 角色序号 .. "_"
	
	-- 固定顺序执行（不参与随机，但记录完成状态）
	local 固定功能列表 = {
		{名称 = "塔尔坦功能" , 函数 = function() 同步塔尔坦功能() end} ,
		{名称 = "同步自动设置功能" , 函数 = function() 同步自动设置功能() end} ,
		{名称 = "同步绑定回归活动功能" , 函数 = function() 同步绑定回归活动功能() end} ,
		{名称 = "同步买角色扩展券功能" , 函数 = function() 同步买角色扩展券功能() end} ,
		{名称 = "同步制作深渊门票功能" , 函数 = function() 同步制作深渊门票功能() end} ,
		{名称 = "同步一键存仓功能" , 函数 = function() 同步一键存仓功能() end} ,
	}
	for _ , 功能 in ipairs(固定功能列表) do
		local 功能id = 功能id前缀 .. 功能.名称
		if not 已完成列表[功能id] then
			功能.函数()
			保存已完成随机功能和黑钻深渊(功能id)
			已完成列表[功能id] = true
		end
	end
	
	-- 初始化随机种子
	math.randomseed(os.time() + os.clock() * 1000)
	-- 创建一个包含两个函数的表
	local 功能列表 = {
		
		{名称 = "同步通用功能" , 函数 = function() 同步通用功能勾选状态() end} ,
		{名称 = "黑钻深渊" , 函数 = function() 同步黑钻深渊() end} ,
		{名称 = "每日签到" , 函数 = function() 同步每日签到功能() end} ,
		{名称 = "勇士特训" , 函数 = function() 同步勇士特训功能() end} ,
		{名称 = "同步合卡一次功能" , 函数 = function() 同步合卡一次功能() end} ,
		{名称 = "同步合徽章一次功能" , 函数 = function() 同步合徽章一次功能() end} ,
		{名称 = "同步工会签到功能" , 函数 = function() 同步工会签到功能() end} ,
		{名称 = "排位赛" , 函数 = function() 同步排位赛功能() end} ,
		{名称 = "领疲劳" , 函数 = function() 同步领疲劳功能() end} ,
		{名称 = "小队突袭" , 函数 = function() 同步小队突袭功能() end} ,
		{名称 = "梦幻迷宫功能" , 函数 = function() 同步梦幻迷宫功能() end} ,
		{名称 = "爽玩pk" , 函数 = function() 同步爽玩pk功能() end} ,
		{名称 = "解锁修练" , 函数 = function() 同步解锁修练功能() end} ,
		{名称 = "每日分享" , 函数 = function() 同步每日分享功能() end} ,
		{名称 = "魔界人" , 函数 = function() 同步魔界人功能() end} ,
	}
	
	-- 随机打乱顺序（使用Fisher-Yates洗牌算法）
	local n = #功能列表
	for i = n , 2 , - 1 do
		local j = math.random(i)
		功能列表[i] , 功能列表[j] = 功能列表[j] , 功能列表[i]
	end
	
	-- 执行函数
	for _ , 功能 in ipairs(功能列表) do
		local 功能id = 功能id前缀 .. 功能.名称
		if not 已完成列表[功能id] then
			功能.函数()
			保存已完成随机功能和黑钻深渊(功能id)
			已完成列表[功能id] = true
		end
	end
	
end

function 随机执行通用功能和黑钻深渊()
	同步自动史诗套功能()
	
	local 已完成列表 = 读取已完成随机功能和黑钻深渊()
	local 功能id前缀 = "role" .. 角色序号 .. "_"
	
	-- 固定顺序执行（不参与随机，但记录完成状态）
	local 固定功能列表 = {
		{名称 = "塔尔坦功能" , 函数 = function() 同步塔尔坦功能() end} ,
		{名称 = "同步自动设置功能" , 函数 = function() 同步自动设置功能() end} ,
		{名称 = "同步绑定回归活动功能" , 函数 = function() 同步绑定回归活动功能() end} ,
		{名称 = "同步制作深渊门票功能" , 函数 = function() 同步制作深渊门票功能() end} ,
		{名称 = "同步一键存仓功能" , 函数 = function() 同步一键存仓功能() end} ,
	}
	for _ , 功能 in ipairs(固定功能列表) do
		local 功能id = 功能id前缀 .. 功能.名称
		if not 已完成列表[功能id] then
			功能.函数()
			保存已完成随机功能和黑钻深渊(功能id)
			已完成列表[功能id] = true
		end
	end
	
	-- 初始化随机种子
	math.randomseed(os.time() + os.clock() * 1000)
	-- 创建一个包含两个函数的表
	local 功能列表 = {
		{名称 = "同步通用功能" , 函数 = function() 同步通用功能勾选状态() end} ,
		{名称 = "每日签到" , 函数 = function() 同步每日签到功能() end} ,
		{名称 = "黑钻深渊" , 函数 = function() 同步黑钻深渊() end} ,
		{名称 = "勇士特训" , 函数 = function() 同步勇士特训功能() end} ,
		
	}
	-- 随机打乱顺序
	if math.random(1 , 2) == 1 then
		功能列表[1] , 功能列表[2] = 功能列表[2] , 功能列表[1]
	end
	
	-- 执行函数
	for _ , 功能 in ipairs(功能列表) do
		local 功能id = 功能id前缀 .. 功能.名称
		if not 已完成列表[功能id] then
			功能.函数()
			保存已完成随机功能和黑钻深渊(功能id)
			已完成列表[功能id] = true
		end
	end
end
function 执行副本后固定功能(--[===[角色序号]===])
	同步强制清空疲劳功能()
	local 已完成 = 读取已完成通用功能()
	local 前缀 = "role" .. 角色序号 .. "_"
	local 列表 = {
		{名称 = "领冒险奖励" , 函数 = function() 同步领冒险奖励功能() end} ,
		
		{名称 = "泰拉成就" , 函数 = function() 同步泰拉成就功能() end} ,
		{名称 = "开自选礼袋" , 函数 = function() 同步开自选礼袋功能() end} ,
		{名称 = "自动上架拍卖行" , 函数 = function() 同步自动上架拍卖行功能() end} ,
		
	}
	for _ , 功能 in ipairs(列表) do
		local id = 前缀 .. 功能.名称
		if not 已完成[id] then
			功能.函数()
			保存已完成通用功能(id)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
local function 喵提醒()
	自动穿装备 = 0
	--发送喵提醒_自定义('开始任务')
	同步绑定成长活动功能()
end

local function 执行角色任务()
	if not 角色时间记录 then 角色时间记录 = {} end
	角色时间记录[角色序号] = {开始 = os.time() , 结束 = nil}
	喵提醒()
	随机执行通用功能和黑钻深渊()
	同步自动史诗套功能()
	功能_获取当前角色抗魔值()
	同步执行周常副本()
	同步超越副本功能()
	同步超越副本功能()
	同步一键升至70级功能()
	执行角色副本()
	执行角色副本2()
	执行副本后固定功能()
	角色时间记录[角色序号].结束 = os.time()
	发送喵提醒_自定义 ("结束任务")
end
function 选择角色1()
	--当前角色抗魔值 = nil
	if 读取已完成角色()[1]then
		显示('角色1已完成,跳过')
		return
	end
	
	if not 角色时间记录 then 角色时间记录 = {} end
	角色时间记录[1] = {开始 = os.time() , 结束 = nil}
	
	if 角色1() then
		喵提醒()
		随机执行功能和黑钻深渊()
		同步一键升至70级功能()
		功能_获取当前角色抗魔值()
		同步执行周常副本()
		执行角色副本()
		执行角色副本2()
		执行副本后固定功能()
		
		local 已完成1 = 读取已完成通用功能()
		local 最后列表 = {
			{名称 = "role1_同步活动点券买战令功能" , 函数 = 同步活动点券买战令功能} ,
			{名称 = "role1_领战令奖励" , 函数 = 同步领战令奖励功能} ,
			{名称 = "role1_冒险团邮箱" , 函数 = 同步领取冒险团邮箱功能} ,
			{名称 = "role1_活动点券8万泰" , 函数 = 同步活动点券8万泰功能} ,
			{名称 = "role1_每日成就" , 函数 = 同步每日成就功能} ,
		}
		for _ , v in ipairs(最后列表) do
			if not 已完成1[v.名称] then
				v.函数()
				保存已完成通用功能(v.名称)
			end
		end
		if 角色时间记录 and 角色时间记录[1] then
			角色时间记录[1].结束 = os.time()
		end
		
		发送喵提醒_自定义 ("结束任务")
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色2()
	if 读取已完成角色()[2] then
		显示('角色2已完成,跳过')
		return
	end
	
	if 角色2() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色3()
	if 读取已完成角色()[3] then
		显示('角色3已完成,跳过')
		return
	end
	
	if 角色3() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
end
function 选择角色4()
	if 读取已完成角色()[4] then
		显示('角色4已完成,跳过')
		return
	end
	
	if 角色4() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色5()
	if 读取已完成角色()[ 5] then
		显示('角色5已完成,跳过')
		return
	end
	
	if 角色5() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色6()
	if 读取已完成角色()[6] then
		显示('角色6已完成,跳过')
		return
	end
	
	if 角色6() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色7()
	if 读取已完成角色()[7] then
		显示('角色7已完成,跳过')
		return
	end
	
	if 角色7() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色8()
	if 读取已完成角色()[8] then
		显示('角色8已完成,跳过')
		return
	end
	
	if 角色8() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色9()
	if 读取已完成角色()[9] then
		显示('角色9已完成,跳过')
		return
	end
	
	if 角色9() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色10()
	if 读取已完成角色()[10] then
		显示('角色10已完成,跳过')
		return
	end
	
	if 角色10() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色11()
	if 读取已完成角色()[11] then
		显示('角色11已完成,跳过')
		return
	end
	
	if 角色11() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色12()
	if 读取已完成角色()[12] then
		显示('角色12已完成,跳过')
		return
	end
	
	if 角色12() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色13()
	if 读取已完成角色()[13] then
		显示('角色13已完成,跳过')
		return
	end
	
	if 角色13() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色14()
	if 读取已完成角色()[14] then
		显示('角色14已完成,跳过')
		return
	end
	
	if 角色14() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色15()
	if 读取已完成角色()[15] then
		显示('角色15已完成,跳过')
		return
	end
	
	if 角色15() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色16()
	if 读取已完成角色()[16] then
		显示('角色16已完成,跳过')
		return
	end
	
	if 角色16() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色17()
	
	if 读取已完成角色()[17] then
		显示('角色17已完成,跳过')
		return
	end
	if 角色17() then
		执行角色任务()
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色18()
	if 读取已完成角色()[18] then
		显示('角色18已完成,跳过')
		return
	end
	
	if 角色18() then
		执行角色任务()
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色19()
	if 读取已完成角色()[19] then
		显示('角色19已完成,跳过')
		return
	end
	
	if 角色19() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色20()
	if 读取已完成角色()[20] then
		显示('角色20已完成,跳过')
		return
	end
	
	if 角色20() then
		执行角色任务()
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色21()
	if 读取已完成角色()[21] then
		显示('角色19已完成,跳过')
		return
	end
	
	if 角色21() then
		
		执行角色任务()
		
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
function 选择角色22()
	if 读取已完成角色()[22] then
		显示('角色20已完成,跳过')
		return
	end
	
	if 角色22() then
		执行角色任务()
	end
	保存已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end

