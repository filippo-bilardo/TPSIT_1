linea="10,msg,ciao mondo"
fld3=$(echo $linea | cut -d, -f 3 )
echo $fld3
fld2=$(echo $linea | cut -d, -f 3 )
echo $fld2
