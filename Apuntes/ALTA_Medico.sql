-- Creando el Stored Procedure para añadir Médicos
	-- Recuerda que en caso de crearlo y necesirar modificarlo en lugar de CREATE utilizaríamos ALTER

/*
SELECT * FROM Medico
SELECT * FROM MedicoEspecialidad
SELECT * FROM Especialidad
*/

-- Así es como realizaríamos una llamada al SP
-- EXEC ALTA_Medico 'Gerardo','Martinez',1,'Medico residente'


CREATE PROC ALTA_Medico(              -- En caso de necesitar editar el SP usar ALTER en lugar de CREATE
			@nombre VARCHAR(50),		 
			@apellido VARCHAR(20),   
			@idespecialidad INT,		
			@descripcion VARCHAR(50)  
			)
AS

SET NOCOUNT ON   -- Para que cuando hagamos el INSERT no nos diga los registros afectados

IF NOT EXISTS (SELECT TOP 1 idMedico FROM Medico WHERE nombre=@nombre AND apellido=@apellido)  -- Comprobamos que no exista otro médico con el mismo nombre y apellido
BEGIN 
	INSERT INTO Medico(nombre, apellido)
	VALUES (@nombre, @apellido)

	DECLARE @auxIDmedico medico
	SET @auxIDmedico = @@IDENTITY      -- Con esto asignamos a la variable el último campo IDENTITY generado. Como acabamos de crear un Médico en este caso será el idMedico

	INSERT INTO MedicoEspecialidad(idMedico, idEspecialidad, descripcion)
	VALUES (@auxIDmedico, @idespecialidad, @descripcion)
	PRINT 'El médico se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El médico ya existe'
	RETURN
END