global window_title := "Genshin Impact"
global loot := Func("auto_loot").Bind("f")                   ; set f to the key used to loot
global elemental := Func("elemental_sight").Bind("mbutton")  ; set mbutton to the key used for elemental sight

#if winactive(window_title)

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
  end_timer(loot)
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
  end_timer(elemental)
  send {%key% down}
  sleep 3000
  send {%key% up}
}

/*
*  ends the timer when switching windows
*
*  timer_name: the timer to end
*/
end_timer(timer_name) {
  if (!winactive(window_title)) {
      i := 0
      SetTimer, % timer_name, Off
      return
  }
}

t:: ; set t to the key to toggle auto loot on/off
  SetTimer, % loot, % (i := !i) ? "100" : "off"
  return

mbutton:: ; set mbutton to the key to toggle elemental sight on/off
  SetTimer, % elemental, % (i := !i) ? "100" : "off"
  return

$rbutton::  ; hold right-click to auto dash
  auto_dash()
  return

; xbutton1::  ; map xbutton1 to key k
;   k         
; hold_key(xbutton1)  ; enables hold functionality for mouse button xbutton1

#if