#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force

; Keyboard shortcuts Matrix
; (hash)                #    Windows logo key
; (exclamation mark)    !    ALT
; (caret)               ^    CTRL
; (plus)                +    Shift

;******************************************************************************
;								PoE Inv empty
;******************************************************************************

; What it does: Hold alt+^ to put all items from your inventory (except the first row to keep some maps and tp scrolls e.g.) to your stash
; Coordinates for the first inventory slot (Default Setting is for 4k, if you want for FullHD [1920x1080] uncomment the other x1, x3, y1, y3 values and comment the old ones
; For other resolutions you have to find out the exact coordinates yourself
;x1 := 1297
;y1 := 616
x1 := 2705
y1 := 1200

; Distance between slots
;x3 := 55
;y3 := 55

x3 := 105
y3 := 105

; Current inventory slot index
row := 0
col := 0

!^::
{
  x := x1 + ( x3 * col )
  y := y1 + ( y3 * row )
  MouseMove, %x%, %y%, 1
  Sleep 1
  Send, {Ctrl down}{LButton}{Ctrl up}
  
  If (row == 4) {
    row := -1
    col++
    
  }
  If (col == 11) {
	col := 0
  }
  row++
  return
}
Return