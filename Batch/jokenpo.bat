@echo off
title Atividade de JO-KEN-PO
color 0a
:inicio
set /p nome=Digite o nome do jogador: 
set /a vitorias=0
set /a derrotas=0
set /a empates=0

:menu
cls
set /a numero=(%random% %%5) + 1
if %numero% == 1 (set palavra=PEDRA)
if %numero% == 2 (set palavra=PAPEL)
if %numero% == 3 (set palavra=TESOURA)
if %numero% == 4 (set palavra=LAGARTO)
if %numero% == 5 (set palavra=SPOCK)
echo.
echo ================================================================
echo Vitorias: %vitorias%  Derrotas: %derrotas%  Empates: %empates%
echo         Bem-Vindo ao JO-KEN-PO
echo ================================================================
echo.
echo [1] PEDRA
echo [2] PAPEL
echo [3] TESOURA
echo [4] LAGARTO
echo [5] SPOCK
echo [R] REGRAS
echo [E] Encerrar o jogo
echo.
echo ================================================================
set /p op=Escolha uma opcao: 

if /i %op% == R (goto:regras)
if /i %op% == E (exit)
if %op% == 1 (goto:jogadaPedra)
if %op% == 2 (goto:jogadaPapel)
if %op% == 3 (goto:jogadaTesoura)
if %op% == 4 (goto:jogadaLagarto)
if %op% == 5 (goto:jogadaSpock) else (
    echo.
    echo Digite uma opcao valida!
    echo.
    pause
    goto:menu
)

:regras
echo =============================================================================
echo PEDRA: 
echo       Empata com PEDRA; Ganha de TESOURA e LAGARTO; Perde de PAPEL e SPOCK.
echo PAPEL:
echo       Empata com PAPEL; Ganha de PEDRA e SPOCK; Perde de TESOURA e LAGARTO.
echo TESOURA:
echo       Empata com TESOURA; Ganha de LAGARTO e PAPEL; Perde de PEDRA e SPOCK.
echo LAGARTO:
echo       Empata com LAGARTO: Ganha de PAPEL e SPOCK; Perde de PEDRA e TESOURA.
echo SPOCK:
echo       Empata com SPOCK; Ganha de PEDRA e TESOURA; Perde de LAGARTO e PAPEL.
echo ==============================================================================
pause
goto:menu

:jogadaPedra
echo.
echo ===========================================
echo %nome% escolheu: PEDRA
echo Computador escolheu: %palavra%
if %numero% == 1 (
    goto:empate
)
if %numero% == 2  (
    goto:perdeu
)
if %numero% == 3 (
    goto:venceu
)
if %numero% == 4 (
    goto:venceu
)
if %numero% == 5 (
    goto:perdeu
)


:jogadaPapel
echo.
echo ===========================================
echo %nome% escolheu: PAPEL
echo Computador escolheu: %palavra%
if %numero% == 1 (
    goto:venceu
)
if %numero% == 2  (
    goto:empate
)
if %numero% == 3 (
    goto:perdeu
)
if %numero% == 4 (
    goto:perdeu
)
if %numero% == 5 (
    goto:venceu
)

:jogadaTesoura
echo.
echo ===========================================
echo %nome% escolheu: TESOURA
echo Computador escolheu: %palavra%
if %numero% == 1 (
    goto:perdeu
)
if %numero% == 2  (
    goto:venceu
)
if %numero% == 3 (
    goto:empate
)
if %numero% == 4 (
    goto:venceu
)
if %numero% == 5 (
    goto:perdeu
)

:jogadaLagarto
echo.
echo ===========================================
echo %nome% escolheu: LAGARTO
echo Computador escolheu: %palavra%
if %numero% == 1 (
    goto:perdeu
)
if %numero% == 2  (
    goto:venceu
)
if %numero% == 3 (
    goto:perdeu
)
if %numero% == 4 (
    goto:empate
)
if %numero% == 5 (
    goto:venceu
)

:jogadaSpock
echo.
echo ===========================================
echo %nome% escolheu: SPOCK
echo Computador escolheu: %palavra%
if %numero% == 1 (
    goto:venceu
)
if %numero% == 2  (
    goto:perdeu
)
if %numero% == 3 (
    goto:venceu
)
if %numero% == 4 (
    goto:perdeu
)
if %numero% == 5 (
    goto:empate
)

:venceu
set /a vitorias = %vitorias% + 1
echo ===========================================
echo                Voce Venceu
echo =========================================== 
goto:replay

:perdeu
set /a derrotas = %derrotas% + 1
echo ===========================================
echo                Voce Perdeu
echo ===========================================
goto:replay

:empate
set /a empates = %empates% + 1
echo ===========================================
echo              Voces Empataram!
echo ===========================================
goto:replay

:replay
set /p op=Voce gostaria de jogar de novo? [S/N]: 
if /i %op% == s (goto:menu)
if /i %op% == n (
    set /a vitorias=0
    set /a derrotas=0
    set /a empates=0
    goto:menu
) else (
    echo.
    echo ===========================================
    echo              Opcao Invalida!
    goto:replay
)
