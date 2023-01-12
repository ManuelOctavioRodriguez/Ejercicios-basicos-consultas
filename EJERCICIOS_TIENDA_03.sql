-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

SELECT fabricante.nombre AS Marca, producto.nombre AS Producto
FROM fabricante
LEFT JOIN producto ON (fabricante.id = producto.id_fabricante);

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT fabricante.nombre AS Marca, producto.nombre AS Producto
FROM fabricante
LEFT JOIN producto ON (fabricante.id = producto.id_fabricante)
WHERE producto.nombre IS NULL;