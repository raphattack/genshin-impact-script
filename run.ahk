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
	elemental := "mbutton"	; set to elemental key

  send {%elemental% down}
  sleep 3000
  send {%elemental% up}
}

fast_pickup() {
	loot := "f"	; set to loot key

  send, {wheeldown 1}%loot%
}

; toggle fast pickup
; change t to preferred toggle key
t::SetTimer, fast_pickup, % (i := !i) ? "100" : "off"

; toggle elemental sight
; change mbutton to preferred toggle key
mbutton::SetTimer, elemental_sight, % (i := !i) ? "100" : "off"

; hold to dash
$rbutton::
dash("rbutton")
return

; map a mouse button to a key
; xbutton1::k

; enable hold key for mouse buttons
; hold_key(xbutton1)