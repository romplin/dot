return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      '                                                     ',
      '  ██████╗  ██████╗ ███╗   ███╗██████╗ ██╗     ██╗███╗   ██╗',
      '  ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗██║     ██║████╗  ██║',
      '  ██████╔╝██║   ██║██╔████╔██║██████╔╝██║     ██║██╔██╗ ██║',
      '  ██╔══██╗██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██║██║╚██╗██║',
      '  ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║     ███████╗██║██║ ╚████║',
      '  ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝╚═╝  ╚═══╝',
      '                                                     ',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('g', '  Find text', ':Telescope live_grep <CR>'),
      dashboard.button('c', '  Configuration', ':e $MYVIMRC <CR>'),
      dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
    }

    dashboard.section.footer.val = 'Happy coding!'

    alpha.setup(dashboard.opts)

    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
