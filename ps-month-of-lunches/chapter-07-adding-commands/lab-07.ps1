# Lab for Chapter 7: Adding commands

(Get-Content Env:/PSModulePath) -split ':'

# Cleaned up my DISGUSTING file paths holy moly

# Finished reading chapter

# Start of lab --------------------------

# Browse the PowerShell Gallery. Find a module or two that you think sounds interesting and install it.
# Already got a boat load of modules

# Browse the available commands for the module you just downloaded
Get-Module -ListAvailable
Get-Command -Module ExchangeOnlineManagement

# Use the commands from section 7.2 to find and install (if needed) the latest-version module by Microsoft for working with archives that contain the command Compress-Archive
Install-Module -Name Microsoft.PowerShell.Archive

# Import the module you just installed.
Import-Module -Name Microsoft.PowerShell.Archive

# Create a Tests folder for the next step with 10 files in it, and name it ~/TestFolder.
Set-Location -Path ./ps-m*/Chapter-07*
New-item -Path ./ -Name TestFolder -ItemType Directory
Set-Location -Path .\TestFolder
Help New-item -Full
New-Item -Path "1.txt", "2.txt", "3.txt", "4.txt", "5.txt", "6.txt", "7.txt", "8.txt", "9.txt", "10.txt" -ItemType File
Help Compress-Archive -Full
Compress-Archive -Path ./* -DestinationPath ./ -WhatIf
Compress-Archive -Path ./* -DestinationPath ./ -Confirm
New-item -Path ./TestFolder2 -ItemType Directory
Get-Command -Noun *Item*
Remove-item -Path ./TestFolder2 -Confirm
Set-Location ..
New-item -Path ./TestFolder2 -ItemType Directory
Get-Command -Noun *Archive
Help Expand-Archive -Full
Expand-Archive -Path ./TestFolder.zip -DestinationPath ./TestFolder2 -Confirm

# Use Compare-Object and Select-Object -ExpandProperty Name to compare just the names of the files in the folders to verify you have the same files.
Help Compare-Object -Full
Compare-Object -ReferenceObject .\TestFolder.\* -DifferenceObject .\TestFolder2.\*
# ??? - unable to do this, book answer below (which I now understand however this book has not covered arrays yet)
$reference = Get-ChildItem cd TestFolder| Select-Object -ExpandProperty name
$difference = Get-ChildItem ~/TestFolder3| Select-Object -ExpandProperty name
Compare-Object -ReferenceObject $reference -DifferenceObject $difference
# Adapted this to work with my folders and added -IncludeEqual
$reference = Get-ChildItem ./TestFolder | Select-Object -ExpandProperty name
$difference = Get-ChildItem ./TestFolder2 | Select-Object -ExpandProperty name
Compare-Object -ReferenceObject $reference -DifferenceObject $difference -IncludeEqual