#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetBatchLines, -1
SetControlDelay, -1
SetTitleMatchMode, 2
DetectHiddenText, On
DetectHiddenWindows, On
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Coordmode, Pixel, Screen
Coordmode, Mouse, Screen
WinGet, MCD, ID, Minecraft Dungeons
WinActivate, ahk_id %MCD%
Global MCD

;GRAPHICS SETTINGS ON FASTEST, 1920x1080 FULLSCREEN MODE TO WORK

salvageitem() {
	;Check if new item is selected
	PixelSearch, FindX, FindY, 683, 252, 700, 300, 0xFFFFFF, , Fast RGB
	if (ErrorLevel != 0) {
		loop 3 {
			ControlSend, , {Left}, ahk_id %MCD%
			sleep 100
			PixelSearch, FindX, FindY, 683, 252, 700, 300, 0xFFFFFF, , Fast RGB
			if (ErrorLevel = 0)
				break
		}
	}
	
	PixelSearch, FindX, FindY, 683, 252, 700, 300, 0xFFFFFF, , Fast RGB
	if (ErrorLevel != 0) {
		loop 3 {
			ControlSend, , {Right}, ahk_id %MCD%
			sleep 100
			PixelSearch, FindX, FindY, 683, 252, 700, 300, 0xFFFFFF, , Fast RGB
			if (ErrorLevel = 0)
				break
		}
	}
	;Salvage item
	loop {
		PixelSearch, FindX, FindY, 1698, 588, 1826, 703, 0xFFFFFF, , Fast RGB
		if (ErrorLevel = 0)
			loop 2 {
				ControlClick, X%FindX% Y%FindY%, ahk_id %MCD%, , , , NA Pos D
				sleep 50
				ControlClick, X%FindX% Y%FindY%, ahk_id %MCD%, , , , NA Pos U
				sleep 50
				PixelSearch, X, Y, 1464, 628, 1689, 668, 0xEF1844, , Fast RGB
				if (ErrorLevel = 0)
					return
			}
		PixelSearch, X, Y, 1464, 628, 1689, 668, 0xEF1844, , Fast RGB
		if (ErrorLevel = 0)
			return
	}
}

checkitem() {
	ControlSend, , i, ahk_id %MCD%
	
	;Check for emerald image in inventory UI	
	loop {
		PixelSearch, FindX, FindY, 50, 50, 80, 90, 0x69DA49, , Fast RGB
		if (ErrorLevel = 0)
			break
	}
	;Check if item is unique
	PixelSearch, FindX, FindY, 696, 206, 710, 218, 0xFF7400, , Fast RGB
	if (ErrorLevel != 0)
		salvageitem()
	ControlSend, , {Escape}, ahk_id %MCD%
}

buyitem() {
	loop {
	;Check for healthbar
	
		PixelSearch, FindX, FindY, 900, 960, 1030, 1000, 0xAF2333, , Fast RGB
		if (ErrorLevel = 0)
			break 
	}
	
	loop {
	;Click on shopkeeper - Check for open shop menu - Buy Item
	
		ControlClick, X1230 Y630, ahk_id %MCD%, , , , NA Pos D
		sleep 50
		ControlClick, X1230 Y630, ahk_id %MCD%, , , , NA Pos U
		sleep 50
		PixelSearch, FindX, FindY, 1180, 830, 1330, 900, 0x3F8E4F, , Fast RGB
		if (ErrorLevel = 0) {
			ControlSend, , {Space Down}, ahk_id %MCD%
			break
		}
	}
	
	loop {
	;Release button once item has been bought	

		PixelSearch, FindX, FindY, 900, 915, 1030, 980, 0x3F8E4F, , Fast RGB 
		if (ErrorLevel = 0 ) {
			ControlSend, , {Space Up}, ahk_id %MCD%
			break
		}
	}
	return
}

autoshop() {
	;Loop to buy and sell items
	
	while True {
		buyitem()
		checkitem()
	}
}


^r::autoshop()
^x::ExitApp
^p::Pause
