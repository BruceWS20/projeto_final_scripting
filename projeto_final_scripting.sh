 generate_password() {
    length=$1
    password=""
    
    for ((i=0; i<$length; i++))
    do
       
        random=$((RANDOM % 2))

        if [ $random -eq 0 ]; then
            
            password="${password}$(($RANDOM % 10))"
        else
           
            password="${password}$(printf \\$(printf '%03o' $((RANDOM % 26 + 65))))"
        fi
    done
    
    echo "$password"
}


read -p "Número de caracteres: " length
read -p "Quantas passwords?: " count

echo "A criar $count passwords com número de caracteres $length..."


for ((i=0; i<$count; i++))
do
    password=$(generate_password $length)

    echo $password
done