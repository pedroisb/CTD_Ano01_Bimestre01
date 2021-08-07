-- Parte II
-- Produtos
-- 1)
SELECT*FROM productos
ORDER BY PrecioUnitario DESC;

-- 2)
SELECT*FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

-- 3)
SELECT*FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;

-- FaturaDetalhe
-- 1)
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle;

-- 2)
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
ORDER BY Cantidad DESC;

-- 3)
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
WHERE Cantidad BETWEEN 50 AND 100
ORDER BY Cantidad DESC;

-- 4)
SELECT FacturaID, ProductoID, (PrecioUnitario*Cantidad) AS Total FROM facturadetalle;

-- Extras
-- 1)
SELECT*FROM clientes WHERE Pais = 'Brazil' OR
Pais = 'Mexico' OR 
Titulo LIKE 'Sales%';

-- 2)
SELECT*FROM clientes WHERE Compania LIKE 'A%';

-- 3)
SELECT Ciudad, Contacto AS nome_e_sobrenome FROM clientes;

-- 4)
SELECT*FROM facturas WHERE FacturaID BETWEEN 10000 AND 10500;

-- 5)
SELECT*FROM facturas WHERE FacturaID BETWEEN 10000 AND 10500 
OR ClienteID LIKE 'B%';

-- 6)
SELECT*FROM facturas WHERE CiudadEnvio = 'Vancouver' OR
EnvioVia = 3;

-- 7) 5
SELECT EmpleadoID FROM empleados WHERE Apellido = 'Buchanan';

-- 8)
SELECT*FROM facturas WHERE EmpleadoID = 5;