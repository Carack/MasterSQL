-- Creamos un JOB que cancele turnos vencidos

/*
   Lo crearemos teniendo en cuenta que la tabla TurnoEstado fuese de esta forma en lugar de la que es en la base de datos:
   0 -> Turno pendiente
   1 -> Turno atendido
   2 -> Turno cancelado
   3 -> Turno cancelado por paciente
*/

	-- Diseñamos el código. 
		
		-- Siempre es una buena práctica diseñarlo primero como un SELECT para comprobar que la salida es exactamente la que queremos

			/*
			   SELECT * FROM Turno WHERE CONVERT(CHAR(8),fechaTurno,112) < CONVERT(CHAR(8),GETDATE(),112) AND estado = 0
			*/
		
		-- Una vez lo tengamos ya solo tenemos que cambiar SELECT por UPDATE y adecuar la sentencia a lo que queremos hacer 

USE CentroMedico							-- Forzamos que utilice la base de datos CentroMedico
GO											-- Distinguimos una sentencia SQL de la otra (USE de UPDATE) para que no las ejecute a la vez si no una a una
UPDATE Turno SET estado = 2 WHERE CONVERT(CHAR(8),fechaTurno,112) < CONVERT(CHAR(8),GETDATE(),112) AND estado = 0

		-- Una vez terminado acudimos a SQL Agent Server para convertirla en un Scheduled Job o en su defecto lo simulamos como archivo BATCH
