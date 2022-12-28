--creo esquema de trabajo nuevo
create schema flotaKC authorization uvddpmqj;

create table flotakc.grupo_empresarial(
	id_grupo_empresarial varchar (20) not null, --PK
	nombre varchar (200) not null
);

alter table flotakc.grupo_empresarial 
add constraint grupo_empresarial_PK primary key (id_grupo_empresarial);

create table flotakc.marca(
	id_marca varchar (200) not null, --PK
	id_grupo_empresarial varchar (200) not null, --FK ->grupo_empresarial ->id_grupo_empresarial
	nombre varchar (200) not null
);

alter table flotakc.marca 
add constraint marca_PK primary key (id_marca);

alter table flotakc.marca 
add constraint id_grupo_empresarial_FK foreign key (id_grupo_empresarial)
references flotakc.grupo_empresarial (id_grupo_empresarial);

create table flotakc.modelo(
	id_modelo varchar (200) not null, --PK
	id_marca varchar (200) not null, --FK ->marca ->id_marca
	id_grupo_empresarial varchar (200) not null, --FK ->grupo_empresarial ->id_grupo_empresarial
	nombre varchar (200) not null
);

alter table flotakc.modelo
add constraint id_modelo_PK primary key (id_modelo);

alter table flotakc.modelo
add constraint id_marca_FK foreign key (id_marca)
references flotakc.marca (id_marca);

alter table flotakc.modelo
add constraint id_grupo_empresarial_FK foreign key(id_grupo_empresarial)
references flotakc.grupo_empresarial (id_grupo_empresarial);

--cargo los datos de estas tres tablas

insert into flotakc.grupo_empresarial
(id_grupo_empresarial,nombre)
values ('GE001', 'BMW Group');

insert into flotakc.grupo_empresarial
(id_grupo_empresarial,nombre)
values ('GE002', 'Daimler');

insert into flotakc.grupo_empresarial
(id_grupo_empresarial,nombre)
values ('GE003', 'FCA');

insert into flotakc.grupo_empresarial
(id_grupo_empresarial,nombre)
values ('GE004', 'Ford');

insert into flotakc.grupo_empresarial
(id_grupo_empresarial,nombre)
values ('GE005', 'WAG');

insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M01','GE001','mini');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M02','GE001','rolls royce');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M03','GE001','bmw');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M04','GE002','maybach');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M05','GE002','Mercedes-benz');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M06','GE002','Smart');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M07','GE003','Alfa Romeo');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M08','GE003','Chrysler');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M09','GE003','Dodge');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M10','GE003','Fiat');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M11','GE003','Jeep');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M12','GE003','Lancia');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M13','GE003','Maserati');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M14','GE003','RAM');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M15','GE004','Ford');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M16','GE005','Volkswagen');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M17','GE005','Audi');
insert into flotakc.marca (id_marca,id_grupo_empresarial,nombre) values ('M18','GE005','Seat');

insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV001','M01','GE001','Cooper S');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV002','M01','GE001','Cooper SE');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV003','M02','GE001','Royce Cullinan');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV004','M02','GE001','Royce wrait');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV005','M06','GE002','EQ fortwo');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV006','M10','GE003','Punto');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV007','M11','GE003','Rubicon');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV008','M11','GE003','Renegade');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV009','M15','GE004','Fiesta');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV010','M16','GE005','Polo');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV011','M17','GE005','A4');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV012','M17','GE005','A8');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV013','M18','GE005','Panda');
insert into flotakc.modelo (id_modelo,id_marca,id_grupo_empresarial,nombre) values ('MV014','M18','GE005','León');

create table flotakc.aseguradora(
	id_aseguradora varchar (200) not null, --PK
	id_poliza varchar (200) not null, --PK
	nombre varchar (200) not null
);

alter table flotakc.aseguradora
add constraint id_aseguradora_PK primary key (id_aseguradora, id_poliza);

insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS01','PO01','Maphre');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS01','PO02','Maphre');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS02','PO03','Mutua Madrileña');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS02','PO04','Mutua Madrileña');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS03','PO05','Linea Directa');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS03','PO06','Linea Directa');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS04','PO07','Axa');
insert into flotakc.aseguradora (id_aseguradora,id_poliza,nombre) values ('AS04','PO08','Axa');

create table flotakc.moneda (
	id_moneda varchar (50) not null, --PK
	nombre varchar (100) not null
);

alter table flotakc.moneda
add constraint id_moneda_PK primary key (id_moneda);

insert into flotakc.moneda (id_moneda, nombre) values ('M01', 'EUR');
insert into flotakc.moneda (id_moneda, nombre) values ('M02', 'USD');

create table flotakc.vehiculos(
	id_vehiculo varchar(20) not null, --PK
	id_marca varchar (200) not null, --FK flotakc.marca -- id_marca
	id_modelo varchar (200) not null, -- FK flotakc.modelo -- id_modelo
	id_grupo_empresarial varchar(200) not null, --FK -->flotakc.grupo_empresarial -->id_grupo_empresarial
	id_aseguradora varchar(200) not null,--FK-->flotakc.aseguradora -->id_aseguradora
	id_poliza varchar (200) not null, --FK-->flotakc.aseguradora -->id_poliza
	id_revisiones varchar (200) not null, --FK-->flotakc.revisiones -->id_revisiones
	matricula varchar (10) not null,
	total_km integer not null,
	color varchar (200) not null,
	fecha_compra date not null
);
alter table flotakc.vehiculos
add constraint id_vehiculo_PK primary key (id_vehiculo);

alter table flotakc.vehiculos
add constraint id_marca_FK foreign key (id_marca)
references flotakc.marca (id_marca);

alter table flotakc.vehiculos
add constraint id_modelo_FK foreign key (id_modelo)
references flotakc.modelo (id_modelo);

alter table flotakc.vehiculos
add constraint id_grupo_empresarial_FK foreign key (id_grupo_empresarial)
references flotakc.grupo_empresarial (id_grupo_empresarial);

alter table flotakc.vehiculos
add constraint id_aseguradora_FK foreign key (id_aseguradora, id_poliza)
references flotakc.aseguradora (id_aseguradora, id_poliza);


insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V001','M01','MV001','GE001','AS01','PO01','R001','1234-ABC',10214,'rojo','2020-03-03');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V002','M01','MV002','GE001','AS01','PO02','R002','5547-AAA',4545,'negro', '2021-03-03');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V003','M02','MV003','GE001','AS02','PO03','R003','5874-BBB',14785,'blanco','2020-01-03');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V004','M02','MV004','GE001','AS02','PO04','R004','7894-ASD',12365,'rojo', '2019-03-03');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V005','M06','MV005','GE002','AS03','PO05','R005','4561-PPP',45648,'negro','2022-03-05');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V006','M10','MV006','GE003','AS03','PO06','R006','7777-QQQ',9666,'blanco','2018-04-21');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V008','M11','MV008','GE003','AS04','PO08','R008','1111-XXX',457845,'negro', '2000-01-03');
insert into flotakc.vehiculos (id_vehiculo, id_marca,id_modelo,id_grupo_empresarial,id_aseguradora,id_poliza,id_revisiones,matricula,total_km,color,fecha_compra) values ('V009','M15','MV009','GE004','AS01','PO01','R009','2222-CVB',4525,'blanco', '2021-03-08');


create table flotakc.revisiones(
	id_revisiones varchar (20) not null, --PK
	id_km_revision integer not null, --PK
	id_fecha_revision date not null default '4000-01-01',--PK
	id_importe_revision integer not null,
	id_moneda varchar (20) not null, --FK->flotack.moneda->id_moneda
	id_vehiculo varchar (20) not null
);

alter table flotakc.revisiones
add constraint id_revisiones_PK primary key (id_revisiones);


alter table flotakc.revisiones
add constraint id_moneda_FK foreign key (id_moneda)
references flotakc.moneda(id_moneda);

alter table flotakc.revisiones
add constraint id_vehiculo_FK foreign key (id_vehiculo)
references flotakc.vehiculos(id_vehiculo);

insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R001',50000,'2018-08-07',100,'M01', 'V001');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R002',41000,'2020-04-01',120,'M02', 'V001');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R003',200,'2021-09-04',50,'M01', 'V002');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R004',21455,'2021-09-04',480,'M02', 'V002');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R005',8785,'2019-06-03',412,'M01', 'V004');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R006',9541,'2019-06-03',552,'M02', 'V008');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R007',77456,'2017-06-03',130,'M01','V002');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R008',9321,'2022-06-03',78,'M02','V009');
insert into flotakc.revisiones (id_revisiones,id_km_revision, id_fecha_revision,id_importe_revision,id_moneda, id_vehiculo) values ('R009',515884,'2020-08-01',852,'M02','V005');


