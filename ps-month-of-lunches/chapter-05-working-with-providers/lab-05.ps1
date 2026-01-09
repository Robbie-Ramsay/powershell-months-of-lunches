# Lab for Chapter 5: Working with providers

# Providers are basically just directories that store information (in the end, isn't everything just data lol)
# These include the File Directory, Windows Settings, RegEdit...
Get-PSProvider
Get-PSDrive

# You interact with these with the Verb-Item commands
Get-Command -Noun *Item*

# Exploring
Get-ChildItem Env:*
Set-Item -Path Env:/A -Value 1
Get-ChildItem Env:A
Set-Item -Path Env:/A -Value 1
Remove-Item -Path Env:/A

# RegEdit
Set-Location -Path HKCU:
Set-Location -Path .\Software
Get-ChildItem
Set-Location -Path .\Microsoft
Get-ChildItem
Set-Location -Path .\Windows
Get-ChildItem
Set-ItemProperty -Path dwm -PSProperty EnableAeroPeek -Value 0
Get-ChildItem
Set-ItemProperty -Path dwm -PSProperty EnableAeroPeek -Value 1
Set-Location C:\Code\powershell-months-of-lunches

# Create a new directory called Labs.
Get-Command -Noun *Item*
New-Item Labs -ItemType Directory
Get-ChildItem

# Create a zero-length file named /Labs/Test.txt (use New-Item)
Set-location ./Labs
New-item Test.txt

# Is it possible to use Set-Item to change the contents of /Labs/Test.txt to -TESTING?
Set-Item .\Test.txt 1
# Set-Item: Provider operation stopped because the provider does not support this operation.

# Using the Environment provider, display the value of the system environment variable PATH.
Get-Item -Path ENV:/PATH

# Use help to determine what the differences are between the -Filter, -Include, and -Exclude parameters of Get-ChildItem.
Help Get-ChildItem -Full