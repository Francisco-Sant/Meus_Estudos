#!/usr/bin/env bash

fruta=(banana laranja abacate)

while true; do

      clear

      echo "1. Banana"
      echo "2. Laranja"
      echo "3. Abacate"
      echo "4. Sair"

      read -p " Escolha o número da sua opção: " opt

      [[ $opt -eq 4 ]] && break
      echo "Você escolheu ${fruta[$(( $opt -1 ))]}."

      read -p "Tecle algo para continuar..." continuar

done

# O loop while é configurado para rodar indefinidamente (true), garantindo que o menu seja exibido continuamente até que o usuário escolha sair.
# Se o valor de opt for 4, o comando break é executado, encerrando o loop e, consequentemente, o programa.
# Caso o usuário escolha uma opção diferente de 4, o script exibe a fruta correspondente à escolha.
# A expressão ${fruta[$(( $opt -1 ))]} acessa o elemento do array fruta com base no índice fornecido:
# O índice é calculado como opt - 1 porque os arrays em Bash começam no índice 0.
