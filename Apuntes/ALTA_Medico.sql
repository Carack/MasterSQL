-- Creando el Stored Procedure para a�adir M�dicos
	-- Recuerda que en caso de crearlo y necesirar modificarlo en lugar de CREATE utilizar�amos ALTER

/*
SELECT * FROM Medico
SELECT * FROM MedicoEspecialidad
SELECT * FROM Especialidad
*/

-- As� es como realizar�amos una llamada al SP
-- EXEC ALTA_Medico 'Gerardo','Martinez',1,'Medico residente'


CREATE PROC ALTA_Medico(              -- En caso de necesitar editar el SP usar ALTER en lugar de CREATE
			@nombre VARCHAR(50),		 
			@apellido VARCHAR(20),   
			@idespecialidad INT,		
			@descripcion VARCHAR(50)  
			)
AS

SET NOCOUNT ON   -- Para que cuando hagamos el INSERT no nos diga los registros afectados

IF NOT EXISTS (SELECT TOP 1 idMedico FROM Medico WHERE nombre=@nombre AND apellido=@apellido)  -- Comprobamos que no exista otro m�dico con el mismo nombre y apellido
BEGIN 
	INSERT INTO Medico(nombre, apellido)
	VALUES (@nombre, @apellido)

	DECLARE @auxIDmedico medico
	SET @auxIDmedico = @@IDENTITY      -- Con esto asignamos a la variable el �ltimo campo IDENTITY generado. Como acabamos de crear un M�dico en este caso ser� el idMedico

	INSERT INTO MedicoEspecialidad(idMedico, idEspecialidad, descripcion)
	VALUES (@auxIDmedico, @idespecialidad, @descripcion)
	PRINT 'El m�dico se agreg� correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El m�dico ya existe'
	RETURN
END