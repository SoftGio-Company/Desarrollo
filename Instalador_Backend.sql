--Usuario
alter table ad_usuario modify us_fecha datetime null 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
--Creación de Tabla ad_usuario
create table ad_usuario (
us_codigo     int not null,
us_nombre     varchar(32) not null,
us_login      varchar(20) not null,
us_password   varchar(20) not null,
us_fecha      datetime null,
us_estado     char(1) null
)
select * from ad_usuario
truncate table ad_usuario
Select * from ad_usuario where us_login ='gcueva' and us_password='gcueva'
insert into ad_usuario(us_codigo,us_nombre,us_login,us_password,us_fecha,us_estado) values (9,'Marcia Esponiza','mespinoza','mespinoza',NOW(),'V')
--Creacion de Tabla ad_oficina
create table ad_oficina (
of_codigo         int not null,
of_descripcion    varchar(64) not null,
of_fecha          datetime null,
of_estado         char(1) null
)
select * from ad_oficina
truncate table  ad_oficina
insert into ad_oficina values (1,'Oficina 1 Principal',NOW(),'V')
insert into ad_oficina values (2,'Oficina 2 Secundaria',NOW(),'V')

--Creación de Tabla ad_rol
create table ad_rol (
ro_codigo        int not null,
ro_descripcion   varchar(32) not null,
ro_fecha         datetime null,
ro_estado        char(1) null
)
select * from ad_rol
insert into ad_rol values(1,'ADMINISTRADOR',NOW(),'V')
insert into ad_rol values(2,'CAJERO',NOW(),'V')
--Creación de Tabla ad_usuario_rol
create table ad_usuario_rol (
ur_oficina       int not null,
ur_usuario       int not null,
ur_rol           int not null,
ur_caja          int not null,
ur_fecha         datetime null,
ur_estado        char(1) null
)
drop  table ad_usuario_rol
select * from ad_usuario_rol
select ur_oficina,us_nombre,ro_descripcion,ur_fecha,ur_estado from ad_usuario_rol ur,ad_usuario u , ad_rol r
where ur.ur_usuario = u.us_codigo
and ur.ur_rol = r.ro_codigo

select ur_oficina,ur_usuario,us_nombre,ur_rol,ro_descripcion,ur_fecha,ur_estado from ad_usuario_rol ur,ad_usuario u , ad_rol r
where ur.ur_usuario = u.us_codigo
and ur.ur_rol = r.ro_codigo

select * from ad_rol
insert into ad_usuario_rol values(1,12,1,0,NOW(),'V')
insert into ad_usuario_rol values(1,12,2,1,NOW(),'V')
insert into ad_usuario_rol values(1,12,2,2,NOW(),'V')
insert into ad_usuario_rol values(1,13,2,1,NOW(),'V')
Select * from ad_usuario_rol where ur_usuario=12 and ur_oficina =1 and ur_rol=2
Select * from ad_usuario_rol where ur_usuario=12 and ur_oficina =1 and ur_rol=1 and ur_caja=0

--Creacion de Tabla ad_transaccion
drop table ad_transaccion
create table ad_transaccion (
tr_codigo         int not null,
tr_descripcion    varchar(64) not null,
tr_tipo           char(1) null,
tr_fecha          datetime null,
tr_estado         char(1) null
)
select * from ad_transaccion
insert into ad_transaccion values (100,'Ingreso de Caja','C',NOW(),'V')
insert into ad_transaccion values (200,'Egreso de Caja','D',NOW(),'V')
--Creacion de Tabla ad_causa
create table ad_causa (
ca_codigo         int not null,
ca_descripcion    varchar(64) not null,
ca_fecha          datetime null,
ca_estado         char(1) null
)
select * from ad_causa
insert into ad_causa values (1,'Ventas',NOW(),'V')
insert into ad_causa values (2,'Pagos',NOW(),'V')
insert into ad_causa values (3,'Cobros',NOW(),'V')
insert into ad_causa values (4,'Abonos',NOW(),'V')
insert into ad_causa values (5,'Retenciones',NOW(),'V')

--Creacion de Tabla ad_tr_autorizada
create table ad_tr_autorizada (
ta_transaccion    int not null,
ta_rol            int not null,
ta_fecha          datetime null,
ta_estado         char(1) null
)
insert into ad_tr_autorizada values(100,2,NOW(),'V')
insert into ad_tr_autorizada values(200,2,NOW(),'V')
--Creacion de Tabla cl_cliente
drop table cl_cliente
create table cl_cliente (
cl_codigo         int not null,
cl_identificacion varchar(15) not null,
cl_nombre         varchar(32) null,
cl_apellido       varchar(20) null,
cl_direccion      varchar(64) null,
cl_telefono       varchar(10) null,
cl_email          varchar(64) null,
cl_fecha          datetime null,
cl_estado         char(1) null
)

select concat_ws(' ',cl_nombre,cl_apellido) from cl_cliente
select * from cl_cliente
insert into  cl_cliente values (1,'999999999','Consumidor Final','','','','frigocarito@gmail.com',NOW(),'V')
insert into  cl_cliente values (1,'1720693215','Giovanny Patricio','Cueva Valencia','Puembo Calle 24 de Mayo y Liena Ferrea','0984523918',NOW(),'V')
insert into cl_cliente(cl_codigo,cl_identificacion,cl_nombre,cl_apellido,cl_direccion,cl_telefono,cl_email,cl_fecha,cl_estado) values ('4','0701210312','César','Cueva','San Carlos y Nuñes de Línea Ferrea','2390477','cesartadeo.cueva@gmail.com',NOW(),'V')
update cl_cliente set cl_identificacion ='0701210312', cl_nombre='Cesar Tadeo Cueva',cl_apellido='Cueva Paladines',cl_direccion='San Carlos El Triunfo Calle 26 de Agosto Oe14-50',cl_telefono='0992774162',us_estado='V' where cl_codigo =2
Select cl_nombre,cl_apellido,cl_direccion,cl_telefono,cl_email from cl_cliente where cl_identificacion ='1720693216'
Select cl_nombre,cl_apellido,cl_direccion,cl_telefono,cl_email from cl_cliente where cl_identificacion =1720693216
select  * from cl_cliente order by cl_codigo asc limit 20
--Creación de Tabla ad_usuario

create table cl_proveedor (
pr_codigo     int not null,
pr_identificacion varchar(15) not null,
pr_nombre     varchar(32) not null,
pr_direccion  varchar(64) not null,
pr_telefono   varchar(20) not null,
pr_email      varchar(32) not null,
pr_fecha      datetime null,
pr_estado     char(1) null
)
select * from cl_proveedor
Select * from ad_usuario where us_login ='gcueva' and us_password='gcueva'
insert into ad_usuario(us_codigo,us_nombre,us_login,us_password,us_fecha,us_estado) values (9,'Marcia Esponiza','mespinoza','mespinoza',NOW(),'V')

--Creacion de Tabla cl_producto
create table cl_producto (
pr_codigo         int not null,
pr_producto       varchar(15) not null,
pr_descripcion    varchar(32) null,
pr_precio         decimal(8,2)  null,
pr_cantidad       decimal(8,2) not null,
pr_fecha          datetime null,
pr_estado         char(1) null
)
alter table cl_producto modify pr_cantidad  decimal(8,2) not null,
select * from cl_producto
insert into  cl_producto values (1,'Pollo','Mr Pollo',1.25,500,NOW(),'V')
insert into  cl_producto values (2,'Embutidos','Mr Chancho',1.30,500,NOW(),'V')
select pr_codigo,pr_producto,pr_descripcion,pr_precio,pr_cantidad from cl_producto where pr_producto =P001
select * from cl_producto where pr_producto='P001'
--Creacion de Tabla tr_transaccion_monetaria
drop table tr_transaccion_monetaria
create table tr_transaccion_monetaria (
tm_secuencial     int not null,
tm_fecha          datetime null,
tm_transaccion    int not null,
tm_causa          int null,
tm_oficina        int not null,
tm_usuario        int not null,
tm_caja           int not null,
tm_valor          decimal(8,2)  null,
tm_cheque         decimal(8,2)  null,
tm_numero_cheque  int           null,
tm_descripcion    varchar(32)   null,     
tm_estado         char(1) null,
tm_tipo_pago      char(1) null
)
alter table tr_transaccion_monetaria add tm_tipo_pago      char(1) null
create table cl_producto_his (
ph_codigo         int not null,
ph_fecha          datetime null,
ph_cod_producto   int not null,
ph_precio         decimal(8,2)  null,
ph_cantidad_ini   decimal(8,2) not null,
ph_cantidad_ing   decimal(8,2) not null,
ph_cantidad_egr   decimal(8,2) not null
)
alter table cl_producto_his modify ph_fecha date not null
Select * from   cl_producto_his
truncate table cl_producto_his
Select * from  cl_producto_his where ph_fecha = current_date()  order by ph_codigo asc
insert into cl_producto_his(ph_codigo,ph_fecha,ph_cod_producto,ph_precio,ph_cantidad_ini,ph_cantidad_ing,ph_cantidad_egr) values ('1',NOW(),'1','1.24','70.0','5.0','5.0')
  where ph_fecha = current_date() and ph_cod_producto =1
select * from tr_transaccion_monetaria where  tm_fecha >= CURRENT_DATE()
select * from tr_transaccion_monetaria where tm_fecha >= CURRENT_DATE()
truncate table tr_transaccion_monetaria
insert into tr_transaccion_monetaria values (1000,NOW(),100,1,'gcueva',1500.00,null,null,'Ingreso de Caja Inicial','V')
insert into tr_transaccion_monetaria values (1001,NOW(),100,2,'gcueva',null,1000.00,5634,'Recibo de Cheque','V')
SELECT NOW()
select * from tr_transaccion_monetaria where tm_transaccion =100 and MONTH(tm_fecha) = MONTH(CURRENT_DATE())
AND YEAR(tm_fecha) = YEAR(CURRENT_DATE())
select  tm_oficina,tm_fecha, tm_caja,(select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 100 ) as 'tm_ingresos', (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 200 ) as 'tm_egresos',
(select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 100 ) - (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 200 ) as 'tm_total'
 from tr_transaccion_monetaria a where tm_transaccion =100 and MONTH(tm_fecha) = MONTH(CURRENT_DATE())
AND YEAR(tm_fecha) = YEAR(CURRENT_DATE()) group by tm_fecha,tm_caja

SELECT   tm_oficina,DATE(tm_fecha) as 'tm_fecha',tm_caja, 
         IFNULL((select sum(tm_valor) from  tr_transaccion_monetaria where tm_transaccion = 100 and DATE(tm_fecha) = DATE(a.tm_fecha)),0) as 'tm_ingresos', 
		 IFNULL((select sum(tm_valor) from  tr_transaccion_monetaria where tm_transaccion = 200 and DATE(tm_fecha) = DATE(a.tm_fecha)),0) as 'tm_egresos',
         IFNULL((select sum(tm_valor) from  tr_transaccion_monetaria where tm_transaccion = 100 and DATE(tm_fecha) = DATE(a.tm_fecha)),0) - IFNULL((select sum(tm_valor) from  tr_transaccion_monetaria where tm_transaccion = 200 and DATE(tm_fecha) = DATE(a.tm_fecha)),0) as 'tm_total'
FROM      tr_transaccion_monetaria a
where  MONTH(tm_fecha) = MONTH(CURRENT_DATE())
AND YEAR(tm_fecha) = YEAR(CURRENT_DATE())
GROUP BY  tm_oficina,DATE(tm_fecha),tm_caja

select sum(tm_valor),tm_transaccion from tr_transaccion_monetaria where tm_fecha >= CURRENT_DATE()
group by tm_transaccion

select tm_transaccion,
case when tm_transaccion = 100 then sum(tm_valor)
     when tm_transaccion = 200 then sum(tm_valor) 
     else 0 
end from tr_transaccion_monetaria where tm_fecha >= CURRENT_DATE()
group by tm_transaccion
select * from  tr_transaccion_monetaria
insert into tr_transaccion_monetaria(tm_secuencial,tm_fecha,tm_transaccion,tm_causa,tm_oficina,tm_usuario,tm_caja,tm_valor,tm_cheque,tm_numero_cheque,tm_descripcion,tm_estado) values ('213',NOW(),'200','2','1','12','1','780.0','0.0','0','Pag o Fernando','null')

select  tm_oficina,tm_fecha,(select us_nombre from ad_usuario where us_codigo = a.tm_usuario),
       tm_caja,
       (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 100 and  tm_fecha= a.tm_fecha) as 'tm_ingresos', 
       (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 200 and  tm_fecha= a.tm_fecha) as 'tm_egresos', 
        (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 100 and  tm_fecha= a.tm_fecha) - (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 200 and tm_fecha= a.tm_fecha) as 'tm_total'
 from tr_transaccion_monetaria a where Date(a.tm_fecha) BETWEEN '2022-09-08' AND '2022-09-11'
group by a.tm_fecha,a.tm_caja

select tm_transaccion,
(select  sum(tm_valor) from tr_transaccion_monetaria where tm_fecha >= CURRENT_DATE() and tm_transaccion = 100 and tr_caja = a.tr_caja)
 from tr_transaccion_monetaria a where tm_fecha >= CURRENT_DATE()
group by tm_transaccion

select  tm_oficina,CURRENT_DATE(),tm_usuario,(select ca_nombre from ad_caja where ca_codigo = a.tm_caja),(select tr_descripcion from ad_transaccion where tr_codigo = a.tm_transaccion),
       sum(tm_valor)       
 from tr_transaccion_monetaria a where tm_fecha >= CURRENT_DATE()
group by tm_transaccion,tm_caja

select CURRENT_DATE()

select  tm_oficina,CURRENT_DATE() as 'tm_fecha',(select us_nombre from ad_usuario where us_codigo = a.tm_usuario),
       (select ca_nombre from ad_caja where ca_codigo = a.tm_caja) as 'tm_caja',
       (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 100 and tm_fecha >= CURRENT_DATE()) as 'tm_ingresos', 
       (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 200 and tm_fecha >= CURRENT_DATE()) as 'tm_egresos', 
        (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 100 and tm_fecha >= CURRENT_DATE()) - (select sum(tm_valor) from  tr_transaccion_monetaria where tm_caja = a.tm_caja and  tm_transaccion = 200 and tm_fecha >= CURRENT_DATE()) as 'tm_total'
 from tr_transaccion_monetaria a where tm_fecha >= CURRENT_DATE()
group by tm_caja

select tr_descripcion from ad_transaccion where tr_codigo = 100

select ca_nombre from ad_caja where ca_codigo = 1

--Creacion de Tabla tr_factura
drop table tr_factura
create table tr_factura (
fa_transaccion     int not null,
fa_codigo         int not null,
fa_fecha          date null,
fa_cliente        int not null,
fa_caja           int not null,
fa_usuario        varchar(32) not null,
fa_subtotal       decimal(8,2)  null,
fa_iva            decimal(8,2)  null,
fa_total          decimal(8,2)  null,     
fa_estado         char(1) null,
fa_fecha_pago     datetime null,
fa_tipo_pago      char(1) null
)
select * from tr_factura
update  tr_factura set fa_estado = 'C', fa_fecha_pago = NOW() where fa_codigo =3 and fa_estado = 'P'
truncate table tr_factura
alter table tr_factura add fc_usuario        varchar(32) not null
alter table tr_factura add fc_fecha_pago     datetime null
alter table tr_factura add fa_tipo_pago      char(1) null
select * from tr_factura where fc_cliente = (select cl_codigo from cl_cliente where cl_identificacion = '1720693215') (fc_fecha BETWEEN '12/01/2020' AND '01/04/2021') and fc_codigo >= 0   limit 10
select fa_codigo,fa_fecha,(select concat_ws(' ',cl_nombre,cl_apellido) from cl_cliente where cl_codigo = a.fa_cliente ),fa_estado,fa_subtotal,fa_iva,fa_total from tr_factura a where fa_codigo >= 0 limit 10
--Creacion de Tabla tr_detalle_factura
create table tr_detalle_factura (
df_codigo         int not null,
df_secuencial     int not null,
df_producto       int not null,
df_cantidad       decimal(8,2) not null,
df_valor          decimal(8,2) not null,     
df_estado         char(1) null
)
select df_secuencial,pr_producto,pr_descripcion,df_cantidad,df_valor from tr_detalle_factura,cl_producto 
where df_producto = pr_codigo
and df_codigo = 110
alter table tr_detalle_factura modify df_cantidad     decimal(8,2)  null,
truncate table tr_detalle_factura
select * from tr_factura
select * from tr_detalle_factura where df_codigo = 19
Select cl_codigo,cl_identificacion,cl_nombre,cl_apellido,cl_direccion,cl_telefono,cl_email from cl_cliente where cl_identificacion =9999999999
Select max(tm_secuencial) from tr_transaccion_monetaria
--Creación de Tabla ad_caja
create table ad_caja (
ca_codigo     int not null,
ca_nombre     varchar(32) not null,
ca_oficina    int not null,
ca_fecha      datetime null,
ca_estado     char(1) null
)
select * from ad_caja
insert into ad_caja values (1,'CAJA 1',1,NOW(),"A")
insert into ad_caja values (2,'CAJA 2',1,NOW(),"A")
delete  ca_caja where ca_codigo = 6
select * from ad_caja where ca_codigo in (select ur_caja from ad_usuario_rol where ur_oficina = 1 and ur_usuario = 13 and ur_rol = 2)

--Creación de Tabla ad_caja
drop table tr_apertura_caja
create table tr_apertura_caja (
ac_codigo     int not null,
ac_fecha      date not null,
ac_oficina    int not null,
ac_usuario    int not null,
ac_caja       int not null,
ac_hora_inicio  time not null,
ac_hora_fin     time null,
ac_valor_apertura   decimal(8,2)  null,  
ac_saldo_caja       decimal(8,2)  null, 
ac_valor_cierre     decimal(8,2)  null,  
ac_estado     char(1) null
)
select * from tr_apertura_caja
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM tr_apertura_caja WHERE ac_fecha > DATE_SUB(NOW(), INTERVAL 1 DAY);
select * from tr_apertura_caja where ac_oficina =1 and ac_caja=1 and ac_estado = 'A' and ac_fecha = current_date()
truncate table tr_apertura_caja

update tr_apertura_caja set ac_estado = 'C' where  ac_codigo >= 7 and ac_estado = 'A'

update tr_apertura_caja set ac_estado ='C' where ac_codigo =2
delete tr_apertura_caja where ac_usuario = 18
Select max(tm_secuencial) from tr_transaccion_monetaria
select * from tr_apertura_caja where ac_oficina =1 and ac_usuario=12 and ac_rol=2 and ac_caja=2
truncate table tr_apertura_caja
insert into tr_apertura_caja values (1,NOW(),1,12,2,2,CURRENT_TIME(),CURRENT_TIME(),2.00,1.00,'A')

select * from cl_cliente where cl_codigo =2

--Historial Clinico
drop table cl_medico
create table cl_medico (
me_codigo         int not null,
me_identificacion varchar(15) not null,
me_nombre         varchar(32) null,
me_apellido       varchar(20) null,
me_direccion      varchar(64) null,
me_telefono       varchar(10) null,
me_email          varchar(64) null,
me_fecha          datetime null,
me_estado         char(1) null
)
select * from cl_medico
insert into cl_medico values (1,'1756123625','Aracely','Coyago','Churoloma','2390407','ara@gmaul.com',NOW(),'V')
insert into cl_medico values (3,'0701452638','Eduardo','Sanchez','Churoloma','2390407','edu@gmaul.com',NOW(),'V')

--Creación de Tabla ad_caja
drop table cl_historial
create table cl_historial (
hi_codigo     int not null,
hi_fecha      date not null,
hi_oficina    int not null,
hi_usuario    int not null,
hi_cliente    int not null,
hi_medico     int not null,
hi_hora       time not null,
hi_tipo       char(1) null,  
hi_descripcion char(250) null
)
select * from cl_historial

--Cl_tabla
drop table cl_tabla
create table cl_tabla (
ta_codigo      int not null,
ta_nombre      varchar(20) null,
ta_descripcion varchar(64) null,
ta_fecha       datetime null,
ta_estado      char(1) null
)
select * from cl_tabla
insert into cl_tabla values (1,'cl_tipo_consulta','Tipos de Consulta',NOW(),'V')
insert into cl_tabla values (2,'tr_estado_factura','Estado de Factura',NOW(),'V')
--Cl_Catalogo
drop table cl_catalogo
create table cl_catalogo (
ca_codigo      int not null,
ca_tabla      int not null,
ca_valor       varchar(10) null,
ca_descripcion varchar(32) null,
ca_fecha       datetime null,
ca_estado      char(1) null
)
select * from cl_catalogo
insert into cl_catalogo values (1,1,'C','Consulta',NOW(),'V');
insert into cl_catalogo values (2,1,'T','Tratamiento',NOW(),'V');
insert into cl_catalogo values (3,1,'L','Limpieza',NOW(),'V');
insert into cl_catalogo values (4,1,'O','Ortodoncia',NOW(),'V');
insert into cl_catalogo values (5,1,'CI','Cirugia',NOW(),'V');
truncate table cl_catalogo
insert into cl_catalogo values (1,2,'C','Canceladas',NOW(),'V');
insert into cl_catalogo values (2,2,'P','Pendientes',NOW(),'V');
insert into cl_catalogo values (3,2,'A','Anuladas',NOW(),'V');
insert into cl_catalogo values (4,2,'T','Todas',NOW(),'V');

select * from cl_catalogo where ca_tabla = (select ta_codigo from cl_tabla where ta_nombre ='cl_tipo_consulta')

--Creación de Tabla ad_caja
drop table cl_cita
create table cl_cita (
ci_codigo     int not null,
ci_fecha      date not null,
ci_oficina    int not null,
ci_usuario    int not null,
ci_cliente    int not null,
ci_medico     int not null,
ci_fecha_cita date not null,
ci_hora_ini   time not null,
ci_hora_fin   time not null,
ci_tipo       char(1) null,  
ci_estado     char(1) null
)
select * from cl_cita

insert into cl_cita values (1,NOW(),1,1,1,1,NOW(),CURRENT_TIME(),CURRENT_TIME(),'1','V')

