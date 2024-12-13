-- SP para actualizar los pacientes
	
	-- Para ejecutar el SP lo haremos de este modo

		-- EXEC UPD_Paciente 2,'52135687','Carlos','Lopez','20020205','Avenida 12','ESP','615789941','CarLop@gmail.com','Movilidad reducida'	

	-- Creación del SP UPD_Paciente

CREATE PROC UPD_PACIENTE (												-- Creamos el SP
			@idpaciente paciente,										-- Añadimos los parámetros
			@dni VARCHAR(20),
			@nombre VARCHAR(50),
			@apellido VARCHAR(50),
			@fnacimiento DATE,
			@domicilio VARCHAR(50),
			@idpais CHAR(3),
			@telefono VARCHAR(20),
			@email VARCHAR(30),
			@observacion observacion
			)
AS
SET NOCOUNT ON															-- Para que muestre el resultado de la consulta sin mostrar la cuenta del número de registros

IF EXISTS (SELECT * FROM Paciente WHERE idPaciente = @idpaciente)		-- Comprobamos que existan registros para ese @idPaciente
	UPDATE Paciente SET dni = @dni,										-- Si existe, actualizamos los datos del registro... 
						nombre = @nombre,
						apellido= @apellido,
						fnacimiento = @fnacimiento,
						domicilio = @domicilio,
						idpais = @idpais,
						telefono = @telefono,
						email = @email,
						observacion = @observacion
	WHERE idPaciente = @idpaciente										-- ...referentes al idPaciente proporcionado
ELSE
	SELECT 0 AS Resultado												-- En caso de no existir registros para ese idTurno devolveremos 0 como Resultado
