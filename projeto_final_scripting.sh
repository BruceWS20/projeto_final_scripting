# Função para gerar passwords aleatórias
generate_password() {
    length=$1
    password=""
    
    for ((i=0; i<length; i++)); do
       # Gera automaticamente um número aleatório para decidirmos se o próximo caractere é um número ou não
        random=$((RANDOM % 2))

        if [ $random -eq 0 ]; then
            # Gera automaticamente um número entre 0 e 9
            password="${password}$(($RANDOM % 10))"
        else
           # Gera automaticamente um caractere aleatório da tabela ASCII entre 65 e 125 (Maiúsculas, minúsculas e símbolos)
            password="${password}$(printf \\$(printf '%03o' $((RANDOM % 60 + 65))))"
        fi
    done
    
    echo "$password"
}

# Nome do ficheiro para armazenar as passwords
nome_ficheiro="passwords.txt"

# Função para ver as passwords no ficheiro txt
view_passwords() {
    if [ -e "$nome_ficheiro" ]; then
        echo "Passwords armazenadas em $nome_ficheiro:"
        cat "$nome_ficheiro"
    else
        echo "Nenhum ficheiro de passwords encontrado."
    fi
}

# Opção para ver passwords antes de criar novas
read -p "Deseja ver as passwords existentes? (s/n): " view_option
if [ "$view_option" == "s" ]; then
    view_passwords
else
    # Leitura dos dados apenas se a opção for negativa
    read -p "Número de caracteres: " length
    read -p "Quantas passwords?: " count

    echo "A criar $count passwords com número de caracteres $length e a guardar em $nome_ficheiro..."

    # Verificar se o ficheiro já existe; se não, criar um novo
    if [ ! -e "$nome_ficheiro" ]; then
        touch "$nome_ficheiro"
    fi

    # Output do Script
    for ((i=0; i<count; i++)); do
        password=$(generate_password "$length")
        echo "$password"
        echo "$password" >> "$nome_ficheiro"
    done

    echo "Passwords armazenadas em $nome_ficheiro."
fi


