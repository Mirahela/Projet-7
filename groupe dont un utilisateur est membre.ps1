 
 Param(
     $user= ""
 )

 if( $user -eq ""){

        $user = read-host "Qui est l'utilisateur ?"
 
 }

   Get-ADuser -Identity $user -properties memberof | Select-Object memberof |Format-List

 

  exit 1