#!/bin/bash

function scp_local_remoto () {
	dialog --title 'Implentacao - SCP Local -> Remoto' --msgbox 'Implementaremos o SCP Local -> Remoto!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then
		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota1 :' 10 60 )
                if [ -n "$maquina1" ]
                then
                        usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota1:' 10 60 )
                        if [ -n "$usuario1" ]
                        then
                                senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota1:' 10 60 )
                                if [ -n "$senha1" ]
                                then

					arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do caminho de destino:' 10 60 )
                                        if [ -n "$arquivo_remoto1" ]
                                        then

						/usr/bin/sshpass -p $senha1 scp -v $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
                                        	/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
                                        	dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
                                        	rm -f /tmp/temp.txt
					fi	
				fi
			fi
		fi
	
	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

}
function scp_remoto_local () {
	dialog --title 'Implentacao - SCP Remoto -> Local' --msgbox 'Implementaremos o SCP Remoto -> Local!' 20 60

	arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do caminho remoto + o nome do arquivo remoto a ser copiado:' 10 60 )
        if [ -n "$arquivo_remoto1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota1 :' 10 60 )
                if [ -n "$maquina1" ]
                then
                        usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota1:' 10 60 )
                        if [ -n "$usuario1" ]
                        then
                                senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota1:' 10 60 )
                                if [ -n "$senha1" ]
                                then

					arquivo1=$( dialog --stdout --inputbox 'Digite o nome do caminho de destino:' 10 60 )
                                        if [ -n "$arquivo_remoto1" ]
                                        then

						/usr/bin/sshpass -p $senha1 scp -v $usuario1@$maquina1:$arquivo_remoto1 $arquivo1 2>&1 | tee /tmp/temp.txt
                                        	ls -l $arquivo1 >> /tmp/temp.txt
                                        	dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
                                        	rm -f /tmp/temp.txt
					fi	
				fi
			fi
		fi
	fi
	
}
function rsync_local_remoto () {
	dialog --title 'Implentacao - RSYNC Local -> Remoto' --msgbox 'Implementaremos o RSYNC Local -> Remoto!' 20 60

        arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

                maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
                if [ -n "$maquina1" ]
                then
                        usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
                        if [ -n "$usuario1" ]
                        then
                                        arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do caminho para salvar o arquivo:' 10 60 )
                                        if [ -n "$arquivo_remoto1" ]
                                        then
                                                rsync -v $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
                                                dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
                                                rm -f /tmp/temp.txt
                                        fi
                        fi
                fi

        else
                dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
        fi

        clear

}
function rsync_remoto_local () {
	dialog --title 'Implentacao - RSYNC Remoto -> Local' --msgbox 'Implementaremos o RSYNC Remoto -> Local!' 20 60

        arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo remoto a ser copiado:' 10 60 )
        if [ -n "$arquivo_remoto1" ]
        then

                maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
                if [ -n "$maquina1" ]
                then
                        usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
                        if [ -n "$usuario1" ]
                        then
                                        arquivo1=$( dialog --stdout --inputbox 'Digite o nome do caminho local para salvar o arquivo:' 10 60 )
                                        if [ -n "$arquivo1" ]
                                        then
                                                rsync -v $usuario1@$maquina1:$arquivo_remoto1 $arquivo1 2>&1 | tee /tmp/temp.txt
                                                dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
                                                rm -f /tmp/temp.txt
                                        fi
                        fi
                fi

	fi
        clear
}

function remoto_remoto() {
	dialog --title 'Implentacao - Copias remoto para remoto' --msgbox 'Implementaremos a copia do remoto para o remoto!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo remoto1 a ser copiado:' 10 60 )

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota1 :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota1:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota1:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then


					maquina2=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota2 :' 10 60 )
       					if [ -n "$maquina2" ]
        				then
						usuario2=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota2:' 10 60 )
               					if [ -n "$usuario2" ]
               					then
               						senha2=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota2:' 10 60 )
                       					if [ -n "$senha2" ]
                       					then

               							arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do caminho de destino:' 10 60 )
                       						if [ -n "$arquivo_remoto1" ]
                       						then
									/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 "sshpass -p $senha2 scp -o StrictHostKeyChecking=no $arquivo1 $usuario2@$maquina2:$arquivo_remoto1"
									/usr/bin/sshpass -p $senha1 ssh $usuario2@$maquina2 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt


									# shpass -p caixa7876 ssh  root@10.123.20.179 "sshpass -p caixa7876 scp -o StrictHostKeyChecking=no /var/tmp/server.log root@10.123.20.107:/var/tmp"

									dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
									rm -f /tmp/temp.txt
								fi
							fi
						fi
					fi
				fi
			fi
		fi


	clear

}

function sair () {
	break
}

function scp1 () {

	dialog --title 'Implentacao1 - parametro -4' --msgbox 'Implementaremos o parametro -4!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
							/usr/bin/sshpass -p $senha1 scp -4 $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 >> /tmp/temp.txt
							/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
							dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
							rm -f /tmp/temp.txt
					fi
				fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}

function scp2 () {

	dialog --title 'Implentacao1 - parametro -c' --msgbox 'Implementaremos o parametro -C!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
							/usr/bin/sshpass -p $senha1 scp -C $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 >> /tmp/temp.txt
							/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
							dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
							rm -f /tmp/temp.txt
					fi
				fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}

function scp3 () {
	dialog --title 'Implentacao1 - parametro -c' --msgbox 'Implementaremos o parametro -p!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
							/usr/bin/sshpass -p $senha1 scp -p $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 >> /tmp/temp.txt
							/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
							dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
							rm -f /tmp/temp.txt
					fi
				fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function scp4 () {
	dialog --title 'Implentacao1 - parametro -4' --msgbox 'Implementaremos o parametro -q!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
							/usr/bin/sshpass -p $senha1 scp -q $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 >> /tmp/temp.txt
							/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
							dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
							rm -f /tmp/temp.txt
					fi
				fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function scp5 () {
	dialog --title 'Implentacao1 - parametro -v' --msgbox 'Implementaremos o parametro -v!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
							/usr/bin/sshpass -p $senha1 scp -v $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
							/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
							dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
							rm -f /tmp/temp.txt
					fi
				fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function scp6 () {
	dialog --title 'Implentacao1 - parametro -l' --msgbox 'Implementaremos o parametro -l!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               			senha1=$( dialog --stdout --passwordbox 'Digite a senha do usuario da maquina remota:' 10 60 )
                       		if [ -n "$senha1" ]
                       		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
							/usr/bin/sshpass -p $senha1 scp -l 1024 $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
							/usr/bin/sshpass -p $senha1 ssh $usuario1@$maquina1 ls -l $arquivo_remoto1 2>&1 >> /tmp/temp.txt
							dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
							rm -f /tmp/temp.txt
					fi
				fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear

}

function rsync1 () {
	dialog --title 'Implentacao1 - parametro -v' --msgbox 'Implementaremos o parametro -v!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
						rsync -v -e ssh $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
						dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
						rm -f /tmp/temp.txt
					fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function rsync2 () {
	dialog --title 'Implentacao1 - parametro -4' --msgbox 'Implementaremos o parametro -4!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
						rsync -v4 -e ssh $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
						dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
						rm -f /tmp/temp.txt
					fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function rsync3 () {
	dialog --title 'Implentacao1 - parametro -h' --msgbox 'Implementaremos o parametro -h!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
						rsync -vh -e ssh $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
						dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
						rm -f /tmp/temp.txt
					fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function rsync4 () {
	dialog --title 'Implentacao1 - parametro -z' --msgbox 'Implementaremos o parametro -z!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
						rsync -vz -e ssh $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
						dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
						rm -f /tmp/temp.txt
					fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function rsync5 () {
	dialog --title 'Implentacao1 - parametro -q' --msgbox 'Implementaremos o parametro -q!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
						rsync -q -e ssh $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
						dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
						rm -f /tmp/temp.txt
					fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}
function rsync6 () {
	dialog --title 'Implentacao1 - parametro -p' --msgbox 'Implementaremos o parametro -p!' 20 60

	arquivo1=$( dialog --stdout --inputbox 'Digite o nome completo do arquivo local a ser copiado:' 10 60 )
        if [ -f "$arquivo1" ]
        then

		maquina1=$( dialog --stdout --inputbox 'Digite o nome ou o IP da maquina remota :' 10 60 )
       		if [ -n "$maquina1" ]
        	then
			usuario1=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina remota:' 10 60 )
               		if [ -n "$usuario1" ]
               		then
               				arquivo_remoto1=$( dialog --stdout --inputbox 'Digite o nome do arquivo com o caminho a ser salvo remotamente:' 10 60 )
                       			if [ -n "$arquivo_remoto1" ]
                       			then
						rsync -vp -e ssh $arquivo1 $usuario1@$maquina1:$arquivo_remoto1 2>&1 | tee /tmp/temp.txt
						dialog --title "Saida dos comandos - Máquina $maquina1" --textbox /tmp/temp.txt 20 200
						rm -f /tmp/temp.txt
					fi
			fi
		fi

	else
		dialog --title 'Erro' --msgbox 'Arquivo NÃO existe!' 20 60
	fi

	clear
}

#Setando variável para capturar o tipo de usuário
if [ ! -f /usr/bin/dialog ]; then
	clear
	echo "O UTILITARIO DIALOG NAO ESTA INSTALADO. VAMOS INSTALAR AGORA..."
	sudo apt-get install dialog
fi

if [ ! -f /usr/bin/sshpass ]; then
	clear
	echo "O UTILITARIO SSHPASS NAO ESTA INSTALADO. VAMOS INSTALAR AGORA..."
	sudo apt-get install sshpass
fi

usuario=`id -u`
#Editando Tamanho da Barra de Menu
HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=40
#
BACKTITLE1="Bem-vindo a Script Implementa SCP e RSYNC - Prof - Tumelero"
TITLE1="SCP e RSYNC"
MENU1="Escolha uma das opcoes:"
#
BACKTITLE2="Implementa SCP - Prof - Tumelero"
TITLE2="Executa SCP"
MENU2="Escolha uma das opcoes:"
#
BACKTITLE3="Implementa RSYNC - Prof - Tumelero"
TITLE3="Executa RSYNC"
MENU3="Escolha uma das opcoes:"
#
#criando uma regra de repetição "faça enquanto" 
while true
do
	OPTIONS1=(1 "SCP"
       		 2 "RSYNC"
        	 3 "Remoto -> Remoto"
        	 4 "SCP Local -> Remoto"
        	 5 "SCP Remoto -> Local"
        	 6 "RSYNC Local -> Remoto"
        	 7 "RYSNC - Remoto -> Local"
		 8 "Sair")

#Criando menu para as opçoes em Dialog
	CHOICE1=$(dialog --clear \
                --backtitle "$BACKTITLE1" \
                --title "$TITLE1" \
                --menu "$MENU1" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS1[@]}" --stdout\
                )

	clear
#Criando Case para as opções a serem escolhidas
	case $CHOICE1 in
        	1)
			while true
			do
				OPTIONS2=(1 "Implementacao 1 - Parametro -4"
       		 		2 "Implementacao 2 - Parametro -c"
        	 		3 "Implementacao 3 - Parametro -p"
        	 		4 "Implementacao 4 - Parametro -q"
        	 		5 "Implementacao 5 - Parametro -v"
        	 		6 "Implementacao 6 - Parametro -l"
        	 		7 "Sair"
				)

				CHOICE2=$(dialog --clear \
 			               --backtitle "$BACKTITLE2" \
          			      --title "$TITLE2" \
              			  --menu "$MENU2" \
            			    $HEIGHT $WIDTH $CHOICE_HEIGHT \
     			           "${OPTIONS2[@]}" --stdout\
       			         )

				case $CHOICE2 in
					1)
						scp1
						;;
					2)
						scp2
						;;
					3)
						scp3
						;;
					4)
						scp4
						;;
					5)
						scp5
						;;
					6)
						scp6
						;;
					7) 	sair
						;;
					*)
						sair
						;;
				esac

			done
            		;;
        	2)
			while true
			do
				OPTIONS3=(1 "Implementacao 1 - Parametro -v"
       		 		2 "Implementacao 2 - Paramentro -4"
        	 		3 "Implementacao 3 - Parametro -h"
        	 		4 "Implementacao 4 - Parametro -z"
        	 		5 "Implementacao 5 - Parametro -q"
        	 		6 "Implementacao 6 - Parametro -p"
        	 		7 "Sair"
				)

				CHOICE3=$(dialog --clear \
 			               --backtitle "$BACKTITLE3" \
          			      --title "$TITLE3" \
              			  --menu "$MENU3" \
            			    $HEIGHT $WIDTH $CHOICE_HEIGHT \
     			           "${OPTIONS3[@]}" --stdout\
       			         )

				case $CHOICE3 in
					1)
						rsync1
						;;
					2)
						rsync2
						;;
					3)
						rsync3
						;;
					4)
						rsync4
						;;
					5)
						rsync5
						;;
					6)
						rsync6
						;;
					7) 	sair
						;;
					*)
						sair
						;;
				esac

			done
            		;;
		3)	remoto_remoto
			;;
		4)	scp_local_remoto
			;;
		5)	scp_remoto_local
			;;
		6)	rsync_local_remoto
			;;
		7)	rsync_remoto_local
			;;
        	8)
			sair
            		;;
        	*)
			break
            		;;
	esac
done

exit 0
