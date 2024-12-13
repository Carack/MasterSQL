-- Creando el Stored Procedure para a�adir pacientes
	-- Recuerda que en caso de crearlo y necesirar modificarlo en lugar de CREATE utilizar�amos ALTER

EXEC ALTA_Paciente '2324324','Jorge','Lopez','20180518','calle 1','PER','','jorgelopez@gmail.com','' -- As� ejecutar�amos el SP para ingresar un paciente
SELECT * FROM Paciente	-- As� podemos comprobar el estado de la tabla

CREATE PROC ALTA_paciente(          -- En caso de necesitar editar el SP usar ALTER en lugar de CREATE
			@dni VARCHAR(20),
			@nombre VARCHAR(50),
			@apellido VARCHAR (50),
			@fNacimiento VARCHAR(8),
			@domicilio VARCHAR(50),
			@idPais CHAR(3),
			@telefono VARCHAR(20)='',
			@email VARCHAR(30),
			@observacion observacion =''	-- Usamos el tipo de dato de usuario definido para este campo
			)
AS

IF NOT EXISTS (SELECT * FROM Paciente WHERE dni=@dni)
BEGIN 
	INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
	VALUES (@dni, @nombre, @apellido, @fNacimiento, @domicilio, @idPais, @telefono, @email, @observacion)
	PRINT 'El paciente se agreg� correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El paciente ya existe'
	RETURN
END
