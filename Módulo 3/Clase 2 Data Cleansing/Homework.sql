/*Nombres de campos*/
use henry_m3;
ALTER TABLE `cliente` CHANGE `ID` `IdCliente` INT(11) NOT NULL;
ALTER TABLE `empleado` CHANGE `IDEmpleado` `IdEmpleado` INT(11) NULL DEFAULT NULL;
ALTER TABLE `proveedor` CHANGE `IDProveedor` `IdProveedor` INT(11) NULL DEFAULT NULL;
ALTER TABLE `sucursal` CHANGE `ID` `IdSucursal` INT(11) NULL DEFAULT NULL;
ALTER TABLE `tipo_gasto` CHANGE `Descripcion` `Tipo_Gasto` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL;
ALTER TABLE `producto` CHANGE `IDProducto` `IdProducto` INT(11) NULL DEFAULT NULL;
ALTER TABLE `producto` CHANGE `Concepto` `Producto` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL;

/*Tipos de Datos*/
ALTER TABLE `cliente` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, 
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
UPDATE cliente SET Y = '0' WHERE Y = '';
UPDATE cliente SET X = '0' WHERE X = '';
UPDATE `cliente` SET Latitud = REPLACE(Y,',','.');
UPDATE `cliente` SET Longitud = REPLACE(X,',','.');
-- SELECT * FROM `cliente`;
ALTER TABLE `cliente` DROP `Y`;
ALTER TABLE `cliente` DROP `X`;

ALTER TABLE `empleado` ADD `Salario` DECIMAL(10,2) NOT NULL DEFAULT '0' AFTER `Salario2`;
UPDATE `empleado` SET Salario = Salario2;
ALTER TABLE `empleado` DROP `Salario2`;

ALTER TABLE `producto` ADD `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0' AFTER `Precio2`;
UPDATE `producto` SET Precio = REPLACE(Precio2,',','.');
ALTER TABLE `producto` DROP `Precio2`;

ALTER TABLE `sucursal` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Longitud2`, 
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud2`;
UPDATE `sucursal` SET Latitud = REPLACE(Latitud2,',','.');
UPDATE `sucursal` SET Longitud = REPLACE(Longitud2,',','.');
-- SELECT * FROM `sucursal`;
ALTER TABLE `sucursal` DROP `Latitud2`;
ALTER TABLE `sucursal` DROP `Longitud2`;

UPDATE `venta` set `Precio` = 0 WHERE `Precio` = '';
ALTER TABLE `venta` CHANGE `Precio` `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0';

/*Columnas sin usar*/
ALTER TABLE `cliente` DROP `col10`;

-- SELECT * FROM cliente;

/*Imputar Valores Faltantes*/
UPDATE `cliente` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `cliente` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE `cliente` SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE `cliente` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

UPDATE `empleado` SET Apellido = 'Sin Dato' WHERE TRIM(Apellido) = "" OR ISNULL(Apellido);
UPDATE `empleado` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `empleado` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `empleado` SET Sector = 'Sin Dato' WHERE TRIM(Sector) = "" OR ISNULL(Sector);
UPDATE `empleado` SET Cargo = 'Sin Dato' WHERE TRIM(Cargo) = "" OR ISNULL(Cargo);

UPDATE `producto` SET Producto = 'Sin Dato' WHERE TRIM(Producto) = "" OR ISNULL(Producto);
UPDATE `producto` SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);

UPDATE `proveedor` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `proveedor` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `proveedor` SET Ciudad = 'Sin Dato' WHERE TRIM(Ciudad) = "" OR ISNULL(Ciudad);
UPDATE `proveedor` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `proveedor` SET Pais = 'Sin Dato' WHERE TRIM(Pais) = "" OR ISNULL(Pais);
UPDATE `proveedor` SET Departamento = 'Sin Dato' WHERE TRIM(Departamento) = "" OR ISNULL(Departamento);

UPDATE `sucursal` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `sucursal` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `sucursal` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `sucursal` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);

/*Tabla ventas limpieza y normalizacion*/
/*
select * from venta where Precio = '' or Cantidad = '';
select count(*) from venta;
*/
UPDATE venta v JOIN producto p ON (v.IdProducto = p.IdProducto) 
SET v.Precio = p.Precio
WHERE v.Precio = 0;

/*Tabla auxiliar donde se guardarán registros con problemas:
1-Cantidad en Cero
*/
DROP TABLE IF EXISTS `aux_venta`;
CREATE TABLE IF NOT EXISTS `aux_venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				FLOAT,
  `Cantidad`			INTEGER,
  `Motivo`				INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

UPDATE venta SET Cantidad = REPLACE(Cantidad, '\r', '');

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, 0, 1
FROM venta WHERE Cantidad = '' or Cantidad is null;

UPDATE venta SET Cantidad = '1' WHERE Cantidad = '' or Cantidad is null;
ALTER TABLE `venta` CHANGE `Cantidad` `Cantidad` INTEGER NOT NULL DEFAULT '0';

/*Chequeo de claves duplicadas*/
SELECT IdCliente, COUNT(*) FROM cliente GROUP BY IdCliente HAVING COUNT(*) > 1;
SELECT IdSucursal, COUNT(*) FROM sucursal GROUP BY IdSucursal HAVING COUNT(*) > 1;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;
SELECT IdProveedor, COUNT(*) FROM proveedor GROUP BY IdProveedor HAVING COUNT(*) > 1;
SELECT IdProducto, COUNT(*) FROM producto GROUP BY IdProducto HAVING COUNT(*) > 1;

-- select count(*) from empleado;

SELECT e.*, s.IdSucursal
FROM empleado e JOIN sucursal s
	ON (e.Sucursal = s.Sucursal);
    
select distinct Sucursal from empleado
where Sucursal NOT IN (select Sucursal from sucursal);

/*Generacion de clave única tabla empleado mediante creacion de clave subrogada*/
UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';
-- UPDATE empleado SET Sucursal = 'Córdoba Quiroz' WHERE Sucursal = 'Cordoba Quiroz';

ALTER TABLE `empleado` ADD `IdSucursal` INT NULL DEFAULT '0' AFTER `Sucursal`;

UPDATE empleado e JOIN sucursal s
	ON (e.Sucursal = s.Sucursal)
SET e.IdSucursal = s.IdSucursal;

ALTER TABLE `empleado` DROP `Sucursal`;

ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;

UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;

/*Chequeo de claves duplicadas*/
SELECT * FROM `empleado`;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;

/*Modificacion de la clave foranea de empleado en venta*/
UPDATE venta SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

/*Normalizacion tabla empleado*/
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

INSERT INTO cargo (Cargo) SELECT DISTINCT Cargo FROM empleado ORDER BY 1;
INSERT INTO sector (Sector) SELECT DISTINCT Sector FROM empleado ORDER BY 1;

select * from cargo;
select * from sector;

ALTER TABLE `empleado` 	ADD `IdSector` INT NOT NULL DEFAULT '0' AFTER `IdSucursal`, 
						ADD `IdCargo` INT NOT NULL DEFAULT '0' AFTER `IdSector`;

UPDATE empleado e JOIN cargo c ON (c.Cargo = e.Cargo) SET e.IdCargo = c.IdCargo;
UPDATE empleado e JOIN sector s ON (s.Sector = e.Sector) SET e.IdSector = s.IdSector;

ALTER TABLE `empleado` DROP `Cargo`;
ALTER TABLE `empleado` DROP `Sector`;

SELECT * FROM `empleado`;

/*Normalización tabla producto*/
ALTER TABLE `producto` ADD `IdTipoProducto` INT NOT NULL DEFAULT '0' AFTER `Precio`;

DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `IdTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `TipoProducto` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO tipo_producto (TipoProducto) SELECT DISTINCT Tipo FROM producto ORDER BY 1;

UPDATE producto p JOIN tipo_producto t ON (p.Tipo = t.TipoProducto) SET p.IdTipoProducto = t.IdTipoProducto;

SELECT * FROM `producto`;

ALTER TABLE `producto`
  DROP `Tipo`;