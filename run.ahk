#IfWinActive Genshin Impact

dash(key) {
  while GetKeyState(key, "p") then {
    click right
    sleep 1250
  }
}

hold_key(key) {
  key_down := !key_down
  if key_down
    sendinput {key down}
  else
    sendinput {key up}
  return
}

elemental_sight() {
  send {mbutton down}
  sleep 2000
  send {mbutton up}
}

fast_pickup() {
  send, {wheeldown 1}f
}

; toggle fast pickup
t::SetTimer, fast_pickup, % (i := !i) ? "1" : "off"

; toggle elemental sight
mbutton::SetTimer, elemental_sight, % (i := !i) ? "1" : "off"

; hold to dash
$rbutton::
dash("rbutton")
return

; map mouse button to e
; mbutton::e
; hold_key(mbutton)