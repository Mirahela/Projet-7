#Creer un nouvel utilisateur, creer son dosier personnelle et partagé celui-ci.

$erroractionreference = "stop"

$Name = Read-host "Quel est le prénom et le nom de l'utilisateur"

$SamAccountName = Read-Host "Quel est le Login de l'utilisateur"

$password = read-host "Quel est le mot de passe de l'utilisateur"

New-ADuser -Name $Name  -SamAccountName $SamAccountName  -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Enabled $true 

New-Item -path "c:\DP\" -name $Samaccountname -Type Directory

New-Smbshare -Name $SamAccountName -FullAccess $SamAccountName 

#try { $ADUser = Get-ADuser -Identity $name -erroraction stop }

#catch 
#{Write-Warning "L'utilisateur existe déjà" 
 #      break
  #  }

  
$existe = get-ADUser -Filter "SamAccountName -eq '$Username'"

if ($existe -eq $null){Write-host "L'utilisateur n'existe pas" }
else{stop}
 



Exit 1