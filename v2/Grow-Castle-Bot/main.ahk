#SingleInstance Force
#Warn
SetControlDelay(-1)
SetTitleMatchMode(3)
DetectHiddenText(true)
DetectHiddenWindows(true)
SendMode("Input")
SetWorkingDir(A_ScriptDir)
CoordMode("Pixel", "Client")
CoordMode("Mouse", "Client")
BlueStacks := WinGetID("BlueStacks")
WinActivate("ahk_id " BlueStacks)

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
myGui := Gui()
myGui.OnEvent("Close", GuiClose)
myGui.Add("Text", "x190 y0 h435 0x5")
myGui.Add("Text", "x+109 y30 h330 0x5")
myGui.Add("Text", "x+109 y30 h330 0x5")
myGui.Add("Text", "x+109 y30 h330 0x5")
myGui.Add("Text", "x+109 y0 h360 0x5")
myGui.Add("Text", "x+109 y0 h360 0x5")
myGui.Add("Text", "x198 y30 w462 0x10")
myGui.Add("Text", "x198 y360 w762 0x10")
myGui.SetFont("w1200 s15 cWhite")
ogcButtonStartOption := myGui.Add("Button", "x208 y373 w365 h50 vStartOption", "Start")
ogcButtonStartOption.OnEvent("Click", StartGame.Bind("Normal"))
ogcButtonStopOption := myGui.Add("Button", "x+10 w365 h50 vStopOption  Stop/Save")
ogcButtonStopOption.OnEvent("Click", MenuReturn.Bind("Normal"))
myGui.SetFont("cFF1F1F w1000 s12")
ogcRadioWaveOption := myGui.Add("Radio", "x210 y50 vWaveOption", "Wave")
ogcRadioWaveOption.OnEvent("Click", WaveOption.Bind("Normal"))
ogcRadioDragonOption := myGui.Add("Radio", "x+47 vDragonOption", "Dragon")
ogcRadioColonyOption := myGui.Add("Radio", "x+35 vColonyOption", "Colony")
ogcRadioHellOption := myGui.Add("Radio", "x+37 vHellOption", "Hell")
myGui.SetFont("cBlack w600 s8")
ogcDropDownListWaveType := myGui.Add("DropDownList", "Choose1 x210 y80 w85 vWaveType", ["[NONE]", "Replay Battle", "Wave Battle"])
ogcDropDownListDragonType := myGui.Add("DropDownList", "Choose1 x+32 w85 vDragonType", ["[NONE]", "Green", "Black", "Red", "Sin", "Legendary", "Bone"])
ogcDropDownListColonyType := myGui.Add("DropDownList", "Choose1 x+32 w85 vColonyType", ["[NONE]", "Earth", "Hell", "Orc", "Infinity", "Seasonal"])
ogcEditHellDelay := myGui.Add("Edit", "x+32 w85 vHellDelay", "Delay/S")
ogcDropDownListCastleType := myGui.Add("DropDownList", "Choose1 x675 y80 w85 vCastleType", ["[NONE]", "Cannon", "Minigun", "Poison", "Lightning", "Ballista"])
ogcEditSpendInterval := myGui.Add("Edit", "y+50 w85 vSpendInterval", "Interval/R")
myGui.SetFont("cCAF200 w600 s8")
ogcCheckBoxAltarOption := myGui.Add("CheckBox", "x211 y9 Checked 1 vAltarOption", "Activate Altar")
ogcCheckBoxGiftOption := myGui.Add("CheckBox", "x+19 Checked 1 vGiftOption", "Gift Bypass")
ogcCheckBoxAdOption := myGui.Add("CheckBox", "x+31 Checked 1 vAdOption", "Watch Ads")
ogcCheckBoxMimicOption := myGui.Add("CheckBox", "x+33 Checked 1 vMimicOption", "Find Mimics")
myGui.SetFont("w800 c05EEFF")
ogcCheckBoxSpendOption := myGui.Add("CheckBox", "x+32 Checked 1 vSpendOption", "Gems")
myGui.Add("Text", "x675 y58", "Upgrade")
ogcTextSpendInt := myGui.Add("Text", "x675 y+55 vSpendInt", "0")
myGui.SetFont("s11 w1200 cWhite")
ogcTextGiftSolvedCount := myGui.Add("Text", "x30 y40 vGiftSolvedCount", "Gifts Solved: 0")
ogcTextAdCount := myGui.Add("Text", "x23  y+40 vAdCount", "Ads Watched: 0")
ogcTextMimicCount := myGui.Add("Text", "x15 y+40 vMimicCount", "Mimics Looted: 0")
ogcTextGemSpentCount := myGui.Add("Text", "x30 y+40 vGemSpentCount", "Gems Spent: 0")
ogcTextDragonCount := myGui.Add("Text", "x13 y+40 vDragonCount", "Dragons Killed: 0")
ogcTextWaveCount := myGui.Add("Text", "x14 y+40 vWaveCount", "Waves Beaten: 0")
ogcTextHellCount := myGui.Add("Text", "x29 y+40 vHellCount", "Hell Rounds: 0")
oSaved := myGui.Submit("0")
WaveOption := oSaved.WaveOption
DragonOption := oSaved.DragonOption
ColonyOption := oSaved.ColonyOption
HellOption := oSaved.HellOption
WaveType := oSaved.WaveType
DragonType := oSaved.DragonType
ColonyType := oSaved.ColonyType
HellDelay := oSaved.HellDelay
CastleType := oSaved.CastleType
SpendInterval := oSaved.SpendInterval
AltarOption := oSaved.AltarOption
GiftOption := oSaved.GiftOption
AdOption := oSaved.AdOption
MimicOption := oSaved.MimicOption
SpendOption := oSaved.SpendOption
myGui.BackColor := "333333"
myGui.Opt("+Border")
myGui.MarginX := "5 5", myGui.MarginY := ""
myGui.Title := "GrowCastle Bot #1"
myGui.Show("W957 H433 X0 Y580")
Reminder1 := Gui()
Reminder1.New()
Reminder2 := Gui()
Reminder2.New()
Reminder3 := Gui()
Reminder3.New()
Reminder4 := Gui()
Reminder4.New()
Reminder5 := Gui()
Reminder5.New()
Reminder6 := Gui()
Reminder6.New()
;==============================================GUI==============================================



;============================================FUNCTION============================================
MenuReturn() { 
	Global
	Loop{
		if (AdOption = 1)
			WatchAd()
	
		ErrorLevel := !ImageSearch(&FindX, &FindY, 256, 302, 698, 385, A_WorkingDir "\assets\RoundExit.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
		}
		
		ErrorLevel := !ImageSearch(&FindX, &FindY, 6, 498, 79, 573, A_WorkingDir "\assets\GameSettings.png")
		if (ErrorLevel = 0)
			Break
		
		ControlSend("{Escape}", , "ahk_id " BlueStacks)
		Sleep(200)
	}
}

SaveData() { 
	Global
	MenuReturn()
	Loop{
		ErrorLevel := !ImageSearch(&FindX, &FindY, 168, 506, 225, 564, A_WorkingDir "\assets\GameCloud.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
		}
		
		ErrorLevel := !ImageSearch(&FindX, &FindY, 576, 334, 629, 387, A_WorkingDir "\assets\GameSave.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
		}
		
		ErrorLevel := !ImageSearch(&FindX, &FindY, 514, 446, 640, 512, A_WorkingDir "\assets\GameSaveConfirm.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
			
			ErrorLevel := !ImageSearch(&FindX, &FindY, 153, 475, 429, 529, A_WorkingDir "\assets\GameSaveComplete.png")
			while (ErrorLevel != 0)
				ErrorLevel := !ImageSearch(&FindX, &FindY, 153, 475, 429, 529, ", " A_WorkingDir "\assets\GameSaveComplete.png")
			ControlSend("{Escape}", , "ahk_id " BlueStacks)
			Break
		}
	}
	ogcButtonStopOption.Text := "Game Saved"
}

WatchAd() { 
	Global
	ErrorLevel := !ImageSearch(&FindX, &FindY, 412, 474, 528, 537, A_WorkingDIr "\assets\AdWatch.png")
	if (ErrorLevel = 0) {
		ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
		Sleep(1000)

		ErrorLevel := !ImageSearch(&FindX, &FindY, 6, 498, 79, 573, A_WorkingDir "\assets\GameSettings.png")
		while (ErrorLevel = 0) {
			ControlSend("{Escape}", , "ahk_id " BlueStacks)
			Sleep(1000)
			ErrorLevel := !ImageSearch(&FindX, &FindY, 6, 498, 79, 573, A_WorkingDir "\assets\GameSettings.png")
		}
		a += 1
		ogcTextAdCount.Text := "Ads Watched: " a
	}
}

FindMimic() { 
	Global
	if (MimicOption = 1) { 
		ErrorLevel := !PixelSearch(&FindX, &FindY, 489, 465, 949, 576, 0xCA5F8C)
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , 2, "NA Pos")
			m += 1
			ogcTextMimicCount.Text := "Mimics Looted: " m
		}
	}
}

SpendGems() { 
	Global
	if (SpendOption = 1) and (GemTimer = SpendInterval) {
		ControlClick("X285 Y382", "ahk_id " BlueStacks, , , , "NA Pos")
		Sleep(100)
		ControlClick("X286 Y243", "ahk_id " BlueStacks, , , , "NA Pos")
		Sleep(100)
		Click("WheelUp, 759, 364, 1")
		Sleep(3000)
		
		Loop{
			ErrorLevel := !ImageSearch(&FindX, &FindY, 586, 111, 800, 555, A_WorkingDir "\assets\Turret" CastleType ".png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				Sleep(100)
			}
			
			ErrorLevel := !ImageSearch(&FindX, &FindY, 600, 359, 748, 432, A_WorkingDir "\assets\TurretUpgrade.png")
			if (ErrorLevel = 0) {
				ErrorLevel := !ImageSearch(&StopX, &StopY, 44, 455, 540, 548, A_WorkingDir "\assets\TurretUpgradeFinish.png")
				while (ErrorLevel != 0) {
					ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
					g += 1
					ogcTextGemSpentCount.Text := "Gems Spent: " g
					Sleep(100)
					ErrorLevel := !ImageSearch(&StopX, &StopY, 44, 455, 540, 548, A_WorkingDir "\assets\TurretUpgradeFinish.png")
				}
				MenuReturn()
			}
			
			ErrorLevel := !ImageSearch(&FindX, &FindY, 6, 498, 79, 573, A_WorkingDir "\assets\GameSettings.png")
			if (ErrorLevel = 0)
				Break
		}
		
		GemTimer := 0
		ogcTextSpendInt.Text := GemTimer
	}
	
	else if (SpendOption = 1) and (GemTimer < SpendInterval) {
		GemTimer += 1
		ogcTextSpendInt.Text := GemTimer
	}
	
	else if (SpendOption = 1) and (GemTimer > SpendInterval) {
		GemTimer -= 1
		ogcTextSpendInt.Text := GemTimer
	}
}

UseAltar() { 
	Global
	if (AltarOption = 1) {
		ErrorLevel := !PixelSearch(&FindX, &FindY, 68, 138, 118, 163, 0x54BCFF)
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 5
			ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
		}
	}
}
	
UseSmithAbility() { 
	Global
	health := PixelGetColor(550, 100, "Alt RGB")
	if (health := "0x000000") {
		ErrorLevel := !PixelSearch(&FindX, &FindY, 137, 145, 186, 161, 0x54BCFF)
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 5
			ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
		}
	}
	return
}

UseManualAbility() { 
	Global
	manualAbility := PixelGetColor(50, 100, "Alt RGB")
	if (manualAbility := "0x717479") {
		randomInt := Random(750, 900)
		ControlClick("X" randomInt " Y400", "ahk_id " BlueStacks, , , , "NA Pos")
	}
	return
}
	
UseOrcAbility() { 
	Global
	ErrorLevel := !PixelSearch(&FindX, &FindY, 196, 74, 246, 88, 0x54BCFF)
	if (ErrorLevel = 0) {
		UseAbilityX := FindX + 20
		UseAbilityY := FindY + 5
		ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
	}
	return
}

UseAbility() { 
	Global
	ErrorLevel := !PixelSearch(&FindX, &FindY, 197, 74, 366, 298, 0x54BCFF)
	if (ErrorLevel = 0) {
		UseAbilityX := FindX + 20
		UseAbilityY := FindY + 5
		ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
	}
	UseManualAbility()
	UseSmithAbility()
	return
}

StartWaveMode() { 
	Global
	if (WaveType = "Replay Battle") {
		Loop{
			ErrorLevel := !ImageSearch(&FindX, &FindY, 700, 500, 816, 567, A_WorkingDir "\assets\WaveReplay.png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				Sleep(100)
			}
			
			ErrorLevel := !ImageSearch(&FindX, &FindY, 597, 472, 918, 549, A_WorkingDir "\assets\ConfirmWaveReplay.png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			}
			
			ConfirmStart := PixelGetColor(900, 85, "RGB")
			if (ConfirmStart ="0xFFFFFF")
				Break
		}
		
		UseOrcAbility()
		Sleep(2000)
		UseAltar()
	}
	
	else if (WaveType = "Wave Battle") {
		Loop{
			ErrorLevel := !ImageSearch(&FindX, &FindY, 828, 515, 946, 567, A_WorkingDir "\assets\WaveBattle.png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				Sleep(100)
				ControlSend("{Escape}", , "ahk_id " BlueStacks)
			}
			
			ConfirmStart := PixelGetColor(900, 85, "RGB")
			if (ConfirmStart ="0xFFFFFF")
				Break
		}
	}
}

PlayWaveMode() { 
	Global
	Loop{
		MenuReturn()
		SpendGems()
		StartWaveMode()
		
		Loop{
			UseAbility()
			FindMimic()
		
			ErrorLevel := !ImageSearch(&FindX, &FindY, 254, 176, 660, 304, A_WorkingDir "\assets\WaveVictory.png")
			if (ErrorLevel = 0) {
				w += 1
				ogcTextWaveCount.Text := "Waves Beaten: " w
				Break
			}
			
			ErrorLevel := !ImageSearch(&FindX, &FindY, 254, 176, 660, 304, A_WorkingDir "\assets\WaveDefeat.png")
			if (ErrorLevel = 0)
				Break
		}
		
		ErrorLevel := !ImageSearch(&FindX, &FindY, 6, 498, 79, 573, A_WorkingDir "\assets\GameSettings.png")
		while (ErrorLevel = 0)
			ErrorLevel := !ImageSearch(&FindX, &FindY, 6, 498, 79, 573, A_WorkingDir "\assets\GameSettings.png")
		
		if (AdOption = 1)
			Sleep(2000)
	}
}

DragonItem() { 
	Global
	Loop{
		ErrorLevel := !ImageSearch(&FindX, &FindY, 365, 380, 458, 457, A_WorkingDir "\assets\BStone_Icon.png")
		if (ErrorLevel = 0) {
			d += 1
			ogcTextDragonCount.Text := "Dragons Killed: " d
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(200)
			return
		}
		ErrorLevel := !ImageSearch(&FindX, &FindY, 365, 380, 458, 457, A_WorkingDir "\assets\AStone_Icon.png")
		if (ErrorLevel = 0) {
			d += 1
			ogcTextDragonCount.Text := "Dragons Killed: " d
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(200)
			return
		}
		else {
			ErrorLevel := !ImageSearch(&FindX, &FindY, 462, 386, 637, 461, A_WorkingDir "\assets\GetItem_Icon.png")
			if (ErrorLevel = 0) {
				d += 1
				ogcTextDragonCount.Text := "Dragons Killed: " d
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				Sleep(300)
				return
			}
		}
		ErrorLevel := !ImageSearch(&FindX, &FindY, 444, 462, 532, 547, A_WorkingDir "\assets\GameTip.png")
		if (ErrorLevel = 0)
			return
	}
}

DragonMode() { 
	Global
	SpendGems()
	Loop{
		ErrorLevel := !ImageSearch(&FindX, &FindY, 421, 168, 490, 239, A_WorkingDir "\assets\DragonStatue_Icon.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
		}
		ErrorLevel := !ImageSearch(&FindX, &FindY, 563, 96, 641, 515, A_WorkingDir "\assets\" DragonType "Dragon_Icon.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(100)
			if (DragonType = "Green") {
				ControlClick("X825 Y136", "ahk_id " BlueStacks, , , , "NA Pos")
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Black") {
				ControlClick("X825 Y211", "ahk_id " BlueStacks, , , , "NA Pos")
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Red") {
				ControlClick("X825 Y275", "ahk_id " BlueStacks, , , , "NA Pos")
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Sin") {
				ControlClick("X825 Y350", "ahk_id " BlueStacks, , , , "NA Pos")
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Legendary") {
				ControlClick("X825 Y420", "ahk_id " BlueStacks, , , , "NA Pos")
				if (GiftOption = 0)
					SolveGift()
				return
			}
			else if (DragonType = "Bone") {
				ControlClick("X825 Y490", "ahk_id " BlueStacks, , , , "NA Pos")
				if (GiftOption = 0)
					SolveGift()
				return
			}
		}
	}
}

DragonAbility() { 
	Global
	Sleep(300)
	if (AltarOption = 1)
		ControlClick("X90 Y200", "ahk_id " BlueStacks, , , , "NA Pos")
	Loop{
		ErrorLevel := !PixelSearch(&FindX, &FindY, 189, 64, 360, 297, 0x54BCFF)
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 4
			ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
		}
		ManualAbility := PixelGetColor(30, 160, "Alt RGB")
		if (ManualAbility = "0x717479")
			ControlClick("X800 Y370", "ahk_id " BlueStacks, , , , "NA Pos")
		Smith := PixelGetColor(520, 50, "Alt RGB")
		if (Smith = "0x000000")
			ControlClick("X150 Y139", "ahk_id " BlueStacks, , , , "NA Pos")
		ErrorLevel := !ImageSearch(&FindX, &FindY, 461, 385, 631, 454, A_WorkingDir "\assets\GetItem_Icon.png")
		if (ErrorLevel = 0)
			Break
		ErrorLevel := !ImageSearch(&FindX, &FindY, 444, 462, 532, 547, A_WorkingDir "\assets\GameTip.png")
		if (ErrorLevel = 0)
			return
	}
}

PlayDragon() { 
	Global
	Loop{
		MenuReturn()
		DragonMode()
		DragonAbility()
		DragonItem()
	}
}

ChooseColony() { 
	Global
	if (ColonyType != "Seasonal") {
		Loop{
			ErrorLevel := !ImageSearch(&FIndX, &FindY, 742, 246, 819, 407, A_WorkingDir "\assets\ColonyMap_Icon.png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				Sleep(1000)
			}
			ErrorLevel := !ImageSearch(&FIndX, &FindY, 501, 33, 849, 120, A_WorkingDir "\assets\" ColonyType "Colony_Icon.png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				return
			}
		}
	}
	else if (ColonyType = "Seasonal") {
		Loop{
			ErrorLevel := !ImageSearch(&FIndX, &FindY, 742, 246, 819, 407, A_WorkingDir "\assets\SeasonColony_Icon.png")
			if (ErrorLevel = 0) {
				ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
				return
			}
		}
	}
}

ColonyMode() { 
	Global
	Loop{
		ErrorLevel := !ImageSearch(&FIndX, &FIndY, 534, 327, 667, 403, A_WorkingDir "\assets\ColonyBattle_Icon.png")
		if (ErrorLevel = 0) {
			Sleep(200)
			ColonyAbility()
			return
		}
	}
}

ColonyAbility() { 
	Global
	Loop{
		ErrorLevel := !PixelSearch(&FindX, &FindY, 189, 64, 360, 297, 0x54BCFF)
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 4
			ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
		}
		ManualAbility := PixelGetColor(30, 160, "Alt RGB")
		if (ManualAbility = "0x717479")
			ControlClick("X800 Y370", "ahk_id " BlueStacks, , , , "NA Pos")
		Heal := PixelGetColor(595, 50, "Alt RGB")
		if (Heal = "0x000000")
			ControlClick("X90 Y200", "ahk_id " BlueStacks, , , , "NA Pos")
		Smith := PixelGetColor(520, 50, "Alt RGB")
		if (Smith = "0x000000")
			ControlClick("X150 Y139", "ahk_id " BlueStacks, , , , "NA Pos")
		ErrorLevel := !ImageSearch(&FindX, &FindY, 287, 172, 619, 263, A_WorkingDir "\assets\WaveVictory_Icon.png")
		if (ErrorLevel = 0)
			return
		ErrorLevel := !ImageSearch(&FindX, &FindY, 291, 160, 598, 271, A_WorkingDir "\assets\ColonyDefeat_Icon.png")
		if (ErrorLevel = 0)
			return
	}
}

PlayColony() { 
	Global
	Loop{
		ColonyMode()
		ColonyAbility()
	}
}

HellMode() { 
	Global
	ErrorLevel := !ImageSearch(&FindX, &FindY, 444, 462, 532, 547, A_WorkingDir "\assets\GameTip.png")
	while (ErrorLevel != 0) {
		MenuReturn()
		ErrorLevel := !ImageSearch(&FindX, &FindY, 444, 462, 532, 547, A_WorkingDir "\assets\GameTip.png")
		}
	SpendGems()
	Loop{
		ErrorLevel := !ImageSearch(&FindX, &FIndY, 539, 462, 664, 542, A_WorkingDir "\assets\Hell_Icon.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(500)
		}
		ErrorLevel := !ImageSearch(&FindX, &FIndY, 758, 438, 877, 526, A_WorkingDir "\assets\ConfirmHell_Icon.png")
		if (ErrorLevel = 0) {
			ControlClick("X" FindX " Y" FindY, "ahk_id " BlueStacks, , , , "NA Pos")
			Sleep(200)
			if (GiftOption = 1)
				SolveGift()
			ControlSend("{Escape}", , "ahk_id " BlueStacks)
			Loop HellDelay {
				Sleep(1000)
			}
			return
		}
	}
}

HellAbility() { 
	Global
	if (AltarOption = 1)
		ControlClick("X90 Y200", "ahk_id " BlueStacks, , , , "NA Pos")
	Loop{
		ErrorLevel := !PixelSearch(&FindX, &FindY, 189, 64, 360, 297, 0x54BCFF)
		if (ErrorLevel = 0) {
			UseAbilityX := FindX + 20
			UseAbilityY := FindY + 4
			ControlClick("X" UseAbilityX " Y" UseAbilityY, "ahk_id " BlueStacks, , , , "NA Pos")
		}
		ManualAbility := PixelGetColor(30, 160, "Alt RGB")
		if (ManualAbility = "0x717479")
			ControlClick("X800 Y370", "ahk_id " BlueStacks, , , , "NA Pos")
		Smith := PixelGetColor(520, 50, "Alt RGB")
		if (Smith = "0x000000")
			ControlClick("X150 Y139", "ahk_id " BlueStacks, , , , "NA Pos")
		if (MimicOption = 1)
			FindMimic()
		ErrorLevel := !ImageSearch(&FindX, &FindY, 418, 96, 510, 205, A_WorkingDir "\assets\HellEnd_Icon.png")
		if (ErrorLevel = 0) {
			h += 1
			ogcTextHellCount.Text := "Hell Rounds: " h
			return
		}
		ErrorLevel := !ImageSearch(&FindX, &FindY, 786, 444, 911, 543, A_WorkingDir "\assets\WaveBattle_Icon.png")
		if (ErrorLevel = 0) {
			MenuReturn()
			return
		}
	}
}

PlayHell() { 
	Global
	Loop{
		HellMode()
		HellAbility()
	}
}

GameReminder1() { 
	Global
	Reminder3.Font("w800 s10")
	Reminder3.Add("Button", "w270 h50", "Multiple Modes Selected").OnEvent("Change", CloseReminder3.Bind("Change"))
	Reminder3.Color("cE30202")
	Reminder3.Show("x245 y895 w290 h64", "Warning")
	Reminder3.Opt("+ToolWindow")
	Failed := True
}

GameReminder2() { 
	Global
	Reminder2.Font("w800 s10")
	Reminder2.Add("Button", "w270 h50", "Select A Mode").OnEvent("Change", CloseReminder2.Bind("Change"))
	Reminder2.Color("cE30202")
	Reminder2.Show("x245 y895 w290 h64", "Warning")
	Reminder2.Opt("+ToolWindow")
	Failed := True
}

GameReminder3() { 
	Global
	Reminder4.Font("w800 s10")
	Reminder4.Add("Button", "w270 h50", "Missing Option").OnEvent("Change", CloseReminder4.Bind("Change"))
	Reminder4.Color("cE30202")
	Reminder4.Show("x245 y895 w290 h64", "Warning")
	Reminder4.Opt("+ToolWindow")
	Failed := True
}

GameStateCheck() { 
	Global
	if (Permission = False) {
		Reminder1.Font("w800 s10")
		Reminder1.Add("Button", "w270 h50", "Stop Current Game").OnEvent("Change", CloseReminder1.Bind("Change"))
		Reminder1.Color("cE30202")
		Reminder1.Show("x245 y895 w290 h64", "Warning")
		Reminder1.Opt("+ToolWindow")
		Failed := True
		return
	}
	if (Permission := True) {
		Failed := False
		return
	}
}

GameModeCheck() { 
	Global
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
}

GameTypeCheck() { 
	Global
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
	Global
	if (Failed = True)
		return
	else {
		Permission := False
		ogcButtonStartOption.Text := "Running"
		ogcButtonStopOption.Text := "Stop/Save"
	}
}

GameStart() { 
	Global
	if (Failed = True)
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
}
;============================================FUNCTION============================================



;=============================================LABELS=============================================
FinishGift:
	FindD := true
	return

CloseReminder1(A_GuiEvent, GuiCtrlObj, Info, *)
{
	Reminder1.Hide()
}
CloseReminder2(A_GuiEvent, GuiCtrlObj, Info, *)
{
	Reminder2.Hide()
}
CloseReminder3(A_GuiEvent, GuiCtrlObj, Info, *)
{
	Reminder3.Hide()
}
CloseReminder4(A_GuiEvent, GuiCtrlObj, Info, *)
{
	Reminder4.Hide()
}
CloseReminder5:
	Reminder5.Hide()
	return
CloseReminder6:
	Reminder6.Hide()
	return

StartGame(A_GuiEvent, GuiCtrlObj, Info, *)
{
	Global
	oSaved := Reminder6.Submit("0")
	GameStateCheck()
	GameModeCheck()
	GameTypeCheck()
	ResetPermissions()
	GameStart()
}
	
StopGame:
	ogcButtonStartOption.Text := "Start"
	ogcButtonStopOption.Text := "...Saving..."
	SaveData()
	Exit()
	
GuiClose(*)
{
	ExitApp()
}
;=============================================LABELS=============================================



;============================================HOT-KEYS============================================
^Esc::ExitApp()
^x::Pause()
;============================================HOT-KEYS============================================






