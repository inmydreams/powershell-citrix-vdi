$Computer = ""

#Environment variables check

$default = "%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%systemroot%\System32\WindowsPowerShell\v1.0\;%systemroot%\System32\WindowsPowerShell\v1.0\;%systemroot%\System32\WindowsPowerShell\v1.0\;C:\Program Files\Citrix\System32\;C:\Program Files\Citrix\ICAService\;C:\Program Files\Citrix\Virtual Desktop Agent\;"

$key = "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type, $Computer)
$regKey = $regKey.OpenSubKey($key,$true)
$pathValue = $regKey.GetValue("Path")

$combined = $default + $pathValue

$splittedPath = $combined -split ';'.Trim()

$cleanedPath = $splittedPath | Sort-Object -Unique

$NewPath = $cleanedPath -join ';'

$valueName = "Path"
[String]$valueData = $NewPath

$regkey.SetValue($valueName,$valueData,[Microsoft.Win32.RegistryValueKind]::ExpandString)

$valueData.Split(';')