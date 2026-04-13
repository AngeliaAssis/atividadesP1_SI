@echo off
title Atividade Conceitual - Scripts em Bat
color 0a
cls

:inicio
set /p nome=Digite o nome do jogador: 
goto menuInicial

:menuInicial
cls
echo =========================================
echo           JOGO DE ADIVINHACAO
echo =========================================
echo.
echo          Seja bem-vindo, %nome%
echo.
echo =========================================
echo [J] Jogar
echo [P] Pontuacao dos Jogadores
echo [E] Encerrar o Jogo
echo =========================================
echo.
set /p resp=O que deseja fazer?: 

if /i %resp%==j goto jogo_start
if /i %resp%==p goto pontuacao
if /i %resp%==e goto sair

echo.
echo =========================================
echo            Opcao Invalida
echo =========================================
pause
goto menuInicial


:jogo_start
set /a cont=5
set /a numero=(%random% %%50) + 1
goto jogo


:jogo
cls
echo =========================================
echo           JOGO DE ADIVINHACAO
echo =========================================
echo.
echo          Voce tem %cont% tentativas
echo.
echo =========================================

set /p resp=Digite o seu palpite: 

if %resp% lss %numero% (
    set /a cont=%cont% - 1
    echo.
    echo O numero e MAIOR que %resp%.
    pause
    goto verifica
)

if %resp% gtr %numero% (
    set /a cont=%cont% - 1
    echo.
    echo O numero e MENOR que %resp%.
    pause
    goto verifica
)

echo.
echo Parabens, voce acertou o numero secreto!
echo.
echo %date%   %time%   %cont%   %numero%   %nome% >> players.txt

set /p resp=Voce deseja jogar novamente? [S/N]: 
if /i %resp%==s goto jogo_start
goto menuInicial


:verifica
if %cont% gtr 0 (
    goto jogo
) else (
    echo.
    echo Fim das tentativas. O numero era %numero%.
    echo.
    pause
    goto menuInicial
)


:pontuacao
cls
echo =========================================
echo           PONTUACAO
echo =========================================
echo.
type players.txt 2>nul
echo.
pause
goto menuInicial


:sair
echo.
set /p resp=Voce deseja mesmo sair? [S/N]: 
if /i %resp%==s exit
goto menuInicial