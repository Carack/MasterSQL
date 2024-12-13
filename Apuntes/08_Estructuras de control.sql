-- Estructuras de control

	-- La estructura condifional IF ELSE

DECLARE @idpaciente INT 
DECLARE @idturno INT

SET @idpaciente = 3

IF @idpaciente = 3			-- Se eval�a la condici�n y si es correcta se ejecutar� el bloque de c�digo (por defecto solo la siguiente l�nea)
BEGIN						-- Con BEGIN y END ejecutar�amos todo el bloque de c�digo entre estas palabras reservadas si se cumple la condici�n
	SET @idturno = 20
	SELECT * FROM Paciente WHERE idPaciente = @idpaciente
	PRINT @idturno
END
ELSE						-- En caso de que la condici�n NO se cumpla se ejutar� la siguiente l�nea de c�digo (por defecto) o el bloque entre BEGIN y END
BEGIN
	PRINT 'La condici�n no se ha cumplido'
END

	-- La funci�n EXISTS permite evaluar si existe un grupo de registros en determinada consulta

IF EXISTS (SELECT * FROM Paciente WHERE idPaciente = 2)  -- Valorar� si el contenido del par�ntesis est� presente en la base de datos y devolver� TRUE o FALSE
	PRINT 'Existe'

	-- La estructura (bucle) WHILE permite ejecutar un bloque de c�digo mientras se cumpla una condici�n

DECLARE @contador INT = 0

WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET @contador = @contador + 1
END

	-- La estructura condicional CASE nos permite tomar decisiones en funci�n al valor de un campo
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

	-- La instrucci�n RETURN nos permite salir del script que se est� ejecutando forzosamente (el c�digo bajo este ya no se ejecutar�n ni dentro ni fuera de la estructura)
		-- Aprovecharemos el ejemplo de WHILE anterior para esta prueba

DECLARE @contador2 INT = 0

WHILE @contador2 <= 10
BEGIN
	PRINT @contador2
	SET @contador2 = @contador2 + 1
	IF @contador2 = 3
		RETURN				-- En este caso al llegar el contador a 3 saldr� del bucle aunque la condici�n de este no ha terminado y NO se ejecutar� m�s
	PRINT 'Hola'			-- En el momento de entrar el RETURN esta l�nea ya NO se ejecuta
END
PRINT 'Sigue ejecutando'	-- Esta l�nea TAMPOCO se ejecuta 

	-- La instrucci�n BREAK es similar a RETURN pero con un funcionamiento distinto. Este detiene la ejecuci�n de la estructura en la que se encuentre, pero las l�neas
	-- de c�digo bajo ella si se ejecutar�n
		-- Aprovecharemos de nuevo el ejemplo de WHILE anterior para esta prueba

DECLARE @contador3 INT = 0

WHILE @contador3 <= 10
BEGIN
	PRINT @contador3
	SET @contador3 = @contador3 + 1
	IF @contador3 = 3
		BREAK				-- En este caso al llegar el contador a 3 saldr� del bucle aunque la condici�n de este no ha terminado y NO se ejecutar� m�s el bucle
	PRINT 'Hola'			-- En el momento de entrar el BREAK esta l�nea ya NO se ejecuta
END
PRINT 'Sigue ejecutando'	-- Esta l�nea S� se ejecuta con normalidad porque no est� dentro de la estructura del bucle WHILE

	-- La estructura TRY CATCH nos permite el manejo de errores, principalmente en tiempo de ejecuci�n. Tambi�n permite que contin�e la ejecuci�n tras el error.

DECLARE @contador4 INT = 0
SET @contador4 = 'Texto'		-- Esto generar�a un error en la consola que detendr�a el script por asignar una cadena de texto a una variable entera

DECLARE @contador5 INT = 0
BEGIN TRY
	SET @contador5 = 'Texto' -- El TRY comprueba si hay un error en la instrucci�n en su interior y de haberlo lo manda al CATCH
END TRY

BEGIN CATCH
	PRINT 'No es posible asignar un texto a la variable @contador' -- Gracias a CATCH personalizaremos la salida del error
END CATCH
PRINT 'Sigue ejecutando'	-- Con esto podemos comprobar que el script contin�a su ejecuci�n con normalidad