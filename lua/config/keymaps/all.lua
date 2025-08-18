-- File name: all.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-18
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local M = {}

---@param whichkey wk
M.setup_keybinds = function(whichkey)
  if not whichkey then
    return
  end

  local android = require("android-nvim")
  if android then
    whichkey.add({
      { "<leader>A", group = "Android", icon = { icon = "\u{f17b}", color = "green" } },
      { "<leader>Ar", android.build_and_run, desc = "Build & Run Project" },
      { "<leader>AR", android.build_release, desc = "Build (release mode)" },
      { "<leader>Ac", android.clean, desc = "Clean Project" },
      { "<leader>Ap", android.launch_avd, desc = "Pick & Launch AVD" },
      { "<leader>Ad", android.refresh_dependencies, desc = "Refresh Dependencies" },
    })
  end

  local mc = require("multicursor-nvim")
  if mc then
    local set = vim.keymap.set

    local multicursor_icon = { icon = "\u{f246}", color = "blue" }

    whichkey.add({
      -- adding cursors by line
      {
        "<up>",
        function()
          mc.lineAddCursor(-1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Add line cursor up",
        icon = multicursor_icon,
      },
      {
        "<down>",
        function()
          mc.lineAddCursor(1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Add line cursor down",
        icon = multicursor_icon,
      },
      {
        "<leader><up>",
        function()
          mc.lineSkipCursor(-1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Skip line up",
        icon = multicursor_icon,
      },
      {
        "<leader><down>",
        function()
          mc.lineSkipCursor(1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Skip line down",
        icon = multicursor_icon,
      },

      -- adding cursors by matching word/selection
      {
        "<leader>n",
        function()
          mc.matchAddCursor(1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Add cursor by matching word/selection",
        icon = multicursor_icon,
      },
      {
        "<leader>s",
        function()
          mc.matchSkipCursor(1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Skip cursor by matching word/selection",
        icon = multicursor_icon,
      },
      {
        "<leader>N",
        function()
          mc.matchAddCursor(-1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Add cursor by matching word/selection (reverse)",
        icon = multicursor_icon,
      },
      {
        "<leader>S",
        function()
          mc.matchSkipCursor(-1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Skip cursor by matching word/selection (reverse)",
        icon = multicursor_icon,
      },

      {
        "<c-q>",
        mc.toggleCursor,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Toggle cursors",
        icon = multicursor_icon,
      },

      -- advanced

      -- enable cursor operator: i.e. gaip will create a cursor on each line
      -- of the paragraph
      {
        "ga",
        mc.addCursorOperator,
        mode = "n",
      },

      -- clone cursors and disable originals
      {
        "<leader><c-q>",
        mc.duplicateCursors,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Duplicate cursors",
        icon = multicursor_icon,
      },

      -- align cursor
      {
        "<leader>a",
        mc.alignCursors,
        mode = "n",
        desc = "(multicursor-nvim) Align cursors",
        icon = multicursor_icon,
      },

      -- split visual selections by regex
      {
        "<leader>S",
        mc.splitCursors,
        mode = "x",
        desc = "(multicursor-nvim) Split cursors by regex",
        icon = multicursor_icon,
      },

      -- match new cursors within visual selections by regex
      {
        "<leader>M",
        mc.matchCursors,
        mode = "x",
        desc = "(multicursor-nvim) Match cursors within selection by regex",
        icon = multicursor_icon,
      },

      -- restore cursors after accidental clear
      {
        "<leader>gv",
        mc.restoreCursors,
        mode = "n",
        desc = "(multicursor-nvim) Restore cursors",
        icon = multicursor_icon,
      },

      -- rotate the text contained in each visual selection between cursors
      {
        "<leader>t",
        function()
          mc.transposeCursors(1)
        end,
        mode = "x",
        desc = "(multicursor-nvim) Transpose cursors (left-to-right)",
        icon = multicursor_icon,
      },
      {
        "<leader>T",
        function()
          mc.transposeCursors(-1)
        end,
        mode = "x",
        desc = "(multicursor-nvim) Transpose cursors (right-to-left)",
        icon = multicursor_icon,
      },

      -- append/insert for each line of visual selection
      {
        "I",
        mc.insertVisual,
        mode = "x",
        desc = "(multicursor-nvim) Insert at cursor of each line",
        icon = multicursor_icon,
      },
      {
        "A",
        mc.appendVisual,
        mode = "x",
        desc = "(multicursor-nvim) Insert at the end of each line",
        icon = multicursor_icon,
      },

      -- increment/decrement sequences
      {
        "g<c-a>",
        mc.sequenceIncrement,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Increment sequence",
        icon = multicursor_icon,
      },
      {
        "g<c-x>",
        mc.sequenceDecrement,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Decrement sequence",
        icon = multicursor_icon,
      },

      -- add a cursor and jump to the next/previous search result
      {
        "<leader>sz",
        function()
          mc.searchAddCursor(1)
        end,
        mode = "n",
        desc = "(multicursor-nvim) Add cursor to next search result",
        icon = multicursor_icon,
      },
      {
        "<leader>sZ",
        function()
          mc.searchAddCursor(-1)
        end,
        mode = "n",
        desc = "(multicursor-nvim) Add cursor to previous search result",
        icon = multicursor_icon,
      },

      -- skip next/previous search result and don't add cursor
      {
        "<leader>sx",
        function()
          mc.searchSkipCursor(1)
        end,
        mode = "n",
        desc = "(multicursor-nvim) Skip next search result",
        icon = multicursor_icon,
      },
      {
        "<leader>sX",
        function()
          mc.searchSkipCursor(-1)
        end,
        desc = "(multicursor-nvim) Skip previous search result",
        icon = multicursor_icon,
      },

      -- add a cursor to every search result
      {
        "<leader>sA",
        mc.searchAddAllCursors,
        desc = "(multicursor-nvim) Add cursor to all search results",
        icon = multicursor_icon,
      },

      -- add match cursor operator
      {
        "<leader>m",
        mc.operator,
        mode = "n",
      },

      -- add or skip a new cursor by matching diagnostics
      {
        "]d",
        function()
          mc.diagnosticAddCursor(1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Add cursor to next diagnostic",
        icon = multicursor_icon,
      },
      {
        "[d",
        function()
          mc.diagnosticAddCursor(-1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Add cursor to previous diagnostic",
        icon = multicursor_icon,
      },
      {
        "]s",
        function()
          mc.diagnosticSkipCursor(1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Skip cursor for next diagnostic",
        icon = multicursor_icon,
      },
      {
        "[s",
        function()
          mc.diagnosticSkipCursor(-1)
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Skip cursor for previous diagnostic",
        icon = multicursor_icon,
      },

      -- match cursors by diagnostics
      {
        "md",
        function()
          mc.diagnosticMatchCursors({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = { "n", "x" },
        desc = "(multicursor-nvim) Match cursors by diagnostics",
        icon = multicursor_icon,
      },
    })

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)

      -- Delete the main cursor.
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end
end

return M
