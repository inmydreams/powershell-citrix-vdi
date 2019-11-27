$machine = ''
$script = 'C:\extend.bat'

$vcenters = @(
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
""
);


function diskSize {
    $disk = Get-WmiObject win32_logicaldisk -Filter "DeviceID='C:'" -ComputerName $machine
    $diskSize = [math]::Round($disk.Size/1GB, 2)
    return $diskSize
}

$diskCapacity = diskSize


if($diskCapacity -le 80){
   
    $capacity = 100
    
    Connect-VIServer -Server $vcenters

    Get-HardDisk -vm $machine | Set-HardDisk -CapacityGB $capacity -Confirm:$false

    (Start-Process psexec -Credential $creds -WorkingDirectory 'C:\Windows\System32' -ArgumentList @("\\"+$machine,'-c',$script) -PassThru).WaitForExit()
    
}

diskSize