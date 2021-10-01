
Copy-Item -Path C:\Users\$($env:username)\Documents\ -recurse -Destination \\SRVIMP02\Sauvegarde\$($env:username)\ -force