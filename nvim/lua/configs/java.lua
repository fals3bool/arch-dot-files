local M = {}

-- Detecta el package desde la ruta
local function detect_package()
  local filepath = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:t")

  local package = ""

  local src_index = filepath:find("src/main/java/")
  if src_index then
    package = filepath:sub(src_index + #"src/main/java/")
  else
    local alt_index = filepath:find("src/")
    if alt_index then
      package = filepath:sub(alt_index + #"src/")
    end
  end

  package = package:gsub("/" .. filename .. "$", "")
  package = package:gsub("/", ".")
  return package
end

function M.insert_package()
  local pkg = detect_package()
  if pkg == "" then
    print("No se pudo detectar el package")
    return
  end

  -- Evitar duplicados
  local first = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
  if first:match("^%s*package%s+") then
    print("Ya existe un package")
    return
  end

  vim.api.nvim_buf_set_lines(0, 0, 0, false, {
    "package " .. pkg .. ";",
    "",
  })
end

function M.insert_class()
  local name = vim.fn.expand("%:t:r")

  vim.api.nvim_put({
    "public class " .. name .. " {",
    "",
    "}",
  }, "l", true, true)
end

function M.insert_interface()
  local name = vim.fn.expand("%:t:r")

  vim.api.nvim_put({
    "public interface " .. name .. " {",
    "",
    "}",
  }, "l", true, true)
end

function M.insert_enum()
  local name = vim.fn.expand("%:t:r")

  vim.api.nvim_put({
    "public enum " .. name .. " {",
    "",
    "}",
  }, "l", true, true)
end
return M
