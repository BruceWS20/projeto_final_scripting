#!/bin/bash

# Simular o login
echo "Simulação de Login"

# Criar um ficheiro txt de utilizadores
echo "Rui:bash2024" > utilizadores.txt
echo "André:28592" >> utilizadores.txt
echo "Pedro:github123" >> utilizadores.txt

# Pedir a introdução de um nome de utilizador
read -p "Escreva o nome de utilizador: " username

# Pedir a introdução de uma password
read -s -p "Escreva a password: " password
echo

# Verificar as credenciais no ficherio de utilizadores
grep -q "^$username:$password$" utilizadores.txt

# Verificar o resultado e exibir a mensagem apropriada
if [ $? -eq 0 ]; then
    echo "Utilizador autenticado!"
else
    echo "Credenciais inválidas."
fi
