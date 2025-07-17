use henry_m3;


load data local infile -- CARGA LOS DATOS DESDE UNA PARTE DE SU DIRECTORIO
 "/home/harold/Escritorio/henry/clases/DS-M3/Clase 01/Homework/Sucursales.csv" -- LINK ABSOLUTO DEL CONTENIDO EL CSV, OJO AQUI SOLO ENTRAN CSV, .txt .csv .dat .parquet
into table sucursal -- METO LOS DATOS EN UNA TABLA 
fields terminated by ";" -- como estan los campos terminados
 ENCLOSED by '' -- cómo empieza cada campo  
 ESCAPED by '' -- cómo termina cada campo
LINES TERMINATED BY '\n'  -- como termina cada linea .txt \r\n .dat \r\n .csv \n
ignore 1 lines; -- en qué linea quiero empezar a ingresar los datos

show tables;

select provincia, count(*)from proveedor
group by provincia;

select provincia, count(*)from cliente
group by provincia;
drop table aux_localidad;
create table if not exists aux_localidad(
	Localidad_Original Varchar(80),
    Provincia_Original varchar(80),
    Localidad_Normalizada Varchar(80),
    Provincia_Normalizada Varchar(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

alter table proveedor
rename column Ciudad to Localidad;

insert into aux_localidad (Localidad_Original, Provincia_Original) 
select distinct Localidad, Provincia from proveedor
union
select distinct Localidad, Provincia from cliente
union
select distinct Localidad, Provincia from sucursal;

select Provincia_Original, count(*) from aux_localidad
group by Provincia_Original;
drop table provincia;

create table if not exists provincia (
	Id_Provincia int auto_increment,
    Provincia varchar(20),
    primary key (Id_Provincia) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

select * from provincia;
insert into provincia (Provincia)
select distinct Provincia_Original from aux_localidad;

update aux_localidad
set Provincia_Normalizada = "Buenos Aires"
where Provincia_Original in ("BUENOS AIRES", "Buenos Aires");

update aux_localidad
set Provincia_Normalizada = "Cordoba"
where Provincia_Original in ("CORDOBA","Córdoba", "Cordoba");

update aux_localidad
set Provincia_Normalizada = "Mendoza"
where Provincia_Original in ("Mendoza","mendoza");

update aux_localidad
set Provincia_Normalizada = "Rio Negro"
where Provincia_Original in ("RIO NEGRO","Rio Negro");

update aux_localidad
set Provincia_Normalizada = "Santa Fe"
where Provincia_Original in ("SANTA FE","santa fe", "Santa Fé", "Santa Fe");

update aux_localidad
set Provincia_Normalizada = "Tucuman"
where Provincia_Original in ("TUCUMAN","tucuman", "Tucuman");

update aux_localidad
set Provincia_Normalizada = "Neuquen"
where Provincia_Original in ("Neuquén", "Neuquen");

update aux_localidad
set Provincia_Normalizada = "Sin Dato"
where Provincia_Original in ("Sin Dato");

select * from aux_localidad;

select * from provincia;

alter table aux_localidad
add column IdProvincia int;

select * from aux_localidad as lo
join provincia as pro
on (lo.Provincia_Original=pro.Provincia);

update aux_localidad as lo
join provincia as pro
on (lo.Provincia_Original=pro.Provincia)
set lo.IdProvincia = pro.IdProvincia;

select * from provincia;
select * from aux_localidad;

alter table provincia
rename column Id_Provincia to IdProvincia;

select Localidad_Original from aux_localidad
group by Localidad_Original;
drop table localidad;

create table if not exists localidad(
	IdLocalidad int auto_increment,
    Localidad varchar(80),
    primary key (IdLocalidad)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

insert into localidad (Localidad)
select Localidad_Original from aux_localidad
group by Localidad_Original;

select * from localidad
order by 1;


delete from localidad
where Localidad = "Coroba";

select * from aux_localidad as aux
join localidad as lo
on (aux.Localidad_Original = lo.Localidad);

alter table aux_localidad
add column IdLocalidad int;

update aux_localidad as aux
join localidad as lo
on (aux.Localidad_Original = lo.Localidad)
set aux.IdLocalidad = lo.IdLocalidad;

select * from aux_localidad;

alter table cliente
add column IdLocalidad int,
add column IdProvincia int;

alter table proveedor
add column IdLocalidad int,
add column IdProvincia int;

alter table sucursal
add column IdLocalidad int,
add column IdProvincia int;

select * from aux_localidad;
select * from provincia;

select * from sucursal as su
join aux_localidad as aux
on (aux.Localidad_Original = su.Localidad and aux.Provincia_Original = su.Provincia);

update sucursal as su
join aux_localidad as aux
on (aux.Localidad_Original = su.Localidad and aux.Provincia_Original = su.Provincia)
set su.IdProvincia = aux.IdProvincia;

select * from sucursal;

update sucursal
set IdLocalidad = 7
where Localidad = "Coroba";

select * from cliente as su
join aux_localidad as aux
on (aux.Localidad_Original = su.Localidad and aux.Provincia_Original = su.Provincia);

update cliente as su
join aux_localidad as aux
on (aux.Localidad_Original = su.Localidad and aux.Provincia_Original = su.Provincia)
set su.IdLocalidad = aux.IdLocalidad;

select * from cliente;

select * from proveedor as su
join aux_localidad as aux
on (aux.Localidad_Original = su.Localidad and aux.Provincia_Original = su.Provincia);


update proveedor as su
join aux_localidad as aux
on (aux.Localidad_Original = su.Localidad and aux.Provincia_Original = su.Provincia)
set su.IdProvincia = aux.IdProvincia;

alter table sucursal
drop column Localidad,
drop column Provincia;

alter table cliente
drop column Localidad,
drop column Provincia;

alter table proveedor
drop column Localidad,
drop column Provincia;


show tables;


drop table aux_localidad;




select * from cliente;


alter table cliente
add column rango_etario varchar(40) not null default "-" after edad;

update cliente
set rango_etario = "1_Hasta 30 años"
where edad <= 30;

update cliente
set rango_etario = "2_De 31 a 40 años"
where edad > 30 and edad <= 40;

update cliente
set rango_etario = "3_De 41 a 50 años"
where edad > 40 and edad <= 50;

update cliente
set rango_etario = "4_De 51 a 60 años"
where edad > 50 and edad <= 60;

update cliente
set rango_etario = "5_Desde 60 años"
where edad > 60;

select * from cliente;

select rango_etario, count(*) from cliente
group by rango_etario
order by 2;

select * from empleado;

select avg(precio)-3*stddev(precio) from venta;

select * from venta
where precio > (select avg(precio) + 3*stddev(precio) from venta);

select * from aux_venta;

insert into aux_venta (Idventa,Fecha,Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
select Idventa,Fecha,Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, "Precios extremadamente caros" from venta
where precio > (select avg(precio) + 3*stddev(precio) from venta);





select * from venta
where cantidad < (select avg(cantidad) - 3*stddev(cantidad) from venta);

select (avg(cantidad) + 3*stddev(cantidad) - 1)*100 / 1 from venta;

select sum(Precio*cantidad) as sumaventa from venta
where year(Fecha) = 2020 and month(Fecha) = 1;


select sum(Precio*cantidad) as sumacompra from compra
where year(Fecha) = 2020 and month(Fecha) = 1;


select month(ve.Fecha), sum(ve.Precio*ve.cantidad)*100/(sum(co.Precio*co.cantidad)-1) as kpi_efectividad_economica from venta as ve, compra as co
where year(ve.Fecha) = 2020 and year(co.Fecha) = 2020 and month(co.Fecha) = 1
group by month(ve.Fecha)
order by month(ve.Fecha);

select * from proveedor
where IdProvincia = null;

select * from venta;

alter table venta
add column valor_atipico_precio int not null default 0;

select * from venta;

select avg(Precio) + 3*stddev(Precio) from venta;
update venta
set valor_atipico_precio = 1
where Precio > 747684.9902944895; 

select * from venta
where valor_atipico_precio = 1;


select month(ve.Fecha), sum(ve.Precio*ve.cantidad)*100/(sum(co.Precio*co.cantidad)-1) as kpi_efectividad_economica from venta as ve, compra as co
where valor_atipico_precio = 0 and year(ve.Fecha) = 2020 and year(co.Fecha) = 2020 and month(co.Fecha) = 1
group by month(ve.Fecha)
order by month(ve.Fecha);

select * from venta;

create index sort_IdCanal on venta (IdCanal);

create index sum_indice on venta ((IdCanal / IdEmpleado));

drop index sort_IdCanal on venta;

drop index sum_indice on venta;


select * from venta;





