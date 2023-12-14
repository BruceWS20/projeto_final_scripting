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

# Função para ver as passwords no ficheiro txt
view_passwords() {
    nome_ficheiro="passwords.txt"
    if [ -e "$nome_ficheiro" ]; then
        echo "Senhas armazenadas em $nome_ficheiro:"
        cat "$nome_ficheiro"
    else
        echo "Nenhum ficheiro de passwords encontrado."
    fi
}

# Opção para ver passwords antes de criar novas
read -p "Deseja ver as passwords existentes? (s/n): " view_option
if [ "$view_option" == "s" ]; then
    view_passwords
fi

# Leitura dos dados
read -p "Número de caracteres: " length
read -p "Quantas passwords?: " count

echo "A criar $count passwords com número de caracteres $length e a guardar em $nome_ficheiro..."

# Parte do Script para guardar as passwords num ficheiro

# Nome do ficheiro para armazenar as passwords
nome_ficheiro="passwords.txt"

# Verificar se o ficheiro já existe; se não, criar um novo
if [ ! -e "$nome_ficheiro" ]; then
    touch "$nome_ficheiro"
fi

# Output do Script
for ((i=0; i<$count; i++)); 
do
    password=$(generate_password $length)
    echo "Password $(($i + 1)) de $(($count)): $password"
    echo "$password" >> "$nome_ficheiro"
done
echo "Passwords armazenadas em $nome_ficheiro."


