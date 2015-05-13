if exists("did_load_myfiletypes")
finish
endif
let did_load_myfiletypes=1

augroup filetypedetect
au BufNewFile,BufReadPost *.ss
	setf xhtml
augroup END
