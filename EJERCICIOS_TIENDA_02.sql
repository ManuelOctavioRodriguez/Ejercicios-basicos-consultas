-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante);

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante)
ORDER BY fabricante.nombre ASC;

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT producto.id AS ID_PRODUCTO, producto.nombre AS PRODUCTO, fabricante.nombre AS MARCA, fabricante.id AS ID_FABRICANTE
FROM PRODUCTO
JOIN FABRICANTE ON (producto.id_fabricante = fabricante.id);

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT MIN(producto.precio) AS PRECIO, producto.nombre, fabricante.nombre AS MARCA 
FROM PRODUCTO
JOIN FABRICANTE ON (producto.id_fabricante = fabricante.id)
;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT MAX(producto.precio) AS PRECIO, producto.nombre, fabricante.nombre AS MARCA 
FROM PRODUCTO
JOIN FABRICANTE ON (producto.id_fabricante = fabricante.id)
;

-- Devuelve una lista de todos los productos del fabricante Lenovo.

	SELECT producto.nombre, fabricante.nombre
	FROM PRODUCTO
	JOIN FABRICANTE ON (producto.id_fabricante = fabricante.id)
	WHERE fabricante.nombre = 'LENOVO';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

    SELECT producto.nombre, producto.precio, fabricante.nombre
	FROM PRODUCTO
	JOIN FABRICANTE ON (producto.id_fabricante = fabricante.id)
	WHERE fabricante.nombre = 'CRUCIAL'
    AND producto.precio > 200;
   
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

    SELECT fabricante.nombre, producto.nombre
    FROM fabricante
    JOIN producto ON (fabricante.id = producto.id_fabricante)
    WHERE fabricante.nombre in ('ASUS','HEWLETT-PACKARD','SEAGATE');

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
    
    SELECT fabricante.nombre, producto.precio, producto.nombre
    FROM fabricante
    JOIN producto ON (fabricante.id = producto.id_fabricante)
    WHERE fabricante.nombre LIKE '%E';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
    
    SELECT fabricante.nombre, producto.precio, producto.nombre
    FROM fabricante
    JOIN producto ON (fabricante.id = producto.id_fabricante)
    WHERE fabricante.nombre LIKE '%W%';
    
    -- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante)
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT distinct fabricante.id, fabricante.nombre
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante);