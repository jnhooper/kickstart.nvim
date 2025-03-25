-- return to normal mode
vim.keymap.set('i', 'jj', '<Esc>')

-- remap semicolon to colon for faster commands
vim.keymap.set('n', ';', ':')

-- move to the next buffer
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bprev<CR>')

-- close buffer
vim.keymap.set('n', '<leader>x', '<cmd>enew<bar>bd #<CR>', { desc = '[x] out of buffer' })
vim.keymap.set('n', '<leader>cb', '<cmd>%bd|e#|bd# <CR>', { desc = '[c]lose all [b]uffers' })

vim.keymap.set('n', 'F', vim.diagnostic.open_float, { desc = 'open [F]loat diagnostics' })

vim.keymap.set('n', '-', '<CMD>Oil --float <CR>', { desc = 'Open parent directory in oil' })
