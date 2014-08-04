
#NoTrayIcon
#SingleInstance

#IfWinActive ahk_class CabinetWClass
{
	
	Loop HKEY_LOCAL_MACHINE, SYSTEM\\MountedDevices, 0, 1
	{
		DriveLetter := SubStr(A_LoopRegName, 1, 12)
		
		IfEqual DriveLetter, \DosDevices\
		{
			DriveLetter := SubStr(A_LoopRegName, 13, 1)
			StringLower DriveLetterKey, DriveLetter
			
			HotKey %DriveLetterKey%, OpenDrive, ON
		}
		
	}
}

GoTo End
OpenDrive:
{
	DriveLetterKey := A_ThisHotkey
	StringUpper DriveLetter, DriveLetterKey
	RegRead CompName, HKEY_CURRENT_USER, Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CLSID\\{20D04FE0-3AEA-1069-A2D8-08002B30309D}
	IfWinActive %CompName%
	{
		SendInput {Alt down}d{Alt up}%DriveLetter%:\{Return}
	}
	Else
	{
		SendInput %DriveLetterKey%
	}
	return
}

End: