-- 1. Top 10 productos más vendidos
SELECT p.name, SUM(od.quantity) AS total_vendidos
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_vendidos DESC
LIMIT 10;

-- 2. Ingresos por categoría
SELECT c.name, SUM(od.quantity * p.price) AS ingresos
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.name
ORDER BY ingresos DESC;

-- 3. Clientes que más gastaron
SELECT u.name, SUM(od.quantity * p.price) AS total_gastado
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
JOIN Users u ON o.user_id = u.user_id
GROUP BY u.name
ORDER BY total_gastado DESC
LIMIT 10;

-- 4. Ticket promedio
SELECT ROUND(AVG(total),2) AS ticket_promedio
FROM (
  SELECT o.order_id, SUM(od.quantity * p.price) AS total
  FROM Orders o
  JOIN OrderDetails od ON o.order_id = od.order_id
  JOIN Products p ON od.product_id = p.product_id
  GROUP BY o.order_id
) t;

-- 5. Ventas mensuales
SELECT DATE_TRUNC('month', o.order_date) AS mes, SUM(od.quantity * p.price) AS ingresos
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY mes
ORDER BY mes;

-- 6. Usuarios con más pedidos
SELECT u.name, COUNT(o.order_id) AS num_pedidos
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY num_pedidos DESC
LIMIT 10;

-- 7. Productos mejor valorados
SELECT p.name, ROUND(AVG(r.rating),2) AS promedio_rating, COUNT(r.review_id) AS num_reviews
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.name
HAVING COUNT(r.review_id) >= 5
ORDER BY promedio_rating DESC, num_reviews DESC
LIMIT 10;

-- 8. Categorías con más reseñas
SELECT c.name, COUNT(r.review_id) AS total_reviews
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.name
ORDER BY total_reviews DESC;

-- 9. Clientes que más reseñas dejaron
SELECT u.name, COUNT(r.review_id) AS reseñas
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
GROUP BY u.name
ORDER BY reseñas DESC
LIMIT 10;

-- 10. Pedido más caro
SELECT o.order_id, u.name, SUM(od.quantity * p.price) AS total
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
JOIN Users u ON o.user_id = u.user_id
GROUP BY o.order_id, u.name
ORDER BY total DESC
LIMIT 1;

-- 11. Top 5 categorías más vendidas (por cantidad de productos)
SELECT c.name, SUM(od.quantity) AS total_vendidos
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.name
ORDER BY total_vendidos DESC
LIMIT 5;

-- 12. Promedio de gasto por cliente
SELECT u.name, ROUND(AVG(t.total),2) AS promedio_gasto
FROM (
  SELECT o.user_id, o.order_id, SUM(od.quantity * p.price) AS total
  FROM Orders o
  JOIN OrderDetails od ON o.order_id = od.order_id
  JOIN Products p ON od.product_id = p.product_id
  GROUP BY o.order_id, o.user_id
) t
JOIN Users u ON u.user_id = t.user_id
GROUP BY u.name
ORDER BY promedio_gasto DESC
LIMIT 10;

-- 13. Clientes que nunca dejaron reseñas
SELECT u.user_id, u.name
FROM Users u
LEFT JOIN Reviews r ON u.user_id = r.user_id
WHERE r.review_id IS NULL;

-- 14. Productos que nunca fueron vendidos
SELECT p.product_id, p.name
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

-- 15. Clientes que compraron más de una categoría distinta
SELECT u.name, COUNT(DISTINCT c.category_id) AS categorias_diferentes
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
JOIN Users u ON o.user_id = u.user_id
GROUP BY u.name
HAVING COUNT(DISTINCT c.category_id) > 1
ORDER BY categorias_diferentes DESC;

-- 16. Distribución de ratings
SELECT rating, COUNT(*) AS cantidad
FROM Reviews
GROUP BY rating
ORDER BY rating;

-- 17. Reseña más larga
SELECT r.review_id, u.name, p.name, LENGTH(r.comment) AS longitud_comentario
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
JOIN Products p ON r.product_id = p.product_id
ORDER BY longitud_comentario DESC
LIMIT 1;

-- 18. Ingresos totales por usuario
SELECT u.name, SUM(od.quantity * p.price) AS ingresos_totales
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY u.name
ORDER BY ingresos_totales DESC;

-- 19. Primer y último pedido de cada usuario
SELECT u.name, MIN(o.order_date) AS primer_pedido, MAX(o.order_date) AS ultimo_pedido
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY primer_pedido;

-- 20. Promedio de productos por pedido
SELECT ROUND(AVG(num_productos),2) AS promedio_productos_por_pedido
FROM (
  SELECT o.order_id, SUM(od.quantity) AS num_productos
  FROM Orders o
  JOIN OrderDetails od ON o.order_id = od.order_id
  GROUP BY o.order_id
) t;
