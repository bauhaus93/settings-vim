function! BuildCmd()
	if !empty(glob("build.sh"))
		:! ./build.sh
	elseif !empty(glob("scripts/build.sh"))
		:! scripts/build.sh
	elseif !empty(glob("[mM]akefile"))
		:! make -j8
	elseif !empty(glob("build/[mM]akefile", 1))
		:! cd build && make -j8
	else
		if &filetype == "c"
			:! gcc -Wpedantic -o %:r %
		elseif &filetype == "cpp"
			:! g++ -Wpedantic -o %:r %
		elseif &filetype == "rust"
			:! cargo build
		elseif &filetype == "tex"
			:! pdflatex -halt-on-error -file-line-error %
		endif
	endif
endfunction

function! RunCmd()
	if !empty(glob("run.sh"))
		:! ./run.sh
	elseif !empty(glob("scripts/run.sh"))
		:! ./scripts/run.sh
	elseif &filetype == "c" || &filetype == "cpp"
		if !empty(glob("%:r"))
			:! ./%:r
		endif
	elseif &filetype == "rust"
		:! cargo run
	elseif &filetype == "python"
		let l:cmd = ""
		if !empty(glob("env/bin/activate", 1))
			if !empty(glob("main.py"))
				:! source env/bin/activate && ./main.py
			else
				:! source env/bin/activate && ./%
			endif
		elseif !empty(glob("main.py"))
			:! ./main.py
		else
			:! ./%
		endif
	endif
endfunction
