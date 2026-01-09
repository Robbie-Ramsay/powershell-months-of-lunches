# Lab for Chapter 4: Running commands

# Use the following path to set execution policy
# Computer Configuration > Policies > Administrative Templates > Windows Components > Windows PowerShell
# Alternatively run the Set-ExecutionPolicy command
Set-ExecutionPolicy Unrestricted

# Display a list of running processes.
Get-Process

# Test the connection to google.com or bing.com without using an external command like ping.
Test-Connection google.com

# Display a list of all commands that are of the cmdlet type.
Get-Command -CommandType Cmdlet

# Display a list of all aliases.
Get-Alias

# Make a new alias, so you can run ntst to run netstat from a PowerShell prompt.
Help Set-Alias
Set-Alias -Name ntst -Value netstat

# Display a list of processes that begin with the letter p.
Get-Process -Name P*

# Make a new folder (aka directory) using the New-Item cmdlet with the name of MyFolder1. Then do it again and call it MyFolder2.
Get-ChildItem
Get-ChildItem ./ps-month-of-lunches
Set-Location  ./ps-month-of-lunches/chapter-04-running-commands
Help New-Item -Examples
New-Item -Name MyFolder1 -ItemType Directory
New-Item -Name MyFolder2 -ItemType Directory

# Remove the folders from step 7 in a single command.
Get-ChildItem
Get-Command *Item*
Remove-Item .\MyFolder*
Get-ChildItem