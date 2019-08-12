DROP TABLE Estado;
DROP TABLE Rol;
DROP TABLE Usuario;
DROP TABLE Historial_Actividad;
DROP TABLE BookingID;
DROP TABLE Habitacion;
DROP TABLE Precio;
DROP TABLE Tipo_Habitacion;
DROP TABLE Est_Hab;
DROP TABLE Articulo;
DROP TABLE Tipo_Articulo;
DROP TABLE Actividad;
DROP TABLE Reserva;
DROP TABLE Tarjeta;
DROP TABLE Emisor;
DROP TABLE Bitacora;
DROP TABLE Error;
DROP TABLE Consecutivo;



CREATE TABLE Consecutivo (
    Codigo        INT NOT NULL,
    Descripcion   VARCHAR(50) NOT NULL,
    Consecutivo   VARCHAR(5) NOT NULL,
    PoseePrefijo  BIT,
    Prefijo       VARCHAR(5),
    PoseeRango    BIT,
    Minimo        INT,
    Maximo        INT,
CONSTRAINT consecutivo_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Estado (
    Codigo       INT NOT NULL,
    Tipo         VARCHAR(30) NOT NULL,
CONSTRAINT estado_pk PRIMARY KEY ( Codigo ),
CONSTRAINT estado_tipo_un UNIQUE ( Tipo )
);

CREATE TABLE Rol (
    Codigo       INT NOT NULL,
    Tipo         VARCHAR(30) NOT NULL,
CONSTRAINT rol_pk PRIMARY KEY ( Codigo ),
CONSTRAINT rol_tipo_un UNIQUE ( Tipo )
);

CREATE TABLE Usuario (
    Codigo                    VARCHAR(10) NOT NULL,
    Nombre                    VARCHAR(30) NOT NULL,
    Apellido1                 VARCHAR(30) NOT NULL,
    Apellido2                 VARCHAR(30) NOT NULL,
    Email                     VARCHAR(50) NOT NULL,
    Usuario                   VARCHAR(30) NOT NULL,
    Clave                     VARCHAR(15) NOT NULL,
    Pregunta                  VARCHAR(50),
    Respuesta                 VARCHAR(30),
    Rol                       INT NOT NULL,
    Estado       	      INT NOT NULL,
CONSTRAINT usuario_pk PRIMARY KEY ( Codigo ),
CONSTRAINT usuario_email_un UNIQUE ( Email ),
CONSTRAINT usuario_usuario_un UNIQUE ( Usuario ),
CONSTRAINT usuario_estado_fk FOREIGN KEY ( Estado )
        REFERENCES estado ( Codigo ),
CONSTRAINT usuario_rol_fk FOREIGN KEY ( Rol )
        REFERENCES rol ( Codigo )
);

CREATE TABLE Reserva (
    Codigo                     VARCHAR(10) NOT NULL,
    Fecha_Entrada              DATE NOT NULL,
    Fecha_Salida               DATE NOT NULL,
    Cantidad_Dias              INT NOT NULL,
    Codigo_Promocional         CHAR(1) NOT NULL,
    Cantidad_Adultos           INT NOT NULL,
    Cantidad_Niños             INT NOT NULL,
    Mascota                    CHAR(1) NOT NULL,
    Metodo_Pago                CHAR(1) NOT NULL,
    Precio                     INT,
    Usuario	               VARCHAR(10) NOT NULL,
CONSTRAINT reserva_pk PRIMARY KEY ( Codigo ),
CONSTRAINT reserva_usuario_fk FOREIGN KEY ( Usuario )
        REFERENCES Usuario ( Codigo )
);

CREATE TABLE Actividad (
    Codigo                    VARCHAR(10) NOT NULL,
    Nombre                    VARCHAR(30) NOT NULL,
    Descripcion               VARCHAR(30) NOT NULL,
    Dia                       CHAR(1) NOT NULL,
    Horainicio                DATE NOT NULL,
    Horafinal                 DATE NOT NULL,
CONSTRAINT actividad_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Tipo_Articulo (
    Codigo          INT NOT NULL,
    Tipo            VARCHAR(30) NOT NULL,
CONSTRAINT tipo_articulo_pk PRIMARY KEY ( Codigo ),
CONSTRAINT tipo_articulo_tipo_un UNIQUE ( Tipo )
);

CREATE TABLE Articulo (
    Codigo                        VARCHAR(10) NOT NULL,
    Nombre                        VARCHAR(30) NOT NULL,
    Precio                        INT NOT NULL,
    Tipo_Articulo                 INT NOT NULL,
    Reserva                       VARCHAR(10) NOT NULL,
CONSTRAINT articulo_pk PRIMARY KEY ( Codigo ),
CONSTRAINT articulo_reserva_fk FOREIGN KEY ( Reserva )
        REFERENCES Reserva ( Codigo ),
CONSTRAINT articulo_tipo_articulo_fk FOREIGN KEY ( Tipo_Articulo )
        REFERENCES Tipo_Articulo ( Codigo )
);

CREATE TABLE Bitacora (
    Codigo                   VARCHAR(10) NOT NULL,
    Fecha_Hora                DATE NOT NULL,
    Tipo                      VARCHAR(20) NOT NULL,
    Descripcion               VARCHAR(100) NOT NULL,
CONSTRAINT bitacora_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Est_Hab (
    Codigo          INT NOT NULL,
    Descripcion     VARCHAR(20) NOT NULL,
CONSTRAINT est_hab_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Tipo_Habitacion (
    Codigo          INT NOT NULL,
    Tipo            VARCHAR(25) NOT NULL,
CONSTRAINT tipo_habitacion_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Precio (
    Codigo                          VARCHAR(10) NOT NULL,
    Tipo_Habitacion 		    INT NOT NULL,
    Precio                          INT,
CONSTRAINT precio_pk PRIMARY KEY ( Codigo ),
CONSTRAINT precio_tipo_habitacion_fk FOREIGN KEY ( Tipo_Habitacion )
        REFERENCES Tipo_Habitacion ( Codigo )
);

CREATE TABLE Habitacion (
    Codigo                    VARCHAR(10) NOT NULL,
    Numero    		      INT NOT NULL,
    Descripcion               VARCHAR(250) NOT NULL,
    Est_Hab     	      INT NOT NULL,
    Precio		      VARCHAR(10) NOT NULL,
CONSTRAINT habitacion_pk PRIMARY KEY ( Codigo ),
CONSTRAINT habitacion_est_hab_fk FOREIGN KEY ( Est_Hab )
        REFERENCES Est_Hab ( Codigo ),
CONSTRAINT habitacion_precio_fk FOREIGN KEY ( Precio )
        REFERENCES Precio ( Codigo )
);

CREATE TABLE BookingID (
    Codigo                  NVARCHAR(1) NOT NULL,
    Habitacion		    VARCHAR(10) NOT NULL,
    Reserva                 VARCHAR(10) NOT NULL,
CONSTRAINT bookingid_pk PRIMARY KEY ( Codigo ),
CONSTRAINT bookingid_habitacion_fk FOREIGN KEY ( Habitacion )
        REFERENCES Habitacion ( Codigo ),
CONSTRAINT bookingid_reserva_fk FOREIGN KEY ( Reserva )
        REFERENCES Reserva ( Codigo )
);

CREATE TABLE Emisor (
    Codigo   INT NOT NULL,
    Descripcion     VARCHAR(30) NOT NULL,
CONSTRAINT emisor_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Error (
    Codigo         INT NOT NULL,
    Fecha_Hora     DATE NOT NULL,
    Mensaje        VARCHAR(50) NOT NULL,
CONSTRAINT error_pk PRIMARY KEY ( Codigo )
);

CREATE TABLE Historial_Actividad (
    Codigo                 INT NOT NULL,
    Usuario	           VARCHAR(10) NOT NULL,
    Actividad   	   VARCHAR(10) NOT NULL,
CONSTRAINT historial_actividad_pk PRIMARY KEY ( Codigo ),
CONSTRAINT hist_act_act_fk FOREIGN KEY ( Actividad )
        REFERENCES Actividad ( Codigo ),
CONSTRAINT hist_act_usuario_fk FOREIGN KEY ( Usuario )
        REFERENCES Usuario ( Codigo )
);

CREATE TABLE Tarjeta (
    Codigo                  INT NOT NULL,
    Numero_Tarjeta          INT NOT NULL,
    Fecha_Exp               DATE NOT NULL,
    Usuario	            VARCHAR(10) NOT NULL,
    Emisor		    INT NOT NULL,
CONSTRAINT tarjeta_pk PRIMARY KEY ( Codigo ),
CONSTRAINT tarjeta_emisor_fk FOREIGN KEY ( Emisor )
        REFERENCES Emisor ( Codigo ),
CONSTRAINT tarjeta_usuario_fk FOREIGN KEY ( Usuario )
        REFERENCES Usuario ( Codigo )
);

----INSERT H-MANDIOLA HOTEL----


--INSERT EST_HAB
insert into Est_Hab (Codigo, Descripcion) values (1, 'Lista');
insert into Est_Hab (Codigo, Descripcion) values (2, 'Pendiente');


--INSERT ESTADO
insert into Estado (Codigo, Tipo) values (1, 'Activo');
insert into Estado (Codigo, Tipo) values (2, 'Inactivo');


--INSERT ROL
insert into Rol (Codigo, Tipo) values (4, 'Cliente');
insert into Rol (Codigo, Tipo) values (5, 'Administrador');
insert into Rol (Codigo, Tipo) values (6, 'Seguridad');
insert into Rol (Codigo, Tipo) values (7, 'Consecutivo');
insert into Rol (Codigo, Tipo) values (8, 'Mantenimiento');
insert into Rol (Codigo, Tipo) values (9, 'Consulta');


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

