-- Creando las relaciones entre las tablas
/*En una BD m�s controlada utilizar�amos CASCADE para controlar que no queden registros hu�rfanos*/

	-- 1. Cliente con Pais a traves del IdPais

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_Pais FOREIGN KEY (IdPais) REFERENCES Pais(IdPais);

	-- 2. ConceptoCompra con Compra a trav�s de IdConcepto y Concepto

ALTER TABLE Compra
ADD CONSTRAINT FK_Compra_ConceptoCompra FOREIGN KEY (Concepto) REFERENCES ConceptoCompra (IdConcepto);

	-- 3. HorarioEstado con HoraCaptacion a trav�s de IdEstado y EstadoCaptacion

ALTER TABLE HoraCaptacion
ADD CONSTRAINT FK_HoraCaptacion_HorarioEstado FOREIGN KEY (EstadoCaptacion) REFERENCES HorarioEstado(IdEstado);

	-- 4, 5. Compra con CompraCliente a trav�s de IdCompra, Cliente con CompraCliente a trav�s de IdCliente

ALTER TABLE CompraCliente
ADD CONSTRAINT FK_CompraCliente_Compra FOREIGN KEY (IdCompras) REFERENCES Compra(IdCompras),
    CONSTRAINT FK_CompraCliente_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente);

	-- 6, 7, 8. HoraCapClienteCampania con HoraCaptacion a trav�s de IdHCaptacion, HoraCapClienteCampania con Cliente a trav�s de IdCliente, HoraCapClienteCampania con Campania a trav�s de IdCampania

ALTER TABLE HoraCapClienteCampania
ADD CONSTRAINT FK_HoraCapClienteCampania_HoraCaptacion FOREIGN KEY (idHCaptacion) REFERENCES HoraCaptacion(idHCaptacion),
	CONSTRAINT FK_HoraCapClienteCampania_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente(IdCliente),
	CONSTRAINT FK_HoraCapClienteCampania_Campania FOREIGN KEY (idCampania) REFERENCES Campania(IdCampania);

	-- 9, 10. CampaniaProducto con Producto a trav�s de IdProducto, CampaniaProducto con Campania a trav�s de IdCampania

ALTER TABLE CampaniaProducto
ADD CONSTRAINT FK_CampaniaProducto_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
	CONSTRAINT FK_CampaniaProducto_Campania FOREIGN KEY (IdCampania) REFERENCES Campania(IdCampania);

	-- 11, 12, 13. Record con RecordCliente a trav�s de IdRecord, RecordCliente con Cliente a trav�s de IdCliente, RecordCliente con Campania a trav�s de IdCampania

ALTER TABLE RecordCliente
ADD CONSTRAINT FK_RecordCliente_Record FOREIGN KEY (idRecord) REFERENCES Record(IdRecord),
	CONSTRAINT FK_RecordCliente_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
	CONSTRAINT FK_RecordCliente_Campania FOREIGN KEY (IdCampania) REFERENCES Campania(IdCampania);

	-- EXTRA. No pedida  en el PDF en la secci�n de relaciones pero presente en la imagen posterior. Adem�s si no quedar�a una relaci�n perdida entre los idHCaptacion de las tablas Horacaptacion y CompraCliente

ALTER TABLE CompraCliente
ADD CONSTRAINT FK_CompraCliente_HoraCaptacion FOREIGN KEY (idHCaptacion) REFERENCES HoraCaptacion(idHCaptacion);
