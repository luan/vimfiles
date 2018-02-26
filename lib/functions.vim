" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Convert Ruby 1.8 hash rockets to 1.9 JSON style hashes.
" From: http://git.io/cxmJDw
" Note: Defaults to the entire file unless in visual mode.
" ---------------
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" ---------------
" Strip Trailing White Space
" ---------------
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let l:_s = getreg('/')
  let l:l = line('.')
  let l:c = col('.')
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  call setreg('/', l:_s)
  call cursor(l:l, l:c)
endfunction
"strip all trailing white space
command! StripTrailingWhiteSpace :call Preserve("%s/\\s\\+$//e")<CR>

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal! 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal! 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()

" ---------------
" Convert Ruby 1.8 hash rockets to 1.9 JSON style hashes.
" From: http://git.io/cxmJDw
" Note: Defaults to the entire file unless in visual mode.
" ---------------
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" ---------------
" Tests
" ---------------
function! RunTestFile(...)
  if a:0
    let l:command_suffix = a:1
  else
    let l:command_suffix = ''
  endif

  " Run the tests for the previously-marked file.
  let l:in_test_file = match(expand('%'), '\(.feature\|_spec.rb\|_test.go\|_test.js\|_spec.js\|.bats\|.test.js\|.spec.js\)$') != -1
  if l:in_test_file
    call RunTests(expand('%') . l:command_suffix)
  else
    call RunTests('')
  end
endfunction

function! RunNearestTest()
  let l:spec_line_number = line('.')
  let s:last_command = ':' . l:spec_line_number
  call RunTestFile(':' . l:spec_line_number)
endfunction

function! RunTests(filename)
  :wa

  if a:filename ==# ''
    call vipe#peek()
    return
  endif

  let l:command = ''

  if match(a:filename, '\.feature') != -1
    if filereadable('script/features')
      let l:command = 'script/features ' . a:filename
    elseif filereadable('Gemfile')
      let l:command = 'bundle exec cucumber ' . a:filename
    else
      let l:command = 'cucumber ' . a:filename
    end
  elseif match(a:filename, '_test\.go') != -1
    if filereadable('script/test')
      let l:command = 'script/test ' . fnamemodify(a:filename, ':h')
    elseif filereadable('scripts/test')
      let l:command = 'scripts/test ' . fnamemodify(a:filename, ':h')
    elseif filereadable('scripts/test-unit')
      let l:command = 'scripts/test-unit ' . fnamemodify(a:filename, ':h')
    else
      let l:command = 'ginkgo ' . fnamemodify(a:filename, ':h')
    end
  elseif match(a:filename, '_spec\.js') != -1
    if filereadable('package.json')
      let l:command = 'npm test ' . a:filename
    else
      let l:command = 'jasmine ' . a:filename
    end
  elseif match(a:filename, '\.bats') != -1
    let l:command = 'bats ' . a:filename
  else
    if filereadable('script/test')
      let l:command = 'script/test ' . a:filename
    elseif filereadable('scripts/test')
      let l:command = 'scripts/test ' . a:filename
    elseif (exists('g:force_bundle_exec') && g:force_bundle_exec == 1) || filereadable('Gemfile')
      let l:command = 'bundle exec rspec --color ' . a:filename
    else
      let l:command = 'rspec --color ' . a:filename
    end
  end

  call vipe#push(l:command)
endfunction
