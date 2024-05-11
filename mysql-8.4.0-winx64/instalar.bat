@echo off
REM Definindo as variáveis basedir e datadir como o diretório atual
set "basedir=%cd:\=/%"
set "datadir=%cd:\=/%/mysql-data"

echo ######## Diretorios da Aplicacao
echo %basedir%
echo %datadir%

REM Criando o diretório datadir, se ainda não existir
echo ######## Criando diretorio de dados
if not exist "%datadir%" mkdir "%datadir%"
pause

REM Criando o arquivo my.ini com as variáveis configuradas
echo [mysqld] > my.ini
echo # set basedir to your installation path >> my.ini
echo basedir="%basedir%" >> my.ini
echo # set datadir to the location of your data directory >> my.ini
echo datadir="%datadir%" >> my.ini
echo ######## Arquivo my.ini criado com sucesso!
pause

REM Executando o comando mysqld.exe --initialize-insecure da pasta bin
echo ######## Criando base de dados
cd %basedir%
cd bin
call mysqld.exe --initialize-insecure
echo ######## Banco de dados MySQL inicializado com sucesso!
pause

REM Iniciando MySQL
echo ######## MySQL em execucao
call mysqld
