;
; AutoHotkey Version: 2.x
; Language:       English
; Platform:       Windows 10
; Author:         Hajin Park <hajin1819@gmail.com>
;
; Script Function:
;	Autocraft iron door script
;

#Warn
#SingleInstance Force
DetectHiddenText "On"
DetectHiddenWindows "On"
SetControlDelay -1
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.


CraftDoor()
{
	loop
	{
		if ImageSearch(FindX, FindY, 356, 317, 876, 651, "assets\iron_door.png")
		{
			Send("{Shift down}")
			Click(FindX,  FindY)
			sleep(200)
		}

		if ImageSearch(FindX, FindY, 1397, 320, 1495, 412, "assets\iron_door.png")
		{
			Send("{Shift down}")
			Click(FindX, FindY)
			Sleep(200)
		}
	} until ImageSearch(FindX, FindY, 937, 516, 1607, 843, "assets\iron_ingot.png")
	Send("{Shift up}")
}

SellDoor()
{
	Sleep(100)
	Send("{g}")
	Sleep(500)

	loop 
	{
		if ImageSearch(FindX, FindY, 772, 247, 1294, 556, "assets\redstone.png")
		{
			loop
			{
				Click(FindX, FindY)
				Sleep(500)

				if ImageSearch(FindX, FindY, 645, 156, 1289, 589, "assets\iron_door.png")
				{
					loop
					{
						Click(FindX, FindY)
						Sleep(200)
						if ImageSearch(FindX, FindY, 645, 156, 1289, 589, "assets\bucket.png")
						{
							loop
							{
							Click(FindX, FindY)
							Sleep(200)
							} until ImageSearch(FindXB, FindYB, 634, 595, 1300, 915, "assets\iron_door2.png")
						}
					} until ImageSearch(FindXB, FindYB, 634, 595, 1300, 915, "assets\iron_door2.png")
				}
			} until ImageSearch(FindXB, FindYB, 634, 595, 1300, 915, "assets\iron_door2.png")
		}
	} until ImageSearch(FindXB, FindYB, 634, 595, 1300, 915, "assets\iron_door2.png")
	Send("{Escape}")
}

Start()
{
	loop
	{
		if ImageSearch(FindX, FindY, 556, 315, 1039, 492, "assets\inventory.png")
		{
			loop
			{
				CraftDoor()
			}
		} until ImageSearch(FindX, FindY, 937, 516, 1607, 843, "assets\iron_ingot.png")
	}
	SellDoor()
}



^+s::Start()
^+p::Pause
^Esc::ExitApp
