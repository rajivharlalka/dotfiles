local nnoremap = require("rajiv.keymap").nnoremap
local vnoremap = require("rajiv.keymap").vnoremap

nnoremap("<leader>pv","<cmd>Ex<CR>")
nnoremap('<leader>w','<cmd>write<CR>',{desc='Save'})
nnoremap('<leader>q','<cmd>quit<CR>',{desc='Quit'})

--Copy to clipboard
vnoremap('y','"+y')
nnoremap('Y','"+yg_')
nnoremap('y','"+y')
nnoremap('yy','"+yy')

-- copy delete content to system clipboard
nnoremap('dd','"+dd')
nnoremap('D','"+D')

-- Paste to System Clipboard
nnoremap('p','"+p')

-- telescope
local builtin = require("telescope.builtin")
nnoremap("<leader>ff",builtin.find_files,{})
nnoremap("<leader>fg",builtin.live_grep,{})
nnoremap("<leader>fb",builtin.buffers,{})
nnoremap("<leader>fh",builtin.help_tags,{})

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')
