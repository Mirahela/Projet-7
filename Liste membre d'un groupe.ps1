#C'est un script interactif et silencieux.

#
Param(
  $NomGroupe = ""
  )

if( $NomGroupe -eq ""){
        $NomGroupe = read-host "Quel est le nom du groupe"
}

$users = Get-ADGroupMember -identity $NomGroupe -recursive | Select name
$users | export-Csv -Path c:\scripts\Export-Members-$NomGroupe.csv -Encoding UTF8 -NoTypeInformation
 
$users 
write-host "Le fichier est disponible ici : c:\scipts\Export-Members-$Nomgroupe.csv" -Foregroundcolor Cyan

exit 1