require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    additional_vim_regex_highlighting= false,
    enable = true,
  },
  indent = {
    enable = {
      "javascriptreact", "javascript", "typescript", "typescriptreact"
    }
  },
}

