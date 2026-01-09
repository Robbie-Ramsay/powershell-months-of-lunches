# Lab for Chapter 3: Using the help system

# Run update-help monthly
Update-Help

# Get-Help = Help. Help is generally preferred as it is page by page. Press Q to exit out of pages early.
help Get-Content
Get-Help Get-Content

# *=wildcard ?=one letter wildcard
help Get-Content
help Get-Cont*
help Get-Cont?nt

# Get-Command is very similar to Get-Help but searches for commands instead of help articles (basically every...
# command has a help article so close enough to the same command)

# Get-Command can be filtered by -noun and -verb
Get-Command -Verb Set
Get-Command -Noun A*

# If a parameter is fully encased in [] you need to specify it e.g: [-Stream <String[]>]
Get-Item -Stream value
# If a parameter is partially encased in [] you do not need to specify it but you can [-Path] <String[]>
Get-Item Value
Get-Item -Path Value

# Gain extra info such as paramater requirments and positions by using Help Verb-Noun -Full or Help Verb-Noun -Online
Help Get-Item -Full
Help Get-Item -Online

# Can you find any cmdlets capable of converting other cmdlets’ output into HTML
Get-Command -Noun *HTML*
# How many cmdlets are available for working with processes
Get-Command -Noun *Process*

# What cmdlet might you use to set to a PowerShell breakpoint?
Get-Command -Verb Set -Noun *breakpoint*
Set-PSBreakpoint

# What cmdlets are available to create, modify, export, or import aliases?
Get-Command -Noun *Alias*

# Is there a way to keep a transcript of everything you type in the shell, and save that transcript to a text file?
Get-Command -Noun *Transcript*
Help Start-Transcript
Start-Transcript
Stop-Transcript

# Getting all processes can be overwhelming. How can you get processes by the name of the process?
Help Get-Process
Get-Process -Name App*

# Is there a way to tell Get-Process to tell you the user who started the process?
help Get-Process
Get-Process -IncludeUserName

# Is there a way to run a command on a remote host?
Help *Host*
Get-Command *Invoke*
Help Invoke-Command
Help Invoke-Command -Examples
Invoke-Command -ComputerName Server01 -Credential Domain01\User01 -ScriptBlock {Get-Culture}

# Examine the help file for the Out-File cmdlet. The files created by this cmdlet default to a width of how many characters?
# Is there a parameter that would enable you to change that width?
help Out-File -Full
Out-File -Width 80

# By default, Out-File overwrites any existing file that has the same filename as what you specify.
# Is there a parameter that would prevent the cmdlet from overwriting an existing file?
Out-File -NoClobber

# How could you see a list of all aliases defined in PowerShell?
Get-Alias

# Using both an alias and abbreviated parameter names, what is the shortest command line
# you could type to retrieve a list of commands with the word process in the name?
gcm -na *process*

# How many cmdlets are available that can deal with generic objects?
Get-Command -Noun *object*

# This chapter briefly mentioned arrays. What help topic could tell you more about them?
help Array