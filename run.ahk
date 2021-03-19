#IfWinActive Genshin Impact

loot := Func("auto_loot").Bind("f")                   ; set f to the key used to loot
elemental := Func("elemental_sight").Bind("mbutton")  ; set mbutton to the key used for elemental sight

/*
*  auto dash when holding right-click
*/
auto_dash() {
  while GetKeyState("rbutton", "p") then {
    click right
    sleep 1250
  }
}

/*
*  auto loot when toggle is on
*/
auto_loot(key) {
  send, % "{wheeldown 1}" . key
}

/*
*  enable hold functionality for mouse buttons
* 
*  key: the mouse button you want to enable hold 
*       functionality for
*/
hold_key(key) {
  key_down := !key_down
  if key_down
    sendinput {key down}
  else
    sendinput {key up}
  return
}

/*
*  hold elemental sight for 3s intervals when toggle is on
*/
elemental_sight(key) {
  send {%key% down}
  sleep 3000
  send {%key% up}
}

t::SetTimer, % loot, % (i := !i) ? "100" : "off"            ; set t to the key to toggle auto loot on/off
mbutton::SetTimer, % elemental, % (i := !i) ? "100" : "off" ; set mbutton to the key to toggle elemental sight on/off

$rbutton::  ; hold right-click to auto dash
auto_dash()
return

; xbutton1::k         ; map mouse button xbutton1 to key k
; hold_key(xbutton1)  ; enables hold functionality for mouse button xbutton1