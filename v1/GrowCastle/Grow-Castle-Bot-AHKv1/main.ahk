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
WinGet, BlueStacks, ID, BlueStacks
WinActivate, ahk_id %BlueStacks%

 /*
 User PC setting
 BlueStacks 4
 1920 x 1080 Resolution
 Performance Legacy Mode
 OpenGL
 Dedicated GPU
 ASTC texture Disabled
 Grid layout - Instances per row: 2
 */

;============================================VARIABLE============================================
Permission := True
Failed :=  False
FindD := False
PCheck := 0
FindX1 := 0
FindX2 := 0
FindY1 := 0
FindY2 := 0
SearchX1 := 0
SearchX2 := 0
SearchY1 := 0
SearchY2 := 0
CheckLeft := 0
CheckRight := 0
UseAbilityX := 0
UseAbilityY := 0
ChosenMode := 0
TurretType := 0
GemTimer := 0
MimicX := 0
MimicY := 0
m := 0
a := 0
g := 0
w := 0
d := 0
h := 0
Global PCheck
Global TurretType
Global UseAbilityX
Global UseAbilityY
Global ChosenMode
Global GemTimer
Global BlueStacks
Global Failed
Global Permission
Global AltarOption
Global AdOption
Global GiftOption
Global MimicOption
Global SpendOption
Global WaveOption
Global WaveType
Global DragonOption
Global DragonType
Global ColonyOption
Global ColonyType
Global HellOption
Global HellDelay
Global CastleType
Global SpendInterval
Global StartOption
Global StopOption
Global GiftSolvedCount
Global AdCount
Global MimicCount
Global GemSpentCount
Global DragonCount
Global WaveCount
Global HellCount
Global ProgressBar
Global ProgressPercent
Global MimicX
Global MimicY
Global m
Global a
Global g
Global w
Global d
Global h
Global FindX1
Global FIndX2
Global FIndY1
Global FindY2
Global SearchX1
Global SearchX2
Global SearchY1
Global SearchY2
Global CheckLeft
Global CheckRight
Global FindD
;============================================VARIABLE============================================



;==============================================GUI==============================================
GUI, Add, Text, x190 y0 h435 0x5
GUI, Add, Text, x+109 y30 h330 0x5
GUI, Add, Text, x+109 y30 h330 0x5
GUI, Add, Text, x+109 y30 h330 0x5
GUI, Add, Text, x+109 y0 h360 0x5
GUI, Add, Text, x+109 y0 h360 0x5
GUI, Add, Text, x198 y30 w462 0x10
GUI, Add, Text, x198 y360 w762 0x10
GUI, Font, w1200 s15 cWhite
GUI, Add, Button , x208 y373 w365 h50 vStartOption gStartGame, Start
GUI, Add, Button, x+10 w365 h50 vStopOption gMenuReturn, Stop/Save
GUI, Font, cFF1F1F w1000 s12
GUI, Add, Radio, group x210 y50 vWaveOption, Wave
GUI, Add, Radio, x+47 vDragonOption, Dragon
GUI, Add, Radio, x+35 vColonyOption, Colony
GUI, Add, Radio, x+37 vHellOption, Hell
GUI, Font, cBlack w600 s8
GUI, Add, DropDownList, Choose1 x210 y80 w85 vWaveType, [NONE]|Replay Battle|Wave Battle
GUI, Add, DropDownList, Choose1 x+32 w85 vDragonType, [NONE]|Green|Black|Red|Sin|Legendary|Bone
GUI, Add, DropDownList, Choose1 x+32 w85 vColonyType, [NONE]|Earth|Hell|Orc|Infinity|Seasonal
GUI, Add, Edit, x+32 w85 vHellDelay, Delay/S
GUI, Add, DropDownList, Choose1 x675 y80 w85 vCastleType, [NONE]|Cannon|Minigun|Poison|Lightning|Ballista
GUI, Add, Edit, y+50 w85 vSpendInterval, Interval/R
GUI, Font, cCAF200 w600 s8
GUI, Add, CheckBox, x211 y9 Checked 1 vAltarOption, Activate Altar
GUI, Add, CheckBox, x+19 Checked 1 vGiftOption, Gift Bypass
GUI, Add, CheckBox, x+31 Checked 1 vAdOption, Watch Ads
GUI, Add, CheckBox, x+33 Checked 1 vMimicOption, Find Mimics
GUI, Font, w800 c05EEFF
GUI, Add, CheckBox, x+32 Checked 1 vSpendOption, Gems
GUI, Add, Text, x675 y58, Upgrade
GUI, Add, Text, x675 y+55 vSpendInt, 0
GUI, Font, s11 w1200 cWhite
GUI, Add, Text, x30 y40 vGiftSolvedCount, Gifts Solved: 0
GUI, Add, Text, x23  y+40 vAdCount, Ads Watched: 0
GUI, Add, Text, x15 y+40 vMimicCount, Mimics Looted: 0
GUI, Add, Text, x30 y+40 vGemSpentCount, Gems Spent: 0
GUI, Add, Text, x13 y+40 vDragonCount, Dragons Killed: 0
GUI, Add, Text, x14 y+40 vWaveCount, Waves Beaten: 0
GUI, Add, Text, x29 y+40 vHellCount, Hell Rounds: 0
GUI, Submit, Nohide 
GUI, Color, 333333
GUI +Border
GUI, Margin, 5 5
GUI, Show, W957 H433 X0 Y580, GrowCastle Bot #1
GUI, Reminder1:New
GUI, Reminder2:New
GUI, Reminder3:New
GUI, Reminder4:New
GUI, Reminder5:New
GUI, Reminder6:New
return
;==============================================GUI==============================================



;============================================FUNCTION============================================
MenuReturn() {
	Loop {
		if (AdOption = 1)
			WatchAd()
	
		ImageSearch, FindX, FindY, 256, 302, 698, 385, %A_WorkingDir%\assets\RoundExit.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
		}
		
		ImageSearch, FindX, FindY, 6, 498, 79, 573, %A_WorkingDir%\assets\GameSettings.png
		if (ErrorLevel = 0)
			Break
		
		ControlSend, , {Escape}, ahk_id %BlueStacks%
		Sleep, 200
	}
	return
}

SaveData() {
	MenuReturn()
	Loop {
		ImageSearch, FindX, FindY, 168, 506, 225, 564, %A_WorkingDir%\assets\GameCloud.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
		}
		
		ImageSearch, FindX, FindY, 576, 334, 629, 387, %A_WorkingDir%\assets\GameSave.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
		}
		
		ImageSearch, FindX, FindY, 514, 446, 640, 512, %A_WorkingDir%\assets\GameSaveConfirm.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
			
			ImageSearch, FindX, FindY, 153, 475, 429, 529, %A_WorkingDir%\assets\GameSaveComplete.png
			while (ErrorLevel != 0)
				ImageSearch, FindX, FindY, 153, 475, 429, 529,, %A_WorkingDir%\assets\GameSaveComplete.png	
			ControlSend, , {Escape}, ahk_id %BlueStacks%
			Break
		}
	}
	GuiControl, Text, StopOption, Game Saved
	return
}

WatchAd() {
	ImageSearch, FindX, FindY, 412, 474, 528, 537, %A_WorkingDIr%\assets\AdWatch.png
	if (ErrorLevel = 0) {
		ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
		Sleep, 1000

		ImageSearch, FindX, FindY, 6, 498, 79, 573, %A_WorkingDir%\assets\GameSettings.png
		while (ErrorLevel = 0) {
			ControlSend, , {Escape}, ahk_id %BlueStacks%
			Sleep, 1000
			ImageSearch, FindX, FindY, 6, 498, 79, 573, %A_WorkingDir%\assets\GameSettings.png
		}
		a += 1
		GuiControl, Text, AdCount, Ads Watched: %a%
	}
	return
}

FindMimic() {
	if (MimicOption = 1) { 
		PixelSearch, FindX, FindY, 489, 465, 949, 576, 0xCA5F8C, , Fast RGB
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , 2, NA Pos
			m += 1
			GuiControl, Text, MimicCount, Mimics Looted: %m%
		}
	}
	return
}

SpendGems() {
	if (SpendOption = 1) and (GemTimer = SpendInterval) {
		ControlClick, X285 Y382, ahk_id %BlueStacks%, , , , NA Pos
		Sleep, 100
		ControlClick, X286 Y243, ahk_id %BlueStacks%, , , , NA Pos
		Sleep, 100
		Click, WheelUp, 759, 364, 1
		Sleep, 3000
		
		Loop {
			ImageSearch, FindX, FindY, 586, 111, 800, 555, %A_WorkingDir%\assets\Turret%CastleType%.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				Sleep, 100
			}
			
			ImageSearch, FindX, FindY, 600, 359, 748, 432, %A_WorkingDir%\assets\TurretUpgrade.png
			if (ErrorLevel = 0) {
				ImageSearch, StopX, StopY, 44, 455, 540, 548, %A_WorkingDir%\assets\TurretUpgradeFinish.png
				while (ErrorLevel != 0) {
					ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
					g += 1
					GuiControl, Text, GemSpentCount, Gems Spent: %g%
					Sleep, 100
					ImageSearch, StopX, StopY, 44, 455, 540, 548, %A_WorkingDir%\assets\TurretUpgradeFinish.png
				}
				MenuReturn()
			}
			
			ImageSearch, FindX, FindY, 6, 498, 79, 573, %A_WorkingDir%\assets\GameSettings.png
			if (ErrorLevel = 0)
				Break
		}
		
		GemTimer := 0
		GuiControl, Text, SpendInt, %GemTimer%
	}
	
	else if  (SpendOption = 1) and (GemTimer < SpendInterval) {
		GemTimer += 1
		GuiControl, Text, SpendInt, %GemTimer%
	}
	
	else if  (SpendOption = 1) and (GemTimer > SpendInterval) {
		GemTimer -= 1
		GuiControl, Text, SpendInt, %GemTimer%
	}
	return
}

UseAltar() {
	if (AltarOption = 1) {
		PixelSearch, FindX, FindY, 68, 138, 118, 163, 0x54BCFF , , Fast RGB
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 5
			ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
		}
	}
}
	
UseSmithAbility() {
	PixelGetColor, health, 550, 100, Alt RGB
	if (health := "0x000000") {
		PixelSearch, FindX, FindY, 137, 145, 186, 161, 0x54BCFF, , Fast RGB
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 5
			ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
		}
	}
	return
}

UseManualAbility() {
	PixelGetColor, manualAbility, 50, 100, Alt RGB
	if (manualAbility := "0x717479") {
		Random, randomInt, 750, 900
		ControlClick, X%randomInt% Y400, ahk_id %BlueStacks%, , , , NA Pos
	}
	return
}
	
UseOrcAbility() {
	PixelSearch, FindX, FindY, 196, 74, 246, 88, 0x54BCFF, , Fast RGB
	if (ErrorLevel = 0) {
		UseAbilityX := FindX + 20
		UseAbilityY := FindY + 5
		ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
	}
	return
}

UseAbility() {
	PixelSearch, FindX, FindY, 197, 74, 366, 298, 0x54BCFF, , Fast RGB
	if (ErrorLevel = 0) {
		UseAbilityX := FindX + 20
		UseAbilityY := FindY + 5
		ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
	}
	UseManualAbility()
	UseSmithAbility()
	return
}

StartWaveMode() {
	if (WaveType = "Replay Battle") {
		Loop {
			ImageSearch, FindX, FindY, 700, 500, 816, 567, %A_WorkingDir%\assets\WaveReplay.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				Sleep, 100
			}
			
			ImageSearch, FindX, FindY, 597, 472, 918, 549, %A_WorkingDir%\assets\ConfirmWaveReplay.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			}
			
			PixelGetColor, ConfirmStart, 900, 85, RGB
			if (ConfirmStart ="0xFFFFFF")
				Break
		}
		
		UseOrcAbility()
		Sleep, 2000
		UseAltar()
	}
	
	else if (WaveType = "Wave Battle") {
		Loop {
			ImageSearch, FindX, FindY, 828, 515, 946, 567, %A_WorkingDir%\assets\WaveBattle.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				Sleep, 100
				ControlSend, , {Escape}, ahk_id %BlueStacks%
			}
			
			PixelGetColor, ConfirmStart, 900, 85, RGB
			if (ConfirmStart ="0xFFFFFF")
				Break
		}
	}
	return
}

PlayWaveMode() {
	Loop {
		MenuReturn()
		SpendGems()
		StartWaveMode()
		
		Loop {
			UseAbility()
			FindMimic()
		
			ImageSearch, FindX, FindY, 254, 176, 660, 304, %A_WorkingDir%\assets\WaveVictory.png
			if (ErrorLevel = 0) {
				w += 1
				GuiControl, Text, WaveCount, Waves Beaten: %w%
				Break
			}
			
			ImageSearch, FindX, FindY, 254, 176, 660, 304, %A_WorkingDir%\assets\WaveDefeat.png
			if (ErrorLevel = 0)
				Break
		}
		
		ImageSearch, FindX, FindY, 6, 498, 79, 573, %A_WorkingDir%\assets\GameSettings.png
		while (ErrorLevel = 0)
			ImageSearch, FindX, FindY, 6, 498, 79, 573, %A_WorkingDir%\assets\GameSettings.png
		
		if (AdOption = 1)
			Sleep, 2000
	}
}

DragonItem() {
	Loop {
		ImageSearch, FindX, FindY, 365, 380, 458, 457, %A_WorkingDir%\assets\BStone_Icon.png
		if (ErrorLevel = 0) {
			d += 1
			GuiControl, Text, DragonCount, Dragons Killed: %d%
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 200
			return
		}
		ImageSearch, FindX, FindY, 365, 380, 458, 457, %A_WorkingDir%\assets\AStone_Icon.png
		if (ErrorLevel = 0) {
			d += 1
			GuiControl, Text, DragonCount, Dragons Killed: %d%
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 200
			return
		}
		else {
			ImageSearch, FindX, FindY, 462, 386, 637, 461, %A_WorkingDir%\assets\GetItem_Icon.png
			if (ErrorLevel = 0) {
				d += 1
				GuiControl, Text, DragonCount, Dragons Killed: %d%
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				Sleep, 300
				return
			}
		}
		ImageSearch, FindX, FindY, 444, 462, 532, 547, %A_WorkingDir%\assets\GameTip.png
		if (ErrorLevel = 0)
			return
	}
	return
}

DragonMode() {
	SpendGems()
	Loop {
		ImageSearch, FindX, FindY, 421, 168, 490, 239, %A_WorkingDir%\assets\DragonStatue_Icon.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
		}
		ImageSearch, FindX, FindY,563, 96, 641, 515, %A_WorkingDir%\assets\%DragonType%Dragon_Icon.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 100
			if (DragonType = "Green") {
				ControlClick, X825 Y136, ahk_id %BlueStacks%, , , , NA Pos
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Black") {
				ControlClick, X825 Y211, ahk_id %BlueStacks%, , , , NA Pos
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Red") {
				ControlClick, X825 Y275, ahk_id %BlueStacks%, , , , NA Pos
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Sin") {
				ControlClick, X825 Y350, ahk_id %BlueStacks%, , , , NA Pos
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Legendary") {
				ControlClick, X825 Y420, ahk_id %BlueStacks%, , , , NA Pos
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Bone") {
				ControlClick, X825 Y490, ahk_id %BlueStacks%, , , , NA Pos
				if (GiftOption = 0)
					SolveGift()
				return
			}
		}
	}
	return
}

DragonAbility() {
	Sleep, 300
	if (AltarOption = 1)
		ControlClick, X90 Y200 , ahk_id %BlueStacks%, , , , NA Pos
	Loop {
		PixelSearch, FindX, FindY, 189, 64, 360, 297, 0x54BCFF, ,Fast RGB
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 4
			ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
		}
		PixelGetColor, ManualAbility, 30, 160, Alt RGB
		if (ManualAbility = "0x717479")
			ControlClick, X800 Y370, ahk_id %BlueStacks%, , , , NA Pos
		PixelGetColor, Smith, 520, 50, Alt RGB
		if (Smith = "0x000000")
			ControlClick, X150 Y139, ahk_id %BlueStacks%, , , , NA Pos
		ImageSearch, FindX, FindY, 461, 385, 631, 454, %A_WorkingDir%\assets\GetItem_Icon.png
		if (ErrorLevel = 0)
			Break
		ImageSearch, FindX, FindY, 444, 462, 532, 547, %A_WorkingDir%\assets\GameTip.png
		if (ErrorLevel = 0)
			return
	}
	return
}

PlayDragon() {
	Loop {
		MenuReturn()
		DragonMode()
		DragonAbility()
		DragonItem()
	}
}

ChooseColony() {
	if (ColonyType != "Seasonal") {
		Loop {
			ImageSearch, FIndX, FindY, 742, 246, 819, 407, %A_WorkingDir%\assets\ColonyMap_Icon.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				Sleep, 1000
			}
			ImageSearch, FIndX, FindY, 501, 33, 849, 120, %A_WorkingDir%\assets\%ColonyType%Colony_Icon.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				return
			}
		}
	}
	else if (ColonyType = "Seasonal") {
		Loop {
			ImageSearch, FIndX, FindY, 742, 246, 819, 407, %A_WorkingDir%\assets\SeasonColony_Icon.png
			if (ErrorLevel = 0) {
				ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
				return
			}
		}
	}
}

ColonyMode() {
	Loop {
		ImageSearch, FIndX, FIndY, 534, 327, 667, 403, %A_WorkingDir%\assets\ColonyBattle_Icon.png
		if (ErrorLevel = 0) {
			Sleep, 200
			ColonyAbility()
			return
		}
	}
}

ColonyAbility() {
	Loop {
		PixelSearch, FindX, FindY, 189, 64, 360, 297, 0x54BCFF, ,Fast RGB
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 4
			ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
		}
		PixelGetColor, ManualAbility, 30, 160, Alt RGB
		if (ManualAbility = "0x717479")
			ControlClick, X800 Y370, ahk_id %BlueStacks%, , , , NA Pos
		PixelGetColor, Heal, 595, 50, Alt RGB
		if (Heal = "0x000000")
			ControlClick, X90 Y200 , ahk_id %BlueStacks%, , , , NA Pos
		PixelGetColor, Smith, 520, 50, Alt RGB
		if (Smith = "0x000000")
			ControlClick, X150 Y139, ahk_id %BlueStacks%, , , , NA Pos
		ImageSearch, FindX, FindY, 287, 172, 619, 263, %A_WorkingDir%\assets\WaveVictory_Icon.png
		if (ErrorLevel = 0)
			return
		ImageSearch, FindX, FindY, 291, 160, 598, 271, %A_WorkingDir%\assets\ColonyDefeat_Icon.png
		if (ErrorLevel = 0)
			return
	}
}

PlayColony() {
	Loop {
		ColonyMode()
		ColonyAbility()
	}
}

HellMode() {
	ImageSearch, FindX, FindY, 444, 462, 532, 547, %A_WorkingDir%\assets\GameTip.png
	while (ErrorLevel != 0) {
		MenuReturn()
		ImageSearch, FindX, FindY, 444, 462, 532, 547, %A_WorkingDir%\assets\GameTip.png
		}
	SpendGems()
	Loop {
		ImageSearch, FindX, FIndY, 539, 462, 664, 542, %A_WorkingDir%\assets\Hell_Icon.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 500
		}
		ImageSearch, FindX, FIndY, 758, 438, 877, 526, %A_WorkingDir%\assets\ConfirmHell_Icon.png
		if (ErrorLevel = 0) {
			ControlClick, X%FindX% Y%FindY%, ahk_id %BlueStacks%, , , , NA Pos
			Sleep, 200
			if (GiftOption = 1)
				SolveGift()
			ControlSend, , {Escape}, ahk_id %BlueStacks%
			Loop %HellDelay% {
				Sleep, 1000
			}
			return
		}
	}
	return
}

HellAbility() {
	if (AltarOption = 1)
		ControlClick, X90 Y200 , ahk_id %BlueStacks%, , , , NA Pos
	Loop {	
		PixelSearch, FindX, FindY, 189, 64, 360, 297, 0x54BCFF, ,Fast RGB
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 4
			ControlClick, X%UseAbilityX% Y%UseAbilityY% , ahk_id %BlueStacks%, , , , NA Pos
		}
		PixelGetColor, ManualAbility, 30, 160, Alt RGB
		if (ManualAbility = "0x717479")
			ControlClick, X800 Y370, ahk_id %BlueStacks%, , , , NA Pos
		PixelGetColor, Smith, 520, 50, Alt RGB
		if (Smith = "0x000000")
			ControlClick, X150 Y139, ahk_id %BlueStacks%, , , , NA Pos
		if (MimicOption = 1)
			FindMimic()
		ImageSearch, FindX, FindY, 418, 96, 510, 205, %A_WorkingDir%\assets\HellEnd_Icon.png
		if (ErrorLevel = 0) {
			h += 1
			GuiControl, Text, HellCount, Hell Rounds: %h%
			return
		}
		ImageSearch, FindX, FindY, 786, 444, 911, 543, %A_WorkingDir%\assets\WaveBattle_Icon.png
		if (ErrorLevel = 0) {
			MenuReturn()
			return
		}
	}
}

PlayHell() {
	Loop {
		HellMode()
		HellAbility()
	}
}

GameReminder1() {
	GUI, Reminder3: Font, w800 s10
	GUI, Reminder3: Add, Button, w270 h50 gCloseReminder3, Multiple Modes Selected
	GUI, Reminder3: Color, cE30202
	GUI, Reminder3: Show, x245 y895 w290 h64, Warning
	GUI, Reminder3: +ToolWindow
	Failed := True
	return
}

GameReminder2() {
	GUI, Reminder2: Font, w800 s10
	GUI, Reminder2: Add, Button, w270 h50 gCloseReminder2, Select A Mode
	GUI, Reminder2: Color, cE30202
	GUI, Reminder2: Show, x245 y895 w290 h64, Warning
	GUI, Reminder2: +ToolWindow
	Failed := True
	return
}

GameReminder3() {
	GUI, Reminder4: Font, w800 s10
	GUI, Reminder4: Add, Button,w270 h50 gCloseReminder4, Missing Option
	GUI, Reminder4: Color, cE30202
	GUI, Reminder4: Show, x245 y895 w290 h64, Warning
	GUI, Reminder4: +ToolWindow
	Failed := True
	return
}

GameStateCheck() {
	if (Permission = False) {
		GUI, Reminder1: Font, w800 s10
		GUI, Reminder1: Add, Button, w270 h50 gCloseReminder1, Stop Current Game
		GUI, Reminder1: Color, cE30202
		GUI, Reminder1: Show, x245 y895 w290 h64, Warning
		GUI, Reminder1: +ToolWindow
		Failed := True
		return
	}
	if (Permission := True) {
		Failed := False
		return
	}
}

GameModeCheck() {
	if (WaveOption = 1) {
		ChosenMode := 1
		Failed := False
		return
	}
	if (DragonOption = 1) {
		ChosenMode := 2
		Failed := False
		return
	}
	if (ColonyOption = 1) {
		ChosenMode := 3
		Failed := False
		return
	}
	if (HellOption = 1) {
		ChosenMode := 4
		Failed := False
		return
	}
	else {
		GameReminder2()
		return
	}
	return
}

GameTypeCheck() {
	if (SpendOption = 1) {
		if (CastleType = "[NONE]") or (SpendInterval = "Interval/R") {
			GameReminder3()
		}
	}
	if (ChosenMode = 1) {
		if (WaveType = "[NONE]")
			GameReminder3()
	}
	if (ChosenMode = 2) {
		if (DragonType = "[NONE]")
			GameReminder3()
	}
	if (ChosenMode = 3) {
		if (ColonyType = "[NONE]")
			GameReminder3()
	}
	if (ChosenMode = 4) {
		if (HellDelay = "Delay/S") {
			GameReminder3()
		}
	}
}

ResetPermissions() {
	if (Failed = True)
		return
	else {
		Permission := False
		GuiControl,  Text, StartOption, Running
		GuiControl, Text, StopOption, Stop/Save
	}
}

GameStart() {
	if  (Failed = True)
		return
	else if (Failed = False) {
		if (ChosenMode = 1) {
			PlayWaveMode()
			return
		}
		if (ChosenMode = 2) {
			PlayDragon()
			return
		}
		if (ChosenMode = 3) {
			ChooseColony()
			PlayColony()
			return
		}
		if (ChosenMode = 4) {
			PlayHell()
			return
		}
	}
	return
}
;============================================FUNCTION============================================



;=============================================LABELS=============================================
FinishGift:
	FindD := true
	return

CloseReminder1:
	GUI, Reminder1: Hide
	return
CloseReminder2:
	GUI, Reminder2: Hide
	return
CloseReminder3:
	GUI, Reminder3: Hide
	return
CloseReminder4:
	GUI, Reminder4: Hide
	return
CloseReminder5:
	GUI, Reminder5: Hide
	return
CloseReminder6:
	GUI, Reminder6: Hide
	return

StartGame:
	GUI, Submit, Nohide 
	GameStateCheck()
	GameModeCheck()
	GameTypeCheck()
	ResetPermissions()
	GameStart()
	return
	
StopGame:
	GuiControl,  Text, StartOption, Start
	GuiControl, Text, StopOption, ...Saving...
	SaveData()
	Exit
	
GuiClose:
	ExitApp
;=============================================LABELS=============================================



;============================================HOT-KEYS============================================
^Esc::ExitApp
^x::Pause
;============================================HOT-KEYS============================================

SolveGift() {
	if (GiftOption = 1) {
		
	}
}
