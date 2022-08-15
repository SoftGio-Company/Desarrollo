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
Select * from ad_usuario where us_login ='gcueva' and us_password='gcueva'
insert into ad_usuario(us_codigo,us_nombre,us_login,us_password,us_fecha,us_estado) values (1,'Administrador','admin','admin',NOW(),'V')
insert into ad_usuario(us_codigo,us_nombre,us_login,us_password,us_fecha,us_estado) values (2,'Marcia Esponiza','mespinoza','mespinoza',NOW(),'V')
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
drop table ad_usuario_rol
select * from ad_usuario_rol
insert into ad_usuario_rol values(1,1,1,0,NOW(),'V')
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

select * from cl_cliente
truncate table cl_cliente
insert into  cl_cliente values (1,'1000000000','Consumidor Final','','','','frigocarito@gmail.com',NOW(),'V')
insert into  cl_cliente values (2,'1720693215','Giovanny Patricio','Cueva Valencia','Puembo Calle 24 de Mayo y Liena Ferrea','0984523918','jhonpat1985@hotmail.com',NOW(),'V')
update cl_cliente set cl_identificacion ='0701210312', cl_nombre='Cesar Tadeo Cueva',cl_apellido='Cueva Paladines',cl_direccion='San Carlos El Triunfo Calle 26 de Agosto Oe14-50',cl_telefono='0992774162',us_estado='V' where cl_codigo =2
Select cl_nombre,cl_apellido,cl_direccion,cl_telefono,cl_email from cl_cliente where cl_identificacion ='1720693216'
Select cl_nombre,cl_apellido,cl_direccion,cl_telefono,cl_email from cl_cliente where cl_identificacion =1720693216
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
tm_estado         char(1) null
)
select * from tr_transaccion_monetaria
truncate table tr_transaccion_monetaria
insert into tr_transaccion_monetaria values (1000,NOW(),100,1,'gcueva',1500.00,null,null,'Ingreso de Caja Inicial','V')
insert into tr_transaccion_monetaria values (1001,NOW(),100,2,'gcueva',null,1000.00,5634,'Recibo de Cheque','V')

--Creacion de Tabla tr_factura
drop table tr_factura
create table tr_factura (
fc_transaccion     int not null,
fc_codigo         int not null,
fc_fecha          datetime null,
fc_cliente        int not null,
fc_caja           int not null,
fc_usuario        varchar(32) not null,
fc_subtotal       decimal(8,2)  null,
fc_iva            decimal(8,2)  null,
fc_total          decimal(8,2)  null,     
fc_estado         char(1) null
)
select * from tr_factura
truncate table tr_factura
--Creacion de Tabla tr_detalle_factura
create table tr_detalle_factura (
df_codigo         int not null,
df_secuencial     int not null,
df_producto       int not null,
df_cantidad       int not null,
df_valor          decimal(8,2)  null,     
df_estado         char(1) null
)
truncate table tr_detalle_factura
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
SELECT * FROM tr_apertura_caja WHERE ac_fecha > DATE_SUB(NOW(), INTERVAL 1 DAY);
truncate table tr_apertura_caja
update tr_apertura_caja set ac_estado = 'C' where ac_codigo < 3;

update tr_apertura_caja set ac_estado ='C' where ac_codigo =2
delete tr_apertura_caja where ac_codigo = 3
Select max(tm_secuencial) from tr_transaccion_monetaria
select * from tr_apertura_caja where ac_oficina =1 and ac_usuario=12 and ac_rol=2 and ac_caja=2
truncate table tr_apertura_caja
insert into tr_apertura_caja values (1,NOW(),1,12,2,2,CURRENT_TIME(),CURRENT_TIME(),2.00,1.00,'A')
select * from tr_apertura_caja where ac_oficina =1 and ac_usuario=12 and ac_caja=1 and ac_fecha = 