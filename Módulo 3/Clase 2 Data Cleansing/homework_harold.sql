
use henry_m3_1;
select * from cliente;
desc cliente;

-- CAMBIOS A LA TABLA CLIENTE
--    cambio de nombre a columnas
alter table cliente rename column ID to IdCliente;
alter table cliente rename column X to Longitud;
alter table cliente rename column Y to Latitud;

--    eliminación de columnas que no nos sirven

alter table cliente drop column col10;

--    cambio de la columna Longitud
select count(*) from cliente
where Longitud = "";

update cliente
set Longitud = "0"
where Longitud = "";

update cliente
set Longitud = replace(Longitud,",",".");

select Longitud from cliente;

alter table cliente
modify Longitud Decimal(10,8);

select avg(Longitud) from cliente;

--    cambio de la columna Latitud
select count(*) from cliente
where Latitud = "";

update cliente
set Latitud = "0"
where Latitud = "";

update cliente
set Latitud = replace(Latitud,",",".");

select Latitud from cliente;

alter table cliente
modify Latitud Decimal(10,8);

select avg(Latitud) from cliente;

--   valores faltantes de cliente

select count(*) from cliente
where Nombre_y_Apellido = "";

update cliente
set Nombre_y_Apellido = "Sin Dato"
where Nombre_y_Apellido = "";

select count(*) from cliente
where trim(domicilio) = "";

update cliente
set domicilio = "Sin Dato"
where domicilio = "";

select count(*) from cliente
where Localidad = "";

update cliente
set Localidad = "Sin Dato"
where Localidad = "";

select count(*) from cliente
where Provincia = "";

update cliente
set Provincia = "Sin Dato"
where Provincia = "";

-- conteo de repetidos en la tabla cliente

SELECT IdCliente, COUNT(*) 
FROM cliente 
GROUP BY IdCliente 
HAVING COUNT(*) > 1;

-- TABLA COMPRA

select * from compra;
desc compra;

-- conteo de valores repetidos

SELECT IdCompra, COUNT(*) 
FROM compra
GROUP BY IdCompra 
HAVING COUNT(*) > 1;

-- TABLA EMPLEADO
select * from empleado;
desc empleado;
alter table empleado
rename column IDEmpleado to IdEmpleado;

alter table empleado
modify Salario2 Decimal(10,2);

select count(*) from empleado
where Nombre = "";

select count(*) from empleado
where Apellido = "";

select count(*) from empleado
where Sucursal = "";

select count(*) from empleado
where Sector = "";

select count(*) from empleado
where Cargo = "";

-- valores duplicados de empleado (OJO)

select IdEmpleado, count(*) 
from empleado
group by IdEmpleado
having  count(*) > 1;

alter table empleado
add column IdEmpleado_reemplazo Int after IdEmpleado;

select * from empleado as em
join sucursal as su 
on (em.Sucursal=su.Sucursal);

select * from empleado as em
where em.sucursal = 'Mendoza1';

UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';

select * from empleado as em
join sucursal as su 
on (em.Sucursal=su.Sucursal);




alter table empleado
add column IdSucursal Int;

update empleado as em
join sucursal as su 
on (em.Sucursal=su.Sucursal)
set em.IdSucursal = su.Id;

select * from empleado;
select * from sucursal;

update empleado 
set IdEmpleado_reemplazo = IdEmpleado*100 + IdSucursal; 

select IdEmpleado_reemplazo, count(*) 
from empleado
group by IdEmpleado_reemplazo
having  count(*) > 1;

alter table empleado
drop column IdEmpleado;

alter table empleado
rename column IdEmpleado_reemplazo to IdEmpleado;

-- TABLA GASTO

select * from gasto;
desc gasto;

select IdGasto, count(*) from gasto
group by IdGasto
having count(*) > 1;

-- PRODUCTO

select * from producto;
desc producto;

alter table producto
rename column IDProducto to IdProducto;

alter table producto
modify column Precio2 Decimal(20,2);

select IdProducto, Concepto, Precio2 from producto
where Precio2 > 10000;

select * from venta
where IdProducto = 42804;

delete from producto where Precio2 > 10000;

alter table producto
modify column Precio Decimal(10,2);

delete from producto
where Concepto like "Producto%";

select count(*)from Producto
where Concepto = "";

select count(*)from Producto
where Tipo = "";

update producto
set Tipo = "Sin dato"
where Tipo = "";

select * from producto;
-- TABLA PROVEEDOR
select * from proveedor;

alter table proveedor
rename column IDProveedor to IdProveedor;

update proveedor
set Nombre = "Sin Dato"
where Nombre = "";

select * from sucursal;
desc sucursal;

update sucursal
set Latitud2 = replace(Latitud2,",",".");

update sucursal
set Longitud2 = replace(Longitud2,",",".");

alter table sucursal
rename column Latitud2 to Latitud;

alter table sucursal
rename column Longitud2 to Longitud;

alter table sucursal
modify column Longitud Decimal(10,8);

alter table sucursal
modify column Latitud Decimal(10,8);

select * from sucursal;
alter table sucursal
rename column Proviencia to Provincia;

select * from sucursal;

update sucursal
set Provincia = "Buenos Aires"
where Provincia in ("CABA","Capital","Capital Federal","CapFed","Cap. Fed","Cap. Federal","Cdad de Buenos Aires","C deBuenos Aires");
-- where Provincia like "P%";

select * from tipo_gasto;

select * from venta;

create table venta like henry_m3.venta;
insert into venta
select * from henry_m3.venta;

desc venta;




select * from venta
where Precio = "";

select * from venta as ve
join producto as pro on (pro.IdProducto=ve.IdProducto);

update venta as ve
join producto as pro on (pro.IdProducto=ve.IdProducto)
set ve.Precio = pro.Precio
where ve.Precio = "";

alter table venta
modify Precio Decimal(10,2);

select * from venta
where Cantidad = "";

truncate table aux_venta;

DROP TABLE IF EXISTS `aux_venta`;
CREATE TABLE IF NOT EXISTS `aux_venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				varchar(50),
  `Cantidad`			varchar(50),
  `Motivo`				varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


insert into aux_venta(IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
select IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, "No existe Cantidad" from venta
where Cantidad = "";

update venta
set Cantidad = "0"
where Cantidad = "";

alter table venta
modify Cantidad int;

select * from aux_venta;

-- ultimos dos ejercicios

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` integer NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `IdSector` integer NOT NULL AUTO_INCREMENT,
  `Sector` varchar(50) NOT NULL,
  PRIMARY KEY (`IdSector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


SELECT DISTINCT Cargo FROM empleado order by Cargo;

INSERT INTO cargo (Cargo) SELECT DISTINCT Cargo FROM empleado ORDER BY 1;

select * from cargo;

INSERT INTO sector (Sector) SELECT DISTINCT Sector FROM empleado ORDER BY 1;

ALTER TABLE `empleado` 	ADD `IdSector` INT NOT NULL DEFAULT '0' AFTER `IdSucursal`, 
						ADD `IdCargo` INT NOT NULL DEFAULT '0' AFTER `IdSector`;

UPDATE empleado e JOIN cargo c ON (c.Cargo = e.Cargo) SET e.IdCargo = c.IdCargo;
UPDATE empleado e JOIN sector s ON (s.Sector = e.Sector) SET e.IdSector = s.IdSector;

ALTER TABLE `empleado` DROP `Cargo`;
ALTER TABLE `empleado` DROP `Sector`;

DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `IdTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `TipoProducto` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

ALTER TABLE `producto` ADD `IdTipoProducto` INT NOT NULL DEFAULT '0' AFTER `Precio2`;


INSERT INTO tipo_producto (TipoProducto) SELECT DISTINCT Tipo FROM producto ORDER BY Tipo;

UPDATE producto p JOIN tipo_producto t ON (p.Tipo = t.TipoProducto) SET p.IdTipoProducto = t.IdTipoProducto;

SELECT * FROM `producto`;

ALTER TABLE `producto`
  DROP `Tipo`;
