 Get-ADUser "afirmerie" -Properties memberof | Select-Object Memberof | format-list
