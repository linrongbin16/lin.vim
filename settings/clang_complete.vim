let g:clang_use_library=1

if has('mac')
  let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
  let g:clang_compilation_database='~/settings/global.clang_complete'
elseif has('unix')
  let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
  let g:clang_compilation_database='~/settings/global.clang_complete'
elseif has('win32') || has('win64')
  let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
  let g:clang_compilation_database='~/settings/global.clang_complete'
endif
