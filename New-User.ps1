#Creer un nouvel utilisateur, creer son dosier personnelle et partagé celui-ci.


$Name = Read-host "Quel est le prénom et le nom de l'utilisateur"

$SamAccountName = Read-Host "Quel est le Login de l'utilisateur"

$password = read-host "Quel est le mot de passe de l'utilisateur"

New-ADuser -Name $Name  -SamAccountName $SamAccountName  -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Enabled $true 

New-Item -path "c:\DP\" -name $Samaccountname -Type Directory

New-Smbshare -Name $SamAccountName -FullAccess $SamAccountName 

if (@(Get-ADUser -Filter {SamAccountName -eq ""}).count -eq 0)

{ Write-Warning -Message "L'utilisateur n'existe pas."}


Exit 1