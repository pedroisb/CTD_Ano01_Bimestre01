-- Consultas IV 

-- Parte I 

-- 1)   CORRIGIR - Ainda apresenta problemas - Tente refazer  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
SELECT DISTINCT
	CONCAT(substring_index(clientes.Contacto, " ", 1), ' ', left(substring_index(clientes.Contacto, " ", -1), 1)) AS Contato,
    UPPER(clientes.Titulo) AS Titulo, facturas.FechaFactura 
FROM clientes
INNER JOIN facturas
ON clientes.ClienteID = facturas.ClienteID
HAVING FechaFactura LIKE '1996%';

-- COMO FAZER RETORNAR NOME E INICIAL DO SOBRENOME QUANDO ESTÃO NA MESMA STRING?
-- Galera fez assim: CONCAT(substring_index(clientes.Contacto, " ", 1), ' ', left(substring_index(clientes.Contacto, " ", -1), 1)) AS Nome
-- alternativamente (ANO): year(facturas.FechaFactura) / AND year = 1996

-- SOLUÇÃO YANA:
-- SELECT DISTINCT 
--        CONCAT(LEFT(Contacto, INSTR(Contacto, ' ')+1),'.') as Contacto,
--        UPPER(Titulo) as Titulo
-- FROM Facturas f
-- INNER JOIN Clientes c
-- ON f.ClienteID = c.ClienteID
-- WHERE f.fechaFactura < '1996-12-31';

-- OBS.: não precisa do AS para as tabelas, pode jogar a inicial em seguida

-- OBS.2: SQL dá prioridade a certos comandos sobre outros


-- 2)
SELECT clientes.Pais, clientes.Ciudad, facturas.CiudadEnvio, 
LPAD(facturaID, 8, '0'), 
DATE_FORMAT(facturas.FechaFactura, '%Y-%m-%d')
FROM clientes
INNER JOIN facturas
ON clientes.ClienteID = facturas.ClienteID
HAVING Pais = 'UK' 
AND clientes.Ciudad != facturas.CiudadEnvio;

-- SOLUÇÃO YANA:
-- SELECT RIGHT(CONCAT('00000000',f.FacturaID),8) AS FacturaId,
--       DATE_FORMAT(f.FechaFactura, '%Y-%m-%d') as fechaFactura,
--       c.Ciudad, f.CiudadEnvio
-- FROM Facturas f
-- INNER JOIN Clientes c
-- ON f.ClienteID = c.ClienteID
-- WHERE c.Ciudad <> f.CiudadEnvio AND c.Pais = 'UK';


-- 3)
SELECT DISTINCT categorias.CategoriaNombre, REPLACE(REPLACE(productos.ProductoNombre, 'Mix', 'MIX'), 'Chef', 'CHEF')
FROM categorias
LEFT JOIN productos 
ON categorias.CategoriaID = productos.CategoriaID
ORDER BY categorias.CategoriaNombre, productos.ProductoNombre;

-- SELECT c.CategoriaNombre, 
--        REPLACE(REPLACE(p.ProductoNombre,'Mix','MIX'),'Chef','CHEF')
-- FROM categorias c
-- LEFT JOIN productos p
-- ON c.CategoriaId = p.CategoriaId
-- ORDER BY c.CategoriaNombre, p.ProductoNombre;


-- Parte II

-- 1)
SELECT  -- "cada empresa" -> distinct (não precisou por conta do group by)
	correos.Compania, 
	SUM(COALESCE(facturas.Transporte, 0)) AS Transporte_Total  -- não havia usado o coalesce. necessário para substituir NULL por 0
FROM correos
LEFT JOIN facturas
ON correos.CorreoID = facturas.EnvioVia
GROUP BY Compania;

-- SELECT co.Compania, sum(coalesce(fa.Transporte,0)) as total_transporte
-- FROM correos co
-- LEFT JOIN facturas fa
-- ON co.CorreoId = fa.EnvioVia
-- GROUP BY co.Compania;


-- 2)  -- INFO CONTATO DE CLIENTE QUE NÃO FIZERAM COMPRAS
SELECT
	clientes.Contacto AS Nome,
	clientes.CodigoPostal AS CEP, 
	clientes.Direccion AS Endereço, 
    clientes.Telefono AS Tel, 
    clientes.Fax AS Fax 
FROM clientes
LEFT JOIN facturas
ON clientes.ClienteID = facturas.ClienteID
WHERE facturas.ClienteID is NULL; -- https://stackoverflow.com/questions/9581745/sql-is-null-and-null  porque (is Null) != (= Null)

-- SELECT CONCAT('Sr/a ',Contacto) as contacto,
--        CONCAT(Direccion, '(',CodigoPostal,')') as domicilio,
--        Ciudad, Pais, Telefono
-- FROM clientes c
-- LEFT JOIN facturas f
-- ON c.clienteId = f.ClienteId
-- WHERE f.ClienteId IS NULL;


-- 3)
SELECT
	e.Nombre AS Nome, 
	e.Apellido AS Sobrenome, 
    FORMAT (SUM(fd.Cantidad*fd.PrecioUnitario*(1-fd.Descuento)), 2) AS ValorTotal -- FORMAT é melhor que TRUNCATE nesse caso
    -- OBS.: Descontos estão em porcentagem. Para descontos absolutos SUM(fd.Cantidad*fd.PrecioUnitario - fd.Cantidad*fd.Descuento) ou (SUM(fd.Cantidad*(fd.PrecioUnitario-fd.Descuento))
FROM empleados e
INNER JOIN facturas f ON e.EmpleadoID = f.EmpleadoID
INNER JOIN facturadetalle fd ON f.FacturaID = fd.FacturaID
INNER JOIN productos p ON fd.ProductoID = p.ProductoID
INNER JOIN categorias c ON p.CategoriaID = c.CategoriaID
WHERE c.CategoriaNombre = 'Beverages'
GROUP BY Nome
ORDER BY Nome;


-- SELECT e.EmpleadoID, e.Apellido,
--        FORMAT(SUM(d.PrecioUnitario * d.Cantidad * (1-d.Descuento)),2) as ImporteTotal
-- FROM empleados e
-- LEFT JOIN facturas f ON e.EmpleadoId = f.EmpleadoId
-- LEFT JOIN facturadetalle d ON f.FacturaId = d.FacturaId
-- LEFT JOIN productos p ON d.ProductoId = p.ProductoId
-- LEFT JOIN categorias c ON p.CategoriaId = c.CategoriaId
-- WHERE CategoriaNombre = 'Beverages'
-- GROUP BY e.EmpleadoID
-- ORDER BY e.EmpleadoID;

