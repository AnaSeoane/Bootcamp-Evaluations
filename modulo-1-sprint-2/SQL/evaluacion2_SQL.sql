/* EJERCICIO 1. Selecciona todos los campos de los productos, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9, 
que tengan stock en el almacén, y al mismo tiempo que sus precios unitarios estén entre 50 y 100. 
Por último, ordena los resultados por código de proveedor de forma ascendente.*/

SELECT * 
FROM `products`
WHERE `supplier_id` IN (1, 3, 7, 8, 9) AND 
		`units_in_stock` > 0 AND 
		`unit_price` BETWEEN 50 AND 100
ORDER BY `supplier_id`;


/* EJERCICIO 2. Devuelve el nombre y apellidos y el id de los empleados con códigos entre el 3 y el 6, 
además que hayan vendido a clientes que tengan códigos que comiencen con las letras de la A hasta la G. Por último, en esta búsqueda queremos 
filtrar solo por aquellos envíos que la fecha de pedido este comprendida entre el 22 y el 31 de Diciembre de cualquier año.*/

	-- Hago right join para poder unir `employees` a `orders`(que es donde he hechas todas las condiciones) 

SELECT `e`.`employee_id` AS `ID_Empleado`, CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS `Nombre_Empleado`, `o`.`customer_id`, `o`.`order_date`
FROM `orders` as `o`
RIGHT JOIN `employees` AS `e`
	ON `o`.`employee_id`= `e`.`employee_id`
WHERE `o`.`employee_id` IN (3, 6) AND
	MONTH(`o`.`order_date`) = 12 AND 
	DAY(`o`.`order_date`) BETWEEN 22 AND 31 AND
	`o`.`customer_id` REGEXP '^[A-G]'
GROUP BY `e`.`employee_id`, `e`.`first_name`, `e`.`last_name`, `o`.`customer_id`, `o`.`order_date`
ORDER BY `e`.`employee_id`, `o`.`customer_id`;

/* EJERCICIO 3. Calcula el precio de venta de cada pedido una vez aplicado el descuento. Muestra el id del la orden, el id del producto, 
el nombre del producto, el precio unitario, la cantidad, el descuento y el precio de venta después de haber aplicado el descuento.*/

SELECT `od`.`order_id` AS `ID_Orden`, 
		`od`.`product_id` AS `ID_Producto`, 
        `p`.`product_name` AS `Nombre_Producto`, 
        `od`.`unit_price` AS `Precio_unitario`, 
        `od`.`quantity` AS `Cantidad`, 
        `od`.`discount` AS `Descuento`, 
        ROUND(SUM((`od`.`unit_price` - `od`.`unit_price`*`od`.`discount`)*`od`.`quantity`),2) AS `Precio_venta`
FROM `order_details` AS `od`
LEFT JOIN `products` AS `p`
	ON `od`.`product_id` = `p`.`product_id`
GROUP BY `od`.`order_id`, `od`.`product_id`, `p`.`product_name`, `od`.`unit_price`, `od`.`quantity`, `od`.`discount`;

/* EJERCICIO 4. Usando una subconsulta, muestra los productos cuyos precios estén por encima del precio medio total de los productos de la BBDD.*/

SELECT * 
FROM `products`
WHERE `unit_price` > (SELECT AVG(`unit_price`) FROM `products`);

/* EJERCICIO 5. ¿Qué productos ha vendido cada empleado y cuál es la cantidad vendida de cada uno de ellos?*/

SELECT `e`.`employee_id` AS `ID_Empleado`, 
		CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS `Nombre_Empleado`,
        `p`.`product_id` AS `ID_Producto`, 
        `p`.`product_name` AS `Nombre_Producto`, 
        SUM(`od`.`quantity`) AS `Cantidad_Producto`
FROM `products` as `p`
INNER JOIN `order_details` AS `od`
	ON `p`.`product_id` = `od`.`product_id`
INNER JOIN `orders` AS `o`
	ON `o`.`order_id` = `od`.`order_id`    
INNER JOIN `employees` AS `e`
	ON `o`.`employee_id` = `e`.`employee_id`
GROUP BY `e`.`employee_id`,  CONCAT(`e`.`first_name`, ' ', `e`.`last_name`), `p`.`product_id`, `p`.`product_name`;

/* EJERCICIO 6. Basándonos en la query anterior, ¿qué empleado es el que vende más productos? Soluciona este ejercicio con una subquery
BONUS ¿Podríais solucionar este mismo ejercicio con una CTE?*/

-- OPCIÓN 1. SUBQUERY
SELECT `employee_id` AS `ID_Empleado`, 
		CONCAT(`first_name`, ' ',`last_name`) AS `Nombre_Empleado`
FROM `employees`
WHERE `employee_id` =  (SELECT `o`.`employee_id` FROM `order_details` AS `od`
							INNER JOIN `orders` AS `o` ON `o`.`order_id` = `od`.`order_id`
							GROUP BY `o`.`employee_id`
							ORDER BY SUM(`od`.`quantity`) DESC
							LIMIT 1);
    
-- OPCIÓN 2. CTE
WITH `max_ventas` AS (SELECT `o`.`employee_id` FROM `order_details` AS `od`
							INNER JOIN `orders` AS `o` ON `o`.`order_id` = `od`.`order_id`
							GROUP BY `o`.`employee_id`
							ORDER BY SUM(`od`.`quantity`) DESC
							LIMIT 1)
SELECT `e`.`employee_id` AS `ID_Empleado`, 
		CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS `Nombre_Empleado`
FROM `employees` AS `e`
INNER JOIN `max_ventas` AS `m`
ON `m`.`employee_id` = `e`.`employee_id`
WHERE `e`.`employee_id` = `m`.`employee_id`;