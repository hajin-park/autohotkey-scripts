;
; AutoHotkey Version: 2.x
; Language:       English
; Platform:       Windows 10
; Author:         Hajin Park <hajin1819@gmail.com>
;
; Script Function:
;	Automated Pal Cooldown Reset exploit
;

#Requires AutoHotkey v2.0
#Warn
#SingleInstance Force
DetectHiddenText "On"
DetectHiddenWindows "On"
SetControlDelay -1
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
CoordMode("Mouse", "Client")
CoordMode("Pixel", "Client")

Global ClientID := WinGetID("Pal")
Global clickX := 0
Global clickY := 0



Main(slot := 0) {
    Global

    Send("{Tab}")
    Sleep(100)
    Send("e")
    Sleep(100)
    MouseMove(0, 353, 200 + (slot * 100))
    Sleep(100)
    Send("r")
    Sleep(100)
    MouseClick("Left", 831, 717)
    Sleep(100)
    Send("{Space}")
    Sleep(100)
    Send("{Esc}")
    Sleep(100)
    Send("f")
    Sleep(100)
    Send("e")
}

; =========================================================================================
^Esc::ExitApp
~x::Pause
~1::Main(0)
~2::Main(1)
~4::Main(3)
~5::Main(4)