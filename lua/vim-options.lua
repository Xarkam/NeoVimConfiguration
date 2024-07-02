vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

vim.opt.confirm = true            -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true         -- Enable highlighting of the current line


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })

-- save all documents
-- vim.keymap.set("n", "<C-S-s>", vim.cmd.wall, { silent = true })
-- vim.keymap.set("i", "<cs-s>", vim.cmd.wall, { silent = true })
-- vim.keymap.set("v", "<cs-R>", vim.cmd.wall, { silent = true })

-- Delete text
vim.keymap.set('i', '<C-Del>', "<Esc>lce")
vim.keymap.set('n', '<C-Del>', "ce")
-- vim.keymap.set('i', '<C-BS>', "<Esc>cb")
-- vim.keymap.set('i', '<C-Backspace>', "<Esc><C-w>")
-- vim.keymap.set('n', '<C><BS>', "cb<Esc>")
-- vim.keymap.set('n', '<C-backspace>', "<Esc>cb")

-- vim.keymap.set('n', '<leader>q', ':q!<CR>:q!<CR>:q!<CR>')
vim.keymap.set({ 'n', 't', 'v' }, '<leader>q', ':qa<CR>:qa<CR>:qa<CR>')
vim.keymap.set({ 'n', 't', 'v' }, '<leader>Q', ':q!<CR>:q!<CR>:q!<CR>')

-- Better indenting in Visual mode
vim.keymap.set('v', '>', ">gv")
vim.keymap.set('v', '<', "<gv")

-- create new lines in Normal mode
vim.keymap.set('n', '<leader>o', "o<Esc>^Da<Esc>k", { desc = 'Newline Below', silent = true })
vim.keymap.set('n', '<leader>O', "O<Esc>^Da<Esc>j", { desc = 'Newline Above', silent = true })

vim.keymap.set('n', '<S-Down>', 'j')
vim.keymap.set('v', '<S-Down>', 'j')
vim.keymap.set('n', '<S-Up>', 'k')
vim.keymap.set('v', '<S-Up>', 'k')

local function toggle_highlight()
    local line_num = vim.fn.line('.')
    local highlight_group = 'LineHighlight'

    -- Get all matches
    local matches = vim.fn.getmatches()
    local match_id = nil

    -- Check if there's already a match for the current line
    for _, match in ipairs(matches) do
        if match.group == highlight_group and match.pattern == '\\%' .. line_num .. 'l' then
            match_id = match.id
            break
        end
    end

    if match_id then
        -- Remove the existing match
        vim.fn.matchdelete(match_id)
        print('Line highlight removed')
    else
        -- Add a new highlight
        vim.cmd('highlight LineHighlight ctermbg=gray guibg=gray')
        vim.fn.matchadd('LineHighlight', '\\%' .. line_num .. 'l')
        print('Line highlighted')
    end
end
-- Set the key mapping
vim.keymap.set('n', '<leader>ha', toggle_highlight, { desc = 'Toggle Highlight Line' })
vim.keymap.set('n', '<leader>hr', "<cmd>call clearmatches()<CR>", { desc = 'Toggle Highlight Line' })

vim.wo.number = true
vim.wo.relativenumber = true

