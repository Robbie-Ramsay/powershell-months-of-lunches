# Lab for Chapter 10: The pipeline, deeper
# Created aliases.txt

# Use a CSV to run multiple inputs into one piped command
Import-Csv -Path .\ps-month-of-lunches\chapter-10-the-pipeline-deeper\aliases.txt
Import-Csv -Path .\ps-month-of-lunches\chapter-10-the-pipeline-deeper\aliases.txt | Get-Member
Import-Csv -Path .\ps-month-of-lunches\chapter-10-the-pipeline-deeper\aliases.txt | New-Alias
Get-Alias

# login,dept,city,title
# TylerL,IT,Seattle,IT Engineer
# JamesP,IT,Chattanooga,CTO
# RobinL,Custodial,Denver,Janitor
Import-Csv -Path ".\newusers.csv" | Select-Object -Property *,
@{Name='samAccountName';Expression = { $_.login }},
@{Name='Name';Expression = { $_.login }},
@{Name='Department';Expression = { $_.Dept }}

# Connect to Azure
Get-Command -Verb Connect
Connect-AzAccount
Get-AZContext
Get-Command -Noun AZ*

Get-Module -ListAvailable
# Created modules.txt
Get-Command -Module (Get-Content ./modules.txt)
Get-Content ./modules.txt | Get-Command

Get-AzResourceGroup -Location uksouth
Get-Command -Noun *Subscription* -Module AZ*

Get-AzContext

Select-AzSubscription LabSub1

New-AzResourceGroup -Name PSMOL -Location 'UK South' -Confirm

# Would the following command work to retrieve a list of commands from modules that start with Microsoft.* on the current machine?
Get-Command -Module (Get-Module -ListAvailable -Name Microsoft.* | Select-Object -ExpandProperty name)
# Breaking down command
Get-Module -ListAvailable -Name Microsoft.*
Get-Module -ListAvailable -Name Microsoft.* | Select-Object -ExpandProperty name
# Get-Module find all modules from Microsoft. Select-Object -ExpandProperty then takes only name property and turns it into a string
Get-Module -ListAvailable -Name Microsoft.* | Select-Object -Property name
# Note that -Property will give the same output in the terminal, but the data is actually a PSObject! not a string!! This would not work with Get-Command -Module!!!
# You could test the above using | Get-Member

# Would this alternative command work to retrieve the list of commands from the same modules?
Get-Module -ListAvailable -Name Microsoft.* | Get-Command
Get-Module -ListAvailable | Get-Member
Get-Help Get-Command -Full
#Get-Module does not create a string. Get-Command -Module only accepts a string and Accept Pipeline Input is set to false. (Not that this matters as Get-Module does not output any property called "module". only "name".

# Would this set the subscription in the Azure context? Consider if Get- AzSubcription retrieves multiple subscriptions.
Get-AzSubscription | Select-AzSubscription
Get-AzSubscription | Get-Member | Select-Object -First 1
Get-Help Select-AzureSubscription -Full
Update-Help