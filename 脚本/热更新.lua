 
是否强制更新 = false
版本号 = getScriptVersion()
--版本号 = 123
-- 强制更新-mxr-124
UI名称 = "猫仙人".."(版本v."..版本号..")"
资源文件名 = '猫仙人.rc'

--[===[function 蓝奏云优享版云更()
local 当前应用包名 = getPackageName()
print(当前应用包名)
if 当前应用包名 == "com.mxrxinbanben.cn" then
脚本识别名 = "mxr"
elseif 当前应用包名 == "com.wkxbanben.cn" then
脚本识别名 = "wk"
else
脚本识别名 = "不需要更新"
end
local ret
toast("加载资源中...")
local path = "/storage/emulated/0/"..脚本识别名..".lrj" -------------------猫仙人
local urls = {
--"https://www.ilanzou.com/s/czr6xOWo" , --2453
"https://www.ilanzou.com/s/JtH6xGpq" , --5598
"https://www.ilanzou.com/s/xzh6xGTK"--8954
}
math.randomseed(os.time())
-- 随机打乱顺序
for i = #urls , 2 , - 1 do
local j = math.random(i)
urls[i] , urls[j] = urls[j] , urls[i]
end
local info
for _ , url in ipairs(urls) do
info = lanzou.lanzou_parse_structured(url)
if info and type(info) == "table" and #info > 0 then break end
info = nil
end
-- 检测蓝奏云链接是否失效
if not info then
toast("所有蓝奏云链接失效，跳过更新...")
print("所有蓝奏云链接失效，跳过更新...")
return false
end

print(info) toast("加载资源中...")
for i = 1 , #info do
toast("加载资源中...")
ret = splitStr(info[i].fileName , "-")
if ret[2] == 脚本识别名 then --这里填脚本的辨别名
toast("加载资源中...")
if 版本号 < math.tointeger(ret[3]) then
toast("加载资源中...")
if ret[1] == "强制更新" or 是否强制更新 then
toast("正在下载更新资源请勿退出...")
print("正在下载更新资源请勿退出...")
if downloadFile(info[i].directUrl , path) == 0 then
toast("加载资源中...")
print('资源加载中...')
installLrPkg(path)
toast("更新完成")
print('更新完成')
delfile(path)
是否强制更新 = true
return true -- 更新成功
else
toast("更新失败..使用备用更新...")
print('更新失败..使用备用更新...')
delfile(path)
是否强制更新 = true
return false -- 更新失败
end
else
toast("有新版本可更新")
print('有新版本可用')

是否强制更新 = true
return true -- 有新版本但不强制更新，视为正常
end
else
toast("当前为最新版本")
print('当前为最新版本')

是否强制更新 = true
return true -- 已是最新版本，视为正常
end
end
end
是否强制更新 = true
return true -- 没有找到匹配的更新文件，视为正常
end]===]

--[===[function 酷烧云下载模型文件()
local https = require("ssl.https")
local work = getWorkPath() .. "/yolo"
if not lfs.attributes(work) then
mkdir(work)
end
local savepath = work .. "/YOLOV11.zip"
local extractdir = work
local _, _, headers = https.request{
url = "https://fastlink.cokey.xyz/f/d/dn8Nhg/YOLOV11.zip",
redirect = false
}
local realUrl = headers and headers.location
if not realUrl then return false end

local _, _, h2 = https.request{ url = realUrl, method = "HEAD" }
local total = h2 and tonumber(h2["content-length"]) or 0

local f = io.open(savepath, "wb")
if not f then return false end
local received = 0
local lastPercent = -1
local ok = https.request{
url = realUrl,
sink = function(chunk)
if chunk then
f:write(chunk)
received = received + #chunk
if total > 0 then
local pct = math.floor(received / total * 100)
if pct ~= lastPercent then
lastPercent = pct
toast("下载进度:" .. pct .. "%", 0, 0, 30)
end
end
end
return true
end
}
f:close()
if not ok then return false end
toast("解压中...", 0, 0, 30)
local ok = unZip(savepath, extractdir)
if not ok then return false end
toast("完成", 0, 0, 30)
return true
end]===]

