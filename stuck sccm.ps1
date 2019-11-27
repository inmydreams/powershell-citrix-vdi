$machine = ''
$advertID = ''
$packageID = ''
 
foreach($i in gwmi -ComputerName $machine -Namespace root/ccm/policy/machine/actualconfig -Class ccm_softwaredistribution -Filter "ADV_AdvertisementID='$advertID'")
{
    Write-Host Removing ccm_softwaredistribution start
    Write-Host AdvertID: ($i.ADV_AdvertisementID)
    Write-Host Package: ($i.PKG_Name)
    $i.delete()
    Write-Host Removing ccm_softwaredistribution end
}
 
foreach($i in gwmi -ComputerName $machine -Namespace ROOT/ccm/SoftMgmtAgent -Class ccm_Tsexecutionrequest -Filter "ContentID='$packageID'"){
    Write-Host Removing ccm_Tsexecutionrequest start
    Write-Host PackageID: ($i.ContentID)
    Write-Host Package: ($i.MIFPackageName)
    $i.delete()
    Write-Host Removing ccm_Tsexecutionrequest end
} 