autocmd BufWritePost <buffer> let cmd = "cp -r ".g:bundle_dir."/bandit/* ".g:localbundle_dir|let out = system(cmd)|colorscheme bandit
