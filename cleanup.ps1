$computer = ""
$user = ""
$processClass = [WmiClass]"\\$computer\root\cimv2:Win32_Process"
$processClass.Create("cmd.exe /c RD /S /Q ""c:\temp""")
$processClass.Create("cmd.exe /c RD /S /Q ""c:\Windows\Temp""")
$processClass.Create("cmd.exe /c RD /S /Q ""c:\Windows\Prefetch""")

$patchcache = "C:\Windows\Installer\"+'$PatchCache$\Managed'

$processClass.Create("cmd.exe /c RD /S /Q $patchcache")
$processClass.Create("cmd.exe /c RD /S /Q C:\AdaptivaCache")
$processClass.Create("cmd.exe /c FORFILES /S /p C:\Windows\ccmcache /d -30 /C ""cmd /c IF @isdir == TRUE rd /S /Q @path""")
$processClass.Create("cmd.exe /c RD /S /Q ""c:\Users\$user\AppData\Local\Google\Chrome\User Data\Default\Cache""")
$processClass.Create("cmd.exe /c RD /S /Q ""c:\Users\$user\AppData\Local\Google\Chrome\User Data\Defaultv60SetupBackUp""")
$processClass.Create("cmd.exe /c RD /S /Q ""c:\Users\$user\AppData\Local\Microsoft\Windows\Temporary Internet Files\""")