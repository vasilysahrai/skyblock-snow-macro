#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

inventorySlots = 
(
816,596,  852,596,  889,596,  925,596,  960,596,  995,596,  1032,596,  1068,596,  1105,596,
816,633,  852,633,  889,633,  925,633,  960,633,  995,633,  1032,633,  1068,633,  1105,633,
816,670,  852,670,  889,670,  925,670,  960,670,  995,670,  1032,670,  1068,670,  1105,670,
816,713,  852,713,  889,713,  925,713,  960,713,  995,713,  1032,713,  1068,713
)

additionalClickPoints = 
(
997,535, 853,480
)

global stopScript := false

v::
stopScript := false
SetTimer, Process, 0
return

b::
stopScript := true
return

n::ExitApp

Process:
Critical
if (stopScript) {
    SetTimer, Process, Off
    return
}

Send, t
Sleep, 500

Send, {Up}
Sleep, 500

Send, {Enter}
Sleep, 500

StringSplit, point, additionalClickPoints, `,
MouseMove, % point1, % point2, 0
Sleep, 100
Click
Sleep, 500

MouseMove, % point3, % point4, 0
Sleep, 100
Click
Sleep, 500

Send, {Esc}
Sleep, 500

Click, Right
Sleep, 500

Send, {Shift down}

Loop, Parse, inventorySlots, `,
{
    if (stopScript) {
        Break
    }

    if (Mod(A_Index, 2) = 1)
        x := A_LoopField
    else
    {
        y := A_LoopField
        MouseMove, x, y, 0
        Sleep, 50
        Click
        Sleep, 100
    }
}

Send, {Shift up}

Send, {Esc}
Sleep, 2000

if (!stopScript) {
    SetTimer, Process, -1
}
return