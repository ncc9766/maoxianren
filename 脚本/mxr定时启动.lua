-- 全局配置参数
local 随机分钟最小值 = 1 -- 最小随机附加分钟
local 随机分钟最大值 = 10 -- 最大随机附加分钟
local 随机秒数最小值 = 1 -- 最小随机附加秒数
local 随机秒数最大值 = 59 -- 最大随机附加秒数

-- 定义当前的执行缓存
local 今日随机启动日期 = nil -- 今天随机时间对应的日期
local 今日随机启动时间 = nil -- 今天的实际启动时间

local function 格式化时间戳(时间戳)
	return os.date("%Y-%m-%d %H:%M:%S" , 时间戳 or os.time())
end

-- 获取定时模式设置
function 获取定时模式()
	-- 从单选框获取定时模式 (0=刷完, 1=立刻)
	
	local 定时模式值 = 读取配置值("单选框_定时模式") or 0
	return tonumber(定时模式值) or 0
end

-- 从UI读取定时设置
function 获取定时设置()
	-- 检查是否启用定时功能
	local 启用定时功能 = ui同步(读取配置值("多选框_定时启动"))
	
	-- 如果没有启用定时功能，直接返回nil
	if not 启用定时功能 then
		return nil
	end
	
	-- 从输入框获取启动时间字符串
	local 启动时间字符串 = 读取配置值("输入框_启动时间") or ""
	
	-- 解析时间字符串 (格式应为 "HH:MM" 或 "HH")
	local 小时 , 分钟 = 启动时间字符串:match("(%d+):?(%d*)")
	
	-- 转换为数字，并提供默认值
	小时 = tonumber(小时) or 6 -- 如果未指定，默认为6点
	分钟 = tonumber(分钟) or 0 -- 如果未指定，默认为0分
	
	-- 验证时间的有效性
	if 小时 < 0 or 小时 > 23 then 小时 = 6 end
	if 分钟 < 0 or 分钟 > 59 then 分钟 = 0 end
	
	--print("启动时间为: " .. 小时 .. ":" .. 分钟)
	
	-- 返回时间设置
	return {
		小时 = 小时 ,
		分钟 = 分钟 ,
		秒 = 0
	}
end

-- 计算今天的随机启动时间戳
function 计算随机启动时间戳()
	local 今日日期 = os.date("%Y-%m-%d")
	-- 如果已经有今天的启动时间，直接返回
	if 今日随机启动时间 and 今日随机启动日期 == 今日日期 then
		return 今日随机启动时间
	end
	
	-- 获取基础时间设置
	local 基础时间 = 获取定时设置()
	
	-- 如果定时功能已关闭，返回nil
	if not 基础时间 then
		return nil
	end
	
	-- 生成随机分钟数和随机秒数
	local 随机分钟 = math.random(随机分钟最小值 , 随机分钟最大值)
	local 随机秒数 = math.random(随机秒数最小值 , 随机秒数最大值)
	
	-- 计算实际启动时间
	local 实际分钟 = 基础时间.分钟 + 随机分钟
	local 实际小时 = 基础时间.小时
	local 实际秒数 = 随机秒数 -- 直接使用随机秒数
	
	-- 处理分钟溢出
	if 实际分钟 >= 60 then
		实际小时 = 实际小时 + math.floor(实际分钟 / 60)
		实际分钟 = 实际分钟 % 60
	end
	
	-- 处理小时溢出（24小时制）
	if 实际小时 >= 24 then
		实际小时 = 实际小时 % 24
	end
	
	local now = os.date("*t")
	local 启动时间戳 = os.time({
		year = now.year ,
		month = now.month ,
		day = now.day ,
		hour = 实际小时 ,
		min = 实际分钟 ,
		sec = 实际秒数
	})
	
	-- 创建时间表
	今日随机启动时间 = 启动时间戳
	今日随机启动日期 = 今日日期
	
	print("随机启动时间: " .. 格式化时间戳(启动时间戳))
	
	return 启动时间戳
end

function 执行游戏启动()
	print("开始执行游戏启动程序 - " .. os.date("%Y-%m-%d %H:%M:%S"))
	每日六点自动初始化进度()
	
	-- 使用异常捕获运行游戏启动过程
	local 成功 , 错误信息 = pcall(function()
		
	
		重启插件()
		打开(地下城)
		自动换区主函数()
		入口_到选择角色界面()
		
		执行重启云机_刷完()
		随机延时(2000 , 3000)
		关闭(地下城)
		
	end)
	
	-- 检查执行是否成功
	if 成功 then
		print("游戏启动和角色选择过程执行成功")
	else
		print("游戏启动过程失败: " .. tostring(错误信息))
	end
end

-- 定时检查循环，不使用定时器，直接在主线程中循环
local dsqd = nil

local function 重置随机启动缓存()
	今日随机启动日期 = nil
	今日随机启动时间 = nil
end

function 定时检查循环()
	local 检查始化进度 = false
	local 进度已初始化 = false
	while true do
		local 当前时间 = os.date("*t")
		local 当前小时 = 当前时间.hour
		local 当前分钟 = 当前时间.min
		local 当前秒 = 当前时间.sec
		
		if not dsqd then
			dsqd = createHUD()
		end
		
		local 基础时间 = 获取定时设置()
		if 基础时间 then
			if not 检查始化进度 then
				if 是否需要每日六点初始化进度() then
					print('已到达初始化进度时间')
					进度已初始化 = true
				else
					print('没有到达初始化进度时间')
					进度已初始化 = false
				end
				检查始化进度 = true
			end
			local 当前时间戳 = os.time(当前时间)
			local 启动时间戳 = 计算随机启动时间戳()
			if 启动时间戳 and 启动时间戳 < 当前时间戳 then
				启动时间戳 = 启动时间戳 + 24 * 3600
			end
			local 剩余时间 = 启动时间戳 and (启动时间戳 - 当前时间戳) or nil
			
			if not 启动时间戳 then
				print("定时功能配置有误，无法计算启动时间")
			elseif 进度已初始化 then
				正在定时启动 = false
				if dsqd then
					hideHUD(dsqd)
					dsqd = nil
				end
				
				print("6点初始化时间已到,直接执行任务")
				print("立即执行原因: 已到每日六点初始化进度时间")
				
				print("开始执行游戏启动程序")
				执行游戏启动()
				重置随机启动缓存()
				启动时间戳 = 计算随机启动时间戳()
				print("执行后重新计算下一次随机启动时间: " .. 格式化时间戳(启动时间戳 or 当前时间戳))
				检查始化进度 = false
				进度已初始化 = false
			elseif 启动时间戳 and 当前时间戳 >= 启动时间戳 then
				正在定时启动 = false
				if dsqd then
					hideHUD(dsqd)
					dsqd = nil
				end
				
				print("到达今日随机启动时间: " .. 格式化时间戳(启动时间戳 or 当前时间戳))
				print("立即执行原因: 当前时间戳已达到启动时间戳")
				print("开始执行游戏启动程序")
				执行游戏启动()
				重置随机启动缓存()
				启动时间戳 = 计算随机启动时间戳()
				print("执行后重新计算下一次随机启动时间: " .. 格式化时间戳(启动时间戳 or 当前时间戳))
				
				检查始化进度 = false
				进度已初始化 = false
			else
				print(string.format(
				"定时检查: 当前=%s, 启动=%s, 进度已初始化=%s, 距离启动还有=%02d:%02d:%02d" ,
				os.date("%Y-%m-%d %H:%M:%S" , 当前时间戳) ,
				os.date("%Y-%m-%d %H:%M:%S" , 启动时间戳 or 当前时间戳) ,
				tostring(进度已初始化) ,
				剩余时间 and math.floor(剩余时间 / 3600) or 0 ,
				剩余时间 and math.floor((剩余时间 % 3600) / 60) or 0 ,
				剩余时间 and (剩余时间 % 60) or 0
				))
				正在定时启动 = true
				local 目标剩余时间 = 剩余时间 or 0
				local 剩余小时 = math.floor(目标剩余时间 / 3600)
				local 剩余分钟 = math.floor((目标剩余时间 % 3600) / 60)
				local 剩余秒 = 目标剩余时间 % 60
				local 提示内容 = string.format(
				"当前时间: %s;启动时间: %s;剩余时间: %02d:%02d:%02d" ,
				格式化时间戳(当前时间戳) ,
				格式化时间戳(启动时间戳 or 当前时间戳) ,
				剩余小时 ,
				剩余分钟 ,
				剩余秒
				)
				showHUD(dsqd , 提示内容 , 10 , "0xffff0000" , "0xffffffff" , 0 , 0 , 1270 , 0 , 0)
				print("不立即执行原因: 当前时间还没到启动时间,继续等待")
			end
		end
		
		sleep(1000)
	end
end

-- 立刻模式：等待到今天随机时间后执行
function 立刻进入定时等待()
	关闭_HUD()
	-- 获取基础时间设置
	local 基础时间 = 获取定时设置()
	if not 基础时间 then
		print("定时功能未启用或配置有误，直接进入主流程")
		return
	end
	local 立刻定时 = tonumber(读取配置值("单选框_定时模式")) or 0
	if 立刻定时 ~= 1 then
		return
	end
	print("立刻进入定时" .. tostring(立刻定时))
	-- 初始化随机数生成器
	math.randomseed(os.time())
	
	-- 获取当前时间
	local 当前时间 = os.date("*t")
	local 当前小时 = 当前时间.hour
	local 当前分钟 = 当前时间.min
	local 当前秒 = 当前时间.sec
	local 当前日期 = os.date("%Y-%m-%d")
	local 当前时间戳 = os.time(当前时间)
	
	-- 计算今日启动时间
	local 启动时间戳 = 计算随机启动时间戳()
	
	local 当前时间数值 = 当前小时 * 3600 + 当前分钟 * 60 + 当前秒
	local 基础时间数值 = 基础时间.小时 * 3600 + 基础时间.分钟 * 60
	
	-- 判断是今天执行还是明天执行
	local 等待明天 = false
	if 当前时间数值 >= 基础时间数值 then
		等待明天 = true
		print("当前时间(" .. 格式化时间戳(当前时间戳) .. ")晚于设定时间(" .. 格式化时间戳(启动时间戳 or 当前时间戳) .. ")，等待明天执行")
	else
		print("当前时间(" .. 格式化时间戳(当前时间戳) .. ")早于设定时间(" .. 格式化时间戳(启动时间戳 or 当前时间戳) .. ")，等待今天执行")
		print("今日随机启动时间: " .. 格式化时间戳(启动时间戳 or 当前时间戳))
	end
	
	关闭(地下城)
	
	-- 创建HUD显示
	local dsqd = createHUD()
	
	while true do
		local 当前时间 = os.date("*t")
		local 当前时间戳_立刻 = os.time(当前时间)
		正在定时启动 = true
		-- 如果是等待明天，等日期切换后再重新计算随机启动时间
		if 等待明天 then
			local 新日期 = os.date("%Y-%m-%d")
			if 新日期 ~= 当前日期 then
				当前日期 = 新日期
				今日随机启动日期 = nil
				今日随机启动时间 = nil
				启动时间戳 = 计算随机启动时间戳()
				print("计算明天的随机启动时间: " .. 格式化时间戳(启动时间戳 or 当前时间戳_立刻))
				等待明天 = false -- 已经切到新的一天，不再是等待明天状态
			end
		end
		
		if 启动时间戳 and 启动时间戳 < 当前时间戳_立刻 then
			启动时间戳 = 启动时间戳 + 24 * 3600
		end
		
		local 剩余 = 启动时间戳 and (启动时间戳 - 当前时间戳_立刻) or nil
		
		if 启动时间戳 and 当前时间戳_立刻 >= 启动时间戳 then
			print("到达定时启动时间戳，开始执行主流程")
			if dsqd then
				hideHUD(dsqd) --隐藏HUD
				dsqd = nil --已销毁
			end
			正在定时启动 = false
			return
		else
			local h = math.floor(剩余 / 3600)
			local m = math.floor((剩余 % 3600) / 60)
			local s = 剩余 % 60
			
			-- 统一显示随机启动时间
			local 提示内容 = string.format(
			"立刻:当前时间: %s;随机启动时间: %s;剩余时间: %02d:%02d:%02d" ,
			格式化时间戳(当前时间戳_立刻) ,
			格式化时间戳(启动时间戳 or 当前时间戳_立刻) ,
			h ,
			m ,
			s
			)
			
			-- 使用与定时检查循环相同的HUD显示方式
			showHUD(dsqd , 提示内容 , 10 , "0xffff0000" , "0xffffffff" , 0 , 0 , 1270 , 0 , 0)
			sleep(1000)
		end
	end
end

function 刷完进入定时功能()
	关闭_HUD()
	local 基础时间 = 获取定时设置()
	if not 基础时间 then
		print("主要任务已完成，定时功能未启用")
		return
	end
	print("刷完后直接进入定时检查循环")
	定时检查循环()
end
