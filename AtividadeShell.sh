#!/bin/bash
username=$0
password=$1
initDir=$2
group=$3

if [ -z "$username" -o -z "$password" -o -z "$initDir" -o -z "$group" ]; then
	echo "Erro 00: Campo nulo"
else
	sudo useradd -gid [$group] –home [$initDir] $username
	if [ $? ]; then
		echo "Erro 01: Campo invalido"
	fi

	passwd $password
	if [ $? ]; then
		echo "Erro 02: password invalido"
	fi

fi

=======================================================================================

#!/bin/bash
opc=$0

sudo apt-get install net-tools

if [ $1 = "Ativar" ]; then
	sudo ifconfig enp0s3 up
fi

if [ $1 = "Desativar" ]; then
	sudo ifconfig enp0s3 down
fi

#=======================================================================================

#em Anime1() ele entra em uma repetição enquanto procura por processos que tenhão o padrão de string "$!" 
#apos isso ele incrementa i ate que se chege a 11 com um comando de pausa de 0.05 para cada loop feito
#apos isso ele entra em uma repetiçaõm que ira decrementar o i ate 2 tambem com um comando de pausa de
#0.05 em seu meio. não compreendi o funcionamento da funçaõ sed e por tanto não sei como se sai do while.

#ja em Anime2() utiliza a função spinner para criar uma "barra de progreção" onde ira se passar todos os 
#caracteres nele registrados dentro dele á um codigo de loop para percorrer esse spinner com um certo atraso

#para finalizar ira ter uma pausa de 3 executar o Anime1 dar outra pausa de 3 e executar Anime2 

#em geral ele executa uma barra de carregamento
#========================================================================================
#!/bin/bash

opc=$"0"


while [ $opc != "4" ]
    echo "selecione uma opcao"
    echo "1 - Data e hora"
    echo "2 - User logado"
    echo "3 - Não use essa"
    echo "4 - Sair"

    read $opc

    case opc in 
        1)
            date ;;
        2) 
            whoami ;;
        3)
            echo "Desordeiro tsc tsc" ;;
        *)
            echo "Opcao invalida" ;;
    esac
done

#========================================================================================
#!/bin/bash

opc=$"0"
num=$"0"
num2=$"0"

while [ $opc != "5" ]
    echo "selecione uma opcao"
    echo "1 - Soma"
    echo "2 - Subtração"
    echo "3 - Multiplicacao"
    echo "4 - Divisao"
    echo "5 - Sair"

    read $opc

    echo "informe os numeros a ser trabalhados"
    read $num
    read $num2

    case opc in 
        1)
            res=$(num + num2)
            echo res ;;
        2) 
            res=$(num - num2)
            echo res ;;
        3)
            res=$(num * num2)
            echo res ;;
        4)
            res=$(num / num2)
            echo res ;;
        *)
            echo "opcao invalida" ;;
    esac
done

#========================================================================================
#!/bin/bash

n=($0 $1 $2 $3 $4 $5 $6 $7 $8 $9)
aux=$"0"

for (( i=0; i<10; i++)); do
    for (( j=0; j<10; j++)); do
        if [ ${n[$i]} -gt ${n[$j]} ]; then
            aux=${n[$j]}
            ${n[$j]}=${n[$i]}
            ${n[$i]}=aux
        fi
    done
done

echo n[*]

#========================================================================================
#!/bin/bash

app=$0

sudo apt-get upgrade $app
if [$?]; then
    sudo apt-get install $app

#========================================================================================
#!/bin/bash

#não encontrei comando que realiza corretamente...
#export PS1 = ”\ [$(tput setaf 1) \] \ [$(tput setab 7) \] \ u @ \ h: \ w $\ [$(tput sgr0) \]”
#export PS1="\e[0;32m[\u@\h \W]\$ \e[0m"
#achei esses porem não entendi seus funcionamentos 

#========================================================================================
#!/bin/bash
#um Timer
temp=$0
j=$"0"
spinner=(.oO8)

for ((i=0; i<$temp; i++)); do
    sleep 1
    echo spinner[j]
    j++
    if [ j -gt "4" ]; then
        j="0"
    fi
done
