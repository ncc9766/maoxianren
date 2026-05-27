-- ========== 背景变化找色函数（简洁版） ==========

-- 主函数：背景变化找色
function 背景变化找色(特征)
	-- 特征格式：{x1, y1, x2, y2, 主色, 偏移点, 方向, 相似度}
	if not 特征 or #特征 < 6 then
		print("特征数据格式错误")
		return false , - 1 , - 1
	end
	
	local x1 , y1 , x2 , y2 = 特征[1] , 特征[2] , 特征[3] , 特征[4]
	local 主色 = 特征[5]
	local 偏移点 = 特征[6]
	local 方向 = 特征[7] or 0
	local 初始相似度 = 特征[8] or 0.92
	
	-- 策略1：动态调整相似度（从高到低）
	local 相似度列表 = {初始相似度 , 初始相似度 - 0.05 , 初始相似度 - 0.1 , 初始相似度 - 0.15}
	
	for _ , 相似度 in ipairs(相似度列表) do
		if 相似度 < 0.9 then break end -- 最低不低于75%
		
		local x , y = findMultiColor(x1 , y1 , x2 , y2 , 主色 , 偏移点 , 方向 , 相似度)
		
		if x ~= - 1 and y ~= - 1 then
			-- 二次验证，防止误识别
			sleep(200)
			local x2 , y2 = findMultiColor(x - 5 , y - 5 , x + 5 , y + 5 , 主色 , 偏移点 , 方向 , 相似度 - 0.02)
			if x2 ~= - 1 and y2 ~= - 1 then
				return true , x , y
			end
		end
	end
	
	-- 策略2：如果还没找到，尝试分区域查找
	local 区域扩展 = 10 -- 扩展搜索区域
	local x_new , y_new = findMultiColor(
	math.max(0 , x1 - 区域扩展) ,
	math.max(0 , y1 - 区域扩展) ,
	x2 + 区域扩展 ,
	y2 + 区域扩展 ,
	主色 , 偏移点 , 方向 , 0.8
	)
	
	if x_new ~= - 1 and y_new ~= - 1 then
		return true , x_new , y_new
	end
	
	return false , - 1 , - 1
end

-- 简化版：直接返回坐标
function 找色(特征)
	local 找到 , x , y = 背景变化找色(特征)
	if 找到 then
		return x , y
	end
	return - 1 , - 1
end

-- 带点击功能
function 找色并点击(特征)
	local 找到 , x , y = 背景变化找色(特征)
	if 找到 then
		tap(x , y)
		return true
	end
	return false
end

-- 循环查找（直到找到或超时）
function 等待找色(特征 , 超时秒数)
	超时秒数 = 超时秒数 or 5
	local 结束时间 = os.time() + 超时秒数
	
	while os.time() < 结束时间 do
		local 找到 , x , y = 背景变化找色(特征)
		if 找到 then
			return true , x , y
		end
		sleep(200)
	end
	
	return false , - 1 , - 1
end

-- ========== 使用示例 ==========

function 示例_查找文字()
	-- 你的特征数据
	local 特征 = {215 , 221 , 278 , 236 , "d2d4d6-050505" , "34|-2|c9cbce-050505|35|1|e6e7e8-050505|19|1|cbcdd0-050505|27|1|f5f6f6-050505|17|0|e2e3e4-050505|16|-1|9fa4a7-050505|-15|1|a0a6ab-050505|-16|1|cfd2d4-050505|-10|4|c3c7ca-050505|-8|0|eeeff0-050505|-11|-4|cacdd0-050505|-12|-7|cdcfd2-050505|-11|-7|cfd2d4-050505|5|-7|d2d5d7-050505" , 0 , 0.92}
	
	-- 方式1：获取坐标
	local 找到 , x , y = 背景变化找色(特征)
	if 找到 then
		print("找到目标：" .. x .. "," .. y)
	end
	
	-- 方式2：简化调用
	local x , y = 找色(特征)
	if x ~= - 1 then
		print("找到：" .. x .. "," .. y)
	end
	
	-- 方式3：直接点击
	if 找色并点击(特征) then
		print("已点击目标")
	end
	
	-- 方式4：等待出现
	local 找到 , x , y = 等待找色(特征 , 3) -- 等待3秒
	if 找到 then
		print("等待后找到：" .. x .. "," .. y)
	end
end
 


