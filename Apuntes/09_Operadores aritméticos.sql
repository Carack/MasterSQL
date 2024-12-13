-- Operadores aritméticos y de comparación

	--Operadores aritméticos 
		-- Operador aritmético de Suma para sumar números

DECLARE @num1 DECIMAL(9,2) = 20
DECLARE @num2 DECIMAL(9,2) = 30
DECLARE @result DECIMAL(9,2)

SET @result = @num1 + @num2
PRINT @result

		-- Operador aritmético de Suma para concatenar cadenas de caracteres 

DECLARE @text1	VARCHAR(20) = 'Hola me llamo'
DECLARE @text2 VARCHAR(20) = 'Mariano'
DECLARE @resultado VARCHAR(40)

SET @resultado = @text1 + ' ' + @text2
PRINT @resultado

		-- Operador aritmético de resta

DECLARE @num3 DECIMAL(9,2) = 20
DECLARE @num4 DECIMAL(9,2) = 30
DECLARE @result2 DECIMAL(9,2)

SET @result2 = @num3 - @num4
PRINT @result2

		-- Operador aritmético de división 

DECLARE @num5 DECIMAL(9,2) = 20
DECLARE @num6 DECIMAL(9,2) = 30
DECLARE @result3 DECIMAL(9,2)

SET @result3 = @num6 / @num5
PRINT @result3

		-- Operador aritmético de módulo (resto)

DECLARE @num7 DECIMAL(9,2) = 20
DECLARE @num8 DECIMAL(9,2) = 30
DECLARE @result4 DECIMAL(9,2)

SET @result4 = @num8 % @num7
PRINT @result4

		-- Operador aritmético de producto

DECLARE @num9 DECIMAL(9,2) = 20
DECLARE @num10 DECIMAL(9,2) = 30
DECLARE @result5 DECIMAL(9,2)

SET @result5 = @num9 * @num10
PRINT @result5

	-- Operadores de comparación
	-- Pueden compararse tanto números como alfanuméricos. En caso de textos la comparación se realiza en relación al número de caracteres y orden alfabético. 

		-- Operador de comparación mayor que

DECLARE @num11 DECIMAL(9,2) = 20
DECLARE @num12 DECIMAL(9,2) = 30

IF @num12 > @num11
	PRINT 'num12 es mayor que num11'

			-- Operador de comparación mayor o igual que

DECLARE @numX DECIMAL(9,2) = 30
DECLARE @numY DECIMAL(9,2) = 30
DECLARE @numZ DECIMAL(9,2) = 20

IF @numX >= @numY
	PRINT 'numX es mayor o igual que que numY'
IF @numY >= @numZ
	PRINT 'numY es mayor o igual que que numZ'

		-- Operador de comparación menor que

DECLARE @num13 DECIMAL(9,2) = 20
DECLARE @num14 DECIMAL(9,2) = 30

IF @num13 < @num14
	PRINT 'num13 es menor que num14'

			-- Operador de comparación menor o igual que

DECLARE @numX2 DECIMAL(9,2) = 30
DECLARE @numY2 DECIMAL(9,2) = 30
DECLARE @numZ2 DECIMAL(9,2) = 50

IF @numX2 <= @numY2
	PRINT 'numX2 es menor o igual que que numY2'
IF @numY2 <= @numZ2
	PRINT 'numY2 es menor o igual que que numZ2'

		-- Operador de comparación igual

DECLARE @num15 DECIMAL(9,2) = 30
DECLARE @num16 DECIMAL(9,2) = 30

IF @num15 = @num16
PRINT 'num15 es igual a num16'

		-- Operador de comparación distinto

DECLARE @num17 DECIMAL(9,2) = 20
DECLARE @num18 DECIMAL(9,2) = 30

IF @num17 <> @num18
PRINT 'num17 es distinto a num18'

		-- Operadores de comparación con alfanuméricos. 
		-- Su funcionamiento es similar al que tiene con números teniendo en cuenta que la comparación se hace por número de caracteres y posición en el alfabeto
			-- Por número de caracteres

DECLARE @text3 VARCHAR(50) = 'Hola me llamo'
DECLARE @text4 VARCHAR(50) = 'Hola me llamo Mariano'

IF @text4 > @text3	
PRINT 'text4 es mayor que text3'  -- Al tener text 4 mayor número de caracteres es mayor a text3

			-- Alfabético

DECLARE @text5 VARCHAR(50) = 'Hola me llamo Mariano'
DECLARE @text6 VARCHAR(50) = 'Hola me llamo Marianp'

IF @text6 > @text5	
PRINT 'text6 es mayor que text5'  -- Al ser la 'p' de 'Marianp' una letra más avanzada en el abecedario que la 'o' de 'Mariano' se considera mayor