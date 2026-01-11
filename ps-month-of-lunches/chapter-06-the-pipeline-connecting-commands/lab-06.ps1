# Lab for Chapter 6: The pipeline: Connecting commands

# Create a CSV of running processes and open in VSCode and terminal
Set-Location -Path ./ps-month*/chapter-06*
Get-Process
Get-Process | Export-CSV ./lab-process-test1.csv
code ./lab-process-test1.csv
Import-CSV .\lab-process-test1.csv

# Convert data from Get-Process to JSON and then save as a .JSON file. Second command is to open this in terminal.
Get-Process | ConvertTo-Json | Out-File procs.json
Get-Content ./procs.json | ConvertFrom-Json

# Check avaliable import and export commands
Get-Command -Verb *export*
Get-Command -Verb *import*

# Exports the output from command to flaat file
Get-ChildItem | Select-Object Name | Out-File process.txt

# Compare my running programs before and after opening a bunch of programs
help Compare-Object
Get-Process | Export-CliXML reference.xml
Get-Process | Export-CliXML current.xml 
Compare-Object -Reference (Import-Clixml reference.xml) -Difference (Import-Clixml current.xml) -Property Name
# Can also just compare the stored data vs the current data
Compare-Object -Reference (Import-Clixml reference.xml) -Difference (Get-Process) -Property Name

# Get processes, convert to HTML and create a file that can be opened
Get-Process -Id $PID | ConvertTo-Html | Out-File website.html

# What if is useful to see what a command would do, useful for high impact commands
Get-Process | Stop-Process –WhatIf

# Start of lab