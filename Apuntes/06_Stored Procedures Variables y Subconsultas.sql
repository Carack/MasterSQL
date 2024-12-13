-- Stored Procedures, Variables y Subconsultas

-- Los Stored Procedures son  un conjunto de instrucciones SQL almacenado internamente en SQL server para poder ejecutarlos en el momento en el que sean invocados
	-- Es útil para ejecutar múltiples acciones concretas como generar un proceso de inserción, borrado, actualización...de registros

/* El bloque siguiente se añade automáticamente cuando creas el Stored Procedures desde la interfaz pulsando click derecho sobre Programability > Stored Procedures y 
pulsando new > Stored Procedure. */ 

SET ANSI_NULLS ON   -- Hace que las comparaciones con NULL sigan las reglas estándar, para evitar errores. Cuando está en ON si comparas algo con NULL (por ejemplo
GO					-- NULL = NULL), no se considera verdadero. En su lugar, debes usar IS NULL para comprobar si algo es NULL.
					-- Estando en OFF podrías realizar comparaciones como idPaciente = NULL. 

SET QUOTED_IDENTIFIER ON  -- Permite usar comillas dobles para nombres de objetos como tablas y columnas, lo que es útil para nombres especiales.
GO						  -- Con esto podríamos asignar de nombre a una tabla la palabra reservada select por ejemplo (poniendo el nombre como "select").

	-- Creamos un SP que pasándole un idPaciente como parámetro nos muestre el registro de la tabla Paciente que contenga ese idPaciente

CREATE PROC S_paciente (@idPaciente int) AS
	SELECT * FROM Paciente WHERE idPaciente = @idPaciente
GO

	-- Modificar un SP que ya esté creado
		-- Podemos hacer click derecho en Programability > Stored Procedures > [dbo.nombreprocedimiento] y pulsar en modify con lo cual ya nos preparará la plantilla o 
		-- podemos programarlo así

ALTER PROC S_paciente (@idpaciente int) AS
	SELECT * FROM Paciente WHERE idPaciente = @idpaciente -- Aquí añadiríamos las modificaciones.
	PRINT 6												  -- En este caso además de lo que ya hacía antes imprimirá un 6 por pantalla.
GO

	-- Ejecutar un SP

EXEC S_paciente 3	-- Ejecutaríamos el SP pasándole como parámetro un 3 lo que en este caso nos devolvería el registro del Paciente con idPaciente = 3

-- Las variables son objetos en memoria que nos permiten almacenar un valor. Siempre van precedidos de una @
	
	-- Creación de variables

DECLARE @prueba CHAR (1)	-- Declaramos una variable tipo char con un caracter. Al no estar inicializada su valor será NULL

PRINT ISNULL(@prueba, 'A')  -- Con ISNULL conseguimos que en el caso en el que la variable contenga un valor NULL que utilice un valor por defecto en su lugar ('A' en este caso)

DECLARE @ordenamiento CHAR(1) = 'A'   -- Declaramos una variable de tipo char con un caracter y la inicializamos con el valor 'A'

	-- Asignar un valor a una variable

SET @ordenamiento = 'D'			-- Podemos utilizar esta sentencia para inicializar una variable si no lo habíamos hecho durante su creación o para asignarle un valor


-- Las subconsultas son una sentencia SELECT dentro de otra sentencia SELECT

	-- Crear una subconsulta (SubQuery)
		-- Tendremos que agregar alias a las tablas para poder tratarlas como objetos a la hora de referirnos a sus campos (p.ej. Paciente pa, Pais ps... )
		-- Hay que asegurarse de que el SELECT dentro del SELECT solo devuelva un único valor porque si no dará error
		-- Tras el (SELECT) podemos añadir un alias para la columna que se nos mostrará con el dato que recoja ese SELECT

SELECT apellido, nombre, idPais, observacion, (SELECT pais FROM Pais ps WHERE ps.idPais = pa.idPais) descPais FROM Paciente pa WHERE idPaciente = 2
