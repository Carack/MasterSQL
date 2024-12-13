-- Tablas temporales en SQL

	-- Tabla temporal en memoria

/*
  Una tabla temporal en memoria va a existir mientras el script se est� ejecutando, una vez que termina su ejecuci�n la tabla en memoria se destruye
  y no podremos volver a hacer uso de ella.
*/
		
		-- Creamos una tabla temporal en memoria llamada mitabla 

DECLARE @mitabla TABLE (id INT IDENTITY(1,1), pais VARCHAR(50))    -- La definici�n es similar a la de una variable, precedida de @, solo que ser� tipo TABLE

INSERT INTO @mitabla VALUES ('Espa�a')							   -- Insertamos valores a la tabla que podremos utilizar y al terminar el script se destruir�n con ella. 
INSERT INTO @mitabla VALUES ('Mexico')
INSERT INTO @mitabla VALUES ('Per�')
INSERT INTO @mitabla VALUES ('Argentina')
INSERT INTO @mitabla VALUES ('Ecuador')

SELECT * FROM @mitabla											   -- Visualizamos la tabla

	-- Tabla temporal f�sica

/*
  Una tabla temporal f�sica va a existir en la base de datos como una tabla temporal hasta que reiniciemos o paremos el servicio de la base de datos que es cuando se destruye
  Podemos destruirla manualmente antes de que esto ocurra con la instrucci�n DROP por ejemplo para liberar memoria
*/

		-- Creamos una tabla temporal f�sica llamada mitabla 

CREATE TABLE #mitabla (id INT IDENTITY(1,1), nombre VARCHAR(50), apellido VARCHAR(50))	 -- La creaci�n es similar a la de una tabla, pero precedida de #

INSERT INTO #mitabla VALUES ('Alejandro','Lopez')										 -- Insertamos valores en la tabla que podremos utilizar mientras esta exista
INSERT INTO #mitabla VALUES ('Rafael','Castillo')
INSERT INTO #mitabla VALUES ('Fernando','Gonzalez')

SELECT * FROM #mitabla																	 -- Visualizamos el contenido de la tabla

DROP TABLE #mitabla																		 -- Esto destruir�a la tabla del mismo modo que con una convencional

	-- Integrando tablas temporales en un Stored Procedure

		-- Vamos a crear un script que crea una tabla temporal para almacenar todos los turnos de los pacientes, recorrerla y filtrar los turnos de un paciente espec�fico
		-- Esto nos sirve para aliviar la demora generada en el SP por tener demasiados INNER JOIN

DECLARE @turnos TABLE (id INT IDENTITY (1,1), idturno turno, idpaciente paciente)		-- Declaramos la tabla temporal
DECLARE @idpaciente paciente															-- Declaramos una variable (que representar� el paciente que buscamos)
SET @idpaciente = 6																		-- La inicializamos con el valor de b�squeda

INSERT INTO @turnos (idturno, idpaciente)												-- Insertamos en la tabla temporal todos los idTurnos con sus correspondientes idPacientes
SELECT TP.idTurno, TP.idPaciente FROM Paciente P										-- Realizamos la b�squeda en Paciente (alias P) de los datos para la inserci�n 
	INNER JOIN TurnoPaciente TP															-- Conectamos con Turnopaciente (alias TP)
	ON TP.idPaciente = P.idPaciente														-- Indicamos que la relaci�n es entre los idPaciente

DECLARE @i INT, @total INT																-- Declaramos una variable entera @i que utilizaremos como contador y otra entera @total que usaremos como control 
SET @i = 1																				-- La inicializamos en 1
SET @total = (SELECT COUNT(*) FROM @turnos)												-- La inicializamos con el valor total original de registros de la tabla temporal 

WHILE @i <= @total																		-- Creamos un bucle que se ejecutar� mientras el n�mero de registros total original de la tabla temporal sea menor o igual al contador
BEGIN
	IF (SELECT idpaciente FROM @turnos WHERE id = @i) <> @idpaciente					-- Si la b�squeda de idpaciente de la tabla temporal donde id es igual al contador, es distinto de @idpaciente (el paciente que buscamos)
		DELETE FROM @turnos WHERE id = @i												-- Borramos ese registro de la tabla temporal
	SET @i = @i + 1																		-- Avanzamos el contador
END

SELECT * FROM Paciente P																-- Visualizamos todos los registros de la tabla Paciente (alias P)
	INNER JOIN @turnos T																-- Conect�ndola con la tabla temporal @turnos (alias T)
	ON T.idpaciente = P.idPaciente														-- Donde el idpaciente de T sea igual al idpaciente de P

