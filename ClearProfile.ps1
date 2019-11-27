$computer = ""
$username = ""

$user = Get-WmiObject Win32_UserProfile -ComputerName $computer -Filter "loaded = false AND special = false AND NOT LocalPath LIKE '%$username%' AND NOT LocalPath LIKE '%Win7Admin%' AND NOT LocalPath LIKE '%Administrator%' AND NOT LocalPath LIKE '%sys$computer%'"

$user.delete()