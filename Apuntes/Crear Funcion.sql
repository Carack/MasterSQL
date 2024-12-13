-- Creando una funci�n

-- Si queremos llamar a la funci�n y que nos muestre el resultado podemos hacerlo con un SELECT
	-- SELECT dbo.Prueba (256)

CREATE FUNCTION Prueba (@var int)  -- Creamos la Funci�n Prueba que recibe un par�metro de tipo entero y lo asigna a la variable @var
RETURNS INT						   -- Indicamos que la salida de la funci�n va a ser un valor entero

AS

BEGIN							   -- Especificamos la funcionalidad de la funci�n. en este caso toma el par�metro, lo multiplica por 5 y lo devuelve
	SET @var = @var * 5
	RETURN @var
END