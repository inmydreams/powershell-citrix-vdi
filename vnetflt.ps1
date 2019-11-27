$Computer = ""

#vnetflt disable

$key = "SYSTEM\CurrentControlSet\services\vnetflt"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type, $Computer)
$regKey = $regKey.OpenSubKey($key,$true)

if(!$regKey){
    Write-Host Unable to find key
    Exit
}else{
    $startOfvnetflt = $regKey.GetValue("start")
}

if($startOfvnetflt -eq 1){
    Write-Host Disabling vnetflt
    $valueName = "Start"
    [String]$valueData = "4"
    $regkey.SetValue($valueName,$valueData,[Microsoft.Win32.RegistryValueKind]::DWord)
}else{
    Write-Host Start is set to $startOfvnetflt
}
