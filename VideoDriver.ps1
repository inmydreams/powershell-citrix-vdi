$computer = ""

try{
    $gpu=get-wmiobject win32_videocontroller -ComputerName $computer -ErrorAction Stop | Where {$_.Name -like "*Standard VGA*"} | Select-Object name
}catch{
    Write-Host Failed to connect to WMI
    Break
}

if ($gpu){
    Write-Host Driver is $gpu.name attempting to fix
    $paths="\\$computer\C$\Program Files\Common Files\VMware\Drivers\video_wddm\vm3d.inf","\\$computer\C$\Program Files\Common Files\VMware\Drivers\wddm_video\vm3d.inf"

    if(Test-Path $paths[0]){
        Write-Host "Driver is located in "$paths[0]""
        $DriverFile="C:\Program Files\Common Files\VMware\Drivers\video_wddm\vm3d.inf"
    }elseIf(Test-Path $paths[1]){
        Write-Host "Driver is located in "$paths[1]""
        $DriverFile="C:\Program Files\Common Files\VMware\Drivers\wddm_video\vm3d.inf"
    }
    else{
        Write-Host "Couldn't find driver"
        Break
    }

    $processClass = [WmiClass]"\\$computer\root\cimv2:Win32_Process"
    $process = $processClass.Create("pnputil -i -a ""$DriverFile""")
    $processID = $process.ProcessID
    $runningCheck = {Get-WmiObject -Class Win32_Process -Filter "ProcessId='$processID'" -ComputerName $computer -ErrorAction SilentlyContinue | ? { ($_.ProcessName -eq 'pnputil.exe') } }

    while ($null -ne (& $runningCheck) ){
        Start-Sleep -s 1
    }

}else{
    Write-Host Driver is not Standard VGA Graphics Adapter
}

try{
    $gpu=get-wmiobject win32_videocontroller -ComputerName $computer -ErrorAction Stop | Where {$_.Name -like "*VMware*"} | Select-Object name
}catch{
    Write-Host Failed to connect to WMI
    Break
}

if($gpu){
    Write-Host Driver is set to $gpu.name
}
else{
    Write-Host Please check manually
}