function recursive_load_plugins(root_dir, relative_path)
  local plugins = {}
	local path = nil
	-- If the given path is not relative, set `relative_path` to it
	if not relative_path:match("^/") then
		path = root_dir .. "/" .. relative_path
	else
		path = relative_path
	end
  for _, file in ipairs(vim.fn.readdir(path)) do
    local full_path = path .. "/" .. file
    if vim.fn.isdirectory(full_path) == 1 then
      -- Recursively load plugins from subdirectories
      vim.list_extend(plugins, recursive_load_plugins(root_dir, full_path))
    elseif file:match("%.lua$") then
      -- Format the path for the require
      local import_path = full_path:gsub("^" .. root_dir,""):gsub("^.",""):gsub(".lua$",""):gsub("/",".")

      local plugin_spec = { import = import_path }

      table.insert(plugins, plugin_spec) 
    end
  end
  return plugins
end

return recursive_load_plugins