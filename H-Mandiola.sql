USE [H-Mandiola];
GO

DROP TABLE IF EXISTS Bitacora;
DROP TABLE IF EXISTS Error;
DROP TABLE IF EXISTS Consecutivo;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Tarjeta;
DROP TABLE IF EXISTS Emisor;
DROP TABLE IF EXISTS Historial_Actividad;
DROP TABLE IF EXISTS Actividad;
DROP TABLE IF EXISTS BookingID;
DROP TABLE IF EXISTS Habitacion;
DROP TABLE IF EXISTS Est_Hab;
DROP TABLE IF EXISTS Tipo_Habitacion;
DROP TABLE IF EXISTS ARTICULOS_RESERVA;
DROP TABLE IF EXISTS Articulo;
DROP TABLE IF EXISTS Tipo_Articulo;
DROP TABLE IF EXISTS Precio;
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Estado;

USE [H-Mandiola];
GO

CREATE TABLE Consecutivo (
    Codigo        INT			NOT NULL,
    Descripcion   NVARCHAR(50)	NOT NULL,
    Consecutivo   INT			NOT NULL,
    PoseePrefijo  BIT,
    Prefijo       VARCHAR(5),
    PoseeRango    BIT,
    Minimo        INT,
    Maximo        INT,
CONSTRAINT Consecutivo_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Estado (
    Codigo			INT			NOT NULL
    ,Tipo			VARCHAR(30) NOT NULL
	,CONSTRAINT Estado_pk PRIMARY KEY ( Codigo )
	,CONSTRAINT Estado_tipo_un UNIQUE ( Tipo )
);

CREATE TABLE Cliente (
    Codigo                  VARCHAR(10) NOT NULL,
    Nombre                  VARCHAR(30) NOT NULL,
    Apellido1               VARCHAR(30) NOT NULL,
    Apellido2               VARCHAR(30) NOT NULL,
    Email                   NVARCHAR(50) NOT NULL,
    Usuario                 NVARCHAR(30) NOT NULL,
    Clave                   NVARCHAR(30) NOT NULL,
    Pregunta                NVARCHAR(50) NOT NULL,
    Respuesta               NVARCHAR(30) NOT NULL,
	Estado       			INT			NOT NULL
	CONSTRAINT Usuario_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Usuario_email_un UNIQUE ( Email ),
	CONSTRAINT Usuario_usuario_un UNIQUE ( Usuario ),
	CONSTRAINT Usuario_estado_fk FOREIGN KEY ( Estado ) REFERENCES Estado ( Codigo )
);

CREATE TABLE Admin (
    Codigo                  VARCHAR(10) NOT NULL,
    Nombre                  VARCHAR(30) NOT NULL,
    Apellido1               VARCHAR(30) NOT NULL,
    Apellido2               VARCHAR(30) NOT NULL,
    Email                   VARCHAR(50) NOT NULL,
    Usuario                 VARCHAR(30) NOT NULL,
    Clave                   VARCHAR(30) NOT NULL,
    Administrador			BIT			NOT NULL,
    Seguridad				BIT 		NOT NULL,
    Consecutivo				BIT 		NOT NULL,
    Mantenimiento			BIT 		NOT NULL,
    Consulta				BIT 		NOT NULL,
	CONSTRAINT UsuarioAd_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Usuario_emailAd_un UNIQUE ( Email ),
	CONSTRAINT Usuario_usuarioAd_un UNIQUE ( Usuario )
);

CREATE TABLE Reserva (
    Codigo						VARCHAR(10) NOT NULL,
    Fecha_Entrada				DATE		NOT NULL,
    Fecha_Salida				DATE		NOT NULL,
    Cantidad_Dias				INT			NOT NULL,
    Codigo_Promocional			BIT			NOT NULL,
    Cantidad_Adultos			INT			NOT NULL,
    Cantidad_Niños				INT			NOT NULL,
    Mascota						BIT			NOT NULL,
    Metodo_Pago					NVARCHAR(50) NOT NULL,
    Precio						INT,
    Usuario						VARCHAR(10) NOT NULL,
	CONSTRAINT Reserva_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Reserva_Usuario_fk FOREIGN KEY ( Usuario ) REFERENCES Cliente ( Codigo )
);

CREATE TABLE Actividad (
    Codigo                    VARCHAR(10) NOT NULL,
    Nombre                    VARCHAR(30) NOT NULL,
    Descripcion               VARCHAR(30) NOT NULL,
CONSTRAINT Actividad_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Precio (
    Codigo                      VARCHAR(10) NOT NULL,
    Precio                      INT			NOT NULL,
	CONSTRAINT Precio_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Tipo_Articulo (
    Codigo          INT				NOT NULL,
    Tipo            VARCHAR(30)		NOT NULL,
	CONSTRAINT Tipo_Articulo_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Tipo_Articulo_Tipo_un UNIQUE ( Tipo )
);

CREATE TABLE Articulo 
(
    Codigo							INT	IDENTITY(1,1),
    Nombre							VARCHAR(30) NOT NULL,
    Tipo_Articulo					INT			NOT NULL,
	Precio							VARCHAR(10) NOT NULL,
	CONSTRAINT Articulo_pk			PRIMARY KEY ( Codigo ),
	CONSTRAINT Articulo_Tipo_Articulo_fk FOREIGN KEY (Tipo_Articulo) REFERENCES Tipo_Articulo ( Codigo ),
	CONSTRAINT Articulo_Precio_fk	FOREIGN KEY ( Precio) REFERENCES Precio ( Codigo )
);

CREATE TABLE ARTICULOS_RESERVA
(
	Codigo					INT				IDENTITY(1,1),
	Cantidad				INT				NOT NULL,
	Articulo				INT				NOT NULL,
	Reserva					VARCHAR(10)		NOT NULL,
	CONSTRAINT PK_ARTICULORESERVA_CODIGO	PRIMARY KEY(CODIGO),
	CONSTRAINT FK_ARTICULORESERVA_ARTICULO	FOREIGN KEY(ARTICULO)	REFERENCES ARTICULO (CODIGO),
	CONSTRAINT FK_ARTICULORESERVA_RESERVA	FOREIGN KEY(RESERVA)	REFERENCES RESERVA (CODIGO)
);

CREATE TABLE Bitacora (
    Codigo					VARCHAR(10)		NOT NULL,
    Fecha_Hora              DATETIME		NOT NULL,
    Tipo                    VARCHAR(30)		NOT NULL,
    Descripcion             VARCHAR(100)	NOT NULL,
	CONSTRAINT Bitacora_pk	PRIMARY KEY ( Codigo )
);

CREATE TABLE Est_Hab (
    Codigo					INT			NOT NULL,
    Descripcion				VARCHAR(30) NOT NULL,
	CONSTRAINT Est_Hab_pk	PRIMARY KEY ( Codigo )
);

CREATE TABLE Tipo_Habitacion (
    Codigo          INT				NOT NULL,
    Tipo            VARCHAR(30)		NOT NULL,
	CONSTRAINT Tipo_Habitacion_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Habitacion (
    Codigo                  VARCHAR(10)		NOT NULL,
    Numero    				INT				NOT NULL,
    Descripcion             VARCHAR(250)	NOT NULL,
    Est_Hab     			INT				NOT NULL,
    Precio					VARCHAR(10)		NOT NULL,
	Tipo					INT				NOT NULL,
	CONSTRAINT Habitacion_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Habitacion_Est_Hab_fk FOREIGN KEY ( Est_Hab ) REFERENCES Est_Hab ( Codigo ),
	CONSTRAINT Habitacion_Precio_fk FOREIGN KEY ( Precio) REFERENCES Precio ( Codigo ),
	CONSTRAINT Habitacion_Tipo_fk FOREIGN KEY ( Tipo) REFERENCES Tipo_Habitacion ( Codigo )
);

CREATE TABLE BookingID (
    Codigo					NVARCHAR(7)		NOT NULL,
    Habitacion				VARCHAR(10)		NOT NULL,
    Reserva                 VARCHAR(10)		NOT NULL,
	CONSTRAINT Bookingid_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Bookingid_Habitacion_fk FOREIGN KEY ( Habitacion ) REFERENCES Habitacion ( Codigo ),
	CONSTRAINT Bookingid_Reserva_fk FOREIGN KEY ( Reserva ) REFERENCES Reserva ( Codigo )
);

CREATE TABLE Emisor (
    Codigo				INT			NOT NULL,
    Descripcion			VARCHAR(30) NOT NULL,
CONSTRAINT Emisor_pk	PRIMARY KEY ( Codigo )
);

CREATE TABLE Error (
    Codigo         INT			NOT NULL,
    Fecha_Hora     DATETIME		NOT NULL,
    Mensaje        VARCHAR(50)	NOT NULL,
CONSTRAINT Error_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Historial_Actividad (
    Codigo                 INT		NOT NULL,
    Usuario	           VARCHAR(10)	NOT NULL,
    Actividad   	   VARCHAR(10)	NOT NULL,
CONSTRAINT Historial_Actividad_pk PRIMARY KEY ( Codigo ),
CONSTRAINT Hist_act_Act_fk FOREIGN KEY ( Actividad )
        REFERENCES Actividad ( Codigo ),
CONSTRAINT Hist_Act_Usuario_fk FOREIGN KEY ( Usuario )
        REFERENCES Cliente ( Codigo )
);

CREATE TABLE Tarjeta (
    Codigo                  INT NOT NULL,
    Numero_Tarjeta          INT NOT NULL,
    Fecha_Exp               DATE NOT NULL,
    Usuario	            VARCHAR(10) NOT NULL,
    Emisor		    INT NOT NULL,
	CONSTRAINT Tarjeta_pk PRIMARY KEY ( Codigo ),
	CONSTRAINT Tarjeta_Emisor_fk FOREIGN KEY ( Emisor ) REFERENCES Emisor ( Codigo ),
CONSTRAINT Tarjeta_Usuario_fk FOREIGN KEY (Usuario) REFERENCES Cliente ( Codigo )
);

----INSERT H-MANDIOLA HOTEL----


--INSERT EST_HAB
insert into Est_Hab (Codigo, Descripcion) values (1, 'Lista');
insert into Est_Hab (Codigo, Descripcion) values (2, 'Pendiente');

--INSERT ESTADO
insert into Estado (Codigo, Tipo) values (1, 'Activo');
insert into Estado (Codigo, Tipo) values (2, 'Inactivo');

--INSERT TIPO_ARTICULO
insert into Tipo_Articulo (Codigo, Tipo) values (1, 'Licor');
insert into Tipo_Articulo (Codigo, Tipo) values (2, 'Bebidas Gaseosas');
insert into Tipo_Articulo (Codigo, Tipo) values (3, 'Bebidas Naturales');
insert into Tipo_Articulo (Codigo, Tipo) values (4, 'Dulces');
insert into Tipo_Articulo (Codigo, Tipo) values (5, 'Helados');
insert into Tipo_Articulo (Codigo, Tipo) values (6, 'Flores');
insert into Tipo_Articulo (Codigo, Tipo) values (7, 'Tartas');

--INSERT TIPO_HABITACION
insert into Tipo_Habitacion (Codigo, Tipo) values (1, 'Normal');
insert into Tipo_Habitacion (Codigo, Tipo) values (2, 'Deluxe');
insert into Tipo_Habitacion (Codigo, Tipo) values (3, 'Condominio');

--INSERT CONSECUTIVO
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (01 ,'Usuario', 1, 1, 'USR', 1, 1, 100);
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (02 ,'Habitación', 1, 1, 'HAB', 1, 1, 100);
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (03 ,'Actividad', 1, 1, 'ACT', 1, 1, 100);
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (04 ,'Precio', 1, 1, 'PRC', 1, 1, 100);
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (05 ,'Reserva', 1, 1, 'RES', 1, 1, 100);
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (06 ,'Bitácora', 1, 1, 'BIT', 1, 1, 100);
INSERT INTO Consecutivo (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
     VALUES (07 ,'Cliente', 1, 1, 'CLI', 1, 1, 100);

--INSERT PRECIO
--insert into Precio (codigo, precio) values (1, 80);
--insert into Precio (codigo, precio) values (2, 95);
--insert into Precio (codigo, precio) values (3, 115);