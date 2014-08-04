#NoTrayIcon
#SingleInstance

RegRead fb2kInstallDir, HKEY_LOCAL_MACHINE, SOFTWARE\\Wow6432Node\\foobar2000, InstallDir

#AppsKey::
	Process, Exist, foobar2000.exe
	if (ErrorLevel = 0) {
		Run, "%fb2kInstallDir%\foobar2000.exe"
	} else {
		Run, "%fb2kInstallDir%\foobar2000.exe" /command:"Activate or Hide"
	}
return

^+!AppsKey::
	Run, "%fb2kInstallDir%\foobar2000.exe" /command:"Play or pause"
return

!AppsKey::
	Run, "%fb2kInstallDir%\foobar2000.exe" /command:"Next"
return

^AppsKey::
	Run, "%fb2kInstallDir%\foobar2000.exe" /command:"Previous"
return
