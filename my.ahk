#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; paceEnable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Comments.

/*
#   Win
!   Alt
^   Ctrl
+   Shift
*/

; Win+F to Open Everything.
#f::
    Run "C:\Program Files\Everything\Everything.exe" -maximized	-nonewwindow
    return

; Ctrl+Space to switch IME.
^Space::    #+Space
    return

; Ctrl+Alt+i to open files in editor.
^!i::
    clipboard_backup := clipboardall
    clipboard := ""
    Send ^c
    ClipWait, 1
    selectFiles := clipboard
    clipboard := clipboard_backup

    runArg := "-a"
    StringSplit, file_list, selectFiles, `r, `n
    Loop, %file_list0%
    {
        thisFile := file_list%a_index%
        if runArg =
        {
            runArg = "%thisFile%"
        } else {
            runArg = %runArg% "%thisFile%"
        }
    }

    Run "C:\Program Files\Microsoft VS Code\Code.exe" %runArg%
    return

; Ctrl+Alt+<Left>/<Right> to move window to left or right minitor, for dual monitor.
^!Left::    Send #+{Left}
^!Right::   Send #+{Right}
