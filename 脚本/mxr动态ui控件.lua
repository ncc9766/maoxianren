--[[UI封装函数库]]--

function ui.创建一个新布局(布局名称 , 宽 , 高)
	--[===[方法名称:ui.newLayout 创建一个新的布局
	语法:ui.newLayout(name , [w] , [h])
	name：字符串型 , 要新建的布局名称，即标题
	w：宽( - 1表示填满. - 2是自适应)(默认值: 自适应大小) , 可省略
	h：高( - 1表示填满. - 2是自适应)(默认值: 自适应大小) , 可省略
	返回值:布尔类型]===]
	if 高 then
		return ui.newLayout(布局名称 , 宽 , 高)
	else
		return ui.newLayout(布局名称 , 宽)
	end
end

function ui.关闭一个布局(布局名称)
	--[===[方法名称:ui.dismiss 关闭一个布局
	语法:ui.dismiss(name)
	name：字符串类型 , 要显示的布局名称
	返回值:布尔类型]===]
	return ui.dismiss(布局名称)
end

function ui.布局换行排列(布局名称 , 行ID , 宽 , 高)
	--[===[方法名称:ui.newRow 布局换行排列
	语法:ui.newRow(layout , rowid , [w] , [h])
	layout：布局名称
	rowid:换行布局名称
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.newRow(布局名称 , 行ID , 宽 , 高)
	elseif 宽 then
		return ui.newRow(布局名称 , 行ID , 宽)
	else
		return ui.newRow(布局名称 , 行ID)
	end
end

function ui.创建一个按钮(布局名称 , 按钮名称 , 文本内容 , 宽 , 高 , 文字大小 , 文字颜色)
	--[===[方法名称:ui.addButton 创建一个按钮
	语法:ui.addButton(layout , name , text , [w] , [h] , [文字大小] , [文字颜色])
	layout：布局名称
	name: 按钮名称
	text: 按钮显示内容
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，创建后自动设置文字大小
	文字颜色: 字符串类型，可选，格式如"#ffff00ff"，创建后自动设置文字颜色
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.addButton(布局名称 , 按钮名称 , 文本内容 , 宽 , 高)
	elseif 宽 then
		result = ui.addButton(布局名称 , 按钮名称 , 文本内容 , 宽)
	else
		result = ui.addButton(布局名称 , 按钮名称 , 文本内容)
	end
	if result then
		if 文字大小 then
			ui.setTextSize(按钮名称 , 文字大小)
		end
		if 文字颜色 then
			ui.setTextColor(按钮名称 , 文字颜色)
		end
	end
	return result
end

function ui.创建文字框控件(布局名称 , 控件名称 , 文本内容 , 宽 , 高 , 文字大小 , 文字颜色)
	--[===[方法名称:ui.addTextView 创建文字框控件
	语法:ui.addTextView(layout , name , text , [w] , [h] , [文字大小] , [文字颜色])
	layout：布局名称
	name: 控件名称
	text: 显示内容
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，创建后自动设置文字大小
	文字颜色: 字符串类型，可选，格式如"#ffff00ff"，创建后自动设置文字颜色
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.addTextView(布局名称 , 控件名称 , 文本内容 , 宽 , 高)
	elseif 宽 then
		result = ui.addTextView(布局名称 , 控件名称 , 文本内容 , 宽)
	else
		result = ui.addTextView(布局名称 , 控件名称 , 文本内容)
	end
	-- 如果提供了文字大小或颜色，创建后自动设置
	if result then
		if 文字大小 then
			ui.setTextSize(控件名称 , 文字大小)
		end
		if 文字颜色 then
			ui.setTextColor(控件名称 , 文字颜色)
		end
	end
	return result
end

function ui.创建输入框控件(布局名称 , 控件名称 , 文本内容 , 宽 , 高 , 文字大小 , 文字颜色)
	--[===[方法名称:ui.addEditText 创建输入框控件
	语法:ui.addEditText(layout , name , text , [w] , [h] , [文字大小] , [文字颜色])
	layout：布局名称
	name: 控件名称
	text: 显示内容
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，创建后自动设置文字大小
	文字颜色: 字符串类型，可选，格式如"#ffff00ff"，创建后自动设置文字颜色
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.addEditText(布局名称 , 控件名称 , 文本内容 , 宽 , 高)
	elseif 宽 then
		result = ui.addEditText(布局名称 , 控件名称 , 文本内容 , 宽)
	else
		result = ui.addEditText(布局名称 , 控件名称 , 文本内容)
	end
	-- 如果提供了文字大小或颜色，创建后自动设置
	if result then
		if 文字大小 then
			ui.setTextSize(控件名称 , 文字大小)
		end
		if 文字颜色 then
			ui.setTextColor(控件名称 , 文字颜色)
		end
	end
	return result
end

function ui.创建多选框控件(布局名称 , 控件名称 , 文本内容 , 是否选中 , 宽 , 高 , 文字大小 , 文字颜色)
	--[===[方法名称:ui.addCheckBox 创建多选框控件
	语法:ui.addCheckBox(layout , name , text , [sel] , [w] , [h] , [文字大小] , [文字颜色])
	layout：布局名称
	name: 控件名称
	text: 显示内容
	sel : 布尔值类型，true表示选中 , false不选中
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，创建后自动设置文字大小
	文字颜色: 字符串类型，可选，格式如"#ffff00ff"，创建后自动设置文字颜色
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.addCheckBox(布局名称 , 控件名称 , 文本内容 , 是否选中 , 宽 , 高)
	elseif 宽 then
		result = ui.addCheckBox(布局名称 , 控件名称 , 文本内容 , 是否选中 , 宽)
	elseif 是否选中 ~= nil then
		result = ui.addCheckBox(布局名称 , 控件名称 , 文本内容 , 是否选中)
	else
		result = ui.addCheckBox(布局名称 , 控件名称 , 文本内容)
	end
	-- 如果提供了文字大小或颜色，创建后自动设置
	if result then
		if 文字大小 then
			ui.setTextSize(控件名称 , 文字大小)
		end
		if 文字颜色 then
			ui.setTextColor(控件名称 , 文字颜色)
		end
	end
	return result
end

function ui.创建单选框控件(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽 , 高 , 是否横向 , 文字大小 , 文字颜色)
	--[===[方法名称:ui.addRadioGroup 创建单选框控件
	语法:ui.addRadioGroup(layout , name , list , [select] , [w] , [h] , [horiziontal] , [文字大小] , [文字颜色])
	layout：布局名称
	name: 控件名称
	list: 表格类型 , 显示内容
	select : 整数类型 , 默认选中第几个单选框(默认0) , 可省略
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	是否横向: 布尔类型，true横向，false竖向
	文字大小: 整数类型，可选，创建后自动设置文字大小
	文字颜色: 字符串类型，可选，格式如"#ffff00ff"，创建后自动设置文字颜色
	返回值:布尔类型]===]
	local result
	if 是否横向 then
		result = ui.addRadioGroup(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽 , 高 , 是否横向)
	elseif 高 then
		result = ui.addRadioGroup(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽 , 高)
	elseif 宽 then
		result = ui.addRadioGroup(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽)
	elseif 默认选中 then
		result = ui.addRadioGroup(布局名称 , 控件名称 , 选项列表 , 默认选中)
	else
		result = ui.addRadioGroup(布局名称 , 控件名称 , 选项列表)
	end
	if result then
		if 文字大小 then
			ui.setTextSize(控件名称 , 文字大小)
		end
		if 文字颜色 then
			ui.setTextColor(控件名称 , 文字颜色)
		end
	end
	return result
end

function ui.创建下拉框控件(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽 , 高 , 文字大小 , 内边距左 , 内边距上 , 内边距右 , 内边距下)
	--[===[方法名称:ui.addSpinner 创建下拉框控件
	语法:ui.addSpinner(layout , name , list , select , [w] , [h])
	layout：布局名称
	name: 控件名称
	list: 表格类型 , 显示内容
	select : 整数类型 , 默认选中第几个单选框(默认0) , 可省略
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，创建后自动设置文字大小
	内边距左,内边距上,内边距右,内边距下: 整数类型，可选，创建后自动设置内边距
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.addSpinner(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽 , 高)
	elseif 宽 then
		result = ui.addSpinner(布局名称 , 控件名称 , 选项列表 , 默认选中 , 宽)
	elseif 默认选中 then
		result = ui.addSpinner(布局名称 , 控件名称 , 选项列表 , 默认选中)
	else
		result = ui.addSpinner(布局名称 , 控件名称 , 选项列表)
	end
	ui.setTextSize(控件名称 , 文字大小 or 11)
	if 内边距左 then
		ui.setPadding(控件名称 , 内边距左 , 内边距上 or 0 , 内边距右 or 0 , 内边距下 or 0)
	end
	return result
end

function ui.创建图像控件(布局名称 , 控件名称 , 图片路径 , 宽 , 高)
	--[===[方法名称:ui.addImageView 创建图像控件
	语法:ui.addImageView(layout , name , path , [w] , [h])
	layout：布局名称
	name: 控件名称
	path 图片路径
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.addImageView(布局名称 , 控件名称 , 图片路径 , 宽 , 高)
	elseif 宽 then
		return ui.addImageView(布局名称 , 控件名称 , 图片路径 , 宽)
	else
		return ui.addImageView(布局名称 , 控件名称 , 图片路径)
	end
end

function ui.创建线控件(布局名称 , 控件名称 , 宽 , 高)
	--[===[方法名称:ui.addLine 创建线控件
	语法:ui.addLine(layout , name , [w] , [h])
	layout：布局名称
	name: 控件名称
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.addLine(布局名称 , 控件名称 , 宽 , 高)
	elseif 宽 then
		return ui.addLine(布局名称 , 控件名称 , 宽)
	else
		return ui.addLine(布局名称 , 控件名称)
	end
end

function ui.创建浏览器控件(布局名称 , 控件名称 , 访问地址 , 宽 , 高)
	--[===[方法名称:ui.addWebView 创建一个浏览器控件
	语法:ui.addWebView(layout , name , url , [w] , [h])
	layout：布局名称
	name: 控件名称
	url: 访问的地址
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.addWebView(布局名称 , 控件名称 , 访问地址 , 宽 , 高)
	elseif 宽 then
		return ui.addWebView(布局名称 , 控件名称 , 访问地址 , 宽)
	else
		return ui.addWebView(布局名称 , 控件名称 , 访问地址)
	end
end

function ui.调用webview打开的网页中的js函数(控件名称 , js代码)
	--[===[方法名称:ui.callJs 调用webview打开的网页中的js函数
	语法:ui.callJs(name , js)
	name 控件名称
	js:字符串类型，js回调函数字符串
	返回值:布尔类型]===]
	return ui.callJs(控件名称 , js代码)
end

function ui.创建标签页控件(布局名称 , 控件名称 , 高度)
	--[===[方法名称:ui.addTabView 创建标签页控件
	语法:ui.addTabView(layout , name , [h])
	layout：布局名称
	name: 控件名称
	h:高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 高度 then
		return ui.addTabView(布局名称 , 控件名称 , 高度)
	else
		return ui.addTabView(布局名称 , 控件名称)
	end
end

function ui.创建子标签页控件(父标签名称 , 子标签名称 , 标签文本)
	--[===[方法名称:ui.addTab 创建子标签页控件
	语法:ui.addTab(tabName , name , text)
	tabName：父标签控件名称
	name: 子标签控件名称
	text: 标签显示内容
	返回值:布尔类型]===]
	return ui.addTab(父标签名称 , 子标签名称 , 标签文本)
end

function ui.重设线控件(控件名称 , 宽 , 高)
	--[===[方法名称:ui.setLine 重设线控件
	语法:ui.setLine(name , [w] , [h])
	name: 线控件名称
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.setLine(控件名称 , 宽 , 高)
	elseif 宽 then
		return ui.setLine(控件名称 , 宽)
	else
		return ui.setLine(控件名称)
	end
end

function ui.重设按钮控件(控件名称 , 文本内容 , 宽 , 高 , 文字大小 , 文字颜色)
	--[===[方法名称:ui.setButton 重设按钮控件
	语法:ui.setButton(name , text , [w] , [h] , [文字大小] , [文字颜色])
	name: 按钮控件名称
	text: 按钮显示文字内容
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，设置后自动更新文字大小
	文字颜色: 字符串类型，可选，格式如"#ffff00ff"，设置后自动更新文字颜色
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.setButton(控件名称 , 文本内容 , 宽 , 高)
	elseif 宽 then
		result = ui.setButton(控件名称 , 文本内容 , 宽)
	else
		result = ui.setButton(控件名称 , 文本内容)
	end
	if result then
		if 文字大小 then
			ui.setTextSize(控件名称 , 文字大小)
		end
		if 文字颜色 then
			ui.setTextColor(控件名称 , 文字颜色)
		end
	end
	return result
end

function ui.重设输入框控件(控件名称 , 文本内容 , 宽 , 高)
	--[===[方法名称:ui.setEditText 重设输入框控件
	语法:ui.setEditText(name , text , [w] , [h])
	name: 按钮控件名称
	text: 输入框显示文字内容
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.setEditText(控件名称 , 文本内容 , 宽 , 高)
	elseif 宽 then
		return ui.setEditText(控件名称 , 文本内容 , 宽)
	else
		return ui.setEditText(控件名称 , 文本内容)
	end
end

function ui.重设文本框控件(控件名称 , 文本内容 , 宽 , 高)
	--[===[方法名称:ui.setTextView 重设文本框控件
	语法:ui.setTextView(name , text , [w] , [h])
	name: 按钮控件名称
	text: 文本框显示文字内容
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.setTextView(控件名称 , 文本内容 , 宽 , 高)
	elseif 宽 then
		return ui.setTextView(控件名称 , 文本内容 , 宽)
	else
		return ui.setTextView(控件名称 , 文本内容)
	end
end

function ui.重设多选框控件(控件名称 , 文本内容 , 是否选中 , 宽 , 高)
	--[===[方法名称:ui.setCheckBox 重设多选框控件
	语法:ui.setCheckBox(name , text , sel , [w] , [h])
	name: 按钮控件名称
	text: 文本框显示文字内容
	sel: true表示选中，false不选中
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.setCheckBox(控件名称 , 文本内容 , 是否选中 , 宽 , 高)
	elseif 宽 then
		return ui.setCheckBox(控件名称 , 文本内容 , 是否选中 , 宽)
	else
		return ui.setCheckBox(控件名称 , 文本内容 , 是否选中)
	end
end

function ui.重设单选框控件(控件名称 , 选项列表 , 选中索引 , 宽 , 高 , 是否横向)
	--[===[方法名称:ui.setRadioGroup 重设单选框控件
	语法:ui.setRadioGroup(name , list , select , [w] , [h] , [horiziontal])
	name: 按钮控件名称
	text: 文本框显示文字内容
	select: 整数类型，表示第几个选中
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	horiziontal:布尔类型是否横向布局
	返回值:布尔类型]===]
	if 是否横向 then
		return ui.setRadioGroup(控件名称 , 选项列表 , 选中索引 , 宽 , 高 , 是否横向)
	elseif 高 then
		return ui.setRadioGroup(控件名称 , 选项列表 , 选中索引 , 宽 , 高)
	elseif 宽 then
		return ui.setRadioGroup(控件名称 , 选项列表 , 选中索引 , 宽)
	else
		return ui.setRadioGroup(控件名称 , 选项列表 , 选中索引)
	end
end

function ui.重设下拉框控件(控件名称 , 选项列表 , 选中索引 , 宽 , 高 , 文字大小 , 内边距左 , 内边距上 , 内边距右 , 内边距下)
	--[===[方法名称:ui.setSpinner 重设下拉框控件
	语法:ui.setSpinner(name , list , select , [w] , [h])
	name: 按钮控件名称
	text: 文本框显示文字内容
	select: 整数类型，表示第几个选中
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	文字大小: 整数类型，可选，默认11
	内边距左,内边距上,内边距右,内边距下: 整数类型，可选，设置内边距
	返回值:布尔类型]===]
	local result
	if 宽 and 高 then
		result = ui.setSpinner(控件名称 , 选项列表 , 选中索引 , 宽 , 高)
	elseif 宽 then
		result = ui.setSpinner(控件名称 , 选项列表 , 选中索引 , 宽)
	else
		result = ui.setSpinner(控件名称 , 选项列表 , 选中索引)
	end
	ui.setTextSize(控件名称 , 文字大小 or 11)
	if 内边距左 then
		ui.setPadding(控件名称 , 内边距左 , 内边距上 or 0 , 内边距右 or 0 , 内边距下 or 0)
	end
	return result
end

function ui.重设浏览器控件(控件名称 , 访问地址 , 宽 , 高)
	--[===[方法名称:ui.setWebView 重设浏览器控件
	语法:ui.setWebView(name , url , [w] , [h])
	name: 控件名称
	url: 访问的地址
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.setWebView(控件名称 , 访问地址 , 宽 , 高)
	elseif 宽 then
		return ui.setWebView(控件名称 , 访问地址 , 宽)
	else
		return ui.setWebView(控件名称 , 访问地址)
	end
end

function ui.重设图像控件(控件名称 , 图片路径 , 宽 , 高)
	--[===[方法名称:ui.setImageView 重设图像控件
	语法:ui.setImageView(name , path , [w] , [h])
	name: 控件名称
	path 图片路径
	w , h:宽高( - 1表示填满. - 2是自适应)默认可以不填写表示自适应
	返回值:布尔类型]===]
	if 宽 and 高 then
		return ui.setImageView(控件名称 , 图片路径 , 宽 , 高)
	elseif 宽 then
		return ui.setImageView(控件名称 , 图片路径 , 宽)
	else
		return ui.setImageView(控件名称 , 图片路径)
	end
end

function ui.控件设置文字(控件名称 , 文本内容)
	--[===[方法名称:ui.setText 控件设置文字
	语法:ui.setText(name , text)
	name: 控件名称
	text 文字内容
	返回值:布尔类型]===]
	return ui.setText(控件名称 , 文本内容)
end

function ui.设置布局标题(布局名称 , 文本内容)
	--[===[方法名称:ui.setTitleText 设置布局标题
	语法:ui.setTitleText(layout , text)
	layout 布局名称
	text 文字内容
	返回值:布尔类型]===]
	return ui.setTitleText(布局名称 , 文本内容)
end

function ui.设置文字大小(布局名称 , 文字大小)
	--[===[方法名称:ui.setTextSize 设置文字大小
	语法:ui.setTextSize(layout , size)
	layout 布局名称
	size: 整数类型文字大小
	返回值:布尔类型]===]
	return ui.setTextSize(布局名称 , 文字大小)
end

function ui.设置控件可用状态(控件名称 , 是否可用)
	--[===[方法名称:ui.setEnable 设置控件可用状态
	语法:ui.setEnable(name , enable)
	name 控件名称
	enable 布尔类型，true可用，false不可用
	返回值:布尔类型]===]
	return ui.setEnable(控件名称 , 是否可用)
end

function ui.设置控件显示状态(控件名称 , 显示状态)
	--[===[方法名称:ui.setVisiblity 设置控件显示状态
	语法:ui.setVisiblity(name , state)
	name 控件名称
	state 整数类型 , 2隐藏空间，3隐藏切让控件不占用布局空间
	返回值:布尔类型]===]
	return ui.setVisiblity(控件名称 , 显示状态)
end

function ui.批量设置行控件显示状态通过gid(布局ID , 控件名称 , 显示状态)
	--[===[方法名称:ui.setRowVisibleByGid 批量设置行控件显示状态通过gid
	语法:ui.setRowVisibleByGid(layoutid , name , state)
	layoutid:布局id
	name 控件名称
	state 整数类型 , 2隐藏空间，3隐藏切让控件不占用布局空间
	返回值:布尔类型]===]
	return ui.setRowVisibleByGid(布局ID , 控件名称 , 显示状态)
end

function ui.设置控件背景颜色(控件名称 , 颜色值)
	--[===[方法名称:ui.setBackground 设置控件背景颜色
	语法:ui.setBackground(name , color)
	name 控件名称
	color: 字符串类型 , 颜色格式例子:"#ffff00ff"
	返回值:布尔类型]===]
	return ui.setBackground(控件名称 , 颜色值)
end

function ui.设置布局标题栏背景颜色(布局名称 , 颜色值)
	--[===[方法名称:ui.setTitleBackground 设置控件背景颜色
	语法:ui.setTitleBackground(layout , color)
	layout 布局名称
	color: 字符串类型 , ��色格式例子:"#ffff00ff"
	返回值:布尔类型]===]
	return ui.setTitleBackground(布局名称 , 颜色值)
end

function ui.设置文字颜色(控件名称 , 颜色值)
	--[===[方法名称:ui.setTextColor 设置文字颜色
	语法:ui.setTextColor(name , color)
	name 控件名称
	color: 字符串类型 , 颜色格式例子:"#ffff00ff"
	返回值:布尔类型]===]
	return ui.setTextColor(控件名称 , 颜色值)
end

function ui.设置输入类型(控件名称 , 输入类型)
	--[===[方法名称:ui.setInputType 设置输入类型
	语法:ui.setInputType(name , type)
	name 控件名称
	type 整数类型 ,
	1:输入类型为普通文本
	2:输入类型为数字文本
	3:输入类型为电话号码
	4:输入类型为日期和时间
	128:输入一个密码
	返回值:布尔类型]===]
	return ui.setInputType(控件名称 , 输入类型)
end

function ui.获取文字(控件名称)
	--[===[方法名称:ui.getText 获取文字
	语法:ui.getText(name)
	name 控件名称
	返回值:字符串类型]===]
	return ui.getText(控件名称)
end

function ui.获取可用状态(控件名称)
	--[===[方法名称:ui.getEnabled 获取可用状态
	语法:ui.getEnable(name)
	name 控件名称
	返回值:布尔类型]===]
	return ui.getEnable(控件名称)
end

function ui.获取显示状态(控件名称)
	--[===[方法名称:ui.getVisible 获取显示状态
	语法:ui.getVisible(name)
	name 控件名称
	返回值:布尔类型]===]
	return ui.getVisible(控件名称)
end

function ui.获取文字颜色(控件名称)
	--[===[方法名称:ui.getTextColor 获取文字颜色
	语法:ui.getTextColor(name)
	name 控件名称
	返回值:字符串类型]===]
	return ui.getTextColor(控件名称)
end

function ui.设置控件宽度全屏(控件名称)
	--[===[方法名称:ui.setFullScreen 设置控件宽度全屏
	语法:ui.setFullScreen(name)
	name 控件名称
	返回值:字符串类型]===]
	return ui.setFullScreen(控件名称)
end

function ui.设置控件内边距(控件名称 , 左边距 , 上边距 , 右边距 , 下边距)
	--[===[方法名称:ui.setPadding 设置控件内边距
	语法:ui.setPadding(name , l , t , r , b)
	name 控件名称
	l , t , r , b:整数类型表示内边距的左 上 右 下
	返回值:字符串类型]===]
	return ui.setPadding(控件名称 , 左边距 , 上边距 , 右边距 , 下边距)
end

function ui.设置控件对齐方式(控件名称 , 对齐模式)
	--[===[方法名称:ui.setGravity 设置控件对齐方式
	语法:ui.setGravity(name , alignMode)
	name 控件名称
	alignMode: 整数类型 , 48 上对齐 , 80 下对齐 , 3 左对齐 , 5 右对齐 , 16 垂直居中对齐 , 17 居中对齐
	返回值:布尔类型]===]
	return ui.setGravity(控件名称 , 对齐模式)
end

function ui.设置控件单击事件(控件名称 , 触发代码)
	--[===[方法名称:ui.setOnClick 设置控件单击事件
	语法:ui.setOnClick(name , event)
	name 控件名称
	event:字符串类型，可以是一个lua代码字符串
	返回值:布尔类型]===]
	return ui.setOnClick(控件名称 , 触发代码)
end

function ui.设置界面关闭事件(触发代码)
	--[===[方法名称:ui.setOnClose 设置界面关闭事件
	语法:ui.setOnClose(event)
	event:字符串类型，可以是一个lua代码字符串
	返回值:布尔类型]===]
	return ui.setOnClose(触发代码)
end

function ui.设置控件改变事件(控件名称 , 触发代码)
	--[===[方法名称:ui.setOnChange 设置控件改变事件
	语法:ui.setOnChange(name , event)
	name 控件名称
	event:字符串类型，可以是一个lua代码字符串
	返回值:布尔类型]===]
	return ui.setOnChange(控件名称 , 触发代码)
end

function ui.获取控件值(控件名称)
	--[===[方法名称:ui.getValue 获取控件值
	语法:ui.getValue(name)
	name 控件名称
	返回值:字符串类型]===]
	return ui.getValue(控件名称)
end

function ui.获取当前界面所有控件的值()
	--[===[方法名称:ui.getData 获取当前界面所有控件的值
	语法:ui.getData()
	返回值:表格类型]===]
	return ui.getData()
end

function ui.读取设置(配置文件路径)
	--[===[方法名称:ui.loadProfile 读取设置
	语法:ui.loadProfile(path)
	path 配置文件路径
	返回值:布尔类型]===]
	return ui.loadProfile(配置文件路径)
end

function ui.保存配置(配置文件路径)
	--[===[方法名称:ui.saveProfile 保存配置
	语法:ui.saveProfile(path)
	path 配置文件路径
	返回值:布尔类型]===]
	return ui.saveProfile(配置文件路径)
end

function ui.显示界面(布局名称 , 是否模态)
	--[===[方法名称:ui.show 显示界面
	语法:ui.show(name , [modal])
	name 布局名称
	modal 布尔类型，是否模态(可选，默认false)
	返回值:无]===]
	if 是否模态 ~= nil then
		return ui.show(布局名称 , 是否模态)
	else
		return ui.show(布局名称)
	end
end
function ui.文字分割线(布局名称 , 控件id  , 文字颜色)
	 
	local 分割内容 = '❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀'
	return ui.创建文字框控件(布局名称 , 控件id , 分割内容 ,2000 , 10 , 10 , 文字颜色)
end
