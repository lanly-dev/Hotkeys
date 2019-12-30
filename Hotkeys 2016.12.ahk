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

Return

;#InstallKeybdHook
;#InstallMouseHook
