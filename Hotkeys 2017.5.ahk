#Persistent  				        ; Keep the script running until the user exits it.
Menu, tray, NoStandard
Menu, tray, add, About Hotkey 2017.5, GUIAbout	; Creates a new menu item.
Menu,Tray,Default, About Hotkey 2017.5
Menu, tray, add  			        ; Creates a separator line.
Menu, tray, Standard
return

GUIAbout:
Gui, +AlwaysOnTop -SysMenu +Owner  	; +Owner avoids a taskbar button.
Gui, font, s12,
Gui, Add, Text, x135 cBlue, lanly-dev
Gui, font, s8,
Gui, Add, Text, x10 , End: turn off monitor
Gui, Add, Text,, Shift + End: turn off monitor + minimize windows

Gui, Add, Text,, PgUp: volume mute
Gui, Add, Text,, PgDn: volume down
Gui, Add, Text,, Home: volume up

Gui, Add, Text,, Shift + PgDn: brightness -10`%
Gui, Add, Text,, Shift + Home: brightness +10`%

Gui, Add, Text,, Ctrl + Space: always on top
Gui, font, s12,
Gui, Add, Button, gGuiClose x+150, Close
Gui, Show, NoActivate,  Hotkey 2017.5
return

GuiClose:
Gui, Destroy
return

PgUp:: volume_mute    
PgDn:: Volume_Down
Home:: Volume_Up
^SPACE up:: Winset, Alwaysontop, , A                        ;Ctrl + space
end up:: SendMessage, 0x112, 0xF170, 2,, Program Manager 
+end up::                                                   ;Shift + end
	WinMinimizeAll	
 	SendMessage, 0x112, 0xF170, 2,, Program Manager 
return

AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")

    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    
    toSet := curt + step

    if toSet > 100
        return

    if toSet < 10 
        for i in monMethods {
            i.WmiSetBrightness(1, 0)
            return
    }

    for i in monMethods {
        i.WmiSetBrightness(1, curt+step)
        break
    }
}

+PgDn::                         ;Shift + PgDn
  AdjustScreenBrightness(-10)
  Return
  
+Home::                         ;Shift + Home           
  AdjustScreenBrightness(10)
  Return

;#InstallKeybdHook
;#InstallMouseHook
