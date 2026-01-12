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

# Create two similar, but different, text files. Try comparing them by using Compare-Object.
Set-Location -Path C:\Code\powershell-months-of-lunches\ps-month-of-lunches\chapter-06-the-pipeline-connecting-commands
Help New-Item -Full
New-Item -Path . -Name "comparefile1.txt" -ItemType "File" -Value "123456"
New-Item -Path . -Name "comparefile2.txt" -ItemType "File" -Value "654321"
Help Compare-Object -Full
Compare-Object -ReferenceObject (Get-Content ./comparefile1.txt) -DifferenceObject (Get-Content ./comparefile2.txt)

# What happens if you run Get-Command | Export-CSV commands.CSV | Out-File from the console? Why does that happen?
Get-Command | Export-CSV commands.CSV | Out-File
# An empty file is created, this is becuase Export-CSV is not designed to push anything down the pipeline so Out-File has nothing for the value of the file

# Apart from getting one or more jobs and piping them to Stop-Job, what other means does Stop-Job provide for you to specify the job or jobs you want to stop?
# Is it possible to stop a job without using Get-Job at all?
Help Get-Job
Help Stop-Job
# You can use the -Name and -Job paramaters to specify specific jobs, you can also use Ctr+C to stop the current job.