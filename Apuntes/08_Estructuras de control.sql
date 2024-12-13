-- Estructuras de control

	-- La estructura condifional IF ELSE

DECLARE @idpaciente INT 
DECLARE @idturno INT

SET @idpaciente = 3

IF @idpaciente = 3			-- Se evalúa la condición y si es correcta se ejecutará el bloque de código (por defecto solo la siguiente línea)
BEGIN						-- Con BEGIN y END ejecutaríamos todo el bloque de código entre estas palabras reservadas si se cumple la condición
	SET @idturno = 20
	SELECT * FROM Paciente WHERE idPaciente = @idpaciente
	PRINT @idturno
END
ELSE						-- En caso de que la condición NO se cumpla se ejutará la siguiente línea de código (por defecto) o el bloque entre BEGIN y END
BEGIN
	PRINT 'La condición no se ha cumplido'
END

	-- La función EXISTS permite evaluar si existe un grupo de registros en determinada consulta

IF EXISTS (SELECT * FROM Paciente WHERE idPaciente = 2)  -- Valorará si el contenido del paréntesis está presente en la base de datos y devolverá TRUE o FALSE
	PRINT 'Existe'

	-- La estructura (bucle) WHILE permite ejecutar un bloque de código mientras se cumpla una condición

DECLARE @contador INT = 0

WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET @contador = @contador + 1
END

	-- La estructura condicional CASE nos permite tomar decisiones en función al valor de un campo
		-- Probaremos con un SET

DECLARE @valor INT
DECLARE @resultado CHAR(10) = ''
SET @valor = 20

SET @resultado = CASE WHEN @valor = 10 THEN 'Rojo'
					  WHEN @valor = 20 THEN 'Verde'
					  WHEN @valor = 30 THEN 'Azul'
				 ELSE 'Gris'
				 END
PRINT @resultado 

		-- Ahora probamos con un SELECT

SELECT *, 
	CASE WHEN estado = 1 THEN 'Verde'
		 WHEN estado = 2 THEN 'Rojo'
		 WHEN estado = 3 THEN 'Azul'
	ELSE 'Gris'
	END AS ColorTurno
FROM Turno

	-- La instrucción RETURN nos permite salir del script que se está ejecutando forzosamente (el código bajo este ya no se ejecutarán ni dentro ni fuera de la estructura)
		-- Aprovecharemos el ejemplo de WHILE anterior para esta prueba

DECLARE @contador2 INT = 0

WHILE @contador2 <= 10
BEGIN
	PRINT @contador2
	SET @contador2 = @contador2 + 1
	IF @contador2 = 3
		RETURN				-- En este caso al llegar el contador a 3 saldrá del bucle aunque la condición de este no ha terminado y NO se ejecutará más
	PRINT 'Hola'			-- En el momento de entrar el RETURN esta línea ya NO se ejecuta
END
PRINT 'Sigue ejecutando'	-- Esta línea TAMPOCO se ejecuta 

	-- La instrucción BREAK es similar a RETURN pero con un funcionamiento distinto. Este detiene la ejecución de la estructura en la que se encuentre, pero las líneas
	-- de código bajo ella si se ejecutarán
		-- Aprovecharemos de nuevo el ejemplo de WHILE anterior para esta prueba

DECLARE @contador3 INT = 0

WHILE @contador3 <= 10
BEGIN
	PRINT @contador3
	SET @contador3 = @contador3 + 1
	IF @contador3 = 3
		BREAK				-- En este caso al llegar el contador a 3 saldrá del bucle aunque la condición de este no ha terminado y NO se ejecutará más el bucle
	PRINT 'Hola'			-- En el momento de entrar el BREAK esta línea ya NO se ejecuta
END
PRINT 'Sigue ejecutando'	-- Esta línea SÍ se ejecuta con normalidad porque no está dentro de la estructura del bucle WHILE

	-- La estructura TRY CATCH nos permite el manejo de errores, principalmente en tiempo de ejecución. También permite que continúe la ejecución tras el error.

DECLARE @contador4 INT = 0
SET @contador4 = 'Texto'		-- Esto generaría un error en la consola que detendría el script por asignar una cadena de texto a una variable entera

DECLARE @contador5 INT = 0
BEGIN TRY
	SET @contador5 = 'Texto' -- El TRY comprueba si hay un error en la instrucción en su interior y de haberlo lo manda al CATCH
END TRY

BEGIN CATCH
	PRINT 'No es posible asignar un texto a la variable @contador' -- Gracias a CATCH personalizaremos la salida del error
END CATCH
PRINT 'Sigue ejecutando'	-- Con esto podemos comprobar que el script continúa su ejecución con normalidad