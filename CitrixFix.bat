reg add HKEY_LOCAL_MACHINE\SOFTWARE\Citrix\PortICA /v AutoLogonTimeout /t REG_DWORD /d 3500 /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Citrix\PortICA /v CleanupSessionListenersCancelDelay /t REG_DWORD /d 1000 /f
fltmc unload vnetflt
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vnetflt /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v LoadAppInit_DLLs /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Windows" /v LoadAppInit_DLLs /t REG_DWORD /d 0 /f