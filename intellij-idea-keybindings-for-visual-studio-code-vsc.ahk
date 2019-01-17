#Include *i %A_ScriptDir%\inc_ahk\init_global.init.inc.ahk

welcomeMsg =
(
Date: 17.01.2019 10:49
planned to use together with: IntelliJ IDEA Keybindings produced by Keisuke Kato.
it complements/adds a few Ctrl+Shift shortcuts for Visual Studio Code by using Windows OS.
This small script is produced by: SL5net ( https://github.com/sl5net/ahk-intellij-idea-keybindings-for-visual-studio-code-vsc )

Some links:
Ctrl+Shift keys: https://www.jetbrains.com/help/phpstorm/ctrl-shift.html
IntelliJ IDEA Key Bindings for Visual Studio Code: https://marketplace.visualstudio.com/items?itemName=k--kato.intellij-idea-keybindings
https://www.autohotkey.com/boards/viewtopic.php?f=6&t=61102&p=258496#p258496
https://intellij-support.jetbrains.com/hc/en-us/community/posts/206909795-Support-for-editing-AutoHotkey-ahk-files?flash_digest=69aad6d4b26aef8693c61b4284a9ca25b25d2d82
https://www.autohotkey.com/boards/viewtopic.php?t=8267

Tags: IntelliJ Keybinding keybindings ahk vsc Visual Studio Code
Categories: Keyymaps
)
ToolTip9sec(welcomeMsg "`n(" Last_A_This A_ThisFunc " " RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")" )

#notrayicon
SetTimer,lblCheckTrayIconStatus,100 ; ; 30.08.2018 13:52 it sometimes happesn. and if it happens then its really ugly !!!! :( !!

; please use this ! as first line in every script before all includes!
isDevellopperMode:=true ;  update script.

DetectHiddenWindows,on
#InstallKeybdHook
;~ http://de.autohotkey.com/wiki/index.php?title=InstallKeybdHook

SetTitleMatchMode,2
; #IfWinActive,Visual Studio Code
; #IfWinActive,ahk_class Chrome_WidgetWin_1
vscTitle := "ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe"
#If WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe")

; intellij: ctrl+shift+a	shift+cmd+a	Find Action
; => Command Palette
^+a:: ; works 19-01-17_09-48
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip1sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
SetKeyDelay, 200, 20
ControlSend, ,+#p, % vscTitle ; 19-01-17_10-05: <== works with https://marketplace.visualstudio.com/items?itemName=k--kato.intellij-idea-keybindings
return

; ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe ahk_id 0x28109be

; ddd
; keysEveryWhere.ahk - global-IntelliSense-everywhere-Nightly-Build - Visual Studio Code [Administrator] ahk_class Chrome_WidgetWin_1 ; mouseWindowTitle=0x211254  ; 
;#IfWinActive,
^+Backspace:: ; go to the last edit position.  works 19-01-17_09-48 ; works NOT 13.06.2018 08:13
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip1sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
SetKeyDelay, 200, 20
ControlSend, ,^z, % vscTitle
ControlSend, ,^+z, % vscTitle ; 19-01-17_10-05: <== works with https://marketplace.visualstudio.com/items?itemName=k--kato.intellij-idea-keybindings
return
^+esc:: ; works 13.06.2018Y 08:12
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")


; ~^+right:: ; works 13.06.2018 08:12
; deprecated becouse works with: 19-01-17_10-05: <== works with https://marketplace.visualstudio.com/items?itemName=k--kato.intellij-idea-keybindings
; Ctrl+Shift+Right	
; Move to Word End with Selection
; Select text from the current caret position to the end of word, and move caret to the end of	word. See page Edit code.
;  Last_A_This:=A_ThisFunc . A_ThisLabel
;  ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")



~^+Enter:: ; works NOT 13.06.2018 08:13
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
return
~^+Del:: ; works NOT 13.06.2018 08:13  
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
return
~^+F12:: ;  works 13.06.2018 08:24
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
return
~^+space:: ;   works 13.06.2018 08:24
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
return
~^+Ins:: ; works 13.06.2018 08:24
Last_A_This:=A_ThisFunc . A_ThisLabel
ToolTip3sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
return
^+!Backspace:: ; works NOT 13.06.2018 08:13
;  ~ctrl & Backspace:: ; keyboard shortcut for go back to last edited position in Visual Studio Code
  ;ToolTip1sec("(" Last_A_This A_ThisFunc ":" RegExReplace(A_LineFile,".*\\") ":"  A_LineNumber ")")
ToolTip2sec("^j === ^+BackScpace " A_LineNumber . " " . A_ScriptName . " " . Last_A_This)
msgbox % "works not"
Suspend,On
if(true){
	send,^j ; works only if installed extension: for Ctrl + Shift + Backspace "Navigate Edits History" https://stackoverflow.com/questions/50608264/keyboard-shortcut-for-go-back-to-last-edited-position-in-visual-studio-code/50611031#50611031
}else{
	send,{CtrlDown}z{ctrlup}
	send,{CtrlDown}+z{ctrlup}
}
Suspend,Off
  ;msgbox, huhu
Return

#IfWinActive,- Editor
^+Backspace::msgbox % "works not"
q::msgbox % "works"



lblCheckTrayIconStatus:
showTempTrayIf_isNearTrayMenue(iconAdress)		
DetectHiddenWindows,Off
IfWinExist,%A_ScriptName%_icon,ExitApp %A_ScriptName% ; message from child DynaRun() script
{
	WinClose,%A_ScriptName%_icon
	ExitApp
}
return




#Include *i %A_ScriptDir%\inc_ahk\functions_global.inc.ahk
#Include *i %A_ScriptDir%\inc_ahk\functions_global_dateiende.inc.ahk
#Include *i %A_ScriptDir%\inc_ahk\UPDATEDSCRIPT_global.inc.ahk



