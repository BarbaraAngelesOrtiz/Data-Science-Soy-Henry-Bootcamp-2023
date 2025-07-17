USE `checkpoint_m2`;

##¿Cuál es el año con la mayor cantidad de productos vendidos? Responder con número de año. Ejemplo: 2024

SELECT year(Fecha) as Año, count(Cantidad) as Cantidad_Venta
from checkpoint_m2.venta
group by year (fecha)
order by Cantidad_Venta desc;

## 12) ¿Cuál es el canal de venta que tiene la segunda posición en cantidad de ventas en 2020?

select cv.Canal, v.IdCanal, sum(cantidad) as Numero_ventas
from checkpoint_m2.venta v
join checkpoint_m2.canal_venta cv on (cv.IdCanal = v.IdCanal)
where YEAR(Fecha) = '2020' 
group by v.IdCanal
order by Numero_ventas;

## 13) ¿Cuál es el Id del empleado que menor cantidad de productos vendió en el histórico de ventas de la empresa?

select IdEmpleado, sum(Cantidad) as Prod_vendido
from checkpoint_m2.venta
group by IdEmpleado
order by Prod_vendido asc;

## 14) Se define el tiempo de entrega como el tiempo en días transcurrido entre que se realiza la compra y se efectua la entrega. 
## Para analizar mejoras en el servicio, la dirección desea saber: cuál es el año con el promedio más alto de este tiempo de entrega. (Fecha = Fecha de venta; Fecha_Entrega = Fecha de entrega) *

select Year(Fecha) ,avg(timestampdiff(DAY, Fecha, Fecha_Entrega)) as Prom_Entrega
from checkpoint_m2.venta
group by Year(Fecha)
order by Prom_Entrega desc;

## 15) ¿Cuál es el promedio de precio de los productos cuyo concepto comienza con la letra C?

select p.Concepto, sum(v.Precio) as PROM
from checkpoint_m2.venta v
join checkpoint_m2.producto p on (p.IDProducto = v.IdProducto)
where p.Concepto LIKE 'C%'
group by v.IDProducto
order by PROM desc;

## 16) ¿Cuantos productos tienen la palabra " CD " (mayúsculas o minúsculas) en alguna parte de su descripción (Concepto = Descripción del Producto) y su precio es mayor a 500? *

select COUNT(*) 
from checkpoint_m2.producto
where concepto like "%CD%"and precio >500 ;

## 17) ¿Cuál es el id del Producto cuyo nombre es EPSON COPYFAX 2000?

select *
from checkpoint_m2.producto
where Concepto = 'EPSON COPYFAX 2000';

## 18) Cual fue el mes (Fecha = Fecha de Venta) con menor venta (Venta = Precio*Cantidad) de la sucursal 13 para el año 2015 ? *

SELECT month(Fecha), sum(Cantidad * Precio) as Cantidad_Venta
from checkpoint_m2.venta
where YEAR(Fecha) = '2015' and IdSucursal = '13'
group by month(Fecha)
order by Cantidad_Venta asc;