create database Gym;

use Gym;

CREATE TABLE Rol (
    Id_Rol INT PRIMARY KEY auto_increment,
    Descripcion VARCHAR(50),
    Fecha_Registro DATETIME default CURRENT_TIMESTAMP
);

insert into ROl(Descripcion) value ("Administrador");
insert into ROl(Descripcion) value ("Empleado");
insert into ROl(Descripcion) value ("Programador");

select *from Rol;

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
insert into Usuario(Nombre_Usuario,Telefono,Clave,Correo,Id_Rol,Estado) value ("Admin predefinido",null,123,null,1,1);

insert into Usuario(Nombre_Usuario,Telefono,Clave,Correo,Id_Rol,Estado) value ("Empleado",null,123,null,2,1);

select *from usuario;

CREATE TABLE Permisos (
    Id_Permisos INT PRIMARY KEY auto_increment,
    Rol_Id_Rol INT,
    NombreMenu VARCHAR(50),
    FechaCreacion DATETIME  default CURRENT_TIMESTAMP,
    FOREIGN KEY (Rol_Id_Rol) REFERENCES Rol(Id_Rol)
);

insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtninicio");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnclientes");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnventas");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnmiembros");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnvisita");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtninventario");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnusuario");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtnsalir");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnacercade");

insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtninicio");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtnclientes");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtnventas");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtnmiembros");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtnvisita");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (2,"ibtninventario");
insert into Permisos(Rol_Id_Rol,NombreMenu) values (1,"ibtnsalir");

select *from permisos ;

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

insert into Estatus (Est_descricion) value ("MIEMBRO");
insert into Estatus (Est_descricion) value ("Visitante");

select *from Estatus;

 CREATE TABLE Venta (
    Ven_Id INT PRIMARY KEY,
    Id_Usuario INT,
    Cli_Id INT,
    Monto_Pago DECIMAL(10,2),
    Monto_Total DECIMAL(10,2),
    Fecha_Creacion DATETIME  default CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
    FOREIGN KEY (Cli_Id) REFERENCES Cliente(Cli_Id)
);

CREATE TABLE Detalle_Venta (
    Id_DetalleVenta INT PRIMARY KEY,
    Ven_Id INT,
    Id_Usuario INT,
    Prod_Id INT,
    Precio_Venta DECIMAL(10,2),
    Cantidad INT(3),
    Subtotal DECIMAL(10,2),
    Fecha_Creacion DATETIME  default CURRENT_TIMESTAMP,
    FOREIGN KEY (Ven_Id) REFERENCES Venta(Ven_Id),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
    FOREIGN KEY (Prod_Id) REFERENCES Productos(Prod_Id)
);

CREATE TABLE Productos (
    Prod_Id INT PRIMARY KEY,
    Prod_Nombre VARCHAR(45),
    Prod_Cantidad INT(10),
    Prod_Precio FLOAT,
    Prod_FechaCad DATETIME,
    Fecha_Creacion DATETIME  default CURRENT_TIMESTAMP
);

