-- Sentencias DLL

	-- La sentencia ALTER podemos utilizarla para editar un SP, y en tablas podemos agregar campos, modificar la estructura de un campo o elimina ese campos 

ALTER TABLE Paciente ADD estado smallint		-- Añade el campo estado a la tabla Paciente
ALTER TABLE Paciente ALTER COLUMN estado bit    -- Cambia el tipo de dato de la columna estado del que tenía a bit
ALTER TABLE Paciente DROP COLUMN estado			-- Elimina el campo estado

	-- Obtener un Script con la estructura de una tabla que ya hemos creado previamente
		-- Podemos usarlo para ejecutar la creación de una tabla o poder cambiarle algún campo y utilizarla para la creación de otra tabla 

-- Object Explorer > Databases > NombreBasededatos >Tables > NombreTabla > Click derecho > Script Table as > Create To > New Query Editor Window 

	-- La sentencia DROP nos permite eliminar una tabla por completo de la base de datos o bien la base de datos completa

CREATE TABLE ejemplo (campo1 int, campo2 int)	-- Creamos una tabla de ejemplo

DROP TABLE ejemplo								-- Eliminamos la tabla de ejemplo. Para borrar una BD pondríamos DROP DATABASE y el nombre de la base de datos. 

	-- La sentencia TRUNCATE nos permite eliminar por completo los registros de una tabla reseteando los valores IDENTITY

CREATE TABLE ejemplo (campo0 int IDENTITY (1,1), campo1 int, campo2 int)	-- Creamos una tabla de ejemplo
INSERT INTO	ejemplo VALUES (2,3)											-- Introducimos datos en la tabla
INSERT INTO	ejemplo VALUES (4,3)
INSERT INTO	ejemplo VALUES (2,5)

TRUNCATE TABLE ejemplo														-- Eliminamos los registros de la tabla  y reinicia IDENTITY (la tabla permanece pero vacía)
