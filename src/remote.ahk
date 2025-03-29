#NoEnv
SetBatchLines, -1

#Include ../Chrome.ahk/Chrome.ahk

PlayPause(ByRef page)
{
    page.Evaluate("document.getElementsByClassName('vjs-play-control')[0].click()")
}
GetCurrentTime(ByRef page)
{
    return page.Evaluate("document.getElementsByClassName('vjs-current-time-display')[0].innerText")["value"]
}
GetTotalTime(ByRef page)
{
    return page.Evaluate("document.getElementsByClassName('vjs-duration-display')[0].innerText")["value"]
}
SetSubtitle(ByRef page, idx)
{
    command := "document.getElementsByClassName('vjs-subs-caps-button')[0].childNodes[1].childNodes[0].childNodes[" idx "].childNodes[0].click()"
    page.Evaluate(command)
}
SetLanguage(ByRef page, idx)
{
    command := "document.getElementsByClassName('vjs-audio-button')[0].childNodes[1].childNodes[0].childNodes[" idx "].childNodes[0].click()"
    page.Evaluate(command)
}
; Helper function to convert MM:ss to seconds
TimeToSeconds(time)
{
    StringSplit, parts, time, :
    return (parts1 * 60) + parts2
}

; Helper function to convert seconds to MM:ss
SecondsToTime(seconds)
{
    minutes := Floor(seconds / 60)
    seconds := Mod(seconds, 60)
    return Format("{:02}:{:02}", minutes, seconds)
}

page1 := Chrome.GetPageByTitle("BCC Media", "startswith", 1)
page2 := Chrome.GetPageByTitle("BCC Media", "startswith", 2)

; PlayPause(page1)
; PlayPause(page2)

; SetSubtitle(page1, 2)
; SetLanguage(page1, 1)

; Create OSD GUI
Gui, +AlwaysOnTop +ToolWindow -Caption
Gui, Font, s40
Gui, Add, Text, w50 vOSDText, Loading...
Gui, Add, Button, Default w80 gPlayPause, PlayPause 
Gui, Show, x10 y10 NoActivate, OSD


; Start a timer to update the OSD every 100ms
SetTimer, UpdateOSD, 100
Return

UpdateOSD:
    currentTime := GetCurrentTime(page1)
    totalTime := GetTotalTime(page1)

    currentSeconds := TimeToSeconds(currentTime)
    totalSeconds := TimeToSeconds(totalTime)

    remainingSeconds := totalSeconds - currentSeconds

    remainingTime := SecondsToTime(remainingSeconds)

    toDisplay := remainingTime
    GuiControl, Text, OSDText, %toDisplay%
Return

PlayPause:
PlayPause(page1)
PlayPause(page2)
Return

; Exit the script when the GUI is closed
GuiClose:
ExitApp
