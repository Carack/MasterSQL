-- Creando una función

-- Si queremos llamar a la función y que nos muestre el resultado podemos hacerlo con un SELECT
	-- SELECT dbo.Prueba (256)

CREATE FUNCTION Prueba (@var int)  -- Creamos la Función Prueba que recibe un parámetro de tipo entero y lo asigna a la variable @var
RETURNS INT						   -- Indicamos que la salida de la función va a ser un valor entero

AS

BEGIN							   -- Especificamos la funcionalidad de la función. en este caso toma el parámetro, lo multiplica por 5 y lo devuelve
	SET @var = @var * 5
	RETURN @var
END