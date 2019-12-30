#Persistent  				; Keep the script running until the user exits it.
Menu, tray, NoStandard
Menu, tray, add, About, GUIAbout	; Creates a new menu item.
Menu,Tray,Default, About
Menu, tray, add  			; Creates a separator line.
Menu, tray, Standard
return

GUIAbout:
Gui, +AlwaysOnTop -SysMenu +Owner  	; +Owner avoids a taskbar button.
Gui, Add, Text,,- End: turn off monitor.
Gui, Add, Text,,- Numpad- + End: turn off monitor + minimize windows.
Gui, Add, Text,,- PgUp: volume mute.
Gui, Add, Text,,- PgDn: volume down.
Gui, Add, Text,,- Home: volume up.
Gui, Add, Text,,- Ctrl + Space: always on top.
Gui, Add, Button, gGuiClose x+150, Close
Gui, Show, NoActivate,  Hotkey 2017.1
return

GuiClose:
Gui, Destroy
return

PgUp:: volume_mute    
PgDn:: Volume_Down
Home:: Volume_Up
^SPACE up:: Winset, Alwaysontop, , A
end up:: 
GetKeyState, state, numpadsub

if state = d 
{
	WinMinimizeAll	
 	SendMessage, 0x112, 0xF170, 2,, Program Manager 
}
else
	SendMessage, 0x112, 0xF170, 2,, Program Manager 

return

;#InstallKeybdHook
;#InstallMouseHook
