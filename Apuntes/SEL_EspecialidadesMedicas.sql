-- SP para obtener todas las especialidades médicas disponibles en el sistema

	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC SEL_EspecialidadesMedicas 			-- Nos daría todos los campos de las tablas Paciente, Turno, TurnoPaciente y MedicoEspecialidad referentes a idPaciente = 6

	-- Creación del SP SEL_EspecialidadesMedicas

CREATE PROC SEL_EspecialidadesMedicas				-- Creamos el SP. No necesitamos pasarle ningún parámetro ya que queremos obtenerlas todas, no filtrarlo

AS
SET NOCOUNT ON										-- Para que muestre el resultado de la consulta sin mostrar la cuenta del número de registros

IF EXISTS (SELECT * FROM Especialidad)				-- Comprobamos si existen el registros en función de la consulta que vamos a realizar
	SELECT * FROM Especialidad						-- Si existen realizamos la consulta
ELSE												-- Si no existen
	SELECT 0 AS Resultado							-- Devolvemos el valor 0 como Resultado