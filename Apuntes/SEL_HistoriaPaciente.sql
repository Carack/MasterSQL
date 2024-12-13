-- SP para obtener la historia clínica de un paciente

	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC SEL_HistoriaPaciente 3			-- Nos daría todos los campos de las tablas Paciente, Turno, TurnoPaciente y MedicoEspecialidad referentes a idPaciente = 6

	-- Creación del SP SEL_HistoriaPaciente

CREATE PROC SEL_HistoriaPaciente (				-- Creamos el SP
			@idpaciente paciente				-- Asignamos parámetros de entrada
			)
AS
SET NOCOUNT ON									-- Para que muestre el resultado de la consulta sin mostrar la cuenta del número de registros

IF EXISTS (SELECT * FROM Paciente P				-- Comprobamos si existen el registros en función de la consulta que vamos a realizar
		   INNER JOIN HistoriaPAciente HP
		   ON HP.idPaciente = P.idPaciente
		   INNER JOIN Historia H
		   ON H.idHistoria = HP.idHistoria
		   INNER JOIN MedicoEspecialidad ME
		   ON ME.idMedico = HP.idMedico
		   INNER JOIN Medico M
		   ON M.idMedico = ME.idMedico
		   WHERE P.idPaciente = @idpaciente
		  )
	-- En caso de que existan ejecutamos la consulta
	SELECT * FROM Paciente P						-- Pedimos que nos enseñe todos los campos de paciente asignándole el alias P
	INNER JOIN HistoriaPAciente HP					-- La conectamos con HistoriaPaciente y le asignamos el alias HP
	ON HP.idPaciente = P.idPaciente					-- Indicamos las PK relacionadas entre HistoriaPaciente y Paciente utilizando los alias
	INNER JOIN Historia H							-- Conectamos también la tabla Historia, asignándole el alias H
	ON H.idHistoria = HP.idHistoria					-- Indicamos la relación entre las PK de Historia e HistoriaPaciente
	INNER JOIN MedicoEspecialidad ME				-- Conectamos también la tabla MedicoEspecialidad, asignándole el alias ME
	ON ME.idMedico = HP.idMedico					-- Indicamos la relación entre las PK MedicoEspecialidad e HistoriaPaciente
	INNER JOIN Medico M								-- Conectamos también la tabla Medico, asignándole el alias M
	ON M.idMedico = ME.idMedico						-- Indicamos la relación entre las PK Medico y MedicoEspecialidad
	WHERE P.idPaciente = @idpaciente				-- Filtramos solo el idPaciente que se recibe como parámetro
-- Si no existen
ELSE
--	PRINT 'No existen historias clínicas para el paciente'  -- Depende de como vaya a usarse este SP con la interfaz de usuario podremos querer un PRINT 
	SELECT 0 AS Resultado									-- directo o devolver un 0 como Resultado para usarlo luego