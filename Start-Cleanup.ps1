Function Start-Cleanup {
    
    $ErrorActionPreference = "silentlycontinue"

    ## Deletes the contents of the Windows Temp folder.
    Get-ChildItem "C:\Windows\Temp\*" -Recurse -Force | Remove-Item -force -recurse -Verbose -ErrorAction $ErrorActionPreference
    Write-host "The Contents of Windows Temp have been removed successfully!" -NoNewline -ForegroundColor Green
    Write-Host "[DONE]" -ForegroundColor Green -BackgroundColor Black

    ## Deletes all files and folders in user's Temp folder
    Get-ChildItem "C:\users\*\AppData\Local\Temp\*" -Recurse -Force | Remove-Item -force -recurse -Verbose -ErrorAction $ErrorActionPreference
    Write-Host "The contents of TEMP have been removed successfully!" -NoNewline -ForegroundColor Green
    Write-Host "[DONE]" -ForegroundColor Green -BackgroundColor Black

    ## Removes all files and folders in user's Temporary Internet Files
    Get-ChildItem "C:\users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force | Remove-Item -Force -Recurse -Verbose -ErrorAction $ErrorActionPreference
    Write-Host "All Temporary Internet Files have been removed successfully!" -NoNewline -ForegroundColor Green
    Write-Host "[DONE]" -ForegroundColor Green -BackgroundColor Black

    ## Completed Successfully!

    Write-host "Script finished" -NoNewline -ForegroundColor Green
    Write-Host "[DONE]" -ForegroundColor Green -BackgroundColor Black

}
Start-Cleanup
