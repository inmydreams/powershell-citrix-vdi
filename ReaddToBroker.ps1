Add-PSSnapin citrix*

$DDC = ""
$domain = ""
$machine = ""

$downLevelMachine = $domain + "\" + $machine

$details = Get-BrokerDesktop -MachineName $downLevelMachine -AdminAddress $DDC

$desktopGroup = $details.DesktopGroupName
$catalogUID = $details.CatalogUid
$HypervisorConnectionUid = $details.HypervisorConnectionUid
$username = [String]$details.AssociatedUserNames

$vcenter = $details.HypervisorConnectionName

Connect-VIServer $vcenter
$UUID = Get-VM $machine | %{(Get-View $_.id).config.uuid}

Remove-BrokerMachine -MachineName $downLevelMachine -DesktopGroup $desktopGroup -Force -AdminAddress $DDC
Remove-BrokerMachine -MachineName $downLevelMachine -Force -AdminAddress $DDC
New-BrokerMachine -CatalogUid $catalogUID -MachineName $downLevelMachine -HypervisorConnectionUid $HypervisorConnectionUid -HostedMachineId $UUID -AdminAddress $DDC
Add-BrokerMachine -MachineName $downLevelMachine -DesktopGroup $desktopGroup -AdminAddress $DDC
Add-BrokerUser -name $username -Machine $downLevelMachine -AdminAddress $DDC

