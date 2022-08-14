-- breakpoints
local python_bp_line="__import__('ipdb').set_trace()"
local ruby_bp_line="require 'pry'; binding.pry"
local eruby_bp_line="<% require 'pry'; binding.pry %>"
local js_bp_line="debugger // eslint-disable-line"

function BreakPointString()
  local ft = vim.bo.filetype

  if ft == "ruby" then return ruby_bp_line end
  if ft == "eruby" or ft == "eruby.html" then return eruby_bp_line end
  if ft == "javascript" or ft == "typescript" or ft == "typescriptreact" then return js_bp_line end
  if ft == "python" then return python_bp_line end
end

function RemoveBreakpoints()
  vim.api.nvim_command('silent! g/'..BreakPointString()..'/d')
end

function ToggleBreakpoint()
  local line_text = vim.api.nvim_get_current_line()
  local bp_string = BreakPointString()

  if string.find(line_text, bp_string) == nil then
    local lnum = vim.api.nvim_win_get_cursor(0)[1]

    vim.fn.append(lnum-1, bp_string)
    vim.cmd('normal k')
    vim.cmd('normal =')
  else
    vim.cmd('normal dd')
  end
end
-- breakpoints


-- nvim-tree
local nvimTree_toggled = false
function toggle_full_width()
  if nvimTree_toggled then
    require'nvim-tree'.resize(30)
  else
    require'nvim-tree'.resize(100)
  end
  nvimTree_toggled = not nvimTree_toggled
end


-- SmartGF
function VimBundlePackage()
  local type = vim.fn.expand('%:t')
  if ( type ~= 'bundles.vim' and type ~= 'plugins.lua' ) then return false end

  local pattern = "['\"][^/]*/[^'\"]*['\"]"
  local line_text = vim.api.nvim_get_current_line()
  startpos, endpos = string.find(line_text, pattern)
  if startpos == nil then return false end
  url = "https://github.com/" .. string.sub(line_text, startpos+1, endpos-1)

  vim.fn.system('open' .. ' ' .. url)
  return true
end
-- SmartGF
