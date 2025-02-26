-- breakpoints
local python_bp_line="__import__('ipdb').set_trace()"
local ruby_bp_line="require 'pry'; binding.pry"
local eruby_bp_line="<% require 'pry'; binding.pry %>"
local js_bp_line="debugger // eslint-disable-line"

local function BreakPointString()
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


-- IndentWithI
function IndentWithI()
  return string.match(vim.api.nvim_get_current_line(), '^%s*$') and '_cc' or 'i'
end
-- IndentWithI


-- preserveCursor -> keep cursor state
function preserveCursor(cmd)
  local cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end
-- preserveCursor

-- TrimWhiteSpace
function TrimWhiteSpace()
  preserveCursor([[%s/\s\+$//e]])
  preserveCursor([[%s/\n\{3,}/\r\r/e]])
  -- retab
end
-- TrimWhiteSpace


-- SmartGF
function VimBundlePackage()
  local type = vim.fn.expand('%:t')
  if ( type ~= 'bundles.vim' and type ~= 'plugins.lua' and type ~= 'bundles.lua') then return false end

  local pattern = "['\"][^/]*/[^'\"]*['\"]"
  local line_text = vim.api.nvim_get_current_line()
  startpos, endpos = string.find(line_text, pattern)
  if startpos == nil then return false end
  url = "https://github.com/" .. string.sub(line_text, startpos+1, endpos-1)

  vim.fn.system('open' .. ' ' .. url)
  return true
end
-- SmartGF
