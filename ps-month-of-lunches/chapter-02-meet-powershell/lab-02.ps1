# Lab for Chapter 2: Meet PowerShell

# Turned tab completion on

# Auto-complete or cycle through commands or paramaters with with tab e.g Get-P [TAB] or Get-Process -[TAB] [TAB] [TAB] [TAB]
Get-Package
Get-PrinterProperty

Get-Process -IncludeUserName
Get-Process -Name

#  Dir is an alias of Get-ChildItem, it is poor practice to use it. / = root . = current drive
dir /
dir .
dir ..

# I noticed I was in a different directory to my .ps1, in the spirit of this chapter I used the alias again
cd ..
dir .
cd ./chapter-02*

# Changed some settings for VSCode, synced these to GitHub
#'`~()[]<>{}