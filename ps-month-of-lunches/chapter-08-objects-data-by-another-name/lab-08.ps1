# Lab for Chapter 8: Objects: Data by another name
Get-Process
Get-Process | Get-Member
Get-Process | Sort-Object -Property CPU
Get-Process | Sort-Object -Property CPU -Descending
Get-Process | Sort-Object CPU,ID -desc
Get-Process | ConvertTo-Html | Out-File test1.html
Get-Process | Select-Object -Property Name,ID,CPU,PM | ConvertTo-Html | Out-File test2.html
Move-Item -Path ./test?.html -Destination ./ps-month-of-lunches/chapter-08-objects-data-by-another-name
Get-Process | Sort-Object CPU -Descending | Select-Object Name,ID,CPU
Get-Process | Sort-Object CPU -Descending | Get-Member
Get-Process | Sort-Object CPU -Descending | Select-Object Name,ID,CPU | Get-Member
Get-Process | Get-Member | Get-Member

# Start of lab =====================

# Identify a cmdlet that produces a random number.
Get-Command *Number*
Get-Command *Random*
Get-Random

# Identify a cmdlet that displays the current date and time.
Get-Date


# What type of object does the cmdlet from task 2 produce? (What is the TypeName of the object produced by the cmdlet?).
Get-Date | Get-Member
# System.DateTime

# Using the cmdlet from task 2 and Select-Object, display only the current day of the week in a table.
Get-Date | Select-Object DayOfWeek

# Identify a cmdlet that will show you all the times in a directory.
Get-ChildItem

# Using the cmdlet from task 5, display all the times in the directory of your choice.
# Then extend the expression to sort the list by the time the items were created and display only the filename(s) and the date created.
Get-ChildItem -Path ./ | Sort-Object CreationTime

# Repeat task 6, but this time sort the items by the last write time; then display the filename, creation time, and the last write time. Save this in a CSV file and an HTML file.
Set-Location ./ps-month-of-lunches/chapter-08-objects-data-by-another-name
Get-ChildItem -Path ./ | Sort-Object LastWriteTime | Select-Object Name, CreationTime, LastWriteTime | Export-CSV ChildItemNameTimeWrite.csv
Get-ChildItem -Path ./ | Sort-Object LastWriteTime | Select-Object Name, CreationTime, LastWriteTime | ConvertTo-HTML | Out-File ChildItemNameTimeWrite.html