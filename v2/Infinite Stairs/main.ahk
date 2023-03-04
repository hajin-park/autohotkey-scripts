#Include "C:\Users\hajin\Desktop\Code\AutoHotKey\AutoHotkey_v2\Libraries\ShinsImageScanClass-main\ShinsImageScanClass.ahk"
#Warn
#SingleInstance Force
SendMode("Input")
SetControlDelay(-1)
SetTitleMatchMode(3)
DetectHiddenText(true)
DetectHiddenWindows(true)
SetWorkingDir(A_ScriptDir)
CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

sc := ShinsImageScanClass()
character_direction := "left"
xCoord := 0
yCoord := 0

Start() {
    Global
    Send("{Right}")
    Sleep(500)
    While True {
        If(character_direction == "left") {
            If(ImageSearch(&xCoord, &yCoord, 815, 640, 900, 685, "*10 assets\default_stair.png")) {
                Send("{Right down}{Right up}")
            }
            Else {
                Send("{Left down}{Left up}")
                character_direction := "right"
            }
        }
        Else If(character_direction == "right") {
            If(ImageSearch(&xCoord, &yCoord, 815, 640, 900, 685, "*10 assets\default_stair.png")) {
                Send("{Left down}{Left up}")
                character_direction := "left"
            }
            Else {
                Send("{Right down}{Right up}")
            }
        }
        Sleep(500)
    }
}

Test() {
    if (sc.Pixel(0xFF0000,20,x,y)) {
        MsgBox("Found a red pixel at " x "," y)
    } else {
        MsgBox("Could not find a red pixel on the desktop!")
    }

    ;count all the white pixels on the desktop screen
    MsgBox("There are " sc.PixelCount(0xFFFFFF) " white pixels on screen!")

}

^S::Start()
^x::Pause()
^t::Test()
^Esc::ExitApp()