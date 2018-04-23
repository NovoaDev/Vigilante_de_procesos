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
::--------------------------------------------------------------------------------------

Descripcion de campos:
  -NUMERODEPROGRAMAS los programas que se encontrara vigilando desde 1 hasta 3 
  -PROGRAMA, PROGRAMA2, PROGRAMA3 nombre del proceso en el administrador de tareas
  -RUTAPROGRAMA, RUTAPROGRAMA2, RUTAPROGRAMA3 rutas del archivo que ejecutara si no encuentra su respectivo proceso
  -RUTAPRINCIPAL Carpeta donde se guardara el archivo de logs
  -RUTALOG ruta y nombre del archivo de logs
  -SEGUNDOSCICLO cada cuanto se ejecutara un ciclo

