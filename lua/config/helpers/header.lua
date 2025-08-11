-- File name: header.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-10
-- Date modified: 2025-08-10
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local filetype_table = require("filetypes")

local header_helpers = {}

local function escape_special_characters(pattern)
  if not pattern then
    return ""
  end
  local special_chars = { "%", "^", "$", "(", ")", ".", "[", "]", "*", "+", "-", "?" }

  for _, char in ipairs(special_chars) do
    pattern = pattern:gsub("%" .. char, "%%" .. char)
  end

  return pattern
end

local function find_block_comment_end(lines, comments)
  local start_pat = escape_special_characters(comments.block.start or "")
  local end_pat = escape_special_characters(comments.block["end"] or "")

  if start_pat == "" or end_pat == "" then
    return 0 -- Cannot proceed without both start and end
  end

  local found_start = false

  for i, line in ipairs(lines) do
    if not found_start then
      if line:find(start_pat) then
        found_start = true
      end
    else
      if line:find(end_pat) then
        return i -- End of block header (inclusive)
      end
    end
  end

  return 0 -- No complete block comment found
end

local function find_line_comment_header_end(header, lines, comments)
  if not comments or not comments.line then
    return 0
  end

  local comment_pat = "^%s*" .. escape_special_characters(comments.line.line)
  local last_comment_line = 0

  for i, line in ipairs(lines) do
    if
      line:match(comment_pat)
      or line:match("^%s*$")
      or (header.config.line_separator and line:match(comment_pat .. "%s*" .. header.config.line_separator .. "$"))
      or (header.config.copyright_text and line:match(comment_pat .. "%s*" .. header.config.copyright_text .. "$"))
    then
      last_comment_line = i
    else
      break
    end
  end

  return last_comment_line
end

local function find_header_end(header, lines, comments)
  if header.config.use_block_header and comments.block and comments.block.start and comments.block["end"] then
    return find_block_comment_end(lines, comments)
  else
    return find_line_comment_header_end(lines, comments)
  end
end

local function get_header_lines(header, buffer, comments)
  local max_header_lines = vim.api.nvim_buf_get_lines(buffer, 0, header.header_size, false)
  local header_end = find_header_end(header, max_header_lines, comments)
  return vim.api.nvim_buf_get_lines(buffer, 0, header_end, false)
end

header_helpers.add_header_if_not_present = function(header)
  local buffer = vim.api.nvim_get_current_buf()
  local file_extension = vim.fn.expand("%:e")
  -- Check if the file extension is in the filetype_table
  if not filetype_table[file_extension] then
    vim.notify("File type not supported for updating header", vim.log.levels.WARN)
    return
  end
  local comments = filetype_table[file_extension]()
  local lines = get_header_lines(header, buffer, comments)

  if #lines <= 0 then
    header.add_headers()
    return true
  else
    return false
  end
end

return header_helpers
