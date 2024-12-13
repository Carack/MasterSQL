-- 10. Crear un Stored procedure para insertar nuevos clientes en la tabla Cliente
/*
	- A�ade el campo DNI al igual que en el ejercicio del curso (los registros anteriores quedaran en blanco o nulos).
	- El stored procedure debe ejecutarse con la siguiente expresi�n:
		EXEC Nuevo_cliente '2351365', 'Ra�l','Stuart','19850521','Las regasta 25','ESP','655821547','Raul@krokimail.com',''
	- Ten en cuenta la informaci�n que te entrega la expresi�n anterior, por ejemplo, el nombre de la tabla de debes usar.
*/

CREATE PROCEDURE Nuevo_cliente
    @DNI VARCHAR(20),            -- Campo a�adido desde la vista de dise�o siguiendo las instrucciones de 57.EJERCCICIO del curso
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