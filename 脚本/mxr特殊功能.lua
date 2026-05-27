当前购买次数 = 0

function 判断_购买物品界面()
	
	local x , y = findMultiColor(584 , 52 , 696 , 85 , "fff3bd-202020" , "58|-4|fff3bd-202020|-31|-10|ffefb5-202020|-31|-7|fff3bd-202020|-30|-9|efe3ad-202020|17|-3|fff3bd-202020|0|-9|423929-202020|35|-10|4a3d29-202020" , 0 , 0.92)
	
	if x ~= - 1 and y ~= - 1 then
		print('购买物品界面')
		return true
	end
	
	return false
end

function 判断_购买物品_入口()
	
	local x , y = findMultiColor(896 , 624 , 995 , 650 , "cea242-202020" , "-36|-5|c59231-202020|-23|-18|fff7de-202020|28|0|d6b263-202020|27|-9|efd7ad-202020|-37|-13|cea65a-202020|13|-2|efdbad-202020|6|-19|fff7de-202020|25|-18|fff7de-202020|-22|-3|ce9a42-202020|-11|-4|ffefd6-202020|-11|-14|c58e31-202020|18|-15|bd8a29-202020|22|-1|deba73-202020|-28|-12|deba73-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
	end
	print('未找到购买物品')
	return false
end

function 判断_拍卖行收藏()--五角星
	
	local x , y = findMultiColor(786 , 136 , 809 , 158 , "ffbe29-202020" , "-5|-2|ffc631-202020|-12|1|efb231-202020|-6|11|ffa610-202020|-4|10|ffa610-202020|1|12|ffa210-202020|3|13|ff9e08-202020|1|0|dea631-202020|-1|-2|ffc631-202020|-2|-4|f7c631-202020|-11|7|292019-202020|5|7|291c10-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('收藏了商品')
		return true
	end
	
	return false
end
function 判断_打开拍卖行界面()
	
	local x , y = findMultiColor(6 , 6 , 127 , 44 , "7b755a-202020" , "29|11|c5be94-202020|-46|14|efdfa4-202020|19|8|efdfad-202020|0|-6|7b755a-202020|-2|11|8c866b-202020|-62|-1|94753a-202020|10|4|8c8163-202020|4|11|efe3ad-202020|31|-3|efdfad-202020|-40|2|e6d79c-202020|39|7|9c9673-202020|-55|5|efdfa4-202020|39|1|9c9673-202020|-46|-13|9c9263-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
	end
	return false
end

function 判断_无库存()
	
	local x , y = findMultiColor(764 , 186 , 810 , 202 , "63619c-202020" , "-1|-1|42415a-202020|-2|-1|4a4563-202020|12|5|6361a4-202020|11|11|5a5d9c-202020|8|8|4a4973-202020|9|8|423d52-202020|-4|11|6361a4-202020|-3|12|42394a-202020|20|11|3a354a-202020|28|12|63619c-202020|8|-1|312d31-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('无库存')
		return true
	end
	return false
end
function 判断_出售中()
	
	local x , y = findMultiColor(763 , 186 , 810 , 202 , "9496ff-202020" , "21|5|9c96ff-202020|6|6|9496ff-202020|-15|5|9c96ff-202020|-16|11|9496ff-202020|-10|0|9496ff-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('出售中')
		return true
	end
	return false
end

function 判断_刷新_拍卖行()
	
	local x , y = findMultiColor(785 , 75 , 826 , 96 , "ad9273-202020" , "20|-3|a48e73-202020|17|8|a48e73-202020|-1|10|a48e6b-202020|-2|0|ad9273-202020|-7|0|a48e73-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('刷新')
		点击(x , y)
		随机延时(200 , 300)
		return true
	end
	点击(636 , 173)
	随机延时(200 , 300)
	return false
end
function 判断_刷新_购买物品()
	
	local x , y = findMultiColor(650 , 219 , 680 , 251 , "f7e7ad-202020" , "-4|1|b5a27b-202020|-4|22|b5a273-202020|-6|8|dece9c-202020|15|6|c5b684-202020|9|0|bdb284-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('购买物品界面刷新')
		点击(x , y)
		
		return true
	end
	return false
end

function 判断_拍卖行确认购买()
	
	local x , y = findMultiColor(576 , 148 , 702 , 184 , "8c8163-202020" , "-32|-20|ffefb5-202020|32|-7|7b755a-202020|12|3|8c8163-202020|10|-10|f7efb5-202020|-48|-21|fff3bd-202020|-30|-12|8c8163-202020|-60|-7|ffebb5-202020|-28|2|8c8163-202020|-39|1|6b694a-202020|21|-13|847d5a-202020|-22|-9|c5b68c-202020|-2|-21|fff3bd-202020|19|-4|bdb28c-202020|33|0|ded2a4-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		print('购买价格确认')
		点击(648 , 538)
		return true
	end
	
	return false
end

function 判断_购买结果确认()
	local x2 , y2 = findMultiColor(581 , 121 , 704 , 151 , "84795a-202020" , "-19|-7|84795a-202020|32|-11|f7e7ad-202020|-8|8|bdb68c-202020|-5|-4|bdb68c-202020|29|3|ffefbd-202020|32|9|f7e7ad-202020|21|6|c5ba8c-202020|-34|-12|ada27b-202020|34|-5|c5ba8c-202020|-62|9|efe3ad-202020|41|-8|848163-202020|24|-5|c5ba8c-202020|1|-10|c5ba8c-202020|-58|-9|d6ca9c-202020" , 0 , 0.9)
	if x2 ~= - 1 and y2 ~= - 1 then
		print('购买结果确认2')
		点击(631 , 571)
		return true
	end
end

function 判断_拍卖行确认购买2()
	
	local x , y = findMultiColor(610 , 561 , 668 , 587 , "fff3de-202020" , "11|1|fff3de-202020|25|8|ffefd6-202020|0|8|fff3de-202020|-9|1|fff3de-202020|-3|-2|fff7de-202020|8|-5|b57500-202020|8|5|bd7900-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('购买结果确认')
		点击(x , y)
		return true
	end
	
	return false
end
function 判断_确认_购买失败()
	
	local x , y = findMultiColor(612 , 255 , 669 , 286 , "fff3bd-202020" , "32|-3|ffefb5-202020|26|4|fff3bd-202020|-7|-18|c5ba8c-202020|-7|-3|fff3bd-202020|-6|-4|fff3bd-202020|4|2|fff3bd-202020|0|2|fff3bd-202020|-6|-10|fff3bd-202020|-6|-14|fff3bd-202020" , 0 , 0.9)
	
	local x1 , y1 = findMultiColor(611 , 420 , 666 , 451 , "fff7de-202020" , "8|1|e6c68c-202020|12|-5|fff3de-202020|14|0|fff7e6-202020|13|-6|fff3de-202020|12|-17|d6ba7b-202020|-26|-5|cea24a-202020|-8|3|fff3de-202020|-10|-5|fff3de-202020|-18|-11|fff3de-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 and x1 ~= - 1 and y1 ~= - 1 then
		点击(x1 , y1)
		return true
	end
	return false
end
function 判断_关闭X_购买物品()
	local x , y = findMultiColor(1136 , 54 , 1167 , 86 , "b5a28c-202020" , "-9|10|ada284-202020|5|-4|ada284-202020|7|-6|ada284-202020|12|-11|ada284-202020|11|11|b5a28c-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('关闭购买物品界面')
		点击(x , y)
		return true
	end
	
	local x1 , y1 = findMultiColor(887 , 153 , 916 , 181 , "ada284-202020" , "-1|0|b5a28c-202020|-9|-8|b5a28c-202020|-10|13|b5a28c-202020|-9|13|b5a28c-202020|-9|12|b5a28c-202020|-5|8|b5a28c-202020|-4|7|b5a28c-202020|-3|6|b5a28c-202020|4|-1|b5a28c-202020|6|-3|b5a28c-202020|7|-4|b5a28c-202020|11|-7|b5a28c-202020|11|-8|b5a28c-202020|12|-9|b5a28c-202020|4|4|ada284-202020|6|5|a49684-202020|9|9|ad9e84-202020|11|12|b5a28c-202020" , 0 , 0.9)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('关闭购买物品界面2')
		点击(x1 , y1)
		return true
	end
	local x2 , y2 = findMultiColor(887 , 152 , 917 , 182 , "b5a28c-202020" , "5|-5|b5a28c-202020|-6|-15|ada284-202020|-7|7|b5a28c-202020|-6|7|b5a284-202020|-1|1|b5a28c-202020|8|0|b5a28c-202020|5|-3|b5a28c-202020|10|-9|b5a284-202020|11|-11|b5a28c-202020|5|-11|292421-202020|-4|-5|292419-202020|11|-4|292419-202020" , 0 , 0.9)
	if x2 ~= - 1 and y2 ~= - 1 then
		print('关闭购买物品界面2')
		点击(x2 , y2)
		return true
	end
	print('未找到关闭物品界面')
	return false
end
function 功能_抢卡片()
	while true do
		sleep(500)
		if 判断_拍卖行收藏() and 判断_打开拍卖行界面() then
			break
		else
			显示('请前往拍卖行收藏商品')
			判断_关闭X_购买物品()
		end
	end
	while true do
		sleep(100)
		if 判断_刷新_拍卖行() then
			sleep(200)
		elseif 判断_出售中() then
			点击(636 , 173)
			sleep(200)
		elseif 判断_购买物品界面() then
			点击(947 , 631)--购买
			sleep(200)
		elseif 判断_拍卖行确认购买() then
			sleep(200)
		elseif 判断_购买结果确认() or 判断_确认_购买失败() then
			print('成功抢到一张卡片')
			随机延时(1000 , 1500)
			发送喵提醒_自定义('成功抢到一张卡片')
			return
			
		end
		
	end
	
end
function 特殊功能_获取材料价格()
	for 重试次数 = 1 , 2 do
		setDict(0 , "时装字库.txt")
		useDict(0)
		local str = ocr(192 , 275 , 297 , 314 , "fffbe6-202020" , 0.85 , 10 , 10)
		if str ~= nil then
			local 价格数值 = string.match(str , "(%d+)")
			if 价格数值 then
				local 价格 = tonumber(价格数值)
				return 价格 -- 直接返回识别到的价格，不做位数限制
			else
				if 重试次数 < 2 then
					sleep(50)
				else
					return 999999
				end
			end
		else
			if 重试次数 < 2 then
				sleep(50)
			else
				return 999999
			end
		end
		
	end
	return 999999
end
function 特殊功能_获取商品价格()
	setDict(0 , "时装字库.txt")
	useDict(0)
	local str = ocr(193 , 268 , 330 , 324 , "fffbe6-202020" , 0.85 , 1 , 1)
	if not str then return false end
	
	local 价格 = tonumber(string.match(str , "(%d+)"))
	return 价格 and 价格 >= 10 and 价格 or false
end

function 判断_设置数量_计算器()
	
	local x , y = findMultiColor(947 , 476 , 968 , 503 , "b5a284-202020" , "1|1|bdae94-202020|0|2|b5a284-202020|1|3|c5ae94-202020|0|4|b5a284-202020|-9|-3|c5ae94-202020|2|-10|bdaa8c-202020|-12|7|b5a684-202020|4|-17|bdaa8c-202020|4|-16|bdaa8c-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		return true
	end
	return false
end

function 判断_输入材料数量界面()
	
	local x , y = findMultiColor(1022 , 21 , 1134 , 51 , "ffefb5-202020" , "12|8|c5ba8c-202020|8|-11|fff3bd-202020|-58|6|ffefb5-202020|-48|1|ded2a4-202020|-49|-1|cec294-202020|-44|-2|423929-202020|-53|9|3a3129-202020" , 0 , 0.92)
	if x ~= - 1 and y ~= - 1 then
		print('输入材料界面')
		return true
	end
	return false
end

function 判断_输入最多()
	
	local x , y = findMultiColor(1115 , 584 , 1156 , 610 , "cea24a-202020" , "-2|6|ce9e4a-202020|-5|-1|fff3de-202020|-7|1|efdfbd-202020|-6|2|fff3de-202020|-2|-7|fff7de-202020|-4|-8|ceaa63-202020|9|-11|fff3de-202020|4|7|deba7b-202020|9|6|f7e3bd-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		return true
	end
	return false
end

function 判断_购买物品_购买物品界面()
	
	local x , y = findMultiColor(899 , 625 , 983 , 646 , "d6aa5a-202020" , "-8|-4|ceaa63-202020|-4|4|ce9e42-202020|-1|9|fff3de-202020|-3|10|fff3de-202020|10|11|deba73-202020|13|-4|fff3de-202020|23|3|fff3de-202020|-20|-5|debe84-202020|-28|-1|fff7e6-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		点击(x , y)
		return true
	end
	return false
end

function 判断_冷却中()
	
	local x , y = findMultiColor(561 , 124 , 630 , 149 , "ffffff-202020" , "-33|6|e6d7bd-202020|12|-4|ffffff-202020|12|8|ffffff-202020|20|0|ffffff-202020|6|5|ded2bd-202020|-13|-1|f7f3ef-202020|0|-3|ded2b5-202020|-11|11|ffffff-202020|-11|1|fffbf7-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
	end
	
	local x1 , y1 = findMultiColor(566 , 215 , 625 , 235 , "ceaa7b-202020" , "32|-4|ffffff-202020|31|1|e6dbc5-202020|24|5|ffffff-202020|15|5|efe3d6-202020|-1|-8|ffffff-202020|-10|-7|ffffff-202020|-5|-2|dec6ad-202020|0|6|ffffff-202020|0|-9|dec29c-202020" , 0 , 0.9)
	if x1 ~= - 1 and y1 ~= - 1 then
		return true
	end
	return false
end

function 功能_抢材料()
	
	while true do
		sleep(500)
		if 判断_拍卖行收藏() and 判断_打开拍卖行界面() then
			break
		else
			显示('请前往拍卖行收藏商品')
			判断_关闭X_购买物品()
		end
	end
	local 首次等待 = false
	local 只点一次购买 = false
	while true do
		sleep(200)
		if 判断_刷新_拍卖行() then
			
		elseif 判断_购买物品界面() then
			if not 首次等待 then
				print('-------首次进入购买物品界面等待1秒----------')
				sleep(1000)
				
				首次等待 = true
			end
			
			if 判断_刷新_购买物品() then
				
			elseif 判断价格是否合适() then
				显示("价格合适，设置数量")
				
				while true do
					
					if 判断_设置数量_计算器() then
						sleep(100)
					elseif 判断_输入最多() then
						sleep(100)
						while true do
							sleep(200)
							if 判断_冷却中() then
								print('冷却中退出')
								return
							elseif 判断_拍卖行确认购买() then
								--sleep(100)
							elseif 判断_购买结果确认() or 判断_确认_购买失败() then
								随机延时(1000 , 1500)
								print('完成购买')
								发送喵提醒_自定义('完成购买')
								return
								
							else
								if 判断_购买物品_购买物品界面() then
									--只点一次购买 = true
									--sleep(100)
								end
								
							end
							
						end
						
					end
					sleep(200)
				end
				
			end
			
		end
		
	end
	
end

function 功能_抢时装()
	显示('执行抢时装')
	while true do
		sleep(500)
		if 判断_拍卖行收藏() and 判断_打开拍卖行界面() then
			显示('收藏了商品')
			break
		else
			判断_关闭X_购买物品()
			显示('请前往拍卖行收藏商品')
		end
	end
	local 首次等待 = false
	local 已判断过价格 = false
	
	while true do
		sleep(100)
		
		if 判断_拍卖行确认购买() then
			
		elseif 判断_购买结果确认() or 判断_确认_购买失败() then
			随机延时(300 , 400)
			print('完成购买')
			发送喵提醒_自定义('完成购买')
			return
		elseif 判断_刷新_拍卖行() then
			
		elseif 判断_刷新_购买物品() then
			sleep(100)
		elseif 判断_购买物品界面() then
			if not 首次等待 then
				sleep(1000)
				print('首次进入购买物品界面等待1秒')
				首次等待 = true
				
			else
				
				if 已判断过价格 then
					return
				end
				if 判断时装价格是否合适() then
					print('点击购买物品')
					
					if 判断_购买物品_入口() then
						点击(941 , 637)--购买
						随机延时(300 , 400)
						已判断过价格 = true
					end
					
				end
			end
			
		end
		
	end
	
end
--+++++++++++++++++++++++++++++++++++++++++++++++++((挖矿))+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function 判断_挖矿界面()
	
	local x = - 1
	local y = - 1
	x , y = findMultiColor(1186 , 35 , 1249 , 90 , "735d42-202020" , "-3|1|9c7d63-202020|-2|-1|ad8e6b-202020|-2|-2|9c8163-202020|-1|-3|735d42-202020|1|-2|634529-202020|2|2|634931-202020|2|4|84694a-202020|-1|4|84654a-202020|-5|3|8c7152-202020|-7|1|63553a-202020|-16|-7|8c6d52-202020|-18|-2|846d52-202020|-6|16|735942-202020|10|13|7b5d42-202020|14|-7|735d42-202020|-1|-21|8c755a-202020|14|-14|846d52-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		
		return true
	else
		显示('请前往挖矿界面')
		return false
	end
	
end
function 判断_双重矿石()
	
	local x , y = findMultiColor(514 , 9 , 614 , 43 , "ffe3d6-202020" , "-13|-3|ffdfd6-202020|3|8|b59e9c-202020|4|6|ffdfd6-202020|1|2|b5a29c-202020|4|-6|dec2b5-202020|2|-7|b5a29c-202020|-1|0|dec6bd-202020|-4|-6|ffdfd6-202020|-4|-4|ffe3d6-202020|9|-10|ffdfd6-202020|19|7|ffdfce-202020|19|-1|ffdfce-202020|11|0|ffe3d6-202020|16|1|efd2ce-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		按下点击({74 , 566 , 163 , 639} , {1200 , 1800})
		随机延时(200 , 400)
		按下点击({1121 , 564 , 1205 , 641} , {1200 , 1800})
		return true
	end
	
	local x2 , y2 = findMultiColor(515 , 13 , 656 , 38 , "ffe3d6-202020" , "-16|-1|bdaaa4-202020|-17|-1|ffe3d6-202020|14|1|ffdfce-202020|13|3|ffe3d6-202020|30|6|ffe3d6-202020|28|0|ffe3d6-202020|-28|-5|ffdfce-202020|13|-10|bdaaa4-202020|-4|-12|ffe3d6-202020|-13|-7|ffe3d6-202020|-12|-3|ffdfd6-202020|-11|-1|ffe3d6-202020|-5|2|ffe3d6-202020|3|6|ffe3d6-202020" , 0 , 0.9)
	if x2 ~= - 1 and y2 ~= - 1 then --不稳定矿石
		按下点击({74 , 566 , 163 , 639} , {1200 , 1800})
		随机延时(200 , 400)
		按下点击({1121 , 564 , 1205 , 641} , {1200 , 1800})
		return true
	end
	return false
end
function 判断_锄头()
	local x = - 1
	local y = - 1
	x , y = findMultiColor(78 , 582 , 101 , 605 , "ad3519-202020" , "2|-10|b53921-202020|4|-8|b53919-202020|-2|5|a43119-202020|-7|-6|ad3519-202020|-4|-13|b53d19-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		
		return true
	end
	return false
end
function 挖矿_结算界面()
	local x = - 1
	local y = - 1
	x , y = findMultiColor(765 , 605 , 802 , 642 , "f78a10-202020" , "-1|2|f78600-202020|0|4|ff8a00-202020|0|6|ff8e00-202020|-1|8|ef8600-202020|-2|9|f78600-202020|-2|11|ef8600-202020|-2|14|ef9610-202020|-2|17|e69210-202020|-3|18|e69208-202020|-4|22|e69610-202020|-4|24|e69610-202020|-4|27|de9208-202020|6|4|ce7d10-202020|6|7|ef9210-202020|10|11|ef8a08-202020|12|9|e68e10-202020|11|6|ef8e08-202020|10|15|e69208-202020|6|17|e69610-202020|3|19|e69610-202020|10|19|e69608-202020|6|25|de9608-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		挖矿_再次挑战()
		return true
	end
	
	return false
end

function 挖矿_再次挑战()
	按下点击({681 , 595 , 841 , 652})
end

function 挖矿_退出挖矿()
	while true do
		sleep(200)
		if 判断_挖矿界面() then
			按下点击({1202 , 48 , 1234 , 80})--点击设置
			随机延时(2000 , 3000)
			按下点击({432 , 597 , 594 , 651})
			随机延时(2000 , 3000)
			返回(4)
			break
		end
		if 挖矿_结算界面() then
			
		end
		
	end
	
	while true do
		sleep(500)
		if 判断_设置界面() then
			按下点击({801 , 608 , 895 , 676})--选择角色
			break
		end
	end
	
	while true do
		sleep(500)
		if 判断_选择角色界面() then
			随机延时(3000 , 5000)
				关闭(地下城)
			break
		end
	end
end

function 功能_挖矿(挖矿时间)
	-- 设置默认挖矿时间为0.5小时
	挖矿时间 = 挖矿时间 or 0.5
	local 开始时间 = os.time()
	local 结束时间 = 开始时间 + (挖矿时间 * 3600) -- 转换为秒（小时*3600）
	
	显示("开始挖矿，计划挖矿时间：" .. 挖矿时间 .. "小时")
	
	while true do
		sleep(50)
		local 时间 = os.time()
		
		-- 检查是否到达指定时间
		if 时间 >= 结束时间 then
			显示("挖矿时间到，准备退出")
			挖矿_退出挖矿()
			return
		end
		
		if 判断_挖矿界面() then
			
			while true do
				sleep(50)
				if 判断_双重矿石() then
					
				elseif 判断_锄头() then
					按下点击({77 , 567 , 165 , 641} , {10 , 20})
					按下点击({1103 , 566 , 1211 , 640} , {10 , 30})
					按下点击({77 , 567 , 165 , 641} , {10 , 20})
					按下点击({1103 , 566 , 1211 , 640} , {10 , 30})
				else
					break
				end
			end
			
		elseif 挖矿_结算界面() then
			挖矿_再次挑战()
		end
		
		-- 计算并显示剩余时间
		local 剩余秒数 = 结束时间 - 时间 -- 这里修正了变量名
		local 剩余小时 = math.floor(剩余秒数 / 3600)
		local 剩余分钟 = math.floor((剩余秒数 % 3600) / 60)
		local 剩余秒 = 剩余秒数 % 60
		
		-- 计算进度百分比
		local 总秒数 = 挖矿时间 * 3600
		local 进度百分比 = math.floor((总秒数 - 剩余秒数) / 总秒数 * 100)
		
		显示(string.format("挖矿进度: %d%% 剩余时间: %02d:%02d:%02d" ,
		进度百分比 , 剩余小时 , 剩余分钟 , 剩余秒))
	end
end
------------------------------------------------------------钓鱼
function 钓鱼_开始()
	local x , y = findMultiColor(1115 , 641 , 1166 , 668 , "efce9c-202020" , "-18|10|efca94-202020|-15|8|cea242-202020|-15|7|fff3de-202020|-12|1|efd7ad-202020|-5|2|fff3de-202020|-4|-7|fff3de-202020|-12|-7|fff3de-202020|10|8|efce9c-202020|9|-3|e6ce9c-202020|10|-1|ce9e42-202020|19|-1|fff3de-202020|17|-6|fff3de-202020|18|6|fff7de-202020|6|-4|fff7e6-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		print('开始')
		
		return true
	end
	return false
end
function 钓鱼_首次收线()
	
	local x , y = findMultiColor(687 , 135 , 732 , 156 , "ff5152-202020" , "-2|10|ff514a-202020|7|11|ff4d4a-202020|16|13|ff5152-202020|16|-6|ef514a-202020|13|-7|ff4d4a-202020|15|-5|ff4d4a-202020|-2|-2|ff514a-202020|-2|5|ff5152-202020|4|6|f75152-202020|1|-5|ff4d4a-202020|-25|7|ff4d4a-202020|-8|10|ff5152-202020|-8|-6|ff5152-202020|-9|-7|ff4d4a-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
	end
	return false
end
function 钓鱼_收线()
	local x , y = findMultiColor(1038 , 510 , 1087 , 547 , "c56d31-202020" , "-3|-10|ce864a-202020|-8|-8|ce8652-202020|-23|11|d66510-202020|-19|15|d67d3a-202020|-8|-6|c57542-202020|2|7|c55d19-202020|2|9|d67931-202020|13|3|c55d21-202020|20|0|bd6129-202020|13|2|c5713a-202020|12|3|c55919-202020|17|-10|bd5d29-202020|15|-5|d68e5a-202020|7|-22|b54d21-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		print('收线')
		return true
	end
	return false
end
function 钓鱼_收线中()
	
	local x1 , y1 = findMultiColor(1035 , 515 , 1099 , 562 , "ef7d4a-202020" , "29|19|f78131-202020|-6|15|ef7d42-202020|-10|5|ef7131-202020|-20|3|ef865a-202020|14|13|ef7d4a-202020|7|16|ef8642-202020|22|17|f78a29-202020|29|1|f78629-202020|-8|4|f77542-202020|13|7|ef713a-202020|21|-4|e65929-202020|-13|0|ef7129-202020|-30|12|f77931-202020|-27|14|ef6d29-202020" , 0 , 0.9)
	if x1 ~= - 1 and y1 ~= - 1 then
		print('收线中')
		return true
	end
	return false
end
function 钓鱼_强制收线临界值()
	
	local x , y = findMultiColor(986 , 470 , 1018 , 499 , "29c600-202020" , "1|2|5af731-202020|3|3|6bff42-202020|9|6|219600-202020|5|-1|7b818c-202020|2|-2|3a414a-202020|0|-5|3a3d4a-202020|8|3|424152-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		return true
	end
	return false
end
function 钓鱼_停止收线临界值()
	
	local x , y = findMultiColor(1132 , 475 , 1150 , 495 , "f7ce00-202020" , "0|6|ffd708-202020|3|4|ffca00-202020|-3|5|ffdb08-202020|-1|10|ffbe00-202020|1|6|ffd208-202020|6|6|ffba00-202020|-8|-2|ffe33a-202020|-10|-4|ffe310-202020|-5|-6|ceba19-202020|-9|-9|f7d700-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		print('到达临界值强制停止收线')
		return true
	end
	return false
end
function 钓鱼_命中1()
	
	local ret , x , y = findImage(239 , 445 , 249 , 457 , "命中1.png|命中2.png|命中3.png|命中4.png" , 1.0)
	if x~= - 1 and y ~= - 1 then
		return true
	end
	return false
end
function 钓鱼_命中()
	
	local x , y = findMultiColor(72 , 420 , 330 , 549 , "4affff-202020" , "1|1|4affff-202020|3|4|ce8110-202020|5|4|f7a200-202020|4|6|ffa200-202020|3|6|f79e00-202020|2|6|f79200-202020|7|2|f79e00-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		--tap(201,546)
		return true
	end
	
	local x2 , y2 = findMultiColor(72 , 420 , 330 , 549 , "4affff-202020" , "-1|0|42e7ef-202020|-2|5|e69600-202020|-3|6|ffa200-202020" , 0 , 0.9)
	if x2 ~= - 1 and y2 ~= - 1 then
		--tap(201,546)
		return true
	end
	
	--[===[local x3 , y3 = findMultiColor(72 , 424 , 331 , 578 , "4ae7ef-303030" , "-3|4|f79e00-303030|-3|6|ffa200-303030|0|6|ff9a00-303030|-2|4|f79e00-303030|0|-3|42cade-303030|0|-2|42d2e6-303030|1|-1|4affff-303030|2|0|42fbff-303030|3|-1|3afbff-303030" , 3 , 0.9)
	if x3 ~= - 1 and y3 ~= - 1 then
	return true
	end
	
	local x4 , y4 = findMultiColor(72 , 424 , 331 , 578 , "42fbff-303030" , "-8|7|f79a00-303030|-9|8|ffa200-303030|4|11|ffa200-303030|4|8|f7a200-303030|1|-1|3ae7f7-303030" , 3 , 0.85)
	if x4 ~= - 1 and y4 ~= - 1 then
	return true
	end]===]
	return false
end

function 钓鱼_连击两侧按钮()
	
	local x , y = findMultiColor(570 , 135 , 656 , 171 , "bdc2a4-202020" , "10|1|b5a694-202020|23|-6|c5c6ad-202020|23|0|adaa9c-202020|26|-11|ada28c-202020|12|-13|efe7ce-202020|15|-13|efe7ce-202020|14|-11|cec2ad-202020|24|-21|cebaa4-202020|-27|-10|dedbc5-202020|-24|-24|c5b2ad-202020|-37|-5|e6e3c5-202020|-43|-25|cebab5-202020|-21|-5|efefce-202020|-5|-24|ceb6a4-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		print('连击两侧按钮')
		return true
	end
	return false
end
function 钓鱼_失败确认()
	
	local x , y = findMultiColor(709 , 535 , 759 , 559 , "ffffff-202020" , "14|2|cea65a-202020|13|6|ffffff-202020|7|-1|e6d2ad-202020|10|7|d6b673-202020|17|-7|ceaa63-202020|-8|-6|d6b67b-202020|-10|8|dec68c-202020|-6|7|ffffff-202020|1|-2|ffffff-202020|0|9|ffffff-202020|-6|3|ffffff-202020|-15|2|ffffff-202020|-13|1|ffffff-202020|-4|-2|ffffff-202020" , 0 , 0.9)
	local x2 , y2 = findMultiColor(578 , 143 , 701 , 175 , "ffefb5-202020" , "40|-7|fff3bd-202020|37|-12|fff3bd-202020|29|3|f7ebb5-202020|38|9|bdb68c-202020|51|9|ffefb5-202020|5|-11|ffefb5-202020|3|11|d6c69c-202020|20|10|ffefb5-202020|-16|-4|f7ebb5-202020|-20|-10|ffefb5-202020|-39|-9|ffefb5-202020|-39|-13|ffefb5-202020|-53|-4|fff3bd-202020|-45|-9|ffefb5-202020" , 0 , 0.9)
	if x ~= - 1 and x2 ~= - 1 then
		显示('钓鱼失败')
		return true
	end
	
	return false
end
function 钓鱼_成功确认()
	local x , y = findMultiColor(437 , 457 , 891 , 714 , "ffffff-202020" , "13|9|ffffff-202020|14|6|ffffff-202020|20|13|ffffff-202020|17|6|ffffff-202020|4|-4|d6b27b-202020|8|-2|ffffff-202020|-16|1|ffffff-202020|-12|-4|fffbff-202020|-10|11|ffffff-202020|-3|14|cea24a-202020|-3|1|ffffff-202020|-4|4|ffffff-202020|-5|-3|ffffff-202020|-4|-2|f7e7d6-202020" , 0 , 0.9)
	local x2 , y2 = findMultiColor(582 , 99 , 695 , 128 , "fff3b5-202020" , "-25|-4|d6ca9c-202020|53|-3|ffefb5-202020|55|-5|b5ae84-202020|61|6|fff3bd-202020|29|3|ffefb5-202020|37|4|ffefb5-202020|29|-10|e6d7a4-202020|35|-15|bdb68c-202020|28|-14|ffefb5-202020|-5|-15|ffefb5-202020|-27|-17|ffefb5-202020|-29|-9|f7ebb5-202020|-27|-12|fff3bd-202020|-20|-2|b5ae84-202020" , 0 , 0.9)
	
	if x ~= - 1 and x2 ~= - 1 then
		随机延时(1000 , 1500)
		显示('钓鱼成功')
		按下点击(x , y)
		return true
	end
	return false
end
function 钓鱼_退出()
	
	local x , y = findMultiColor(1198 , 39 , 1240 , 62 , "ffebde-202020" , "-7|4|ffe7d6-202020|-10|-4|e6b694-202020|-11|-2|ffe7d6-202020|-12|3|e6b694-202020|-13|7|f7d7bd-202020|3|-1|ffebde-202020|-5|2|deb694-202020|-2|-2|efcab5-202020|0|-3|ffe7d6-202020|2|-8|ffebde-202020|15|4|ffe7d6-202020|9|0|d6a67b-202020|8|0|ffebde-202020|23|7|ffebde-202020" , 0 , 0.9)
	if x ~= - 1 and y ~= - 1 then
		
		return true
	end
	return false
end
local function 开始收线()
	-- 在指定范围内随机按下，增加更大
	--1049,523,1089,559
	
	local x = math.random(1049 , 1089)
	local y = math.random(523 , 559)
	
	-- 添加轻微的按下延迟，模拟人手反应时间
	local 按下延迟 = math.random(8 , 25)
	--sleep(按下延迟)
	touchDown(1 , x , y)
	sleep(math.random(5 , 15))
end
local function 停止收线()
	touchUp(1)
end

local function 命中()
	---175,517,247,573
	local x = math.random(175 , 247)
	local y = math.random(517 , 573)
	
	touchDown(0 , x , y)
	sleep(math.random(70 , 80))
	touchUp(0)
end
local function 点击左()
	---175,517,247,573
	local x = math.random(175 , 247)
	local y = math.random(517 , 573)
	
	-- 添加轻微的按下延迟，模拟人手反应时间
	local 按下延迟 = math.random(8 , 25)
	--sleep(按下延迟)
	touchDown(0 , x , y)
	sleep(math.random(70 , 80))
	touchUp(0)
end
local function 点击右()
	--- 1036,520,1110,573
	local x = math.random(1036 , 1110)
	local y = math.random(520 , 573)
	
	-- 添加轻微的按下延迟，模拟人手反应时间
	local 按下延迟 = math.random(8 , 25)
	--sleep(按下延迟)
	touchDown(0 , x , y)
	sleep(math.random(70 , 80))
	touchUp(0)
end
local function 连击()
	点击左()
	点击右()
end
function 工会_钓鱼(钓鱼时间)
	-- 设置默认挖矿时间为0.5小时
	钓鱼时间 = 钓鱼时间 or 0.5
	local 开始时间 = os.time()
	local 结束时间 = 开始时间 + (钓鱼时间 * 3600) -- 转换为秒（小时*3600）
	
	local 一秒开始计时 = os.time()
	
	显示("开始钓鱼，计划钓鱼时间：" .. 钓鱼时间 .. "小时")
	local 收线 = false
	local function 安全停止收线()
		if 收线 then
			停止收线()
			收线 = false
		end
	end
	local function 安全收线 ()
		if not 收线 then
			开始收线()
			收线 = true
		end
	end
	while true do
		sleep(10)
		local 时间 = os.time()
		
		-- 检查是否到达指定时间
		if 时间 >= 结束时间 then
			显示("钓鱼时间到，准备关闭游戏")
			安全停止收线()
				关闭(地下城)
			return
		end
		if 检测游戏是否闪退() then
			print('检测到游戏闪退')
			安全停止收线()
			return
		end
		if 钓鱼_开始() then
			安全停止收线()
			按下点击({1085 , 638 , 1214 , 672})
			随机延时(1500 , 2500)
			goto 标签
		elseif 钓鱼_失败确认() then
			安全停止收线()
			按下点击({677 , 532 , 796 , 563})
			随机延时(1000 , 1500)
			goto 标签
		elseif 钓鱼_成功确认() then
			安全停止收线()
			
			随机延时(1000 , 1500)
			goto 标签
		end
		
		if 钓鱼_命中() then
			if os.time() - 一秒开始计时 > 1 then
				命中()
				一秒开始计时 = os.time()
				--goto 标签
			end
			--[===[安全停止收线()
			按下点击({167 , 510 , 251 , 583})]===]
			
			--tap(209,534)
			安全收线()
		elseif 钓鱼_连击两侧按钮() then
			安全停止收线()
			while true do
				sleep(10)
				if not 钓鱼_连击两侧按钮() then
					
					break
				end
				if 钓鱼_连击两侧按钮() then
					连击()
				end
				
			end
			
			sleep(200)
			安全收线()
			if 钓鱼_收线() or 钓鱼_收线中() then
				安全收线()
			end
		elseif 钓鱼_首次收线() then
			随机延时(2000 , 2500)
			安全收线()
		elseif 钓鱼_强制收线临界值() then
			
			安全收线()
		elseif 钓鱼_停止收线临界值() then
			安全停止收线()
			
		end
		:: 标签 ::
		-- 计算并显示剩余时间
		local 剩余秒数 = 结束时间 - 时间 -- 这里修正了变量名
		local 剩余小时 = math.floor(剩余秒数 / 3600)
		local 剩余分钟 = math.floor((剩余秒数 % 3600) / 60)
		local 剩余秒 = 剩余秒数 % 60
		
		-- 计算进度百分比
		local 总秒数 = 钓鱼时间 * 3600
		local 进度百分比 = math.floor((总秒数 - 剩余秒数) / 总秒数 * 100)
		
		显示(string.format("钓鱼进度: %d%% 剩余时间: %02d:%02d:%02d" ,
		进度百分比 , 剩余小时 , 剩余分钟 , 剩余秒))
	end
	
end

