; #IfWinActive Genshin Impact

hold_key(key) {
	key_down := !key_down
	if key_down
	    sendinput {key down}
	else
	    sendinput {key up}
	return
}

dash(key) {
	while GetKeyState(key, "p") then {
		click right
		sleep 1250
	}
}

; toggle fast pickup
#MaxThreadsPerHotkey 3
t::
#MaxThreadsPerHotkey 1
SetKeyDelay, 10, 30

if is_running {
    is_running := false
    return
}

is_running := true
loop {
    send, {wheeldown 1}f
    if not is_running
        break
}
is_running := false
return

; toggle elemental sight
#MaxThreadsPerHotkey 3
mbutton::
#MaxThreadsPerHotkey 1
if is_running {
    is_running := false
    return
}

is_running := true
loop {
    send {mbutton down}
	sleep 2000
	send {mbutton up}
    if not is_running
        break
}
is_running := false
return

; hold to dash
$rbutton::
dash("rbutton")
return

; map mouse button to e
; mbutton::e
; hold_key(mbutton)