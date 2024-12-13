-- 10. Crear un Stored procedure para insertar nuevos clientes en la tabla Cliente
/*
	- Añade el campo DNI al igual que en el ejercicio del curso (los registros anteriores quedaran en blanco o nulos).
	- El stored procedure debe ejecutarse con la siguiente expresión:
		EXEC Nuevo_cliente '2351365', 'Raúl','Stuart','19850521','Las regasta 25','ESP','655821547','Raul@krokimail.com',''
	- Ten en cuenta la información que te entrega la expresión anterior, por ejemplo, el nombre de la tabla de debes usar.
*/

CREATE PROCEDURE Nuevo_cliente
    @DNI VARCHAR(20),            -- Campo añadido desde la vista de diseño siguiendo las instrucciones de 57.EJERCCICIO del curso
    @Nombre VARCHAR(50),         
    @Apellido VARCHAR(50),       
    @Fnacimiento DATE,           
    @Domicilio VARCHAR(100),     
    @idPais VARCHAR(3),          
    @Telefono VARCHAR(15),       
    @Email VARCHAR(100),         
    @Observaciones VARCHAR(255) = 'No hay observaciones' 
AS
BEGIN
    INSERT INTO Cliente (DNI, Nombre, Apellido, Fnacimiento, Domicilio, idPais, Telefono, Email, Observaciones, FechaAlta)
    VALUES (@DNI, @Nombre, @Apellido, @Fnacimiento, @Domicilio, @idPais, @Telefono, @Email, @Observaciones, GETDATE());
END;