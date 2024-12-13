-- SP para borrar un turno
	
	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC DEL_Turno 11								-- Eliminaría el turno referente a idTurno = 11 de las tablas Turno y TurnoPaciente

	-- Creación del SP DEL_Turno

CREATE PROC DEL_Turno (										-- Creamos el SP
			@idturno turno									-- Añadimos los parámetros
			)

AS
SET NOCOUNT ON												-- Para que muestre el resultado de la consulta sin mostrar la cuenta del número de registros

IF EXISTS (SELECT * FROM Turno WHERE idTurno = @idturno)	-- Comprobamos que existan registros para ese @idTurno
	BEGIN													-- BEGIN y ELSE son necesarios ya que vamos a ejecutar más de una isntrucción dentro del IF
		DELETE FROM TurnoPaciente WHERE idTurno = @idturno  -- Primero debe eliminarse en TurnoPaciente ya que hay una relación de FK entre los idTurnos
		DELETE FROM Turno WHERE idTurno = @idturno			-- Ya podemos eliminar en la Tabla Turno porque ya no habr´´ia conflicto con la FOREIGN KEY
	END
ELSE
	SELECT 0 AS Resultado	