-- Funciones en transact SQL

	-- Las funciones MIN y MAX permiten obtener el valor mínimo o máximo de un campo

SELECT MAX(fecha) FROM Pago  -- Nos dará el mayor valor de ese campo. En este caso sería la fecha más reciente. 

SELECT MIN(monto) FROM Pago  -- Nos dará el valor mínimo de ese campo. En este caso el valor más pequeño de monto

	-- La función SUM nos permite realizar un sumatorio de un campo numérico

SELECT SUM(monto) FROM Pago  -- No muestra el nombre de columna porque podemos operar con varias columnas a la vez

SELECT SUM(monto) AS montoTotal FROM Pago  -- Así mostrará el nombre de columna montoTotal en lugar de No column name

SELECT SUM(monto + 20) AS montoTotal FROM Pago -- Podemos operar con SUM. En este caso sumaremos 20 a cada elemento de monto y después sumará todos los elementos de monto

SELECT SUM(monto) + 20 AS montoTotal FROM Pago -- Así sumaría 20 al total de la suma de los elementos de monto

	-- La función AVG nos devuelve el promedio de todos los elementos de la consulta

SELECT AVG(monto) AS montoPromedio FROM Pago  -- La sintaxis es similar a la de SUM

SELECT AVG(monto + 20) AS montoTotal FROM Pago -- Con esto sumaremos 20 a cada elemento de monto y después realizaremos el promedio

SELECT AVG(monto) + 20 AS montoTotal FROM Pago -- Así realizaremos el promedio y después le sumaremos 20 al resultado. En estos casos el resultado es el mismo porque es el promedio

	-- La función COUNT cuenta la cantidad de registros en una tabla

SELECT COUNT (*) FROM Paciente  -- Contará la cantidad de filas en la tabla

SELECT COUNT (idPaciente) FROM Paciente  --Contará la cantidad de idPaciente en Paciente. El resultado es el mismo que el anterior porque estamos contando TODAS las filas tomando como referencia el campo idPaciente

SELECT COUNT (idPaciente) FROM Paciente WHERE apellido = 'Ramirez' -- Devuelve la cantidad de registros con apellido Ramirez

	-- La función HAVING es parecido a WHERE pero trabaja sobre un conjunto de registros y no solo sobre uno. Trabaja en conjunto con COUNT y GROUP BY 

SELECT estado FROM Turno GROUP BY estado HAVING COUNT(estado) = 2  -- Devuelve los registros que haya 2 iguales en la columna estado. 

SELECT estado FROM Turno GROUP BY estado HAVING COUNT(estado) > 2  -- Devuelve los registros que haya más de dos que tengan el mismo estado. 

	-- Las funciones LEFT y RIGHT nos permiten tratar variables Char o Varchar para obtener determinados caracteres de la cadena a la izquierda o a la derecha

DECLARE @var1 VARCHAR(20)			-- Declaramos e inicializamos una variable de pruebas
SET @var1 = 'Ramiro'

PRINT LEFT(@var1,2)					-- Tomará 2 caracteres empezando por la izquierda

PRINT RIGHT(@var1,2)				-- Tomará los 2 caracteres empezando más a la derecha

	-- La función LEN cuenta la cantidad de caracteres de una variable tipo CHAR o VARCHAR

DECLARE @var2 VARCHAR(20)			-- Declaramos e inicializamos una variable de pruebas
SET @var2 = 'Gonzalez'

PRINT LEN(@var2)					-- Contará el número de caracteres en la variable

		-- LEN puede combinarse con LEFT y RIGHT

DECLARE @var3 VARCHAR(20)			-- Declaramos e inicializamos una variable de pruebas
SET @var3 = 'Rodriguez'

PRINT LEFT (@var3, LEN(@var3)-1)	-- Imprimirá la cadena en @var3 retirando el último caracter ya que le pasamos a LEFT como segundo parámetro el número de caracteres (conseguido con LEN) - 1


	-- Las funciones LOWER y UPPER nos permiten formatear variables de tipo texto o campos de una tabla
		
		-- LOWER convierte una cadena de caracteres a todo minúsculas

DECLARE @var4 VARCHAR(20)			-- Declaramos una variable de pruebas
SET @var4 = 'AmAdEo'				-- La inicializamos con mayúsculas y minúsculas intercaladas

PRINT LOWER(@var4)					-- Formatea la salida por pantalla con todos los caracteres en minúsculas

	-- UPPER convierte una cadena de caracteres a todo mayúsculas

DECLARE @var5 VARCHAR(20)			-- Declaramos una variable de pruebas
SET @var5 = 'AmAdEo'				-- La inicializamos con mayúsculas y minúsculas intercaladas

PRINT UPPER(@var5)					-- Formatea la salida por pantalla con todos los caracteres en mayúscualas

		-- Podemos utilizar estas funciones para formatear y normalizar los datos entrantes de una tabla

DECLARE @var6 VARCHAR(20)			-- Declaramos una variable de pruebas
SET @var6 = 'AmAdEo'				-- La inicializamos con mayúsculas y minúsculas intercaladas

PRINT UPPER(LEFT(@var6,1)) + LOWER(RIGHT(@var6, LEN(@var6)-1))  -- Convertirá el primer caracter por la izquierda en mayúsculas y el resto (LEN(@var6)-1) en minúsculas por la derecha

	-- La función REPLACE nos permite reemplazar un caracter por otro en una variable string o en un campo de una tabla

DECLARE @var7 VARCHAR(20)			-- Declaramos una variable de pruebas
SET @var7 = 'L@ura'					-- La inicializamos con un caracter no deseado

PRINT REPLACE(@var7,'@','a')		-- Va a reemplazar cualquier '@' que encuentre por una 'a'

	-- La función REPLICATE nos permite repetir un caracter o una cadena de caracteres la cantidad de veces que especifiquemos

PRINT REPLICATE ('0',5)				-- Repite el caracter '0' cinco veces
		
		-- Podemos utilizarlo para formatear salidas. Por ejemplo si queremos rellenar con un caracter todos los caracteres faltantes de un campo

	-- Las funciones LTRIM y RTRIM nos permiten eliminar los espacios de una cadena de caracteres tanto a la izquierda como a la derecha

		-- LTRIM eliminará los espacios a la izquierda 

DECLARE @var8 VARCHAR(20)			-- Declaramos una variable de pruebas
SET @var8 = '     Ramiro'			-- La inicializamos con 5 espacios al principio

PRINT LTRIM (@var8)					-- Retira los espacios a la izquierda
PRINT '*' + LTRIM (@var8)			-- Así podemos comprobar que no quedan espacios a la izquierda

		-- RTRIM eliminará los espacios a la derecha
		
DECLARE @var9 VARCHAR(20)			-- Declaramos una variable de pruebas
SET @var9 = 'Gonzalez     '			-- La inicializamos con 5 espacios al final

PRINT RTRIM (@var9)					-- Retira los espacios a la derecha
PRINT RTRIM (@var9) + '*'			-- Así podemos comprobar que no quedan espacios a la derecha

			-- Pueden combinarse

DECLARE @var10 VARCHAR(20)			-- Declaramos unas variables de pruebas
SET @var10 = '     Pablo   '		-- La inicializamos con 5 espacios al principio y 3 al final

PRINT LTRIM (RTRIM(@var10))			-- Retira los espacios a la izquierda y derecha
PRINT '*' + LTRIM (RTRIM(@var10)) + '*'  -- Así podemos comprobar que no quedan espacios ni a izqwuierda ni a derecha

	-- La función CONCAT nos permite concatenar dos o más valores diferentes 

DECLARE @var11 VARCHAR(20)			-- Declaramos unas variables de pruebas
DECLARE @var12 VARCHAR(20)
SET @var11 = 'Carlos'				-- Las inicializamos
SET @var12 = 'Hidalgo'

PRINT CONCAT (@var11,@var12)		-- Concatena ambas variables sin espacios
PRINT CONCAT (@var11,' ',@var12)	-- Podemos añadir los espacios como parámetros

	-- Las funciones GETDATE y GETUTCDATE nos permiten almacenar la fecha y la hora en la que se crea un registro
	
		-- Con GETDATE obtenemos la fecha y hora local del sistema donde está instalada la base de datos, en formato aaaa-mm-dd hh:mm:ss:miliseg

SELECT GETDATE()		

		-- Con GETUTCDATE obtenemos la hora universal basada en las coordenadas del meridiano de Greenwich, en formato aaaa-mm-dd hh:mm:ss:miliseg

SELECT GETUTCDATE()

	-- La función DATEADD nos permite agregarle o restarle a una fecha un intervalo (años, meses, días, horas, minutos, segundos, milisegundos)
		-- El primer parámetro puede abreviarse (YEAR=yy, MONTH=mm, DAY=dd, HOUR=hh, MINUTE=mi, SECOND=s, MILISECOND=ms)

SELECT DATEADD(DAY,2,GETDATE())		-- Esto agregará 2 días a la fecha y hora local actual
SELECT DATEADD(HOUR,-2,GETDATE())	-- Esto restará 2 horas a la fecha y hora local actual

	-- La función DATEDIFF nos devuelve la diferencia entre dos fechas según el intervalo especificado
		-- El primer parámetro es similar a DATEADD (YEAR, MONTH, DAY, HOUR...)

SELECT DATEDIFF(YEAR,GETDATE(),'20170120')   -- Esto devolverá los años de diferencia entre el segundo parámetro y el tercero. En este caso la fecha actual y la proporcionada

	--La función DATEPART nos permite obtener un intervalo específico de una fecha
		-- El primer parámetro es similar a DATEADD y DATEDIFF (YEAR, MONTH, DAY, HOUR...)

SELECT DATEPART(MONTH,GETDATE())		-- En este caso nos devuelve solamente el mes de la fecha actual local
SELECT DATEPART(DW, GETDATE())			-- Además acepta también otros parámetros como dw = Día de la semana

	-- La función ISDATE nos permite evaluar si una fecha específica tiene el formato correcto o no devolviendo TRUE(1) o FALSE(0)

PRINT ISDATE(GETDATE())				-- En este caso devolverá TRUE ya que estamos comparando con una veriable fecha del sistema que va a tener el formato correcto siempre
PRINT ISDATE('19850721')			-- En este caso devolverá TRUE ya que le hemos proporcionado una fecha en el formato correcto
PRINT ISDATE('dfdfdf')				-- En este caso devolverá FALSE ya que la cadena de caracteres proporcionada no se corresponde con el formato de fecha
PRINT ISDATE('20200532')			-- En este caso devolverá FALSE ya que se ha introducido una fecha fuera de los valores correctos (32 de Marzo no existe)

	-- Las funciones CAST y CONVERT nos permiten formatear un tipo de dato a otro

		-- CAST es una función genérica que nos permite formatear un tipo de dato en otro siempre que sea del mismo género (números a números y caracteres a caracteres)

DECLARE @num MONEY			-- Declaramos una variable de pruebas tipo MONEY
SET @num = 500.40			-- La inicializamos
PRINT @num					-- Previsualizamos su valor

PRINT CAST(@num AS INT)		-- Mostramos la variable formateada a tipo entero
SELECT CAST(idPaciente AS MONEY) FROM Paciente  -- Un ejemplo de como formatear la salida de datos de una tabla. En este caso idPaciente que son datos INT se mostrarán como datos MONEY

		-- CONVERT es una implementación de la función CAST que nos permite añadir ciertos parámetros para que la conversión sea más detallada

DECLARE @num2 MONEY			-- Declaramos una variable de pruebas tipo MONEY
SET @num2 = 500.40			-- La inicializamos
PRINT @num2					-- Previsualizamos su valor

PRINT CONVERT(INT, @num2)	-- Mostramos la variable formateada a tipo entero del mismo modo que con CAST
	
			-- CONVERT posee un tercer parámetro que resulta muy útil en ciertos casos, como cuando queremos convertir fechas

DECLARE @fecha DATETIME			-- Declaramos una variable de pruebas tipo DATETIME
SET @fecha = GETDATE()			-- La inicializamos con la fecha actual local en el momento de ejecución
PRINT @fecha					-- Previsualizamos su valor

PRINT CONVERT (CHAR(8), @fecha) -- Mostramos la variable formateada para que solo muestre sus primeros 8 caracteres de salida
PRINT CONVERT (CHAR(20), @fecha, 112)	-- Mostramos la variable formateada para que muestre 20 caracteres Y añadimos un formato específico de fecha (112 = aaaammdd)
PRINT CONVERT (CHAR(20), @fecha, 104)	-- Mostramos la variable formateada para que muestre 20 caracteres Y añadimos un formato específico de fecha (104 = dd.mm.aaaa)
PRINT CONVERT (CHAR(20), @fecha, 111)	-- Mostramos la variable formateada para que muestre 20 caracteres Y añadimos un formato específico de fecha (111 = aaaa/mm/dd)

	--Funciones definidas por el usuario. Funciones escalares y de tipo tabla. 

		-- Funciones escalares. Nos permiten recibir uno o más parámetros, realizar un proceso y devolver un valor de tipo específico. 

			-- Creamos una función para concatenar apellido, nombre. 
					
					-- Para invocar la función lo haríamos de este modo: PRINT dbo.concatenar('Lopez','Roberto')  . También podríamos usar un SELECT...

CREATE FUNCTION concatenar (						-- Creamos la función y le asignamos un nombre
				@apellido VARCHAR (50),				-- Declaramos los argumentos
				@nombre VARCHAR (50)
				)
RETURNS VARCHAR (100)								-- Declaramos el tipo de dato de retorno
AS
BEGIN
	DECLARE @resultado VARCHAR(100)					-- Realizamos las operaciones
	SET @resultado = @apellido + ', ' + @nombre
	RETURN @resultado								-- Devolvemos la variable de retorno
END

			-- Creamos una función que me devuelva el campo de una tabla

				-- Para invocar la función lo haríamos de este modo: SELECT dbo.obtenerPais(2)   . También podríamos usar un PRINT...

CREATE FUNCTION obtenerPais (
				@idpaciente paciente
				)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @pais VARCHAR(50)							-- Declaramos la variable que vamos a utilizar como variable de retorno
	SET @pais = (SELECT PA.pais FROM Paciente P			-- Asignamos a la variable de retorno el valor que devuelve la búsqueda cruzando las tablas Paciente y Pais
				 INNER JOIN Pais PA
				 ON PA.idPais = P.idPais
				 WHERE idPaciente = @idpaciente)
	RETURN @pais
END

		-- Funciones de tipo tabla. Nos permiten recibir uno o más parámetros, realizar un proceso y retornar una tabla (un conjunto de registros)

			-- Creamos una función que nos devuelve una lista de paises. 
				
				-- Para invocar la función lo haríamos de este modo: SELECT * FROM dbo.listaPaises()

CREATE FUNCTION listaPaises()
RETURNS @paises TABLE(idpais CHAR(3), pais VARCHAR(50))
AS
BEGIN
	INSERT INTO @paises VALUES ('CHI','CHILE')
	INSERT INTO @paises VALUES ('USA','Estados Unidos')
	INSERT INTO @paises VALUES ('JPN','Japón')
	INSERT INTO @paises VALUES ('ESP','España')
	INSERT INTO @paises VALUES ('MEX','Mexico')
	INSERT INTO @paises VALUES ('PER','Perú')
	INSERT INTO @paises VALUES ('ARG','Argentina')

	RETURN
END