# Vigilante_de_procesos
Pequeño batch creado para vigilar si un proceso se cierra y lo ejecuta nuevamente.
 
Sirve de mucho como medida de seguridad en el caso que necesitas que un programa se encuentre siempre en ejecución adelantando a cualquier problema como por ejemplo: 

- Algún usuario lo cierre el programa
- Deje de funcionar o el programa   

Panorama donde se podría usar: 
- En un servidor con varios usuarios por RDP donde algún usuario con privilegios podría cerrar sin querer el programa que se ejecuta como servicio de nuestra cuenta
- Con un programa que se "rompa" mucho pero tenemos la necesidad de tenerlo abierto sin encontrarnos enfrente de el computador

Forma de uso:
Editar el .BAT tiene un apartado de configuracion

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
DESCRIPCION DE CAMPOS:
  -NUMERODEPROGRAMAS los programas que se encontrara vigilando desde 1 hasta 3 
  -PROGRAMA, PROGRAMA2, PROGRAMA3 nombre del proceso en el administrador de tareas
  -RUTAPROGRAMA, RUTAPROGRAMA2, RUTAPROGRAMA3 rutas del archivo que ejecutara si no encuentra su respectivo proceso
  -RUTAPRINCIPAL Carpeta donde se guardara el archivo de logs
  -RUTALOG ruta y nombre del archivo de logs
  -SEGUNDOSCICLO cada cuanto se ejecutara un ciclo

