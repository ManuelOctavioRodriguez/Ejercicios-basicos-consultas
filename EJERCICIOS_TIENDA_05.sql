-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * FROM producto WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre='Lenovo');

-- Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * FROM producto where precio = (SELECT max(precio) FROM producto WHERE id_fabricante = (SELECT id FROM fabricante WHERE NOMBRE = 'LENOVO'));

-- Lista el nombre del producto más caro del fabricante Lenovo.

SELECT nombre, max(Precio) as precio_mas_alto FROM producto WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Lenovo');

-- Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT NOMBRE, min(PRECIO) AS Precio_mas_bajo FROM producto WHERE id_fabricante = (select ID from fabricante where nombre = 'Hewlett-Packard');

-- Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >= (SELECT max(PRECIO) FROM producto WHERE id_fabricante = (SELECT id FROM fabricante WHERE NOMBRE = 'LENOVO'));

-- Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO > (SELECT avg(PRECIO) FROM PRODUCTO WHERE ID_FABRICANTE = (SELECT ID FROM fabricante WHERE NOMBRE = 'ASUS'))
GROUP BY NOMBRE;

-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >= ALL(SELECT PRECIO FROM PRODUCTO);

-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO <= ALL(SELECT PRECIO FROM PRODUCTO);

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

SELECT NOMBRE FROM fabricante WHERE ID = ANY(SELECT ID_FABRICANTE FROM PRODUCTO);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).

SELECT NOMBRE FROM fabricante WHERE ID <> ALL(SELECT ID_FABRICANTE FROM PRODUCTO);

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

SELECT NOMBRE FROM fabricante WHERE ID IN (SELECT ID_FABRICANTE FROM PRODUCTO);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

SELECT NOMBRE FROM fabricante WHERE ID NOT IN (SELECT ID_FABRICANTE FROM PRODUCTO);

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT NOMBRE FROM fabricante WHERE EXISTS (SELECT ID_FABRICANTE FROM PRODUCTO);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT NOMBRE FROM fabricante WHERE NOT EXISTS (SELECT ID_FABRICANTE FROM PRODUCTO WHERE producto.id_fabricante = fabricante.ID);

-- Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT fabricante.nombre AS MARCA, producto.nombre AS PRODUCTO, max(producto.precio) AS PRODUCTO_MAS_CARO
FROM fabricante
JOIN producto on (fabricante.id = producto.id_fabricante)
group by fabricante.nombre;

-- Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT nombre, precio from producto where precio >= (select avg(precio) from producto where id_fabricante = (select id from fabricante where id_fabricante=id));

-- Lista el nombre del producto más caro del fabricante Lenovo.

SELECT nombre, max(precio) from producto where id_fabricante = (select id from fabricante where nombre = 'LENOVO');

-- Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

SELECT fabricante.nombre, count(producto.id_fabricante)
from fabricante
join producto ON
(fabricante.id = producto.id_fabricante)
group by fabricante.nombre
having count(producto.id_fabricante) >=2;