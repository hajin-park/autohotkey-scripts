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
WinGet, VALORANTClient, ID, VALORANT
WinActivate, ahk_id %VALORANTClient%
global VALORANTClient


Move() {
	Random, randomSleep, 200, 1000
	ControlSend, ahk_parent, {a Down}, ahk_id %VALORANTClient%
	Sleep, 500
	ControlSend, ahk_parent, {a Up}, ahk_id %VALORANTClient%
	Sleep, 100
}

Shoot() {

}

AntiAFK() {
	Loop {
		Move()
	}
}


;============================================HOT-KEYS============================================
^Esc::ExitApp
^x::Pause
^s::AntiAFK()
;============================================HOT-KEYS============================================
