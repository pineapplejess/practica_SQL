create schema flotaKC2 authorization uvddpmqj;

create table flotaKC2.grupo_empresarial(
id_grupo_empresarial SERIAL not null, --PK 
grupo_empresarial varchar(200) not null 
);

alter table flotaKC2.grupo_empresarial
add constraint grupo_empresarial_PK primary key (id_grupo_empresarial);


insert into flotakc2.grupo_empresarial
(grupo_empresarial)
values ('BMW Group');
insert into flotakc2.grupo_empresarial
(grupo_empresarial)
values ('Daimler');
insert into flotakc2.grupo_empresarial
(grupo_empresarial)
values ('FCA');
insert into flotakc2.grupo_empresarial
(grupo_empresarial)
values ('Ford');
insert into flotakc2.grupo_empresarial
(grupo_empresarial)
values ('WAG');


create table flotaKC2.marca(
id_marca SERIAL not null, --PK 
id_grupo_empresarial int not null, --FK ->grupo_empresarial ->id_grupo_empresarial
marca varchar (200) not null);

alter table flotaKC2.marca
add constraint marca_PK primary key (id_marca);

alter table flotaKC2.marca
add constraint marca_FK foreign key (id_grupo_empresarial)
references flotaKC2.grupo_empresarial (id_grupo_empresarial);

insert into flotaKC2.marca (id_grupo_empresarial, marca)
values ('1','Toyota');

insert into flotakc2.marca (id_grupo_empresarial,marca) values (1,'mini');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (1,'rolls royce');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (1,'bmw');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (2,'maybach');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (2,'Mercedes-benz');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (2,'Smart');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Alfa Romeo');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Chrysler');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Dodge');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Fiat');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Jeep');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Lancia');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'Maserati');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (3,'RAM');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (4,'Ford');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (4,'Volkswagen');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (5,'Audi');
insert into flotakc2.marca (id_grupo_empresarial,marca) values (5,'Seat');


create table flotaKC2.modelo(
id_modelo SERIAL not null, --PK 
id_marca int not null, --FK >marca ->id_marca
modelo varchar (200) not null
);

alter table flotaKC2.modelo
add constraint modelo_PK primary key (id_modelo);

alter table flotaKC2.modelo
add constraint modelo_FK foreign key (id_marca)
references flotaKC2.marca (id_marca);


insert into flotakc2.modelo (id_marca,modelo) values (2,'Cooper S');
insert into flotakc2.modelo (id_marca,modelo) values (2,'Cooper SE');
insert into flotakc2.modelo (id_marca,modelo) values (2,'Royce Cullinan');
insert into flotakc2.modelo (id_marca,modelo) values (2,'Royce wrait');
insert into flotakc2.modelo (id_marca,modelo) values (2,'EQ fortwo');
insert into flotakc2.modelo (id_marca,modelo) values (3,'Punto');
insert into flotakc2.modelo (id_marca,modelo) values (3,'Rubicon');
insert into flotakc2.modelo (id_marca,modelo) values (3,'Renegade');
insert into flotakc2.modelo (id_marca,modelo) values (4,'Fiesta');
insert into flotakc2.modelo (id_marca,modelo) values (5,'Polo');
insert into flotakc2.modelo (id_marca,modelo) values (5,'A4');
insert into flotakc2.modelo (id_marca,modelo) values (5,'A8');
insert into flotakc2.modelo (id_marca,modelo) values (5,'Panda');
insert into flotakc2.modelo (id_marca,modelo) values (5,'León');




create table flotaKC2.aseguradora(
id_compania_aseguradora SERIAL not null, --PK 
compania_aseguradora varchar (200) not null
);

alter table flotaKC2.aseguradora
add constraint compania_aseguradora_PK primary key (id_compania_aseguradora);

insert into flotaKC2.aseguradora (compania_aseguradora) values ('Mapfre');
insert into flotaKC2.aseguradora (compania_aseguradora) values ('Mutua Madrileña');
insert into flotaKC2.aseguradora (compania_aseguradora) values ('Linea Directa');


create table flotaKC2.color(
id_color SERIAL not null, --PK
color varchar (200) not null
);

alter table flotaKC2.color
add constraint color_PK primary key (id_color);

insert into flotaKC2.color (color) values ('Negro');
insert into flotaKC2.color (color) values ('Blanco');
insert into flotaKC2.color (color) values ('Rojo');
insert into flotaKC2.color (color) values ('Amarillo');
insert into flotaKC2.color (color) values ('Azul');


create table flotaKC2.vehiculo(
id_vehiculo SERIAL not null, --PK 
id_modelo int not null, --FK modelo --id_modelo
id_color int not null, --FK color --id_color
id_compania_aseguradora int not null, --FK aseguradora -- id_compania_aseguradora
n_poliza varchar (50) not null,
matricula varchar (20) not null, 
total_kilometros int not null, 
fecha_compra varchar (50) not null
);

alter table flotaKC2.vehiculo
add constraint id_vehiculo_PK primary key (id_vehiculo);

alter table flotaKC2.vehiculo
add constraint id_modelo_FK foreign key (id_modelo)
references flotaKC2.modelo (id_modelo);

alter table flotaKC2.vehiculo
add constraint id_color_FK foreign key (id_color)
references flotaKC2.color (id_color);

alter table flotaKC2.vehiculo
add constraint id_compania_aseguradora_FK foreign key (id_compania_aseguradora)
references flotaKC2.aseguradora (id_compania_aseguradora);

insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '1', '1', '1', 'P01454', 'ABC123', '100', '2010-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '1', '1', '1', 'P01455', 'ABC124', '1000', '2004-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '2', '1', '3', 'P01475', 'ABC174', '14000', '2000-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '2', '2', '3', 'P01175', 'ABC174', '114000', '2002-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '1', '1', '1', 'P01474', 'ABC723', '1020', '2014-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '3', '1', '1', 'P010455', 'ABC1124', '111000', '2009-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '2', '3', '1', 'P03475', 'AB4174', '154000', '2001-01-01');
insert into flotaKC2.vehiculo (id_modelo, id_color, id_compania_aseguradora, n_poliza, matricula, total_kilometros, fecha_compra)
values ( '2', '3', '3', 'P011375', 'AB3C174', '1144000', '2000-01-01');

create table flotaKC2.moneda(
id_moneda varchar (20) not null, --PK
moneda varchar (200) not null
);

alter table flotaKC2.moneda
add constraint moneda_PK primary key (id_moneda);

insert into flotaKC2.moneda (id_moneda, moneda)
values ('M01', 'Euro');

insert into flotaKC2.moneda (id_moneda, moneda)
values ('M02', 'USD');

create table flotaKC2.revisiones(
id_revision SERIAL not null, --PK 
f_revision date not null, --PK
id_vehiculo int not null, --PK, FK - vehiculo->id_vehiculo
id_moneda varchar (200), --FK moneda->id_moneda
importe decimal not null, 
kilometros int not null,
notas varchar (300)
);

alter table flotaKC2.revisiones
add constraint revision_PK primary key (id_revision, f_revision, id_vehiculo);

alter table flotaKC2.revisiones
add constraint revision_vehiculo_FK foreign key (id_vehiculo)
references flotaKC2.vehiculo (id_vehiculo);

alter table flotaKC2.revisiones
add constraint moneda_FK foreign key (id_moneda)
references flotaKC2.moneda (id_moneda);

insert into flotaKC2.revisiones (f_revision, id_vehiculo, id_moneda, importe, kilometros, notas)
values ('2000-10-01', '2', 'M01', '250', '550000', 'revision general');

insert into flotaKC2.revisiones (f_revision, id_vehiculo, id_moneda, importe, kilometros, notas)
values ('2010-10-01', '2', 'M01', '150', '950000', 'revision 5 años');

insert into flotaKC2.revisiones (f_revision, id_vehiculo, id_moneda, importe, kilometros, notas)
values ('2020-10-01', '3', 'M01', '150', '50000', 'revision 2 años');

insert into flotaKC2.revisiones (f_revision, id_vehiculo, id_moneda, importe, kilometros, notas)
values ('2022-10-01', '3', 'M01', '100', '50000', 'revision 4 años');

insert into flotaKC2.revisiones (f_revision, id_vehiculo, id_moneda, importe, kilometros, notas)
values ('2022-10-01', '4', 'M02', '120', '10000', 'revision general');
