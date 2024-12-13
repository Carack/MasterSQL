-- Operadores lógicos

-- El operador AND concatena varias condiciones y devuelve registros si todas se cumplen

SELECT * FROM Paciente WHERE apellido = 'Ramirez' AND nombre = 'Carlos'

-- El operador OR  concatena varias condiciones y devuelve registros si al menos una se cumple

SELECT * FROM Paciente WHERE apellido = 'Ramirez' OR nombre = 'Carlos'

-- El operador IN permite filtrar por uno o varios grupos de valores

SELECT * FROM Paciente WHERE apellido IN('Ramirez', 'Paredes')

-- El operador LIKE permite trabajar sobre campos tipo cadena de caracteres para filtrar los resultados por algún caracter presente en ese campo

SELECT * FROM Paciente WHERE nombre LIKE 'Ca%'  -- El % implica cualquier secuencia de caracteres (incluyendo ninguna) después de 'Ca'

SELECT * FROM Paciente WHERE nombre LIKE '%dro' -- Busacrá el que termine en 'dro' teniendo cualquier secuencia (incluyendo ninguna) antes

SELECT * FROM Paciente WHERE nombre LIKE '%or%' -- Buscara cualquiera que contenga 'or' teniendo cualquier secuencia (incluyendo ninguna) antes o después

-- El operador NOT permite negar cualquier operador puesto anteriormente como IN o LIKE

SELECT * FROM Paciente WHERE nombre NOT LIKE '%or%' -- Mostrará todos los registros QUE NO contengan 'or' 

SELECT * FROM Paciente WHERE apellido NOT IN('Ramirez', 'Paredes')  -- Mostrará todos los QUE NO contengan 'Ramirez' o 'Paredes'

-- El operador BETWEEN trabaja con AND y permite filtrar los registros por un determinado rango

SELECT * FROM Turno WHERE fechaTurno BETWEEN '19050616' AND '21-06-1905' -- Devolverá los registros entre el rango de fechas puesto

SELECT * FROM Turno WHERE estado BETWEEN 0 AND 1 --Devolverá todos los registros cuyo estado se encuentre entre 0 y 1

-- Los operadores pueden combinarse entre sí

SELECT * FROM Paciente WHERE apellido = 'Ramirez' AND (nombre = 'Carlos' OR nombre = 'Jorge') OR idPais = 'MEX' AND idPaciente IN (6,3)