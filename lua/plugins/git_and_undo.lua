return {
    {
        'tpope/vim-fugitive',
    },
    {
        'airblade/vim-gitgutter',
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)
        end
    },

}
