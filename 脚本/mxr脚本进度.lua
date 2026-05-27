
function 清空所有进度()
	清空已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
	清空已换区域()
	清空已换区域_追加()
	print('已清空所有进度')
end

function 清空角色和功能完成进度()
	创建魔法师 = false
	清空已完成角色()
	清空已完成通用功能()
	清空已完成随机功能和黑钻深渊()
end
----------------------------------------------继续上次进度运行

-- ========== 每日初始化日期记录 ==========
local 初始化日期文件 = "/sdcard/wk_last_reset_date.txt"

function 读取上次清空日期()
	local 文件 = io.open(初始化日期文件 , "r")
	if not 文件 then return nil end
	local 日期 = 文件:read("*l")
	文件:close()
	return 日期
end

function 保存清空日期(日期)
	local 文件 = io.open(初始化日期文件 , "w")
	if 文件 then
		文件:write(日期)
		文件:close()
	end
end

function 是否需要每日六点初始化进度()
	local now = os.date("*t")
	local 今天日期 = os.date("%Y-%m-%d")
	local 上次清空日期 = 读取上次清空日期()
	return now.hour >= 6 and (not 上次清空日期 or 今天日期 ~= 上次清空日期)
end

function 每日六点自动初始化进度()
	if 是否需要每日六点初始化进度() then
		local 今天日期 = os.date("%Y-%m-%d")
		清空所有进度()
		保存清空日期(今天日期)
		print("已执行每日6点初始化，清空所有进度")
		return true
	end
	
	return false
end


-- ========== 角色完成状态管理 ==========
local 状态文件路径 = "/sdcard/wk_completed_roles.txt"

function 保存已完成角色()
	
	local 文件 = io.open(状态文件路径 , "a")
	if 文件 then
		文件:write(角色序号 .. "\n")
		文件:close()
	end
	
end

function 读取已完成角色()
      当前角色抗魔值 = nil
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(状态文件路径 , "r")
		if not 文件 then return {} end
		
		local 已完成 = {}
		for 行 in 文件:lines() do
			local 序号 = tonumber(行)
			if 序号 then
				已完成[序号] = true
			end
		end
		文件:close()
		
		return 已完成
	end
	
	return {}
end

function 清空已完成角色()
	local 文件 = io.open(状态文件路径 , "w")
	if 文件 then
		文件:close()
		print('已清空角色完成进度')
		 
	end
end

-- ========== 通用功能完成状态管理 ==========
local 通用功能状态文件 = "/sdcard/wk_common_functions_status.txt"

function 保存已完成通用功能(功能id)
	
	local 文件 = io.open(通用功能状态文件 , "a")
	if 文件 then
		文件:write("func:" .. 功能id .. "\n")
		文件:close()
	end
	
end

function 读取已完成通用功能()
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(通用功能状态文件 , "r")
		if not 文件 then return {} end
		local 已完成 = {}
		for 行 in 文件:lines() do
			local 功能id = 行:match("^func:(.+)$")
			if 功能id then
				已完成[功能id] = true
			end
		end
		文件:close()
		return 已完成
	end
	
	return {}
end

function 清空已完成通用功能()
   
	local 文件 = io.open(通用功能状态文件 , "w")
	if 文件 then
		文件:close()
		print('已清空通用功能完成进度')
		--toast(" 已清空所有运行进度" , 0 , 0 , 20)
		
	end
end

-- ========== 随机功能和黑钻深渊完成状态管理 ==========
local 随机功能状态文件 = "/sdcard/wk_random_abyss_status.txt"

function 保存已完成随机功能和黑钻深渊(功能id)
	
	local 文件 = io.open(随机功能状态文件 , "a")
	if 文件 then
		文件:write(功能id .. "\n")
		文件:close()
	end
	
end

function 读取已完成随机功能和黑钻深渊()
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(随机功能状态文件 , "r")
		if not 文件 then return {} end
		local 已完成 = {}
		for 行 in 文件:lines() do
			if 行 ~= "" then
				已完成[行] = true
			end
		end
		文件:close()
		return 已完成
	end
	
	return {}
end

function 清空已完成随机功能和黑钻深渊()
	local 文件 = io.open(随机功能状态文件 , "w")
	if 文件 then
		文件:close()
		print('已清空随机功能和黑钻深渊完成进度')
	end
end

-- ========== 区域换区状态管理 ==========
local 区域状态文件 = "/sdcard/wk_completed_areas.txt"

function 记录已换区域(大区号 , 小区号)
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(区域状态文件 , "a")
		if 文件 then
			文件:write("大区" .. 大区号 .. "小区" .. 小区号 .. "\n")
			文件:close()
		end
	end
	
end

function 读取已换区域()
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(区域状态文件 , "r")
		if not 文件 then return {} end
		local 已换区域 = {}
		for 行 in 文件:lines() do
			if 行 ~= "" then
				已换区域[行] = true
			end
		end
		文件:close()
		return 已换区域
	end
	
	return {}
end

function 清空已换区域()
	local 文件 = io.open(区域状态文件 , "w")
	if 文件 then
		文件:close()
		print('已清空换区完成进度')
	end
end

-- ========== 区域换区状态管理 ==========
local 区域状态文件 = "/sdcard/wk_completed_areas.txt"

function 记录已换区域(大区号 , 小区号)
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(区域状态文件 , "a")
		if 文件 then
			文件:write("大区" .. 大区号 .. "小区" .. 小区号 .. "\n")
			文件:close()
		end
	end
	
end

function 读取已换区域()
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(区域状态文件 , "r")
		if not 文件 then return {} end
		local 已换区域 = {}
		for 行 in 文件:lines() do
			if 行 ~= "" then
				已换区域[行] = true
			end
		end
		文件:close()
		return 已换区域
	end
	
	return {}
end

function 清空已换区域()
	
	local 文件 = io.open(区域状态文件 , "w")
	if 文件 then
		文件:close()
		print('已清空换区完成进度')
	end
end

-- ========== 追加换区状态管理 ==========
local 追加区域状态文件 = "/sdcard/wk_completed_areas_append.txt"

function 记录已换区域_追加(大区号 , 小区号)
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(追加区域状态文件 , "a")
		if 文件 then
			文件:write("大区" .. 大区号 .. "小区" .. 小区号 .. "\n")
			文件:close()
		end
	end
	
end

function 读取已换区域_追加()
	if 同步继续上次进度运行功能() then
		local 文件 = io.open(追加区域状态文件 , "r")
		if not 文件 then return {} end
		local 已换区域 = {}
		for 行 in 文件:lines() do
			if 行 ~= "" then
				已换区域[行] = true
			end
		end
		文件:close()
		return 已换区域
	end
	
	return {}
end

function 清空已换区域_追加()
	local 文件 = io.open(追加区域状态文件 , "w")
	if 文件 then
		文件:close()
		print('已清空追加换区完成进度')
	end
end
