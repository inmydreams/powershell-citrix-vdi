$Computer = ""

#UserInit check

$key = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type, $Computer)
$regKey = $regKey.OpenSubKey($key,$true)
$UserInit = $regKey.GetValue("Userinit")

if($UserInit -eq "C:\Windows\system32\userinit.exe,"){
    Write-Host Userinit value is $UserInit
}else{
    Write-Host Setting Userinit
    $valueName = "Userinit"
    $valueString = $valueData="C:\Windows\system32\userinit.exe,".toString()
    $regkey.SetValue($valueName,$valueString,[Microsoft.Win32.RegistryValueKind]::String)
}
