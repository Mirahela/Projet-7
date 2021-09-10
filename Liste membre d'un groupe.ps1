#C'est un script interactif et silencieux.

#Je rentre mes paramètre, Nom de groupe égal vide.
Param(
  $NomGroupe = ""
  )

#Si le nom est egal à "vide", alors demander à ce que le nom de groupe a rentrer manuellement.
if( $NomGroupe -eq ""){
        $NomGroupe = read-host "Quel est le nom du groupe" 
}

#Variable utilisateur
$users = Get-ADGroupMember -identity $NomGroupe -recursive | Select name

#Variable génération de fichier CSV.
$users | export-Csv -Path c:\scripts\Export-Members-$NomGroupe.csv -Encoding UTF8 -NoTypeInformation

#Variable informant de l'endroit ou le fichier à était généré.
$users 
write-host "Le fichier est disponible ici : c:\scipts\Export-Members-$Nomgroupe.csv" -Foregroundcolor Cyan

#Code retour d'erreur.
exit 1