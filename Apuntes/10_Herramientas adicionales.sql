-- Herramientas adicionales

	-- El proceso SP_HELP nos ayuda a obtener los detalles de los objetos que tenemos definidos en la base de datos (Tablas, SP, Vistas)

SP_HELP Pais   -- Así podemos ver los detalles de la tabla Pais (tipo de tabla, de campos, identity, Primary Key, Foreign key...)

SP_HELP ALTA_Medico  -- Así podemos ver los detalles del SP ALTA_Medico (tipo, fecha de creación, parámetros que recibe...)

	-- El proceso SP_HELPTEXT nos permite ver el contenido de un SP

SP_HELPTEXT ALTA_Turno  -- Si lo ponemos en formato texto podríamos copiar todo el contenido (código) del SP para utilizarlo en otro lugar o editarlo

	-- Accesos directos (Shortcuts) de consola para ejecutar estos dos procesos

-- Vamos a Tools > Options > Environment > Keyboard > Query Shortcuts > Añadir en el recuadro a la derecha (SP_HELP está asignado a ALT+F1 por defecto)