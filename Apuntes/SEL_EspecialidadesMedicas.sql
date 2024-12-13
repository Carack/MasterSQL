-- SP para obtener todas las especialidades m�dicas disponibles en el sistema

	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC SEL_EspecialidadesMedicas 			-- Nos dar�a todos los campos de las tablas Paciente, Turno, TurnoPaciente y MedicoEspecialidad referentes a idPaciente = 6

	-- Creaci�n del SP SEL_EspecialidadesMedicas

CREATE PROC SEL_EspecialidadesMedicas				-- Creamos el SP. No necesitamos pasarle ning�n par�metro ya que queremos obtenerlas todas, no filtrarlo

AS
SET NOCOUNT ON										-- Para que muestre el resultado de la consulta sin mostrar la cuenta del n�mero de registros

IF EXISTS (SELECT * FROM Especialidad)				-- Comprobamos si existen el registros en funci�n de la consulta que vamos a realizar
	SELECT * FROM Especialidad						-- Si existen realizamos la consulta
ELSE												-- Si no existen
	SELECT 0 AS Resultado							-- Devolvemos el valor 0 como Resultado