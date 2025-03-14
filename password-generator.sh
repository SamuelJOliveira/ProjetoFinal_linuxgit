#!/bin/bash

# Definir conjuntos de caracteres
CARACTERES="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# Essa linha gera uma senha quando o script é executado
senha=$(cat /dev/urandom | tr -dc "$CARACTERES" | fold -w 10 | head -n 1)

# Interpretar os argumentos:
# (Complete o código com as outras funcionalidades usando o elif)
if [ "$1" = "-h" ]; then
  echo -e "Bem vindo ao password-generator! Versão 1.0, (c) 2025, Arthur Ronald e Samuel Jacome,DIMAp, UFRN
Uso: ./password-generator.sh [OPÇÕES]:

Opções:

-p : Listar as senhas geradas
-c : Limpar as senhas do arquivo passwords.txt
-h : Exibir esse menu

O comportamento padrão do script é gerar uma senha de 10 caracteres."
  exit
elif [ "$1" = "-p" ]; then
  cat password.txt

  exit
elif [ "$1" = "-c" ]; then

   > password.txt
  exit
fi

# Imprime a senha gerada
# Adicione aqui também a implementação do código que salva a senha no passwords.txt e cria o arquivo caso ele não exista
# Dica: lembre-se de utilizar o operador "-e" junto com a condicional "if"!
echo "Senha gerada: $senha"
if [ -e "password.txt" ]; then
	echo "$senha" > password.txt

else
	touch "password.txt"
	echo "$senha" > password.txt
fi
