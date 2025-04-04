return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
 

  config = function()
 

  local empty = require('lualine.component'):extend()
  function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
  end
 

  local function process_sections(sections)
  for name, section in pairs(sections) do
  local left = name:sub(9, 10) < 'x'
  for id, comp in ipairs(section) do
  if type(comp) ~= 'table' then
  comp = { comp }
  section[id] = comp
  end
  comp.separator = left and { right = '' } or { left = '' }
  end
  end
  return sections
  end
 

  local function search_result()
  if vim.v.hlsearch == 0 then
  return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
  return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
  end
 

  local function modified()
  if vim.bo.modified then
  return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
  return '-'
  end
  return ''
  end
 

  local M = require("lualine.component"):extend()
 

  M.processing = false
  M.spinner_index = 1
 

  local spinner_symbols = {
  "⠋",
  "⠙",
  "⠹",
  "⠸",
  "⠼",
  "⠴",
  "⠦",
  "⠧",
  "⠇",
  "⠏",
  }
  local spinner_symbols_len = 10
 

  -- Initializer
  function M:init(options)
  M.super.init(self, options)
 

  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
 

  vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "CodeCompanionRequest*",
  group = group,
  callback = function(request)
  if request.match == "CodeCompanionRequestStarted" then
  self.processing = true
  elseif request.match == "CodeCompanionRequestFinished" then
  self.processing = false
  end
  end,
  })
  end
 

  -- Function that runs every time statusline is updated
  function M:update_status()
  if self.processing then
  self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
  return spinner_symbols[self.spinner_index]
  else
  return nil
  end
  end
 

  local lualine_setup = {
  options = {
  theme = 'catppuccin',
  component_separators = '',
  section_separators = { left = '', right = '' },
  },
 

  sections = process_sections {
  lualine_a = { 'mode' },
  lualine_b = {
  'branch',
  'diff',
  {
  'diagnostics',
  source = { 'nvim' },
  sections = { 'error' },
  },
  {
  'diagnostics',
  source = { 'nvim' },
  sections = { 'warn' },
  },
  { 'filename', file_status = false, path = 1 },
  {
  '%w',
  cond = function()
  return vim.wo.previewwindow
  end,
  },
  {
  '%r',
  cond = function()
  return vim.bo.readonly
  end,
  },
  {
  '%q',
  cond = function()
  return vim.bo.buftype == 'quickfix'
  end,
  },
  },
  lualine_c = { M },
  lualine_x = {},
  lualine_y = { search_result, 'filetype' },
  lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
  lualine_c = { '%f %y %m' },
  lualine_x = {},
  },
  }
 

  require('lualine').setup(lualine_setup)
 

  end
 }

