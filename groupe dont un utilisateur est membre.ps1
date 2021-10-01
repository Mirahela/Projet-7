#C'est un script interactif et silencieux.

#Je rentre mes paramètres, utilisateur est égal à "vide"
 Param(
     $user= ""
 )

#Si l'utilisateur est égal à vide alors je demande à ce que l'utilisateur soit rentré manuellement.
 if( $user -eq ""){

        $user = read-host "Qui est l'utilisateur ?"
 
 }

#cmdlet permettant d'avoir la list des groupes dont est membre l'utilisateur.
 Get-ADprincipalgroupmembership -identity $user  | select name

#Variable génération de fichier CSV.
$nomgroupe | export-Csv -Path c:\scripts\Export-Members-$user.csv -Encoding UTF8 -NoTypeInformation

#Variable informant de l'endroit ou le fichier a été généré.
$nomgroupe
write-host "Le fichier est disponible ici : c:\scipts\Export-Members-$user.csv" -Foregroundcolor Cyan

  #Code retour d'erreur.
  exit 1