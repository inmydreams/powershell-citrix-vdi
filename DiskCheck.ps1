$Computer = ""

#Disk checkup

$key = "SYSTEM\CurrentControlSet\Control\Session Manager\"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type, $Computer)
$regKey = $regKey.OpenSubKey($key,$true)
$BootExecute = $regKey.GetValue("BootExecute")

if($BootExecute -like "*/K:C*"){
    Write-Host BootExecute value is $BootExecute
}else{
    Write-Host Setting BootExecute
    $valueName = "BootExecute"
    [String[]]$valueData = @("autocheck autochk /K:C *","PvsVmBoot")
    $regkey.SetValue($valueName,$valueData,[Microsoft.Win32.RegistryValueKind]::MultiString)
}