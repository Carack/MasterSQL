-- Administración de Usuarios en SQL

	-- Usuarios y Logins

/*
   SQL Server tiene 2 niveles de acceso. Por un lado tenemos los Logins, con los que accedemos a la instancia del servidor (al motor de base de datos) y los 
   Usuarios, que están definidos dentro de cada base de datos. A esos usuarios les vamos a poder otorgar permisos.
   Todo usuario está relacionado con un login.
*/

		-- Crear un Login y un usuario

/*
  Login:
   En el Object Explorer nos dirijimos a la carpeta Security del directorio raíz. Click derecho y New Login. En la nueva ventana, en la pestaña general seleccionaremos
   SQL Server authentication y le damos nombre, contraseña y una base de datos por defecto. 

  Usuario:
   En el Object Explorer nos dirijimos a la carpeta Security de nuestra base de datos. Click derecho y New User. En la nueva ventana, en la pestaña general seleccionaremos
   SQL user server login y le damos nombre de usuario, el login con el que está relacionado y el schema por defecto (por defecto dbo).
   En la pestaña Membership podemos asignarle un rol al usuario. 
   En la pestaña Securables podemos asignarle permisos para los distintos objetos de la base de datos. 
*/

	-- Roles

/*
  Los roles son agrupaciones de privilegios que les son asignados a los usuarios.  Un rol puede asignarse a uno o varios usuarios de la base de datos.
  Dependiendo del rol asignado a un usuario tendrá unos u otros permisos y cualquier otro usuario con su mismo rol tendrá los mismos.
  Existen 3 tipos de roles:
   Server roles: Se encuentran en la carpeta security del directorio raíz. Contiene roles predefinidos que no se pueden modificar.
   Roles: Se encuentran en la carpeta security de nuestra base de datos. Contiene roles predefinidos para nuestra base de datos. no se pueden modificar. 
   Roles de usuario: Se encuentran en la carpeta security/roles de nuestra base de datos y son los roles definidos por el usuario. 
	Aquí podemos crearlos y gestionarlos asignándole un owner (propietario) que puede ser un usuario o incluso otro rol (roles en cascada). 
*/

		-- Crear un Rol y asignarlo desde Transact SQL

			-- En primer lugar crearemos un login desde la interfaz para utilizarlo en el ejemplo. El login se llamará 'marcelo' asignándole la BD CentroMedico
			
			-- Ahora creamos el Rol

CREATE ROLE Pagos AUTHORIZATION dbo					-- Creamos el rol Pagos bajo la autorización de dbo

			-- Ahora asignamos el rol

ALTER ROLE Pagos ADD MEMBER marcelo					-- Asignamos el rol Pagos al usuario marcelo

/* En este punto desde la intrfaz ya podremos editar el rol según nuestras necesidades. */

	-- Esquemas (Schema)

/*
  Es un espacio de nombres que se asigna a los objetos de la BD. Por ejemplo el esquema dbo es un esquema que se crea cuando creamos la base de datos.
  Un usuario que tenga un esquema específico solo podrá visualizar los objetos asignados a su sistema.
  Por ejemplo, podemos utilizar un esquema para aislar ciertas tablas de determinado sector de la empresa (administración puede ver sus tablas, pero no las de contabilidad)
  Un usuario puede tener acceso a más de un esquema. 
*/

		-- Creando un esquema

/*
  Podemos crear un esquema desde la interfaz. En el Object Explorer haremos click derecho en la carpeta Security/Schemas de nuestra base de datos y pulsaremos sobre New Schema.
  En la nueva ventana, en la pestaña General le daremos nombre y propietario.  
*/
		
			-- Colocar objetos en un esquema con transact SQL
				
				-- Una vez ya hemos creado un esquema (p.ej. facturacion) y le hemos asignado un nombre y un propietario. 

ALTER SCHEMA facturacion TRANSFER Pais			-- Así transferiremos la tabla Pais al esquema facturacion pasando a ser facturacion.Pais en lugar de dbo.Pais 

/* Desde este momento el/los usuarios que tengan acceso al esquema facturacion podrán visualizar la tabla Pais */