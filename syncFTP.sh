#!/bin/bash

#AUTOR: Yuri Ferreira da Paixão
#FUNÇÃO: Sincronizar  arquivos com servidor FTP usando LFTP

# LINK DO MANUAL DO LFTP
# https://devicetests.com/sync-local-ftp-folders-ubuntu

#LINK DE EXEMPLO DE USO DO LFTP
# https://devicetests.com/sync-local-ftp-folders-ubuntu

HOST='Host-Remoto:Porta'
USER='usuario'
PASS='suasenha'
TARGETFOLDER='/Diretorio-Destino'
SOURCEFOLDER='/Diretorio-Origem'



#ENVIANDO OS ARQUIVOS PARA O FTP

lftp -f "
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --verbose --continue --Remove-source-files --exclude Processados/ --exclude Erros/ --exclude Remessa/ --exclude ContaCorrente/  $SOURCEFOLDER $TARGETFOLDER
bye
"
