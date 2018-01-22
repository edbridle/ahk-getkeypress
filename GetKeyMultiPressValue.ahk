#SingleInstance force
Gui, +AlwaysOnTop -MaximizeBox ; -Caption +Resize -MinimizeBox +Disabled -SysMenu -Owner +OwnDialogs
Gui, Add, Text, center y10 h50 w300 vVar,  %KeypressValue%
Gui, Color, White
Gui, show
size=20
Gui, Font, s%size%
GuiControl, Font, var

;run KeypressValueToREG.ahk - together with GetKeyMultiPressValue.ahk
;The Features Are:
; - It will Show On your Screen, [All your Mouse Movements] and [All Keyboard Shortcuts Movement]
; - You can Make Scripts, that can do actions with DoubleClick on All Keyboard Shortcuts Clicks, How Nice Is that. 

;you can OneClick Ctrl + c for [copy the text]
;And you can doubleClick Ctrl + c for [copy the text] + [Do a google search with query parameters (100 search results + us results)]

;you can OneClick Ctrl + d = [Select the line]
;And you can doubleClick Ctrl + d for [Select the line] + [Do a google search with query parameters (100 search results + us results)]

;you can OneClick Ctrl + a for [select all text]
;And you can doubleClick Ctrl + a for [select all text] + [Do a google Translation to Dutch]


;you can OneClick Alt + c for [copy the text] + [Do a google Translation to Dutch]

;you can OneClick Alt + v for [copy the text] + [Do a WikiPedia Search]

MainLanguages=us ; United States
TransLationTo=nl ; Dutch

GroupAdd, Browser, ahk_class Chrome_WidgetWin_1 ; Chrome or Iron
GroupAdd, Browser, ahk_class IEFrame            ; Internet Explorer
GroupAdd, Browser, ahk_class MozillaWindowClass ; FireFox
GroupAdd, Browser, ahk_class ApplicationFrameWindow ; Edge


loop
{
RegRead, KeypressValue, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue ; read KeypressValue

If not GetKeyState("Ctrl","P") and not GetKeyState("Alt","P") and not GetKeyState("LWin","P") and not GetKeyState("RWin","P")
{

;you can OneClick Ctrl + c for [copy the text]
;And you can doubleClick Ctrl + c for [copy the text] + [Do a google search with query parameters (100 search results + us results)]
if (KeypressValue="Ctrl + c, c") ;use this for [1x=Ctrl c][2x=Ctr c, c][3x=Ctr c (3)] [and many more]
{
RegWrite, REG_SZ, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue,Ctrl+c,c=Google Search  ;clear the KeypressValue

If WinActive("ahk_group Browser")
{
send ^c ;copy the selected text to clipboard memory
sleep 150
send ^t ; CTRL+t make a new tab + goto address bar  - use CTRL+L for the active tab + goto address bar
sleep 150
texta = https://www.google.com/search?q=
textb = %clipboard% ;selected text
textc = &lr=lang_%MainLanguages%&hl=%MainLanguages%&num=100 ; google parameters

clipboard=%texta%%textb%%textc%
sleep 150
send ^v ; paste the selected text 
sleep 250
send {enter}
clipboard=%textb%
} else {
send ^c ;copy the selected text to clipboard memory
sleep 150
texta = https://www.google.com/?gfe_rd=cr&gws_rd=cr#q=
textb = %clipboard% ;selected text
textc = &lr=lang_%MainLanguages%&hl=%MainLanguages%&num=100 ; google parameters

clipboard=%texta%%textb%%textc%
run %clipboard%
clipboard=%textb%
}
reload
}

;you can OneClick Ctrl + a for [select all text]
;And you can doubleClick Ctrl + a for [select all text] + [Do a google Translation to Dutch]
if (KeypressValue="Ctrl + a, a") ;use this for [1x=Ctrl a][2x=Ctr a, a][3x=Ctr a (3)] [and many more]
{
RegWrite, REG_SZ, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue,Ctrl+a,a=Translate Text  ;clear the KeypressValue

If WinActive("ahk_group Browser")
{
send ^c 
sleep 150
send ^t ; CTRL+t this will [open a new tab] + goto adress bar
sleep 150
texta = https://translate.google.com/#auto/%TransLationTo%/
textb = %clipboard% ;selected text
clipboard=%texta%%textb%
sleep 150
send ^v ; paste the selected text
sleep 150
send {enter} 
clipboard=%textb%
} else {
send ^c ;copy the selected text to clipboard memory
sleep 150
texta = https://translate.google.com/#auto/%TransLationTo%/
textb = %clipboard% ;selected text

clipboard=%texta%%textb%
run %clipboard%
clipboard=%textb%
}
reload
}

;you can OneClick Ctrl + d for [Select the line]
;And you can doubleClick Ctrl + d for [Select the line] + [Do a google search with query parameters (100 search results + us results)]
if (KeypressValue="Ctrl + d, d") ;use this for [1x=Ctrl c][2x=Ctr c, c][3x=Ctr c (3)] [and many more]
{
RegWrite, REG_SZ, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue,Ctrl+d,d=Google Search  ;clear the KeypressValue

If WinActive("ahk_group Browser")
{
Send {HOME}+{END}^c{END}
send ^c ;copy the selected text to clipboard memory
sleep 150
send ^t ; CTRL+t make a new tab + goto address bar  - use CTRL+L for the active tab + goto address bar
sleep 150
texta = https://www.google.com/search?q=
textb = %clipboard% ;selected text
textc = &lr=lang_%MainLanguages%&hl=%MainLanguages%&num=100 ; google parameters

clipboard=%texta%%textb%%textc%
sleep 150
send ^v ; paste the selected text 
sleep 250
send {enter}
clipboard=%textb%
} else {
send ^c ;copy the selected text to clipboard memory
sleep 150
texta = https://www.google.com/?gfe_rd=cr&gws_rd=cr#q=
textb = %clipboard% ;selected text
textc = &lr=lang_%MainLanguages%&hl=%MainLanguages%&num=100 ; google parameters

clipboard=%texta%%textb%%textc%
run %clipboard%
clipboard=%textb%
}
reload
}

} ; End GetKeyState

sleep 50
GuiControl,, var, %KeypressValue%
} ;End Loop





~esc::exitapp

; [+ = Shift] [! = Alt] [^ = Ctrl] [# = Win] 
^d::Send {END}+{HOME}^c ; Ctrl+d = [Select the line]



; [+ = Shift] [! = Alt] [^ = Ctrl] [# = Win]
!c::
;you can OneClick Alt + a for [Copy Text] + [Do a google Translation to Dutch]

If WinActive("ahk_group Browser")
{
send ^c 
sleep 150
send ^t ; CTRL+t this will [open a new tab] + goto adress bar
sleep 150
texta = https://translate.google.com/#auto/%TransLationTo%/
textb = %clipboard% ;selected text
clipboard=%texta%%textb%
sleep 150
send ^v ; paste the selected text
sleep 150
send {enter} 
clipboard=%textb%
} else {
send ^c ;copy the selected text to clipboard memory
sleep 150
texta = https://translate.google.com/#auto/%TransLationTo%/
textb = %clipboard% ;selected text

clipboard=%texta%%textb%
run %clipboard%
clipboard=%textb%
}
RegWrite, REG_SZ, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue,Alt+c=Translate Text  ;clear the KeypressValue
return



; [+ = Shift] [! = Alt] [^ = Ctrl] [# = Win]
!v::
;you can OneClick Alt + v for [Copy Text] + [Do a WikiPedia Search]


If WinActive("ahk_group Browser")
{
send ^c ;copy the selected text to clipboard memory
sleep 150
send ^t ; CTRL+t make a new tab + goto address bar  - use CTRL+L for the active tab + goto address bar
sleep 150
texta = https://en.wikipedia.org/wiki/
textb = %clipboard% ;selected text

clipboard=%texta%%textb%
sleep 150
send ^v ; paste the selected text 
sleep 250
send {enter}
clipboard=%textb%
} else {
send ^c ;copy the selected text to clipboard memory
sleep 150
texta = https://en.wikipedia.org/wiki/
textb = %clipboard% ;selected text

clipboard=%texta%%textb%
run %clipboard%
clipboard=%textb%
}
RegWrite, REG_SZ, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue,Alt+v=WikiPedia.Search  ;clear the KeypressValue
return


