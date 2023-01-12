use tienda;

-- Lista el nombre de todos los productos que hay en la tabla producto.

SELECT NOMBRE FROM PRODUCTO;

-- Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT NOMBRE, PRECIO FROM PRODUCTO;

-- Lista todas las columnas de la tabla producto.

SELECT * FROM PRODUCTO;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT NOMBRE AS NOMBRE_PRODUCTO, PRECIO/194.5 AS EURO, PRECIO/180.7 AS DOLAR FROM PRODUCTO;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT upper(NOMBRE), PRECIO FROM PRODUCTO;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT lower(NOMBRE), PRECIO FROM PRODUCTO;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT NOMBRE, upper(LEFT(NOMBRE, 2)) AS INICIALES FROM PRODUCTO;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. 

SELECT NOMBRE, round(Precio) AS VALOR_REDONDEADO FROM PRODUCTO;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT NOMBRE, truncate(Precio, 0) AS VALOR_TRUNCO FROM PRODUCTO;

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.

SELECT distinct ID_FABRICANTE FROM PRODUCTO;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT NOMBRE FROM PRODUCTO ORDER BY NOMBRE ASC, PRECIO DESC;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT * FROM FABRICANTE LIMIT 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.

SELECT * FROM FABRICANTE LIMIT 3, 2;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC LIMIT 1;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC LIMIT 1;

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.

SELECT NOMBRE, ID_FABRICANTE FROM PRODUCTO WHERE ID_FABRICANTE = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO < 400;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO BETWEEN 60 AND 200;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO > 80 AND PRECIO < 300;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.

SELECT NOMBRE, PRECIO, ID_FABRICANTE FROM PRODUCTO WHERE PRECIO > 200 AND ID_FABRICANTE =  6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT NOMBRE, ID_FABRICANTE FROM PRODUCTO WHERE ID_FABRICANTE IN (1, 3, 5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT NOMBRE, PRECIO*100.0 AS CENTIMOS FROM PRODUCTO;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE 'S%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '%E';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '%W%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '____';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE '%PORTATIL%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE NOMBRE LIKE '%MONITOR%' AND PRECIO < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >= 180 ORDER BY PRECIO DESC, NOMBRE ASC;
