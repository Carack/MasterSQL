-- Rellenando una tabla con el contenido de un Excel

	-- Para el ejemplo utilizaremos la planilla de excel 'pacientes.xls'

SELECT * FROM Paciente						-- Comprobamos los campos que tenemos en la tabla y en la planilla de excel para ver cuales podremos utilizar

	/* 
	  Trabajaremos sobre la planilla de excel. Utilizaremos =CONCATENAR() para recoger los datos que vamos a insertar con INSERT en la tabla añadiendo "'" para añadir 
	  comillas simples cuando sean necesarias, combinando las celdas por referencia y aplicando las funciones necesarias para formatear el texto como TEXTO, DERECHA, 
	  EXTRAE...Del modo siguiente: 
	
		 =CONCATENAR("INSERT INTO Paciente VALUES ('" & C2 & "','"&A2&"','"&B2&"','"&DERECHA(TEXTO(H2;"dd/mm/yyyy");4)&EXTRAE(TEXTO(H2;"dd/mm/yyyy");4;2)&IZQUIERDA(TEXTO(H2;"dd/mm/yyyy");2)&"','"&E2&"','"&F2&"','"&D2&"','"&G2&"','')")

	  NOTA: Es posible que debido a la configuración de idioma (en mi caso Español) del sistema Excel no detecte yyyy como años y habría que cambiarlo por aaaa

	  Tras esto arrastramos o copiamos la fórmula para todas las filas que queramos pasar a nuestra base de datos y ya podremos copiar las instrucciones en un Query
	  de SQLSMS para poder insertar los datos
	*/ 

INSERT INTO Paciente VALUES ('3625625522','Arnol ','Espitaleta Sierra','19791022','Calle 12','MEX','324324343','prueba@gmail.com','')   -- Estos serían los datos recogidos por la fórmula del Excel


