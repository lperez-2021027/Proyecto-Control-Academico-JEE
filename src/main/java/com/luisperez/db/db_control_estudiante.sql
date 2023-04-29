drop database if exists db_control_estudiante_in5bm;
create database db_control_estudiante_in5bm;
use db_control_estudiante_in5bm;

drop table if exists estudiantes;
create table estudiantes (
	id int auto_increment not null,
	nombre varchar(45),
    apellido varchar(45),
    email varchar(60),
    telefono varchar(8),
    saldo decimal(6,2),
    primary key (id)
);

insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Luis Carlos", "Pérez", "perez@gmail.com", "58963521", 5.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("El Rich", "Mc", "rich@gmail.com", "54845632", 255.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Jenifer Anahí", "Fuentes", "perez@gmail.com", "45415441", 150.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Luis Carlos", "Serrano", "perez@gmail.com", "45368512", 50.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Maria Araceli", "Roca", "perez@gmail.com", "66936874", 78.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Melania Castellanos", "Arrazola", "perez@gmail.com", "58963521", 96.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Cintia Reguera", "Valero", "perez@gmail.com", "58963521", 52.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("José Roberto", "Gonzalez", "perez@gmail.com", "58963521", 102.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Juan Bodoque", "Fernandez", "perez@gmail.com", "58963521", 100.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Cesar Pedro", "Suarez", "perez@gmail.com", "58963521", 123.00);
insert into estudiantes(nombre, apellido, email, telefono, saldo) values("Conterstine", "Sounter", "dfsdfsd@gmail.com", "85642514", 83.00);

select * from estudiantes;