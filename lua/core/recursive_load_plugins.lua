-- Walks `root_dir/relative_path` and returns a lazy.nvim-style spec list of
-- `{ import = "dotted.module.path" }` for every .lua file found, recursing into
-- subdirectories. Files are visited in readdir order, so the numeric filename
-- prefixes (00-, 10-, 99-) are what establish load order.

--- Escape a string so it is safe to use as a literal Lua pattern.
--- Paths contain `.` and `-`, both of which are pattern metacharacters.
local function escape_pattern(text)
  return (text:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1"))
end

local function recursive_load_plugins(root_dir, relative_path)
  local plugins = {}

  local path = relative_path
  if not relative_path:match("^/") then
    path = root_dir .. "/" .. relative_path
  end

  for _, file in ipairs(vim.fn.readdir(path)) do
    local full_path = path .. "/" .. file

    if vim.fn.isdirectory(full_path) == 1 then
      vim.list_extend(plugins, recursive_load_plugins(root_dir, full_path))
    elseif file:match("%.lua$") then
      local import_path = full_path
        :gsub("^" .. escape_pattern(root_dir .. "/"), "")
        :gsub("%.lua$", "")
        :gsub("/", ".")

      table.insert(plugins, { import = import_path })
    end
  end

  return plugins
end

return recursive_load_plugins
