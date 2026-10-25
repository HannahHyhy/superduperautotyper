Gui, Add, Text,, ------------------------------------------Key Delay-----------------------------------------
Gui, Add, Edit, w300 vKeyDelay, 100
Gui, Add, Text,, ----------------------------------------Piano Music-----------------------------------------
Gui, Add, Edit, R10 w300 vPianoMusic
Gui, Add, Text,, 								  Shift 4 To Play Piano Music
Gui, Add, Text,, 								Press - To Suspend/Resume
Gui, Add, Text,, 								  Original: WalkerOnly
Gui, Add, Text,, 								  Edited: Hyhy
Gui, Show
return

+4::
!+4::
Gui, Submit, Nohide

; Chuẩn hóa xuống dòng (xóa \r nếu có, chỉ giữ lại \n) và xóa dấu /
PianoMusic := StrReplace(PianoMusic, "`r", "")
PianoMusic := RegExReplace(PianoMusic, "/") 

X := 1
while (X:=RegExMatch(PianoMusic, "s)(\[.*]|.)",Keys, X))
{	
	X+=StrLen(Keys)
	
	if (Keys = "`n")
	{
		SendInput, {Enter}
	}
	else
	{
		Keys := Trim(Keys, "[]")
		SendInput % Keys
	}
	
	Sleep, %KeyDelay%
}
return

-::
Pause
Suspend
return

GuiClose:
	ExitApp