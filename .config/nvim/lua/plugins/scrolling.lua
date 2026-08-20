return {
  -- Disables smooth scrolling in newer LazyVim versions
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  -- Disables smooth scrolling in older LazyVim versions
  {
    "nvim-mini/mini.animate",
    enabled = false,
  },
}
