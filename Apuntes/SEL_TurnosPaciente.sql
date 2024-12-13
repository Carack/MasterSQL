-- SP para obtener los Turnos de paciente

	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC SEL_TurnosPaciente 6			-- Nos dar�a todos los campos de las tablas Paciente, Turno, TurnoPaciente y MedicoEspecialidad referentes a idPaciente = 6

	-- Creaci�n del SP SEL_TurnosPaciente

CREATE PROC SEL_TurnosPaciente (		    -- Creamos el SP
				@idpaciente paciente		-- Asignamos par�metros de entrada
			)

AS
SET NOCOUNT ON								-- Para que muestre el resultado de la consulta sin mostrar la cuenta del n�mero de registros

/* 
Esta ser�a una forma, pero no es la m�s recomendable, ya que relacionar�amos una PK con una variable y lo aconsejable es relacionar PK con PK.
Es mejor filtrarlo con un WHERE en el SELECT como veremos m�s abajo

SELECT * FROM Turno T						-- Pedimos que nos ense�e todos los campos de Turno asign�ndole el alias T
INNER JOIN TurnoPaciente TP					-- La conectamos con TurnoPaciente y le asignamos el alias TP
ON TP.idTurno = T.idTurno					-- Indicamos las PK relacionadas utilizando los alias
AND TP.idPaciente = @idPaciente				-- A�adimos una relaci�n con el valor de entrada del SP
INNER JOIN Paciente P						-- Conectamos tambi�n la tabla Paciente, asign�ndole el alias P
ON P.idPaciente = TP.idPaciente				-- Indicamos la relaci�n entre sus PK
...

*/

SELECT * FROM Paciente P					-- Pedimos que nos ense�e todos los campos de paciente asign�ndole el alias P
INNER JOIN TurnoPaciente TP					-- La conectamos con TurnoPaciente y le asignamos el alias TP
ON TP.idPaciente = P.idPaciente				-- Indicamos las PK relacionadas entre TrunoPaciente y Paciente utilizando los alias
INNER JOIN TURNO T							-- Conectamos tambi�n la tabla Turno, asign�ndole el alias T
ON T.idTurno = TP.idTurno					-- Indicamos la relaci�n entre las PK de Turno y TurnoPaciente
INNER JOIN MedicoEspecialidad M				-- Conectamos tambi�n la tabla MedicoEspecialidad, asign�ndole el alias M
ON M.idMedico = TP.idMedico					-- Indicamos la relaci�n entre las PK MedicoEspecialidad y TurnoPaciente
WHERE P.idPaciente = @idpaciente			-- Filtramos solo el idPaciente que se recibe como par�metro
