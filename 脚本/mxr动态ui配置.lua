_配置缓存 = nil
function 读取配置值(id)
	if not _配置缓存 then
		local _raw = readFile("/sdcard/uiConfig.json")
		_配置缓存 = _raw and jsonLib.decode(_raw)
	end
	if not _配置缓存 then return nil end
	return _配置缓存[id]
end
function 重置配置缓存()
	_配置缓存 = nil
end

function 同步使用账号勾选状态()
	
	local 复选框值 = 读取配置值("多选框_使用账号运行游戏")
	local 使用账号勾选 = ui同步(复选框值)
	return 使用账号勾选
end
function 同步使用账号登录游戏功能()
	if 同步使用账号勾选状态() then
		print('已勾选同步使用账号登录')
		功能_还原账号()
		return true
	end
	return false
end
function 同步掉线自动登录勾选状态()
	
	local 复选框值 = 读取配置值("多选框_掉线自动登录账号")
	local 掉线自动登录勾选 = ui同步(复选框值)
	return 掉线自动登录勾选
end
function 同步掉线自动登录游戏功能()
	if 同步掉线自动登录勾选状态() then
		功能_还原账号()
		return true
	end
	return false
end

---+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++喵提醒++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function 发送喵提醒_自定义 (提醒内容)
	
	local 喵提醒勾选状态 =  ui同步(读取配置值("多选框_喵提醒"))
	
	if not 喵提醒勾选状态 then
		--print('不发送喵提醒')
		return false
	end
	
	local 喵提醒码 = 读取配置值("输入框_喵提醒")
	
	local 区配置信息 = ""
	if 当前区号 ~= '' and 当前区号 ~= nil then
		if 当前配置名称 ~= '' and 当前配置名称 ~= nil then
			区配置信息 = "[" .. 当前区号 .. "-" .. 当前配置名称 .. "] "
		else
			区配置信息 = "[" .. 当前区号 .. "] "
		end
	end
	
	-- 添加泰拉数量到提醒内容（使用之前保存的全局变量）
	print('发送提醒时 当前泰拉数量 = ' .. tostring(当前泰拉数量))
	
	local 最终提醒内容 = 提醒内容
	if 当前角色疲劳值 ~= nil then
		最终提醒内容 = 最终提醒内容 ..当前角色疲劳值
	end
	if 当前泰拉数量 then
		最终提醒内容 = 最终提醒内容 .. " | 泰拉数量: " .. 当前泰拉数量
	end
	if 当前角色抗魔值 then
		最终提醒内容 = 最终提醒内容 .. " | 抗魔值: " .. 当前角色抗魔值
	end
	
	-- 添加角色信息到提醒内容
	local 完整提醒内容
	if 角色序号 and 角色序号 ~= '' then
		完整提醒内容 = "[角色" .. 角色序号 ..区配置信息.. "] " .. 最终提醒内容
	else
		
		完整提醒内容 = 最终提醒内容
	end
	
	local http = require("socket.http")
	local ltn12 = require("ltn12")
	local 响应表 = {}
	
	local function 网址编码(字符串)
		字符串 = string.gsub(字符串 , "([^%w%.%- ])" , function(字符) return string.format("%%%02X" , string.byte(字符)) end)
		return string.gsub(字符串 , " " , "+")
	end
	
	local 响应 , 状态码 , 响应头 = require("socket.http").request{
		url = "http://miaotixing.com/trigger?id=" .. 喵提醒码 .. "&text=" .. 网址编码(完整提醒内容) ,
		sink = ltn12.sink.table(响应表)
	}
end
function 发送喵提醒_测试(内容)
	
	local 喵提醒码 = 读取配置值("输入框_喵提醒")
	local 提醒内容 = 内容
	
	local http = require("socket.http")
	local ltn12 = require("ltn12")
	local 响应表 = {}
	
	local function 网址编码(字符串)
		字符串 = string.gsub(字符串 , "([^%w%.%- ])" , function(字符) return string.format("%%%02X" , string.byte(字符)) end)
		return string.gsub(字符串 , " " , "+")
	end
	
	local 响应 , 状态码 , 响应头 = require("socket.http").request{
		url = "http://miaotixing.com/trigger?id=" .. 喵提醒码 .. "&text=" .. 网址编码(提醒内容) ,
		sink = ltn12.sink.table(响应表)
	}
end

function 发送喵提醒()
	local 喵提醒码 = 读取配置值("输入框_喵提醒")
	local 提醒内容 = "角色" .. 角色序号 .. "已完成所有任务"
	
	local http = require("socket.http")
	local ltn12 = require("ltn12")
	local 响应表 = {}
	
	local function 网址编码(字符串)
		字符串 = string.gsub(字符串 , "([^%w%.%- ])" , function(字符) return string.format("%%%02X" , string.byte(字符)) end)
		return string.gsub(字符串 , " " , "+")
	end
	
	local 响应 , 状态码 , 响应头 = require("socket.http").request{
		url = "http://miaotixing.com/trigger?id=" .. 喵提醒码 .. "&text=" .. 网址编码(提醒内容) ,
		sink = ltn12.sink.table(响应表)
	}
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- 添加ui同步函数，用于将UI控件的字符串值转换为布尔值
function ui同步(值)
	-- 处理各种可能的输入
	if 值 == nil then
		return false
	elseif type(值) == "boolean" then
		return 值
	elseif type(值) == "string" then
		-- 将字符串 "true" 转换为 true，其他都转换为 false
		return 值 == "true"
	else
		return false
	end
end

function 洗牌(表)
	local 结果 = {}
	local 临时表 = {}
	
	for i , v in ipairs(表) do
		临时表[i] = v
	end
	
	local 长度 = #临时表
	while 长度 > 0 do
		local 索引 = math.random(长度)
		结果[#结果 + 1] = 临时表[索引]
		临时表[索引] = 临时表[长度]
		长度 = 长度 - 1
	end
	
	return 结果
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(同步装备勾选状态)++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function 同步出售装备勾选状态()
	-- 检查通用功能是否存在
	
	if 读取配置值("多选框_出售白装") == nil and
		读取配置值("多选框_出售蓝装") == nil and
		读取配置值("多选框_出售紫装") == nil and
		读取配置值("多选框_出售粉装") == nil and
		读取配置值("多选框_出售史诗") == nil and
		读取配置值("多选框_出售超凡") == nil then
		print("警告: 装备勾选配置未找到，跳过同步")
		return
	end
	
	local 白装应勾选 = ui同步(读取配置值("多选框_出售白装"))
	local 蓝装应勾选 = ui同步(读取配置值("多选框_出售蓝装"))
	local 紫装应勾选 = ui同步(读取配置值("多选框_出售紫装"))
	local 粉装应勾选 = ui同步(读取配置值("多选框_出售粉装"))
	local 史诗应勾选 = ui同步(读取配置值("多选框_出售史诗"))
	local 超凡应勾选 = ui同步(读取配置值("多选框_出售超凡"))
	
	local 当前白装 = 判断_勾选了白装()
	--[===[print("UI白装应勾选:" , 白装应勾选 , "游戏内白装:" , 当前白装)
	print("比较结果(白装应勾选 ~= 当前白装):" , 白装应勾选 ~= 当前白装)]===]
	if 白装应勾选 ~= 当前白装 then
		print("点击白装勾选框")
		按下点击(271 , 604)
		随机延时(500 , 1000)
	end
	
	local 当前蓝装 = 判断_勾选了蓝装()
	--print("UI蓝装应勾选:" , 蓝装应勾选 , "游戏内蓝装:" , 当前蓝装)
	if 蓝装应勾选 ~= 当前蓝装 then
		print("点击蓝装勾选框")
		按下点击(426 , 606)
		随机延时(500 , 1000)
	end
	
	local 当前紫装 = 判断_勾选了紫装()
	--print("UI紫装应勾选:" , 粉装应勾选 , "游戏内紫装:" , 当前粉装)
	if 紫装应勾选 ~= 当前紫装 then
		print("点击紫装勾选框")
		按下点击(581 , 603)
		随机延时(500 , 1000)
	end
	
	local 当前粉装 = 判断_勾选了粉装()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 粉装应勾选 ~= 当前粉装 then
		print("点击粉装勾选框")
		按下点击(734 , 604)
		随机延时(500 , 1000)
	end
	
	local 当前史诗 = 判断_勾选了ss()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 史诗应勾选 ~= 当前史诗 then
		print("点击史诗装勾选框")
		按下点击(272 , 650)
		随机延时(500 , 1000)
	end
	local 当前超凡 = 判断_勾选了超凡()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 超凡应勾选 ~= 当前超凡 then
		print("点击超凡装勾选框")
		按下点击(426 , 648)
		随机延时(500 , 1000)
	end
	
end

function 同步分解装备勾选状态()
	
	if 读取配置值("多选框_分解白装") == nil and
		读取配置值("多选框_分解蓝装") == nil and
		读取配置值("多选框_分解紫装") == nil and
		读取配置值("多选框_分解粉装") == nil and
		读取配置值("多选框_分解史诗") == nil and
		读取配置值("多选框_分解超凡") == nil then
		print("警告: 分解装备勾选配置未找到，跳过同步")
		return
	end
	
	local 白装应勾选 = ui同步(读取配置值("多选框_分解白装"))
	local 蓝装应勾选 = ui同步(读取配置值("多选框_分解蓝装"))
	local 紫装应勾选 = ui同步(读取配置值("多选框_分解紫装"))
	local 粉装应勾选 = ui同步(读取配置值("多选框_分解粉装"))
	local 史诗应勾选 = ui同步(读取配置值("多选框_分解史诗"))
	local 超凡应勾选 = ui同步(读取配置值("多选框_分解超凡"))
	
	local 当前白装 = 判断_勾选了白装()
	--[===[print("UI白装应勾选:" , 白装应勾选 , "游戏内白装:" , 当前白装)
	print("比较结果(白装应勾选 ~= 当前白装):" , 白装应勾选 ~= 当前白装)]===]
	if 白装应勾选 ~= 当前白装 then
		print("点击白装勾选框")
		按下点击(272 , 604)
		随机延时(500 , 1000)
	end
	
	local 当前蓝装 = 判断_勾选了蓝装()
	--print("UI蓝装应勾选:" , 蓝装应勾选 , "游戏内蓝装:" , 当前蓝装)
	if 蓝装应勾选 ~= 当前蓝装 then
		print("点击蓝装勾选框")
		按下点击(425 , 605)
		随机延时(500 , 1000)
	end
	
	local 当前紫装 = 判断_勾选了紫装()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 紫装应勾选 ~= 当前紫装 then
		print("点击紫装勾选框")
		按下点击(581 , 603)
		随机延时(500 , 1000)
	end
	local 当前粉装 = 判断_勾选了粉装()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 粉装应勾选 ~= 当前粉装 then
		print("点击粉装勾选框")
		按下点击(734 , 604)
		随机延时(500 , 1000)
	end
	
	local 当前史诗 = 判断_勾选了ss()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 史诗应勾选 ~= 当前史诗 then
		print("点击史诗装勾选框")
		按下点击(272 , 650)
		随机延时(500 , 1000)
	end
	local 当前超凡 = 判断_勾选了超凡()
	--print("UI紫装应勾选:" , 紫装应勾选 , "游戏内紫装:" , 当前紫装)
	if 超凡应勾选 ~= 当前超凡 then
		print("点击超凡装勾选框")
		按下点击(426 , 648)
		随机延时(500 , 1000)
	end
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++((角色1执行功能)++++++++++++++++++++++++++++++++++++++++++++++++++++++

function 同步工会签到勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_工会签到")
	local 工会签到勾选 = ui同步(复选框值)
	return 工会签到勾选
end

function 同步工会签到功能()
	if 同步工会签到勾选状态() then
		功能_工会签到()
		
	end
end
function 同步自动设置勾选状态()
	local 复选框值 = 读取配置值("多选框_一键设置")
	local 自动设置勾选 = ui同步(复选框值)
	return 自动设置勾选
end

function 同步合卡一次勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_合卡")
	local 合卡一次勾选 = ui同步(复选框值)
	return 合卡一次勾选
	
end

function 同步合卡一次功能()
	if 同步合卡一次勾选状态() then
		功能_合卡一次()
		
	end
end

function 同步合徽章一次勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_合徽章")
	local 合徽章一次勾选 = ui同步(复选框值)
	return 合徽章一次勾选
end

function 同步合徽章一次功能()
	if 同步合徽章一次勾选状态() then
		功能_合徽章一次()
		
	end
end

function 同步排位赛勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_排位赛")
	local 排位赛勾选 = ui同步(复选框值)
	return 排位赛勾选
end

function 同步排位赛功能()
	if 同步排位赛勾选状态() then
		功能_排位赛()
		
	end
end

function 同步领疲劳勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_领疲劳")
	local 领疲劳勾选 = ui同步(复选框值)
	return 领疲劳勾选
end

function 同步领疲劳功能()
	if 同步领疲劳勾选状态() then
		功能_领取疲劳()
	end
end
function 同步梦幻迷宫勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_梦幻迷宫")
	local 梦幻迷宫勾选 = ui同步(复选框值)
	return 梦幻迷宫勾选
end

function 同步梦幻迷宫功能()
	if 同步梦幻迷宫勾选状态() then
		功能_梦幻迷宫()
		
	end
end

function 同步迷宫奖励勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_迷宫奖励")
	local 迷宫奖励勾选 = ui同步(复选框值)
	return 迷宫奖励勾选
end

function 同步迷宫奖励功能()
	if 同步迷宫奖励勾选状态() then
		功能_迷宫奖励()
	end
end
----------------------------------------修炼
function 同步解锁修练勾选状态()
	local 复选框值 = 读取配置值("多选框_解锁修练")
	local 解锁修练勾选 = ui同步(复选框值)
	return 解锁修练勾选
end

function 同步解锁修练功能()
	
	if 同步解锁修练勾选状态() then
		功能_修炼()
		return true
	end
	return false
end

function 同步塔尔坦勾选状态()
	local 复选框值 = 读取配置值("多选框_塔尔坦")
	local 塔尔坦勾选 = ui同步(复选框值)
	return 塔尔坦勾选
end

function 同步塔尔坦功能()
	
	if 同步塔尔坦勾选状态() then
		功能_塔尔坦()
		return true
	end
	return false
end

function 同步深渊连续通关功能()
	local 复选框值 = ui同步(读取配置值("多选框_深渊连续通关"))
	if 复选框值 then
		
		return true
	end
	return false
end
-----------------------------------限时活动

function 同步爽玩pk勾选状态()
	local 复选框值 = 读取配置值("多选框_爽玩pk")
	local 爽玩pk勾选 = ui同步(复选框值)
	return 爽玩pk勾选
end
-- 获取PK次数输入框的值
function 获取pk次数()
	local pk次数值 = 读取配置值("输入框_pk次数")
	local pk次数 = tonumber(pk次数值) or 1 -- 默认为1次
	return pk次数
end
function 同步爽玩pk功能()
	
	if 同步爽玩pk勾选状态() then
		--功能_爽玩pk()
		功能_排位赛_自定义次数()
		return true
	end
	return false
end
function 同步魔界人勾选状态()
	local 复选框值 = 读取配置值("多选框_魔界人")
	local 魔界人勾选 = ui同步(复选框值)
	return 魔界人勾选
end
function 同步魔界人功能()
	
	if 同步魔界人勾选状态() then
		功能_魔界人_限时活动()
		return true
	end
	return false
end

---------------------------------战令功能
function 同步活动点券买战令勾选状态()
	
	local 复选框值 = 读取配置值("多选框_活动点券买战令")
	local 活动点券买战令勾选 = ui同步(复选框值)
	return 活动点券买战令勾选
end

function 同步活动点券买战令功能()
	if 同步活动点券买战令勾选状态() then
		功能_活动点券买战令()
		return true
	end
	return false
end

function 同步领战令奖励勾选状态()
	
	local 复选框值 = 读取配置值("多选框_领战令奖励")
	local 领战令奖励勾选 = ui同步(复选框值)
	return 领战令奖励勾选
end

function 同步领战令奖励功能()
	if 同步领战令奖励勾选状态() then
		功能_领战令奖励()
		return true
	end
	return false
end
-------------------------------------买8万泰拉

function 同步活动点券买8万泰拉勾选状态()
	
	local 复选框值 = 读取配置值("多选框_活动点券买泰拉")
	local 活动点券8万泰勾选 = ui同步(复选框值)
	return 活动点券8万泰勾选
end

function 同步活动点券8万泰功能()
	if 同步活动点券买8万泰拉勾选状态() then
		功能_活动点券买8万泰拉()
		return true
	end
	return false
end

-------------------------------------小队突袭
function 同步小队突袭勾选状态()
	
	local 复选框值 = 读取配置值("多选框_小队突袭")
	local 小队突袭勾选 = ui同步(复选框值)
	return 小队突袭勾选
end

function 同步小队突袭功能()
	if 同步小队突袭勾选状态() then
		功能_小队突袭()
		return true
	end
	return false
end
-------------------------------------冒险团邮箱
function 同步领取官方邮箱功能()
	
	local 复选框值 = ui同步(读取配置值("多选框_领取官方邮箱"))
	if 复选框值 then
		功能_领取官方邮箱()
		return true
	end
	return false
end

function 同步领取冒险团邮箱勾选状态()
	
	local 复选框值 = 读取配置值("多选框_领取冒险团邮箱")
	
	local 领取冒险团邮箱勾选 = ui同步(复选框值)
	
	return 领取冒险团邮箱勾选
	
end

function 同步领取冒险团邮箱功能()
	
	if 同步领取冒险团邮箱勾选状态() then
		功能_领取冒险团邮箱()
		return true
	end
	if 同步领取官方邮箱功能() then
		return true
	end
	return false
end

function 同步立即使用领取的物品勾选状态()
	
	local 复选框值 = 读取配置值("多选框_立即使用领取的物品")
	
	local 立即使用领取的物品勾选 = ui同步(复选框值)
	
	return 立即使用领取的物品勾选
	
end

function 同步立即使用领取的物品功能()
	
	if 同步立即使用领取的物品勾选状态() then
		
		if 判断_立即使领取的物品() then
			
			return true
			
		end
	end
	
	return false
end

function 同步买角色扩展券功能()
	
	local 复选框值 = 读取配置值("多选框_买角色扩展券")
	
	if ui同步(复选框值) then
		
		if 功能_买角色栏拓展券() then
			
		end
		return true
	end
	
	return false
end
function 同步每日分享勾选状态()
	
	local 复选框值 = 读取配置值("多选框_每日分享")
	
	local 每日分享勾选 = ui同步(复选框值)
	
	return 每日分享勾选
	
end

function 同步每日分享功能()
	
	if 同步每日分享勾选状态() then
		功能_每日分享()
		return true
	end
	
	return false
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++以上角色1执行功能+++++++++++++++++++++++++++++++++++++++++++

--------------------------------------------------------------------------------------------------------------
function 同步全角色购买勾选状态()
	
	local 复选框值 = 读取配置值("多选框_全角色购买")
	local 全角色购买勾选 = ui同步(复选框值)
	return 全角色购买勾选
end

function 同步全角色购买功能()
	
	if 同步全角色购买勾选状态() then
		显示('全角色购买')
		
		return true
	end
	
	return false
end

function 同步印章勾选状态()
	
	local 复选框值 = 读取配置值("多选框_印章")
	local 印章勾选 = ui同步(复选框值)
	return 印章勾选
end

function 同步购买印章功能()
	
	if 同步印章勾选状态() then
		print('已勾选印章')
		判断_印章()
		随机延时(300 , 500)
		return true
	end
	
	return false
end

function 同步金色小晶块_神秘商勾选状态()
	
	local 复选框值 = 读取配置值("多选框_金色小晶块_神秘商店")
	local 金色小晶块_神秘商店勾选 = ui同步(复选框值)
	return 金色小晶块_神秘商店勾选
end

function 同步购买金色小晶块_神秘商店功能()
	if 同步金色小晶块_神秘商勾选状态() then
		
		判断_金色小晶块_神秘商店()
		随机延时(300 , 500)
		return true
	end
	
	return false
end

function 同步刷新神秘商勾选状态()
	
	local 复选框值 = 读取配置值("多选框_刷新神秘商店")
	local 刷新神秘商店勾选 = ui同步(复选框值)
	return 刷新神秘商店勾选
end

function 同步刷新神秘商功能()
	if 同步刷新神秘商勾选状态() then
		print('神秘商店已勾选')
		if 判断_刷新_神秘商商店() then
			return true
		else
			显示('刷新次数用完了')
		end
	end
	return false
end

function 同步深渊碎片勾选状态()
	
	local 复选框值 = 读取配置值("多选框_深渊碎片")
	local 深渊碎片勾选 = ui同步(复选框值)
	return 深渊碎片勾选
end

function 同步购买深渊碎片功能()
	
	if 角色序号 and tonumber(角色序号) and tonumber(角色序号) <= 5 then
		
		if 同步深渊碎片勾选状态() then
			print('已勾深渊碎片')
			判断_深渊碎片()
			随机延时(300 , 500)
			return true
		end
		
	end
	return false
end
function 同步品级调整箱勾选状态()
	
	local 复选框值 = 读取配置值("多选框_品级调整箱")
	local 品级调整箱勾选 = ui同步(复选框值)
	return 品级调整箱勾选
end

function 同步购买品级调整箱功能()
	
	if 同步全角色购买功能() then
		if 同步品级调整箱勾选状态() then
			print('已勾品级调整箱')
			判断_品级调整箱()
			随机延时(300 , 500)
			return true
		end
	elseif 角色序号 and tonumber(角色序号) and tonumber(角色序号) <= 5 then
		if 同步品级调整箱勾选状态() then
			print('已勾品级调整箱')
			判断_品级调整箱()
			随机延时(300 , 500)
			return true
		end
		
	end
	
	return false
	
end
function 同步幸运符碎片勾选状态()
	
	local 复选框值 = 读取配置值("多选框_幸运符碎片")
	local 幸运符碎片勾选 = ui同步(复选框值)
	return 幸运符碎片勾选
end

function 同步购买幸运符碎片功能()
	
	if 同步全角色购买功能() then
		if 同步幸运符碎片勾选状态() then
			print('已勾购买幸运符碎片')
			判断_幸运符碎片()
			随机延时(300 , 500)
			return true
		end
	elseif 角色序号 and tonumber(角色序号) and tonumber(角色序号) <= 5 then
		
		if 同步幸运符碎片勾选状态() then
			print('已勾购买幸运符碎片')
			判断_幸运符碎片()
			随机延时(300 , 500)
			return true
		end
		
	end
	
	return false
end

function 同步变换石勾选状态()
	
	local 复选框值 = 读取配置值("多选框_变换石")
	local 变换石勾选 = ui同步(复选框值)
	return 变换石勾选
end

function 同步购买变换石功能()
	
	if 同步全角色购买功能() then
		if 同步变换石勾选状态() then
			print('已勾购买变换石')
			判断_变换石()
			随机延时(300 , 500)
			return true
		end
	elseif 角色序号 and tonumber(角色序号) and tonumber(角色序号) <= 5 then
		
		if 同步变换石勾选状态() then
			print('已勾购买变换石')
			判断_变换石()
			随机延时(300 , 500)
			return true
		end
	end
	
	return false
end

function 同步征讨门票勾选状态()
	
	local 复选框值 = 读取配置值("多选框_征讨门票")
	local 征讨门票勾选 = ui同步(复选框值)
	return 征讨门票勾选
end

function 同步购买征讨门票功能()
	
	if 同步全角色购买功能() then
		if 同步征讨门票勾选状态() then
			print('已勾选深渊门票')
			判断_征讨门票_神秘商店()
			随机延时(300 , 500)
			return true
		end
	elseif 角色序号 and tonumber(角色序号) and tonumber(角色序号) <= 5 then
		
		if 同步征讨门票勾选状态() then
			print('已勾选深渊门票')
			判断_征讨门票_神秘商店()
			随机延时(300 , 500)
			return true
		end
		
	end
	
	return false
end

function 同步钥匙勾选状态()
	
	local 复选框值 = 读取配置值("多选框_钥匙")
	
	local 钥匙勾选 = ui同步(复选框值)
	return 钥匙勾选
end

function 同步购买钥匙功能()
	
	if 同步钥匙勾选状态() then
		print('已勾购买钥匙')
		判断_钥匙()
		随机延时(300 , 500)
		return true
	end
	return false
end

function 同步速通勾选状态()
	
	local 复选框值 = 读取配置值("多选框_速通")
	local 速通勾选 = ui同步(复选框值)
	return 速通勾选
end

function 同步速通功能()
	if 同步速通勾选状态() then
		print('已勾选速通')
		if 判断_速通_可速通() then
			return true
		end
	end
	print('未勾选速通')
	return false
end
---------------------------------------------------------------------------------------同步自动创建角色------------------------------
function 同步创建最大角色数量()
	
	最大角色数量 = tonumber(读取配置值("输入框_创建角色数量")) or 22
	return 最大角色数量
end

function 同步自动创建角色功能()
	local 复选框值 = 读取配置值("多选框_自动创建角色")
	
	if ui同步(复选框值) then
		print('已勾选自动创建角色')
		功能_自动创建角色()
		return true
	end
	print('未勾选自动创建角色')
	return false
end

创建魔法师 = false
function 同步职业选择功能()
	local 职业 = 读取配置值("下拉框_创建职业") or 0
	if 职业 == 0 then
		按下点击({372 , 558 , 409 , 595}) --女鬼剑
		return true
	else
		if not 创建魔法师 then
			按下点击({771 , 562 , 806 , 589}) --魔法师
			创建魔法师 = true
		else
			按下点击({372 , 558 , 409 , 595}) --女鬼剑
		end
		return true
	end
	
	return false
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(通用功能标签页)+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function 同步灾难副本选择()
	
	local 灾难副本选择值 = 读取配置值("单选框_灾难副本选择")
	local 灾难副本选择 = tonumber(灾难副本选择值) or 0 -- 默认为0（模式1）
	
	-- 根据选择的模式执行对应的函数
	if 灾难副本选择 == 0 then
		
		if 判断_雷龙()then
			return true
		else
			return false
		end
		
	else
		if 判断_土龙()then
			return true
		else
			return false
		end
		
	end
	return false
end
function 同步灾难副本难度选择()
	
	local 灾难副本难度选择值 = 读取配置值("单选框_灾难_难度选择")
	local 灾难副本难度选择 = tonumber(灾难副本难度选择值) or 0
	
	if 灾难副本难度选择 == 0 then
		
		print('选择普通')
		
		按下点击({686 , 646 , 729 , 672})--简单
		随机延时(600 , 700)
		按下点击({686 , 646 , 729 , 672})--简单
		随机延时(300 , 400)
		return true
	else
		print('选择困难')
		
		按下点击({782 , 651 , 812 , 670})--困难
		随机延时(600 , 700)
		按下点击({782 , 651 , 812 , 670})--简单
		随机延时(300 , 400)
		return true
	end
	return false
end

function 同步攻坚勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_攻坚_团本")
	local 攻坚勾选 = ui同步(复选框值)
	return 攻坚勾选
end

function 同步攻坚功能()
	
	if 同步攻坚勾选状态() then
		
		return true
	end
	
	return false
end
-------------------------------------------------------随机通用功能--------------------------------
-- 通用功能同步表
local 通用功能列表 = {
	{id = "多选框_自动设置技能" , 通用功能 = 功能_自动配置技能} ,
	{id = "多选框_一键扫荡" , 通用功能 = 功能_一键扫荡} ,
	{id = "多选框_修理装备" , 通用功能 = 功能_修理装备} ,
	{id = "多选框_出售装备" , 通用功能 = 功能_出售装备} ,
	{id = "多选框_分解装备" , 通用功能 = 功能_分解装备} ,
	{id = "多选框_领取角色邮箱" , 通用功能 = 功能_领取角色邮箱} ,
	{id = "多选框_神秘商店" , 通用功能 = 功能_神秘商店} ,
	{id = "多选框_分解宠物装备" , 通用功能 = 功能_分解宠物装备} ,
	{id = "多选框_分解护石" , 通用功能 = 功能_分解护石} ,
	{id = "多选框_祥瑞溪谷" , 通用功能 = 功能_祥瑞溪谷} ,
	{id = "多选框_黑钻深渊" , 通用功能 = 功能_黑钻深渊} ,
	{id = "多选框_哥布林" , 通用功能 = 功能_哥布林} ,
	{id = "多选框_世界领主" , 通用功能 = 功能_世界领主} ,
	{id = "多选框_商城购买" , 通用功能 = 功能_商城购买} ,
	{id = "多选框_降临罗特斯" , 通用功能 = 功能_降临罗特斯} ,
	{id = "多选框_降临奥兹玛" , 通用功能 = 功能_降临奥兹玛} ,
	{id = "多选框_灾难副本" , 通用功能 = 功能_灾难副本} ,
	{id = "多选框_安图恩" , 通用功能 = 功能_安图恩} ,
}

function 同步通用功能勾选状态()
	math.randomseed(os.time() + os.clock() * 1000)
	local 已完成通用功能列表 = 读取已完成通用功能()
	local 勾选功能列表 = {}
	for _ , item in ipairs(通用功能列表) do
		if ui同步(读取配置值(item.id)) then
			if not 已完成通用功能列表[item.id] then
				if type(item.通用功能) == "function" then
					table.insert(勾选功能列表 , item)
				else
					print("警告: 功能未定义 -" , item.id)
				end
			else
				print("跳过已完成功能:" , item.id)
			end
		end
	end
	
	local n = #勾选功能列表
	for i = n , 2 , - 1 do
		local j = math.random(i)
		勾选功能列表[i] , 勾选功能列表[j] = 勾选功能列表[j] , 勾选功能列表[i]
	end
	
	if #勾选功能列表 > 0 then
		print("--- 开始执行随机排序的通用功能 ---")
		for _ , item in ipairs(勾选功能列表) do
			print("执行功能:" , item.id)
			item.通用功能()保存已完成通用功能(item.id)
		end
		print("--- 通用功能执行完毕 ---")
	end
end
-------------------------------------------------------随机通用功能--------------------------------

-----------------------------------------------------------------------------------------------------------------------------
function 同步每日成就勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_每日成就")
	local 每日成就勾选 = ui同步(复选框值)
	return 每日成就勾选
end

function 同步每日成就功能()
	if 同步每日成就勾选状态() then
		print('所有任务结束领取每日成就')
		功能_领取每日成就()
		return true
	end
	return false
end
function 同步自动设置勾选状态()
	
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	
	local 复选框值 = 读取配置值("多选框_自动设置")
	local 自动设置勾选 = ui同步(复选框值)
	return 自动设置勾选
	
end

-- 添加全局标记变量
local 自动设置已运行 = false

function 同步自动设置功能()
	-- 如果已经运行过，直接返回
	if 自动设置已运行 then
		return false
	end
	
	if 同步自动设置勾选状态() then
		print('自动设置')
		功能_自动设置()
		自动设置已运行 = true -- 标记为已运行
		return true
	end
	return false
end

function 同步每日签到勾选状态()
	
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	
	local 复选框值 = 读取配置值("多选框_每日签到")
	local 每日签到勾选 = ui同步(复选框值)
	return 每日签到勾选
	
end

-- 添加全局标记变量
每日签到已运行 = false

function 同步每日签到功能()
	-- 如果已经运行过，直接返回
	if 每日签到已运行 then
		return false
	end
	
	if 同步每日签到勾选状态() then
		print('每日签到')
		功能_每日签到()
		每日签到已运行 = true -- 标记为已运行
		return true
	end
	return false
end
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(下拉框副本)++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
副本函数表 = {
	["猫卡脱离"] = 副本1_猫卡一图_脱离 ,
	["极速猫卡"] = 副本1_猫卡一图 ,
	["不刷疲劳"] = 副本1_不刷疲劳 ,
	["主线"] = 副本1_主线1至70 ,
	["列车上的海贼"] = 副本1_海贼2图 ,
	["卡勒特.65"] = 副本1_卡勒特司令部 ,
	["阿登高地"] = 副本1_阿登高地勇士 ,
	["黑色大地"] = 副本1_黑色大地 ,
	["深渊:70"] = 副本1_暴走研究所 ,
	["深渊:80"] = 副本1_深渊 ,
	["深渊:组队"] = 副本1_深渊组队 ,
	["普鲁兹"] = 副本1_普鲁兹发电站 ,
	["裂变试验室"] = 副本1_裂变试验室 ,
	["格兰迪发电站"] = 副本1_格兰迪发电站 ,
	["无主之村.金币"] = 副本1_无主之村_冒险 ,
	["闪光密林"] = 副本1_闪光密林 ,
	["苍穹之海"] = 副本1_苍穹之海 ,
	["炽热草原"] = 副本1_炽热草原 ,
	["复苏之灾"] = 副本1_复苏之灾 ,
	
}

function 获取角色副本选项文本()
	local 下拉ID = "下拉框_角色" .. 角色序号 .. "_副本1"
	local 选项索引 = 读取配置值(下拉ID) or 0 -- 索引从0开始
	local 选项文本表 = {"猫卡脱离" , "极速猫卡" , "不刷疲劳" , "主线" , "列车上的海贼" , "卡勒特.65" ,
		"阿登高地" , "黑色大地" , "深渊:70" , "深渊:80" , "深渊:组队" , "普鲁兹" , "裂变试验室" ,
	"格兰迪发电站" , "无主之村.金币" , '闪光密林' , "苍穹之海" , "炽热草原" , "复苏之灾" }
	
	return 选项文本表[选项索引 + 1] -- Lua表下标从1开始
end
副本2函数表 = {
	["猫卡脱离"] = 副本2_猫卡一图_脱离 ,
	["极速猫卡"] = 副本2_猫卡一图 ,
	["不刷疲劳"] = 副本2_不刷疲劳 ,
	["根特.50"] = 副本2_根防御战 ,
	["卡勒特.65"] = 副本2_卡勒特司令部 ,
	["阿登高地"] = 副本2_阿登高地勇士 ,
	["黑色大地"] = 副本2_黑色大地 ,
	["深渊:80"] = 副本2_深渊 ,
	["普鲁兹"] = 副本2_普鲁兹发电站 ,
	["裂变试验室"] = 副本2_裂变试验室 ,
	["格兰迪发电站"] = 副本2_格兰迪发电站 ,
	["闪光密林"] = 副本2_闪光密林 ,
	["苍穹之海"] = 副本2_苍穹之海 ,
	["炽热草原"] = 副本2_炽热草原 ,
	["复苏之灾"] = 副本2_复苏之灾 ,
	["每日任务"] = 副本2_闪光密林 ,
	["搬砖图:自动"] = 副本2_搬砖图自动 ,
	
}

function 获取角色副本2选项文本()
	local 下拉ID = "下拉框_角色" .. 角色序号 .. "_副本2"
	local 选项索引 = 读取配置值(下拉ID) or 2 -- 索引从0开始
	local 选项文本表 = {"猫卡脱离" , "极速猫卡" , "不刷疲劳" , "根特.50" , "卡勒特.65" , "阿登高地" ,
		"黑色大地" , "深渊:80" , "普鲁兹" , "裂变试验室" , "格兰迪发电站" , '闪光密林' , "苍穹之海" , "炽热草原" ,
		"复苏之灾" , "每日任务" , "搬砖图:自动" ,
	}
	return 选项文本表[选项索引 + 1] -- Lua表下标从1开始
end

function 同步副本难度选择功能()
	local 难度ID = "下拉框_角色" .. 角色序号 .. "_难度选择"
	local 难度索引 = 读取配置值(难度ID) or 0
	local 难度文本表 = {"普通" , "冒险" , "王者"}
	--print('当前副本难度:'..难度文本表)
	return 难度文本表[难度索引 + 1]
end

-------------------------------------------------------------------------------------(周常下拉框)

function 是否指定礼拜()
	
	local 当前星期 = tonumber(os.date("%w"))
	-- 检查是否为周三 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	local 礼拜数 = tonumber(读取配置值("下拉框_礼拜几") ) or 3
	print('当前星期'..当前星期.."指定礼拜"..礼拜数)
	if ( 当前星期 == 礼拜数 )then
		显示('今天是礼拜'..当前星期..'指定礼拜'..礼拜数)
		return true
	end
	显示('周常副本:今天是礼拜'..当前星期..'指定礼拜'..礼拜数..'未到运行时间')
	return false
end

周常副本函数表 = {
	["不打"] = 副本2_不刷疲劳 ,
	["主线"] = 副本1_主线1至70 ,
	["周常:索拉"] = 功能_周常索拉 ,
	["周常:自动"] = 功能_周常自动 ,
	["周常+奥兹玛"] = 功能_周常二次加降临奥兹玛 ,
	
}
function 获取周常选项文本()
	
	local 下拉ID = "下拉框_角色" .. 角色序号 .. "_周常"
	local 选项索引 = 读取配置值(下拉ID) or 0 -- 索引从0开始
	local 选项文本表 = {"不打" , "主线" , "周常:索拉" , "周常:自动" , }
	
	return 选项文本表[选项索引 + 1] -- Lua表下标从1开始
end

function 超越是否指定礼拜()
	
	local 当前星期 = tonumber(os.date("%w"))
	
	-- 检查是否为周三 (0=周日, 1=周一, 2=周二, 3=周三, 4=周四, 5=周五, 6=周六)
	
	local 礼拜数 = tonumber(读取配置值("下拉框_超越礼拜几") ) or 3
	print('当前星期'..当前星期.."指定礼拜"..礼拜数)
	if ( 当前星期 == 礼拜数 )then
		显示('今天是礼拜'..当前星期..'指定礼拜'..礼拜数)
		return true
	end
	显示('超越副本:今天是礼拜'..当前星期..'指定礼拜'..礼拜数..'未到运行时间')
	return false
end
function 同步超越难度选择功能()
	local 难度ID = "下拉框_难度选择_超越副本"
	local 难度索引 = 读取配置值(难度ID) or 0
	local 难度文本表 = {"简单" , "困难" , "挑战"}
	
	return 难度文本表[难度索引 + 1]
end

超越副本函数表 = {
	["超进化火山带"] = 功能_超进化火山带 ,
	["超视界藏匿处"] = 功能_超视界藏匿处 ,
	["超负荷发电站"] = 功能_超负荷发电站 ,
	
}
function 获取超越副本选项文本()
	
	local 下拉ID = "下拉框_超越副本"
	local 选项索引 = 读取配置值(下拉ID) or 0 -- 索引从0开始
	local 选项文本表 = {"超进化火山带" , "超视界藏匿处" , "超负荷发电站" , }
	
	return 选项文本表[选项索引 + 1] -- Lua表下标从1开始
end

function 同步执行超越副本()
	
	local 超越副本名 = 获取超越副本选项文本()
	local 超越副本函数 = 超越副本函数表[超越副本名]
	if 超越副本函数 then
		超越副本函数()
	else
		print('超越副本:未选择有效副本')
	end
	
end
function 同步超越副本功能()
	
	local 起始角色 = tonumber(读取配置值("输入框_超越角色序号")) or 1
	local 最后角色 = tonumber(读取配置值("输入框_超越角色序号2")) or 5
	local 复选框值 = ui同步(读取配置值("多选框_超越副本"))
	if 复选框值 then
		local 当前角色序号 = tonumber(角色序号)
		if not 当前角色序号 then
			print("超越副本:当前角色序号无效，跳过执行")
			return false
		end
		-- 兼容用户把起始和结束填反的情况
		if 起始角色 > 最后角色 then
			起始角色 , 最后角色 = 最后角色 , 起始角色
		end
		if 当前角色序号 < 起始角色 or 当前角色序号 > 最后角色 then
			print("超越副本:当前角色" .. 当前角色序号 .. "不在范围" .. 起始角色 .. "至" .. 最后角色 .. "，跳过执行")
			return false
		end
		同步执行超越副本()
		return true
	end
	return false
end
--------------------------------------------------------------------------------------(真机下拉框)lastlinedefined

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(判断打哪些角色)+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
-- 角功能_角色同步表
local 功能_角色列表 = {
	{id = "多选框_角色1" , 角色功能 = 选择角色1 } ,
	{id = "多选框_角色2" , 角色功能 = 选择角色2 } ,
	{id = "多选框_角色3" , 角色功能 = 选择角色3 } ,
	{id = "多选框_角色4" , 角色功能 = 选择角色4 } ,
	{id = "多选框_角色5" , 角色功能 = 选择角色5 } ,
	{id = "多选框_角色6" , 角色功能 = 选择角色6 } ,
	{id = "多选框_角色7" , 角色功能 = 选择角色7 } ,
	{id = "多选框_角色8" , 角色功能 = 选择角色8 } ,
	{id = "多选框_角色9" , 角色功能 = 选择角色9 } ,
	{id = "多选框_角色10" , 角色功能 = 选择角色10} ,
	{id = "多选框_角色11" , 角色功能 = 选择角色11} ,
	{id = "多选框_角色12" , 角色功能 = 选择角色12} ,
	{id = "多选框_角色13" , 角色功能 = 选择角色13} ,
	{id = "多选框_角色14" , 角色功能 = 选择角色14} ,
	{id = "多选框_角色15" , 角色功能 = 选择角色15} ,
	{id = "多选框_角色16" , 角色功能 = 选择角色16} ,
	{id = "多选框_角色17" , 角色功能 = 选择角色17} ,
	{id = "多选框_角色18" , 角色功能 = 选择角色18} ,
	{id = "多选框_角色19" , 角色功能 = 选择角色19} ,
	{id = "多选框_角色20" , 角色功能 = 选择角色20} ,
	{id = "多选框_角色21" , 角色功能 = 选择角色21} ,
	{id = "多选框_角色22" , 角色功能 = 选择角色22} ,
}

function 同步功能_角色勾选状态()
	重置页码() -- 完成任务后回到第1页
	每日签到已运行 = false
	最大可选角色 = false
	已绑定成长活动 = false
	领取并使用升级券 = false
	
	同步自动创建角色功能() --自动创建角色
	for _ , item in ipairs(功能_角色列表) do
		
		if ui同步(读取配置值(item.id)) then
			
			item.角色功能()
		end
	end
	自动设置已运行 = false
	每日签到已运行 = false
	最大可选角色 = false
	已绑定成长活动 = false
	领取并使用升级券 = false
	--当前泰拉数量 = nil
	--任务做完领每日成就
	
end

--调用 同步功能_角色勾选状态()   会判断哪些角色要打哪些角色不打
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++()++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function 选择角色1() 执行角色副本(1) end
function 选择角色2() 执行角色副本(2) end
function 选择角色3() 执行角色副本(3) end
function 选择角色4() 执行角色副本(4) end
function 选择角色5() 执行角色副本(5) end
function 选择角色6() 执行角色副本(6) end
function 选择角色7() 执行角色副本(7) end
function 选择角色8() 执行角色副本(8) end
function 选择角色9() 执行角色副本(9) end
function 选择角色10() 执行角色副本(10) end
function 选择角色11() 执行角色副本(11) end
function 选择角色12() 执行角色副本(12) end
function 选择角色13() 执行角色副本(13) end
function 选择角色14() 执行角色副本(14) end
function 选择角色15() 执行角色副本(15) end
function 选择角色16() 执行角色副本(16) end
function 选择角色17() 执行角色副本(17) end
function 选择角色18() 执行角色副本(18) end
function 选择角色19() 执行角色副本(19) end
function 选择角色20() 执行角色副本(20) end
function 选择角色21() 执行角色副本(21) end
function 选择角色22() 执行角色副本(22) end
function 执行角色副本()
	local 下拉ID = "下拉框_角色" .. 角色序号 .. "_副本1"
	local 原始索引 = 读取配置值(下拉ID)
	local 副本名 = 获取角色副本选项文本(角色序号)
	print("[调试] 角色" .. 角色序号 .. " 下拉ID=" .. 下拉ID .. " 原始索引=" .. tostring(原始索引) .. " 副本名=" .. tostring(副本名))
	local 副本函数 = 副本函数表[副本名]
	
	if 副本函数 then
		print("角色" .. 角色序号 .. "选择副本：" .. 副本名)
		副本函数(角色序号)
	else
		print("角色" .. 角色序号 .. "未选择有效副本")
	end
end
function 执行角色副本2()
	local 副本2名 = 获取角色副本2选项文本(角色序号)
	local 副本2函数 = 副本2函数表[副本2名]
	if 副本2函数 then
		print("角色" .. 角色序号 .. "选择副本2：" .. 副本2名)
		副本2函数(角色序号)
	else
		print("角色" .. 角色序号 .. "未选择有效副本2")
	end
end

function 同步执行周常副本()
	local 周常副本名 = 获取周常选项文本(角色序号)
	local 周常副本函数 = 周常副本函数表[周常副本名]
	if 周常副本函数 then
		print("角色" .. 角色序号 .. "选择职业：" .. 周常副本名)
		周常副本函数(角色序号)
	else
		print("角色" .. 角色序号 .. "未选择有效周常副本")
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(开关燃烧,可交易))+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- 同步指定角色的燃烧疲劳开关

function 同步燃烧疲劳开关状态()
	
	if not 角色序号 or type(角色序号) ~= "number" then
		
		return false
	end
	local 燃烧ID = "多选框_角色" .. 角色序号 .. "_开燃烧"
	print(燃烧ID)
	local 是否开燃烧 = ui同步(读取配置值(燃烧ID))
	print(是否开燃烧)
	if 是否开燃烧 then
		print("执行：开燃烧")
		入口_开燃烧疲劳()
		return true
	else
		print("执行：关燃烧")
		入口_关燃烧疲劳()
		return false
	end
end
function 同步副本2燃烧疲劳开关状态()
	local 是否开燃烧 = 读取配置值("多选框_副本2开燃烧")
	if 是否开燃烧 == nil then
		
		同步燃烧疲劳开关状态()
		return true
	end
	
	if ui同步(是否开燃烧) then
		print("副本2执行：开燃烧")
		入口_开燃烧疲劳()
		return true
	else
		print("副本2执行：关燃烧")
		入口_关燃烧疲劳()
		return false
	end
end

function 同步黄金翻牌()
	
	local 是否黄金翻牌 = ui同步(读取配置值("多选框_黄金翻牌"))
	
	if 是否黄金翻牌 then
		print(是否黄金翻牌)
		print(" 执行：开黄金翻牌")
		
		return true
		
	else
		print("执行：关黄金翻牌")
		
		return false
	end
	
end
function 同步黑钻深渊( )
	
	if not 角色序号 or type(角色序号) ~= "number" then
		
		return false
	end
	local 黑钻深渊ID = "多选框_角色" .. 角色序号 .. "_黑钻深渊"
	local 是否打黑钻深渊 = ui同步(读取配置值(黑钻深渊ID))
	
	if 是否打黑钻深渊 then
		print('执行黑钻深渊')
		功能_黑钻深渊()
		return true
	else
		return false
	end
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++((同步预留疲劳值))+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
local 角色留疲劳表 = {
	{id = "输入框_角色1_留疲劳" , 角色序号 = 1} ,
	{id = "输入框_角色2_留疲劳" , 角色序号 = 2} ,
	{id = "输入框_角色3_留疲劳" , 角色序号 = 3} ,
	{id = "输入框_角色4_留疲劳" , 角色序号 = 4} ,
	{id = "输入框_角色5_留疲劳" , 角色序号 = 5} ,
	{id = "输入框_角色6_留疲劳" , 角色序号 = 6} ,
	{id = "输入框_角色7_留疲劳" , 角色序号 = 7} ,
	{id = "输入框_角色8_留疲劳" , 角色序号 = 8} ,
	{id = "输入框_角色9_留疲劳" , 角色序号 = 9} ,
	{id = "输入框_角色10_留疲劳" , 角色序号 = 10} ,
	{id = "输入框_角色11_留疲劳" , 角色序号 = 11} ,
	{id = "输入框_角色12_留疲劳" , 角色序号 = 12} ,
	{id = "输入框_角色13_留疲劳" , 角色序号 = 13} ,
	{id = "输入框_角色14_留疲劳" , 角色序号 = 14} ,
	{id = "输入框_角色15_留疲劳" , 角色序号 = 15} ,
	{id = "输入框_角色16_留疲劳" , 角色序号 = 16} ,
	{id = "输入框_角色17_留疲劳" , 角色序号 = 17} ,
	{id = "输入框_角色18_留疲劳" , 角色序号 = 18} ,
	{id = "输入框_角色19_留疲劳" , 角色序号 = 19} ,
	{id = "输入框_角色20_留疲劳" , 角色序号 = 20} ,
	{id = "输入框_角色19_留疲劳" , 角色序号 = 21} ,
	{id = "输入框_角色20_留疲劳" , 角色序号 = 22} ,
}

function 同步检查角色疲劳值()
	
	if not 角色序号 or type(角色序号) ~= "number" then
		print("错误：角色序号无效")
		if 功能_获取疲劳值() == 0 then
			return true
		else
			return false
		end
		
	end
	
	local 预留疲劳ID = "输入框_角色" .. 角色序号 .. "_留疲劳"
	local 预留疲劳值 = tonumber(读取配置值(预留疲劳ID)or "0") or 0
	
	local 当前疲劳值 = 功能_获取疲劳值()
	
	显示("预留疲劳值: " .. 预留疲劳值 .. ", 当前疲劳值: " .. 当前疲劳值)
	
	-- 当疲劳值为0或者小于等于预留疲劳值时返回true
	if 当前疲劳值 == 0 or (当前疲劳值 > 0 and 当前疲劳值 <= 预留疲劳值) then
		显示('当前疲劳值:'..当前疲劳值.." 已达到预留值")
		--[===[发送喵提醒_自定义("角色" .. 角色序号 .. " 当前疲劳值:" .. 当前疲劳值 .. " 已到达预留疲劳值")]===]
		return true
	end
	
	return false
end
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++((同步配合三方脚本))++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++((同步一键存仓))+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function 同步一键存仓勾选状态()
	local 复选框值 = 读取配置值("多选框_一键存仓")
	local 一键存仓勾选 = ui同步(复选框值)
	return 一键存仓勾选
end
function 同步一键存仓功能()
	if 同步一键存仓勾选状态() then
		功能_一键存仓()
		
	end
	
end
function 同步存深渊门票勾选状态()
	local 复选框值 = 读取配置值("多选框_存深渊门票")
	local 存深渊门票勾选 = ui同步(复选框值)
	return 存深渊门票勾选
end
function 同步存深渊门票功能()
	if 同步存深渊门票勾选状态() then
		if 判断_深渊门票_存仓() then
			return true
		else
			return false
		end
		
	end
	return false
end

function 同步存史诗武器勾选状态()
	local 复选框值 = 读取配置值("多选框_存史诗武器")
	local 存史诗武器勾选 = ui同步(复选框值)
	return 存史诗武器勾选
end
function 同步存史诗武器功能()
	
	if 同步存史诗武器勾选状态() then
		
		return true
	end
	return false
end

function 同步息屏运行勾选状态()
	local 复选框值 = 读取配置值("多选框_息屏运行")
	local 息屏运行勾选 = ui同步(复选框值)
	return 息屏运行勾选
end
function 同步息屏运行功能()
	if 同步息屏运行勾选状态() then
		print('执行息屏运行')
		setStopCallBack(function(err , exitcode)
			setDisplayPowerOff(false)
		end)
		setDisplayPowerOff(true)
	end
	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++((特殊功能抢卡片))+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- 1. 创建读取勾选状态和输入框值的函数
function 同步抢卡片勾选状态()
	-- 从特殊功能表中获取复选框状态和输入框值
	local 复选框值 = 读取配置值("多选框_抢卡片")
	local 购买次数值 = 读取配置值("inputField2_卡片购买次数")
	
	local 抢卡片勾选 = ui同步(复选框值)
	local 购买次数 = tonumber(购买次数值) or 1 -- 默认为1次
	
	return 抢卡片勾选 , 购买次数
end

-- 2. 创建执行函数
function 同步执行抢卡片功能()
	local 抢卡片勾选 , 购买次数 = 同步抢卡片勾选状态()
	if 抢卡片勾选 then
		显示("执行抢卡片功能，购买次数: " .. 购买次数)
		-- 循环执行指定次数
		for i = 1 , 购买次数 do
			显示("执行第 " .. i .. " 次抢卡片")
			功能_抢卡片()
		end
	else
		显示("抢卡片功能未勾选，跳过执行")
	end
end

-------------------------------------------------------------------((抢材料))
-- 从UI中获取材料最高价格
function 获取材料价格阈值()
	local 价格值 = 读取配置值("输入框_价格")
	local 最高价格 = tonumber(价格值) or 20 -- 默认20
	return 最高价格
end

-- 判断当前价格是否合适
function 判断价格是否合适()
	-- 获取当前商品价格
	local 当前价格 = 特殊功能_获取材料价格()
	local 最高价格 = 获取材料价格阈值()
	
	-- 检查价格类型，确保是数值
	if type(当前价格) ~= "number" then
		显示("警告: 价格类型错误，当前价格类型为 " .. type(当前价格))
		return false -- 价格不是数值，不购买
	end
	
	显示("当前价格: " .. tostring(当前价格) .. ", 设定最高价格: " .. tostring(最高价格))
	return 当前价格 <= 最高价格
end

function 同步抢材料勾选状态()
	local 复选框值 = 读取配置值("多选框_抢材料")
	local 购买次数值 = 读取配置值("输入框_材料购买次数") -- 使用正确的ID
	
	local 抢材料勾选 = ui同步(复选框值)
	local 购买次数 = tonumber(购买次数值) or 1 -- 默认为1次
	
	return 抢材料勾选 , 购买次数
end

function 同步执行抢材料功能()
	local 抢材料勾选 , 购买次数 = 同步抢材料勾选状态()
	if 抢材料勾选 then
		显示("执行抢材料功能，购买次数: " .. 购买次数)
		-- 循环执行指定次数
		for i = 1 , 购买次数 do
			显示("执行第 " .. i .. " 次抢材料")
			功能_抢材料()
		end
	else
		显示("抢材料功能未勾选，跳过执行")
	end
end
--------------------------------------------------------------((抢时装))
function 获取时装价格阈值()
	local 价格值 = 读取配置值("输入框_时装价格")
	local 最高价格 = tonumber(价格值) or 20 -- 默认20
	return 最高价格
end

-- 判断当前价格是否合适
function 判断时装价格是否合适()
	local 当前价格 = 特殊功能_获取商品价格() -- 获取当前商品价格的函数
	local 最高价格 = 获取时装价格阈值()
	
	-- 使用tostring()函数将价格转换为字符串
	显示("当前时装价格: " .. tostring(当前价格) .. ", 设定最高价格: " .. tostring(最高价格))
	
	-- 如果当前价格是布尔值，需要进行处理
	if type(当前价格) == "boolean" then
		--显示("警告: 价格识别函数返回了布尔值而非数值")
		return false -- 价格识别有问题时不购买
	end
	
	return 当前价格 <= 最高价格
end

function 同步抢时装勾选状态()
	local 复选框值 = 读取配置值("多选框_抢时装")
	local 购买次数值 = 读取配置值("输入框_时装购买次数")
	
	local 抢时装勾选 = ui同步(复选框值)
	local 购买次数 = tonumber(购买次数值) or 1 -- 默认为1次
	
	return 抢时装勾选 , 购买次数
end

function 发送喵提醒_运行次数(运行次数)
	
	local 喵提醒码 = 读取配置值("输入框_喵提醒")
	local 提醒内容 = string.format("开始执行拍卖行抢购，执行第%d次抢购" , 运行次数)
	
	local http = require("socket.http")
	local ltn12 = require("ltn12")
	local 响应表 = {}
	
	local function 网址编码(字符串)
		字符串 = string.gsub(字符串 , "([^%w%.%- ])" , function(字符)
			return string.format("%%%02X" , string.byte(字符))
		end)
		return string.gsub(字符串 , " " , "+")
	end
	
	local 响应 , 状态码 , 响应头 = require("socket.http").request{
		url = "http://miaotixing.com/trigger?id=" .. 喵提醒码 .. "&text=" .. 网址编码(提醒内容) ,
		sink = ltn12.sink.table(响应表)
	}
end
function 同步执行抢时装功能()
	local 抢时装勾选 , 购买次数 = 同步抢时装勾选状态()
	if 抢时装勾选 then
		
		-- 循环执行指定次数
		for i = 1 , 购买次数 do
			发送喵提醒_运行次数(i)
			--显示("执行第 " .. i .. " 次抢时装")
			功能_抢时装()
		end
	else
		显示("抢时装功能未勾选，跳过执行")
	end
end

function 发送喵提醒_抢拍(购买次数)
	
	local 喵提醒码 = 读取配置值("输入框_喵提醒")
	local 提醒内容 = string.format("成功抢到第%d个物品" , 购买次数)
	
	local http = require("socket.http")
	local ltn12 = require("ltn12")
	local 响应表 = {}
	
	local function 网址编码(字符串)
		字符串 = string.gsub(字符串 , "([^%w%.%- ])" , function(字符)
			return string.format("%%%02X" , string.byte(字符))
		end)
		return string.gsub(字符串 , " " , "+")
	end
	
	local 响应 , 状态码 , 响应头 = require("socket.http").request{
		url = "http://miaotixing.com/trigger?id=" .. 喵提醒码 .. "&text=" .. 网址编码(提醒内容) ,
		sink = ltn12.sink.table(响应表)
	}
end
--------------------------------------------------------------((挖矿))
function 同步挖矿勾选状态()
	-- 获取多选框和输入框的值
	local 复选框值 = 读取配置值("多选框_挖矿")
	local 挖矿时间值 = 读取配置值("输入框_挖矿时间")
	local 挖矿勾选 = ui同步(复选框值)
	local 挖矿时间 = tonumber(挖矿时间值) or 0.5 -- 默认0.5小时
	return 挖矿勾选 , 挖矿时间
end

function 同步执行挖矿功能()
	local 挖矿勾选 , 挖矿时间 = 同步挖矿勾选状态()
	if 挖矿勾选 then
		功能_挖矿(挖矿时间)
	else
		显示("挖矿功能未勾选，跳过执行")
	end
end
------------------------------------------------------------(钓鱼)
function 同步钓鱼勾选状态()
	-- 获取多选框和输入框的值
	local 复选框值 = 读取配置值("多选框_钓鱼")
	local 钓鱼时间值 = 读取配置值("输入框_钓鱼时间")
	local 钓鱼勾选 = ui同步(复选框值)
	local 钓鱼时间 = tonumber(钓鱼时间值) or 0.5 -- 默认0.5小时
	return 钓鱼勾选 , 钓鱼时间
end

function 同步执行钓鱼功能()
	local 钓鱼勾选 , 钓鱼时间 = 同步钓鱼勾选状态()
	if 钓鱼勾选 then
		工会_钓鱼(钓鱼时间)
	else
		显示("钓鱼功能未勾选，跳过执行")
	end
end
----------------------------------------挂房引流
function 同步挂房引流勾选状态()
	local 复选框值 = 读取配置值("多选框_挂房引流")
	local 挂房引流勾选 = ui同步(复选框值)
	return 挂房引流勾选
end
function 同步执行挂房引流功能()
	if 同步挂房引流勾选状态() then
		功能_挂房引流()
		return true
	end
	return false
end

function 同步自动喊话勾选状态()
	local 复选框值 = 读取配置值("多选框_自动喊话")
	local 自动喊话勾选 = ui同步(复选框值)
	return 自动喊话勾选
end
function 同步执行自动喊话功能()
	if 同步自动喊话勾选状态() then
		功能_自动喊话()
		return true
	end
	return false
end

function 同步接受邀请勾选状态()
	local 复选框值 = 读取配置值("多选框_接受邀请")
	local 接受邀请勾选 = ui同步(复选框值)
	return 接受邀请勾选
end
function 同步执行接受邀请功能()
	
	if 同步接受邀请勾选状态() then
		功能_接受邀请()
		return true
	end
	return false
end

function 同步邀请队友勾选状态()
	local 复选框值 = 读取配置值("多选框_邀请队友")
	local 邀请队友勾选 = ui同步(复选框值)
	return 邀请队友勾选
end
function 同步执行邀请队友功能()
	
	if 同步邀请队友勾选状态() then
		功能_邀请队友()
		return true
	end
	return false
end

-- 特殊功能同步表
local 特殊功能列表 = {
	{id = "多选框_挂房引流" , 特殊功能 = 同步执行挂房引流功能} ,
	{id = "多选框_抢卡片" , 特殊功能 = 同步执行抢卡片功能} ,
	{id = "多选框_抢材料" , 特殊功能 = 同步执行抢材料功能} ,
	{id = "多选框_抢时装" , 特殊功能 = 同步执行抢时装功能} ,
	{id = "多选框_挖矿" , 特殊功能 = 同步执行挖矿功能} ,
	{id = "多选框_钓鱼" , 特殊功能 = 同步执行钓鱼功能} ,
	-- 可以在这里添加更多特殊功能
}

function 同步特殊功能勾选状态()
	
	local 执行了特殊功能 = false
	for _ , item in ipairs(特殊功能列表) do
		if ui同步(读取配置值(item.id)) then
			if type(item.特殊功能) == "function" then
				print("执行特殊功能:" .. item.id)
				item.特殊功能()
				执行了特殊功能 = true
			else
				print("警告: 特殊功能未定义 -" .. item.id)
			end
		end
	end
	return 执行了特殊功能
end

-----------------------------------------------------------自动换区
-- 获取换区追加运行配置
function 同步换区追加运行勾选状态()
	local 追加运行勾选 = ui同步(读取配置值("多选框_换区追加运行"))
	if not 追加运行勾选 then
		print("未勾选换区追加运行")
		return false , nil
	end
	local 追加配置索引 = 读取配置值("下拉框_追加运行配置") or 0
	local 追加配置名称 = (下拉框列表 and 下拉框列表[追加配置索引 + 1]) or ("配置" .. (追加配置索引 + 1))
	print("已勾选换区追加运行，追加配置: " .. 追加配置名称)
	return true , 追加配置名称
end

function 同步自动换区勾选状态()
	local 换区勾选 = 读取配置值("多选框_自动换区")
	local 首次大区索引 = 读取配置值("下拉框_首次运行大区") or 0
	local 首次小区索引 = 读取配置值("下拉框_首次运行小区") or 0
	print('首次换大区索引'..首次大区索引)
	print('首次小区索引'..首次小区索引)
	-- 确定首次运行的大区和小区
	local 首次大区号 , 首次小区号
	if 首次大区索引 == 0 or 首次小区索引 == 0 then
		首次大区号 = nil
		首次小区号 = nil
		if 换区勾选 then
			print("首次运行选择: 默认（按勾选顺序执行）")
		end
	else
		首次大区号 = 首次大区索引
		首次小区号 = 首次小区索引
		if 换区勾选 then
			print("首次运行选择: 大区" .. 首次大区号 .. "小区" .. 首次小区号)
		end
	end
	
	-- 获取每个小区的配置信息
	local 区域配置 = {}
	
	-- 处理5个大区，按实际小区数循环
	local 各大区小区数 = {10 , 10 , 10 , 10 , 9}
	for i = 1 , 5 do
		local 大区勾选 = ui同步(读取配置值("多选框_大区" .. i))
		if 大区勾选 then
			for j = 1 , 各大区小区数[i] do
				local 小区勾选 = ui同步(读取配置值("多选框_大区" .. i .. "_小区" .. j))
				local _raw = 读取配置值("下拉框_大区" .. i .. "_小区" .. j .. "_已保存配置")
				local 配置选择
				if type(_raw) == "number" then
					配置选择 = _raw
				elseif type(_raw) == "string" then
					配置选择 = tonumber(_raw) or 0
				else
					配置选择 = 0
				end
				local 配置名称 = (下拉框列表 and 下拉框列表[配置选择 + 1]) or ("配置" .. (配置选择 + 1))
				
				if 小区勾选 then
					local 区域key = i .. "_" .. j
					区域配置[区域key] = {
						大区号 = i ,
						小区号 = j ,
						配置名称 = 配置名称 ,
						配置索引 = 配置选择
					}
				end
			end
		end
	end
	
	return 换区勾选 , 区域配置 , 首次大区号 , 首次小区号
end

-- 为指定区加载对应的配置
function 加载区域配置(区号 , 配置名称)
	local 用户配置路径 = getSdPath() .. "/用户配置/" .. 配置名称 .. ".json"
	重置配置缓存()
	print("尝试为区" .. 区号 .. "加载配置: " .. 配置名称)
	print("配置文件路径: " .. 用户配置路径)
	
	if fileExist(用户配置路径) then
		local 保存的配置内容 = readFile(用户配置路径)
		if 保存的配置内容 and 保存的配置内容 ~= "" then
			print("成功为区" .. 区号 .. "加载配置: " .. 配置名称)
			
			local 保存的配置 = jsonLib.decode(保存的配置内容) or {}
			print("保存配置中自动创建区=" .. tostring(保存的配置["多选框_自动创建区"]))
			
			-- 从当前界面提取需要保留的字段，然后应用到加载的配置中
			local _当前raw = readFile("/sdcard/uiConfig.json")
			local 当前界面数据 = (_当前raw and jsonLib.decode(_当前raw)) or {}
			print("当前界面自动创建区=" .. tostring(当前界面数据["多选框_自动创建区"]))
			print("当前界面自动创建角色=" .. tostring(当前界面数据["多选框_自动创建角色"]))
			应用保留字段(保存的配置 , 当前界面数据)
			print("应用后自动创建区=" .. tostring(保存的配置["多选框_自动创建区"]))
			print("当前界面自动创建角色=" .. tostring(当前界面数据["多选框_自动创建角色"]))
			-- 写入uiConfig.json使配置生效
			writeFile("/sdcard/uiConfig.json" , jsonLib.encode(保存的配置))
			
			toast("区" .. 区号 .. " 已加载配置: " .. 配置名称 , 0 , 0 , 14)
			return true
		else
			print("区" .. 区号 .. "的配置文件为空: " .. 配置名称)
			toast("警告: 区" .. 区号 .. "的" .. 配置名称 .. "为空" , 0 , 0 , 14)
			return false
		end
	else
		print("区" .. 区号 .. "的配置文件不存在: " .. 配置名称)
		toast("警告: 区" .. 区号 .. "的" .. 配置名称 .. "不存在" , 0 , 0 , 14)
		return false
	end
end

------------------------------------------------------------AI推理方式

function 获取AI推理方式1()
	-- 获取单选框的值 (0表示CPU，1表示GPU)
	
	local 推理方式值 =   读取配置值("单选框_推理方式")
	local 推理方式 = tonumber(推理方式值) or 0 -- 默认为0（CPU）
	
	-- 0=CPU返回false, 1=GPU返回true
	-- 配合YoloV5.detect(截图, true/false)使用
	if 推理方式 == 0 then
		print("AI推理方式: CPU")
		return false -- CPU使用false
	else
		print("AI推理方式: GPU")
		return true -- GPU使用true
		
	end
	
end

function 获取AI推理方式()
	-- 获取单选框的值 (0表示CPU，1表示GPU)
	
	local 推理方式值 =  读取配置值("单选框_推理方式")
	local 推理方式 = tonumber(推理方式值) or 0 -- 默认为0（CPU）
	
	-- 0=CPU返回false, 1=GPU返回true
	if 推理方式 == 0 then
		print("AI推理方式: CPU")
		return false
	else
		print("AI推理方式: GPU")
		return true
	end
end

----------------------------------------------------------------半自动刷图

function 同步半自动刷图勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_半自动")
	local 半自动刷图勾选 = ui同步(复选框值)
	return 半自动刷图勾选
end

function 同步半自动刷图功能()
	
	if 同步半自动刷图勾选状态() then
		
		功能_半自动刷图()
		
	end
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++((设备选择UI配置)++++++++++++++++++++++++++++++++++++++++++++++++++++++

function 获取设备类型()
	-- 获取下拉框的值 (0表示云机，1表示小米8)
	
	local 设备类型值 = 读取配置值("下拉框_选择机型")
	
	local 设备类型 = tonumber(设备类型值) or 0
	
	-- 0=云机, 1=小米8
	if 设备类型 == 0 then
		-- print("当前设备类型: 云机")
		return 0
	elseif 设备类型 == 1 then
		print("当前设备类型: 小米8")
		return 1
	else
		-- 如果是其他值，也默认使用云机
		print("警告: 设备类型值超出范围(" .. 设备类型 .. ")，使用默认: 云机")
		return 0
	end
end

------------------------------------------------------------猫卡移动模式

function 同步猫卡移动模式()
	-- 获取单选框的值 (0表示模式1，1表示模式2)
	
	local 移动模式值 = 读取配置值("单选框_猫卡移动模式")
	local 移动模式 = tonumber(移动模式值) or 0 -- 默认为0（模式1）
	
	-- 根据选择的模式执行对应的函数
	if 移动模式 == 0 then
		
		if 获取设备类型() == 0 then
			
			猫卡移动模式1()
		else
			猫卡移动模式1_小米8()
		end
	else
		if 获取设备类型() == 0 then
			猫卡移动模式2()
			--return 猫卡移动模式2
		else
			猫卡移动模式1_小米8()
			--return 猫卡移动模式1_小米8
		end
		
	end
end

function 同步制作深渊门票功能()
	local 复选框值 = 读取配置值("多选框_制作深渊门票")
	
	if ui同步(复选框值) then
		
		功能_制作深渊门票()
		return true
	end
	return false
end

function 同步深渊门票种类()
	
	local 深渊门票种类值 = 读取配置值("单选框_深渊门票种类")
	local 深渊门票种类 = tonumber(深渊门票种类值) or 0 -- 默认为0（模式1）
	
	if 深渊门票种类 == 0 then
		
		if 判断_账绑深渊票()then
			return true
		else
			return false
		end
		
	else
		if 判断_交易深渊票()then
			return true
		else
			return false
		end
		
	end
	return false
end

-----------------------------------------------------------------------------------

function 同步完成过去任务功能()
	local 复选框值 = 读取配置值("多选框_完成过去任务")
	if ui同步(复选框值) then
		if 判断_完成过去任务() then
			return true
		end
	end
	return false
end

function 同步领冒险奖励功能()
	local 复选框值 = 读取配置值("多选框_冒险奖励")
	if ui同步(复选框值) then
		功能_领冒险奖励()
		return true
	end
	return false
end

function 同步设置消耗品勾选状态()
	
	local 复选框值 = 读取配置值("多选框_设置消耗品")
	local 设置消耗品勾选 = ui同步(复选框值)
	return 设置消耗品勾选
	
end
function 同步设置消耗品功能()
	if 同步设置消耗品勾选状态() then
		print('所有任务结束领取每日成就')
		
		功能_设置消耗品()
		
		return true
		
	end
	return false
end

function 同步学习技能勾选状态()
	
	local 复选框值 = 读取配置值("多选框_学习技能")
	local 学习技能勾选 = ui同步(复选框值)
	return 学习技能勾选
	
end
function 同步学习技能功能()
	if 同步学习技能勾选状态() then
		
		功能_学习技能()
		
		return true
		
	end
	return false
end

function 同步使用经验值宝库功能()
	local 复选框值 = ui同步(读取配置值("多选框_使用经验值宝库"))
	if 复选框值 then
		
		功能_领经验宝库()
		
		return true
		
	end
	return false
end
------------------------------------------------------------开礼袋------------------------------------------------------------
function 同步开矛盾勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_矛盾_自选礼袋")
	local 开矛盾勾选 = ui同步(复选框值)
	return 开矛盾勾选
end

function 同步开矛盾功能()
	
	if 同步开矛盾勾选状态() then
		print('开矛盾已勾选')
		if 	检测_矛盾礼盒() then
			
			return true
		end
	else
		
		print('开矛盾未勾选.........')
	end
	
	return false
end

function 同步开暴走票勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_暴走票_自选礼袋")
	local 开暴走票勾选 = ui同步(复选框值)
	return 开暴走票勾选
end

function 同步开暴走票功能()
	if 同步开暴走票勾选状态() then
		print('开暴走票已勾选')
		if 检测_暴走研究所礼盒() then
			
			return true
		end
	end
	return false
end

function 同步开印章勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_印章_自选礼袋")
	local 开印章票勾选 = ui同步(复选框值)
	return 开印章票勾选
end

function 同步开印章功能()
	
	if 同步开印章勾选状态() then
		print('开印章已勾选')
		if 检测_印章礼盒() then
			
			return true
		end
	end
	return false
end

function 同步开炉岩碳勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_炉岩碳_自选礼袋")
	local 开炉岩碳勾选 = ui同步(复选框值)
	return 开炉岩碳勾选
end

function 同步开炉岩碳功能()
	if 同步开炉岩碳勾选状态() then
		print('开炉岩碳已勾选')
		if 检测_炉岩碳礼盒() then
			
			return true
		end
	end
	return false
end
function 同步开变换石勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_变换石_自选礼袋")
	local 开变换石勾选 = ui同步(复选框值)
	return 开变换石勾选
end

function 同步开变换石功能()
	
	if 同步开变换石勾选状态() then
		print('开变换石已勾选')
		if 检测_奇迹变石礼盒() then
			
			return true
		end
		
	end
	return false
end

function 同步开超武勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_超武_自选礼袋")
	local 开超武勾选 = ui同步(复选框值)
	return 开超武勾选
end

function 同步开超武功能()
	
	if 同步开超武勾选状态() then
		print('开超武石已勾选')
		if 检测_超武礼盒() then
			
			return true
		end
		
	end
	return false
end

function 同步开自选礼袋勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_开自选礼袋")
	local 开自选礼袋勾选 = ui同步(复选框值)
	return 开自选礼袋勾选
end

function 同步开自选礼袋功能()
	
	if 同步开自选礼袋勾选状态() then
		print('开自选礼袋已勾选')
		if 功能_开自选礼袋() then
			return true
		end
	end
	return false
end

--------------------------------------------------------------上架拍卖行种类---------------------------------------------------------------------

function 同步上架矛盾勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_矛盾_上架")
	local 上架矛盾勾选 = ui同步(复选框值)
	return 上架矛盾勾选
end

function 同步上架矛盾功能()
	
	if 同步上架矛盾勾选状态() then
		print('上架矛盾已勾选')
		if 判断_矛盾_拍卖行() then
			
			return true
		end
		
	end
	return false
end

--

function 同步上架暴走票勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_暴走票_上架")
	local 上架暴走票勾选 = ui同步(复选框值)
	return 上架暴走票勾选
end

function 同步上架暴走票功能()
	
	if 同步上架暴走票勾选状态() then
		print('上架暴走票已勾选')
		if 判断_暴走研究门票_拍卖行() then
			
			return true
		end
		
	end
	return false
end

--
function 同步上架印章勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_印章_上架")
	local 上架印章勾选 = ui同步(复选框值)
	return 上架印章勾选
end

function 同步上架印章功能()
	
	if 同步上架印章勾选状态() then
		print('上架印章票已勾选')
		if 判断_印章_拍卖行() then
			
			return true
		end
		
	end
	return false
end

--
function 同步上架炉岩碳勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_炉岩碳_上架")
	local 上架炉岩碳勾选 = ui同步(复选框值)
	return 上架炉岩碳勾选
end

function 同步上架炉岩碳功能()
	if 同步上架炉岩碳勾选状态() then
		print('上架炉岩碳已勾选')
		if 判断_炉岩碳_拍卖行() then
			return true
		end
	end
	return false
end

--
function 同步上架混沌之息勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_混沌之息_上架")
	local 上架混沌之息勾选 = ui同步(复选框值)
	return 上架混沌之息勾选
end

function 同步上架混沌之息功能()
	if 同步上架混沌之息勾选状态() then
		print('上架混沌之息已勾选')
		if 判断_混沌之息_拍卖行() then
			return true
		end
	end
	return false
end
--
function 同步上架变换石勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_变换石_上架")
	local 上架变换石勾选 = ui同步(复选框值)
	return 上架变换石勾选
end

function 同步上架变换石功能()
	if 同步上架变换石勾选状态() then
		print('上架变换石已勾选')
		if 判断_变换石_拍卖行() then
			return true
		end
	end
	return false
end
--
function 同步上架金色小晶块勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_金色小晶块_上架")
	local 上架金色小块勾选 = ui同步(复选框值)
	return 上架金色小块勾选
end

function 判断_同步上架金色小晶块功能()
	if 同步上架金色小晶块勾选状态() then
		print('上架金色小晶块已勾选')
		
		return true
		
	end
	return false
end
function 同步上架金色小晶块功能()
	if 同步上架金色小晶块勾选状态() then
		print('上架金色小晶块已勾选')
		if 判断_金色小晶块_拍卖行() then
			
			return true
		end
	end
	return false
end

function 同步上架超武礼盒勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_超武礼盒_上架")
	local 上架超武礼盒勾选 = ui同步(复选框值)
	return 上架超武礼盒勾选
end

function 同步上架超武礼盒功能()
	if 同步上架超武礼盒勾选状态() then
		print('上架超武礼盒已勾选')
		if 判断_超武礼盒_拍卖行() then
			
			return true
		else
			显示('未找到超武盒子')
			return false
		end
	end
	
	return false
end

function 同步上架失调次元票勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_失调次元票_上架")
	local 失调次元票勾选 = ui同步(复选框值)
	return 失调次元票勾选
end

function 同步上架失调次元票功能()
	if 同步上架失调次元票勾选状态() then
		
		if 判断_失调次元票_拍卖行() then
			
			return true
		end
	end
	return false
end

function 同步自动上架拍卖行勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_自动上架拍卖行")
	local 自动上架拍卖行勾选 = ui同步(复选框值)
	return 自动上架拍卖行勾选
end

function 同步自动上架拍卖行功能()
	
	if 同步自动上架拍卖行勾选状态() then
		print('自动上架拍卖行已勾选')
		if 功能_自动上架拍卖行() then
			
		end
		
	end
end

function 同步重新上架勾选状态()
	
	local 复选框值 = 读取配置值("多选框_重新上架")
	local 重新上架勾选 = ui同步(复选框值)
	return 重新上架勾选
end

function 同步重新上架功能()
	
	if 同步重新上架勾选状态() then
		if 判断_重新上架_拍卖行() then
			随机延时(600 , 800)
			return true
		end
	end
	return false
end

-----------------------------------------------------------------同步商城购买种类----------------------------------

function 同步购买复活币勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_购买复活币")
	local 自动购买复活币勾选 = ui同步(复选框值)
	return 自动购买复活币勾选
end

function 同步购买复活币功能()
	
	if 同步购买复活币勾选状态() then
		print('购买复活币勾选')
		if 功能_购买复活币() then
			
		end
		
	end
end

function 同步购买无色勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_购买无色")
	local 自动购买无色勾选 = ui同步(复选框值)
	return 自动购买无色勾选
end

function 同步购买无色功能()
	
	if 同步购买无色勾选状态() then
		
		if 功能_购买无色() then
			
		end
		
	end
end

function 同步购买特别关注勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_购买特别关注")
	local 购买特别关注勾选 = ui同步(复选框值)
	return 购买特别关注勾选
end

function 同步购买特别关注功能()
	
	if 同步购买特别关注勾选状态() then
		
		if 功能_购买特别关注() then
			
		end
		
	end
end
function 同步购买血药勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_购买血药")
	local 购买血药勾选 = ui同步(复选框值)
	return 购买血药勾选
end

function 同步购买血药功能()
	
	if 同步购买血药勾选状态() then
		
		if 功能_购买血药() then
			
		end
		
	end
end

function 同步跳过无疲劳角色勾选状态()
	-- 从通用功能表中获取复选框状态，然后使用ui同步函数检查是否为true
	local 复选框值 = 读取配置值("多选框_跳过无疲劳角色")
	
	local 跳过无疲劳角色勾选 = ui同步(复选框值)
	
	return 跳过无疲劳角色勾选
	
end

function 同步跳过无疲劳角色功能()
	
	if 同步跳过无疲劳角色勾选状态() then
		return true
	end
	return false
end

function 同步两小时重启游戏勾选状态()
	
	local 复选框值 = 读取配置值("多选框_两小时重启游戏")
	
	local 两小时重启游戏勾选 = ui同步(复选框值)
	
	return 两小时重启游戏勾选
	
end

function 同步两小时重启游戏功能()
	
	if 同步两小时重启游戏勾选状态() then
		
		return true
	end
	
	return false
end

function 同步关闭yolo战斗勾选状态()
	
	local 复选框值 = 读取配置值("多选框_关闭yolo战斗")
	
	local 关闭yolo战斗勾选 = ui同步(复选框值)
	
	return 关闭yolo战斗勾选
	
end

function 同步关闭yolo战斗功能()
	
	if 同步关闭yolo战斗勾选状态() then
		显示('已关youlo战斗')
		return true
	end
	
	return false
end

function 同步开启触摸移动勾选状态()
	
	local 复选框值 = 读取配置值("多选框_开启移动触摸")
	
	local 开启触摸移动勾选 = ui同步(复选框值)
	
	return 开启触摸移动勾选
	
end

function 同步开启触摸移动功能()
	
	if 同步开启触摸移动勾选状态() then
		显示('已开启触摸移动')
		return true
	end
	
	return false
end

function 同步自动创建区勾选状态()
	
	local 复选框值 =  ui同步(读取配置值("多选框_自动创建区")) 
	
	local 自动创建区勾选 = ui同步(复选框值)
	
	return 自动创建区勾选
	
end

function 同步自动创建区功能()
	
	if 同步自动创建区勾选状态() then
		
		return true
	end
	
	return false
end

function 同步绑定成长活动功能()
                
	local 复选框值 =  ui同步(读取配置值("多选框_绑定成长活动"))
	if not 复选框值 then
		return false
	end
	local 输入框值 = 读取配置值("输入框_成长活动角色序号")
	local 目标角色序号 = tonumber(输入框值) or 2
	
	if 角色序号 and tonumber(角色序号) == 目标角色序号 then
		功能_绑定活动角色()
		return true
	else
		显示('当前角色'..角色序号..'和绑定角色'..目标角色序号..'不匹配不执行' )
	end
	return false
end

function 同步时间胶囊功能()
	
	local 复选框值 = ui同步(读取配置值("多选框_时间胶囊"))
	local 输入框值 = 读取配置值("输入框_时间胶囊角色序号")
	local 目标角色序号 = tonumber(输入框值) or 4
	
	if not 复选框值 then
		return false
	end
	
	if 角色序号 and tonumber(角色序号) == 目标角色序号 then
		
		if not 判断_黄金胶囊入口() then
			
			return false
		end
		功能_时间胶囊()
		return true
	else
		显示('当前角色'..角色序号..'和绑定角色'..目标角色序号..'时间胶囊不匹配不执行' )
	end
	return false
	
end

function 同步搬猫卡55级勾选状态()
	
	local 复选框值 = 读取配置值("多选框_55级搬猫卡")
	
	local 搬猫卡55级勾选 = ui同步(复选框值)
	
	return 搬猫卡55级勾选
	
end

function 同步搬猫卡55级功能()
	
	if 同步搬猫卡55级勾选状态() then
		return true
	end
	return false
end
function 同步搬猫卡65级勾选状态()
	local 复选框值 = 读取配置值("多选框_65级搬猫卡")
	local 搬猫卡65级勾选 = ui同步(复选框值)
	return 搬猫卡65级勾选
end
function 同步搬猫卡65级功能()
	if 同步搬猫卡65级勾选状态() then
		return true
	end
	return false
end

function 同步搬猫卡55级功能()
	
	if 同步搬猫卡55级勾选状态() then
		return true
	end
	return false
end

function 同步一键升至70级勾选状态()
	local 复选框值 = 读取配置值("多选框_一键升至70级")
	local 一键升至70级勾选 = ui同步(复选框值)
	return 一键升至70级勾选
end
function 同步一键升至70级功能()
	
	if 同步一键升至70级勾选状态() then
		副本1_主线1至70()
		return true
	end
	return false
end

function 同步绑定回归活动勾选状态()
	local 复选框值 = 读取配置值("多选框_绑定回归活动")
	local 绑定回归活动勾选 = ui同步(复选框值)
	return 绑定回归活动勾选
end
local 已绑定成长活动 = false

function 同步绑定回归活动功能()
	
	--[===[if 已绑定成长活动 then
	
	return false
	end
	
	if 同步绑定回归活动勾选状态() then
	
	if 功能_绑定回归勇士活动() then
	
	end
	已绑定成长活动 = true
	return true
	end
	
	return false]===]
end

function 同步领取并使用升级券勾选状态()
	local 复选框值 = 读取配置值("多选框_领取并使用升级券")
	local 领取并使用升级券勾选 = ui同步(复选框值)
	return 领取并使用升级券勾选
end

function 获取领取并使用升级券角色序号()
	-- 从输入框获取目标角色序号
	local 输入框值 = 读取配置值("输入框_回归奖升级券角色序号")
	local 目标角色序号 = tonumber(输入框值) or 0
	return 目标角色序号
end

领取并使用升级券 = false

function 同步领取并使用升级券功能()
	
	-- 检查是否勾选了绑定回归活动
	if not 同步领取并使用升级券勾选状态() or 领取并使用升级券 then
		
		return false
	else
		print(同步领取并使用升级券勾选状态())
		
	end
	
	-- 获取输入框中的目标角色序号
	local 目标角色序号 = 获取领取并使用升级券角色序号()
	print('目标角色序号'..目标角色序号)
	-- 检查角色序号是否匹配
	if 角色序号 and tonumber(角色序号) == 目标角色序号 then
		print("角色" .. 角色序号 .. "领取并使用升级券")
		if 功能_领取并使用升级券() then
			领取并使用升级券 = true
			return true
		else
			return false
		end
	else
		print("跳过角色" .. (角色序号 or "未知") .. "，目标角色是" .. 目标角色序号)
		return false
	end
end

--------------勇士特训
function 同步勇士特训勾选状态()
	local 复选框值 = 读取配置值("多选框_勇士特训")
	local 勇士特训勾选 = ui同步(复选框值)
	return 勇士特训勾选
end
function 获取勇士特训角色序号()
	-- 从输入框获取目标角色序号
	local 输入框值 = 读取配置值("输入框_勇士特训角色序号")
	local 目标角色序号 = tonumber(输入框值) or 0
	return 目标角色序号
end

function 同步勇士特训功能()
	-- 检查是否勾选了绑定回归活动
	if not 同步勇士特训勾选状态() then
		
		return false
	end
	
	-- 获取输入框中的目标角色序号
	local 目标角色序号 = 获取勇士特训角色序号()
	
	-- 检查角色序号是否匹配
	if 角色序号 and tonumber(角色序号) == 目标角色序号 then
		print("角色" .. 角色序号 .. "领取勇士特训")
		功能_勇士特训()
		自动穿装备 = 0
		return true
	else
		print("跳过角色" .. (角色序号 or "未知") .. "，目标角色是" .. 目标角色序号)
		return false
	end
end

function 同步自动穿装备勾选状态()
	local 复选框值 = 读取配置值("多选框_自动穿装备")
	local 自动穿装备勾选 = ui同步(复选框值)
	return 自动穿装备勾选
end

自动穿装备 = 0

function 同步自动穿装备功能()
	
	if os.time() - 自动穿装备 > 120 then
		if 同步自动穿装备勾选状态() then
			按下点击({696 , 666 , 778 , 690}) --自动装备
			随机延时(500 , 600)
			自动穿装备 = os.time()
			return true
		else
			显示('穿装备时间过短')
			return false
		end
	end
	
	return false
end

function 同步一键升星功能()
	local 复选框值 = 读取配置值("多选框_一键升星")
	if ui同步(复选框值) then
		
		return true
	end
	return false
end

function 同步自动史诗套功能()
	local 复选框值 = 读取配置值("多选框_自动穿史诗套")
	if ui同步(复选框值) then
		功能_穿史诗装备()
		return true
	end
	return false
end

-------------------------------------------------2.8万泰拉成就
function 同步泰拉成就勾选状态()
	
	local 复选框值 = 读取配置值("多选框_泰拉成就")
	local 泰拉成就勾选 = ui同步(复选框值)
	return 泰拉成就勾选
end

function 同步泰拉成就功能()
	if 同步泰拉成就勾选状态() then
		功能_泰拉成就()
		return true
	end
	return false
end

------------------------------------------------继续上次进度开关
function 同步继续上次进度运行勾选状态()
	
	local 复选框值 = 读取配置值("多选框_继续上次运行")
	local 继续上次进度运行勾选 = ui同步(复选框值)
	return 继续上次进度运行勾选
end

function 同步继续上次进度运行功能()
	if 同步继续上次进度运行勾选状态() then
		
		return true
	end
	return false
end
function 同步六点初始化进度勾选状态()
	
	local 复选框值 = 读取配置值("多选框_六点初始化进度")
	local 六点初始化进度勾选 = ui同步(复选框值)
	return 六点初始化进度勾选
end

function 同步六点初始化进度运行功能()
	if 同步六点初始化进度勾选状态() then
		
		return true
	end
	return false
end
--------------------------------------------------强制清空疲劳
function 同步强制清空疲劳勾选状态()
	
	local 复选框值 = 读取配置值("多选框_强制清空疲劳")
	local 强制清空疲劳勾选 = ui同步(复选框值)
	return 强制清空疲劳勾选
end

function 同步强制清空疲劳功能()
	if 同步强制清空疲劳勾选状态() then
		功能_检测是否剩余疲劳疲劳(角色功能 , 角色序号)
		return true
	end
	return false
end

---------------------------------------------------重启云机
local 上次重启时间 = os.time()
local 重启日志文件 = "/sdcard/wk_last_shuwanchongqiDS_date.txt"
local 重启状态文件 = "/sdcard/wk_restart_statuscqzt.txt"
local 正在定时启动 = false

function 读取重启状态()
	local 文件 = io.open(重启状态文件 , "r")
	if not 文件 then return false end
	local 状态 = 文件:read("*l")
	文件:close()
	return 状态 == "true"
end

function 保存重启状态(状态)
	local 文件 = io.open(重启状态文件 , "w")
	if 文件 then
		文件:write(tostring(状态))
		文件:close()
	end
end

function 读取上次重启日期()
	local 文件 = io.open(重启日志文件 , "r")
	if not 文件 then return nil end
	local 日期 = 文件:read("*l")
	文件:close()
	return 日期
end

function 保存重启日期(日期)
	local 文件 = io.open(重启日志文件 , "w")
	if 文件 then
		文件:write(日期)
		文件:close()
	end
end

function 同步重启云机勾选状态()
	
	local 复选框值 = 读取配置值("多选框_重启云机")
	local 重启云机勾选 = ui同步(复选框值)
	return 重启云机勾选
end

function 同步重启云机功能()
	if 同步重启云机勾选状态() then
		--print('已勾选重启云机')
		return true
	end
	return false
end

function 重启云机()
	保存重启状态(true)
	local 陌速云 = os.execute("am restart")
	local 川川云 = os.execute("reboot")
	
	if 陌速云 == 0 then
		print("莫速云设备重启命令已发送")
		上次重启时间 = os.time()
		return true
	elseif 川川云 == 0 then
		print("川川云设备重启命令已发送")
		上次重启时间 = os.time()
		return true
	else
		print("设备重启失败")
		return false
	end
end

function 执行重启云机_时间()
	
	if 正在定时启动 then
		return false
	end
	print("+++检测重启时间++++")
	
	if not 同步重启云机功能() then
		return false
	end
	local 当前时间 = os.time()
	
	local 重启云机模式 = 读取配置值("下拉框_重启云机模式")
	local 重启间隔秒数
	
	if 重启云机模式 == 1 then
		
		重启间隔秒数 = 2 * 60 * 60
		print('2小时重启一次')
		
	elseif 重启云机模式 == 2 then
		
		重启间隔秒数 = 4 * 60 * 60
		
		print('4小时重启一次')
	elseif 重启云机模式 == 3 then
		
		重启间隔秒数 = 6 * 60 * 60
		print('6小时重启一次')
	elseif 重启云机模式 == 4 then
		
		重启间隔秒数 = 12 * 60 * 60
		print('12小时重启一次')
	elseif 重启云机模式 == 5 then
		
		重启间隔秒数 = 24 * 60 * 60
		print('24小时重启一次')
	else
		return false
	end
	
	if 当前时间 - 上次重启时间 < 重启间隔秒数 then
		print('还未到重启云机时间')
		return false
	end
	重启云机()
end

function 执行重启云机_刷完()
	
	if not 同步重启云机功能() then
		return false
	end
	local 重启云机模式 = 读取配置值("下拉框_重启云机模式")
	
	if 重启云机模式 == 0 then
		local 今天 = os.date("%Y-%m-%d")
		local 上次重启日期 = 读取上次重启日期()
		
		if 上次重启日期 == 今天 then
			print("今天已经重启过了，跳过重启")
			return false
		end
		print('刷完重启')
		
		保存重启日期(今天)
		重启云机()
		return true
	else
		return false
	end
	
end
-----------------------------------------------------------除主线外其它任务

function 同步所有任务勾选状态()
	
	local 复选框值 = 读取配置值("多选框_做所有任务")
	local 所有任务勾选 = ui同步(复选框值)
	return 所有任务勾选
end

function 同步所有任务功能()
	if 同步所有任务勾选状态() then
		做外传名望()
		return true
	end
	return false
end

function 同步临时活动勾选状态()
	
	local 复选框值 = 读取配置值("多选框_临时活动")
	local 临时活动勾选 = ui同步(复选框值)
	return 临时活动勾选
end

function 同步临时活动功能()
	if 同步临时活动勾选状态() then
		
		return true
	end
	return false
end
--------------------------------------------------------

function 同步角色运行超时关闭游戏功能()
	
	local 复选框值 = ui同步(读取配置值("多选框_运行超时重启"))
	if 复选框值 then
		显示('角色运行超时,重启游戏')
		关闭(地下城)
		随机延时(1000 , 1500)
		打开(地下城)
		return true
	end
	return false
end

角色超时已提醒 = {}
function 同步角色运行时间()
	if 正在定时启动 then
		return false
	end
	print("+++检测角色运行时间++++")
	if not 角色时间记录 or not 角色序号 then return end
	local v = 角色时间记录[角色序号]
	if not v or not v.开始 or v.结束 then return end
	local 获取ui角色运行时间 = tonumber(读取配置值("下拉框__角色运行时间"))
	local 限制表 = {[0] = 40 , [1] = 60 , [2] = 80 , [3] = 120 , [4] = 240}
	local 限制分钟 = 限制表[获取ui角色运行时间]
	if not 限制分钟 then return end
	
	local 上次提醒 = 角色超时已提醒[角色序号]
	if 上次提醒 and os.time() - 上次提醒 < 限制分钟 * 60 then return end
	
	local 已运行秒 = os.time() - v.开始
	if 已运行秒 >= 限制分钟 * 60 then
		发送喵提醒_自定义('角色' .. 角色序号 .. '运行超过' .. 限制分钟 .. '分钟')
		同步角色运行超时关闭游戏功能()
		角色超时已提醒[角色序号] = os.time()
		
	end
end
