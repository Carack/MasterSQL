-- Creando las relaciones entre las tablas
/*En una BD más controlada utilizaríamos CASCADE para controlar que no queden registros huérfanos*/

	-- 1. Cliente con Pais a traves del IdPais

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_Pais FOREIGN KEY (IdPais) REFERENCES Pais(IdPais);

	-- 2. ConceptoCompra con Compra a través de IdConcepto y Concepto

ALTER TABLE Compra
ADD CONSTRAINT FK_Compra_ConceptoCompra FOREIGN KEY (Concepto) REFERENCES ConceptoCompra (IdConcepto);

	-- 3. HorarioEstado con HoraCaptacion a través de IdEstado y EstadoCaptacion

ALTER TABLE HoraCaptacion
ADD CONSTRAINT FK_HoraCaptacion_HorarioEstado FOREIGN KEY (EstadoCaptacion) REFERENCES HorarioEstado(IdEstado);

	-- 4, 5. Compra con CompraCliente a través de IdCompra, Cliente con CompraCliente a través de IdCliente

ALTER TABLE CompraCliente
ADD CONSTRAINT FK_CompraCliente_Compra FOREIGN KEY (IdCompras) REFERENCES Compra(IdCompras),
    CONSTRAINT FK_CompraCliente_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente);

	-- 6, 7, 8. HoraCapClienteCampania con HoraCaptacion a través de IdHCaptacion, HoraCapClienteCampania con Cliente a través de IdCliente, HoraCapClienteCampania con Campania a través de IdCampania

ALTER TABLE HoraCapClienteCampania
ADD CONSTRAINT FK_HoraCapClienteCampania_HoraCaptacion FOREIGN KEY (idHCaptacion) REFERENCES HoraCaptacion(idHCaptacion),
	CONSTRAINT FK_HoraCapClienteCampania_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente(IdCliente),
	CONSTRAINT FK_HoraCapClienteCampania_Campania FOREIGN KEY (idCampania) REFERENCES Campania(IdCampania);

	-- 9, 10. CampaniaProducto con Producto a través de IdProducto, CampaniaProducto con Campania a través de IdCampania

ALTER TABLE CampaniaProducto
ADD CONSTRAINT FK_CampaniaProducto_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
	CONSTRAINT FK_CampaniaProducto_Campania FOREIGN KEY (IdCampania) REFERENCES Campania(IdCampania);

	-- 11, 12, 13. Record con RecordCliente a través de IdRecord, RecordCliente con Cliente a través de IdCliente, RecordCliente con Campania a través de IdCampania

ALTER TABLE RecordCliente
ADD CONSTRAINT FK_RecordCliente_Record FOREIGN KEY (idRecord) REFERENCES Record(IdRecord),
	CONSTRAINT FK_RecordCliente_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
	CONSTRAINT FK_RecordCliente_Campania FOREIGN KEY (IdCampania) REFERENCES Campania(IdCampania);

	-- EXTRA. No pedida  en el PDF en la sección de relaciones pero presente en la imagen posterior. Además si no quedaría una relación perdida entre los idHCaptacion de las tablas Horacaptacion y CompraCliente

ALTER TABLE CompraCliente
ADD CONSTRAINT FK_CompraCliente_HoraCaptacion FOREIGN KEY (idHCaptacion) REFERENCES HoraCaptacion(idHCaptacion);
