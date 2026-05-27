
function 初始化城镇界面()
	
	local 首次运行 = true
	local 运行时间 = os.time()
	while true do
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if os.time() - 运行时间 > 120 then
			
			关闭(地下城)
			随机延时(700 , 800)
		end
		
		显示('初始化城镇中...')
		if 判断_城镇界面() then
			
			return
		elseif 判断_开始游戏界面() then
			按下点击({593 , 505 , 688 , 529})--开始游戏
			运行时间 = os.time()
		elseif 判断_帝国外围城墙() then
			运行时间 = os.time()
		elseif 判断_副本中() then
			
			if not 判断_帝国外围城墙() then
				自动刷图()
				运行时间 = os.time()
			end
			运行时间 = os.time()
		elseif 判断_返回城镇1() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			运行时间 = os.time()
			--[===[elseif 判断_选择角色界面_不用等加载()then
			print('初始化城镇中..检测并重启游戏_角色功能版')
			--检测并重启游戏_角色功能版()
			点击_开始游戏()]===]
			运行时间 = os.time()
		elseif 清屏_返回城镇_主城() then
			运行时间 = os.time()
		elseif 清屏(true) then
			运行时间 = os.time()
		else
			if 打开(地下城) then
				
				运行时间 = os.time()
			end
			
		end
		
	end
	
end
function 初始化城镇界面2()
	
	local 首次运行 = true
	local 运行时间 = os.time()
	while true do
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if os.time() - 运行时间 > 120 then
			
			关闭(地下城)
			随机延时(700 , 800)
			运行时间 = os.time()
		end
		显示('初始化城镇2中...')
		if 判断_城镇界面() then
			
			return
		elseif 判断_开始游戏界面() then
			按下点击({593 , 505 , 688 , 529})--开始游戏
			运行时间 = os.time()
		elseif 判断_帝国外围城墙() then
			运行时间 = os.time()
		elseif 判断_副本中() then
			
			if not 判断_帝国外围城墙() then
				自动刷图()
				运行时间 = os.time()
			end
			运行时间 = os.time()
		elseif 判断_返回城镇1() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			运行时间 = os.time()
		elseif 清屏_返回城镇_主城() then
			运行时间 = os.time()
			--[===[elseif 判断_选择角色界面_不用等加载() then
			
			点击_开始游戏()
			运行时间 = os.time()]===]
		elseif 清屏(true) then
			运行时间 = os.time()
		else
			if 打开(地下城) then
				运行时间 = os.time()
			end
			
		end
		
	end
	
end
function 初始化城镇界面_背包满了()
	
	local 首次运行 = true
	local 运行时间 = os.time()
	while true do
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if os.time() - 运行时间 > 120 then
			
			关闭(地下城)
			随机延时(700 , 800)
			运行时间 = os.time()
		end
		
		显示('初始化城镇2中...')
		if 判断_城镇界面() then
			
			return
		elseif 判断_开始游戏界面() then
			按下点击({593 , 505 , 688 , 529})--开始游戏
			运行时间 = os.time()
		elseif 判断_帝国外围城墙() then
			运行时间 = os.time()
		elseif 判断_副本中() then
			
			if not 判断_帝国外围城墙() then
				自动刷图()
				运行时间 = os.time()
			end
			运行时间 = os.time()
		elseif 判断_返回城镇1() then
			
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			运行时间 = os.time()
			--[===[elseif 判断_选择角色界面_不用等加载() then
			
			点击_开始游戏()
			运行时间 = os.time()]===]
		elseif 入口_确认(true) then
			运行时间 = os.time()
		elseif 清屏_X() then
			
		elseif 返回箭头_ocr() then
			
		elseif 清屏_广告() then
			
		else
			if 打开(地下城) then
				运行时间 = os.time()
			end
			
		end
		
	end
	
end
function 功能_随机昵称()
	-- 生成随机数字组合
	local 数字表 = {"0" , "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9"}
	local 非零数字表 = {"1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9"}
	local 随机昵称 = ""
	
	-- 随机生成8-10位数字的昵称
	local 长度 = math.random(10 , 12)
	
	for i = 1 , 长度 do
		if i == 1 then
			-- 第一位从1-9中随机选择
			local 随机索引 = math.random(1 , #非零数字表)
			随机昵称 = 随机昵称 .. 非零数字表[随机索引]
		else
			-- 其他位从0-9中随机选择
			local 随机索引 = math.random(1 , #数字表)
			随机昵称 = 随机昵称 .. 数字表[随机索引]
		end
	end
	setStopCallBack(function(error)
		imeLib.unlock()
	end)
	
	imeLib.lock()
	
	-- 调用输入函数并返回结果
	local 结果 = imeLib.setText(随机昵称)
	
	if 结果 then
		print("随机昵称输入成功: " .. 随机昵称)
		return true
	else
		print("随机昵称输入失败: " .. 随机昵称)
		return false
	end
	
end

function 功能_自动创建角色()
	-- 获取需要创建的角色数量
	local 目标创建数量 = 同步创建最大角色数量()
	
	显示('目标创建角色数量: ' .. 目标创建数量)
	local 点击分享 = false
	local 已分享 = false
	local 已有邮箱入口 = false
	local 首次运行 = true
	local 查找次数 = 0
	local 首次等待点击 = false
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		
		if 清屏_角色扩展栏提示() then
			
			return
		end
		
		显示('自动创建角色运行中 ')
		if 判断_选择角色界面_不用等加载() then
			随机延时(800 , 900)
			--按下点击({589 , 59 , 667 , 80})--挑战进度
			if 判断_可创建角色_选择角色界面() then
				-- 检查点击前是否已达到目标数量
				local 当前角色数量 = 判断_角色数量()
				
				if 当前角色数量 >= 目标创建数量 then
					
					显示('已完成创建 ' ..'当前角色数量'.. 当前角色数量 .. ': 目标角色数量'..'目标创建数量')
					return
				end
				显示('可创建角色')
				按下点击({201 , 656 , 230 , 684}) --创建角色
				
			else
				显示('没有可创建的角色了')
				return
			end
			
			返回时间 = os.time()
			
		elseif 判断_开始游戏界面() then
			按下点击({593 , 505 , 688 , 529}) --开始游戏
			返回时间 = os.time()
		elseif 判断_创建角色界面() then
			
			返回时间 = os.time()
		elseif 判断_随机昵称界面() then
			
			返回时间 = os.time()
		elseif 判断_城镇界面() then
			
			if not 已有邮箱入口 then
				if not 判断_邮箱入口() then
					显示('未识别到邮箱入口')
					if not 判断_正在移动() then
						
						按下点击({90 , 167 , 196 , 209}) --主线
					else
						
						返回时间 = os.time()
					end
				else
					已有邮箱入口 = true
				end
			else
				同步自动设置功能()
				入口_到选择角色界面()
				返回时间 = os.time()
				
			end
			返回时间 = os.time()
		elseif 判断_副本中() or 判断_副本中_新手指引副本() then
			按下点击({1082 , 20 , 1099 , 39})--设置
			
		elseif 判断_单手操作_4字() or 判断_轮盘_ocr() or 判断_林纳斯_创建新区() and not 判断_城镇界面() then
			
			if not 首次等待点击 then
				随机延时(1000 , 1200)
				首次等待点击 = true
			end
			if 判断_创建新区普攻() then
				随机延时(300 , 400)
			end
			按下点击(1111 , 583)--普攻
			随机延时(300 , 400)
			按下点击(981 , 496)--普攻2
			随机延时(300 , 400)
			按下点击(1115 , 627)--普攻3
			print('点普攻键')
			
		elseif 判断_猫图设置界面() then
			
			按下点击({1049 , 615 , 1126 , 670})--返回城镇
			随机延时(1000 , 1200)
			
		elseif 判断_已存在的名字确认() then
			
			随机延时(1500 , 1700)
			按下点击({572 , 415 , 712 , 460}) --确认
			随机延时(1500 , 1700)
			按下点击({887 , 187 , 906 , 206})--关闭创建角色界面
			返回时间 = os.time()
			
			返回时间 = os.time()
		elseif 判断_加载界面() then
			
			返回时间 = os.time()
			
		elseif 判断_分享_朋友圈() then
			显示('检测到分享朋友圈')
			if not 已分享 then
				按下点击({232 , 664 , 292 , 684}) --朋友圈
				已分享 = true
				
			else
				清屏()
				随机延时(500 , 600)
			end
			
		elseif 判断_分享界面_分享两字黄() then
			显示('检测到分享2000泰拉')
			if not 点击分享 then
				按下点击({1088 , 651 , 1219 , 696})
				点击分享 = true
			else
				清屏()
				随机延时(500 , 600)
			end
			
		elseif 清屏(true) then
			返回时间 = os.time()
		else
			打开(地下城)
		end
	end
end
function 功能_自动创建角色_创区()
	-- 获取需要创建的角色数量
	local 点击分享 = false
	local 已分享 = false
	local 已有邮箱入口 = false
	local 首次运行 = true
	local 查找次数 = 0
	local 首次等待点击 = false
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		print("功能_自动创建角色_创区")
		首次运行 = false
		
		if 清屏_角色扩展栏提示() then
			创建新区中 = false
			return
		end
		
		if 判断_选择角色界面_不用等加载() then
			创建新区中 = false
			return
			
		elseif 判断_开始游戏界面() then
			
			按下点击({593 , 505 , 688 , 529}) --开始游戏
			返回时间 = os.time()
		elseif 判断_创建角色界面() then
			
			返回时间 = os.time()
		elseif 判断_随机昵称界面() then
			
			返回时间 = os.time()
		elseif 判断_城镇界面() then
			查找次数 = 查找次数 + 1
			
			if not 已有邮箱入口 then
				
				if not 判断_邮箱入口() then
					显示('未识别到邮箱入口')
					if not 判断_正在移动() then
						
						按下点击({90 , 167 , 196 , 209}) --主线
					else
						
						返回时间 = os.time()
					end
				elseif 清屏(true) then
					
				else
					已有邮箱入口 = true
				end
			else
				同步自动设置功能()
				入口_到选择角色界面()
				返回时间 = os.time()
				
			end
			
			返回时间 = os.time()
		elseif 判断_副本中() or 判断_副本中_新手指引副本() then
			按下点击({1082 , 20 , 1099 , 39})--设置
			
		elseif (判断_单手操作_4字() or 判断_轮盘_ocr() or 判断_林纳斯_创建新区() ) and not 判断_城镇界面() then
			--猫卡一图回到城镇()
			
			if not 首次等待点击 then
				随机延时(1000 , 1200)
				首次等待点击 = true
			end
			if 判断_创建新区普攻() then
				随机延时(300 , 400)
			end
			按下点击(1111 , 583)--普攻
			随机延时(300 , 400)
			按下点击(981 , 496)--普攻2
			随机延时(300 , 400)
			按下点击(1115 , 627)--普攻3
			print('点普攻键')
			
			返回时间 = os.time()
		elseif 判断_猫图设置界面() then
			--按下点击({1082,20,1099,39})--设置
			按下点击({1049 , 615 , 1126 , 670})--返回城镇
			
		elseif 判断_已存在的名字确认() then
			
			随机延时(1500 , 1700)
			按下点击({572 , 415 , 712 , 460}) --确认
			随机延时(1500 , 1700)
			按下点击({887 , 187 , 906 , 206})--关闭创建角色界面
			返回时间 = os.time()
			
			返回时间 = os.time()
		elseif 判断_加载界面() then
			
			返回时间 = os.time()
			
		elseif 判断_分享_朋友圈() then
			显示('检测到分享朋友圈')
			if not 已分享 then
				按下点击({232 , 664 , 292 , 684}) --朋友圈
				已分享 = true
				
			else
				清屏()
				随机延时(500 , 600)
			end
			
		elseif 判断_分享界面_分享两字黄() then
			显示('检测到分享2000泰拉')
			if not 点击分享 then
				按下点击({1088 , 651 , 1219 , 696})
				点击分享 = true
			else
				清屏()
				随机延时(500 , 600)
			end
			
		elseif 清屏(true) then
			返回时间 = os.time()
		else
			打开(地下城)
		end
		
	end
	
end

function 猫卡一图回到城镇1()
	local 开始时间 = os.time()
	local 首次等待 = true
	while true do
		if not 首次等待 then
			随机延时(800 , 900)
		end
		首次等待 = false
		
		显示('猫卡图返回城镇...')
		-- 检测游戏是否闪退
		if 检测游戏是否闪退() then
			print('检测到游戏闪退')
			
			return
		end
		-- 检查是否超过15秒
		if os.time() - 开始时间 > 15 then
			显示('返回城镇超时退出，强制退出')
			return
		end
		
		if 判断_副本中_猫图() then
			
			按下点击({1081 , 20 , 1100 , 39})--设置
			
		elseif 判断_城镇界面() then
			
			break
		elseif 判断_猫图设置界面() then
			
			按下点击({1049 , 615 , 1126 , 670})--返回城镇
			
		elseif 入口_确认(true) then
			sleep(2000)
		elseif 清屏_系统关闭X() then
			print('检测到系统关闭X')
		else
			显示('返回城镇中1')
		end
		
	end
end

function 猫卡一图回到城镇2()
	local 开始时间 = os.time()
	local 首次等待 = true
	while true do
		if not 首次等待 then
			随机延时(800 , 900)
		end
		首次等待 = false
		
		显示('猫卡图返回城镇2...')
		-- 检测游戏是否闪退
		if 检测游戏是否闪退() then
			print('猫卡一图回到城镇2检测到有游戏闪退')
			
			return
		end
		-- 检查是否超过15秒
		if os.time() - 开始时间 > 15 then
			显示('返回城镇超时退出，强制退出')
			return
		end
		if 判断_副本中_猫图() then
			
			按下点击({1081 , 20 , 1100 , 39})--设置
			
		elseif 判断_城镇界面() then
			print('猫卡一图回到城镇2检测城镇')
			break
		elseif 判断_猫图设置界面() then
			
			 
			按下点击({1049 , 615 , 1126 , 670})--返回城镇
			
		elseif 入口_确认(true) then
			sleep(2000)
		elseif 清屏_系统关闭X() then
			print('检测到系统关闭X')
		else
			显示('返回城镇中2')
		end
		
	end
end

function 猫卡一图回到城镇()
	print('执行猫卡一图返回城镇')
	-- 随机选择执行哪个函数
	if 判断_可开燃烧交易界面() or 获取指定软件鳄鱼() then
		
		return
		
	end
	if 同步关闭yolo战斗功能() then
		--[===[if 判断_副本中疲劳值为0() then
			随机延时(1000 , 1200)
			返回(4)
		else
			随机延时(1000 , 1200)
			按下点击({1081 , 20 , 1100 , 39})--设置
		end]===]
		return
	end
	local 随机数 = math.random(1 , 2)
	
	if 随机数 == 1 then
		print("执行猫卡一图回到城镇1")
		猫卡一图回到城镇1()
	else
		print("执行猫卡一图回到城镇2")
		猫卡一图回到城镇2()
	end
	
end

function 功能_脱离模式()
	
	local 开始时间 = os.time()
	local 脱离完成 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(400 , 500)
		end
		首次运行 = false
		if os.time() - 开始时间 > 30 then
			
			return
		end
		if 检测游戏是否闪退() then
			
			return
		end
		
		if 判断_副本中() then
			
			if 脱离完成 then
				
				随机移动或拖动轮盘()
				return
			end
			
			按下点击(1089 , 28) --脱离卡死
			
		elseif 判断_猫图设置界面() then
			
			if 判断_脱离卡死() then
				
				for i = 5 , 1 , - 1 do
					toast("倒计时:"..i.."秒脱离完成" , 0 , 0 , 20)
					
					sleep(1000)
				end
				hideToast()
			else
				脱离完成 = true
				清屏(true)
			end
		elseif 判断_城镇界面() or 检测游戏是否闪退() then
			
			return
			
		end
		
	end
	
end

function 功能_脱离卡死()
	
	local 开始时间 = os.time()
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(400 , 500)
		end
		首次运行 = false
		if os.time() - 开始时间 > 40 then
			
			return
		end
		if 检测游戏是否闪退() or 判断_世界领主() then
			
			return
		end
		
		if 判断_副本中() then
			
			按下点击(1089 , 28) --脱离卡死
			随机延时(1500 , 2000)
			
		elseif 判断_猫图设置界面() then
			
			if 判断_脱离卡死() then
				for i = 5 , 1 , - 1 do
					
					toast("倒计时:"..i.."秒脱离卡死完成" , 0 , 0 , 20)
					
					if 判断_通关确认() or 判断_通关确认() or 入口_挑战结束确认() or 入口_世界领主确认() then
						
						hideToast()
						return
					end
					
					sleep(1000)
				end
				hideToast()
			elseif 判断_通关确认() or 判断_通关确认() or 入口_挑战结束确认() or 入口_世界领主确认() then
				return
			else
				返回(4)
				break
			end
		elseif 判断_提示_复活() then
			返回(4)
			随机延时(800 , 1200)
		end
	end
	
end

function 一直在再次挑战界面()
	--[===[local 尝试次数 = 0
	local 最大尝试次数 = 20
	while 尝试次数 < 最大尝试次数 do
	尝试次数 = 尝试次数 + 1
	print('执行一直在再次挑战界面')
	touchUp(0)
	if 检测游戏是否闪退() then
	return
	end
	
	随机延时(300 , 500)
	
	if 判断_拾取_图色() then
	随机点击普通攻击()
	随机延时(400 , 500)
	长按普通攻击拾取()
	随机延时(400 , 500)
	入口_再挑战()
	elseif 判断_加载界面() then
	return
	
	elseif 入口_确认() then
	随机延时(1000 , 1500)
	
	elseif 判断_再次挑战() then
	长按普通攻击拾取()
	随机延时(200 , 400)
	长按普通攻击拾取()
	入口_再次挑战()
	随机延时(1000 , 1500)
	
	elseif not 判断_返回城镇1() then
	return
	
	end
	
	end
	入口_返回城镇()]===]
	sleep(100)
end

function 一直在返回城镇界面()
	--[===[local 尝试次数 = 0
	local 最大尝试次数 = 20
	while 尝试次数 < 最大尝试次数 do
	if 检测游戏是否闪退() then
	return
	end
	
	尝试次数 = 尝试次数 + 1
	print('执行一直在返回城镇界面')
	touchUp(0)
	随机延时(300 , 500)
	
	if 判断_拾取_图色() then
	随机点击普通攻击()
	随机延时(400 , 500)
	长按普通攻击拾取()
	随机延时(400 , 500)
	入口_返回城镇()
	
	elseif 入口_确认() then
	随机延时(1000 , 1500)
	
	elseif 判断_加载界面() then
	
	return
	
	elseif 判断_返回城镇() then
	长按普通攻击拾取()
	随机延时(200 , 400)
	长按普通攻击拾取()
	入口_返回城镇()
	随机延时(1000 , 1500)
	elseif not 判断_返回城镇1() then
	return
	end
	
	end
	入口_确认()]===]
	sleep(100)
end

function 主线_一直在返回城镇界面()
	--[===[local 尝试次数 = 0
	local 最大尝试次数 = 20
	print('执行主线_一直在返回城镇界面')
	touchUp(0)
	while 尝试次数 < 最大尝试次数 do
	if 检测游戏是否闪退() then
	return
	end
	if not 判断_返回城镇() or not 入口_确认(true) then
	return
	end
	尝试次数 = 尝试次数 + 1
	随机延时(300 , 500)
	
	if 判断_拾取_图色() then
	随机点击普通攻击()
	随机延时(400 , 500)
	长按普通攻击拾取()
	随机延时(400 , 500)
	入口_返回城镇()
	
	elseif 判断_加载界面() then
	return
	elseif 入口_确认() then
	随机延时(1000 , 1500)
	
	elseif 判断_返回城镇1() then
	长按普通攻击拾取()
	随机延时(200 , 400)
	长按普通攻击拾取()
	按下点击({1064 , 76 , 1208 , 117})--副本内点任务
	随机延时(1000 , 1500)
	
	elseif not 判断_返回城镇1() then
	return
	end
	
	end]===]
	sleep(100)
end
-----------------------------------------------------------322,521,612,690
function 猫卡移动模式_懒人()
	-- 将所有操作放入一个表中
	local function 默认机型()
		print('执行移动模式懒人')
		local 操作列表 = {
			function() 滑动(201 , 523 , 405 , 579 , 5 , 5 , {15 , 30} , {150 , 250} , {600 , 700}) end , --1
			function() 滑动(201 , 524 , 410 , 575 , 3 , 3 , {15 , 25} , {700 , 800} , {5 , 10}) end , --2/
			function() 滑动(201 , 523 , 445 , 585 , 3 , 3 , {15 , 25} , {150 , 200} , {600 , 700}) end , --3
			function() 滑动(201 , 523 , 440 , 581 , 3 , 3 , {15 , 25} , {150 , 200} , {600 , 700}) end , --4
			function() 滑动(201 , 523 , 346 , 569 , 3 , 3 , {15 , 25} , {150 , 200} , {600 , 700}) end , --5
			function() 滑动(201 , 523 , 466 , 597 , 3 , 3 , {15 , 25} , {700 , 800} , {5 , 10}) end , --6
			
		}
		
		-- 随机选择一个操作执行
		local 随机索引 = math.random(1 , #操作列表)
		print("-------------------------默认懒人移动 --------------------" .. 随机索引)
		
		操作列表[随机索引]()
	end
	local function 小米8()
		local 操作列表 = {
			function() 滑动(298 , 563 , 579 , 620 , 5 , 5 , {15 , 30} , {150 , 250} , {600 , 700}) end , --1
			function() 滑动(298 , 563 , 591 , 619 , 3 , 3 , {15 , 25} , {600 , 700} , {5 , 10}) end , --2
			function() 滑动(298 , 563 , 588 , 628 , 3 , 3 , {15 , 25} , {150 , 200} , {600 , 700}) end , --3
			function() 滑动(298 , 563 , 611 , 630 , 3 , 3 , {15 , 25} , {150 , 200} , {600 , 700}) end , --4
			function() 滑动(298 , 5631 , 567 , 615 , 3 , 3 , {15 , 25} , {150 , 200} , {600 , 700}) end , --5
			function() 滑动(298 , 563 , 606 , 605 , 3 , 3 , {15 , 25} , {600 , 700} , {5 , 10}) end , --6
			
		}
		
		-- 随机选择一个操作执行
		local 随机索引 = math.random(1 , #操作列表)
		print("-------------------------小米8懒人移动 --------------------" .. 随机索引)
		
		操作列表[随机索引]()
	end
	if 获取设备类型() == 0 then
		默认机型()
	else
		小米8()
	end
	
end

function 猫卡移动模式1()
	
	print('执行移动模式1')
	local 操作列表 = {
		function() 拖动轮盘_自定义多点(208 , 674 , 469 , 545 , 150 , 170 , 150 , 200 , 700 , 800) end , --1
		function() 拖动轮盘_自定义多点(213 , 674 , 474 , 546 , 150 , 170 , 150 , 200 , 700 , 800) end , --2
		
		function() 拖动轮盘_自定义多点(210 , 674 , 471 , 547 , 150 , 170 , 150 , 200 , 700 , 800) end , --3
		
		function() 拖动轮盘_自定义多点(215 , 674 , 473 , 538 , 150 , 170 , 150 , 200 , 700 , 800) end , --4
		function() 拖动轮盘_自定义多点(220 , 674 , 475 , 539 , 150 , 170 , 150 , 200 , 700 , 800) end , --5
		function() 拖动轮盘_自定义多点(217 , 674 , 478 , 541 , 150 , 170 , 150 , 200 , 700 , 800) end , --6
	}
	
	-- 随机选择一个操作执行
	local 随机索引 = math.random(1 , #操作列表)
	print("-----------------------默认机型执行随机操作---------------------------------- " .. 随机索引)
	
	操作列表[随机索引]()
end

function 猫卡移动模式1_小米8()
	
	print('执行移动模式1_小米8')
	local 操作列表 = {
		function() 拖动轮盘_自定义多点(306 , 695 , 530 , 562 , 80 , 120 , 150 , 200 , 700 , 800) end , --1
		function() 拖动轮盘_自定义多点(329 , 698 , 603 , 558 , 80 , 120 , 150 , 200 , 700 , 800) end , --2
		
		function() 拖动轮盘_自定义多点(322 , 710 , 476 , 557 , 80 , 120 , 150 , 200 , 700 , 800) end , --3
		
		function() 拖动轮盘_自定义多点(335 , 685 , 516 , 580 , 80 , 120 , 150 , 200 , 700 , 800) end , --4
		function() 拖动轮盘_自定义多点(317 , 700 , 516 , 543 , 80 , 120 , 150 , 200 , 700 , 800) end , --5
		function() 拖动轮盘_自定义多点(345 , 705 , 524 , 589 , 80 , 120 , 150 , 200 , 700 , 800) end , --6
	}
	
	-- 随机选择一个操作执行
	local 随机索引 = math.random(1 , #操作列表)
	print("-----------------------小米8执行随机操作---------------------------------- " .. 随机索引)
	
	操作列表[随机索引]()
end

function 猫卡移动模式2()
	-- 将所有操作放入一个表中
	
	print('执行移动模式2')
	local 操作列表 = {
		function() 滑动(199 , 551 , 427 , 530 , 3 , 3 , {15 , 25} , {900 , 1000} , {5 , 10}) end , --1
		function() 滑动(199 , 551 , 366 , 523 , 3 , 3 , {15 , 25} , {1000 , 1050} , {5 , 10}) end , --2
		function() 滑动(199 , 551 , 366 , 555 , 3 , 3 , {15 , 25} , {150 , 200} , {800 , 850}) end , --3
		function() 滑动(199 , 551 , 535 , 583 , 3 , 3 , {15 , 25} , {150 , 200} , {800 , 900}) end , --4
		function() 滑动(199 , 551 , 548 , 550 , 3 , 3 , {15 , 25} , {900 , 1000} , {5 , 10}) end , --5
		function() 滑动(199 , 551 , 522 , 545 , 3 , 3 , {15 , 25} , {900 , 1000} , {5 , 10}) end , --6
	}
	
	-- 随机选择一个操作执行
	local 随机索引 = math.random(1 , #操作列表)
	print("-----------------------模式2执行随机操作------------------------- " .. 随机索引)
	sleep(100)
	操作列表[随机索引]()
end

function 进副本移动模式()
	-- 将所有操作放入一个表中
	
	print('进入副本移动模式')
	local function 默认机型()
		local 操作列表 = {
			
			function()--1
				轨迹滑动(
				{{203 , 523} , {412 , 515}} ,
				{随机延时(40 , 140) } ,
				5 , 5 ,
				{15 , 30} ,
				随机延时(400 , 500)
				)
			end ,
			function()--2
				轨迹滑动(
				{{199 , 551} , {435 , 496}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			function()--3
				轨迹滑动(
				{{199 , 551} , {480 , 531}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			--function() 按下点击({385 , 532 , 455 , 561} , {700 , 800}) end , --4
			function()--4
				轨迹滑动(
				{{199 , 551} , {426 , 514}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			
			function()--5
				轨迹滑动(
				{{199 , 551} , {513 , 498}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			function() 滑动(203 , 523 , 412 , 518 , 5 , 5 , {15 , 30} , {100 , 200} , {400 , 500}) end , --6
			function() 滑动(203 , 523 , 470 , 523 , 5 , 5 , {15 , 30} , {100 , 200} , {400 , 500}) end , --7
			function() 滑动(203 , 523 , 447 , 530 , 5 , 5 , {15 , 30} , {100 , 200} , {400 , 500}) end , --8
			
		}
		
		-- 随机选择一个操作执行
		local 随机索引 = math.random(1 , #操作列表)
		print("执行随机操作 " .. 随机索引)
		
		操作列表[随机索引]()
	end
	local function 小米8()
		print('进入副本移动模式小米8')
		local 操作列表 = {
			function()--1
				轨迹滑动(
				{{244 , 561} , {430 , 559}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			function()--2
				轨迹滑动(
				{{244 , 561} , {492 , 552}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			function()--3
				轨迹滑动(
				{{244 , 561} , {399 , 556}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			--function() 按下点击({385 , 532 , 455 , 561} , {700 , 800}) end , --4
			function()--4
				轨迹滑动(
				{{244 , 561} , {423 , 543}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			
			function()--5
				轨迹滑动(
				{{244 , 561} , {502 , 554}} , -- 轨迹点：点1→点2→点3
				{随机延时(40 , 140) } , -- 时间：第一段400-500ms，第二段100-200ms
				5 , 5 , -- X和Y偏移±5像素
				{15 , 30} , -- 点密度在15-30之间随机
				随机延时(400 , 500) -- 在最终点持续按住400-500ms
				)
			end ,
			function() 滑动(244 , 561 , 426 , 561 , 5 , 5 , {15 , 30} , {100 , 200} , {400 , 500}) end , --6
			function() 滑动(244 , 561 , 378 , 557 , 5 , 5 , {15 , 30} , {100 , 200} , {400 , 500}) end , --7
			function() 滑动(244 , 561 , 499 , 555 , 5 , 5 , {15 , 30} , {100 , 200} , {400 , 500}) end , --8
			
		}
		
		-- 随机选择一个操作执行
		local 随机索引 = math.random(1 , #操作列表)
		print("执行随机操作 " .. 随机索引)
		
		操作列表[随机索引]()
	end
	if 获取设备类型() == 0 then
		默认机型()
	else
		小米8()
	end
end

function 猫卡一图AI第二阶段()
	
	local 加载开始时间 = nil
	local 上一次状态 = nil
	
	while true do
		sleep(500)
		-- 检测游戏是否闪退
		if 快速检测游戏状态() then
			
		end
		if 判断_城镇界面() then
			显示('已返回城镇')
			
			加载开始时间 = nil -- 离开加载状态，重置
			上一次状态 = "城镇"
			if 判断_疲劳值为0() then
				return
			end
			
			--滑动(205 , 581 , 377 , 571 , 10 , 20 , {20 , 45} , {800 , 1000})
			进副本移动模式()
			
		elseif 判断_选择地下城界面() then
			
			上一次状态 = "选择地下城"
			随机延时(500 , 800)
			按下点击({58 , 126 , 194 , 163}) -- 普通
			随机延时(500 , 1000)
			按下点击({318 , 409 , 479 , 471}) -- 封锁的试验场
		elseif 判断_可开燃烧交易界面() then
			
			上一次状态 = "可开燃烧"
			if 判断_选择副本判断疲劳值为0() then
				
				清屏(true)
				
				return
			end
			
			随机延时(200 , 800)
			按下点击({110 , 247 , 385 , 325})
			随机延时(400 , 1000)
			按下点击({1060 , 612 , 1179 , 660}) -- 开始战斗
			随机延时(200 , 400)
			if 入口_确认(true) then
				
			end
		elseif 判断_加载界面() then
			sleep(2000)
			while true do
				sleep(100)
				if 检测游戏是否闪退() then
					break
				end
				if 判断_副本中() then
					
					加载开始时间 = nil
					上一次状态 = "副本"
					上一次状态 = "副本"
					
					自动刷猫图()
					--自动刷猫图_懒人模式()
					yolo自动捡猫卡()
					猫卡一图回到城镇()
					break
				elseif 判断_城镇界面() or 判断_可开燃烧交易界面() then
					break
					
				end
				
			end
			
		elseif 入口_确认(true) then
			
		else
			清屏(true)
		end
	end
	
end

function 功能_自动设置()
	初始化城镇界面()
	local 开始时间 = os.time()
	local 初始化设置界面 = false
	
	local 设置选项 = false
	local 设置图像 = false
	local 初始化图像 = false
	local 操作设置 = false
	local 摇杆设置 = false
	local 技能设置 = false
	local 其它设置 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		快速检测游戏状态()
		显示('自动设置运行中')
		
		if os.time() - 开始时间 > 80 then
			初始化城镇界面()
			return
		end
		if 判断_城镇界面() then
			按下点击({1242 , 124 , 1259 , 141})--设置3
			
		elseif 入口_确认(true) then
			
		elseif 判断_设置界面() then
			
			if not 初始化设置界面 then
				if 判断_账号设置() then
					
					初始化设置界面 = true
				else
					滑动(704 , 145 , 626 , 556 , 5 , 5 , {15 , 25} , {1500 , 2000} , {200 , 500})
				end
				
			elseif not 设置选项 then
				显示('设置选项')
				按下点击(979 , 293)--关提醒
				随机延时(300 , 400)
				按下点击(735 , 240) --地下城指引开
				
				--随机延时(700 , 800)
				
				随机延时(700 , 800)
				按下点击(734 , 441)--开启最近获得
				随机延时(700 , 800)
				按下点击(978 , 491)--关闭默认选中
				随机延时(700 , 800)
				按下点击(979 , 541) --关滚动广告
				随机延时(300 , 400)
				按下点击(979 , 541) --关滚动广告
				随机延时(300 , 400)
				按下点击(979 , 577 , - 5 , 5 , - 4 , 4) --地下城内查看技能信息按钮
				随机延时(300 , 400)
				滑动(883 , 559 , 899 , 172 , 5 , 5 , {10 , 25} , {400 , 500})
				随机延时(300 , 400)
				滑动(883 , 559 , 899 , 172 , 5 , 5 , {10 , 25} , {400 , 500})
				随机延时(300 , 400)
				滑动(883 , 559 , 899 , 172 , 5 , 5 , {10 , 25} , {400 , 500})
				随机延时(1500 , 1700)
				按下点击({731 , 498 , 741 , 510})--关闭节能
				随机延时(300 , 400)
				按下点击({973 , 557 , 986 , 569})--关闭跳转
				随机延时(300 , 400)
				设置选项 = true
				
			elseif not 设置图像 then
				显示('设置图像')
				按下点击({136 , 318 , 229 , 367}) --图像
				随机延时(400 , 500)
				if not 初始化图像 then
					if 判断_设备设置() then
						初始化图像 = true
					else
						滑动(704 , 145 , 626 , 556 , 5 , 5 , {15 , 25} , {1500 , 2000} , {200 , 500})
					end
				else
					
					按下点击({676 , 255 , 680 , 262})--30%
					随机延时(400 , 500)
					按下点击({730 , 417 , 740 , 429})--0名
					--划至底部
					滑动(561 , 540 , 545 , 185 , 5 , 5 , {15 , 25} , {1500 , 2000} , {200 , 500})
					随机延时(400 , 500)
					滑动(561 , 540 , 545 , 185 , 5 , 5 , {15 , 25} , {1500 , 2000} , {200 , 500})
					随机延时(800 , 1000)
					按下点击({728 , 496 , 741 , 510}) --关闭技能半透明
					设置图像 = true
				end
			elseif not 操作设置 then
				按下点击({139 , 183 , 187 , 218})--操作
				随机延时(400 , 500)
				按下点击({667 , 526 , 790 , 562})--调整
				
			else
				初始化城镇界面()
				return
			end
			---------------------------------------------操作项
			
		elseif 判断_摇杆_设置() then
			显示('设置摇杆')
			
			if not 摇杆设置 then
				按下点击({818 , 550 , 837 , 571}) --32方向
				随机延时(400 , 500)
				按下点击({738 , 277 , 778 , 360})--其它
				摇杆设置 = true
			elseif 判断_其他_设置() then
				摇杆设置 = true
			else
				
				按下点击({738 , 277 , 778 , 360})--其它
			end
			
		elseif 判断_其他_设置() then
			显示('设置单手模式')
			
			if not 其它设置 then
				
				按下点击({38 , 481 , 56 , 499}) --开启单手模式
				随机延时(400 , 500)
				按下点击({504 , 155 , 546 , 240}) --点技能
				其它设置 = true
				
			else
				按下点击({504 , 155 , 546 , 240}) --点技能
			end
			
		elseif 判断_技能_设置() then
			显示('设置技能')
			if not 技能设置 then
				
				if 判断_基础型_已选中() then
					
					技能设置 = true
				else
					按下点击({321 , 89 , 383 , 118}) --基础型
					
				end
				
			else
				按下点击({311 , 656 , 437 , 694}) --保存离开
				随机延时(800 , 900)
				操作设置 = true
				初始化城镇界面()
				return
			end
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				随机延时(300 , 400)
			end
		end
	end
	
end

function 功能_购买特别关注()
	
	显示('购买收藏')
	local 开始时间 = os.time()
	local 开始计时 = false
	local 首次运行 = true
	while true do
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 60 then
			显示('操作超时，强制退出')
			
			return
		end
		
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('购买收藏中...')
		if 判断_城镇界面() then
			开始计时 = true
			按下点击({984 , 30 , 1018 , 65})--商城
			--随机延时(1500 , 2000)
			
		elseif 判断_总价格_收藏() then
			随机延时(400 , 800)
			if 判断_灰色购买_收藏() then
				
				return
			end
			按下点击({1103 , 648 , 1229 , 689})--点击购买
			--随机延时(800 , 1000)
			
		elseif 判断_持有金额不足() then
			显示('持有金额不足')
			--随机延时(400 , 600)
			发送喵提醒_自定义('购买收藏检测到金币不足跳过执行')
			
			return
			
		elseif 入口_确认() then
			
			return
			
		elseif 判断_打开商城界面() then
			显示('商城界面')
			随机延时(500 , 600)
			滑动(129 , 517 , 138 , 248 , 10 , 10 , {20 , 35} , {1300 , 1800} , {100 , 200})
			随机延时(1000 , 1500)
			按下点击({84 , 653 , 136 , 692})--特别关注
			--随机延时(1000 , 1500)
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
			
		end
		
	end
end

function 功能_购买复活币()
	
	local 开始时间 = os.time()
	local 开始计时 = false
	local 已购买 = false
	local 首次运行 = true
	while true do
		
		if os.time() - 开始时间 > 60 then
			显示('超时未完成跳过')
			--sleep(1000)
			return
		end
		显示('买复活币')
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if 判断_城镇界面() then
			
			开始计时 = true
			按下点击({984 , 30 , 1018 , 65})--商城
			
		elseif 判断_打开商城界面() then
			开始计时 = true
			if 判断_道具_商城() then
				
			elseif 判断_恢复品_商城() then
				
			elseif 判断_已购买_复活币_商城() then
				return
			elseif 判断_免费_商城() then
				按下点击({287 , 161 , 405 , 226})--复活币
				
			end
		elseif 判断_购买_商城() then
			
			if 已购买 then
				清屏(true)
				return
			else
				if not 判断_复活币_无色_血药() then
					清屏(true)
					
				else
					按下点击({549 , 567 , 732 , 617})--购买
					已购买 = true
					
				end
				
			end
			
		elseif 判断_持有金额不足() then
			显示('持有金额不足')
			
			发送喵提醒_自定义('购买收藏检测到金币不足跳过执行')
			清屏(true)
			return
		elseif 入口_确认(true) then
			随机延时(400 , 500)
		else
			清屏(true)
		end
		
	end
	
end

function 功能_购买无色()
	显示('买无色')
	local 开始时间 = os.time()
	local 开始计时 = false
	local 已购买 = false
	local 首次运行 = true
	while true do
		
		if os.time() - 开始时间 > 60 then
			显示('超时未完成跳过')
			
			return
		end
		显示('买无色中.....')
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if 判断_城镇界面() then
			开始计时 = true
			
			按下点击({984 , 30 , 1018 , 65})--商城
			--随机延时(1500 , 2000)
		elseif 判断_打开商城界面() then
			
			if 判断_道具_商城() then
				--随机延时(500 , 600)
			elseif 判断_恢复品_商城() then
				
			elseif 判断_已购买_无色_商城() then
				return
			elseif not 已购买 and 判断_无色_商城() then
				
			end
			
		elseif 判断_购买物品界面_商城() then
			
			if 已购买 then
				清屏(true)
				return
			else
				if not 判断_复活币_无色_血药() then
					清屏(true)
					
				else
					按下点击({849 , 418 , 884 , 450}) --最多
					随机延时(500 , 600)
					按下点击({571 , 569 , 728 , 613}) --购买
					已购买 = true
					
				end
				
			end
			
		elseif 判断_持有金额不足() then
			显示('持有金额不足')
			
			发送喵提醒_自定义('购买收藏检测到金币不足跳过执行')
			清屏(true)
			return
			
		elseif 入口_确认(true) then
			随机延时(400 , 500)
		else
			清屏(true)
		end
		
	end
	
end

function 功能_购买血药()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 已购买 = false
	local 首次运行 = true
	while true do
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 120 then
			显示('操作超时，强制退出')
			
			return
		end
		显示('商城购买中...')
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		
		if 判断_城镇界面() then
			
			按下点击({984 , 30 , 1018 , 65})--商城
			
		elseif 判断_打开商城界面() then
			
			if 判断_道具_商城() then
				
			elseif 判断_恢复品_商城() then
				
			elseif 判断_已购买血药() then
				
				return
				
			elseif not 已购买 and 判断_血药_商城() then
				
				按下点击({284 , 512 , 511 , 578})--血药
			end
			
		elseif 判断_购买物品界面_商城() then
			
			if 已购买 then
				清屏(true)
				return
			else
				if not 判断_复活币_无色_血药() then
					清屏(true)
				else
					按下点击({849 , 418 , 884 , 450}) --最多
					随机延时(1000 , 1500)
					按下点击({571 , 569 , 728 , 613}) --购买
					已购买 = true
				end
				
			end
			
		elseif 判断_持有金额不足() then
			显示('持有金额不足')
			
			发送喵提醒_自定义('购买收藏检测到金币不足跳过执行')
			
			return
			
		elseif 入口_确认(true) then
			随机延时(400 , 500)
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
			
		end
		
	end
	
end

function 功能_商城购买()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 首次运行 = true
	while true do
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 120 then
			显示('操作超时，强制退出')
			
			return
		end
		
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('商城购买中...')
		if 判断_城镇界面() then
			
			按下点击({984 , 30 , 1018 , 65})--商城
			
		elseif 判断_打开商城界面() then
			显示('商城界面')
			同步购买复活币功能()
			同步购买无色功能()
			同步购买血药功能()
			同步购买特别关注功能()
			初始化城镇界面()
			return
		elseif 判断_持有金额不足() then
			显示('持有金额不足')
			
			发送喵提醒_自定义('购买收藏检测到金币不足跳过执行')
			
			初始化城镇界面()
			
			return
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
			
		end
		
	end
	
end

function 功能_活动点券买8万泰拉()
	
	local function 已勾选()
		
		local x , y = findMultiColor(169 , 482 , 186 , 495 , "ffefb5-202020" , "3|3|ffefb5-202020|7|-2|ffebbd-202020|11|-6|ffefbd-202020|15|-10|fff7bd-202020|-4|-4|fff3b5-202020" , 0 , 0.9)
		if x ~= - 1 and y ~= - 1 then
			return true
			
		end
		return false
	end
	local function 没有活动点券()
		
		setDict(0 , "限时活动.txt")
		useDict(0)
		for i = 1 , 5 do
			
			local ret , x , y = findStr(168 , 475 , 190 , 498 , "没有点券" , "948a7b-303030" , 0.5 , 10 , 10)
			if x ~= - 1 and y ~= - 1 then
				显示('没有活动点券了')
				return true
				
			end
			sleep(60)
		end
		
		return false
	end
	
	local 没有活动券 = false
	
	local function 购买疲劳药1()
		local 购买运行时间 = os.time()
		local 首次运行 = true
		while true do
			
			随机延时(500 , 600)
			
			if os.time() - 购买运行时间 > 15 then
				return true
			end
			显示('购买疲劳药运行中...')
			if 判断_购买物品界面_普通礼包() then
				
				if 没有活动点券() then
					没有活动券 = true
					return true
				elseif not 已勾选() then
					按下点击({170 , 476 , 189 , 496})
					随机延时(800 , 900)
				else
					
					按下点击({587 , 624 , 709 , 666}) --购买
					return true
				end
				
			else
				return false
			end
			
		end
		
	end
	local function 购买深渊票1()
		local 购买运行时间 = os.time()
		local 首次运行 = false
		while true do
			if not 首次运行 then
				随机延时(500 , 600)
			end
			首次运行 = false
			if os.time() - 购买运行时间 > 15 then
				return true
			end
			显示('购买深渊票1...')
			if 判断_购买物品界面_普通礼包() then
				
				if 没有活动点券() then
					没有活动券 = true
					return true
				elseif not 已勾选() then
					按下点击({170 , 476 , 189 , 496})
					随机延时(800 , 900)
					
				else
					
					按下点击({587 , 624 , 709 , 666}) --购买
					return true
				end
				
			else
				return false
			end
			
		end
		
	end
	local function 购买属强徽章1()
		local 购买运行时间 = os.time()
		local 首次运行 = false
		local 买2份 = false
		while true do
			if not 首次运行 then
				随机延时(500 , 600)
			end
			首次运行 = false
			if os.time() - 购买运行时间 > 15 then
				return true
			end
			显示('购买属强徽章1...')
			if 判断_购买物品界面_普通礼包() then
				
				if not 买2份 then
					按下点击({570 , 360 , 595 , 387})
					买2份 = true
				else
					
					if 没有活动点券() then
						
						没有活动券 = true
						return true
					elseif not 已勾选() then
						按下点击({170 , 476 , 189 , 496})
						随机延时(800 , 900)
					else
						
						按下点击({587 , 624 , 709 , 666}) --购买
						return true
					end
					
				end
			else
				return false
			end
			
		end
		
	end
	初始化城镇界面()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 首次选中特惠 = false
	local 买疲劳药 = false
	local 买深渊票 = false
	local 买属强徽章 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 50 then
			显示('操作超时，强制退出')
			
			return
		end
		
		显示('商城购买中...')
		if 判断_城镇界面() then
			
			按下点击({984 , 30 , 1018 , 65})--商城
			
		elseif 判断_打开商城界面() then
			显示('商城界面')
			if 没有活动券 then
				显示('没有活动点券了结束购买')
				return
			end
			if 判断_普通礼包入口() then
				
			elseif 判断_普通礼包已选中() then
				随机延时(500 , 600)
				
				if not 首次选中特惠 then
					按下点击({219 , 80 , 308 , 109})
					首次选中特惠 = true
				elseif not 买疲劳药 then
					
					按下点击({312 , 224 , 451 , 338}) --疲劳药
					随机延时(1000 , 1200)
					if 购买疲劳药1() then
						买疲劳药 = true
						开始时间 = os.time()
					end
					
				elseif not 买深渊票 then
					
					按下点击({331 , 560 , 397 , 610})
					随机延时(1000 , 1200)
					if 购买深渊票1() then
						买深渊票 = true
						开始时间 = os.time()
					end
					
				elseif not 买属强徽章 then
					
					滑动(911 , 628 , 905 , 239 , 3 , 3 , {10 , 25} , {400 , 500})
					随机延时(1000 , 1500)
					按下点击({662 , 523 , 794 , 623})
					随机延时(1000 , 1200)
					if 购买属强徽章1() then
						买属强徽章 = true
						开始时间 = os.time()
					end
					
				else
					显示('全部购买结束')
					return
				end
				
			end
			
		elseif 判断_立即使领取的物品() then
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
			
		end
		
	end
end

function 功能_修理装备()
	local 首次运行 = true
	local 开始时间 = os.time()
	local 运行时间 = os.time()
	while true do
		-- 检查执行时间是否超过限制
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if os.time() - 运行时间 > 50 then
			return
		end
		
		if not 首次运行 then
			随机延时(500 , 600)
		end
		首次运行 = false
		if 判断_城镇界面() then
			按下点击({1195 , 636 , 1233 , 673})--背包
			
		elseif 判断_打开背包界面() then
			
			if not 同步自动穿装备功能() then
				
				if not 判断_选中道具() then
					按下点击({6 , 60 , 123 , 126})--道具
					
				else
					按下点击({515 , 666 , 633 , 692}) -- 装备修理
				end
				
			end
			
		elseif 入口_自动装备_自动穿装备() then
			
		elseif 判断_持有金额不足() then
			
			显示('持有金额不足继续修理')
			发送喵提醒_自定义('修理装备时检测到金币不足继续修理 ')
			按下点击({665 , 474 , 818 , 525})--使用泰拉修理
			
		elseif 入口_确认(true) then
			
		elseif 判断_修理装备界面() then
			
			if 入口_修理() then
				显示('继续修理')
			else
				
				清屏(true)
				return
			end
		else
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
		end
	end
	
end

function 功能_出售装备()
	显示('出售装备')
	local 开始时间 = os.time()
	local 最大执行时间 = 60 -- 最多执行60秒
	local 首次同步检测 = false
	local 首次运行 = true
	while true do
		-- 检查执行时间是否超过限制
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 最大执行时间 then
			显示("出售装备操作超时，强制退出")
			
			return
		end
		if not 首次运行 then
			随机延时(500 , 600)
		end
		首次运行 = false
		显示('出售装备中...')
		if 判断_城镇界面() then
			
			按下点击({1193 , 632 , 1237 , 676})--背包
			
		elseif 判断_打开背包界面() then
			
			if not 同步自动穿装备功能() then
				
				if not 判断_选中道具() then
					按下点击({6 , 60 , 123 , 126})--道具
					
				elseif not 判断_选中装备() then
					按下点击({870 , 71 , 931 , 107})--装备
				elseif 判断_出售按钮_背包() then
					
				end
			end
			
		elseif 判断_装备出售界面() then
			
			if not 首次同步检测 then
				if 同步出售装备勾选状态() then
					
				end
				首次同步检测 = true
			end
			
			if 判断_没有可出售的装备() then
				return
			else
				按下点击({983 , 604 , 1170 , 648}) -- 出售按钮2
			end
		elseif 入口_自动装备_自动穿装备() then
			
		else
			
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
		end
	end
	
end
function 功能_装备升星_装备库()
	local 最大执行时间 = 60 -- 最多执行60秒
	local 开始时间 = os.time()
	local 首次运行 = true
	
	while true do
		-- 检查执行时间是否超过限制
		if 检测游戏是否闪退() then
			return
		end
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		if os.time() - 开始时间 > 最大执行时间 then
			显示("装备升星操作超时，强制退出")
			return
		end
		if 判断_装备库 then
			
		end
		if 判断_一键升星_装备库() then
			
		end
		
	end
	
end
function 功能_穿史诗装备()
	初始化城镇界面()
	
	local 首次同步检测 = false
	local 装备升星 = false
	local 最大执行时间 = 60 -- 最多执行60秒
	local 开始时间 = os.time()
	local 首次运行 = true
	
	while true do
		-- 检查执行时间是否超过限制
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 最大执行时间 then
			显示("穿史诗装备操作超时，强制退出")
			
			return
		end
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		显示('穿史诗装备中...')
		if 判断_城镇界面() then
			
			按下点击({1193 , 632 , 1237 , 676})--背包
			
		elseif 判断_打开背包界面() then
			
			if not 判断_装备库入口() then
				清屏(true)
				return
			end
			按下点击(112 , 665)
		elseif 判断_打开装备库界面() then
			
			if not 判断_75级装备库() then
				
				if not 装备升星 then
					if not 同步一键升星功能() then
						装备升星 = true
					else
						if not 判断_一键升星_装备库() then
							装备升星 = true
						end
					end
					
				else
					
					if not 判断_装备替换() then--黄
						初始化城镇界面()
						return
						
					end
				end
				
			end
		elseif 判断_打开装备替换界面() then
			
			if 判断_装备替换2() then
				初始化城镇界面()
				return
				
			elseif 判断_修理装备_装备替换() then
				
			else
				初始化城镇界面()
				return
			end
			
		elseif 判断_打开一键升星界面() then
			
			if 装备升星 then
				清屏(true)
			else
				if not 判断_一键升星_一键升星() then
					装备升星 = true
				end
			end
			
		elseif 判断_修理装备界面() then
			
			if 入口_修理() then
				显示('继续修理')
			else
				
				清屏(true)
				
			end
		elseif 判断_持有金币不足() then
			装备升星 = true
			
		else
			
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
		end
	end
	
end
function 功能_出售装备2()
	
	初始化城镇界面_背包满了()
	local 开始时间 = os.time()
	local 已出售 = false
	local 首次运行 = true
	local 已拓展 = false
	local 已判断 = false
	local 首次测拓展 = false
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		显示('检测到背包满了处理中')
		if 检测游戏是否闪退() then
			return
		end
		if os.time() - 开始时间	 >= 50 then
			显示('检查背包处理超时')
			初始化城镇界面()
			return
		end
		if 判断_打开背包界面() then
			
			if not 首次测拓展 then
				
				滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
				随机延时(300 , 400)
				滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
				随机延时(300 , 400)
				滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
				随机延时(1000 , 1200)
				自动拓展背包()
				首次测拓展 = true
				
			elseif not 已判断 then
				
				if not 判断_选中道具() then
					按下点击({6 , 60 , 123 , 126})--道具
					随机延时(600 , 800)
					
				elseif not 判断_选中装备() then
					按下点击({870 , 71 , 931 , 107})--装备
					随机延时(600 , 800)
					
				else
					if not 同步自动穿装备功能() then
						
						if 判断_分解按钮_背包() then
							
						elseif 判断_出售按钮_背包() then
							
						end
						
					end
				end
			else
				if not 已出售 then
					自动拓展背包()
					已拓展 = true
					已出售 = true
				else
					初始化城镇界面_背包满了()
					return true
				end
			end
		elseif 判断_城镇界面() then
			按下点击({1201 , 639 , 1230 , 675})
			
		elseif 判断_装备分解界面() or 判断_装备出售界面() then
			
			if not 已判断 then
				if not 判断_勾选了白装() then
					按下点击({262 , 595 , 282 , 614})
					随机延时(600 , 800)
				end
				
				if not 判断_勾选了蓝装() then
					按下点击({414 , 595 , 438 , 615})
					随机延时(600 , 800)
				end
				if not 判断_勾选了紫装() then
					按下点击({568 , 595 , 593 , 617})
					随机延时(600 , 800)
				end
				if not 判断_勾选了粉装() then
					
					按下点击({724 , 595 , 743 , 616})
					随机延时(600 , 800)
				end
				
				if 判断_没有可分解的装备() or 判断_没有可出售的装备() then
					已判断 = true
					清屏(true)
				else
					开始时间 = os.time()
					按下点击({982 , 605 , 1173 , 649}) -- 分解按钮2
					已出售 = true
				end
			else
				清屏(true)
			end
			
		elseif 入口_确认(true) then
			
		elseif 判断_返回城镇1() or 判断_副本中() then
			
			return
		else
			清屏(true)
		end
	end
end

function 自动拓展背包()
	
	local 首次运行 = true
	local 已拓展 = false
	local 拓展次数 = 0
	local 运行时间 = os.time()
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		
		if os.time() - 运行时间 > 60 then
			
			return false
			
		end
		if 判断_打开背包界面() then
			
			if not 已拓展 then
				
				if 判断_背包扩展() then
					
					拓展次数 = 拓展次数 + 1
					if 拓展次数 > 3 then
						已拓展 = true
					else
						按下点击({990 , 572 , 1157 , 616})--背包扩展
						随机延时(700 , 800)
					end
					
				else
					if 判断_200格背包最大() then
						发送喵提醒_自定义("背包已经扩展至大了,及时上线整理背包")
						return true
					else
						滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
						随机延时(1000 , 1200)
					end
					
				end
			else
				
				return true
			end
		elseif 判断_持有金币不足() then
			return true
			
		elseif 入口_确认(true) then
			
		elseif 判断_城镇界面() then
			按下点击({1201 , 639 , 1230 , 675})
		elseif 判断_返回城镇1() then
			return true
		else
			清屏(true)
		end
		
	end
	
end
function 功能_检测背包_返回城镇界面()
	
	local 开始时间 = os.time()
	local 已出售 = false
	local 首次运行 = true
	local 已拓展 = false
	local 已判断 = false
	local 首次测拓展 = false
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		显示('检测到背包满了处理中')
		if 检测游戏是否闪退() then
			return
		end
		if os.time() - 开始时间	 >= 50 then
			显示('检查背包处理超时')
			初始化城镇界面()
			return
		end
		if 判断_打开背包界面() then
			
			if not 首次测拓展 then
				
				滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
				随机延时(300 , 400)
				滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
				随机延时(300 , 400)
				滑动(1066 , 504 , 1061 , 209 , 15 , 10 , {15 , 25} , {400 , 500})
				随机延时(1000 , 1200)
				自动拓展背包()
				首次测拓展 = true
				
			elseif not 已判断 then
				
				if not 判断_选中道具() then
					按下点击({6 , 60 , 123 , 126})--道具
					随机延时(600 , 800)
					
				elseif not 判断_选中装备() then
					按下点击({870 , 71 , 931 , 107})--装备
					随机延时(600 , 800)
					
				else
					if not 同步自动穿装备功能() then
						
						if 判断_分解按钮_背包() then
							
						elseif 判断_出售按钮_背包() then
							
						end
						
					end
				end
			else
				if not 已出售 then
					自动拓展背包()
					已拓展 = true
					已出售 = true
				else
					清屏(true)
					return true
				end
			end
			
		elseif 判断_装备分解界面() or 判断_装备出售界面() then
			
			if not 已判断 then
				if not 判断_勾选了白装() then
					按下点击({262 , 595 , 282 , 614})
					随机延时(600 , 800)
				end
				
				if not 判断_勾选了蓝装() then
					按下点击({414 , 595 , 438 , 615})
					随机延时(600 , 800)
				end
				if not 判断_勾选了紫装() then
					按下点击({568 , 595 , 593 , 617})
					随机延时(600 , 800)
				end
				if not 判断_勾选了粉装() then
					
					按下点击({724 , 595 , 743 , 616})
					随机延时(600 , 800)
				end
				
				if 判断_没有可分解的装备() or 判断_没有可出售的装备() then
					已判断 = true
					清屏(true)
				else
					开始时间 = os.time()
					按下点击({982 , 605 , 1173 , 649}) -- 分解按钮2
					已出售 = true
				end
			else
				清屏(true)
			end
			
		elseif 入口_确认(true) then
			
		elseif 判断_背包满了() then
			
		elseif 判断_返回城镇1() or 判断_副本中() then
			
			return
		else
			清屏(true)
		end
	end
end

function 功能_分解装备()
	
	local 开始时间 = os.time()
	local 最大执行时间 = 60 -- 最多执行60秒
	local 首次同步检测 = false
	local 已尝试ss分解 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		-- 检查执行时间是否超过限制
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if os.time() - 开始时间 > 最大执行时间 then
			显示("分解装备操作超时，强制退出")
			
			return
		end
		
		显示('分解装备中')
		if 判断_城镇界面() then
			按下点击({1193 , 632 , 1237 , 676})--背包
			--随机延时(1500 , 2000)
		elseif 判断_打开背包界面() then
			--随机延时(600 , 800)
			
			if not 同步自动穿装备功能() then
				if not 判断_选中道具() then
					按下点击({6 , 60 , 123 , 126})--道具
					--随机延时(600 , 800)
				elseif not 判断_选中装备() then
					按下点击({870 , 71 , 931 , 107})--装备
					--随机延时(1000 , 1500)
				elseif not 判断_分解按钮_背包() then
					显示('没有分解功能')
					return
				end
			end
			
		elseif 入口_自动装备_自动穿装备() then
			
		elseif 判断_装备分解界面() then
			
			if not 首次同步检测 then
				同步分解装备勾选状态()
				随机延时(300 , 400)
				print('首次判断勾选状态')
				首次同步检测 = true
				
			elseif 判断_没有可分解的装备() then
				显示('没有可分解的装备了')
				return
			else
				
				按下点击({982 , 605 , 1173 , 649}) -- 分解按钮2
				
			end
			
		elseif 入口_确认() then
			
		else
			
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
		end
	end
	
end

function 功能_分解护石()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			if os.time() - 开始时间 > 60 then
				显示('分解护石操作超时，强制退出')
				清屏(true)
				return
			end
		end
		
		显示('分解护石中...')
		if 判断_城镇界面() then
			开始计时 = true
			按下点击({1198 , 647 , 1238 , 675})--背包
			--随机延时(800 , 1000)
		elseif 判断_打开背包界面() then
			
			if not 同步自动穿装备功能() then
				if 入口_圣者封印() then
					--随机延时(800 , 1000)
					
				elseif 判断_选中圣者封印() then
					按下点击({1195 , 663 , 1261 , 698})--分解
					--随机延时(800 , 1000)
				else
					
					return
				end
			end
			
		elseif 判断_封印石选择材料界面() then
			--随机延时(600 , 1000)
			判断_封印石勾选状态()
			随机延时(600 , 1000)
			按下点击({967 , 604 , 1170 , 654})--分解2
		elseif 入口_确认() then
			--随机延时(600 , 800)
		elseif 判断_选择精髓() then
			--	随机延时(600 , 800)
			按下点击({77 , 206 , 169 , 267})--精髓
			--随机延时(600 , 800)
		elseif 判断_精髓选择材料界面() then
			判断_封印石勾选状态()
			按下点击({967 , 604 , 1170 , 654})--分解2
			--随机延时(600 , 1000)
		elseif 判断_没有可分解精髓 () then
			清屏(true)
			return
		else
			if 清屏(true) then
				
			end
		end
		
	end
	
end

function 功能_合卡一次()
	
	显示('合卡')
	local 开始时间 = os.time()
	local 开始计时 = false
	local 已合成 = false
	local 白卡 = false
	local 蓝卡 = false
	local 紫卡 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 50 then
			显示('合卡操作超时，强制退出')
			
			return
		end
		
		显示('合卡中...')
		if 判断_城镇界面() then
			
			按下点击({1196 , 635 , 1233 , 676})--背包
			
		elseif 判断_打开背包界面() then
			
			if not 同步自动穿装备功能() then
				if not 判断_选中道具() then
					按下点击({15 , 76 , 93 , 112})
				else
					
					if not 判断_选中卡片() then
						按下点击({1191 , 67 , 1265 , 113})--卡片
						随机延时(600 , 800)
						
					else
						if not 判断_合成_入口() then
							显示('没有合成功能')
							return
						else
							--随机延时(500 , 1000)
						end
					end
				end
			end
			
		elseif 判断_卡片合成界面() then
			
			if 判断_没有卡片合成_一张都没有() then
				清屏(true)
				return
			end
			if 已合成 then
				清屏(true)
				return
			end
			if not 判断_两次合成_合卡() then
				
				按下点击({930 , 546 , 952 , 567}) --勾选两次
				随机延时(300 , 400)
				
			else
				if 判断_没有卡片_合成() then
					
					if not 蓝卡 then
						按下点击({70 , 220 , 305 , 249})
						随机延时(300 , 400)
						蓝卡 = true
					elseif not 紫卡 then
						按下点击({64 , 165 , 326 , 204})
						随机延时(300 , 400)
						紫卡 = true
					else
						return
					end
					
				else
					按下点击({1050 , 616 , 1201 , 660})--合成2
					随机延时(300 , 400)
					已合成 = true
				end
				
			end
		elseif 入口_确认(true) then
			
		elseif 判断_卡片点击关闭() or 已合成 then
			
			break
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 1000)
			end
		end
	end
end

function 功能_合徽章一次()
	local 已合成 = false
	local 开始时间 = os.time()
	local 开始计时 = false
	local 首次运行 = true
	local 查找结果 = false
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 50 then
			显示('合徽章操作超时，强制退出')
			--清屏(true)
			return
		end
		
		显示('合徽章中...')
		if 判断_城镇界面() then
			
			按下点击({1196 , 635 , 1233 , 676})--背包
			
		elseif 判断_打开背包界面() then
			if not 同步自动穿装备功能() then
				if not 判断_选中道具() then
					按下点击({15 , 76 , 93 , 112})
				else
					if not 判断_选中徽章() then
						按下点击({862 , 130 , 941 , 170})--徽章
						随机延时(600 , 800)
						
					else
						if not 判断_合成_入口() then
							显示('没有合成功能')
							return
							
						end
						
					end
					
				end
			end
			--[===[elseif 查找结果 then
			if 判断_合成结果_徽章() then
			已合成 = true
			清屏(true)
			return
			else
			查找结果 = false
			end]===]
		elseif 判断_合成结果_徽章() then
			已合成 = true
			清屏(true)
			return
		elseif 判断_徽章合成界面() then
			--随机延时(400 , 450)
			if 已合成 then
				清屏(true)
				return
			end
			if 判断_最大合成_徽章() then
				随机延时(300 , 400)
			else
				按下点击({1046 , 608 , 1199 , 650})--合成2
				随机延时(600 , 700)
				已合成 = true
				查找结果 = true
			end
			
		elseif 入口_确认(true) then
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--	随机延时(500 , 1000)
			end
		end
	end
end

function 功能_工会签到()
	
	显示('工会签到')
	初始化城镇界面()
	local 开始时间 = os.time()
	
	local 已领取 = false
	local 已签到 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 45 then
			显示('工会签到操作超时，强制退出')
			清屏(true)
			return
		end
		
		显示('工会签到中...')
		if 判断_城镇界面() then
			
			if not 判断_工会_入口() then
				
				return
			else
				按下点击({1206 , 355 , 1237 , 403})--工会
				随机延时(1000 , 1500)
			end
			
		elseif 判断_打开工会界面() then
			
			if 判断_申请加入_黄色() then
				显示('未加入工会')
				if not 判断_自由_工会申请() then
					按下点击({454 , 678 , 469 , 696})--
					
				elseif not 判断_可以加入() then
					
					按下点击({548 , 677 , 567 , 695})--
				else
					按下点击({752 , 668 , 871 , 704}) --一键申请
					随机延时(1000 , 1200)
					清屏(true)
					return
				end
			else
				if 判断_签到_已选中() then
					
					if 判断_0名_签到人数() then
						
						if 判断_已签到_灰色() and 已领取 then
							清屏(true)
							return
						else
							
							if not 已签到 then
								if 判断_未签到_黄色() then
									按下点击({292 , 657 , 473 , 704})--金币签到
								end
								已签到 = true
							elseif not 已领取 then
								
								按下点击({362 , 254 , 424 , 304})--领箱子
								已领取 = true
								
							end
							
						end
						
					end
				else
					按下点击({9 , 220 , 144 , 271})--签到入口
				end
				
			end
			
		elseif 入口_确认(true) then
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				
			end
		end
	end
end

function 功能_神秘商店()
	
	if not 同步全角色购买功能() then
		
		if not 同步印章勾选状态() and not 同步钥匙勾选状态() then
			
			if 当前 and tonumber(当前) and tonumber(当前) > 5 then
				print('未勾选买印章超过5个角色跳过执行')
				return
			end
		end
		
	end
	
	显示('神秘商店买印章')
	local 开始时间 = os.time()
	local 开始计时 = false
	local 等待 = false
	local 本轮已买 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		显示('买神秘商店中...')
		-- 检查是否超过1分钟
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if 开始计时 then
			if os.time() - 开始时间 > 60 then
				显示('神秘商店买印章操作超时，强制退出')
				清屏(true)
				return
			end
		end
		
		if 判断_城镇界面() then
			开始计时 = true
			按下点击({908 , 26 , 943 , 61})--神秘商店
			
		elseif 判断_打开神秘商店界面() then
			if not 等待 then
				随机延时(1700 , 2000)
				等待 = true
			end
			
			if not 本轮已买 then
				同步购买钥匙功能()
				同步购买金色小晶块_神秘商店功能()
				同步购买印章功能()
				同步购买品级调整箱功能()
				同步购买深渊碎片功能()
				同步购买幸运符碎片功能()
				同步购买变换石功能()
				同步购买征讨门票功能()
				随机延时(600 , 800)
				本轮已买 = true
			end
			
			if 判断_泰拉商品() or not 清屏_神秘商店购买() then
				if not 同步刷新神秘商功能() then
					清屏(true)
					显示('没找到刷新')
					return
				else
					显示('刷新神秘商店再判断')
					开始时间 = os.time()
					本轮已买 = false
				end
			else
				开始时间 = os.time()
			end
			
		elseif 清屏_神秘商店购买2() then	--购买2
			本轮已买 = false
			开始时间 = os.time()
		elseif 入口_确认(true) then
			开始时间 = os.time()
		elseif 判断_持有金额不足() then
			
			发送喵提醒_自定义('神秘商店检测到金币不足跳过执行')
			显示('持有金额不足')
			初始化城镇界面()
			return
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 1000)
			end
			
		end
	end
end

function 功能_分解宠物装备()
	初始化城镇界面()
	local 开始时间 = os.time()
	local 最大执行时间 = 30 -- 最多执行45秒
	local 开始计时 = false
	local 已分解 = false
	local 首次点打造 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			-- 检查执行时间是否超过限制
			if os.time() - 开始时间 > 最大执行时间 then
				显示("分解宠物装备操作超时，强制退出")
				清屏(true)
				return
			end
		end
		
		显示('分解宠物装备中...')
		if 判断_城镇界面() then
			开始计时 = true
			
			if 判断_宠物_入口() then
				显示('识别到宠物入口')
				随机延时(500 , 600)
			elseif not 首次点打造 then
				显示('首次点打造')
				按下点击({1018 , 645 , 1050 , 670})
				随机延时(500 , 600)
				首次点打造 = true
			elseif 判断_打造() then
				随机延时(500 , 600)
			else
				显示('没找到打造入口')
				return
			end
			
		elseif 判断_打开宠物界面() then
			print('打开宠物界面')
			随机延时(500 , 800)
			if 判断_未选中宠物装备() then
				显示('没有选中宠物装备')
				按下点击({10 , 140 , 133 , 197})--宠物装备
				--随机延时(1000 , 1500)
			else
				显示('选中了宠物装备')
				if not 判断_分解_宠物装备() then
					显示('没有分解功能')
					return
				end
			end
			
		elseif 判断_打开宠物装备分解界面() then
			print('代开宠物装备界面')
			--随机延时(500 , 800)
			
			if not 判断_宠物装备白装勾选状态() then
				按下点击({136 , 641 , 161 , 664})
				
			elseif not 判断_宠物装备蓝装勾选状态() then
				按下点击({268 , 643 , 290 , 664})
			elseif not 判断_分解宠物装备() or 判断_没有可分解的宠物装备() or 已分解 then
				显示('没有可分解的宠物装备')
				初始化城镇界面()
				return
			elseif not 已分解 then
				判断_分解宠物装备()
				已分解 = true
				
			end
			
		elseif 入口_确认() then
			print('找到确认了')
			--随机延时(500 , 800)
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 1000)
			end
		end
	end
	
end

function 功能_修炼()
	
	初始化城镇界面()
	
	local 开始时间 = os.time()
	local 最大执行时间 = 45 -- 最多执行45秒
	local 开始计时 = false
	local 魔力强化1 = false
	local 工会增益1 = false
	local 角色成就1 = false
	local 冒险全等级1 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			-- 检查执行时间是否超过限制
			if os.time() - 开始时间 > 最大执行时间 then
				显示("修炼操作超时，强制退出")
				清屏(true)
				return
			end
		end
		
		显示('修炼中...')
		if 判断_城镇界面() then
			开始计时 = true
			
			if 判断_修炼入口() then
				随机延时(500 , 600)
			elseif 判断_打造() then
				随机延时(500 , 600)
			else
				显示('没有找到修炼中入口')
				return
			end
			
		elseif 判断_打开修炼界面() then
			随机延时(400 , 500)
			if not 魔力强化1 then
				if not 判断_魔力强化已修炼() then
					按下点击({93 , 206 , 266 , 530})--魔力强化
					
				end
				开始时间 = os.time()
				魔力强化1 = true
			elseif not 工会增益1 then
				
				if not 判断_工会增益已修炼() then
					按下点击({407 , 260 , 573 , 392})
					
				end
				开始时间 = os.time()
				工会增益1 = true
			elseif not 角色成就1 then
				if not 判断_角色等级已修炼() then
					按下点击({732 , 269 , 864 , 377})
					
				end
				开始时间 = os.time()
				角色成就1 = true
			elseif not 冒险全等级1 then
				
				if not 判断_冒险团等级已修炼() then
					按下点击({1057 , 294 , 1154 , 397})
					
				end
				开始时间 = os.time()
				冒险全等级1 = true
			else
				显示('全部修炼完毕')
				--清屏(true)
				return
			end
		elseif 判断_打开解锁修炼界面() then
			
			if 判断_已解锁修炼() then
				显示('已解锁清屏')
				
				清屏(true)
			elseif 判断_修炼解锁() then
				
			else
				
				显示('不可修炼')
				清屏(true)
				
				return
			end
			
		elseif 入口_确认(true) then
			print('找到确认了')
			--随机延时(500 , 800)
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 1000)
			end
		end
	end
end

function 功能_制作深渊门票()
	local function 不可制作()
		
		local x , y = findMultiColor(1117 , 645 , 1219 , 693 , "737573-202020" , "5|13|7b7d7b-202020|25|26|848684-202020|60|24|848184-202020|83|8|7b7d7b-202020|65|-9|737573-202020|27|-8|737573-202020|1|6|7b7d7b-202020|9|10|847d84-202020" , 0 , 0.9)
		if x ~= - 1 and y ~= - 1 then
			return true
		end
		return false
	end
	local function 输入数量()
		local 开始时间 = os.time()
		local 制作 = false
		local 输入数量 = false
		while true do
			显示('输入数量中')
			随机延时(400 , 500)
			if os.time() - 开始时间 >= 10 then
				return false
			end
			
			if 判断_输入数量界面() then
				
				按下点击({1106 , 528 , 1166 , 592}) --最多输入
				输入数量 = true
			elseif 判断_打开制作界面() then
				
				if not 输入数量 then
					按下点击({963 , 564 , 1077 , 591})--
				else
					if not 制作 then
						if not 不可制作() then
							
							按下点击({1096 , 643 , 1257 , 695})--制作
							随机延时(600 , 800)
						else
							显示('不可制作')
							return
						end
						制作 = true
					else
						return
					end
				end
				
			elseif 入口_确认(true) then
				
			end
		end
		
	end
	
	初始化城镇界面()
	
	local 开始时间 = os.time()
	local 最大执行时间 = 45 -- 最多执行45秒
	local 开始计时 = false
	local 材料制作 = false
	local 替换制作 = false
	local 替换制作次数 = 0
	local 开始输入数量 = false
	local 输入数量2 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			-- 检查执行时间是否超过限制
			if os.time() - 开始时间 > 最大执行时间 then
				显示("制作深渊门票超时，强制退出")
				清屏(true)
				return
			end
		end
		
		显示('制作深渊门票中...')
		if 判断_城镇界面() then
			开始计时 = true
			
			if 判断_制作入口() then
				随机延时(500 , 600)
			elseif 判断_打造() then
				随机延时(500 , 600)
			else
				显示('没有找到制作入口')
				return
			end
			
		elseif 判断_打开制作界面() then
			随机延时(400 , 500)
			
			if 判断_其他已选中_制作() then
				
				if 判断_深渊失调次元_已选中() then
					
					if not 材料制作 then
						
						if 判断_材料已选中_制作() then
							
							if not 同步深渊门票种类() then
								
								材料制作 = true
							else
								输入数量()
							end
							
						else
							按下点击({220 , 73 , 307 , 107})
						end
						开始时间 = os.time()
					elseif not 替换制作 then
						
						if 判断_材料已选中_制作() then
							按下点击({352 , 78 , 407 , 108}) --替换
							
						else
							
							if not 判断_可替换深渊票() then
								
								替换制作 = true
							else
								
								替换制作次数 = 替换制作次数 + 1
								
								if 替换制作次数 >= 3 then
									显示('制作了两次退出制作')
									初始化城镇界面2()
									return
								else
									输入数量()
								end
							end
							
						end
						开始时间 = os.time()
					else
						显示('没有可制作的门票结束运行')
						清屏(true)
						return
					end
					
				else
					按下点击({19 , 348 , 144 , 390})
				end
				
			else
				判断_其他入口_制作()
			end
		elseif 判断_输入数量界面() then
			
			按下点击({1106 , 528 , 1166 , 592}) --最多输入
			
		elseif 入口_确认(true) then
			随机延时(400 , 500)
		else
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
			end
		end
	end
end

function 功能_领取角色邮箱()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 领取 = false
	local 删除 = false
	local 点击角色邮箱 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(900 , 1000)
		end
		首次运行 = false
		if 开始计时 then
			if os.time() - 开始时间 >= 随机数( 40 , 50) then
				return false
			end
		end
		
		if 快速检测游戏状态() then
			return
		end
		
		显示('领角色邮箱中...')
		if 判断_城镇界面() then
			开始计时 = true
			if not 领取 and not 删除 then
				
				if 判断_邮箱入口() then
					按下点击({356 , 612 , 395 , 641})--邮箱
				else
					显示('未找到邮箱入口')
					return false
				end
				
			else
				
				return false
			end
			
		elseif 判断_打开邮箱界面() then
			
			if not 点击角色邮箱 then
				随机延时(800 , 1000)
				按下点击({12 , 67 , 121 , 117})
				点击角色邮箱 = true
			elseif not 领取 then
				按下点击({621 , 656 , 718 , 688}) --领取全部
				领取 = true
			elseif not 删除 then
				按下点击({240 , 653 , 369 , 690})--删除移读邮箱
				删除 = true
			else
				清屏(true)
				return true
				
			end
			
		elseif 入口_确认(true) then
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--	随机延时(300 , 400)
			end
		end
	end
end

function 功能_领取冒险团邮箱()
	初始化城镇界面()
	local 开始时间 = os.time()
	local 领取全部物品 = false
	local 删除已读邮箱 = false
	local 点击冒险团邮箱 = false
	local 首次等待 = true
	local 等待立即领取 = false
	while true do
		
		if os.time() - 开始时间 >= 随机数( 60 , 70) then
			return false
		end
		
		if 快速检测游戏状态() then
			return false
		end
		if not 首次等待 then
			随机延时(900 , 1000)
		end
		首次等待 = false
		显示('领冒险团邮箱中...')
		if 判断_城镇界面() then
			
			if not 领取全部物品 and not 删除已读邮箱 then
				if 判断_邮箱入口() then
					按下点击({356 , 612 , 395 , 641})--邮箱
				else
					显示('未找到邮箱入口')
					return false
				end
				
			else
				
				return true
			end
		elseif 同步立即使用领取的物品功能() then
			
		elseif 判断_打开邮箱界面() then
			
			if not 点击冒险团邮箱 then
				随机延时(400 , 600)
				按下点击({16 , 148 , 107 , 190})
				点击冒险团邮箱 = true
			else
				if not 领取全部物品 then
					按下点击({683 , 650 , 777 , 689}) --领取全部
					随机延时(1000 , 1500)
					if 入口_确认(true) then
						随机延时(1500 , 2000)
						同步立即使用领取的物品功能()
					end
					领取全部物品 = true
				elseif not 删除已读邮箱 then
					按下点击({195 , 653 , 289 , 685})--删除移读邮箱
					删除已读邮箱 = true
				else
					
					return true
				end
			end
			
		else
			
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(300 , 400)
			end
			
			-- 安全清屏机制：避免界面异常时卡死
			
		end
	end
end
function 功能_领取官方邮箱()
	
	local 开始时间 = os.time()
	local 领取全部物品 = false
	local 删除已读邮箱 = false
	local 点击官方邮箱 = false
	local 首次等待 = true
	local 等待立即领取 = false
	while true do
		
		if os.time() - 开始时间 >= 随机数( 60 , 70) then
			return false
		end
		
		if 快速检测游戏状态() then
			return false
		end
		if not 首次等待 then
			随机延时(900 , 1000)
		end
		首次等待 = false
		显示('领官方邮箱中...')
		if 判断_城镇界面() then
			
			if not 领取全部物品 and not 删除已读邮箱 then
				if 判断_邮箱入口() then
					按下点击({356 , 612 , 395 , 641})--邮箱
				else
					显示('未找到邮箱入口')
					return false
				end
				
			else
				
				return true
			end
		elseif 同步立即使用领取的物品功能() then
			
		elseif 判断_打开邮箱界面() then
			
			if not 点击官方邮箱 then
				随机延时(400 , 600)
				按下点击({20 , 222 , 132 , 263})
				点击官方邮箱 = true
			else
				if not 领取全部物品 then
					按下点击({693 , 659 , 770 , 686}) --领取全部
					随机延时(1000 , 1500)
					if 入口_确认(true) then
						随机延时(1500 , 2000)
						同步立即使用领取的物品功能()
					end
					领取全部物品 = true
				elseif not 删除已读邮箱 then
					按下点击({195 , 653 , 289 , 685})--删除移读邮箱
					删除已读邮箱 = true
				else
					
					return true
				end
			end
			
		else
			
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(300 , 400)
			end
			
			-- 安全清屏机制：避免界面异常时卡死
			
		end
	end
end

function 功能_存ss武器()
	local 开始时间 = os.time()
	local 首次运行 = true
	local 选中等级部位 = false
	while true do
		if 快速检测游戏状态() then
			return true
			
		elseif os.time() - 开始时间 > 30 then
			return true
		end
		if not 首次运行 then
			随机延时(900 , 1000)
		end
		首次运行 = false
		
		if 判断_打开背包界面() then
			
			if 判断_选中装备() then
				
				if not 选中等级部位 then
					if not 判断_等级_背包部位() then
						按下点击({852 , 676 , 935 , 704}) --选择部位
						随机延时(700 , 800)
						按下点击({854 , 563 , 966 , 604})--等级
					else
						选中等级部位 = true
					end
				else
					if 判断_ss框() or 判断_不可穿戴武器() then
						
						按下点击({860 , 203 , 918 , 251})
						随机延时(500 , 600)
						if 判断_存入金库() then
							按下点击({953 , 202 , 996 , 247})
							随机延时(200 , 300)
							按下点击({1032 , 201 , 1082 , 246})
							随机延时(200 , 300)
							按下点击({1112 , 203 , 1168 , 244})
							随机延时(200 , 300)
							按下点击({1197 , 199 , 1253 , 248})
							随机延时(200 , 300)
							return true
						else
							return false
						end
						
					else
						if not 判断_ss框() and not 判断_不可穿戴武器() then
							显示('没有ss装备')
							return false
						end
						
					end
					
				end
				
			else
				按下点击({865 , 70 , 942 , 108})--装备
			end
			
		else
			return false
			
		end
		
	end
	
end

function 功能_存武器_待更新()
	-- 同步角色仓库功能()
	
	local 首次运行 = true
	local 开始时间 = os.time()
	local 初始化角色仓库 = false
	local 初始化冒险团仓库 = false
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if os.time() - 开始时间 > 30 then
			return
		end
		if 同步角色仓库功能() then
			if not 初始化角色仓库 then
				按下点击({198 , 77 , 282 , 111})
				初始化角色仓库 = true
			end
		else
			if not 初始化冒险团仓库 then
				按下点击({326 , 79 , 392 , 115})
				初始化冒险团仓库 = true
			end
		end
		
		if not 判断_拓展金库() then
			
		end
		
	end
	
end

function 功能_一键存仓()
	--初始化城镇界面()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 找深渊门票 = false
	local 找深渊门票次数 = 0
	local 有可存物品 = false
	local 存史诗武器 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			if os.time() - 开始时间 > 60 then
				显示('一键存仓操作超时，强制退出')
				清屏(true)
				return
			end
		end
		
		显示('存仓库功能运行中....')
		if 判断_城镇界面()then
			开始计时 = true
			按下点击({1193 , 632 , 1237 , 676})--背包
			
		elseif 判断_打开背包界面() then
			
			if not 同步自动穿装备功能() then
				
				if 入口_金库() then
					
				elseif 判断_冒险团金库() then
					
				elseif 判断_选中冒险团金库() then
					
					if 判断_关闭_自动存入() then
						
						按下点击({671 , 420 , 781 , 461})--设置自动存放
						
					elseif 判断_开启_自动存入() then
						
						if not 存史诗武器 then
							
							if 同步存史诗武器功能() then
								
								if not 功能_存ss武器() then
									
									存史诗武器 = true
								else
									if 判断_存入金库() then
										按下点击({705 , 289 , 758 , 331})--存入
										
									end
								end
							else
								存史诗武器 = true
							end
						else
							if 判断_选中材料项() then
								
								if 同步存深渊门票功能() then
									开始时间 = os.time()
									print(' 找到 ')
									有可存物品 = true
									找深渊门票 = true
									
									if 判断_存入金库() then
										按下点击({705 , 289 , 758 , 331})--存入
										
									end
									
								else
									
									找深渊门票次数 = 找深渊门票次数 + 1
									
									if 找深渊门票次数 >= 3 then
										
										return
									else
										滑动(1096 , 597 , 1098 , 263 , 5 , 5 , {10 , 35} , {400 , 500} , {500 , 600})
										
									end
									
								end
								
							else
								按下点击({1090 , 74 , 1146 , 113})--材料
								print('未选中材料项')
							end
							
						end
						
					end
					
				end
				
			end
			
		elseif 判断_自动存放设置() then
			
			按下点击({796 , 126 , 889 , 161})--开启
			随机延时(800 , 1000)
			按下点击({876 , 61 , 898 , 83})--关闭自动存放窗口
			
		elseif 入口_确认() then
			if 有可存物品 then
				return
			end
		else
			if 清屏(true) then
				
			end
		end
	end
end

function 功能_领取每日成就()
	显示('领每日成就')
	--[===[初始化城镇界面()]===]
	local 开始时间 = os.time()
	local 开始计时 = false
	
	local 超时未找到每日成就 = os.time()
	
	local 每日成就 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(900 , 1000)
		end
		首次运行 = false
		--[===[if 快速检测游戏状态() then
		显示('领每日成就..检测到游戏闪退')
		开始时间 = os.time()
		end]===]
		-- 检查是否超过1分钟
		
		if os.time() - 开始时间 > 50 then
			显示('超时未找到每日成就，强制退出')
			清屏(true)
			return
		end
		
		显示('领每日成就中...')
		if 判断_城镇界面() then
			
			if not 判断_每日成就_入口() then
				
				按下点击({1106 , 633 , 1148 , 672})--冒险
				
			end
			
		elseif 判断_打开成就界面() then
			每日成就 = true
			if 判断_每日成就_未选中() then
				随机延时(800 , 1200)
				
			elseif 判断_每日成就_已选中() then
				随机延时(300 , 400)
				
				if not 判断_已勾选_显示达成的成就() then
					if not 判断_微信启动() then
						
						if 判断_每日成就_不可领取() then
							清屏(true)
							break
						else
							按下点击({1090 , 661 , 1188 , 692}) --签到
						end
						
					end
				end
				
			end
		elseif 判断_选择角色界面() then
			
			点击_开始游戏()
			开始时间 = os.time()
		elseif 判断_开始游戏界面() then
			
			按下点击({593 , 505 , 688 , 529})--开始游戏
			
		elseif 入口_确认() then
			--随机延时(500 , 700)
			
		elseif 清屏(true) then
			print('执行清屏操作，避免界面卡死')
			随机延时(500 , 600)
		else
			
			if 打开(地下城) then
				开始时间 = os.time()
			end
			
		end
	end
end

function 功能_领取疲劳()
	
	local 开始时间 = os.time()
	local 开始计时 = false
	local 已领取福利 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(900 , 1000)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			-- 检查是否超过1分钟
			if os.time() - 开始时间 > 60 then
				显示('每日成就操作超时，强制退出')
				清屏(true)
				return
			end
		end
		
		显示('领取疲劳中...')
		if 判断_城镇界面() then
			开始计时 = true
			--按下点击({766 , 35 , 801 , 63})--福利
			
			if 判断_福利_入口() then
				--随机延时(800 , 1200)
			else
				显示('未找到福利入口')
				return
			end
			
		elseif 判断_打开福利界面() then
			
			if not 已领取福利 then
				sleep(500)
				if not 判断_领取奖励_黑钻() then
					显示('黑钻奖励已领取')
				end
				已领取福利 = true
			else
				
				if 判断_冲级能量站() then
					随机延时(600 , 800)
				elseif 判断_领取疲劳() then
					
				else
					清屏(true)
					return
				end
			end
			
		else
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(400 , 500)
			end
			
		end
	end
end

function 功能_黑钻深渊()
	
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	
	local 进入副本次数 = 0 -- 新增：记录进入副本的次数
	local 已经返回城镇 = false -- 新增：标记是否已经从副本返回过城镇
	
	local 未找到副本时间 = os.time()
	local 找到副本 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		显示('黑钻深渊功能运行中...')
		local 当前时间 = os.time()
		if 快速检测游戏状态() then
			未找到副本时间 = os.time()
			-- 不退出，继续执行副本功能
		end
		
		if 判断_城镇界面() then
			
			上次城镇判断时间 = 当前时间 -- 更新判断时间
			--随机延时(1000 , 1500)
			local 当前疲劳值 = 功能_获取疲劳值()
			if 当前疲劳值 < 5 then
				return
			end
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if 当前时间 - 上次城镇点击时间 > 10 then
				显示('执行城镇界面操作')
				if not 判断_委托_城镇入口() then
					
					return
				end
				
				判断_委托界面超时()
				上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			else
				显示('城镇界面操作冷却中，跳过...')
			end
		elseif 判断_委托界面() then
			-- 离开难度选择界面，清除120秒计时
			--随机延时(800 , 1200)
			
			if 判断_日常地下城() then
				--随机延时(1000 , 2000)
			elseif 判断_当前委托() then
				--随机延时(1000 , 2000)
			elseif 入口_深渊() then
				--随机延时(1000 , 2000)
			else
				显示('未找到暴走研究所')
				return
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
		elseif 判断_深渊难度界面() then--判断_难度选择界面()
			
			if 判断_黑钻免费入场() then
				
				按下点击({1094 , 646 , 1229 , 683}) --入场
				
			else
				显示('没有黑钻免费次数了')
				初始化城镇界面2()
				return
			end
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			
		elseif 判断_副本中() then
			-- 如果之前已经返回过城镇，增加进入副本次数
			if 已经返回城镇 then
				进入副本次数 = 进入副本次数 + 1
				已经返回城镇 = false -- 重置标记
				显示('第' .. 进入副本次数 .. '次进入副本')
			end
			
			自动刷图()
		elseif 判断_装备修理()then
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			已经返回城镇 = true -- 标记已经返回过城镇
			
			功能_返回城镇界面获取疲劳值()
			-- 根据进入副本的次数决定操作
			if 进入副本次数 >= 1 or 功能_获取疲劳值() < 5 then
				-- 第二次返回城镇，执行返回城镇
				显示('第' .. (进入副本次数 + 1) .. '次返回城镇，返回城镇')
				入口_返回城镇()
				一直在返回城镇界面()
				while true do
					sleep(1000)
					if 检测游戏是否闪退() or 判断_委托界面() or 判断_城镇界面() or 判断_深渊难度界面() then
						
						return
					elseif 判断_副本中() then
						
						自动刷图()
					elseif 判断_返回城镇() then
						break
					else
						
						清屏(true)
						
					end
				end
				
			else
				-- 第一次返回城镇，执行再次挑战
				显示('第一次返回城镇，执行再次挑战')
				
				if 入口_再次挑战() then
					--一直在再次挑战界面()
				else
					入口_返回城镇()
					
					一直在返回城镇界面()
					
					while true do
						sleep(1000)
						if 检测游戏是否闪退() or 判断_委托界面() or 判断_城镇界面() or 判断_深渊难度界面() then
							
							return
						elseif 判断_副本中() then
							
							自动刷图()
						elseif 判断_返回城镇() then
							break
						else
							
							清屏(true)
							
						end
					end
					
				end
				
				-- 等待界面切换完成，避免立即进入一直在返回城镇界面的循环
			end
		else
			
			显示('加载中...')
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				未找到副本时间 = os.time()
				print('执行清屏操作，避免界面卡死')
				
			end
		end
		
	end
end

function 功能_排位赛()
	print('执行排位赛3次')
	初始化城镇界面()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 脚本结束 = false -- 新增：标记脚本是否应该结束
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	local 进入对战次数 = 0 -- 新增：记录进入副本的次数
	local 已经返回排位赛界面 = false -- 新增：标记是否已经从对战界面返友谊赛界面
	local 运行时间 = os.time()
	local 首次滑动 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		local 当前时间 = os.time()
		if 快速检测游戏状态() then
			未找到对战界面时间 = os.time()
			-- 不退出，继续执行副本功能
		end
		
		if os.time() - 运行时间 > 60 then
			显示('超时未进入对战界面强制结束')
			初始化城镇界面()
			return
		end
		
		显示('排位赛中...')
		if 判断_城镇界面() then
			-- 离开难度选择界面，清除40秒计时
			if not 首次滑动 then
				滑动(202 , 522 , 203 , 676 , 3 , 3 , {10 , 30} , {1000 , 1500})
				首次滑动 = true
				
			else
				上次城镇判断时间 = 当前时间 -- 更新判断时间
				
				-- 检查是否已经过了足够的间隔时间（10秒）
				if 当前时间 - 上次城镇点击时间 > 10 then
					显示('执行城镇界面操作')
					if not 判断_对战_入口() then
						显示('未找到对战入口')
						return
					end
					
				else
					显示('排位赛...城镇界面操作冷却中，跳过...')
				end
			end
			
		elseif 判断_排位赛界面() then
			按下点击({851 , 480 , 998 , 518})--个人排位赛
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			--随机延时(1000 , 2000)
			
		elseif 判断_修改冒险团名字() then
			按下点击({479 , 301 , 824 , 331})--输入框
			随机延时(1000 , 1500)
			for i = 1 , 20 do
				imeLib.deleteChar()
				随机延时(30 , 60)
			end
			随机延时(300 , 400)
			if 功能_随机昵称() then
				按下点击({543 , 11 , 773 , 61})
				
				随机延时(1000 , 1200)
				入口_确认(true)
			end
			
		elseif 判断_友谊赛界面() then
			
			已经返回排位赛界面 = true -- 已经返回排位赛界面
			
			if 进入对战次数 >= 3 then
				
				显示('第' .. (进入对战次数 + 1) .. '次友谊赛界面，结束对战')
				
				while true do
					if 检测游戏是否闪退() then
						发送喵提醒_自定义('排位赛功能检测到游戏闪退及时上线查看')
						return
					end
					随机延时(1000 , 1500)
					显示('退出排位赛中...')
					if 判断_排位赛界面() then
						按下点击({271 , 465 , 299 , 490})--战斗任务
						--随机延时(800 , 1000)
					elseif 判断_一键领取决斗任务() then
						--随机延时(800 , 1000)
						
					elseif 入口_确认() then
						--随机延时(800 , 1000)
					elseif 判断_没有可领取决斗任务() then
						清屏(true)
						return
					else
						if 清屏(true) then
							--随机延时(800 , 1000)
						end
						
					end
					
				end
			else
				
				按下点击({679 , 650 , 785 , 684})--友谊赛
				--随机延时(1000 , 2000)
				
			end
			
		elseif 判断_排位赛加载界面() then
			
		elseif 判断_对战界面() then
			-- 成功进入副本，标记为true
			
			-- 如果之前已经返回过城镇，增加进入副本次数
			if 已经返回排位赛界面 then
				进入对战次数 = 进入对战次数 + 1
				已经返回排位赛界面 = false -- 重置标记
				显示('第' .. 进入对战次数 .. '次进入对战')
			end
			按下点击({614 , 3 , 669 , 30})--此轮
			运行时间 = os.time()
			
		elseif 判断_猫图设置界面() then
			按下点击({1051 , 613 , 1122 , 670})--返回城镇
		elseif 判断_技能加点界面() then
			功能_技能加点配置()
			初始化城镇界面()
			return
			
		elseif 入口_确认(true) then
			--随机延时(1000 , 2000)
			
		else
			
			-- 离开难度选择界面，清除40秒计时
			
			显示('加载中...')
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 600)
			end
		end
		
	end
end

function 功能_排位赛_自定义次数()
	print('执行排位赛')
	初始化城镇界面()
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 脚本结束 = false -- 新增：标记脚本是否应该结束
	
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	
	local 进入对战次数 = 0 -- 新增：记录进入副本的次数
	local 已经返回排位赛界面 = false -- 新增：标记是否已经从对战界面返友谊赛界面
	
	-- 从UI输入框获取PK次数
	local 目标pk次数 = 获取pk次数()
	print('设置的PK次数为: ' .. 目标pk次数)
	
	local 首次滑动 = false
	
	local 运行时间 = os.time()
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		local 当前时间 = os.time()
		if 快速检测游戏状态() then
			未找到对战界面时间 = os.time()
			-- 不退出，继续执行副本功能
		end
		
		if os.time() - 运行时间 > 60 then
			显示('超时未进入对战界面强制结束')
			初始化城镇界面()
			return
		end
		
		显示('排位赛中...')
		if 判断_城镇界面() then
			-- 离开难度选择界面，清除40秒计时
			if not 首次滑动 then
				滑动(202 , 522 , 203 , 676 , 3 , 3 , {10 , 30} , {1000 , 1500})
				首次滑动 = true
			else
				上次城镇判断时间 = 当前时间 -- 更新判断时间
				
				-- 检查是否已经过了足够的间隔时间（10秒）
				if 当前时间 - 上次城镇点击时间 > 10 then
					显示('执行城镇界面操作')
					if not 判断_对战_入口() then
						显示('未找到对战入口')
						return
					end
					
				else
					显示('排位赛...城镇界面操作冷却中，跳过...')
				end
			end
			
		elseif 判断_排位赛界面() then
			按下点击({851 , 480 , 998 , 518})--个人排位赛
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			--随机延时(1000 , 2000)
		elseif 入口_确认(true) then
			--随机延时(1000 , 2000)
		elseif 判断_友谊赛界面() then
			
			已经返回排位赛界面 = true -- 已经返回排位赛界面
			
			if 进入对战次数 >= 目标pk次数 then
				
				显示('第' .. (进入对战次数 + 1) .. '次友谊赛界面，结束对战')
				
				while true do
					if 检测游戏是否闪退() then
						发送喵提醒_自定义('排位赛功能检测到游戏闪退及时上线查看')
						return
					end
					随机延时(1000 , 1500)
					显示('退出排位赛中...')
					if 判断_排位赛界面() then
						按下点击({271 , 465 , 299 , 490})--战斗任务
						--随机延时(800 , 1000)
					elseif 判断_一键领取决斗任务() then
						--随机延时(800 , 1000)
						
					elseif 入口_确认() then
						--随机延时(800 , 1000)
					elseif 判断_没有可领取决斗任务() then
						清屏(true)
						return
					else
						if 清屏(true) then
							--随机延时(800 , 1000)
						end
						
					end
					
				end
			else
				
				按下点击({679 , 650 , 785 , 684})--友谊赛
				--随机延时(1000 , 2000)
				
			end
			
		elseif 判断_排位赛加载界面() then
			
		elseif 判断_对战界面() then
			-- 成功进入副本，标记为true
			
			-- 如果之前已经返回过城镇，增加进入副本次数
			if 已经返回排位赛界面 then
				进入对战次数 = 进入对战次数 + 1
				已经返回排位赛界面 = false -- 重置标记
				显示('第' .. 进入对战次数 .. '次进入对战')
			end
			按下点击({614 , 3 , 669 , 30})--此轮
			运行时间 = os.time()
			
		elseif 判断_猫图设置界面() then
			按下点击({1051 , 613 , 1122 , 670})--返回城镇
		elseif 判断_技能加点界面() then
			功能_技能加点配置()
			初始化城镇界面()
			return
		else
			
			-- 离开难度选择界面，清除40秒计时
			
			显示('加载中...')
			
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 600)
			end
		end
		
	end
end

function 功能_哥布林()
	显示("执行日常:哥布林")
	
	local 冷却点击 = 0
	local 找到副本时间 = os.time()
	local 找到副本 = false
	local 等待燃烧界面加载 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			找到副本时间 = os.time()
		end
		
		显示('黄金哥布林运行中')
		
		if not 找到副本 then
			if os.time() - 找到副本时间 > 120 then
				
				发送喵提醒_自定义(' 进入哥布林副本超时跳过执行')
				return
				
			end
		end
		
		if 判断_城镇界面() then
			-- 离开难度选择界面，清除40秒计时
			
			-- 检查是否已经过了足够的间隔时间（10秒）
			if os.time() - 冷却点击 > 10 then
				显示('执行城镇界面操作')
				if not 判断_委托_城镇入口() then
					
					return
				end
				判断_委托界面超时()
				
			else
				显示('城镇界面操作冷却中，跳过...')
			end
		elseif 判断_委托界面() then
			
			if 判断_当前委托() then
				
			elseif 判断_日常地下城() then
				
			elseif 入口_哥布林() then
				
			elseif 入口_哥布林已完成() then
				显示('哥布林已完成')
				return
			else
				显示('未找到哥布林金库')
			end
			冷却点击 = os.time()
		elseif 判断_哥布林金库选择难度界面() then
			
			if 判断_委托不可入场() then
				
				清屏(true)
				return
			elseif 判断_速通_可速通() then
				
			else
				if 入口_前往可入场_入场() then
					随机延时(2000 , 2500)
				end
				
			end
			
		elseif 判断_加载界面() then
			
		elseif 判断_副本中() then
			找到副本 = true
			自动刷图()
		elseif 入口_确认(true) then
			
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			
			入口_返回城镇()
			
			初始化城镇界面()
			return
		else
			显示('加载中...')
			
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
			end
		end
	end
	
end

function 功能_半自动刷图()
	while true do
		sleep(1000)
		显示('半自动功能运行中')
		if 判断_副本中() then
			
			自动刷图()
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			
			if 判断_副本中疲劳值为0() then
				
				if 入口_返回城镇() then
					
					sleep(1000)
				end
			else
				入口_再次挑战()
				
			end
		elseif 入口_确认(true) then
			
		end
	end
end

function 功能_塔尔坦()
	
	local 上次城镇判断时间 = 0 -- 新增：记录上次判断城镇的时间
	local 上次城镇点击时间 = 0 -- 新增：记录上次城镇点击的时间
	--超时退出
	local 查找塔尔坦 = os.time()
	local 找到塔尔坦 = false
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			显示('检测到游戏闪退，继续执行副本功能')
			
			-- 不退出，继续执行副本功能
		end
		
		显示('大深渊中......')
		local 当前时间 = os.time()
		
		if 判断_城镇界面() then
			-- 离开难度选择界面，清除120秒计时
			
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
			
		elseif 判断_副本中() then
			
			自动刷图()
			
		elseif 判断_委托界面() then
			
			if 判断_过往委托() then
				
			elseif 判断_日常地下城() then
				
			elseif 判断_塔尔坦炼器所() then
			else
				显示('未找到塔尔坦结束该功能')
				return
			end
			
			上次城镇点击时间 = 当前时间 -- 更新最后点击时间
			
		elseif 判断_塔尔坦选择难度界面()then
			
			if 判断_未选择部位 () then
				
			else
				
				if 判断_委托不可入场() then
					--随机延时(200 , 800)
					清屏(true)
					return
					
				else
					
					if 入口_前往可入场_入场() then
						随机延时(2000 , 2500)
					end
				end
			end
		elseif 判断_选择特化部位界面() then
			
		elseif 判断_加载界面() then
			
		elseif 入口_确认(true) then
			--随机延时(2000 , 3000)
			
		elseif 判断_装备修理()then
			随机延时(800 , 1500)
			按下点击({977 , 604 , 1163 , 651})--修理
			随机延时(300 , 500)
			清屏(true)
		elseif 判断_返回城镇() then
			
			功能_返回城镇界面获取疲劳值()
			
			if 入口_再次挑战() then
				
			else
				显示('没有门票了返回城镇')
				入口_返回城镇()
				while true do
					sleep(1000)
					if 判断_城镇界面() then
						return
					elseif 检测游戏是否闪退() then
						break
					elseif 判断_副本中() then
						自动刷图()
					elseif 判断_返回城镇() then
						break
						
					else
						清屏(true)
					end
				end
			end
			
		else
			
			显示('加载中...')
			-- 安全清屏机制：避免界面异常时卡死
			if 清屏(true) then
				print('执行清屏操作，避免界面卡死')
				--随机延时(500 , 1000)
				
			end
		end
		
	end
	
end

function 功能_自动转职()
	
	for i = 1 , 5 do
		local x , y = findMultiColor(125 , 110 , 287 , 166 , "ceb29c-202020" , "0|11|c5a68c-202020|-8|9|fffbff-202020|-7|12|ffffff-202020|14|9|d6bea4-202020|16|4|debead-202020|-3|15|ce9e84-202020|61|21|d6beb5-202020|71|-1|e6d7ce-202020|72|-5|e6dfd6-202020|-1|-21|ffffff-202020|0|-21|ffffff-202020|1|-6|d6ba9c-202020|-64|-3|fffbff-202020|-64|17|fffbf7-202020|-24|3|f7fbf7-202020|-23|0|ffffff-202020|-37|-19|bd9e84-202020|-29|-4|f7fbf7-202020|-38|-4|fffbff-202020|63|-21|ffffff-202020|35|-21|ffffff-202020|23|18|f7efe6-202020" , 0 , 0.9)
		if x ~= - 1 and y ~= - 1 then ---女鬼剑 驭剑士
			显示('女鬼剑转任影')
			
			按下点击({1115 , 188 , 1246 , 568}) --转任影
			return true
		end
		setDict(0 , "主线相关.txt")
		useDict(0)
		local ret2 , x2 , y2 = findStr(118 , 89 , 305 , 191 , "元素师" , "ffffff-303030" , 0.85 , 10 , 10)
		if x2 ~= - 1 and y2 ~= - 1 then ---
			显示('魔法师转小魔女')
			
			按下点击({1123 , 266 , 1174 , 579}) --魔女
			随机延时(300 , 400)
			按下点击({1123 , 266 , 1174 , 579}) --魔女
			return true
		end
		
		local x1 , y1 = findMultiColor(104 , 110 , 319 , 165 , "ce8aa4-202020" , "-28|-6|ffffff-202020|97|-2|c58ea4-202020|123|-22|cea2b5-202020|43|1|c58ea4-202020|43|15|bd92a4-202020|67|-5|fff7f7-202020|61|-21|deb6c5-202020|43|-3|ce96ad-202020|40|-10|eff3ef-202020|-16|-17|fff7f7-202020|-29|5|e6cdde-202020|8|-26|f7f7f7-202020|-48|20|eff3f7-202020|-47|21|c596ad-202020|-54|-25|ffffff-202020|-60|-2|ffffff-202020|-46|-6|fffbf7-202020|-71|16|dea6bd-202020|-61|-11|fffbff-202020" , 0 , 0.9)
		if x1 ~= - 1 and y1 ~= - 1 then ---男枪手 漫游
			显示('男枪转弹药')
			
			按下点击({1069 , 165 , 1249 , 597}) --转弹药
			return true
		end
		
		sleep(100)
	end
	
	return false
end

function 功能_设置消耗品()
	初始化城镇界面2()
	local 开始时间 = os.time()
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		显示('自动设置血药中')
		if 检测游戏是否闪退() then
			return
		end
		
		if os.time() - 开始时间 > 40 then
			return
		end
		
		if 判断_城镇界面() then
			按下点击(1253 , 130) --设置
			
		elseif 判断_设置界面() then
			
			if not 判断_消耗品已选中_设置界面() then
				显示('消耗品未选中...')
				按下点击({140 , 251 , 253 , 292})
			elseif 判断_没用可配置的消耗品() then
				return
			else
				按下点击({404 , 329 , 421 , 346}) --开启
				随机延时(200 , 300)
				按下点击({826 , 332 , 839 , 343})--开启2
				随机延时(400 , 500)
				按下点击({555 , 424 , 559 , 434})
				随机延时(400 , 500)
				按下点击({973 , 423 , 979 , 435})
				break
			end
		else
			if 清屏(true) then
				
			end
			
		end
		
	end
	
end

function 功能_学习技能()
	local function 判断_技能入口()
		local x , y = findMultiColor(801 , 528 , 1074 , 589 , "ffbec5-202020" , "16|14|d6d2bd-202020|9|10|adae9c-202020|12|8|adae9c-202020|17|10|bdc2b5-202020|15|6|e6e7ce-202020|13|7|cecab5-202020|7|8|adaea4-202020|-2|5|b5b2ad-202020|-5|10|bdc2ad-202020|-4|14|a4a294-202020|-4|11|c5c6b5-202020|-9|13|cecaad-202020|-9|13|cecaad-202020|-9|8|c5c6b5-202020|-9|6|cecabd-202020|-10|-14|ff8a5a-202020|-1|-13|ffe3b5-202020|-3|-12|deae84-202020|-5|-5|f7817b-202020|-5|-5|f7817b-202020|-5|-5|f7817b-202020|2|-9|f7aa7b-202020|2|-10|f7ae7b-202020|7|-14|f7a673-202020|12|-12|ffa2a4-202020|10|-13|f7926b-202020|9|-17|ff9231-202020|-2|-17|f7dfad-202020|-3|-16|f7ebad-202020" , 0 , 0.9)
		
		if x ~= - 1 and y ~= - 1 then
			按下点击(x , y)
			return true
		end
		return false
	end
	local 开始时间 = os.time()
	local 首次点击角色 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		显示('学习技能中...')
		if 检测游戏是否闪退() then
			return
		end
		
		if os.time() - 开始时间 > 60 then
			return
		end
		
		if 判断_城镇界面() then
			
			if 判断_技能入口() then
				print('识别到技能入口了')
			elseif not 首次点击角色 then
				按下点击({922 , 648 , 968 , 682})--角色入口
				随机延时(300 , 400)
				首次点击角色 = true
			elseif 判断_角色入口() then
				
				随机延时(300 , 400)
			else
				显示('未找到学习技能入口')
				return
			end
		elseif 判断_技能加点界面() then
			功能_技能加点配置()
			初始化城镇界面()
			return
			
		else
			if 清屏(true) then
				
			end
			
		end
		
	end
end
function 功能_获取当前角色抗魔值()
	if not 同步云端功能() then
		return false
	end
	初始化城镇界面()
	local 首次运行 = true
	local 当前角色抗魔值 = nil
	local 运行时间 = os.time()
	while true do
		
		if not 首次运行 then
			随机延时(600 , 800)
		end
		
		首次运行 = false
		显示('获取抗魔值中...')
		if os.time() - 运行时间 > 50 then
			显示('获取抗魔值超时...')
			return
		end
		if 判断_城镇界面() then
			
			按下点击({1201 , 644 , 1232 , 676}) --背包
			随机延时(350 , 400)
		elseif 判断_打开背包界面() then
			当前角色抗魔值 = 判断_抗魔值()
			当前泰拉数量 = 判断_泰拉数量()
			
			if 当前角色抗魔值 ~= nil and 判断_泰拉数量 ~= nil then
				
				return
			else
				显示('未能获取到当前角色抗魔值')
			end
		else
			清屏(true)
		end
		
	end
	
end

-- 红点区域配置
local 红点区域 = {
	左 = {135 , 55 , 172 , 284} ,
	右 = {332 , 54 , 350 , 538} ,
	最右 = {762 , 271 , 1244 , 355}
}

-- 通用红点检测函数（返回所有红点）
function 检测所有红点(x1 , y1 , x2 , y2)
	setDict(0 , "限时活动.txt")
	useDict(0)
	
	-- 循环5次尝试查找，提高识别成功率
	for i = 1 , 5 do
		local 红点字符串 = findStrEx(x1 , y1 , x2 , y2 , "红点" , "ff3910-303030|de0c00-303030" , 0.8 , 10 , 10)
		
		-- findStrEx 返回的是 JSON 字符串，需要解析
		if 红点字符串 ~= nil and 红点字符串 ~= "" then
			-- 使用 jsonLib.decode 解析 JSON 字符串为表
			local 红点列表 = jsonLib.decode(红点字符串)
			if 红点列表 ~= nil and type(红点列表) == "table" and #红点列表 > 0 then
				return 红点列表
			end
		end
		
		-- 如果没找到，短暂延时后重试
		
		sleep(80)
		
	end
	
	-- 5次都没找到，返回空表
	return {}
end

-- 检查坐标是否已经点击过（允许10像素误差）
function 是否已点击过(已点击列表 , x , y)
	for i = 1 , #已点击列表 do
		local 记录 = 已点击列表[i]
		if math.abs(记录.x - x) <= 10 and math.abs(记录.y - y) <= 10 then
			return true
		end
	end
	return false
end
function 检测可领取东西()
	local 首次运行 = true
	local 运行时间 = os .time()
	while true do
		显示('检测可领取的东西')
		随机延时(400 , 500)
		
		if 检测游戏是否闪退() or os .time() - 运行时间 > 15 then
			return
		end
		
		if 判断_打开活动界面() then
			
			if 判断_领取_限时活动() then
				随机延时(300 , 400)
				运行时间 = os .time()
			else
				显示('没有可领取的东西')
			end
			
			return
		elseif 判断_城镇界面() then
			return
		elseif 入口_确认(true) then
			随机延时(300 , 400)
		end
		
	end
	
end
function 领限定红点()
	
	if not 同步临时活动功能() then
		return
	end
	local 已点击左侧红点列表 = {}
	local 已点击右侧红点列表 = {}
	local 运行时间 = os.time()
	
	while true do
		随机延时(600 , 700)
		
		if 检测游戏是否闪退() or os.time() - 运行时间 > 120 then
			显示('超时或闪退，退出')
			return
		end
		
		if not 判断_打开活动界面() then
			
			if 入口_确认(true) then
				随机延时(300 , 400)
			end
		else
			-- 第一步：检测并记录所有左侧红点
			local 左侧红点列表 = 检测所有红点(红点区域.左[1] , 红点区域.左[2] , 红点区域.左[3] , 红点区域.左[4])
			
			if #左侧红点列表 == 0 then
				显示('没有剩余左侧活动，退出')
				return
			end
			
			-- 按y坐标排序，从上到下
			table.sort(左侧红点列表 , function(a , b) return a.y < b.y end)
			
			-- 找第一个未处理的左侧红点
			local 待处理左侧 = nil
			local 待处理左侧索引 = 0
			for i = 1 , #左侧红点列表 do
				local 左侧 = 左侧红点列表[i]
				if not 是否已点击过(已点击左侧红点列表 , 左侧.x , 左侧.y) then
					待处理左侧 = 左侧
					待处理左侧索引 = i
					break
				end
			end
			
			if 待处理左侧 == nil then
				显示('所有左侧活动已点完，退出')
				return
			end
			
			-- 第二步：点击第一个未处理的左侧红点
			显示('点左侧第' .. 待处理左侧索引 .. '个: (' .. 待处理左侧.x .. ',' .. 待处理左侧.y .. ')')
			按下点击(待处理左侧.x , 待处理左侧.y , - 136 , 1 , - 1 , 50)
			随机延时(800 , 900)
			
			-- 记录左侧已点击
			table.insert(已点击左侧红点列表 , {x = 待处理左侧.x , y = 待处理左侧.y})
			
			-- 第三步到第七步：循环处理右侧红点
			local 右侧处理完成 = false
			while not 右侧处理完成 do
				if 检测游戏是否闪退() or os.time() - 运行时间 > 120 then
					return
				end
				
				-- 第三步：每次都重新检测右侧红点
				local 右侧红点列表 = 检测所有红点(红点区域.右[1] , 红点区域.右[2] , 红点区域.右[3] , 红点区域.右[4])
				
				if #右侧红点列表 == 0 then
					显示('右侧活动已全部点完')
					右侧处理完成 = true
				else
					-- 按y坐标排序
					table.sort(右侧红点列表 , function(a , b) return a.y < b.y end)
					
					-- 找第一个未处理的右侧红点
					local 待处理右侧 = nil
					for i = 1 , #右侧红点列表 do
						local 右侧 = 右侧红点列表[i]
						if not 是否已点击过(已点击右侧红点列表 , 右侧.x , 右侧.y) then
							待处理右侧 = 右侧
							break
						end
					end
					
					if 待处理右侧 == nil then
						显示('右侧活动已全部点完')
						右侧处理完成 = true
					else
						-- 第四步：点右侧第一个
						显示('点右侧: (' .. 待处理右侧.x .. ',' .. 待处理右侧.y .. ')')
						按下点击(待处理右侧.x - 50 , 待处理右侧.y + 10 )
						随机延时(800 , 900)
						
						-- 检测最右侧红点
						local 最右红点列表 = 检测所有红点(红点区域.最右[1] , 红点区域.最右[2] , 红点区域.最右[3] , 红点区域.最右[4])
						if #最右红点列表 > 0 and 最右红点列表[1] then
							显示('点最右侧活动')
							
							按下点击(最右红点列表[1].x - 50 , 最右红点列表[1].y + 10)
							随机延时(900 , 1000)
						end
						
						-- 第五步：执行检测可领取东西
						检测可领取东西()
						
						-- 第六步：记录右侧已点击
						table.insert(已点击右侧红点列表 , {x = 待处理右侧.x , y = 待处理右侧.y})
						显示('记录右侧已点: (' .. 待处理右侧.x .. ',' .. 待处理右侧.y .. ')')
						
						运行时间 = os.time()
						随机延时(300 , 400)
					end
				end
			end
			
			-- 第七步：清空右侧已点击列表，准备处理下一个左侧红点
			已点击右侧红点列表 = {}
			运行时间 = os.time()
		end
		
	end
end

function 功能_每日签到()
	
	local 第一次找每日签到 = false
	local 第二次找每日签到 = false
	local 找到每日签到 = false
	local 开始时间 = os.time()
	local 初始化第一页 = false
	local 首次运行 = true
	local 领取累计签到 = false
	local 领取红点活动 = false
	local 未找到次数 = 0
	local 未找到每次签到 = 0
	local 找到限定 = false
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('每日签到运行中...')
		if os.time() - 开始时间 > 50 then
			显示('运行超时')
			--sleep(1000)
			每日签到已运行 = true
			return
		end
		
		if 判断_城镇界面() then
			
			if 判断_活动_入口() then
				随机延时(800 , 1200)
			else
				每日签到已运行 = true
				return
			end
			
		elseif 判断_打开活动界面() then
			
			if not 领取红点活动 then
				领限定红点()
				开始时间 = os.time()
				领取红点活动 = true
				
			end
			
			if not 找到限定 then
				判断_领取_限时活动()
				if 判断_限定活动() == "已选中" then
					
					开始时间 = os.time()
					找到限定 = true
				end
				
			else
				
				if 判断_每日签到_入口() then
					
					if not 领取累计签到 then
						
						if 判断_领取累计签到() then
							随机延时(300 , 400)
						end
						领取累计签到 = true
					else
						if 判断_一键签到_每日灰() then
							清屏(true)
							每日签到已运行 = true
							return
						else
							按下点击({1030 , 663 , 1193 , 696})--一键签到
							初始化城镇界面()
							每日签到已运行 = true
							break
						end
					end
					
				else
					显示('未找到每日签到入口')
					初始化城镇界面()
					return
					
				end
				
			end
			
		elseif 入口_确认(true) then
			--随机延时(800 , 1200)
			开始时间 = os.time()
		else
			清屏(true)
		end
		::每日签到标签::
	end
	
end
function 功能_每日分享()
	初始化城镇界面()
	local 已点头像 = false
	local 分享 = false
	local 连续次数 = 0
	local 开始时间 = os.time()
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(900 , 1000)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			return
		end
		if os.time() - 开始时间 > 40 then
			初始化城镇界面()
			return
		end
		
		if 判断_城镇界面() then
			按下点击({1202 , 642 , 1237 , 676})--背包
			
			连续次数 = 0
			
		elseif 判断_打开背包界面() then
			
			if not 分享 then
				
				按下点击({730 , 99 , 779 , 145}) --武器
				
			else
				显示('分享完成')
				return
			end
			
		elseif 判断_分享装备() then
			sleep(2000)
		elseif 判断_分享_朋友圈() then
			连续次数 = 0
			分享 = true
		elseif 入口_确认(true) then
			连续次数 = 0
		else
			连续次数 = 连续次数 + 1
			if 连续次数 > 2 then
				清屏(true)
				连续次数 = 0
			end
			打开(地下城)
		end
		
	end
end

function 功能_泰拉成就()
	
	初始化城镇界面()
	local 滑动次数 = 0
	local 首次等待 = true
	local 已完成 = {
		最后的希望 = false ,
		疯狂同道者 = false ,
		恐惧之名 = false ,
		生命的种子 = false
	}
	local 首次判断任务 = true
	local 查找时间 = os.time()
	while true do
		
		显示('2.8万泰拉成就任务进行中....')
		if 快速检测游戏状态() then
			
		end
		if os.time() - 查找时间 > 60 then
			显示('查找超时')
			return
		end
		if not 首次等待 then
			随机延时(700 , 800)
		end
		首次等待 = false
		if 判断_城镇界面() then
			
			if 首次判断任务 then
				
				if 城镇主线() or 判断_异闻录() or 判断_史诗_主线() then
					
					return
					
				end
				
			end
			首次判断任务 = false
			
			if 已完成.最后的希望 and 已完成.疯狂同道者 and 已完成.恐惧之名 and 已完成.生命的种子 then
				显示('4个泰拉成就已全部完成')
				return
				
			end
			按下点击({17 , 165 , 39 , 197})
			随机延时(500 , 600)
			滑动次数 = 0
		elseif 判断_打开任务界面() then
			
			if 判断_第四赛季() then
				
				if 判断_任务未解锁() then
					
					显示('成就任务未解锁')
					return
					
				else
					按下点击({1154 , 274 , 1249 , 311})--
				end
				
			else
				显示('没找到80级主线任务')
				return
			end
			滑动次数 = 0
		elseif 判断_打开任务详细界面() then
			
			if 判断_任务未解锁() then
				显示('任务未解锁')
				return
			end
			
			if not 首次判断任务 then
				if not 判断_希洛克的原因() then
					显示('没有做完80级任务')
					return
				else
					首次判断任务 = true
				end
			end
			
			if not 已完成.最后的希望 and 判断_最后的希望() then
				随机延时(500 , 600)
				if 判断_再次入场_成就() then
					随机延时(700 , 800)
					已完成.最后的希望 = true
				end
			elseif not 已完成.疯狂同道者 and 判断_疯狂同道者() then
				随机延时(500 , 600)
				if 判断_再次入场_成就() then
					随机延时(700 , 800)
					已完成.疯狂同道者 = true
				end
				
			elseif not 已完成.恐惧之名 and 判断_恐惧之名() then
				随机延时(500 , 600)
				if 判断_再次入场_成就() then
					随机延时(700 , 800)
					已完成.恐惧之名 = true
				end
			elseif not 已完成.生命的种子 and 判断_生命的种子() then
				随机延时(500 , 600)
				if 判断_再次入场_成就() then
					随机延时(700 , 800)
					已完成.生命的种子 = true
				end
			else
				
				滑动次数 = 滑动次数 + 1
				if 滑动次数 >= 12 then
					显示('查找次数上限了重置界面')
					按下点击({1184 , 63 , 1202 , 82})
					滑动次数 = 0
					
				else
					滑动(352 , 260 , 349 , 469 , 5 , 1 , {10 , 25} , {400 , 500} , {400 , 500})
					随机延时(400 , 500)
				end
				
			end
			
		elseif 入口_确认(true) then
			
		elseif 判断_前往() then
			
		elseif 判断_加载界面() then
			查找时间 = os.time()
			滑动次数 = 0
		elseif 判断_副本中() then
			自动刷图主线()
			滑动次数 = 0
			查找时间 = os.time()
		elseif 判断_返回城镇() then
			功能_返回城镇界面获取疲劳值()
			入口_返回城镇()
			滑动次数 = 0
			查找时间 = os.time()
		else
			清屏(true)
			
		end
	end
	
end

-----------------------------------------------------------------拍卖行功能-----------------------------------------------------
function 功能_出售物品_上架拍卖行()
	
	local 输入数量 = false
	
	local 开始时间 = os.time()
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			return
		end
		if os.time() - 开始时间 > 30 then
			return
		end
		print('出售物品_上架拍卖行运行中')
		if 判断_出售物品界面_拍卖行() then
			
			if not 输入数量 then
				
				按下点击({966 , 446 , 1040 , 473})--输入数量
				随机延时(300 , 400)
				输入数量 = true
			else
				按下点击({876 , 619 , 1013 , 654}) --出售物品
			end
			
		elseif 判断_输入材料数量界面() then
			按下点击({1105 , 531 , 1165 , 588}) --最多
			
		elseif 入口_确认(true) then
			
		elseif 判断_打开拍卖行界面() then
			break
		end
		
	end
	
end

function 功能_取材料_拍卖行()
	local 开始时间 = os.time()
	local 开始计时 = false
	local 二次进入背包 = false
	
	local 取一次 = false
	local 输入数量 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 800)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if 开始计时 then
			if os.time() - 开始时间 > 300 then
				显示('一键存仓操作超时，强制退出')
				清屏(true)
				return
			end
		end
		-- 检查是否超过1分钟
		
		显示('取材料中....')
		if 判断_城镇界面()then
			开始计时 = true
			按下点击({1193 , 632 , 1237 , 676})--背包
			随机延时(600 , 1000)
		elseif 判断_打开背包界面() then
			
			if 二次进入背包 then
				显示('已取出材料')
				清屏()
				return
			end
			
			if 入口_金库() then
				
				--随机延时(1000 , 2000)
				
			elseif 判断_冒险团金库() then
				--随机延时(600 , 1000)
			elseif 判断_选中冒险团金库() then
				
				if not 取一次 then
					if 判断_遍历仓库格子_金色小晶块() then
						随机延时(600 , 1000)
						
						按下点击({706 , 284 , 755 , 325}) --取出
						取一次 = true
					else
						return
					end
				end
				
			end
			
		elseif 判断_确认移动道具界面_取出界面() then
			
			if not 输入数量 then
				print('点击输入数量')
				按下点击({1070 , 307 , 1164 , 350}) --取消
				随机延时(300 , 400)
				按下点击({1070 , 307 , 1164 , 350})--取消
				随机延时(300 , 400)
				按下点击({790 , 216 , 895 , 249}) --输入数量
				输入数量 = true
			elseif 输入数量 then
				按下点击({554 , 602 , 719 , 652}) --确认
			end
			
			二次进入背包 = true
		elseif 判断_输入数量界面() then
			print('输入数量界面')
			
			随机延时(500 , 800)
			按下点击({940 , 444 , 991 , 499}) --1
			随机延时(500 , 800)
			按下点击({940 , 534 , 1082 , 590}) --0
			随机延时(500 , 800)
			按下点击({940 , 534 , 1082 , 590}) --0
			随机延时(500 , 800)
			按下点击({1191 , 449 , 1253 , 581}) --输入
			--随机延时(500 , 800)
		elseif 入口_确认() then
			--	随机延时(500 , 800)
			
		else
			if 清屏(true) then
				--随机延时(400 , 600)
			end
		end
	end
	
end

function 功能_自动上架拍卖行()
	初始化城镇界面()
	local 开始时间 = os.time()
	local 检测我的上架 = false
	local 上架材料 = false
	
	local 上架消耗品 = false
	local 上架卡片 = false
	local 上架装备 = false
	
	local 检查有邮箱 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(900 , 1000)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if os.time() - 开始时间 > 300 then
			显示('运行超时退出上架功能')
			return
		end
		
		if 判断_城镇界面() then
			按下点击({838 , 31 , 863 , 67}) --拍卖行
			--随机延时(1200 , 1500)
		elseif 判断_打开拍卖行界面() then
			--随机延时(400 , 500)
			if not 检测我的上架 then
				local 开始时间2 = os.time()
				
				while true do
					随机延时(800 , 900)
					
					if os.time() - 开始时间2 > 30 then
						return
					end
					
					if 判断_我的上架已选中() then
						
						if 同步重新上架功能() then
							
							功能_出售物品_上架拍卖行()
							随机延时(600 , 800)
							开始时间2 = os.time()
						else
							if 判断_回收_拍卖行可回收() then
								随机延时(400 , 500)
								开始时间2 = os.time()
								检查有邮箱 = true
								
							else
								
								if 检查有邮箱 then
									功能_领取角色邮箱()
									开始时间2 = os.time()
								end
								if 判断_同步上架金色小晶块功能() then
									功能_取材料_拍卖行()
									开始时间2 = os.time()
								end
								检测我的上架 = true
								break
								
							end
						end
						
					elseif 入口_确认(true) then
						开始时间2 = os.time()
					else
						按下点击({12 , 231 , 113 , 272}) --我的上架
					end
					
				end
			elseif not 上架消耗品 then
				print('上架消耗品')
				sleep(2000)
				local 消耗品开始时间 = os.time()
				while true do
					随机延时(800 , 1000)
					显示('上架消耗品中.....')
					if 快速检测游戏状态() then
						return
					end
					if os.time() - 消耗品开始时间 > 60 then
						
						return
					end
					if 判断_可上架物品上限() then
						return
					end
					if 判断_已选中物品出售入口_拍卖行() then
						
						if 判断_上架消耗品已选中() then
							
							if 同步上架超武礼盒功能()then
								
								功能_出售物品_上架拍卖行()
								消耗品开始时间 = os.time()
								
							else
								
								上架消耗品 = true
								
								break
								
							end
						else
							
							显示('消耗品选项未选中')
							if 判断_上架消耗品入口() then
								随机延时(500 , 600)
							end
							
						end
						
					else
						按下点击({12 , 144 , 103 , 195}) --出售物品
						
					end
					
				end
				
			elseif not 上架材料 then
				print('没有上架材料去上架材料')
				local 开始时间1 = os.time()
				while true do
					随机延时(800 , 1000)
					显示('上架材料中.....')
					if 快速检测游戏状态() then
						return
					end
					if os.time() - 开始时间1 > 50 then
						
						return
					end
					if 判断_可上架物品上限() then
						return
					end
					if 判断_已选中物品出售入口_拍卖行() then
						
						if 判断_上架材料已选中() then
							
							if 同步上架矛盾功能()then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架失调次元票功能() then
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架暴走票功能() then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架印章功能() then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架炉岩碳功能() then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架混沌之息功能() then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架变换石功能() then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
							elseif 同步上架金色小晶块功能() then
								
								功能_出售物品_上架拍卖行()
								开始时间1 = os.time()
								
							else
								print('没有可上架的材料了退出循环')
								上架材料 = true
								break
								
							end
						else
							if 判断_上架材料入口() then
								随机延时(400 , 500)
							end
							
						end
						
					else
						按下点击({12 , 144 , 103 , 195}) --出售物品
						
					end
					
				end
				
				--[===[	elseif not 上架卡片 then
				
				local 开始时间3 = os.time()
				while true do
				if 快速检测游戏状态() then
				return
				end
				
				if os.time() - 开始时间3 > 50 then
				return
				end
				if  then
				
				end
				
				end
				
				--待完善
				上架卡片 = true]===]
				
				--[===[elseif not 上架装备 then
				待完善
				上架装备 = true]===]
			else
				显示('上架结束')
				清屏(true)
				break
			end
			
		else
			
			清屏(true)
			
		end
		
	end
	
end

function 功能_领冒险奖励()
	初始化城镇界面()
	local 首次运行 = true
	local 首次点冒险 = false
	local 运行时间 = os.time()
	local 翻页次数 = 0
	local 初始化第一页 = false
	local 左侧 = false
	local 右侧 = false
	while true do
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		if os.time() - 运行时间 > 10 then
			return
		end
		
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		
		if 判断_城镇界面() then
			
			if 入口_冒险奖励() then
				显示('识别入口_冒险奖励')
				运行时间 = os.time()
				随机延时(500 , 600)
			elseif not 首次点冒险 then
				显示('首次点冒险')
				按下点击({1113 , 637 , 1144 , 668})
				随机延时(500 , 600)
				首次点冒险 = true
			elseif 判断_冒险入口() then
				
				随机延时(500 , 600)
			else
				显示('没找到冒险奖励入口')
				return
			end
		elseif 判断_选择地图界面_冒险奖励() then
			
			if 判断_一键领取_冒险地图() then
				运行时间 = os.time()
			else
				
				if not 左侧 then
					if 判断_红点_冒险奖励() then
						
						if not 初始化第一页 then
							if 判断_洛兰之森() then
								初始化第一页 = true
							else
								滑动(302 , 256 , 302 , 549 , 50 , 10 , {15 , 35} , {800 , 1000} , {300 , 400})
								随机延时(500 , 600)
							end
						elseif 判断_红点_冒险奖励下面() then
							运行时间 = os.time()
						else
							
							按下点击({113 , 582 , 263 , 619})--下一页
							翻页次数 = 翻页次数 + 1
							if 翻页次数 >= 5 then
								左侧 = true
								--[===[初始化城镇界面()
								return]===]
							end
							
						end
						
					else
						--[===[初始化城镇界面()
						return]===]
						左侧 = true
					end
					
				else
					
					if 判断_红点_冒险奖励右() then
						
						if 判断_红点_冒险奖励下面() then
							运行时间 = os.time()
							
						else
							
							初始化城镇界面()
							return
						end
						
					else
						初始化城镇界面()
						return
					end
					
				end
			end
		elseif 判断_立即使领取的物品() then
			运行时间 = os.time()
		elseif 入口_确认(true) then
			运行时间 = os.time()
			
		else
			清屏(true)
			打开(地下城)
		end
		
	end
	
end
function 功能_领经验宝库()
	local function 判断_技能入口()
		local x , y = findMultiColor(801 , 528 , 1074 , 589 , "ffbec5-202020" , "16|14|d6d2bd-202020|9|10|adae9c-202020|12|8|adae9c-202020|17|10|bdc2b5-202020|15|6|e6e7ce-202020|13|7|cecab5-202020|7|8|adaea4-202020|-2|5|b5b2ad-202020|-5|10|bdc2ad-202020|-4|14|a4a294-202020|-4|11|c5c6b5-202020|-9|13|cecaad-202020|-9|13|cecaad-202020|-9|8|c5c6b5-202020|-9|6|cecabd-202020|-10|-14|ff8a5a-202020|-1|-13|ffe3b5-202020|-3|-12|deae84-202020|-5|-5|f7817b-202020|-5|-5|f7817b-202020|-5|-5|f7817b-202020|2|-9|f7aa7b-202020|2|-10|f7ae7b-202020|7|-14|f7a673-202020|12|-12|ffa2a4-202020|10|-13|f7926b-202020|9|-17|ff9231-202020|-2|-17|f7dfad-202020|-3|-16|f7ebad-202020" , 0 , 0.9)
		
		if x ~= - 1 and y ~= - 1 then
			
			return true
		end
		return false
	end
	local function 判断_冒险团入口()
		
		local x , y = findMultiColor(746 , 517 , 1279 , 595 , "efca6b-202020" , "9|12|c59e73-202020|8|13|debe8c-202020|2|7|deae4a-202020|6|2|cea65a-202020|7|1|d6b263-202020|-11|1|e6d27b-202020|-10|1|fff78c-202020|1|-9|f7f3b5-202020|-3|-1|efd773-202020|-2|0|deba63-202020|-3|-2|dea252-202020|-4|0|f7e37b-202020|-8|2|ffce84-202020|-5|-4|ffffce-202020" , 0 , 0.9)
		if x ~= - 1 and y ~= - 1 then
			按下点击(x , y)
			return true
		end
		return false
	end
	初始化城镇界面()
	local 运行时间 = os.time()
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(700 , 800)
		end
		首次运行 = false
		if os.time() - 运行时间 > 60 then
			return
		end
		if 快速检测游戏状态() then
			运行时间 = os.time()
		end
		if 判断_城镇界面() then
			
			if 判断_技能入口() and not 判断_冒险团入口() then
				显示('未找到 冒险团入口')
				return
			elseif not 首次点击角色 then
				按下点击({922 , 648 , 968 , 682})--角色入口
				随机延时(300 , 400)
				首次点击角色 = true
			elseif 判断_角色入口() then
				
				随机延时(300 , 400)
			else
				显示('未找到角色入口')
				return
			end
		elseif 判断_打开冒险团界面() then
			随机延时(300 , 400)
			if 判断_经验值宝库已选中() then
				
				if not 判断_使用奖励_经验值宝库() then
					按下点击({1048 , 586 , 1190 , 624})
				else
					初始化城镇界面()
					return
				end
				
			elseif 判断_经验值宝库入口() then
				
			else
				显示('未找到经验值宝库')
				return
			end
		elseif 入口_确认(true) then
			
		else
			清屏(true)
			
		end
		
	end
	
end
-----------------------------------------------------------------拍卖行功能-----------------------------------------------------
-----------------------------------------------------------------使用礼盒-----------------------------------------------------

function 功能_开自选礼袋()
	初始化城镇界面()
	local 开始时间 = os.time()
	local 清理时间 = os.time()
	local 已输入数量 = false
	local 滑动次数 = 0
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		if os.time() - 开始时间 > 50 then
			清屏(true)
			print('开礼袋超时结束运行')
			return
		end
		
		if 判断_城镇界面() then
			已输入数量 = false
			按下点击({1193 , 632 , 1237 , 676})--背包
			清理时间 = os.time()
		elseif 判断_打开背包界面() then
			已输入数量 = false
			
			随机延时(600 , 800)
			if not 同步自动穿装备功能() then
				
				if not 判断_选中道具() then
					按下点击({6 , 60 , 123 , 126})--道具
					清理时间 = os.time()
				else
					if 判断_消耗品_入口() then
						随机延时(400 , 800)
						清理时间 = os.time()
					else
						
						if 同步开超武功能() then
							开始时间 = os.time()
							清理时间 = os.time()
						elseif 同步开矛盾功能() then
							开始时间 = os.time()
							清理时间 = os.time()
						elseif 同步开暴走票功能() then
							开始时间 = os.time()
							清理时间 = os.time()
						elseif 同步开炉岩碳功能() then
							开始时间 = os.time()
							清理时间 = os.time()
						elseif 同步开变换石功能() then
							开始时间 = os.time()
							清理时间 = os.time()
						elseif 同步开印章功能() then
							开始时间 = os.time()
							清理时间 = os.time()
						else
							滑动(1096 , 597 , 1098 , 263 , 5 , 5 , {10 , 35} , {400 , 500} , {500 , 600})
							滑动次数 = 滑动次数 + 1
							if 滑动次数 >= 1 then
								清屏(true)
								break
								
							end
							
						end
						
					end
				end
				
			end
			
			清理时间 = os.time()
			
		elseif 判断_选择想要的物品_礼盒() then
			
			if not 判断_未勾选想要的物品() then
				按下点击({856 , 220 , 882 , 242}) --勾选
				
			elseif not 已输入数量 then
				按下点击({546 , 609 , 666 , 639})--输入数量
				
			else
				按下点击({764 , 601 , 901 , 650}) --确认
			end
			清理时间 = os.time()
		elseif 判断_输入数量界面() then
			
			按下点击({1106 , 528 , 1166 , 592}) --最多输入
			
			已输入数量 = true
			清理时间 = os.time()
		elseif 判断_使用_礼盒() then
			已输入数量 = false
			清理时间 = os.time()
			开始时间 = os.time()
		elseif 入口_确认(true) then
			已输入数量 = false
			清理时间 = os.time()
			开始时间 = os.time()
		else
			if os.time() - 清理时间 >= 4 then
				清屏(true)
				清理时间 = os.time()
			end
		end
	end
	
end

function 功能_使用装备盒子()
	
	初始化城镇界面()
	
	local 首次初始化 = false
	
	local 运行时间 = os.time()
	local 找到用券入口 = false
	local 已滑动 = false
	local 查找次数 = 0
	local 滑动查找次数 = 0
	local 首次运行 = true
	
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if os.time() - 运行时间 > 60 then
			
			return false
		end
		显示('使用过升级券...')
		if 判断_城镇界面() then
			
			按下点击({1193 , 632 , 1237 , 676})--背包
			
		elseif 判断_选择想要的物品_礼盒() then
			按下点击({858 , 221 , 881 , 241})--勾第一个
			随机延时(300 , 400)
			按下点击({580 , 603 , 718 , 647})--确认
		elseif 判断_打开背包界面() then
			
			if not 首次初始化 then
				
				按下点击({979 , 127 , 1038 , 166})--新获得物品
				随机延时(400 , 500)
				首次初始化 = true
				
			elseif 判断_新获得物品_选中() then
				
				显示('新获得物品栏-查找升级券')
				if 检测_武器盒子() then
					按下点击({1133 , 43 , 1257 , 66})--使用
					随机延时(1000 , 1200)
					查找次数 = 0
					运行时间 = os.time()
					
				else
					
					查找次数 = 查找次数 + 1
					
					if 查找次数 > 3 then
						
						return false
					end
				end
				
			else
				
				if not 判断_消耗品_已选中() then
					按下点击({ 990 , 70 , 1025 , 108})--消耗品
					
					随机延时(400 , 500)
					查找次数 = 0
				else
					
					显示('消耗品栏-装备盒子')
					if 检测_武器盒子() then
						print('找到升级券')
						随机延时(1500 , 1800)
						按下点击({1133 , 43 , 1257 , 66})--使用
						随机延时(1000 , 1200)
						运行时间 = os.time()
						用券 = true
					else
						查找次数 = 查找次数 + 1
						
						if 查找次数 > 3 then
							
							return false
						else
							滑动(1098 , 588 , 1099 , 429 , 3 , 3 , {20 , 25} , {1000 , 1500} , {300 , 400})
						end
						
					end
					
				end
				
			end
			
		elseif 入口_确认(true) then
			随机延时(1500 , 1600)
		elseif 清屏(true) then
			
		end
		
	end
	
end
-----------------------------------------------------------------使用礼盒-----------------------------------------------------
function 功能_检测是否剩余疲劳疲劳()
	
	if not 判断_城镇界面() then
		初始化城镇界面()
	end
	
	if 功能_获取疲劳值() > 0 then
		显示('检测到还剩余疲劳前往猫卡清疲劳')
		return 副本2_猫卡一图()
	else
		return
	end
	
end
-------------------------------------------------------------------绑定成长活动------------------------------------------------------

function 功能_买角色栏拓展券()
	
	初始化城镇界面()
	local 买券 = false
	local 用券 = false
	local 首次初始化 = false
	local 开始时间 = os.time()
	local 查找次数 = 0
	local 首次滑动 = false
	local 首次运行 = true
	
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if os.time() - 开始时间 > 60 then
			显示('买用券超时退出....')
			return false
		end
		显示('功能_买角色栏拓展券')
		if 判断_城镇界面() then
			
			if not 买券 then
				按下点击({984 , 30 , 1018 , 65})--商城
			elseif not 用券 then
				
				按下点击({1193 , 632 , 1237 , 676})--背包
			else
				return true
			end
			
		elseif 判断_打开商城界面() then
			
			if 判断_道具_商城() then
				
			else
				
				if not 首次滑动 then
					滑动(905 , 646 , 903 , 358 , 5 , 1 , {10 , 25} , {400 , 500} , {400 , 500})
					随机延时(400 , 500)
					首次滑动 = true
					
				elseif not 买券 then
					
					if 判断_角色栏拓展券_商城() then
						随机延时(700 , 800)
						买券 = true
					else
						
						显示('未识别到角色拓展券')
						return
					end
				else
					初始化城镇界面()
				end
				
			end
			
		elseif 判断_购买物品界面_拓展券() then
			
			按下点击({851 , 391 , 884 , 424}) --最大
			随机延时(500 , 600)
			按下点击({573 , 596 , 726 , 643})--购买
			
		elseif 入口_确认(true) then
			
		elseif 判断_打开背包界面() then
			
			if not 首次初始化 then
				按下点击({979 , 127 , 1038 , 166})--新获得物品
				随机延时(1000 , 1500)
				按下点击({876 , 66 , 922 , 109})--装备
				随机延时(1000 , 1500)
				按下点击({979 , 127 , 1038 , 166})--新获得物品
				随机延时(400 , 500)
				首次初始化 = true
				
			elseif 判断_新获得物品_选中() then
				
				print('查找拓展券')
				if 判断_角色拓展券_背包() then
					print('找到拓展券')
					随机延时(1700 , 1900)
					按下点击({1141 , 38 , 1244 , 77} , {30 , 40})--使用
					
					查找次数 = 0
					用券 = true
					开始时间 = os.time()
					
				else
					查找次数 = 查找次数 + 1
					if not 用券 then
						
						if 查找次数 > 2 then
							
							return false
						end
						
					else
						if 查找次数 > 1 then
							入口_到选择角色界面()
							初始化城镇界面2()
							return true
						end
					end
					
				end
			end
		elseif 入口_确认(true) then
			随机延时(1500 , 1600)
		else
			清屏(true)
		end
		
	end
end
function 功能_使用65直升券()
	
	初始化城镇界面()
	
	local 首次初始化 = false
	local 用券 = false
	local 运行时间 = os.time()
	local 找到用券入口 = false
	local 已滑动 = false
	local 查找次数 = 0
	local 滑动查找次数 = 0
	local 首次运行 = true
	local 用券成功 = false
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		if os.time() - 运行时间 > 60 then
			
			return false
		end
		显示('使用过升级券...')
		if 判断_城镇界面() then
			if 用券 then
				显示('使用过升级券了 ')
				功能_使用装备盒子()
				return true
			end
			按下点击({1193 , 632 , 1237 , 676})--背包
			
		elseif 判断_选择职业_直升券() then
			
			按下点击({871 , 369 , 973 , 433}) --任影
			随机延时(900 , 1200)
			按下点击({675 , 499 , 830 , 537}) --确认
			显示('使用升级券 ')
			随机延时(900 , 1200)
			初始化城镇界面2()
			
			if 用券成功 then
				
			end
			return true
		elseif 判断_选择想要的物品_礼盒() then
			按下点击({858 , 221 , 881 , 241})--勾第一个
			随机延时(300 , 400)
			按下点击({580 , 603 , 718 , 647})--确认
			
		elseif 判断_打开背包界面() then
			
			if not 首次初始化 then
				
				按下点击({979 , 127 , 1038 , 166})--新获得物品
				随机延时(1000 , 1500)
				按下点击({876 , 66 , 922 , 109})--装备
				随机延时(1000 , 1500)
				按下点击({979 , 127 , 1038 , 166})--新获得物品
				随机延时(400 , 500)
				首次初始化 = true
				
			elseif 判断_新获得物品_选中() then
				
				显示('新获得物品栏-查找升级券')
				if 检测_武器盒子_不点击() then
					有可用盒子 = true
				end
				if 判断_65直升券_背包() then
					
					随机延时(1000 , 1200)
					print('使用 ')
					按下点击({1133 , 43 , 1257 , 66})--使用
					随机延时(1000 , 1200)
					查找次数 = 0
					用券 = true
					运行时间 = os.time()
					用券成功 = true
				else
					
					查找次数 = 查找次数 + 1
					
					if 查找次数 > 3 then
						
						return false
					end
				end
				
			else
				
				if not 判断_消耗品_已选中() then
					按下点击({ 990 , 70 , 1025 , 108})--消耗品
					随机延时(1000 , 1500)
					按下点击({876 , 66 , 922 , 109})--装备
					随机延时(1000 , 1500)
					按下点击({ 990 , 70 , 1025 , 108})--消耗品
					随机延时(400 , 500)
				else
					
					显示('消耗品栏-查找升级券')
					if 判断_65直升券_背包() then
						print('找到升级券')
						随机延时(1500 , 1800)
						按下点击({1133 , 43 , 1257 , 66})--使用
						随机延时(1000 , 1200)
						运行时间 = os.time()
						用券 = true
					else
						
						if 判断_背包扩展() then
							显示('未找到升级券')
							
							按下点击({876 , 66 , 922 , 109})--装备
							随机延时(1000 , 1500)
							按下点击({ 990 , 70 , 1025 , 108})--消耗品
							随机延时(400 , 500)
							
						else
							滑动(1098 , 588 , 1099 , 429 , 3 , 3 , {20 , 25} , {1000 , 1500} , {300 , 400})
						end
						
					end
					
				end
				
			end
			
		elseif 入口_确认(true) then
			随机延时(1500 , 1600)
		elseif 清屏(true) then
			
		end
		
	end
	
end
function 功能_绑定活动角色()
	
	初始化城镇界面()
	
	local 未找到次数 = 0
	
	local 第一天领取 = false
	local 领取1 = false
	local 领取2 = false
	local 领取3 = false
	local 领取4 = false
	local 领取5 = false
	local 领取6 = false
	local 领取7 = false
	local 领取8 = false
	local 限定等待 = false
	local 查找绑定 = 0
	local 开始时间 = os.time()
	while true do
		显示('成长活动绑定角色中....')
		随机延时(500 , 600)
		
		if os.time() - 开始时间 > 50 then
			显示('运行超时')
			--sleep(1000)
			return
		end
		
		if 判断_城镇界面() then
			
			if 判断_活动_入口() then
				随机延时(500 , 600)
			else
				显示('未找到活动入口')
				return
			end
			限定等待 = false
		elseif 判断_购买_成长活动() then
			
		elseif 判断_选择活动角色() then
			随机延时(800 , 900)
			if 判断_立即登录_不可绑定() then
				初始化城镇界面()
				return
			end
			
		elseif 入口_确认(true) then
			随机延时(500 , 600)
			
		elseif 判断_立即指定_提示() then
			随机延时(900 , 1000)
			按下点击({603 , 497 , 680 , 524})--确定
			
		elseif 判断_打开活动界面() then
			
			if not 限定等待 then
				随机延时(800 , 1000)
				限定等待 = true
				
			elseif 判断_限定活动() == '已选中' then
				
				if 判断_成长活动_绑定角色() == "已选中" then
					
					if 判断_活动商店_成长活动() then
						
						if 判断_免费_活动商店() then
							第一天领取 = true
							随机延时(600 , 700)
							开始时间 = os.time()
						else
							显示('没有可领取的东西了')
							if 第一天领取 then
								
								return 功能_使用65直升券()
							else
								return
							end
							
						end
						
					elseif 判断_前往指定十() then
						开始时间 = os.time()
						
					elseif 判断_使用该角色登录() then
						初始化城镇界面()
						return
					else
						
						按下点击({1030 , 675 , 1113 , 702})--活动商店
					end
					
				end
			elseif 判断_限定活动() == '入口' then
				
			else
				
				未找到次数 = 未找到次数 + 1
				if 未找到次数 > 2 then
					显示('3次未找到成长活动结束该功能')
					return
				end
			end
			
		elseif 判断_购买_成长活动() then
			随机延时(500 , 600)
		else
			清屏(true)
		end
		
	end
	
end

----------------------------------------------------------------------回归勇士-----------------------------------------------------------------
function 功能_绑定回归勇士活动()
	
	初始化城镇界面2()
	
	local 首次查找 = false
	local 第一次查找 = false
	local 第二次查找 = false
	
	local 找到 = false
	local 未找到次数 = 0
	local 总运行时间 = os.time()
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('绑定回归活动中.........')
		
		if 快速检测游戏状态() then
			
			总运行时间 = os.time()
		end
		if os.time() - 总运行时间 > 60 then
			初始化城镇界面()
			return false
		end
		
		if 判断_城镇界面() then
			
			if 判断_活动_入口() then
				随机延时(500 , 600)
			else
				显示('未找到成长活动')
				return true
			end
		elseif 判断_打开活动界面() then
			
			if not 首次查找 then
				按下点击({14 , 70 , 145 , 121})--初始化第一页
				随机延时(500 , 600)
				首次查找 = true
			end
			
			判断_领取_限时活动()
			
			if 找到 then
				print('找到')
				if 判断_已绑定活动角色_成长活动() then
					
					return true
					
				else
					if 判断_前往指定活动角色_成长活动() then
						
					elseif 判断_选择绑定活动角色_回归勇士() then
						滑动(871 , 441 , 870 , 213 , 5 , 5 , {15 , 30} , {600 , 700} , {200 , 300})
						随机延时(500 , 600)
						滑动(871 , 441 , 870 , 213 , 5 , 5 , {15 , 30} , {600 , 700} , {200 , 300})
						随机延时(500 , 600)
						滑动(871 , 441 , 870 , 213 , 5 , 5 , {15 , 30} , {600 , 700} , {200 , 300})
						随机延时(500 , 600)
						滑动(871 , 441 , 870 , 213 , 5 , 5 , {15 , 30} , {600 , 700} , {200 , 300})
						随机延时(1000 , 1500)
						按下点击({757 , 446 , 969 , 455})--选择角色
						随机延时(500 , 600)
						按下点击({754 , 578 , 883 , 612}) --确认绑定
					elseif 判断_确认绑定() then
						按下点击({881 , 425 , 983 , 459})--确认
						
					end
					
				end
			elseif 判断_回归勇士_阻力成长() then
				总运行时间 = os.time()
				第一次查找 = true
				第二次查找 = true
				找到 = true
				
			elseif not 找到 then
				按下点击({14 , 70 , 145 , 121})--初始化第一页
				未找到次数 = 未找到次数 + 1
				
				if 未找到次数 > 3 then
					显示('未找回归活动')
					领取并使用升级券 = true
					return true
				end
				
			end
		elseif 入口_确认(true) then
			
		else
			清屏(true)
			
		end
		
	end
end

function 功能_领取并使用升级券()
	
	初始化城镇界面2()
	local 首次查找 = false
	local 第一次查找 = false
	local 第二次查找 = false
	local 第一天领取 = true
	local 登录任务 = false
	local 玩法任务 = false
	local 养成任务 = false
	local 找到 = false
	local 未找到次数 = 0
	local 总运行时间 = os.time()
	local 领取红点 = false
	local 首次运行 = true
	local 有可用盒子 = false
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('领取回归活动中....')
		
		if 快速检测游戏状态() then
			
			总运行时间 = os.time()
		end
		if os.time() - 总运行时间 > 60 then
			初始化城镇界面()
			return true
		end
		
		if 判断_城镇界面() then
			
			if not 判断_邮箱入口() then
				
				return false
			end
			if 判断_活动_入口() then
				随机延时(500 , 600)
				
			end
		elseif 判断_打开活动界面() then
			随机延时(500 , 600)
			
			if not 首次查找 then
				按下点击({14 , 70 , 145 , 121})--初始化第一页
				首次查找 = true
				随机延时(500 , 600)
				判断_领取_限时活动()
			else
				随机延时(350 , 400)
				清屏_立即领取_广告()
				if 找到 then
					print('找到')
					
					if not 登录任务 then
						
						if 第一天领取 then
							随机延时(800 , 900)
							if 判断_第一天领取() and 判断_领取_回归勇士() then
								
								if 功能_领取冒险团邮箱() then
									
									功能_使用65直升券()
									if 有可用盒子 then
										功能_使用装备盒子()
									end
									领取并使用升级券 = true
									return true
								end
							end
							第一天领取 = false
							
						else
							
							if not 判断_领取_回归勇士() then
								
								登录任务 = true
							end
						end
						
					elseif not 玩法任务 then
						按下点击({763 , 250 , 872 , 278})
						随机延时(500 , 600)
						if not 判断_领取_回归勇士() then
							
							玩法任务 = true
						end
						--[===[	elseif not 养成任务 then
						
						按下点击({1050 , 252 , 1207 , 278})
						随机延时(500 , 600)
						if not 判断_领取_回归勇士() then
						
						养成任务 = true
						end]===]
					else
						初始化城镇界面()
						return true
					end
					
				elseif 判断_回归勇士_阻力成长() then
					总运行时间 = os.time()
					第一次查找 = true
					第二次查找 = true
					找到 = true
					
				elseif not 找到 then
					按下点击({14 , 70 , 145 , 121})--初始化第一页
					
					未找到次数 = 未找到次数 + 1
					--[===[滑动(268 , 377 , 278 , 140 , 5 , 5 , {15 , 25} , {500 , 600} , {300 , 400})
					随机延时(500 , 600)]===]
					if 未找到次数 > 3 then
						显示('未找回归活动')
						领取并使用升级券 = true
						return true
						
					end
					
				end
				
			end
			
		elseif 入口_确认(true) then
			
		else
			清屏(true)
			
		end
		
	end
end

----------------------------------------------------------------------勇士特训
function 功能_勇士特训()
	初始化城镇界面()
	local 运行时间 = os.time()
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('勇士特训运行中...')
		if os.time() - 运行时间 > 50 then
			return
		end
		if 判断_城镇界面() then
			
			if not 判断_勇士特训入口() then
				return
			end
		elseif 判断_打开勇士特训界面() then
			
			if not 判断_一键领取_勇士特训() then
				显示('没有可领取的物品了')
				return
			else
				随机延时(800 , 900)
			end
		elseif 判断_穿戴装备() then
			
		elseif 判断_立即使领取的物品() then
			
		elseif 入口_确认(true) then
			
		else
			
			清屏(true)
			
		end
		
	end
	
end

-------------------------------------------------------------------限时活动

function 功能_魔界人_限时活动()
	
	--[===[初始化城镇界面2()
	local 查找次数 = 0
	while true do
	随机延时(800 , 1000)
	
	if 判断_城镇界面() then
	
	if 判断_活动_入口() then
	随机延时(500 , 600)
	else
	显示('未找到成长活动')
	return true
	end
	查找次数 = 0
	elseif 判断_打开活动界面() then
	
	if 判断_无可用宝珠() then
	return
	end
	
	if 判断_开始游戏_魔界人() then
	查找次数 = 0
	
	else
	if 判断_魔界人奇遇记() then
	查找次数 = 0
	elseif 判断_限定活动() then
	
	else
	查找次数 = 查找次数 + 1
	
	if 查找次数 >= 3 then
	显示('未找到魔界人')
	return
	end
	end
	end
	
	elseif 判断_抽取宝珠_魔界人() then
	查找次数 = 0
	elseif 判断_选择道具_魔界人() then
	查找次数 = 0
	elseif 判断_下一步_魔界人() then
	查找次数 = 0
	elseif 判断_返回主界面_魔界人() then
	查找次数 = 0
	elseif 判断_重新开始_魔界人() then
	查找次数 = 0
	随机延时(500 , 600)
	
	end
	
	end]===]
	
end
function 功能_活动点券买战令()
	
	local 首次不等待 = true
	local 开始时间 = os.time()
	while true do
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if not 首次不等待 then
			随机延时(800 , 1000)
		end
		首次不等待 = false
		
		if os.time() - 开始时间 > 50 then
			显示('买战令超时')
			return
		end
		
		if 判断_城镇界面() then
			
			按下点击({1058 , 115 , 1089 , 147})--战令
			
		elseif 判断_打开战令界面() then
			按下点击({29 , 556 , 141 , 591}) --购买
			
		elseif 判断_打开战令福利界面() then
			
			if 判断_已购买_战令福利界面() then
				清屏(true)
				return
			end
			按下点击({237 , 619 , 376 , 658})--680
			
		elseif 判断_打开购买物品界面_战令() then
			
			if not 判断_已勾选欢乐币() then
				
				按下点击({400 , 481 , 419 , 501})--勾选
				随机延时(800 , 900)
			end
			
			if 判断_免费_战令() then
				
				按下点击({561 , 625 , 711 , 668})--购买
			else
				return
				
			end
		else
			清屏(true)
		end
		
	end
	
end
function 功能_领战令奖励()
	local 首次不等待 = true
	local 开始时间 = os.time()
	local 领任务 = false
	while true do
		if 快速检测游戏状态() then
			开始时间 = os.time()
		end
		
		if not 首次不等待 then
			随机延时(800 , 1000)
		end
		首次不等待 = false
		
		if os.time() - 开始时间 > 50 then
			显示('买战令超时')
			return
		end
		
		if 判断_城镇界面() then
			
			按下点击({1058 , 115 , 1089 , 147})--战令
			
		elseif 判断_打开战令界面() then
			随机延时(500 , 600)
			if not 领任务 then
				
				按下点击({188 , 80 , 256 , 111}) --任务
				随机延时(600 , 700)
				按下点击({1093 , 635 , 1240 , 672})--一键领取
				领任务 = true
			else
				
				按下点击({56 , 78 , 111 , 111}) --奖励
				随机延时(600 , 700)
				按下点击({1093 , 635 , 1240 , 672})--一键领取
				初始化城镇界面()
				return
			end
			
		else
			清屏(true)
		end
		
	end
	
end

function 功能_时间胶囊()
	
	local function 城镇黄金胶囊入口()
		local ret = cmpColorEx("1066|144|deaa4a-202020,1052|145|adaead-202020,1071|155|adaa9c-202020,1077|152|a4a694-202020,1075|146|adaead-202020,1073|144|a4a6a4-202020,1073|145|d6d2d6-202020,1071|148|c5c6c5-202020,1056|148|e6e3e6-202020,1066|152|ada6a4-202020,1057|148|b5b6b5-202020,1069|131|adaebd-202020,1078|135|d6b26b-202020,1079|136|cea242-202020,1057|129|e6ce6b-202020" , 0.9)
		if ret == 1 then
			return true
		end
		return false
	end
	
	local function 新手指引循环()
		
		for i = 1 , 10 do
			
			if 主线_新手指引()then
				return true
			end
			
		end
		return false
	end
	local 点击出战 = false
	local 训练空间 = false
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(600 , 700)
		end
		首次运行 = false
		显示('黄金胶囊运行中')
		if 判断_城镇界面() then
			
			if 城镇黄金胶囊入口() then
				显示('当前角色不可绑定')
				return true
			end
			if 训练空间 then
				显示('黄金胶囊使用完成')
				return true
			end
		elseif 判断_黄金胶囊入口() then
			
			按下点击({1067 , 655 , 1207 , 688})
			随机延时(500 , 600)
		elseif 判断_道具使用效果界面() then
			print('判断_道具使用效果界面')
			if not 判断_确认使用_黄金胶囊() then
				
				if 判断_请输入文本() then
					按下点击({491 , 547 , 817 , 572})--输入框
					随机延时(1000 , 1200)
					功能_输入自定义内容("指定角色")
					随机延时(300 , 400)
					按下点击({557 , 47 , 725 , 73})
					随机延时(300 , 400)
				end
			end
			
		elseif 判断_选择职业_直升券() then
			print('判断_选择职业_直升券')
			随机延时(400 , 500)
			按下点击({871 , 369 , 973 , 433}) --任影
			随机延时(900 , 1200)
			按下点击({675 , 499 , 830 , 537}) --确认
		elseif 判断_黄金胶囊主城() then
			print('判断_黄金胶囊主城')
			训练空间 = true
			if 判断_跳过教程() then
				
			elseif 主线_新手指引() then
				
			else
				按下点击({1093 , 320 , 1165 , 334}) --立即前往
			end
			
		elseif 判断_立即使用确认() then
			print('判断_立即使用确认')
		elseif 入口_确认(true) then
			print('入口_确认')
		elseif 判断_加载界面() then
			print('判断_加载界面')
			
		elseif 判断_攻击敌人提示() then
			print('判断_攻击敌人提示')
		elseif 判断_副本中() or 判断_提示_按键提示() then
			print('返回(4)')
			返回(4)
			
		elseif 判断_使用消耗品_宠物礼盒() then
			print('判断_使用消耗品_宠物礼盒')
		elseif 判断_打开宠物界面() then
			print('判断_打开宠物界面')
			if not 点击出战 then
				按下点击({638 , 455 , 689 , 480})
				点击出战 = true
			else
				清屏(true)
			end
		elseif 判断_选择一件想要的物品() then
			随机延时(400 , 500)
			按下点击({861 , 221 , 878 , 238})--打勾
			随机延时(400 , 500)
			按下点击({574 , 609 , 717 , 643}) --确认
			
		elseif 判断_点空白处_黄金胶囊() then
			print('判断_点空白处_黄金胶囊')
		elseif 判断_返回城镇1() then
			
			入口_返回城镇()
			
		elseif 新手指引循环() then
			
		elseif 判断_称号_勋章() then
			按下点击({871 , 150 , 909 , 181})
		elseif 判断_装备称号() then
			
		else
			if not 清屏(true) then
				打开(地下城)
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------
function 功能_一键70级()
	副本1_主线1至70()
end

function 功能_自动更新游戏()
	
	local 已重启时间段 = {}
	
	local 首次运行 = true
	while true do
		if not 首次运行 then
			随机延时(800 , 900)
		end
		首次运行 = false
		显示('等待游戏维护完成.......')
		
		if 判断_开始游戏界面_不检测() then
			
			if 判断_游戏更新中() then
				
				local 当前小时 = os.date("*t").hour
				local 时间段 = nil
				
				if 当前小时 >= 8 and 当前小时 < 9 then
					时间段 = 1
				elseif 当前小时 >= 9 and 当前小时 < 10 then
					时间段 = 2
				elseif 当前小时 >= 11 and 当前小时 < 12 then
					时间段 = 3
				end
				
				if 时间段 and not 已重启时间段[时间段] then
					显示('到达更新时间段，重启游戏...')
					关闭(地下城)
					随机延时(900 , 1000)
					打开(地下城)
					已重启时间段[时间段] = true
				end
				
			else
				显示('游戏更新完成')
				return
			end
		elseif 判断_选择角色界面_不用等加载() or 判断_城镇界面() then
			return
		elseif 清屏(true) then
			
		end
		
	end
	
end
