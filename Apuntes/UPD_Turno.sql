-- SP para actualizar los Turnos
	
	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC UPD_Turno 11,4,'El paciente llamó para cambiar la cita'	

	-- Creación del SP UPD_Turno

CREATE PROC UPD_Turno (										-- Creamos el SP
			@idturno turno,									-- Añadimos los parámetros
			@estado TINYINT,
			@observacion observacion
			)

AS
SET NOCOUNT ON												-- Para que muestre el resultado de la consulta sin mostrar la cuenta del número de registros

IF EXISTS (SELECT * FROM Turno WHERE idTurno = @idturno)	-- Comprobamos que existan registros para ese @idTurno
	UPDATE	Turno SET estado = @estado,						-- No es necesario colocar los bloques BEGIN y END ya que solo tenemos una única instrucción
					  observacion = @observacion 
	WHERE idTurno = @idturno								-- Si existe, actualizamos los datos del registro referente al idTurno proporcionado
ELSE
	SELECT 0 AS Resultado									-- En caso de no existir registros para ese idTurno devolveremos 0 como Resultado