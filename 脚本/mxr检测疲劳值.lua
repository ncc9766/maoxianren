function 功能_获取疲劳值()
	if 判断_城镇界面() then
		if 判断_疲劳值为0() then
			print('红色OCR确认疲劳值为0')
			当前角色疲劳值 = "| 疲劳值:".. 0
			return 0
		end
		setDict(0 , "城镇疲劳值.txt")
		useDict(0)
		-- 先尝试白色OCR（疲劳值1-99）
		local str = ocr(121 , 52 , 153 , 77 , "ffffff-303030" , 0.85 , 1 , 1)
		if str~= nil then--白色
			print('城镇界面白色OCR识别到:'..str)
			local 疲劳值 = tonumber(str)
			if 疲劳值 ~= nil and 疲劳值 > 0 then
				当前角色疲劳值 = "| 疲劳值:".. 疲劳值
				return 疲劳值
			end
		end
		return 999
	elseif 判断_返回城镇1() then
	
		if 判断_副本中疲劳值为0() then
			print('红色OCR确认疲劳值为0')
			当前角色疲劳值 = "| 疲劳值1:".. 0
			return 0
		end
		setDict(0 , "副本内疲劳值.txt")
		useDict(0)
		-- 先尝试白色OCR（疲劳值1-99）
		local str1 = ocr(129 , 58 , 173 , 86 , "ffffff-303030|d6d7d6-303030" , 0.85 , 1 , 1)--白
		if str1~= nil then
			print('返回城镇界面白色OCR识别到:'..str1)
			local 疲劳值1 = tonumber(str1)
			if 疲劳值1 ~= nil and 疲劳值1 > 0 then
				当前角色疲劳值 = "| 疲劳值1:"..疲劳值1
				return 疲劳值1
			end
		end
		return 999
	else
		return 999
	end
end

function 判断_副本内疲劳值()
	setDict(0 , "副本内疲劳值.txt")
	useDict(0)
	-- 先尝试白色OCR（疲劳值1-99）
	local str1 = ocr(129 , 58 , 173 , 86 , "ffffff-303030|d6d7d6-303030" , 0.85 , 1 , 1)--白
	if str1~= nil then
		return true
	end
	if 判断_正在拾取() then
		return true
	end
	return false
end
