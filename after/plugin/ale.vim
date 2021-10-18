" Set 'vim-lsp' as a linter
let g:ale_linters = {
			\   'typescript': ['vim-lsp', 'eslint'],
			\   'javascript': ['vim-lsp', 'eslint'],
			\   'ruby': ['vim-lsp', 'rubocop'],
			\ }
