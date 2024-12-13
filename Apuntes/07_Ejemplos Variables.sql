-- Estos son algunos ejemplos sobre cómo declarar Variables de distintos Tipos de Datos y evaluar valores Nulos:

	-- Declaramos un tipo entero, le asignamos NULL y lo mostramos con un valor por defecto 0 en caso de serlo con nombre de columna Valor

DECLARE @entero INT

SET @entero = NULL

SELECT ISNULL(@entero, 0) AS Valor

	-- Declaramos un tipo decimal, le asignamos NULL y lo mostramos con un valor por defecto 0.00 en caso de serlo con nombre de columna Valor

DECLARE @decimal DECIMAL(10,2)

SET @decimal = NULL

SELECT ISNULL(@decimal, 0.00) AS Valor

	-- Declaramos un tipo varchar de 50 caracteres, le asignamos NULL y lo mostramos con un valor por defecto 'Texto predeterminado' en caso de serlo con nombre de columna Valor

DECLARE @cadena VARCHAR(50)

SET @cadena = NULL

SELECT ISNULL(@cadena, 'Texto predeterminado') AS Valor

	-- Declaramos un tipo datetime, le asignamos NULL y lo mostramos con un valor por defecto de la fecha actual en caso de serlo con nombre de columna Valor

DECLARE @fecha DATETIME

SET @fecha = NULL

SELECT ISNULL(@fecha, GETDATE()) AS Valor

	-- Declaramos un tipo booleano, le asignamos NULL y lo mostramos con un valor por defecto 0 en caso de serlo con nombre de columna Valor

DECLARE @booleano BIT

SET @booleano = NULL

SELECT ISNULL(@booleano, 0) AS Valor

	-- Declaramos un tipo money, le asignamos NULL y lo mostramos con un valor por defecto 0.00 en caso de serlo con nombre de columna Valor

DECLARE @moneda MONEY

SET @moneda = NULL

SELECT ISNULL(@moneda, 0.00) AS Valor