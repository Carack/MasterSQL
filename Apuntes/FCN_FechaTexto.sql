-- Creamos una funci�n para convertir una fecha a formato texto

	-- Para utilizarla lo har�amos de este modo

		-- SELECT @@DATEFIRST;								Nos aseguramos de que empieza en 1
		-- SELECT @@LANGUAGE;								Nos aseguramos del idioma (Espa�ol -> 1=Lunes, US_English -> 1=Domingo)
		-- PRINT dbo.FCN_FechaTexto ('20190515')			Ya podemos llamar a la funci�n pas�ndole una fecha como par�metro




CREATE FUNCTION FCN_FechaTexto (@fecha datetime)			-- Creamos la funci�n
RETURNS VARCHAR(60)											-- Que devolver� un VARCHAR de 60 caracteres
AS
BEGIN
	DECLARE @dia VARCHAR(20)								-- Declaramos variables
	DECLARE @mes VARCHAR(20)
	DECLARE @fechatexto VARCHAR(50)

	SET @dia = (CASE WHEN DATEPART(DW, @fecha) = 1 THEN 'Lunes' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))		-- Rellenamos la variable @dia valorando qu� d�a de la semana y n�mero son la fecha proporcionada
				     WHEN DATEPART(DW, @fecha) = 2 THEN 'Martes' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
				     WHEN DATEPART(DW, @fecha) = 3 THEN 'Mi�rcoles' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
				     WHEN DATEPART(DW, @fecha) = 4 THEN 'Jueves' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
				     WHEN DATEPART(DW, @fecha) = 5 THEN 'Viernes' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
				     WHEN DATEPART(DW, @fecha) = 6 THEN 'S�bado' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
				     WHEN DATEPART(DW, @fecha) = 7 THEN 'Domingo' + ' ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
			   END)
	SET @mes = (CASE WHEN DATEPART(MM,@fecha)= 1 THEN 'Enero'														-- Rellenamos la variable @mes valorando qu� mes es la fecha proporcionada
					 WHEN DATEPART(MM,@fecha)= 2 THEN 'Febero'
					 WHEN DATEPART(MM,@fecha)= 3 THEN 'Marzo'
					 WHEN DATEPART(MM,@fecha)= 4 THEN 'Abril'
					 WHEN DATEPART(MM,@fecha)= 5 THEN 'Mayo'
					 WHEN DATEPART(MM,@fecha)= 6 THEN 'Junio'
					 WHEN DATEPART(MM,@fecha)= 7 THEN 'Julio'
					 WHEN DATEPART(MM,@fecha)= 8 THEN 'Agosto'
					 WHEN DATEPART(MM,@fecha)= 9 THEN 'Septiembre'
					 WHEN DATEPART(MM,@fecha)= 10 THEN 'Octubre'
					 WHEN DATEPART(MM,@fecha)= 11 THEN 'Noviempre'
					 WHEN DATEPART(MM,@fecha)= 12 THEN 'Diciembre'
				END)
	SET @fechatexto = @dia + ' de ' + @mes								-- Rellenamos la variable @fechatexto concatenando las otras dos
	RETURN @fechatexto													-- Devolvemos @fechatexto como par�metro de salida
END