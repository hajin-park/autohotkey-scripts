#SingleInstance Force
SendMode("Input")
SetControlDelay(-1)

move_forward()
{
    Send("{w down}")
    Sleep(Random(200, 500))
    Send("{w up}")
}

move_backward()
{
    Send("{s down}")
    Sleep(Random(200, 500))
    Send("{s up}")
}

move_right()
{
    Send("{d down}")
    Sleep(Random(200, 500))
    Send("{d up}")
}

move_left()
{
    Send("{a down}")
    Sleep(Random(200, 500))
    Send("{a up}")
}

Start()
{
    while True
    {   
        action := Random(1, 5)
        If (action == 1) 
            Send("{Space}")
        Else If (action == 2) 
            move_forward()
        Else If (action == 3) 
            move_backward()
        Else If (action == 4) 
            move_right()
        Else If (action == 5) 
            move_left()
        Sleep(Random(500, 1000))
    }
}

^s::Start()
^q::ExitApp()