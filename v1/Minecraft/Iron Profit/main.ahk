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
Coordmode, Pixel, Screen
Coordmode, Mouse, Screen

CraftDoor() {
	loop {
		Send {shift down}
		ImageSearch, FindX, FindY, 356, 317, 876, 651, %A_WorkingDir%\assets\iron_door.png
		if (ErrorLevel = 0) {
			Send {shift down}
			Click, %FindX%,  %FindY%
			sleep 200
		}
		ImageSearch, FindX, FindY, 1397, 320, 1495, 412, %A_WorkingDir%\assets\iron_door.png
		if (ErrorLevel = 0) {
			Send {shift down}
			Click, %FindX%,  %FindY%
			sleep 200
		}
		ImageSearch, FindX, FindY, 937, 516, 1607, 843, %A_WorkingDir%\assets\iron_ingot.png
		if (ErrorLevel != 0) {
			Send {shift up}
			break
		}
	}
}

SellDoor() {
	da
	sleep 100
	Send {g}
	sleep 500
	loop {
		ImageSearch, FindX, FindY, 772, 247, 1294, 556, %A_WorkingDir%\assets\redstone.png
		if (ErrorLevel = 0) {
			loop {
				Click, %FindX%,  %FindY%
				sleep 500
				ImageSearch, FindX, FindY, 645, 156, 1289, 589, %A_WorkingDir%\assets\iron_door.png
				if (ErrorLevel = 0) {
					loop {
						Click, %FindX%,  %FindY%
						sleep 200
						ImageSearch, FindX, FindY, 645, 156, 1289, 589, %A_WorkingDir%\assets\bucket.png
						if (ErrorLevel = 0) {
							loop {
							Click, %FindX%,  %FindY%
							sleep 200
							ImageSearch, FindXB, FindYB, 634, 595, 1300, 915, %A_WorkingDir%\assets\iron_door2.png
							if (ErrorLevel != 0)
								break
							}
						}
						ImageSearch, FindXB, FindYB, 634, 595, 1300, 915, %A_WorkingDir%\assets\iron_door2.png
						if (ErrorLevel != 0)
							break
					}
				}
				ImageSearch, FindXB, FindYB, 634, 595, 1300, 915, %A_WorkingDir%\assets\iron_door2.png
				if (ErrorLevel != 0)
					break
			}
		}
		ImageSearch, FindXB, FindYB, 634, 595, 1300, 915, %A_WorkingDir%\assets\iron_door2.png
		if (ErrorLevel != 0)
			break
	}
	Send {Escape}
}

Start() {
	loop {
		ImageSearch, FindX, FindY, 556, 315, 1039, 492, %A_WorkingDir%\assets\inventory.png
		if (ErrorLevel = 0) {
			loop{
				CraftDoor()
				ImageSearch, FindX, FindY, 937, 516, 1607, 843, %A_WorkingDir%\assets\iron_ingot.png
				if (ErrorLevel != 0) {
					SellDoor()
					break
				}
			}
		}
	}
}



^+s::Start()
^+p::Pause
^Esc::ExitApp