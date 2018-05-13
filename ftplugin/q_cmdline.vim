" Ensure that plugin/vimcmdline.vim was sourced
if !exists("g:cmdline_job")
    runtime plugin/vimcmdline.vim
endif

function! QSourceLines(lines)
    call VimCmdLineSendCmd(join(add(a:lines, ''), b:cmdline_nl))
endfunction

let b:cmdline_nl = "\n"
let b:cmdline_app = "q"
let b:cmdline_quit_cmd = "\\\\"
let b:cmdline_source_fun = function("QSourceLines")
let b:cmdline_send_empty = 1
let b:cmdline_filetype = "q"

exe 'nmap <buffer><silent> ' . g:cmdline_map_start . ' :call VimCmdLineStartApp()<CR>'

call VimCmdLineSetApp("q")
