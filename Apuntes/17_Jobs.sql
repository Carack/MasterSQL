-- Jobs en SQL

/*
  Los Jobs en SQL est�n administrados por el SQL Server Agent. 
  Nos permiten crear y especificar que se realicen ciertas acciones en determinado momento. 
  Gracias a ellos podemos generar procesos automatizados. 
*/

	-- Como crear un Job desde la interfaz

/*
  En el Object Explorer iremos hasta SQL Server Agent, click derecho/New/Job
  En la pesta�a General le colocamos el nombre, usuario, descripci�n...
  En la pesta�a Steps pulsando el bot�n new podremos a�adir los pasos del Job. En la ventana emergente elegiremos el nombre del paso, el tipo, la base de datos sobre la que
  va a actuar y, en caso de ser tipo Transact-SQL sctipt en comman a�adiremos el c�digo.
  En la pesta�a Schedules, pulsando el bot�n new podremos a�adir los momentos en los que se ejecutar� el Job. En la ventana emergente elegiremos el nombre, el tupo, la frecuencia...
  Tambi�n podemos a�adir alertas, notificaciones...
  Una vez terminado pulsaremos en Ok y el Job se habr� generado.

  Para forzar su inicio sin esperar a que ocurra el momento agendado dando click derecho en SQL Server Agent/Jobs/NombredelJob/Start Job as Step lo iniciaremos en ese mismo momento 

  Si queremos que el Scheduled Job deje de ejecutarse podemos hacer click derecho en �l y darle a Disable o bien a Delete si ya no lo necesitamos.
*/

		-- Podemos emular Job con sqlcmd
			
			-- Gracias a sqlcmd sumado a los eventos Scheduled Task de Windows podemos ejecutar un proceso BATCH que nos procese un script concreto en un determinado momento

/*
   Guardamos el Script que queramos agendar como archivo .sql
   Creamos un archivo BATCH (documento de texto) y gneramos la llamada en el interior del documento: 
      SQLCMD -s .\192.168.0.71 -i E:\SQLData\Backups\backup.sql		-- Llamamos a SQLCMD, le damos los par�metros -s (el nombre del servidor, la ip del servidor), -i (archivo de input)
   Le cambiamos la extensi�n al archivo de .txt a .bat
   Incluimos el archivo en el Scheduled Tasks de Windows
	  Desde B�squeda de Windows buscamos 'Task Scheduler' y creamos una nueva tarea (Create Basic Task) asign�ndole cuando debe ejecutarse y cual es el Program/Script. 
*/

