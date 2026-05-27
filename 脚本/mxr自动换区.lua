
function 判断_服务器上限()
	
	local x , y = findMultiColor(610 , 241 , 669 , 272 , "fff3bd-202020" , "21|-4|ffefb5-202020|25|3|fff3bd-202020|24|0|fff3bd-202020|8|0|fff3bd-202020|4|-8|fff3bd-202020|6|-15|ffefb5-202020|-10|-12|fff3bd-202020|-18|-6|fff3bd-202020|-17|4|ffefb5-202020|-7|-3|fff3bd-202020|-7|3|fff3bd-202020|-14|5|ffefb5-202020|0|1|c5be8c-202020|-16|-10|bdae8c-202020" , 0 , 0.9)
	local x1 , y1 = findMultiColor(580 , 352 , 680 , 373 , "efefef-202020" , "49|3|ada6a4-202020|50|-5|b5aead-202020|-12|7|948e8c-202020|21|-7|ffffff-202020|-42|0|7b6d6b-202020|-13|-7|ffffff-202020|2|-6|847d7b-202020|39|7|948e8c-202020|-21|9|fffbff-202020|17|9|94928c-202020|23|7|948e8c-202020|-21|3|fffbff-202020|-41|-7|ffffff-202020|2|8|bdb6b5-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		显示('服务器上限')
		按下点击({588 , 428 , 713 , 471})--服务器上限
		return true
	end
	
	local x3 , y3 = findMultiColor(560 , 365 , 638 , 386 , "94928c-202020" , "7|-14|7b7973-202020|-27|-15|6b6563-202020|22|-15|ffffff-202020|27|-11|84817b-202020|17|3|cecac5-202020|-10|-8|736d6b-202020|10|1|73716b-202020|44|-14|bdbebd-202020|-19|-2|948e8c-202020|-27|3|8c8a84-202020|-17|-15|ffffff-202020|34|-2|f7f7f7-202020|-29|-4|b5b2ad-202020|43|3|adaaa4-202020" , 0 , 0.9)
	if x ~= - 1 and y3 ~= - 1 then
		显示('剩余时间')
		按下点击({588 , 428 , 713 , 471})--服务器上限
		return true
	end
	return false
end

function 判断_在选区界面()
	local x , y = findMultiColor(782 , 13 , 860 , 42 , "08c300-202020" , "-2|-3|08ba00-202020|29|-7|5adb42-202020|23|-2|5adb42-202020|28|-3|292418-202020|43|-6|5adb42-202020|41|2|5adb42-202020|47|8|5adb42-202020|51|-4|292418-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
		
	end
	return false
end
function 判断_刷新_选区界面()
	
	local x , y = findMultiColor(72 , 659 , 110 , 682 , "ffffff-202020" , "-16|-2|ffffff-202020|-13|5|ffffff-202020|-17|-4|ce9e4a-202020|2|-4|efe7ce-202020|-2|3|d6b673-202020|13|-3|ffffff-202020|12|-2|ce9e4a-202020|12|5|ce9e42-202020|14|5|d6ae63-202020|3|-11|ffffff-202020|0|4|efd7b5-202020|8|1|ffffff-202020|5|-8|ffffff-202020|-4|4|e6d2ad-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
		
	end
	return false
end
function 判断_灰色圆_换区()
	setDict(0 , "界面判断2.txt")
	useDict(0)
	local ret , x , y = findStr(225 , 175 , 260 , 258 , "灰色" , "b5b6b5-202020" , 0.85 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		
		return true
		
	end
	return false
end

function 判断_小区加载完成_选区()
	
	local 运行时间 = os.time()
	
	while true do
		sleep(400)
		显示('等待小区加载完成....')
		if os.time() - 运行时间 > 30 then
			 
			return false
		end
		
		local x , y = findMultiColor(228 , 171 , 1121 , 634 , "08c600-303030" , "" , 0 , 0.9)
		if x ~= - 1 and y ~= - 1 then
			随机延时(700 , 800)
			return true
			
		else
			if 判断_灰色圆_换区() then
				按下点击({104 , 659 , 147 , 682})
				随机延时(500 , 600)
				return false
			end
			
		end
	end
	
	return false
end

function 大区一未选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区一未选" , "ad9273-303030" , 0.80 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		随机延时(500 , 600)
		return true
	end
	return false
end
function 大区二未选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区二未选" , "ad9273-303030" , 0.80 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		随机延时(500 , 600)
		return true
	end
	return false
end
function 大区三未选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区三未选" , "ad9273-303030" , 0.80 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		随机延时(500 , 600)
		return true
	end
	return false
end
function 大区四未选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区四未选" , "ad9273-303030" , 0.80 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		随机延时(500 , 600)
		return true
	end
	return false
end
function 大区五未选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区五未选" , "ad9273-303030" , 0.8 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		随机延时(500 , 600)
		return true
	end
	return false
end

function 大区一已选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区一已选" , "210c00-303030" , 0.8 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		随机延时(500 , 600)
		return true
	end
	return false
end

function 大区二已选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区二已选" , "210c00-303030" , 0.8 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		随机延时(500 , 600)
		return true
	end
	return false
end
function 大区三已选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区三已选" , "210c00-303030" , 0.8 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		随机延时(500 , 600)
		
		return true
	end
	return false
end
function 大区四已选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区四已选" , "210c00-303030" , 0.8 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		随机延时(500 , 600)
		return true
	end
	return false
end
function 大区五已选()
	setDict(0 , "换区.txt")
	useDict(0)
	local ret , x , y = findStr(10 , 277 , 116 , 645 , "大区五已选" , "210c00-303030" , 0.8 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		随机延时(500 , 600)
		return true
	end
	return false
end

function 大区1埃尔文防线()
	
	local 运行时间 = os.time()
	while true do
		显示('选择大区1')
		if os.time() - 运行时间 > 50 then
			
			return false
		end
		sleep(500)
		if 大区一未选() then
			
		else
			if 大区一已选() then
				显示('大区1已选中')
				return true
			end
			
		end
		
	end
	
end
function 大区2赫顿玛尔()
	显示('选择大区2')
	local 运行时间 = os.time()
	
	while true do
		if os.time() - 运行时间 > 50 then
			
			return false
		end
		
		sleep(500)
		if 大区二未选() then
			
		else
			if 大区二已选() then
				显示('大区2已选中')
				return true
			end
			
		end
	end
	
end
function 大区3西海岸()
	
	local 运行时间 = os.time()
	
	while true do
		显示('选择大区3')
		if os.time() - 运行时间 > 50 then
			
			return false
		end
		sleep(500)
		if 大区三未选() then
			
		else
			if 大区三已选() then
				显示('大区3已选中')
				return true
			end
			
		end
		
	end
	
	return false
end
function 大区4诺斯马尔()
	
	local 运行时间 = os.time()
	
	while true do
		显示('选择大区4')
		if os.time() - 运行时间 > 50 then
			
			return false
		end
		sleep(500)
		if 大区四未选() then
			
		else
			if 大区四已选() then
				显示('大区4已选中')
				return true
			end
			
		end
	end
	
end
function 大区5堕落之殿()
	
	local 运行时间 = os.time()
	
	while true do
		显示('选择大区5')
		if os.time() - 运行时间 > 50 then
			
			return false
		end
		sleep(500)
		if 大区五未选() then
			
		elseif 大区五已选() then
			显示('大区5已选中')
			return true
		else
			滑动(73 , 424 , 100 , 267 , 5 , 3 , {10 , 25} , {400 , 500})
			随机延时(600 , 700)
		end
		
	end
	
end

function 自动换区入口()
	按下点击({574 , 386 , 719 , 412})--选区入口
end
function 入口_到选区界面()
	显示('前往换区界面')
	local 已点击城镇设置 = false -- 状态标记：是否已从城镇界面点击设置按钮
	local 发行界面时间 = os.time()
	local 总运行时间 = os.time()
	while true do
		sleep(1000)
		if os.time() - 总运行时间 > 180 then
			显示('到选择角色界运行超时')
			关闭(地下城)
			总运行时间 = os.time()
			发行界面时间 = os.time()
		end
		if 判断_在选区界面() then
			
			随机延时(500 , 600)
			break
			
		elseif 判断_开始游戏界面() then
			
			自动换区入口()
			发行界面时间 = os.time()
			总运行时间 = os.time()
		elseif 判断_加载界面() then
			发行界面时间 = os.time()
			
		elseif 判断_启动界面_发行() then
			
			if os.time() - 发行界面时间 > 15then
				--关闭(地下城)
				keyPress(3)
				发行界面时间 = os.time()
				
			end
			
		elseif 清屏_闪退提示取消() then
			随机延时(300 , 500)
			发行界面时间 = os.time()
			总运行时间 = os.time()
		elseif 判断_选择角色界面_不用等加载() then
			
			按下点击({25 , 38 , 73 , 60})--返回
			随机延时(500 , 600)
			发行界面时间 = os.time()
			总运行时间 = os.time()
		elseif 判断_城镇界面() then
			显示('换区;打开设置前往选择角色界面')
			按下点击({1241 , 124 , 1267 , 140})
			随机延时(500 , 600)
			总运行时间 = os.time()
			发行界面时间 = os.time()
		elseif 判断_设置界面() then
			
			按下点击({813 , 620 , 878 , 667})--选择角色
			随机延时(500 , 600)
			总运行时间 = os.time()
			发行界面时间 = os.time()
		elseif 清屏(true) then
			
		else
			
			if 清屏(true) then
				
			end
			if 打开(地下城) then
				随机延时(2000 , 3000)
				发行界面时间 = os.time()
				总运行时间 = os.time()
			end
			
		end
	end
end
function 判断_创建新区普攻()
	
	local x , y = findMultiColor(733 , 380 , 1279 , 719 , "ffffad-202020" , "4|5|ffffad-202020|12|10|ffffad-202020|5|1|ffffad-202020|2|-1|ffffad-202020|-3|-2|ffffad-202020|-3|5|ffffad-202020|-6|-3|ffffad-202020|-7|-6|ffffad-202020|-1|1|ffffad-202020|14|8|ffffad-202020|1|1|ffffad-202020|7|5|ffffad-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		print('创新区普攻')
		X = x + 15
		Y = y + 15
		按下点击(X , Y)
		return true
	end
	return false
end
function 判断_下一步_创建新区()
	
	for i = 1 , 5 do
		local x , y = findMultiColor(1150 , 657 , 1227 , 694 , "ce8e29-202020" , "-20|6|f7e3c5-202020|-18|-6|fff7e6-202020|21|8|cea652-202020|15|9|d6b263-202020|31|3|c58a21-202020|-27|-9|fff3de-202020|21|1|deb263-202020|-20|0|f7e3c5-202020|25|-10|fff3de-202020|27|-2|f7e7c5-202020|-7|-2|e6c694-202020|-13|1|d6b66b-202020|-8|-8|c58a21-202020|15|-2|f7e7c5-202020" , 0 , 0.9)
		local x2 , y2 = findMultiColor(738 , 340 , 780 , 383 , "efdfa4-202020" , "-8|-19|94794a-202020|9|2|f7e7ad-202020|-7|10|c5ae73-202020|4|6|e6ce94-202020|7|-6|b59a63-202020|-3|-13|947d3a-202020|-16|0|c5b27b-202020|-9|3|e6d79c-202020|-1|10|c5ae73-202020|-7|-6|f7f3bd-202020|1|-6|deca94-202020|-8|16|c5b67b-202020" , 0 , 0.9)
		if x ~= - 1 and y2 ~= - 1 then --右下角下一步
			按下点击({1127 , 656 , 1252 , 700})
			return true
		end
		
		local x5 , y5 = findMultiColor(1135 , 656 , 1244 , 697 , "e6c68c-303030" , "3|4|fff3de-303030|-40|-8|fff7de-303030|-33|-6|fff3de-303030|-33|9|efd7ad-303030|-31|9|fff3de-303030|-25|2|fff3de-303030|-31|-3|fff3de-303030|2|-1|f7e7c5-303030|7|7|d6a652-303030|4|9|fff3de-303030|8|9|d6a652-303030|11|8|d6b263-303030|12|4|fff7de-303030|12|-3|fff3de-303030" , 0 , 0.9)
		if x5 ~= - 1 and y5 ~= - 1 then--右下角下一步
			按下点击({1127 , 656 , 1252 , 700})
			return true
		end
		
		local x3 , y3 = findMultiColor(1158 , 661 , 1222 , 689 , "a44d08-202020" , "1|4|a44d08-202020|1|13|ad5508-202020|-2|14|fff3de-202020|-8|10|fff3de-202020|-13|3|fff7e6-202020|-11|3|c5814a-202020|0|5|a44d00-202020|2|9|fff3de-202020|5|17|fff7e6-202020|10|17|fff3de-202020|19|10|fff3de-202020|14|8|efd2b5-202020|20|1|fff3de-202020|8|-2|c58652-202020|-17|16|fff3de-202020|-14|15|fff3de-202020" , 0 , 0.9)
		local x4 , y4 = findMultiColor(1000 , 661 , 1065 , 688 , "deba7b-202020" , "10|1|d6aa5a-202020|8|7|fff3de-202020|4|9|fff3de-202020|11|6|fff7e6-202020|13|7|fff3de-202020|15|6|d6aa5a-202020|12|0|fff3de-202020|2|-6|dec694-202020|8|-3|fff3de-202020|5|6|deba73-202020|5|-1|fff3de-202020|18|-3|fff3de-202020|-33|7|fff3de-202020|-40|10|d6ae5a-202020" , 0 , 0.9)
		if x3 ~= - 1 and y4 ~= - 1 then --保存
			按下点击({1128 , 654 , 1250 , 698})
			return true
		end
		local x6 , y6 = findMultiColor(1151 , 657 , 1216 , 693 , "fff3de-303030" , "14|-9|fff7de-303030|10|-2|fff3de-303030|13|4|fff3de-303030|29|-2|d6a67b-303030|15|-3|efd2b5-303030|17|-13|fff3de-303030|17|-14|fff3de-303030|-5|-13|fff3de-303030|-4|-7|fff7de-303030|-6|3|fff7de-303030|-10|-9|fff7de-303030|-11|-7|fff3de-303030|-10|-5|deaa7b-303030|-8|4|fff3de-303030" , 0 , 0.9)
		if x6 ~= - 1 and y6 ~= - 1 then--保存
			按下点击({1144 , 657 , 1246 , 696})
			return true
		end
		
		local x7 , y7 = findMultiColor(1151 , 658 , 1230 , 691 , "bd8a21-202020" , "-19|-6|fff7e6-202020|30|3|c58e21-202020|14|7|deb66b-202020|-21|6|f7e3c5-202020|24|-10|fff3de-202020|23|7|deb26b-202020|-14|-2|c5963a-202020|-10|-9|fff7de-202020|-21|0|f7e3c5-202020|18|-9|f7e7c5-202020|20|1|d6b263-202020|26|-2|f7e7c5-202020|14|-2|f7e7c5-202020|-6|0|bd8a21-202020" , 0 , 0.9)
		if x7 ~= - 1 and y7 ~= - 1 then
			按下点击({1127 , 656 , 1252 , 700})
			return true
		end
		
		sleep(100)
	end
	
	return false
end
function 判断_林纳斯_创建新区()
	
	setDict(0 , "字库3.txt")
	useDict(0)
	local ret , x , y = findStr(230 , 44 , 576 , 258 , "林纳斯" , "ffd27b-303030" , 0.85 , 10 , 10)
	if x ~= - 1 and y ~= - 1 then
		print('林纳斯')
		return true
	end
	return false
end
function 判断_跳过新手副本_创建新区()
	local x , y = findMultiColor(1078 , 16 , 1096 , 41 , "735519-202020" , "-4|10|8c7142-202020|0|9|9c9273-202020|-1|10|5a4521-202020|-2|9|b59663-202020|-7|0|a48a52-202020|-8|-12|b59e63-202020|-4|4|a48a52-202020|2|-2|8c7531-202020|4|-2|8c7531-202020|4|-3|a48142-202020|-3|-5|947531-202020|0|-8|7b6121-202020|0|-10|635119-202020|-12|-15|b5965a-202020" , 0 , 0.9)
	local x1 , y1 = findMultiColor(972 , 21 , 1016 , 36 , "f7efde-202020" , "16|-7|fffbe6-202020|17|0|fffbe6-202020|22|0|fffbe6-202020|23|0|fffbe6-202020|21|-2|fffbe6-202020|20|-10|e6e3ce-202020|11|-2|dedbce-202020|-3|-5|fff7e6-202020|-12|0|d6d2c5-202020|-8|-8|fffbe6-202020|-8|-8|fffbe6-202020|-11|-11|fff7de-202020|-11|-9|fff7e6-202020|-14|-10|fffbe6-202020" , 0 , 0.9)
	if x ~= - 1 and y1 ~= - 1 then
		按下点击(x , y)
		随机延时(1000 , 1200)
		return true
	end
	return false
end

function 判断_结束新手指引()
	
	local x , y = findMultiColor(613 , 256 , 666 , 284 , "fff3bd-202020" , "20|2|fff3bd-202020|0|3|ffefb5-202020|2|0|fef2bd-202020|3|-4|ffefb5-202020|4|6|f6e6b4-202020|20|-8|fff3bd-202020|-8|-14|fff3bd-202020|-24|-2|fff3bd-202020|-23|4|ffefb5-202020" , 0 , 0.9)
	local x1 , y1 = findMultiColor(561 , 335 , 661 , 361 , "f7f3f7-202020" , "-47|6|7b7973-202020|-7|5|84797b-202020|35|15|f7f7f7-202020|-7|14|c5c6c5-202020|51|9|9c9a94-202020|30|9|6b6563-202020|-28|15|7b7973-202020|37|4|9c9994-202020|-20|-3|fefefe-202020|-23|4|9c9994-202020|-15|12|fffffe-202020|48|15|d6d2d6-202020|10|4|736963-202020|-47|12|c5c2bd-202020" , 0 , 0.9)
	
	if x ~= - 1 and y1 ~= - 1 then
		按下点击({664 , 409 , 809 , 459})
		随机延时(500 , 700)
		return true
	end
	return false
end
function 判断_副本中_新手指引副本()
	setDict(0 , "界面判断2.txt")
	useDict(0)
	local ret , x , y = findStr(1067 , 11 , 1110 , 48 , "新手副本" , "fffbe6-303030" , 0.85 , 10 , 10)
	if x ~= - 1 then
		X = x
		Y = y
		显示('新手副本')
		按下点击(X , Y)
		return true
	end
	return false
	
end
创建新区中 = false
function 功能_自动创建新区()
	
	local 已保存 = false
	local 已点击普攻 = false
	local 点击分享 = false
	local 已分享 = false
	local 首次等待点击 = false
	 创建新区中 = true
	while true do
		显示('创建新区中....')
		随机延时(500 , 600)
		if 判断_开始游戏界面() then
			
			按下点击({593 , 505 , 688 , 529})--开始游戏
		elseif 判断_选择角色界面() or 判断_城镇界面() then
			return
		elseif 判断_下一步_创建新区() then
			local 运行时间 = os.time()
			while true do
				sleep(500)
				if os.time() - 运行时间 > 15 then
					显示("查找保存超时")
					break
				end
				if not 判断_下一步_创建新区() then
					
					已保存 = true
					break
				end
			end
		elseif 判断_副本中() or 判断_副本中_新手指引副本() then
			按下点击(1090 , 27)--设置
		elseif 已保存 and not 判断_下一步_创建新区() and (判断_林纳斯_创建新区() or 判断_单手操作_4字() or 判断_轮盘_ocr()) then
			print('判断_林纳斯_创建新区')
			
			--返回(4)
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
			--随机延时(300 , 400)
			
			--按下点击({1082 , 20 , 1099 , 39})--设置
			
		elseif 判断_猫图设置界面() then
			--按下点击({1082,20,1099,39})--设置
			按下点击({1049 , 615 , 1126 , 670})--返回城镇
			随机延时(1000 , 1200)
		elseif 入口_是_跳过新手指引() then
			
			print('入口_是_跳过新手指引')
		elseif 判断_跳过新手副本_创建新区() then
			print('判断_跳过新手副本_创建新区')
			
		elseif 判断_创建角色界面() then
			
			功能_自动创建角色_创区()
			return
			
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
			
		elseif 入口_确认(true) then
			print('入口_确认')
			
		elseif 清屏(true) then
			
		else
			打开(地下城)
		end
		
	end
	
end
function 初始化开始游戏界面()
	local 开始判断是否上限 = false
	local 查找次数 = 0
	while true do
		print("初始化开始游戏界面")
		随机延时(700 , 900)
		if 判断_开始游戏界面() then
			
			按下点击({593 , 505 , 688 , 529})--开始游戏
			随机延时(500 , 700)
			开始判断是否上限 = true
		elseif 开始判断是否上限 then
			
			if 判断_服务器上限() then
				
				return false
			end
			查找次数 = 查找次数 + 1
			if 查找次数 >= 3 then
				功能_自动创建新区()
				return true
			end
		elseif 清屏(true) then
			随机延时(500 , 700)
		else
			打开(地下城)
		end
	end
end
function 自动换区_1()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(557 , 173 , 723 , 255 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({241 , 183 , 489 , 246})--1区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		随机延时(500 , 800)
		
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_2()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(1065 , 166 , 1246 , 260 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({770 , 187 , 1233 , 248})--2区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_3()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(562 , 263 , 722 , 352 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({236 , 279 , 705 , 337})--3区
			else
				break
			end
			
			sleep(500)
		end
		
		随机延时(500 , 800)
		显示('已选 '..区配置信息)
		
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_4()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(1094 , 260 , 1248 , 352 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({770 , 276 , 1236 , 342})--4区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_5()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(552 , 357 , 727 , 444 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				按下点击({244 , 373 , 711 , 431})--5区
				
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_6()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(1089 , 360 , 1254 , 449 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				按下点击({773 , 373 , 1232 , 433})--6区
				
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_7()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(560 , 452 , 719 , 530 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({237 , 465 , 708 , 531})--7区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_8()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(1094 , 457 , 1248 , 543 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({776 , 465 , 1240 , 527})--8区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_9()
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(565 , 551 , 717 , 622 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({237 , 559 , 711 , 622})--9区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end
function 自动换区_10()
	
	local function 该区有角色()
		for i = 1 , 5 do
			local x , y = findMultiColor(1094 , 551 , 1248 , 624 , "ffffff-202020" , "" , 0 , 0.9)
			if x ~= - 1 and y ~= - 1 then
				return true
			end
			sleep(100)
		end
		return false
	end
	
	local 有角色 = 该区有角色()
	local 自动创建区 = 同步自动创建区功能()
	
	if 有角色 or 自动创建区 then
		for i = 1 , 30 do
			
			if 判断_在选区界面() then
				
				按下点击({770 , 561 , 1236 , 617})--10区
			else
				break
			end
			
			sleep(500)
		end
		
		显示('已选 '..区配置信息)
		if not 有角色 and 自动创建区 then
			if 自动创建区 then
				if 初始化开始游戏界面() then
					return true
				else
					return false
				end
			end
		end
		return true
	else
		显示('该区无角色跳过该区')
		return false
	end
end

-- 大区入口函数映射表
local 大区入口函数表 = {
	[1] = 大区1埃尔文防线 ,
	[2] = 大区2赫顿玛尔 ,
	[3] = 大区3西海岸 ,
	[4] = 大区4诺斯马尔 ,
	[5] = 大区5堕落之殿
}

-- 小区入口函数映射表
local 小区入口函数表 = {
	[1] = 自动换区_1 ,
	[2] = 自动换区_2 ,
	[3] = 自动换区_3 ,
	[4] = 自动换区_4 ,
	[5] = 自动换区_5 ,
	[6] = 自动换区_6 ,
	[7] = 自动换区_7 ,
	[8] = 自动换区_8 ,
	[9] = 自动换区_9 ,
	[10] = 自动换区_10
}

-- 执行单个区域的换区和任务
function 执行区域任务(大区号 , 小区号 , 配置名称 , 是否追加运行)
	
	区域标识 = "大区" .. 大区号 .. "小区" .. 小区号
	
	-- 检查是否已换过该区域（根据是否追加运行使用不同的状态文件）
	local 已换区域
	if 是否追加运行 then
		已换区域 = 读取已换区域_追加()
	else
		已换区域 = 读取已换区域()
	end
	
	if 已换区域[区域标识] then
		local 运行类型 = 是否追加运行 and "追加运行" or "第一轮"
		print("========== " .. 区域标识 .. " " .. 运行类型 .. "已换过，跳过执行 ==========")
		显示(区域标识 .. " 已换过，跳过")
		return false
	end
	
	-- 先设置当前区号和配置信息，确保后续显示正确
	-- 使用易读的格式：大区1小区1
	设置当前区号和配置(区域标识 , 配置名称)
	
	print("========== 开始执行 " .. 区域标识 .. " ==========")
	print("使用配置: " .. 配置名称)
	
	-- 进入选区界面
	入口_到选区界面()
	
	-- 点击大区入口
	local 大区入口函数 = 大区入口函数表[大区号]
	if 大区入口函数 then
		显示("选择大区" .. 大区号)
		
		大区入口函数()
		
	else
		print("错误: 大区" .. 大区号 .. "入口函数不存在")
		return false
	end
	
	if not 判断_小区加载完成_选区() then
		
		return 执行区域任务(大区号 , 小区号 , 配置名称)
	end
	
	-- 点击小区入口
	local 小区入口函数 = 小区入口函数表[小区号]
	if 小区入口函数 then
		显示("选择小区" .. 小区号)
		local 选区成功 = 小区入口函数()
		if not 选区成功 then
			print("该区无角色，跳过 " .. 区域标识)
			return false
		end
	else
		print("错误: 小区" .. 小区号 .. "入口函数不存在")
		return false
	end
	
	-- 加载对应区的配置
	if not 加载区域配置(区域标识 , 配置名称) then
		print("警告: " .. 区域标识 .. "的配置加载失败，使用当前配置继续执行")
	end
	
	-- 执行核心脚本逻辑
	同步功能_角色勾选状态()
	----------------------------换完一个区的提示--------------------
	if 同步云端功能() and not 服务器维护 then
		print('同步数据')
		用户云数据更新数据存在则更新(Token , i)
	end
	重置配置缓存()
	识别泰拉数量时间 = 0
	角色超时已提醒 = {}
	-- 记录已换过的区域（根据是否追加运行使用不同的记录函数）
	清空角色和功能完成进度()
	if 是否追加运行 then
		记录已换区域_追加(大区号 , 小区号)
	else
		记录已换区域(大区号 , 小区号)
	end
	
	print("========== " .. 区域标识 .. " 执行完毕 ==========")
	
	return true
end

function 自动换区主函数()
	每日六点自动初始化进度()
	打开(地下城)
	重置配置缓存()
	local 换区勾选 , 区域配置 , 首次大区号 , 首次小区号 = 同步自动换区勾选状态()
	-- 判断是否需要执行自动换区逻辑
	if 换区勾选 and 区域配置 and next(区域配置) then
		 	--每日六点自动初始化进度()
		print("========== 检测到自动换区已开启 ==========")
		
		-- 显示首次运行选择
		if 首次大区号 and 首次小区号 then
			print("首次选择: 大区" .. 首次大区号 .. "小区" .. 首次小区号)
		else
			print("首次选择: 默认（按勾选顺序执行）")
		end
		
		-- 统计配置的区域数量
		local 配置区域数量 = 0
		for _ in pairs(区域配置) do
			配置区域数量 = 配置区域数量 + 1
		end
		print("共配置了 " .. 配置区域数量 .. " 个区域")
		
		local 执行轮次 = 1
		local 首次区域key = nil
		
		-- 如果指定了首次运行区域，先执行首次选择区
		if 首次大区号 and 首次小区号 then
			首次区域key = 首次大区号 .. "_" .. 首次小区号
			local 首次区配置 = 区域配置[首次区域key]
			if 首次区配置 then
				print("---------- 第 " .. 执行轮次 .. " 轮：首次选择区（大区" .. 首次大区号 .. "小区" .. 首次小区号 .. "） ----------")
				
				if 执行区域任务(首次大区号 , 首次小区号 , 首次区配置.配置名称) then
					
					print("大区" .. 首次大区号 .. "小区" .. 首次小区号 .. " 已完成")
					发送喵提醒_自定义 ('已完成')
					执行轮次 = 执行轮次 + 1
				else
					print("错误: 首次选择区执行失败")
				end
			else
				print("警告: 首次选择区未配置，跳过")
			end
		end
		
		-- 按大区顺序执行其他区域
		for 大区号 = 1 , 5 do
			for 小区号 = 1 , 10 do
				local 区域key = 大区号 .. "_" .. 小区号
				local 区配置 = 区域配置[区域key]
				
				-- 跳过首次选择区（已经执行过）
				if 区域key ~= 首次区域key and 区配置 then
					
					print("---------- 第 " .. 执行轮次 .. " 轮：大区" .. 大区号 .. "小区" .. 小区号 .. " ----------")
					
					if 执行区域任务(大区号 , 小区号 , 区配置.配置名称) then
						执行轮次 = 执行轮次 + 1
					else
						print("大区" .. 大区号 .. "小区" .. 小区号 .. " 执行失败，继续下一个")
					end
				end
			end
		end
		
		print("=== 第一次换区流程执行完毕 ===")
		
		-- 检查是否需要追加运行
		local 追加运行勾选 , 追加配置名称 = 同步换区追加运行勾选状态()
		
		if 追加运行勾选 and 追加配置名称 then
			print("=== 开始执行换区追加运行 ===")
			print("追加配置: " .. 追加配置名称)
			显示("第一次换区完成，准备追加运行")
			toast("开始追加运行\n使用配置: " .. 追加配置名称 .. "\n所有区将使用此配置再次执行" , 0 , 0 , 14)
			
			-- 加载追加配置
			local 用户配置路径 = getSdPath() .. "/用户配置/" .. 追加配置名称 .. ".json"
			if fileExist(用户配置路径) then
				local 保存的配置内容 = readFile(用户配置路径)
				if 保存的配置内容 and 保存的配置内容 ~= "" then
					print("成功加载追加配置: " .. 追加配置名称)
					显示("加载追加配置: " .. 追加配置名称)
					
					-- 解析并应用追加配置（平铺结构），保留需要保留的字段
					local 追加配置 = jsonLib.decode(保存的配置内容) or {}
					应用保留字段(追加配置 , _配置缓存)
					_配置缓存 = 追加配置
					
					print(" 追加配置加载完成，开始第二轮换区")
					print(" 将使用 " .. 追加配置名称 .. " 对所有区进行第二轮执行")
					显示("追加配置加载完成: " .. 追加配置名称)
					toast(" 追加配置加载完成\n配置: " .. 追加配置名称 .. "\n开始第二轮换区执行" , 0 , 0 , 14)
					sleep(2000)
					print("追加配置加载完成，开始第二轮换区")
					print("将使用 " .. 追加配置名称 .. " 对所有区进行第二轮执行")
					
					清空角色和功能完成进度()
					
					print("已清空追加运行换区记录，准备开始第二轮")
					
					local 执行轮次2 = 1
					
					-- 按大区顺序执行第二轮（使用追加配置）
					for 大区号 = 1 , 5 do
						for 小区号 = 1 , 10 do
							local 区域key = 大区号 .. "_" .. 小区号
							local 区配置 = 区域配置[区域key]
							
							if 区配置 then
								print("---------- 追加运行第 " .. 执行轮次2 .. " 轮：大区" .. 大区号 .. "小区" .. 小区号 .. " ----------")
								
								if 执行区域任务(大区号 , 小区号 , 追加配置名称 , true) then
									执行轮次2 = 执行轮次2 + 1
								else
									print("追加运行大区" .. 大区号 .. "小区" .. 小区号 .. " 执行失败，继续下一个")
								end
							end
						end
					end
					
					print("=== 追加运行执行完毕 ===")
					print(" 追加配置 " .. 追加配置名称 .. " 已对所有区执行完成")
					显示("追加运行完成: " .. 追加配置名称)
					toast("追加运行完成！\n配置: " .. 追加配置名称 .. "\n所有区已执行完毕" , 0 , 0 , 14)
					sleep(2000)
				else
					print(" 追加配置文件为空: " .. 追加配置名称)
					显示("追加配置为空: " .. 追加配置名称)
					toast("️ 追加运行失败\n配置: " .. 追加配置名称 .. "\n配置文件为空，跳过追加运行" , 0 , 0 , 14)
					sleep(2000)
				end
			else
				print("追加配置文件不存在: " .. 追加配置名称)
				print("配置路径: " .. 用户配置路径)
				显示("追加配置不存在: " .. 追加配置名称)
				toast(" 追加运行失败\n配置: " .. 追加配置名称 .. "\n配置文件不存在，跳过追加运行" , 0 , 0 , 14)
				sleep(2000)
			end
		else
			print("未勾选换区追加运行或未选择追加配置")
		end
		
		-- 根据是否有追加运行发送不同的提醒
		if 追加运行勾选 and 追加配置名称 then
			发送喵提醒_自定义("所有换区任务已完成（包含追加运行: " .. 追加配置名称 .. "）")
			print("换区流程全部完成（含追加运行）")
			--每日六点自动初始化进度()
		else
			发送喵提醒_自定义("所有换区任务已完成")
			print("换区流程全部完成")
			--每日六点自动初始化进度()
		end
		
	else
		print("未开启自动换区或未选择任何区域，执行单次脚本流程。")
		--入口_到选择角色界面()
		同步功能_角色勾选状态()
		--每日六点自动初始化进度()
	end
	
end
