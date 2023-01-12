-- Calcula el número total de productos que hay en la tabla productos.

SELECT count(Nombre) FROM producto;

-- Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT count(Nombre) FROM fabricante;

-- Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

SELECT count(distinct ID) from fabricante;

-- Calcula la media del precio de todos los productos.

SELECT avg(PRECIO) from producto;

-- Calcula el precio más barato de todos los productos.

SELECT min(PRECIO), nombre FROM producto;

-- Calcula el precio más caro de todos los productos.

SELECT max(PRECIO), nombre FROM producto;

-- Calcula la suma de los precios de todos los productos.

SELECT sum(PRECIO) FROM producto;

-- Calcula el número de productos que tiene el fabricante Asus.

SELECT count(fabricante.nombre) AS PRODUCTOS_ASUS
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante)
WHERE fabricante.nombre = 'ASUS';

-- Calcula la media del precio de todos los productos del fabricante Asus.

SELECT avg(producto.precio) AS PRECIO_PROMEDIO_ASUS
FROM producto
JOIN fabricante ON (fabricante.id = producto.id_fabricante)
WHERE fabricante.nombre = 'ASUS';

-- Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT min(producto.precio) AS PRECIO_BAJO_ASUS
FROM producto
JOIN fabricante ON (fabricante.id = producto.id_fabricante)
WHERE fabricante.nombre = 'ASUS';

-- Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT max(producto.precio) AS PRECIO_ALTO_ASUS
FROM producto
JOIN fabricante ON (fabricante.id = producto.id_fabricante)
WHERE fabricante.nombre = 'ASUS';

-- Calcula la suma de todos los productos del fabricante Asus.

SELECT sum(producto.precio) AS PRECIOS_ASUS
FROM producto
JOIN fabricante ON (fabricante.id = producto.id_fabricante)
WHERE fabricante.nombre = 'ASUS';

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT min(producto.precio) AS MINIMO, max(producto.precio) AS MAXIMO, avg(producto.precio) AS MEDIA, count(fabricante.nombre) AS TOTAL
FROM producto
JOIN fabricante ON (producto.id_fabricante = fabricante.id)
WHERE fabricante.nombre = 'CRUCIAL';

-- Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.

SELECT fabricante.nombre AS MARCA, count(producto.nombre) AS TOTAL
FROM fabricante
LEFT JOIN producto ON (fabricante.id = producto.id_fabricante)
group by fabricante.nombre
order by producto.nombre desc;

-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT fabricante.nombre AS MARCA, max(producto.precio) AS MAX, min(producto.precio) AS MIN, avg(producto.precio) AS MEDIA
FROM fabricante
LEFT JOIN producto ON (fabricante.id = producto.id_fabricante)
group by fabricante.nombre;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

SELECT fabricante.nombre AS MARCA, max(producto.precio) AS MAX, min(producto.precio) AS MIN, avg(producto.precio) AS MEDIA, count(producto.nombre) AS CANT_PRODUCTOS
FROM fabricante
LEFT JOIN producto ON (fabricante.id = producto.id_fabricante)
group by fabricante.nombre
having avg(producto.precio) > 200
order by fabricante.nombre asc
;

-- Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT count(PRECIO) FROM producto
where precio >= 180;

-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT fabricante.nombre, count(producto.precio)
FROM fabricante 
JOIN producto ON (fabricante.id = producto.id_fabricante)
where producto.precio >= 180
group by fabricante.nombre
;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

SELECT avg(producto.precio), fabricante.id
FROM producto
JOIN fabricante ON (producto.id_fabricante = fabricante.id)
group by fabricante.id;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT avg(producto.precio), fabricante.nombre
FROM producto
JOIN fabricante ON (producto.id_fabricante = fabricante.id)
group by fabricante.nombre;

-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT avg(producto.precio), fabricante.nombre
FROM producto
JOIN fabricante ON (producto.id_fabricante = fabricante.id)
group by fabricante.nombre
having avg(producto.precio) >= 150;

-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT fabricante.nombre, count(producto.id)
FROM fabricante 
JOIN producto ON (fabricante.id = producto.id_fabricante)
group by fabricante.nombre
having count(producto.id) >= 2
;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

SELECT fabricante.nombre, count(producto.nombre)
from fabricante
join producto on (fabricante.id = producto.id_fabricante)
where producto.precio >= 200
group by fabricante.nombre
order by count(producto.nombre) desc;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT fabricante.nombre, count(case when producto.precio >= 200 THEN fabricante.nombre else null end) AS TOTAL_MAYOR_200
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante)
group by fabricante.nombre;

-- Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

SELECT fabricante.nombre, sum(producto.precio)
FROM FABRICANTE
JOIN PRODUCTO ON (Fabricante.ID = Producto.ID_Fabricante)
GROUP BY FABRICANTE.NOMBRE
HAVING sum(producto.precio) > 1000
ORDER BY sum(producto.precio) asc;

-- Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

SELECT fabricante.nombre AS MARCA, producto.nombre AS PRODUCTO, max(producto.precio) AS PRODUCTO_MAS_CARO
FROM fabricante
JOIN producto ON (fabricante.id = producto.id_fabricante)
group by fabricante.nombre
ORDER BY fabricante.nombre asc;