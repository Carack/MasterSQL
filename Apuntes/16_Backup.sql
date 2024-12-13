-- Crear un Backupt desde transact SQL

/*
  Un Backup es una copia de respaldo de la base de datos. Puede ser completa (Full) que quiere decir que contiene la totalidad de la base de datos o bien
  diferencial, que solo almacena los cambios realizados desde él último backup Full. Se trata de un archivo .bak o .tnr que puede encontrarse alojado en el 
  propio disco, en otro dispositivo o en una dirección URL.
  Pueden crearse desde la interfaz, desde el Object Explorer, haciendo click derecho en la base de datos/Task/Backup o bien desde transact SQL
*/

	-- Creando un backup básico de la base de datos CentroMedico

BACKUP DATABASE CentroMedico								-- Indicamos la base de datos sobre la que vamos a realizar el backup
TO DISK = 'E:\SQLData\Backups\CentroMedico20241121.bak'		-- Indicamos la ruta donde vamos a grabar la base de datos
WITH NO_COMPRESSION, NAME = 'Backup CentroMedico'			-- Indicamos los parámetros adicionales (con/sin compresión, etiqueta descriptiva)

	-- Creando un backup de la base de datos CentroMedico más elaborado

		-- En este caso recogerá las fechas directamente del sistema para no tener que cambiar el código cada vez que queramos realizar un nuevo backup

DECLARE @fecha CHAR(12)										-- Declaramos una variable Char(12) ya que queremos almacenar la fecha en formato aaaammddhhmimi
DECLARE @path VARCHAR(100)									-- Declaramos otra variable para almacenar la dirección de la carpeta donde guardaremos la base de datos
DECLARE @name VARCHAR (20)									-- Declaramos otra variable para almacenar el nombre de la base de datos

SET @fecha = CONVERT(CHAR(8),GETDATE(),112) + REPLACE(CONVERT(CHAR(5),GETDATE(),108),':','')	-- Inicializamos @fecha con el valor de los primeros 8 caracteres del formato 112 de getdate (aaaammdd) y le concatenamos los primeros 5 del formato 108 (hh:mimi) sustituyendo los : por ningún caracter ('') con replace
SET @path = 'E:\SQLData\Backups\CentroMedico' + @fecha + '.bak'									-- Inicializamos @path con la ruta y le concatenamos la fecha (@fecha) y la extensión para que esté completa
SET @name = 'Backup CentroMedico' + '' +  @fecha												-- Inicializamos @name con la etiqueta elegida concatenadola con la fecha (@fecha)

BACKUP DATABASE CentroMedico								-- Indicamos la base de datos sobre la que vamos a realizar el backup
TO DISK = @path												-- Indicamos la ruta donde vamos a grabar la base de datos mediante la variable
WITH NO_COMPRESSION, NAME = @name							-- Indicamos los parámetros adicionales (con/sin compresión, nombre de la base de datos con la variable)

/*
  Una vez tenemos el script terminado podemos introducirlo dentro de un Scheduled Job (tarea programada) para que, por ejemplo, se ejecute todos los días a cierta hora
*/
