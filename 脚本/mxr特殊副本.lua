-- 检查是否为周三6点以后
function 是否周三六点后()
	local 当前时间 = os.time()
	local 当前日期 = os.date("*t" , 当前时间)
	local 当前小时 = 当前日期.hour
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	local 当前星期 = tonumber(os.date("%w"))
	
	-- 检查是否为周三且6点以后
	if 当前星期 == 3 and 当前小时 >= 6 then
		return true
	end
	
	return false
end
function 是否周二六点后()
	local 当前时间 = os.time()
	local 当前日期 = os.date("*t" , 当前时间)
	local 当前小时 = 当前日期.hour
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	local 当前星期 = tonumber(os.date("%w"))
	
	-- 检查是否为周三且6点以后
	if ( 当前星期 == 2 or 当前星期 == 6 ) and 当前小时 >= 6 then
		return true
	end
	
	return false
end

-- 检查是否为周一6点以后
function 是否周一六点后()
	local 当前时间 = os.time()
	local 当前日期 = os.date("*t" , 当前时间)
	
	local 当前小时 = 当前日期.hour
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	local 当前星期 = tonumber(os.date("%w"))
	
	-- 检查是否为周一且6点以后
	if 当前星期 == 1 and 当前小时 >= 6 then
		return true
	end
	
	return false
end
-- 检查是否为周一或周三6点以后
function 是否周一周三九点后()
	local 当前时间 = os.time()
	local 当前日期 = os.date("*t" , 当前时间)
	local 当前小时 = 当前日期.hour
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	local 当前星期 = tonumber(os.date("%w"))
	
	-- 检查是否为周一或周三且9点以后
	if (当前星期 == 1 or 当前星期 == 3) and 当前小时 >= 9 then
		return true
	end
	
	return false
end

function 是否周一周二六点后()
	local 当前时间 = os.time()
	local 当前日期 = os.date("*t" , 当前时间)
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	local 当前星期 = tonumber(os.date("%w"))
	
	local 当前小时 = 当前日期.hour
	
	-- 检查是否为周一或周2且6点以后
	if (当前星期 == 1 or 当前星期 == 2) and 当前小时 >= 6 then
		return true
	end
	
	return false
end

function 是否周二周四周六九点后()
	local 当前时间 = os.time()
	local 当前日期 = os.date("*t" , 当前时间)
	local 当前星期 = tonumber(os.date("%w"))
	
	-- 世界领主开放时间：周二、周四、周六 9:00-次日1:00
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	
	local 当前小时 = 当前日期.hour
	
	-- 情况1：在周二、周四、周六的9点到23点59分
	if (当前星期 == 2 or 当前星期 == 4 or 当前星期 == 6) and 当前小时 >= 9 then
		return true
	end
	
	-- 情况2：在周三、周五、周日的0点到0点59分（前一天的延续）
	if (当前星期 == 3 or 当前星期 == 5 or 当前星期 == 0) and 当前小时 < 1 then
		return true
	end
	
	return false
end

function 是否周日六点后()
	
	local 当前星期 = tonumber(os.date("%w"))
	-- 检查是否为周日 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	if 当前星期 == 0 then
		return true
	end
	
	return false
end

function 功能_周常自动()
	-- 检查是否为周一6点以后
	if not 是否指定礼拜() then
		
		return
	end
	
	初始化城镇界面2()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	local 进入副本次数 = 0 -- 新增：记录进入副本的次数
	local 已经返回到委托界面 = false -- 新增：标记是否已经从对战界面返友谊赛界面
	
	local 未进入副本时间 = os.time()
	local 进入副本 = false
	local 城镇界面 = false
	local 获取抗魔值 = false
	
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			随机延时(500 , 600)
		end
		首次不等待 = false
		显示('周常二次运行中...')
		if 快速检测游戏状态() then
			显示('检测到游戏闪退，继续执行副本功能')
			未进入副本时间 = os.time()
			-- 不退出，继续执行副本功能
		end
		if 城镇界面 then
			if not 进入副本 then
				if os.time() - 未进入副本时间 > 120 then
					清屏()
					return
				end
				
			end
		end
		
		local 当前时间 = os.time()
		
		if 判断_城镇界面() then
			城镇界面 = true
			-- 离开难度选择界面，清除120秒计时
			if not 获取抗魔值 then
				按下点击({1198 , 638 , 1233 , 676}) --背包
				--按下点击({35 , 29 , 75 , 66}) --头像
			else
				上次城镇判断时间 = 当前时间 -- 更新判断时间
				
				-- 检查是否已经过了足够的间隔时间（10秒）
				if 当前时间 - 上次城镇点击时间 > 10 then
					
					if not 判断_委托_城镇入口() then
						return
					end
					
					判断_委托界面超时()
					
				else
					显示('城镇界面操作冷却中，跳过...')
					
				end
			end
			
		elseif 判断_打开背包界面() then --判断_角色信息界面()
			
			if not 获取抗魔值 then
				
				local 新抗魔值 = 判断_抗魔值()
				
				if 新抗魔值 then
					if 当前角色抗魔值 == nil or 新抗魔值 > 当前角色抗魔值 then
						当前角色抗魔值 = 新抗魔值
						显示('当前角色抗魔值更新为:' .. 当前角色抗魔值)
					else
						显示('当前角色抗魔值保留更大值:' .. 当前角色抗魔值)
					end
					
					if 当前角色抗魔值 < 65000 then
						显示('抗魔值不足')
						清屏(true)
						return
					end
					获取抗魔值 = true
				else
					显示('未能识别到抗魔值')
				end
				
			else
				清屏(true)
			end
			
		elseif 判断_委托界面() then
			
			if 判断_当前委托() then
				随机延时(1000 , 1500)
				
			elseif 判断_周常入口() then
				随机延时(1000 , 1500)
				if 判断_周常不可入场() then
					显示('周常不可入场')
					初始化城镇界面()
					return
				end
				if 当前角色抗魔值 >= 6500 and 当前角色抗魔值 < 114000 then
					按下点击({821 , 284 , 1189 , 378}) --4
					
				elseif 当前角色抗魔值 >= 114000 and 当前角色抗魔值 < 142000 then
					按下点击({243 , 300 , 672 , 370})
					
				elseif 当前角色抗魔值 >= 142000 and 当前角色抗魔值 < 152000 then
					按下点击({803 , 156 , 1209 , 226})
				elseif 当前角色抗魔值 >= 152000 then
					按下点击({237 , 148 , 677 , 218})
					
				end
			else
				显示('周常入口未开')
				return
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
		elseif 判断_周常选择难度界面() then
			-- 开始计时120秒超时检测
			if 进入副本次数 >= 2 or 判断_周常不可入场() then
				初始化城镇界面()
				return
				
			end
			
			if 入口_前往可入场_入场() then
				随机延时(1000 , 2000)
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			
		elseif 判断_副本中() then
			进入副本 = true
			if 已经返回到委托界面 then
				进入副本次数 = 进入副本次数 + 1
				已经返回到委托界面 = false -- 重置标记
				显示('第' .. 进入副本次数 .. '次进入副本')
			end
			
			自动刷图()
			
		elseif 入口_确认(true) then
			随机延时(1000 , 2000)
		elseif 判断_装备修理()then
			
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			
			while true do
				sleep(1000)
				显示('退出周常二次运行中...')
				if 判断_委托界面() or 判断_城镇界面() or 检测游戏是否闪退() or 判断_副本中() then
					break
				elseif 判断_返回城镇() then
					功能_返回城镇界面获取疲劳值()
					入口_返回城镇()
				else
					清屏(true)
				end
				
			end
			
		else
			
			显示('加载中...')
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				随机延时(500 , 1000)
			else
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			end
		end
		
	end
	
end

function 功能_周常索拉()
	if not 是否指定礼拜() then
		
		return
	end
	初始化城镇界面2()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	local 进入副本次数 = 0 -- 新增：记录进入副本的次数
	local 已经返回到委托界面 = false -- 新增：标记是否已经从对战界面返友谊赛界面
	
	local 未进入副本时间 = os.time()
	local 进入副本 = false
	local 城镇界面 = false
	local 获取抗魔值 = false
	
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			随机延时(500 , 600)
		end
		首次不等待 = false
		显示('周常二次运行中...')
		if 快速检测游戏状态() then
			显示('检测到游戏闪退，继续执行副本功能')
			未进入副本时间 = os.time()
			-- 不退出，继续执行副本功能
		end
		if 城镇界面 then
			if not 进入副本 then
				if os.time() - 未进入副本时间 > 120 then
					清屏()
					return
				end
				
			end
		end
		
		local 当前时间 = os.time()
		
		if 判断_城镇界面() then
			城镇界面 = true
			
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				
				if not 判断_委托_城镇入口() then
					return
				end
				
				判断_委托界面超时()
				
			else
				显示('城镇界面操作冷却中，跳过...')
				
			end
			
		elseif 判断_委托界面() then
			
			if 判断_当前委托() then
				随机延时(1000 , 1500)
				
			elseif 判断_周常入口() then
				随机延时(1000 , 1500)
				if 判断_周常不可入场() then
					显示('周常不可入场')
					--初始化城镇界面()
					return
				end
				
				按下点击({829 , 284 , 1211 , 376})
				
			else
				显示('周常入口未开')
				return
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
		elseif 判断_周常选择难度界面() then
			-- 开始计时120秒超时检测
			if 进入副本次数 >= 2 or 判断_周常不可入场() then
				初始化城镇界面()
				return
				
			end
			
			if 入口_前往可入场_入场() then
				随机延时(1000 , 2000)
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			
		elseif 判断_副本中() then
			进入副本 = true
			if 已经返回到委托界面 then
				进入副本次数 = 进入副本次数 + 1
				已经返回到委托界面 = false -- 重置标记
				显示('第' .. 进入副本次数 .. '次进入副本')
			end
			
			自动刷图()
			
		elseif 入口_确认(true) then
			随机延时(1000 , 2000)
		elseif 判断_装备修理()then
			
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			
			while true do
				sleep(1000)
				显示('退出周常二次运行中...')
				if 判断_委托界面() or 判断_城镇界面() or 检测游戏是否闪退() or 判断_副本中() then
					break
				elseif 判断_返回城镇() then
					功能_返回城镇界面获取疲劳值()
					入口_返回城镇()
				else
					清屏(true)
				end
				
			end
			
		else
			
			显示('加载中...')
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				随机延时(500 , 1000)
			else
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			end
		end
		
	end
	
end

function 功能_梦幻迷宫()
	
	if not 是否周一六点后() then
		显示('当前不是周一6点后，跳过觉醒:梦幻迷宫')
		return
	end
	local 冷却点击 = 0
	
	local 未找到梦幻迷宫界面开始时间 = os.time()
	local 未找到梦幻迷宫界面 = false
	
	local 城镇界面 = false
	
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			随机延时(700 , 800)
		end
		首次不等待 = false
		显示('梦幻迷宫运行中...')
		if 快速检测游戏状态() then
			显示('检测到游戏闪退，继续执行副本功能')
			未找到梦幻迷宫界面开始时间 = os.time()
			-- 不退出，继续执行副本功能
		end
		if 城镇界面 then
			if os.time() - 未找到梦幻迷宫界面开始时间 > 60 then
				if not 未找到梦幻迷宫界面 then
					return
				end
				
			end
		end
		
		local 当前时间 = os.time()
		
		if 判断_城镇界面() and not 判断_返回城镇_主城() then
			城镇界面 = true --城镇界面开始计时
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if os.time() - 冷却点击 > 10 then
				
				按下点击({1206 , 355 , 1240 , 404})--工会
				
				随机延时(2000 , 2500)
				冷却点击 = os.time()
			else
				显示('梦幻迷宫城镇界面操作冷却中，跳过...')
				随机延时(2000 , 3000)
			end
		elseif 判断_工会界面() then
			
			随机延时(600 , 1200)
			if 判断_工会首页 () then
				随机延时(600 , 1200)
			end
			按下点击({818 , 297 , 1212 , 380})--觉醒梦幻迷宫
			
		elseif 判断_梦幻迷宫界面() then
			未找到梦幻迷宫界面 = true
			if 判断_委托不可入场() then
				
				初始化城镇界面()
				return
			end
			
			按下点击({1064 , 633 , 1227 , 673})--移动到工会大厅
			随机延时(3000 , 4000)
			if 入口_确认() then
				随机延时(2000 , 3000)
			end
			
		elseif 判断_副本中() then
			
			自动刷图()
			
		elseif 入口_确认(true) then
			随机延时(1000 , 2000)
		elseif 判断_装备修理()then
			
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			
			初始化城镇界面()
			
			return
			
		else
			
			显示('加载中...')
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				随机延时(500 , 1000)
			else
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			end
		end
		
	end
	
end

function 功能_迷宫奖励()
	
	if not 是否周一周三九点后() then
		显示('当前不是周一周三6点后，跳过执行')
		return
	end
	
	local 功能开始时间 = os.time()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	
	local 城镇界面 = false
	
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			随机延时(700 , 800)
		end
		首次不等待 = false
		快速检测游戏状态()
		if 城镇界面 then
			print('------------------开始计时----------------')
			if os.time() - 未进入副本开始时间 > 120 then
				
				if not 已进入副本 then
					
					return
				end
			end
			
		end
		local 当前时间 = os.time()
		
		if 判断_城镇界面() then
			-- 离开难度选择界面，清除120秒计时
			城镇界面 = true
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				
				按下点击({1206 , 355 , 1240 , 404})--工会
				随机延时(2500 , 3000)
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			else
				显示('迷宫城镇界面操作冷却中，跳过...')
				随机延时(2000 , 3000)
			end
		elseif 判断_判断_工会界面() then
			随机延时(600 , 1200)
			if 判断_工会首页 () then
				随机延时(1500 , 2000)
			end
			按下点击({962 , 153 , 1234 , 253})--梦幻迷宫奖励
			
		elseif 判断_梦幻迷宫界面() then
			随机延时(600 , 1200)
			按下点击({896 , 254 , 1135 , 502})--发送点赞获得奖励
			随机延时(1500 , 2500)
			按下点击({854 , 573 , 1041 , 616})--发送点赞
			随机延时(1500 , 2500)
		elseif 入口_确认() then
			随机延时(600 , 1200)
			清屏()
			break
		else
			显示('迷宫奖励功能运行中')
			
			if 清屏(true) then
				随机延时(500 , 600)
			end
			
		end
		
	end
end

function 功能_世界领主()
	
	if not 是否周二周四周六九点后() then
		显示('世界领主未到开放时间')
		return
	end
	初始化城镇界面()
	
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	
	local 未进入副本开始时间 = os.time() -- 新增：记录函数开始时间，用于40秒超时检测
	local 已进入副本 = false -- 新增：标记是否已经进入副本
	
	local 城镇界面 = false
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			随机延时(700 , 800)
		end
		首次不等待 = false
		快速检测游戏状态()
		显示("世界领主运行中")
		local 当前时间 = os.time()
		
		if os.time() - 未进入副本开始时间 > 120 then
			
			if not 已进入副本 then
				初始化城镇界面()
				return
			end
		end
		
		if 判断_城镇界面() then
			
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				显示('执行城镇界面操作')
				if not 判断_委托_城镇入口() then
					
					return
				end
				判断_委托界面超时()
				
			else
				显示('世界领主:城镇界面操作冷却中，跳过...')
			end
		elseif 判断_委托界面() then
			-- 离开难度选择界面，清除40秒计时
			随机延时(600 , 700)
			if 判断_当前委托() then
				
			elseif 判断_限时未选中_委托() then
				
			elseif 判断_委托不可入场() then
				初始化城镇界面()
				return
			else
				按下点击({1058 , 648 , 1230 , 690})--入场
				随机延时(2000 , 2500)
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			
		elseif 入口_确认(true) then
			
		elseif 判断_加载界面() then
			
		elseif 判断_返回城镇() then
			-- 在返回城镇界面检测疲劳值
			随机延时(300 , 500)
			-- 机械牛：每次通关后直接返回城镇
			入口_返回城镇()
			初始化城镇界面()
			return
		elseif 判断_副本中() then
			-- 成功进入副本，标记已进入副本状态
			已进入副本 = true
			自动刷图团本()
			
		elseif 判断_装备修理()then
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
			随机延时(500 , 1000)
			
		else
			
			-- 离开难度选择界面，清除40秒计时
			
			显示('世界领主:加载中...')
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			else
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			end
		end
	end
	
end

function 功能_降临奥兹玛()
	--[===[if not 是否周一周二六点后() then
		
		return
	end]===]
	初始化城镇界面()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	local 检测超时清屏 = os.time()
	local 总运行时间 = os.time()
	local 选择难度 = false
	local 首次不等待 = true
	local 团本结束 = false
	local 投票结束 = false
	while true do
		
		if not 首次不等待 then
			随机延时(1000 , 1500)
		end
		首次不等待 = false
		local 当前时间 = os.time()
		if 快速检测游戏状态() then
			上次城镇点击时间 = 0
		end
		if os.time() - 总运行时间 > 1800 then
			显示("超时3小时结束团本")
			关闭(地下城)
			快速检测游戏状态()
			return
			
		end
		
		if 判断_城镇界面() then
			print('判断_城镇界面')
			城镇界面 = true
			
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				显示('执行城镇界面操作')
				if not 判断_委托_城镇入口() then
					
					return
				end
				随机延时(2500 , 3000)
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			else
				显示('奥兹玛:城镇界面操作冷却中，跳过...')
			end
			检测超时清屏 = os.time()
		elseif 判断_委托界面() then
			-- 离开难度选择界面，清除40秒计时
			print('判断_委托界面')
			if 判断_过往委托() then
				
			elseif 判断_团队模式_入口() then
				
			elseif not 选择难度 then
				if 同步攻坚功能() then
					if 判断_攻坚奥兹玛() then
						选择难度 = true
						sleep(1000)
					else
						显示('未能识别到奥兹玛结束此功能')
						sleep(1000)
						清屏(true)
						return
					end
				else
					if 判断_降临奥兹玛() then
						选择难度 = true
						sleep(1000)
					else
						显示('未能识别到奥兹玛结束此功能')
						sleep(1000)
						清屏(true)
						return
					end
					
				end
			elseif 选择难度 then
				
				if not 同步攻坚勾选状态() then
					按下点击({352 , 78 , 406 , 108}) --困难
					随机延时(300 , 500)
				end
				
				if 判断_团队模式_不可入场() then
					清屏(true)
					return
				else
					按下点击({1107 , 650 , 1224 , 688})--入场
					随机延时(1000 , 1500)
				end
				
			end
			
			检测超时清屏 = os.time()
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			
		elseif 入口_确认(true) then
			print('入口_确认')
			随机延时(400 , 500)
			检测超时清屏 = os.time()
		elseif 判断_团本等候室() then
			print('判断_团本等候室')
			
			随机延时(400 , 500)
			if 判断_初探_团本() then
				初始化城镇界面()
				return
			end
			if not 团本结束 then
				按下点击({1107 , 639 , 1241 , 683}) --快速匹配
			else
				初始化城镇界面()
				return
			end
			
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_团本攻坚队() then
			print('判断_团本攻坚队')
			随机延时(400 , 500)
			if 判断_初探_团本() then
				初始化城镇界面()
				return
			end
			if 判断_团本准备() then
				随机延时(1000 , 1500)
				
			elseif 判断_团本组队界面_开始() then
				清屏(true)
			end
			检测超时清屏 = os.time()
		elseif 判断_加载界面() then
			
		elseif 判断_返回战斗记录界面() or 清屏_点击关闭_伤害结算() then
			随机延时(1000 , 1500)
			团本结束 = true
			while true do
				sleep(1000)
				if 判断_城镇界面() or 检测游戏是否闪退() then
					return
				elseif 判断_退出奥兹玛_阶段开始界面() then
					
				elseif 清屏_点击关闭_伤害结算() then
					
				elseif 判断_返回战斗记录界面() then
					
				else
					清屏(true)
				end
			end
			检测超时清屏 = os.time()
		elseif 判断_副本中() then
			-- 成功进入副本，标记已进入副本状态
			已进入副本 = true
			自动刷图团本()
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_团本甲板() then
			if 投票结束 then
				按下点击({1043 , 33 , 1062 , 53})
			else
				滑动(202 , 523 , 209 , 659 , 5 , 5 , {10 , 15} , {400 , 600})
			end
			
		elseif 判断_同意投票_团本() then
			投票结束 = true
		else
			显示('团本加载中.....')
			if os.time() - 检测超时清屏 > 10 or 团本结束 then
				清屏(true)
				检测超时清屏 = os.time()
			end
			
		end
		
	end
	
end

function 功能_降临罗特斯()
	if not 是否周一周二六点后() then
		
		return
	end
	初始化城镇界面()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	local 检测超时清屏 = os.time()
	local 找到副本 = false
	local 未找到副本 = os.time()
	local 总运行时间 = os.time()
	local 选择难度 = false
	local 首次不等待 = true
	local 团本结束 = false
	local 投票结束 = false
	while true do
		显示("罗特斯运行中")
		if not 首次不等待 then
			随机延时(1000 , 1500)
		end
		首次不等待 = false
		local 当前时间 = os.time()
		if 快速检测游戏状态() then
			上次城镇点击时间 = 0
		end
		
		if os.time() - 总运行时间 > 1800 then
			显示('倒计时:'..os.time() - 总运行时间.."结束团本")
			关闭(地下城)
			快速检测游戏状态()
			return
		end
		
		if 判断_城镇界面() then
			
			城镇界面 = true
			
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				显示('执行城镇界面操作')
				if not 判断_委托_城镇入口() then
					
					return
				end
				随机延时(2500 , 3000)
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			else
				显示('世界领主:城镇界面操作冷却中，跳过...')
			end
			检测超时清屏 = os.time()
			
		elseif 判断_返回战斗记录界面() or 清屏_点击关闭_伤害结算() then
			随机延时(1000 , 1500)
			团本结束 = true
			检测超时清屏 = os.time()
			while true do
				print('退出团本循环中')
				if 判断_城镇界面() or 检测游戏是否闪退() then
					return
				elseif 判断_退出奥兹玛_阶段开始界面() then
					
				elseif 清屏_点击关闭_伤害结算() then
					
				elseif 判断_返回战斗记录界面() then
					
				else
					清屏(true)
				end
				sleep(1000)
			end
			
		elseif 判断_委托界面() then
			-- 离开难度选择界面，清除40秒计时
			
			if 判断_过往委托() then
				
			elseif 判断_团队模式_入口() then
				
			elseif not 选择难度 then
				
				if 同步攻坚功能() then
					if 判断_攻坚罗特斯() then
						选择难度 = true
						sleep(1000)
					else
						显示('未能识别到罗特斯结束此功能')
						sleep(1000)
						清屏(true)
						return
					end
				else
					if 判断_降临罗特斯() then
						选择难度 = true
						sleep(1000)
					else
						显示('未能识别到罗特斯结束此功能')
						sleep(1000)
						清屏(true)
						return
					end
					
				end
				
			elseif 选择难度 then
				if 判断_团队模式_不可入场() then
					显示('不可入场')
					清屏(true)
					return
				else
					按下点击({1107 , 650 , 1224 , 688})--入场
					随机延时(1000 , 1500)
				end
				
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			检测超时清屏 = os.time()
		elseif 入口_确认(true) then
			随机延时(400 , 500)
			检测超时清屏 = os.time()
		elseif 判断_团本等候室() then
			随机延时(400 , 500)
			
			if 判断_初探_团本() then
				初始化城镇界面()
				return
			end
			if not 团本结束 then
				按下点击({1107 , 639 , 1241 , 683}) --快速匹配
			else
				初始化城镇界面()
				return
			end
			
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_团本攻坚队() then
			随机延时(400 , 500)
			if 判断_初探_团本() then
				初始化城镇界面()
				return
			end
			if 判断_团本准备() then
				随机延时(1000 , 1500)
			elseif 判断_团本组队界面_开始() then
				清屏(true)
			end
			
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_加载界面() then
			检测超时清屏 = os.time()
			
		elseif 判断_副本中() then
			-- 成功进入副本，标记已进入副本状态
			已进入副本 = true
			自动刷图团本()
			print('退出自动刷图了')
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_团本甲板() then
			
			if 投票结束 then
				按下点击({1046 , 35 , 1058 , 51})
			else
				滑动(202 , 523 , 209 , 659 , 5 , 5 , {10 , 15} , {400 , 600})
				
			end
			
		elseif 判断_同意投票_团本() then
			投票结束 = true
		elseif 清屏_X() then
			
		else
			显示('团本加载中.....')
			if os.time() - 检测超时清屏 > 10 or 团本结束 then
				清屏(true)
				检测超时清屏 = os.time()
			end
			
		end
		
	end
	
end
function 功能_安图恩()
	
	if not 是否周一周二六点后() then
		
		return
	end
	初始化城镇界面()
	local 冷却点击 = 0
	local 检测超时清屏 = os.time()
	local 总运行时间 = os.time()
	local 团本结束 = false
	local 首次运行 = true
	local 投票结束 = false
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('安图恩运行中...')
		if 快速检测游戏状态() then
			冷却点击 = 0
			总运行时间 = os.time()
		end
		if os.time() - 总运行时间 > 600 then
			显示('团本运行超时')
			关闭(地下城)
			快速检测游戏状态()
			return
		end
		
		if 判断_城镇界面() then
			print('判断_城镇界面')
			城镇界面 = true
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if os.time() - 冷却点击 > 10 then
				显示('执行城镇界面操作')
				if not 判断_委托_城镇入口() then
					
					return
				end
				
			else
				显示('安图恩:城镇界面操作冷却中，跳过...')
			end
			检测超时清屏 = os.time()
		elseif 判断_委托界面() then
			-- 离开难度选择界面，清除40秒计时
			print('判断_委托界面')
			if 判断_过往委托() then
				
			elseif 判断_团队模式_入口() then
				
			elseif 判断_安图恩已选中() then
				随机延时(1000 , 1500)
				按下点击({464 , 78 , 530 , 106}) --困难
				随机延时(500 , 600)
				if 判断_团队模式_不可入场() then
					清屏(true)
					return
				else
					按下点击({1107 , 650 , 1224 , 688})--入场
					随机延时(1000 , 1500)
				end
				
			else
				显示('未能识别到奥兹玛结束此功能')
				sleep(1000)
				清屏(true)
				return
			end
			
			检测超时清屏 = os.time()
			冷却点击 = os.time()
		elseif 入口_确认(true) then
			print('入口_确认')
			随机延时(400 , 500)
			检测超时清屏 = os.time()
		elseif 判断_团本等候室() then
			print('判断_团本等候室')
			随机延时(400 , 500)
			if not 团本结束 then
				按下点击({1107 , 639 , 1241 , 683}) --快速匹配
			else
				初始化城镇界面()
				return
			end
			
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_团本攻坚队() then
			print('判断_团本攻坚队')
			if 判断_团本准备() then
				随机延时(1000 , 1500)
				
			elseif 判断_团本组队界面_开始() then
				清屏(true)
			end
			总运行时间 = os.time()
			检测超时清屏 = os.time()
		elseif 判断_加载界面() then
			
		elseif 判断_返回战斗记录界面() or 清屏_点击关闭_伤害结算() then
			随机延时(1000 , 1500)
			团本结束 = true
			--[===[	while true do
			sleep(1000)
			if 判断_城镇界面() or 检测游戏是否闪退() then
			return
			elseif 判断_退出奥兹玛_阶段开始界面() then
			
			elseif 清屏_点击关闭_伤害结算() then
			
			elseif 判断_返回战斗记录界面() then
			
			else
			清屏(true)
			end
			end]===]
			检测超时清屏 = os.time()
		elseif 判断_副本中() then
			-- 成功进入副本，标记已进入副本状态
			已进入副本 = true
			返回(4)
			检测超时清屏 = os.time()
			总运行时间 = os.time()
		elseif 判断_团本甲板() then
			if 投票结束 then
				按下点击({1044 , 32 , 1063 , 53})
			else
				滑动(202 , 523 , 209 , 659 , 5 , 5 , {10 , 15} , {400 , 600})
			end
			
			检测超时清屏 = os.time()
			
		elseif 判断_同意投票_团本() then
			投票结束 = true
		elseif 清屏_X() then
			
		else
			显示('团本加载中.....')
			if os.time() - 检测超时清屏 > 10 or 团本结束 then
				清屏(true)
				检测超时清屏 = os.time()
			end
			
		end
		
	end
	
end

function 功能_灾难副本()
	if not 是否周日六点后() then
		显示('当前不是周日点后，跳过雷龙')
		return
	end
	初始化城镇界面()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	local 总运行时间 = os.time()
	local 可入场 = false
	local 首次不等待 = true
	while true do
		if not 首次不等待 then
			随机延时(700 , 800)
		end
		首次不等待 = false
		显示('雷龙运行中...')
		if 快速检测游戏状态() then
			显示('检测到游戏闪退，继续执行副本功能')
			
		end
		if os.time() - 总运行时间 > 90 then
			显示('雷龙运行超时...')
			return
		end
		local 当前时间 = os.time()
		
		if 判断_城镇界面() then
			
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				if not 判断_委托_城镇入口() then
					
					return
				end
				判断_委托界面超时()
			else
				显示('雷龙城镇界面操作冷却中，跳过...')
				
			end
		elseif 判断_委托界面() then
			
			随机延时(600 , 1200)
			
			if 判断_委托界面() then
				
				if 判断_当前委托() then
					
				elseif 判断_特殊入口() then
					
				elseif 同步灾难副本选择() then
					
				else
					显示('未找到想打的灾难副本')
					初始化城镇界面()
					return
				end
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
		elseif 判断_灾难副本选择难度界面() then
			
			if 判断_委托不可入场() then
				初始化城镇界面()
				return
				
			end
			同步灾难副本难度选择()
			
			if 入口_前往可入场_入场() then
				随机延时(2000 , 2500)
				
			end
			
		elseif 判断_副本中() then
			
			自动刷图团本()
			总运行时间 = os.time()
		elseif 入口_确认(true) then
			随机延时(1000 , 2000)
		elseif 判断_装备修理()then
			
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			初始化城镇界面()
			return
			
		else
			
			显示('加载中...')
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				随机延时(500 , 1000)
			else
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			end
		end
		
	end
end
function 功能_小队突袭()
	
	if not 是否周日六点后() then
		显示('当前不是周日点后，跳过小队突袭')
		return
	end
	local 总运行时间 = os.time()
	local 可入场 = false
	local 首次不等待 = true
	local 已入场 = false
	local 已入场次数 = 0
	local 已编队 = false
	while true do
		if not 首次不等待 then
			随机延时(800 , 900)
		end
		首次不等待 = false
		显示('小队突袭运行中...')
		if 快速检测游戏状态() then
			显示('检测到游戏闪退，继续执行副本功能')
			总运行时间 = os.time()
		end
		
		if os.time() - 总运行时间 > 50 then
			显示('小队突袭运行超时...')
			return
		end
		
		if 判断_城镇界面() then
			
			if not 判断_委托_城镇入口() then
				
				return
			else
				判断_委托界面超时()
			end
			
		elseif 判断_委托界面() then
			随机延时(800 , 900)
			if 判断_委托界面() then
				
				if 判断_当前委托() then
					
				elseif 判断_特殊入口() then
					
				elseif 判断_小队突袭() then
					
				else
					显示('未找到想打的灾难副本')
					初始化城镇界面()
					return
				end
			end
			
		elseif 判断_副本中() then
			
			自动刷图团本()
			总运行时间 = os.time()
			已入场 = true
		elseif 判断_打开小队突袭界面() then
			随机延时(500 , 600)
			if 已入场 then
				已入场次数 = 已入场次数 + 1
				if 已入场次数 >= 4 then
					显示('已达到入场次数')
					清屏(true)
					return
				end
			end
			if not 判断_进入小队突袭() then
				if not 已编队 then
					
					if not 判断_远征队编队() then
						已编队 = true
					end
					
				elseif 判断_不可入场_灰色() then
					清屏(true)
					return
				else
					按下点击({1102 , 641 , 1235 , 684}) --入场
					
				end
				
			end
			
		elseif 判断_打开选择远征队界面() then
			
			按下点击({769 , 579 , 906 , 616}) --自动远征队
			随机延时(500 , 600)
			按下点击({962 , 579 , 1103 , 619}) --完成编队
			总运行时间 = os.time()
		elseif 入口_确认(true) then
			
		elseif 判断_装备修理()then
			
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			初始化城镇界面()
			return
		elseif 判断_加载界面() then
			
		else
			
			显示('加载中...')
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				随机延时(500 , 1000)
			else
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			end
		end
		
	end
end
function 判断_抗魔值不足_超越()
	local x = - 1
	local y = - 1
	x , y = findMultiColor(814 , 295 , 1002 , 331 , "e60400-202020" , "" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
	end
	return false
end
function 功能_超进化火山带()
	if not 超越是否指定礼拜() then
		显示('超越副本未到指定礼拜跳过执行')
		return
	end
	初始化城镇界面()
	local 简单不可入场 = false
	local 困难不可入场 = false
	local 挑战不可入场 = false
	local 难度选择 = 同步超越难度选择功能()
	local 冷却点击 = 0
	local 运行时间 = os.time()
	local 首次等待 = true
	local 找到超越入口 = false
	local 已选难度 = false
	while true do
		显示('70级超越副本运行中...')
		if not 首次等待 then
			随机延时(700 , 800)
		end
		首次等待 = false
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if os.time() - 运行时间 > 600 then
			显示('超越副本运行超时...')
			初始化城镇界面()
			return
		end
		
		if 判断_城镇界面() then
			local 当前疲劳值 = 功能_获取疲劳值()
			if 当前疲劳值 < 40 then
				显示('疲劳值不足40')
				return
			end
			
			if os.time() - 冷却点击 > 10 then
				
				if not 判断_委托_城镇入口() then
					
					return
				else
					判断_委托界面超时()
				end
			else
				显示('点击冷却中')
				
			end
		elseif 判断_委托界面() then
			
			if 判断_过往委托() then
				
			elseif 判断_超越地下城_入口() == '选中' then
				
				if not 判断_超进化火山带() then
					显示('未识别到超进化火山带')
					初始化城镇界面()
					return
				end
				
				找到超越入口 = true
			elseif 判断_超越地下城_入口() == '入口' then
				找到超越入口 = true
			else
				if not 找到超越入口 then
					显示("未找到超越入口")
					初始化城镇界面()
					return
				end
				
			end
			
			冷却点击 = os.time()
			
		elseif 判断_难度选择界面() then
			
			if 判断_委托不可入场() then
				return
			else
				
				if not 已选难度 then
					
					if 难度选择 == "简单" then
						
						按下点击({83 , 630 , 104 , 653})
						简单不可入场 = true
					elseif 难度选择 == "困难" then
						按下点击({183 , 625 , 222 , 656})
						困难不可入场 = true
					elseif 难度选择 == "挑战" then
						按下点击({298 , 622 , 343 , 657})
						挑战不可入场 = true
					else
						print('未获取到难度值')
					end
					已选难度 = true
				elseif 判断_抗魔值不足_超越() then
					
					if not 简单不可入场 then
						按下点击({83 , 630 , 104 , 653})
						随机延时(600 , 800)
						按下点击({83 , 630 , 104 , 653})
						简单不可入场 = true
					elseif not 困难不可入场 then
						按下点击({183 , 625 , 222 , 656})
						随机延时(600 , 800)
						按下点击({183 , 625 , 222 , 656})
						困难不可入场 = true
					elseif not 挑战不可入场 then
						按下点击({298 , 622 , 343 , 657})
						随机延时(600 , 800)
						按下点击({298 , 622 , 343 , 657})
						挑战不可入场 = true
					else
						显示('所有难度都不可入场')
						初始化城镇界面()
						return
						
					end
					
				else
					按下点击({1136 , 648 , 1230 , 672})--入场
					随机延时(1800 , 2500)
				end
				
			end
		elseif 判断_副本中() then
			自动刷图()
			
		elseif 判断_返回城镇() then
			功能_返回城镇界面获取疲劳值()
			
			初始化城镇界面()
			
			return
		elseif 入口_确认(true) then
			
		else
			清屏(true)
			
		end
		
	end
	
end
function 功能_超视界藏匿处()
	if not 超越是否指定礼拜() then
		显示('超越副本未到指定礼拜跳过执行')
		return
	end
	初始化城镇界面()
	local 简单不可入场 = false
	local 困难不可入场 = false
	local 挑战不可入场 = false
	local 难度选择 = 同步超越难度选择功能()
	local 冷却点击 = 0
	local 运行时间 = os.time()
	local 首次等待 = true
	local 找到超越入口 = false
	local 已选难度 = false
	while true do
		显示('超越副本运行中...')
		if not 首次等待 then
			随机延时(700 , 800)
		end
		首次等待 = false
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if os.time() - 运行时间 > 600 then
			显示('超越副本运行超时...')
			初始化城镇界面()
			return
		end
		
		if 判断_城镇界面() then
			local 当前疲劳值 = 功能_获取疲劳值()
			if 当前疲劳值 < 40 then
				显示('疲劳值不足40')
				return
			end
			
			if os.time() - 冷却点击 > 10 then
				
				if not 判断_委托_城镇入口() then
					
					return
				else
					判断_委托界面超时()
				end
			else
				显示('点击冷却中')
				
			end
		elseif 判断_委托界面() then
			
			if 判断_过往委托() then
				
			elseif 判断_超越地下城_入口() == '选中' then
				
				if not 判断_超视界藏匿处() then
					显示('未识别到超视界藏匿处')
					初始化城镇界面()
					return
				end
				
				找到超越入口 = true
			elseif 判断_超越地下城_入口() == '入口' then
				找到超越入口 = true
			else
				if not 找到超越入口 then
					显示("未找到超越入口")
					初始化城镇界面()
					return
				end
				
			end
			
			冷却点击 = os.time()
			
		elseif 判断_难度选择界面() then
			
			if 判断_委托不可入场() then
				return
			else
				
				if not 已选难度 then
					
					if 难度选择 == "简单" then
						
						按下点击({83 , 630 , 104 , 653})
						简单不可入场 = true
					elseif 难度选择 == "困难" then
						按下点击({183 , 625 , 222 , 656})
						困难不可入场 = true
					elseif 难度选择 == "挑战" then
						按下点击({298 , 622 , 343 , 657})
						挑战不可入场 = true
					else
						print('未获取到难度值')
					end
					已选难度 = true
				elseif 判断_抗魔值不足_超越() then
					
					if not 简单不可入场 then
						按下点击({83 , 630 , 104 , 653})
						随机延时(600 , 800)
						按下点击({83 , 630 , 104 , 653})
						简单不可入场 = true
					elseif not 困难不可入场 then
						按下点击({183 , 625 , 222 , 656})
						随机延时(600 , 800)
						按下点击({183 , 625 , 222 , 656})
						困难不可入场 = true
					elseif not 挑战不可入场 then
						按下点击({298 , 622 , 343 , 657})
						随机延时(600 , 800)
						按下点击({298 , 622 , 343 , 657})
						挑战不可入场 = true
					else
						显示('所有难度都不可入场')
						初始化城镇界面()
						return
						
					end
					
				else
					按下点击({1136 , 648 , 1230 , 672})--入场
					随机延时(1800 , 2500)
				end
				
			end
			
		elseif 判断_副本中() then
			自动刷图()
			
		elseif 判断_返回城镇() then
			功能_返回城镇界面获取疲劳值()
			
			初始化城镇界面()
			
			return
		elseif 入口_确认(true) then
			
		else
			清屏(true)
			
		end
		
	end
	
end
function 功能_超负荷发电站()
	if not 超越是否指定礼拜() then
		显示('超越副本未到指定礼拜跳过执行')
		return
	end
	初始化城镇界面()
	local 简单不可入场 = false
	local 困难不可入场 = false
	local 挑战不可入场 = false
	local 难度选择 = 同步超越难度选择功能()
	local 冷却点击 = 0
	local 运行时间 = os.time()
	local 首次等待 = true
	local 找到超越入口 = false
	local 已选难度 = false
	while true do
		显示('超越副本运行中...')
		if not 首次等待 then
			随机延时(700 , 800)
		end
		首次等待 = false
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if os.time() - 运行时间 > 600 then
			显示('超越副本运行超时...')
			初始化城镇界面()
			return
		end
		
		if 判断_城镇界面() then
			local 当前疲劳值 = 功能_获取疲劳值()
			if 当前疲劳值 < 40 then
				显示('疲劳值不足40')
				return
			end
			
			if os.time() - 冷却点击 > 10 then
				
				if not 判断_委托_城镇入口() then
					
					return
				else
					判断_委托界面超时()
				end
			else
				显示('点击冷却中')
				
			end
		elseif 判断_委托界面() then
			
			if 判断_过往委托() then
				
			elseif 判断_超越地下城_入口() == '选中' then
				
				if not 判断_超负荷发电站() then
					显示('未识别到超负荷发电站')
					初始化城镇界面()
					return
				end
				
				找到超越入口 = true
			elseif 判断_超越地下城_入口() == '入口' then
				找到超越入口 = true
			else
				if not 找到超越入口 then
					显示("未找到超越入口")
					初始化城镇界面()
					return
				end
				
			end
			
			冷却点击 = os.time()
			
		elseif 判断_难度选择界面() then
			
			if 判断_委托不可入场() then
				return
			else
				
				if not 已选难度 then
					
					if 难度选择 == "简单" then
						
						按下点击({83 , 630 , 104 , 653})
						简单不可入场 = true
					elseif 难度选择 == "困难" then
						按下点击({183 , 625 , 222 , 656})
						困难不可入场 = true
					elseif 难度选择 == "挑战" then
						按下点击({298 , 622 , 343 , 657})
						挑战不可入场 = true
					else
						print('未获取到难度值')
					end
					已选难度 = true
				elseif 判断_抗魔值不足_超越() then
					
					if not 简单不可入场 then
						按下点击({83 , 630 , 104 , 653})
						随机延时(600 , 800)
						按下点击({83 , 630 , 104 , 653})
						简单不可入场 = true
					elseif not 困难不可入场 then
						按下点击({183 , 625 , 222 , 656})
						随机延时(600 , 800)
						按下点击({183 , 625 , 222 , 656})
						困难不可入场 = true
					elseif not 挑战不可入场 then
						按下点击({298 , 622 , 343 , 657})
						随机延时(600 , 800)
						按下点击({298 , 622 , 343 , 657})
						挑战不可入场 = true
					else
						显示('所有难度都不可入场')
						初始化城镇界面()
						return
						
					end
					
				else
					按下点击({1136 , 648 , 1230 , 672})--入场
					随机延时(1800 , 2500)
				end
				
			end
			
		elseif 判断_副本中() then
			自动刷图()
			
		elseif 判断_返回城镇() then
			功能_返回城镇界面获取疲劳值()
			
			初始化城镇界面()
			
			return
		elseif 入口_确认(true) then
			
		else
			清屏(true)
			
		end
		
	end
	
end
