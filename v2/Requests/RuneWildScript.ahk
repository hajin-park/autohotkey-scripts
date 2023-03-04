;
; AutoHotkey Version: 2.x
; Language:       English
; Platform:       Windows 10
; Author:         uhhhhhhhh <> Updated to AHKv2: HPWiggler <>
;
; Script Function:
;	RuneWild script
;

#Warn
#SingleInstance Force
DetectHiddenText "On"
DetectHiddenWindows "On"
SetControlDelay -1
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.


; Variables
x := 1
y := 0
c := 0
d := 0
e := 0
f := 0
fuckd := 0
spekd := 0
OrigX := 0
OrigY := 0
Ax := 0
Ay := 0
Bx := 0
By := 0
Kx := 0
Ky := 0


; Functions
clickTing(x, y)
{
    BlockInput "On"
	Click("x, y, D")
	Sleep(15)
	Click("x, y, U")
	BlockInput "Off"
}

switch1()
{   
    Global
    MouseGetPos(&OrigX, &OrigY)

    if (spekd = 1)
    {
        spek()
        return
    }

    Send("{F1}")

    if (x = 0)
    {
        MouseGetPos(&OrigX, &OrigY)
    }

    if (fuckd = 0) {
        clickTing(646, 265)
        clickTing(602, 300)
        clickTing(603, 264)
    } else {
        clickTing(602, 300)
        clickTing(644, 337)
        clickTing(645, 300)
    }

    if (y = 1)
    {
        fuckd := !fuckd
        y := !y
    }

    Sleep(10)

    if (x = 0) {
        mystic()
        x := !x
        barragNoCoord()
    } else {
        eagle()
        x:= !x
    }
}

switch2()
{
    Global
    MouseGetPos(&OrigX, &OrigY)

    if spekd = 1
    {
        spek()
        return
    }

    Send("{F1}")

    if (fuckd = 0) {
        clickTing(647, 334)
        clickTing(645, 300)
        Sleep(10)
    } else if fuckd = 1 {
        clickTing(602, 262)
        clickTing(647, 263)
        Sleep(10)
    }

    if (y = 0) {
        strong()
        y:= !y
    } else if (x = 0) {
        eagle()
        y:= !y
    } else {
        mystic()
        y:= !y
        barragNoCoord()
    }
}

switchspec()
{
    Global
    Send("{F5}")
    clickTing(664, 458)
    clickTing(664, 458)
    clickTing(664, 458)
    clickTing(664, 458)
    MouseMove(OrigX, OrigY, 0)
    Send("{F1}")
}

meleep()
{
    Global
    Critical
    MouseGetPos(&OrigX, &OrigY)

    if (c = 0)
    {
        Send("{F3}")
        clickTing(701, 374)
        Send("{F1}")
        MouseMove(OrigX, OrigY, 0)
        c := 1
        d := 0
        e := 0
    }
}

rangep()
{
    Global
    Critical
    MouseGetPos(&OrigX, &OrigY)

    if (d = 0)
    {
        Send("{F3}")
        clickTing(663, 374)
        Send("{F1}")
        MouseMove(OrigX, OrigY, 0)
        d := 1
        c := 0
        e := 0
        f := 0
    }
}

magep()
{
    Global
    Critical
    MouseGetPos(&OrigX, &OrigY)

    if (e = 0)
    {
        Send("{F3}")
        clickTing(627, 376)
        Send("{F1}")
        MouseMove(OrigX, OrigY, 0)
        e := 1
        c := 0
        d := 0
        f := 0
    }
}

smite()
{
    Global
    Critical
    MouseGetPos(&OrigX, &OrigY)

    if (f = 0)
    {
        Send("{F3}")
        clickTing(703, 413)
        Send("{F1}")
        MouseMove(OrigX, OrigY, 0)
        f := 1
        c := 0
        d := 0
        e := 0
    }
}

tab()
{
    SetDefaultMouseSpeed 1
    SetMouseDelay 2

    Send("{F1}")
    clickTing(602, 480)
    Send("{ESC}")
    clickTing(637, 463)
    Send ("{F1}")
}

fakerm()
{
    Global
    MouseGetPos(&OrigX, &OrigY)

    if (fuckd = 0) {
        clickTing(646, 265)
        clickTing(602, 300)
        clickTing(603, 264)
    } else {
        clickTing(602, 300)
        clickTing(644, 337)
        clickTing(645, 300)
    }

    Sleep(600)

    if (fuckd = 0) {
        clickTing(646, 265)
        clickTing(602, 300)
        clickTing(603, 264)
    } else {
        clickTing(602, 300)
        clickTing(644, 337)
        clickTing(645, 300)
    }
    
    if (x = 1)
    {
        barragNoCoord()
    }
}

spek()
{
    Global
    MouseGetPos(&OrigX, &OrigY)

    if (y = 0) {
        if  (fuckd = 0) {
            if (spekd = 0) {
                clickTing(647, 299)
                clickTing(603, 370)
                strong()
                spekd:= !spekd
                switchspec()
            } else {
                clickTing(603, 372)
                clickTing(646, 370)
                clickTing(645, 300)
                spekd:= !spekd

                if (x = 0) {
                    eagle()
                } else {
                    mystic()
                    barrag()
                }
            }
        } else if (spekd = 0) {
            clickTing(647, 262)
            clickTing(603, 370)
            strong()
            spekd:= !spekd
            switchspec()
        } else {
            clickTing(601, 371)
            clickTing(645, 370)
            clickTing(645, 265)
            spekd:= !spekd
            if (x = 0) {
                eagle()
            } else {
                mystic()
                barrag()
            }
        }

    } else if (fuckd = 0) {
        if (spekd = 0) {
            clickTing(605, 373)
            spekd:= !spekd
            switchspec()
        } else {
            clickTing(604, 370)
            clickTing(646, 370)
            spekd:= !spekd
        }

    } else if (fuckd = 1) {
        if (spekd = 0) {
            clickTing(605, 373)
            spekd:= !spekd
            switchspec()
        } else {
            clickTing(604, 370)
            clickTing(646, 370)
            spekd:= !spekd
        }

    } else {
        if (fuckd = 0) {
            if (spekd = 0) {
                clickTing(594, 339)
                spekd:= !spekd
            } else {
                clickTing(603, 370)
                clickTing(647, 370)
                spekd:= !spekd
            }
        } else if (spekd = 0) {
            clickTing(604, 372)
            spekd:= !spekd
        } else {
            clickTing(603, 371)
            clickTing(647, 370)
            spekd:= !spekd
        }
    }
}

barrag()
{
    Global

    if (x = 1)
    {
        MouseGetPos(&OrigX, &OrigY)
    }
}

barragNoCoord()
{
    Global
    Send("{F4}")
    Sleep(20)
    clickTing(604, 429)
    Send("{F1}")
    MouseMove(OrigX, OrigY, 0)
}

mystic()
{
    Global
    Send("{F3}")
    clickTing(590, 411)
    Send("{F1}")
    MouseMove(OrigX, OrigY)
}

eagle()
{
    Global
    Send("{F3}")
    clickTing(739, 373)
    Send("{F1}")
    MouseMove(OrigX, OrigY)
}

strong()
{
    Global
    Send("{F3}")
    clickTing(739, 340)
    clickTing(591, 375)
    Send("{F1}")
    MouseMove(OrigX, OrigY)
}

meleefake()
{
    Global

    if spekd = 1
    {
        spek()
        return
    }
    
    Send("{F1}")

    if (fuckd = 0) {
        clickTing(647, 334)
        clickTing(645, 300)
        Sleep(10)
    } else if (fuckd = 1) {
        clickTing(602, 262)
        clickTing(647, 263)
        Sleep(10)
    }

    Sleep(600)

    if (spekd = 1)
    {
        spek()
        return
    }

    Send("{F1}")

    if (fuckd = 0) {
        clickTing(647, 334)
        clickTing(645, 300)
        Sleep(10)
    } else if (fuckd = 1) {
        clickTing(602, 262)
        clickTing(647, 263)
        Sleep(10)
    }

    if (x = 1)
    {
        barrag()
    }
}

eat()
{
    Global
    SetDefaultMouseSpeed 1
    SetMouseDelay 2
    PixelSearch(&Ax, &Ay, 576, 247, 753, 493, 0x3D2F12, 2)
    PixelSearch(&Bx, &By, 576, 247, 753, 493, 0xC6C43C, 2)
    PixelSearch(&Kx, &Ky, 576, 247, 753, 493, 0xC7C6BE, 2)
    clickTing(Ax, Ay)
    clickTing(Bx, By)
    clickTing(Kx, Ky)
}

; Hotkeys
*^e::switch1()

*^r::switch2()

*^o::switchspec()

*^1::meleep()

*^2::rangep()

*^3::magep()

*^4::smite()

*^5::tab()

*^w::fakerm()

*^d::spek()

*^s::meleefake()

*^f::barrag()

*^t::eat()

*^g::Reload

*^Esc::ExitApp
