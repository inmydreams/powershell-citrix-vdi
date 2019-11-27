$Computer = ""

#PortIca


$key = "SOFTWARE\Citrix\PortICA"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type, $Computer)
$regKey = $regKey.OpenSubKey($key,$true)
$AutoLogonTimeout = $regKey.GetValue("AutoLogonTimeout")
$CleanupSessionListenersCancelDelay = $regKey.GetValue("CleanupSessionListenersCancelDelay")

if(!$AutoLogonTimeout){
    $valueName = "AutoLogonTimeout"
    $valueData = "3500"
    $regkey.SetValue($valueName,$valueData,[Microsoft.Win32.RegistryValueKind]::DWord)
    Write-Host Set $valueName to $valueData
}else{
    Write-Host Already set AutoLogonTimeout $AutoLogonTimeout
}

if(!$CleanupSessionListenersCancelDelay){
    $valueName = "CleanupSessionListenersCancelDelay"
    $valueData = "5000"
    $regkey.SetValue($valueName,$valueData,[Microsoft.Win32.RegistryValueKind]::DWord)
    Write-Host Set $valueName to $valueData
}else{
    Write-Host Already set CleanupSessionListenersCancelDelay $CleanupSessionListenersCancelDelay
}