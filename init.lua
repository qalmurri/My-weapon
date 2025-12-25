-- =========================
-- Bootstrap lazy.nvim
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- =========================
-- Options
-- =========================
vim.opt.termguicolors = true
vim.g.mapleader = " "

-- =========================
-- Plugins
-- =========================
require("lazy").setup({
  -- Sidebar: NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },

  -- Tab/File line: BufferLine
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
  },
})

-- =========================
-- Keymaps
-- =========================
-- Toggle NvimTree sidebar
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Cycle buffers
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
