# Lab for Chapter 10: The pipeline, deeper
# Created aliases.txt

# Use a CSV to run multiple inputs into one piped command
Import-Csv -Path .\ps-month-of-lunches\chapter-10-the-pipeline-deeper\aliases.txt
Import-Csv -Path .\ps-month-of-lunches\chapter-10-the-pipeline-deeper\aliases.txt | Get-Member
Import-Csv -Path .\ps-month-of-lunches\chapter-10-the-pipeline-deeper\aliases.txt | New-Alias
Get-Alias

import-csv .\newusers.csv | select-object -property *,
@{name='samAccountName';expression={$_.login}},
@{label='Name';expression={$_.login}},
@{n='Department';e={$_.Dept}}

Import-Csv -Path ".\newusers.csv" | Select-Object -Property *,
@{Name='samAccountName';Expression = { $_.login }},
@{Name='Name';Expression = { $_.login }},
@{Name='Department';Expression = { $_.Dept }}

