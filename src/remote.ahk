#NoEnv
SetBatchLines, -1

#Include ../Chrome.ahk/Chrome.ahk

page1 := Chrome.GetPageByTitle("BCC Media", "startswith", 1)
page2 := Chrome.GetPageByTitle("BCC Media", "startswith", 2)

page1.Evaluate("document.getElementsByClassName('vjs-play-control')[0].click()")
page2.Evaluate("document.getElementsByClassName('vjs-play-control')[0].click()")