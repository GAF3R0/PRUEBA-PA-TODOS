create database Gym;

use Gym;

CREATE TABLE Rol (
    Id_Rol INT PRIMARY KEY auto_increment,
    Descripcion VARCHAR(50),
    Fecha_Registro DATETIME default CURRENT_TIMESTAMP
);

CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY auto_increment,
    Nombre_Usuario VARCHAR(100),
    Telefono VARCHAR(15),
    Clave VARCHAR(10),
    Correo VARCHAR(20),
     Id_Rol INT,
    Estado bit,
    Fecha_Registro DATETIME default CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
);

CREATE TABLE Permisos (
    Id_Permisos INT PRIMARY KEY auto_increment,
    Rol_Id_Rol INT,
    NombreMenu VARCHAR(50),
    FechaCreacion DATETIME  default CURRENT_TIMESTAMP,
    FOREIGN KEY (Rol_Id_Rol) REFERENCES Rol(Id_Rol)
);

CREATE TABLE Cliente (
    Cli_Id INT PRIMARY KEY auto_increment,
    Cli_Nombre VARCHAR(45),
    Cli_Edad INT(2),
    Cli_Telefono VARCHAR(15),
    Cli_Telefono_Emer VARCHAR(15),
    Cli_Correo VARCHAR(30),
    Cli_Domicilio VARCHAR(45),
    Cli_Colonia VARCHAR(45),
    Est_id int ,foreign key(Est_id) references Estatus(Est_id),
    Fecha_Creacion DATETIME  default CURRENT_TIMESTAMP   , 
    Fecha_termina DATETIME
);

create table Estatus (
Est_id int primary key,
Est_descricion varchar(20),
fecha_creacion datetime default now()
);