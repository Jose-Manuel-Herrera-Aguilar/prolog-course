% Definición de clientes: cliente(ClienteID, Nombre, Apellido, Email, Telefono, Direccion).
cliente(1, 'Juan', 'Pérez', 'juan.perez@mail.com', '555-1234', 'Calle Falsa 123').
cliente(2, 'Ana', 'Gómez', 'ana.gomez@mail.com', '555-5678', 'Av. Siempreviva 742').
cliente(3, 'Carlos', 'Ramírez', 'carlos.ramirez@mail.com', '555-8765', 'Calle Larga 456').
cliente(4, 'Lucía', 'Mendoza', 'lucia.mendoza@mail.com', '555-4321', 'Plaza Mayor 12').
cliente(5, 'Pedro', 'López', 'pedro.lopez@mail.com', '555-1111', 'Callejón del Gato 7').
cliente(6, 'María', 'Martínez', 'maria.martinez@mail.com', '555-2222', 'Av. de la Paz 15').
cliente(7, 'Roberto', 'Sánchez', 'roberto.sanchez@mail.com', '555-3333', 'Calle de los Álamos 99').
cliente(8, 'Sofía', 'Hernández', 'sofia.hernandez@mail.com', '555-4444', 'Calle Luna 22').
cliente(9, 'Andrés', 'Vega', 'andres.vega@mail.com', '555-5555', 'Calle Sol 8').
cliente(10, 'Elena', 'Ríos', 'elena.rios@mail.com', '555-6666', 'Boulevard Verde 19').

% Definición de celulares: celular(ModeloID, Marca, Modelo, PrecioVenta, StockDisponible).
celular(1, 'Apple', 'iPhone 13', 999.99, 10).
celular(2, 'Samsung', 'Galaxy S21', 799.99, 15).
celular(3, 'Xiaomi', 'Mi 11', 699.99, 8).
celular(4, 'Google', 'Pixel 6', 899.99, 5).
celular(5, 'OnePlus', '9 Pro', 749.99, 7).
celular(6, 'Sony', 'Xperia 5 III', 849.99, 3).
celular(7, 'Huawei', 'P40', 699.99, 12).
celular(8, 'Motorola', 'Edge 20', 649.99, 9).
celular(9, 'Nokia', 'G50', 499.99, 20).
celular(10, 'LG', 'Wing', 999.99, 6).

% Definición de ventas: venta(VentaID, FechaVenta, Cantidad, Total, ClienteID, ModeloID).
venta(1, '2023-10-01', 1, 999.99, 1, 1).
venta(2, '2023-10-05', 2, 1599.98, 2, 2).
venta(3, '2023-10-10', 1, 699.99, 3, 3).
venta(4, '2023-10-12', 1, 899.99, 4, 4).
venta(5, '2023-10-13', 3, 2249.97, 5, 5).
venta(6, '2023-10-15', 1, 849.99, 6, 6).
venta(7, '2023-10-16', 2, 1399.98, 7, 7).
venta(8, '2023-10-17', 1, 649.99, 8, 8).
venta(9, '2023-10-18', 1, 499.99, 9, 9).
venta(10, '2023-10-19', 1, 999.99, 10, 10).

% Definición de reparaciones: reparacion(ReparacionID, FechaReparacion, DescripcionProblema, CostoReparacion, ClienteID, ModeloID).
reparacion(1, '2023-09-15', 'Pantalla rota', 199.99, 1, 1).
reparacion(2, '2023-10-07', 'Batería defectuosa', 99.99, 2, 2).
reparacion(3, '2023-09-20', 'Problema de software', 149.99, 3, 3).
reparacion(4, '2023-09-25', 'Altavoz dañado', 79.99, 4, 4).
reparacion(5, '2023-09-28', 'Cámara no funciona', 129.99, 5, 5).
reparacion(6, '2023-10-01', 'Conector de carga roto', 89.99, 6, 6).
reparacion(7, '2023-10-03', 'Pantalla rota', 199.99, 7, 7).
reparacion(8, '2023-10-06', 'Batería inflada', 99.99, 8, 8).
reparacion(9, '2023-10-08', 'Problema de encendido', 109.99, 9, 9).
reparacion(10, '2023-10-10', 'Sensores dañados', 179.99, 10, 10).

% Definición de técnicos: tecnico(TecnicoID, Nombre, Especialidad, Telefono).
tecnico(1, 'Carlos', 'Pantallas', '555-9876').
tecnico(2, 'Laura', 'Baterías', '555-5432').
tecnico(3, 'Miguel', 'Software', '555-6543').
tecnico(4, 'Sofía', 'Cámaras', '555-7654').
tecnico(5, 'Jorge', 'Conectores', '555-8765').
tecnico(6, 'Ana', 'Altavoces', '555-3210').
tecnico(7, 'Luis', 'Sensores', '555-4321').
tecnico(8, 'María', 'Problemas eléctricos', '555-5432').
tecnico(9, 'Pedro', 'Microchips', '555-6543').
tecnico(10, 'Silvia', 'Pantallas', '555-7654').

% Relación de reparaciones y técnicos: reparacion_tecnico(ReparacionID, TecnicoID).
reparacion_tecnico(1, 1).
reparacion_tecnico(2, 2).
reparacion_tecnico(3, 3).
reparacion_tecnico(4, 6).
reparacion_tecnico(5, 4).
reparacion_tecnico(6, 5).
reparacion_tecnico(7, 1).
reparacion_tecnico(8, 2).
reparacion_tecnico(9, 7).
reparacion_tecnico(10, 7).

% Reglas para consultar datos.

% Regla para obtener las ventas realizadas por un cliente
ventas_cliente(ClienteID, VentaID, FechaVenta, Cantidad, Total, ModeloID) :-
    venta(VentaID, FechaVenta, Cantidad
