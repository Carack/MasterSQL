-- SP para obtener los Turnos de paciente

	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC SEL_TurnosPaciente 6			-- Nos daría todos los campos de las tablas Paciente, Turno, TurnoPaciente y MedicoEspecialidad referentes a idPaciente = 6

	-- Creación del SP SEL_TurnosPaciente

CREATE PROC SEL_TurnosPaciente (		    -- Creamos el SP
				@idpaciente paciente		-- Asignamos parámetros de entrada
			)

AS
SET NOCOUNT ON								-- Para que muestre el resultado de la consulta sin mostrar la cuenta del número de registros

/* 
Esta sería una forma, pero no es la más recomendable, ya que relacionaríamos una PK con una variable y lo aconsejable es relacionar PK con PK.
Es mejor filtrarlo con un WHERE en el SELECT como veremos más abajo

SELECT * FROM Turno T						-- Pedimos que nos enseñe todos los campos de Turno asignándole el alias T
INNER JOIN TurnoPaciente TP					-- La conectamos con TurnoPaciente y le asignamos el alias TP
ON TP.idTurno = T.idTurno					-- Indicamos las PK relacionadas utilizando los alias
AND TP.idPaciente = @idPaciente				-- Añadimos una relación con el valor de entrada del SP
INNER JOIN Paciente P						-- Conectamos también la tabla Paciente, asignándole el alias P
ON P.idPaciente = TP.idPaciente				-- Indicamos la relación entre sus PK
...

*/

SELECT * FROM Paciente P					-- Pedimos que nos enseñe todos los campos de paciente asignándole el alias P
INNER JOIN TurnoPaciente TP					-- La conectamos con TurnoPaciente y le asignamos el alias TP
ON TP.idPaciente = P.idPaciente				-- Indicamos las PK relacionadas entre TrunoPaciente y Paciente utilizando los alias
INNER JOIN TURNO T							-- Conectamos también la tabla Turno, asignándole el alias T
ON T.idTurno = TP.idTurno					-- Indicamos la relación entre las PK de Turno y TurnoPaciente
INNER JOIN MedicoEspecialidad M				-- Conectamos también la tabla MedicoEspecialidad, asignándole el alias M
ON M.idMedico = TP.idMedico					-- Indicamos la relación entre las PK MedicoEspecialidad y TurnoPaciente
WHERE P.idPaciente = @idpaciente			-- Filtramos solo el idPaciente que se recibe como parámetro
