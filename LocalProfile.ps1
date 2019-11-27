$computer = ""

$username = ""

$user = Get-WmiObject Win32_UserProfile -ComputerName $computer -Filter "LocalPath like '%$username%'"

#Local profile reset

$remotePath = $user.LocalPath.Replace('C:','C$')

try{
    Rename-Item \\$computer\$remotePath \\$computer\$remotePath.OLD -ErrorAction Stop
    Write-Host Local profile renamed
    $user.delete()
    Write-Host Profile has been deleted
}catch{
    Write-Host Unable to rename local profile $user.LocalPath
    Write-Host Unable to delete profile
}
