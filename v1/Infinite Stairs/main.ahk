;#Warn
#SingleInstance Force
SetControlDelay, -1
SetBatchLines, -1
SetTitleMatchMode, 1
#include ShinsImageScanClass.ahk

sc := new ShinsImageScanClass()
character_direction := "left"
xCoord := 0
yCoord := 0

Start() {
    Send, "{Right}"
    Sleep, 500
    While True {
        Sleep, 500
    }
}

Test() {
    Global sc
    msgbox % sc.ImageCount("assets/default_stair.png")
}

^S::Start()
^t::Test()
^x::Pause
^Esc::ExitApp