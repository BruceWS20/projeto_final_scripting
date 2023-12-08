 # Script para criar passwords aleatórias
 generate_password() {
    length=$1
    password=""
    
    for ((i=0; i<$length; i++))
    do
       # Gera automáticamente um número aleatório para decidirmos se o próximo caractere é um número ou não
        random=$((RANDOM % 2))

        if [ $random -eq 0 ]; then
            # Gera automáticamente um número entre 0 e 9
            password="${password}$(($RANDOM % 10))"
        else
           # Gera autmáticamente um caractere aleatório da tabela ASCII entre 65 e 125 (Maiúsculas, minúsculas e simbolos)
            password="${password}$(printf \\$(printf '%03o' $((RANDOM % 60 + 65))))"
        fi
    done
    
    echo "$password"
}

# Leitura dos dados
read -p "Número de caracteres: " length
read -p "Quantas passwords?: " count

echo "A criar $count passwords com número de caracteres $length..."

# Output do Script
for ((i=0; i<$count; i++))
do
    password=$(generate_password $length)

    echo $password
done