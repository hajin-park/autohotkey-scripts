#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetBatchLines, -1
SetControlDelay, -1
SetTitleMatchMode, 3
DetectHiddenText, On
DetectHiddenWindows, On
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Coordmode, Pixel, Client
Coordmode, Mouse, Client
WinGet, Growtopia, ID, Growtopia
WinActivate, ahk_id %Growtopia%
global Growtopia


PlaceBlocks() {
	ControlClick, X474 Y430, ahk_id %Growtopia%, , , , NA Pos
	sleep 100
	ControlClick, X445 Y430, ahk_id %Growtopia%, , , , NA Pos
}

BreakBlocks() {
	ControlSend, , {s Down}, ahk_id %Growtopia%
	Sleep 1500
	ControlSend, , {s Up}, ahk_id %Growtopia%
}

CollectDrops() {
	ControlSend, , {a Down}, ahk_id %Growtopia%
	Sleep 280
	ControlSend, , {a Up}, ahk_id %Growtopia%
	ControlSend, , {d Down}, ahk_id %Growtopia%
	Sleep 500
	ControlSend, , {d Up}, ahk_id %Growtopia%
}

AutoFarm() {
	loop {
		PlaceBlocks()
		BreakBlocks()
		CollectDrops()
		Sleep 50
	}
}


;============================================HOT-KEYS============================================
^z::AutoFarm()
^Esc::ExitApp
^x::Pause
;============================================HOT-KEYS============================================
