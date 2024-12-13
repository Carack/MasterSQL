-- Creando las 13 tablas del proyecto

	-- 1. Tabla que contendr� los datos de los clientes

CREATE TABLE Cliente (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Fnacimiento DATE NOT NULL,
    Domicilio VARCHAR(50) NOT NULL,
    idPais CHAR(3) NOT NULL,
    Telefono VARCHAR(12) NULL,
    Email VARCHAR(30) NOT NULL,
    Observaciones VARCHAR(1000) NULL,
    FechaAlta DATETIME NOT NULL
);

	-- 2. Tabla que contendr� el historial de campa�as

CREATE TABLE Record (
    IdRecord INT IDENTITY(1,1) PRIMARY KEY, 
    FechaRecord DATE NOT NULL,             
    Observaciones VARCHAR(1000) NULL       
);

	-- 3. Tabla que contendr� el historial de campa�as por las que ha pasado el cliente. Tabla relacional Cliente-Record-Campa�a

CREATE TABLE RecordCliente (
    idRecord INT NOT NULL,
    IdCliente INT NOT NULL,
    IdCampania INT NOT NULL,
    CONSTRAINT PK_RecordCliente PRIMARY KEY (idRecord, IdCliente, IdCampania)
);

	-- 4. Tabla que contendr� los paises de origen de los clientes

CREATE TABLE Pais (
    IdPais CHAR(3) NOT NULL PRIMARY KEY,
    NombrePais VARCHAR(100) NOT NULL
);

	-- 5. Tabla que contendr� la hora en la que los clientes se registraron en las campa�as

CREATE TABLE HoraCaptacion (
    idHCaptacion INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FechaCaptacion DATE NOT NULL,		-- No tiene mucho sentido que sea DATE cuando deber�a recoger la hora, pero es lo que pide el ejercicio
    EstadoCaptacion SMALLINT NOT NULL,
    Observaciones VARCHAR(1000) NULL
);

	-- 6. Tabla que contendr� la hora en la cual se registraron en las campa�as los clientes. Tabla relacional HoraCaptacion-Cliente-Campa�a

CREATE TABLE HoraCapClienteCampania (
    idHCaptacion INT NOT NULL,
    idCliente INT NOT NULL,
    idCampania INT NOT NULL,
    CONSTRAINT PK_HoraCapClienteCampania PRIMARY KEY (idHCaptacion, idCliente, idCampania)
);

	-- 7. Tabla que contendr� la dimensi�n del horario con la descripci�n de un estado

CREATE TABLE HorarioEstado (
    IdEstado SMALLINT NOT NULL IDENTITY(1,1) PRIMARY KEY,  
    Descripcion VARCHAR(50) NOT NULL
);

	-- 8. Tabla que contendr� los productos asociados a las campa�as

CREATE TABLE Producto (
    IdProducto INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    Producto VARCHAR(100) NOT NULL
);

	-- 9. Tabla que contendr� la compras en dinero que han realizado los clientes

CREATE TABLE Compra (
    IdCompras INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  
    Concepto INT NOT NULL,  
    Fecha DATETIME NOT NULL,  
    Monto MONEY NOT NULL,  
    Observaciones VARCHAR(1000) NULL  
);

	-- 10. Tabla que conectar� a las compras con los clientes y su captaci�n. Tabla relacional Compra-Cliente-HoraCaptacion

CREATE TABLE CompraCliente (
    IdCompras INT NOT NULL,  
    IdCliente INT NOT NULL, 
    idHCaptacion INT NOT NULL,  
    CONSTRAINT PK_CompraCliente PRIMARY KEY (IdCompras, IdCliente, idHCaptacion)
);

	-- 11. Tabla que contendr� la dimensi�n de campa�as que han realizado los clientes

CREATE TABLE Campania (
    IdCampania INT NOT NULL IDENTITY PRIMARY KEY,
    NombreCampa�a VARCHAR(50) NOT NULL
);

	-- 12. Tabla que contendr� las relaciones entre las campa�as y los productos. Tabla relacional Campania-Producto

CREATE TABLE CampaniaProducto (
    IdCampania INT NOT NULL,
    IdProducto INT NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    CONSTRAINT PK_CampaniaProducto PRIMARY KEY (IdCampania, IdProducto)
);

	-- 13. Tabla que contendr� la dimensi�n de conceptos de compra

CREATE TABLE ConceptoCompra (
    IdConcepto INT NOT NULL IDENTITY PRIMARY KEY,
    Concepto VARCHAR(100) NOT NULL
);

