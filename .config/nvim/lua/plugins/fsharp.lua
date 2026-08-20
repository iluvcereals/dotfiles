return {
  {
    "ionide/Ionide-vim",
    ft = { "fsharp" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    -- CORRECTED COMMANDS BELOW
    keys = {
      { "<leader>ri", "<cmd>FsiShow<cr>", desc = "Open F# REPL" },
      { "<leader>rs", "<cmd>FsiReset<cr>", desc = "Reset REPL" },

      -- Run File (Standard)
      { "<leader>rr", "<cmd>FsiEvalBuffer<cr>", desc = "Run File" },

      -- Run Selection (Simplified - Just runs the command)
      { "<leader>re", ":FsiEval<CR>", mode = "v", desc = "Run Selection" },

      -- Run Line (Simplified)
      { "<leader>rl", "V:FsiEval<CR>", desc = "Run Line" },
    },
    config = function()
      -- This ensures the plugin uses 'dotnet fsi' to run the code
      vim.g.fsharp_terminal_command = "dotnet fsi"
      require("ionide").setup({})
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "fsharp" })
      end
    end,
  },
}
