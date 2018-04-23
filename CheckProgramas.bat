@echo off
title /!\ Check de programa /!\ By:Lola 
set CICLOVALIDACIONRUTAS=0

::CONFIGURACION ---------------------------------------------------------------------------------------------------------------

::PROGRAMAS A EJECUTAR 1 = SOLO PROGRAMA | 2 = PROGRAMA Y PROGRAMA2 | 3 = PROGRAMA, PROGRAMA2 Y PROGRAMA3 
set NUMERODEPROGRAMAS=1
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::PROGRAMA
set PROGRAMA=programita.exe
::RUTA DE PROGRAMA A EJECUTAR
set RUTAPROGRAMA=C:\test\programita.exe
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::PROGRAMA2
set PROGRAMA2=programita2.exe
::RUTA DE PROGRAMA2 A EJECUTAR
set RUTAPROGRAMA2=C:\test\programita2.exe
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::PROGRAMA3
set PROGRAMA3=programita3.exe
::RUTA DE PROGRAMA3 A EJECUTAR
set RUTAPROGRAMA3=C:\test\programita3.exe
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA CARPETA PRINCIPAL
set RUTAPRINCIPAL=C:\test
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA DEL FICHERO LOG PARA LLEVAR UN REGISTRO
set RUTALOG=%RUTAPRINCIPAL%\LOG.txt
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::TIEMPO DE CICLO EN SEGUNDOS (EJMP 1 Hora = 3600)
set SEGUNDOSCICLO=5
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++

::------------------------------------------------------------------------------------------------------------------------------

:bucle
echo Iniciando proximo ciclo 
TIMEOUT /T %SEGUNDOSCICLO% /NOBREAK
cls
:: Reinicia el contador %CICLOVALIDACIONRUTAS% cada vez que entra en el bucle
set CICLOVALIDACIONRUTAS=0 
goto VALIDARRUTAS

:VALIDARRUTAS
set /a CICLOVALIDACIONRUTAS=%CICLOVALIDACIONRUTAS%+1

if %CICLOVALIDACIONRUTAS% EQU 1	if not exist %RUTAPRINCIPAL% mkdir %RUTAPRINCIPAL%
if %CICLOVALIDACIONRUTAS% EQU 1	if not exist %RUTALOG% echo Creacion de fichero %date% %time% ----------------------------------------------------------- >>%RUTALOG%

if %CICLOVALIDACIONRUTAS% EQU 1 call:FUNCIONVALIDARRUTA %RUTAPROGRAMA% %PROGRAMA% %NUMERODEPROGRAMAS% 1
if %CICLOVALIDACIONRUTAS% EQU 2 if %NUMERODEPROGRAMAS% GEQ 2 call:FUNCIONVALIDARRUTA %RUTAPROGRAMA2% %PROGRAMA2% %NUMERODEPROGRAMAS% 2
if %CICLOVALIDACIONRUTAS% EQU 3	if %NUMERODEPROGRAMAS% EQU 3 call:FUNCIONVALIDARRUTA %RUTAPROGRAMA3% %PROGRAMA3% %NUMERODEPROGRAMAS% 3

:FUNCIONVALIDARRUTA
set PARAMETRORUTAPROGRAMA=%~1
set PARAMETROPROGRAMA=%~2
set PARAMETRONUMEROPROGRAMAS=%~3
set PARAMETRONUMEROACTUAL=%~4

if exist %PARAMETRORUTAPROGRAMA% (
	if %PARAMETRONUMEROPROGRAMAS% EQU %PARAMETRONUMEROACTUAL% (
		call:FUNCIONVALIDARPROCESOS %PARAMETRORUTAPROGRAMA% %PARAMETROPROGRAMA% %PARAMETRONUMEROPROGRAMAS% %PARAMETRONUMEROACTUAL%
	)
) else (
	goto RUTAPROGRAMAERRONEA
)

:FUNCIONVALIDARPROCESOS
set PARARUTAPROGRAMA=%~1
set PARAPROGRAMA=%~2
set PARANUMEROPROGRAMAS=%~3
set PARANUMEROACTUAL=%~4

if %PARANUMEROACTUAL% EQU 1 echo ---------------------------------------------------------------------------------
if %PARANUMEROACTUAL% EQU 1 echo -                         Validador de procesos                                 -
if %PARANUMEROACTUAL% EQU 1 echo ---------------------------------------------------------------------------------
echo -                Verificando si el %PARAPROGRAMA% se esta ejecutando.             
echo -                                                                               -

if %PARANUMEROACTUAL% EQU 1 echo Check procesos %date% %time% ---------------------------------------------------------------- >>%RUTALOG%

tasklist /M | find /i "%PARAPROGRAMA%"

if %errorlevel% EQU 0 (goto SEENCONTROELPROGRAMA) else (goto NOSEENCONTROELPROGRAMA)

:NOSEENCONTROELPROGRAMA
echo -              %PARAPROGRAMA% no se encuentra en ejecucion.. Iniciando..                  
echo -                                                                               -  
Echo 		%time% %PARAPROGRAMA% Check [NO] >>%RUTALOG%

Echo 			%time% %PARAPROGRAMA% Iniciado [OK] >>%RUTALOG%
Start /MIN "" "%PARARUTAPROGRAMA%"
	
if %PARANUMEROPROGRAMAS% EQU %PARANUMEROACTUAL% ( 
	goto FIN
) else (
	goto VALIDARRUTAS
)

:SEENCONTROELPROGRAMA
echo ---------------------------------------------------------------------------------
echo -                   %PARAPROGRAMA% Se esta ejecutando [OK]                                   
Echo 		%time% %PARAPROGRAMA% Check [OK] >>%RUTALOG%

if %PARANUMEROPROGRAMAS% EQU %PARANUMEROACTUAL% ( 
	goto FIN
) else (
	goto VALIDARRUTAS
)

:RUTAPROGRAMAERRONEA
echo ---------------------------------------------------------------------------------
echo -                       RUTA ERRONEA DEL PROGRAMA [OK]                          -
echo -          Debe indicar una ruta valida en la variable RUTAPROGRAMA,            -
echo -      RUTAPROGRAMA2 o RUTAPROGRAMA3 verificar el area de configuracion         -
echo -        La ruta mientras mas simple sea mejor, sin espacios en blanco          -
echo -                    NO SE PUEDEN USAR ACCESOS DIRECTOS                         -
echo -                                                                               -
echo ---------------------------------------------------------------------------- EXIT
pause>nul
pause>nul
pause>nul
exit

:FIN
echo ---------------------------------------------------------------------------------
echo -                  Ultima Validacion %date% %time%                      -
echo ---------------------------------------------------------------------------------
goto bucle
