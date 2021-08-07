-- PARTE I
-- CATEGORIAS E PRODUTOS
-- 1
SELECT*FROM categorias;

-- 2
SELECT CategoriaNombre, Descripcion FROM categorias;

-- 3
SELECT*FROM productos;
-- pode ser apenas com ProductoNombre

-- 4: não existem produtos descontinuados
SELECT ProductoNombre FROM productos
WHERE Discontinuado = 1;

-- !=0 poderia ser também

-- 5: Teatime Chocolate Biscuits, Sir Rodney's Marmalade, Sir Rodney's Scones, Scottish Longbreads
SELECT ProductoNombre FROM productos
WHERE ProveedorID = 8;

-- 6
SELECT ProductoNombre, PrecioUnitario FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

-- 7 seria só a seleção?
SELECT ProductoNombre FROM productos
WHERE UnidadesStock < NivelReorden;

-- 8: Nord-Ost Matjeshering?
SELECT ProductoNombre FROM productos
WHERE UnidadesStock < NivelReorden
AND UnidadesPedidas = 0;

-- CLIENTES	
-- 1
SELECT Contacto, Compania, Titulo, Pais FROM clientes
ORDER BY pais;

-- 2
SELECT Contacto FROM clientes
WHERE Titulo = 'Owner';

-- 3
SELECT Contacto FROM clientes
WHERE Contacto LIKE 'C%';

-- CONTAS
-- 1
SELECT*FROM facturas
ORDER BY FechaFactura;

-- 2
SELECT*FROM facturas
WHERE PaisEnvio = 'USA'
AND EnvioVia != 3;

-- 3
SELECT*FROM facturas
WHERE ClienteID = 'GOURL';

-- 4
SELECT*FROM facturas
WHERE EmpleadoID = 2 OR
EmpleadoID = 3 OR
EmpleadoID = 5 OR
EmpleadoID = 8 OR
EmpleadoID = 9;

-- outra possibilidade seria: WHERE EmpleadoID IN (2, 3, 5, 8, 9);












