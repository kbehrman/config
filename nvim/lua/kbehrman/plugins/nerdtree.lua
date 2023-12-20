return { 
    'scrooloose/nerdtree',
    config = function()
        vim.cmd([[
        " Nerd Tree
        let NERDTreeIgnore=['\.pyc$']
        let g:NERDTreeDirArrows=0
        let g:NERDTreeMinimalUI=1
        let g:NERDTreeQuitOnOpen=1
        map <Leader><F3> :NERDTreeToggle<cr>
        let g:VCSCommandSplit = 'vertical'
        " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
        autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
        ]]
        )
    end
}
