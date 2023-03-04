;
; AutoHotkey Version: 2.x
; Language:       English
; Platform:       Windows 10
; Author:         Hajin Park <hajin1819@gmail.com>
;
; Script Function:
;	Automated Dank Memer discord bot currency script
;

#Warn
#SingleInstance Force
DetectHiddenText "On"
DetectHiddenWindows "On"
SetControlDelay -1
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
Thread "NoTimers", True
SetTitleMatchMode 2
WinActivate("ahk_exe chrome.exe")

Global timers := {pauseTimer : 1,
				 moneyLoop : 0, 
				 sellLoop : 0, 
				 spinnerLoop : 0, 
				 laptopLoop : 0}


SwitchTab()
{
	Global
	ControlSend("^{Tab}", , Chrome)
	RandomWaitInterval(500, 1000)
}

RandomWaitInterval(min, max)
{
		Sleep(Random(min, max))
		RandomSeed(Random(min, max))
}

UpdateTimer(timer)
{
	Global
	if (timer = "shift") {
		pauseTimer += 1
		loopTimer := 0
		
		if (Mod(pauseTimer, 16) = 0)
			moneyLoop := 4
		
		if (Mod(pauseTimer, 108) = 0)
			spinnerLoop := 4
		
		if (Mod(pauseTimer, 118) = 0)
			laptopLoop := 4
		
		if (pauseTimer = 236)
			sellLoop := 4
		
		if (pauseTimer = 240)
		{
			pauseTimer := 1
			RandomWaitInterval(1500000, 2100000)
		}

	} else if (timer = "loop") {
		currentAction.RemoveAt(randomAction)
		loopTimer += 1
	}
}

ProtectMoney()
{
	Global
	ControlSend("pls dep max {Enter}", , Chrome)
	RandomWaitInterval(750, 1500)
	ControlSend("pls use padlock {Enter}", , Chrome)
	RandomWaitInterval(750, 1500)
}

CheckAction()
{
	Global
	if (spinnerLoop != 0)
	{
		BuyItem("spinner")
		UseItem("spinner")
		spinnerLoop -= 1
	}
	
	if (laptopLoop != 0)
	{
		BuyItem("laptop")
		laptopLoop -= 1
	}
	
	if (moneyLoop != 0)
	{
		ProtectMoney()
		moneyLoop -= 1
	}
	
	if (sellLoop != 0)
	{
		SellItem("all")
		BuyItem("lottery")
		ProtectMoney()
		ControlSend("pls profile {Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
		sellLoop -= 1
	}
}

RandomAnswer(action)
{
	if (action = "hl") {
		rand := Random(1, 9)
		if (rand = 1) || (rand = 2) || (rand = 3) || (rand = 4)
			return "low"
		else if (rand = 5) || (rand = 6) || (rand = 6) || (rand = 8)
			return "high"
		return "jackpot"
	} else if (action = "pm") {
		rand := Random(1, 5)
		if (rand = 1)
			return "f"
		else if (rand = 2)
			return "r"
		else if (rand = 3)
			return "i"
		else if (rand = 4)
			return "c"
		return "k"
	} else if (action = "trivia") {
		rand := Random(1, 4)
		if (rand = 1)
			return "a"
		else if (rand = 2)
			return "b"
		else if (rand = 3)
			return "c"
		return "d"
	}
	
	return "error"
}
			
DoGamble(action)
{
	Global

	if (action = "se")
		rand := Random(10, 200)
	else if (action = "slots")
		rand := Random(1, 100)
	else if (action = "gamble")
		rand := Random(100, 1000)
		
	ControlSend("pls " action " " rand "{Enter}", , Chrome)
	RandomWaitInterval(750, 1500)
}

DoAction(action)
{
	Global
	ControlSend("pls " action "{Enter}", , Chrome)

	if (action = "hl") or  (action = "trivia") or  (action = "pm")
	{
		RandomWaitInterval(1500, 2500)
		rand := RandomAnswer(action)
		ControlSend(rand "{Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
		return
	}
	RandomWaitInterval(750, 1500)
}

SellItem(item)
{
	Global
	if (item = "all") {
		ControlSend("pls sell bread max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell cookie max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell boar max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell deer max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell duck max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell rabbit max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell rare max {Enter}", , Chrome)
		RandomWaitInterval(3000, 4000)
		ControlSend("pls sell skunk max {Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
	} else {
		ControlSend("pls sell " item " max" "{Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
	}
}

BuyItem(item)
{
	Global
	if (item = "lottery") {
		ControlSend("pls " item "{Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
		ControlSend("yes {Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
	} else {
		ControlSend("pls buy " item "{Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
	}
}

UseItem(item)
{
	Global
	ControlSend("pls use " item "{Enter}", , Chrome)
	
	if (item = "spinner")
	{
		RandomWaitInterval(10000, 15000)
		return
	}
	
	RandomWaitInterval(750, 1500)
	
	if (item = "cheese") or (item = "banknote") or (item = "alcohol") or (item = "tidepod")
	{
		ControlSend("y {Enter}", , Chrome)
		RandomWaitInterval(750, 1500)
	}
}

Start()
{
	actionList := [1, 2, 3, 4, 5, 6, 7]
	Loop
	{
		currentAction := actionList
		while (currentAction.Length != 0)
		{
			randomAction := Random(1, actionList.Length - loopTimer)
			
			if (currentAction[randomAction] = actionList[1]) {
				DoAction("fish")
				UpdateTimer("loop")

			} else if (currentAction[randomAction] = actionList[2]) {
				DoAction("hunt")
				UpdateTimer("loop")

			} else if (currentAction[randomAction] = actionList[3]) {
				DoAction("beg")
				UpdateTimer("loop")

			} else if (currentAction[randomAction] = actionList[4]) {
				DoAction("hl")
				UpdateTimer("loop")

			} else if (currentAction[randomAction] = actionList[5]) {
				DoAction("trivia")
				UpdateTimer("loop")

			} else if (currentAction[randomAction] = actionList[6]) {
				DoAction("pm")
				UpdateTimer("loop")

			} else if (currentAction[randomAction] = actionList[7]) {
				DoGamble("se")
				UpdateTimer("loop")
			}
		}
		CheckAction()
		UpdateTimer("shift")
		SwitchTab()
	}
}

test()
{
	currentAction.Length()
}


;======================HOT-KEYS======================
^Esc::ExitApp
^x::Pause
^s::
{
	Global Chrome := WinGetTitle("dank-memer - Google Chrome")
	Sleep(1000)
	Start()
	return
}
^t::
{
	Global Chrome := WinGetTitle("dank-memer - Google Chrome")
	Sleep(1000)
	test()
	return
}
;======================HOT-KEYS======================
