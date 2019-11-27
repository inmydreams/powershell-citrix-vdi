$computer = ""

$username = ""

$user = Get-WmiObject Win32_UserProfile -ComputerName $computer -Filter "LocalPath like '%$username%'"

#Roaming profile reset

$roamingPath = $user.RoamingPath

if($roamingPath -eq $null){
    Write-Host "Roaming path doesn't exit"
    Exit
}

Try{
    Rename-Item $roamingPath $roamingPath'.OLD' -ErrorAction Stop
}catch{
    Write-Host Unable to rename $roamingPath
    Write-Host Atempting to rename parent folder
    Try{
        $roamingPathParent = Split-Path $roamingPath
        Rename-Item $roamingPathParent $roamingPathParent'.OLD' -ErrorAction Stop
        Write-Host Renamed $roamingPathParent
    }
    catch{
        Write-Host Unable to rename $roamingPathParent Please check path
    }
}



