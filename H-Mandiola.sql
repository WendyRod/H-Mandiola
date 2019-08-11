-- Generado por Oracle SQL Developer Data Modeler 18.1.0.082.1035
--   en:        2019-08-02 16:04:26 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE actividad (
    codigo_act                VARCHAR2(10) NOT NULL,
    nombre                    VARCHAR2(30) NOT NULL,
    descripcion               VARCHAR2(30) NOT NULL,
    dia                       CHAR(1) NOT NULL,
    horainicio                DATE NOT NULL,
    horafinal                 DATE NOT NULL,
    consecutivo_codigo_cons   NUMBER(5) NOT NULL
);

ALTER TABLE actividad ADD CONSTRAINT actividad_pk PRIMARY KEY ( codigo_act );

CREATE TABLE articulo (
    codigo_art                    NUMBER NOT NULL,
    nombre                        VARCHAR2(30) NOT NULL,
    precio                        NUMBER NOT NULL,
    tipo_articulo_codigo_tipart   NUMBER NOT NULL,
    reserva_reservaid             VARCHAR2(10) NOT NULL,
    reservaid                     VARCHAR2(10) NOT NULL
);

ALTER TABLE articulo ADD CONSTRAINT articulo_pk PRIMARY KEY ( codigo_art );

CREATE TABLE bitacora (
    codigo_bit                VARCHAR2(10) NOT NULL,
    fecha_hora                DATE NOT NULL,
    tipo                      VARCHAR2(20) NOT NULL,
    descripcion               VARCHAR2(100) NOT NULL,
    consecutivo_codigo_cons   NUMBER(5) NOT NULL
);

ALTER TABLE bitacora ADD CONSTRAINT bitacora_pk PRIMARY KEY ( codigo_bit );

CREATE TABLE bookingid (
    codigo                  NVARCHAR2(1) NOT NULL,
    reserva_reservaid       VARCHAR2(10) NOT NULL,
    habitacion_codigo_hab   VARCHAR2(10) NOT NULL,
    reservaid               VARCHAR2(10) NOT NULL
);

ALTER TABLE bookingid ADD CONSTRAINT bookingid_pk PRIMARY KEY ( codigo );

CREATE TABLE consecutivo (
    codigo_cons   NUMBER(5) NOT NULL,
    descripcion   VARCHAR2(50) NOT NULL,
    prefijo       VARCHAR2(5),
    minimo        NUMBER(5),
    maximo        NUMBER(5),
    consecutivo   VARCHAR2(5) NOT NULL
);

ALTER TABLE consecutivo ADD CONSTRAINT consecutivo_pk PRIMARY KEY ( codigo_cons );

CREATE TABLE emisor (
    codigo_emisor   NUMBER NOT NULL,
    descripcion     VARCHAR2(30) NOT NULL
);

ALTER TABLE emisor ADD CONSTRAINT emisor_pk PRIMARY KEY ( codigo_emisor );

CREATE TABLE error (
    codigo_error   NUMBER NOT NULL,
    fecha_hora     DATE NOT NULL,
    mensaje        VARCHAR2(50) NOT NULL
);

ALTER TABLE error ADD CONSTRAINT error_pk PRIMARY KEY ( codigo_error );

CREATE TABLE est_hab (
    codigo_esthab   NUMBER NOT NULL,
    descripcion     VARCHAR2(20) NOT NULL
);

ALTER TABLE est_hab ADD CONSTRAINT est_hab_pk PRIMARY KEY ( codigo_esthab );

CREATE TABLE estado (
    codigo_est   NUMBER NOT NULL,
    tipo         VARCHAR2(30) NOT NULL
);

ALTER TABLE estado ADD CONSTRAINT estado_pk PRIMARY KEY ( codigo_est );

ALTER TABLE estado ADD CONSTRAINT estado_tipo_un UNIQUE ( tipo );

CREATE TABLE habitacion (
    codigo_hab                VARCHAR2(10) NOT NULL,
    descripcion               VARCHAR2(250) NOT NULL,
    est_hab_codigo_esthab     NUMBER NOT NULL,
    precio_codigo_precio      VARCHAR2(10) NOT NULL,
    consecutivo_codigo_cons   NUMBER(5) NOT NULL
);

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( codigo_hab );

CREATE TABLE historial_actividad (
    codigo_histact         NUMBER NOT NULL,
    usuario_cedula         VARCHAR2(10) NOT NULL,
    actividad_codigo_act   VARCHAR2(10) NOT NULL
);

ALTER TABLE historial_actividad ADD CONSTRAINT historial_actividad_pk PRIMARY KEY ( codigo_histact );

CREATE TABLE precio (
    codigo_precio                   VARCHAR2(10) NOT NULL,
    tipo_habitacion_codigo_tiphab   NUMBER NOT NULL,
    precio                          NUMBER,
    consecutivo_codigo_cons         NUMBER(5) NOT NULL
);

ALTER TABLE precio ADD CONSTRAINT precio_pk PRIMARY KEY ( codigo_precio );

CREATE TABLE reserva (
    reservaid                 VARCHAR2(10) NOT NULL,
    fechaentrada              DATE NOT NULL,
    fechasalida               DATE NOT NULL,
    cantidaddias              NUMBER NOT NULL,
    codigopromocional         CHAR(1) NOT NULL,
    cantidadadultos           NUMBER NOT NULL,
    cantidadniños             NUMBER NOT NULL,
    mascota                   CHAR(1) NOT NULL,
    metodopago                CHAR(1) NOT NULL,
    precio                    NUMBER,
    usuario_cedula            VARCHAR2(10) NOT NULL,
    consecutivo_codigo_cons   NUMBER(5) NOT NULL
);

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( reservaid );

CREATE TABLE rol (
    codigo_rol   NUMBER NOT NULL,
    tipo         VARCHAR2(30) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( codigo_rol );

ALTER TABLE rol ADD CONSTRAINT rol_tipo_un UNIQUE ( tipo );

CREATE TABLE tarjeta (
    codigo_tarjeta         NUMBER NOT NULL,
    numero_tarjeta         NUMBER(16) NOT NULL,
    fechaexp               DATE NOT NULL,
    usuario_cedula         VARCHAR2(10) NOT NULL,
    emisor_codigo_emisor   NUMBER NOT NULL
);

ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_pk PRIMARY KEY ( codigo_tarjeta );

CREATE TABLE tipo_articulo (
    codigo_tipart   NUMBER NOT NULL,
    tipo            VARCHAR2(30) NOT NULL
);

ALTER TABLE tipo_articulo ADD CONSTRAINT tipo_articulo_pk PRIMARY KEY ( codigo_tipart );

ALTER TABLE tipo_articulo ADD CONSTRAINT tipo_articulo_tipo_un UNIQUE ( tipo );

CREATE TABLE tipo_habitacion (
    codigo_tiphab   NUMBER NOT NULL,
    tipo            VARCHAR2(25) NOT NULL
);

ALTER TABLE tipo_habitacion ADD CONSTRAINT tipo_habitacion_pk PRIMARY KEY ( codigo_tiphab );

CREATE TABLE usuario (
    cedula                    VARCHAR2(10) NOT NULL,
    nombre                    VARCHAR2(30) NOT NULL,
    apellido1                 VARCHAR2(30) NOT NULL,
    apellido2                 VARCHAR2(30) NOT NULL,
    email                     VARCHAR2(50) NOT NULL,
    usuario                   VARCHAR2(30) NOT NULL,
    clave                     VARCHAR2(15) NOT NULL,
    pregunta                  VARCHAR2(50),
    respuesta                 VARCHAR2(30),
    rol_codigo_rol            NUMBER NOT NULL,
    estado_codigo_est         NUMBER NOT NULL,
    consecutivo_codigo_cons   NUMBER(5) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( cedula );

ALTER TABLE usuario ADD CONSTRAINT usuario_email_un UNIQUE ( email );

ALTER TABLE usuario ADD CONSTRAINT usuario_usuario_un UNIQUE ( usuario );

ALTER TABLE actividad
    ADD CONSTRAINT actividad_consecutivo_fk FOREIGN KEY ( consecutivo_codigo_cons )
        REFERENCES consecutivo ( codigo_cons );

ALTER TABLE articulo
    ADD CONSTRAINT articulo_reserva_fk FOREIGN KEY ( reserva_reservaid )
        REFERENCES reserva ( reservaid );

ALTER TABLE articulo
    ADD CONSTRAINT articulo_tipo_articulo_fk FOREIGN KEY ( tipo_articulo_codigo_tipart )
        REFERENCES tipo_articulo ( codigo_tipart );

ALTER TABLE bitacora
    ADD CONSTRAINT bitacora_consecutivo_fk FOREIGN KEY ( consecutivo_codigo_cons )
        REFERENCES consecutivo ( codigo_cons );

ALTER TABLE bookingid
    ADD CONSTRAINT bookingid_habitacion_fk FOREIGN KEY ( habitacion_codigo_hab )
        REFERENCES habitacion ( codigo_hab );

ALTER TABLE bookingid
    ADD CONSTRAINT bookingid_reserva_fk FOREIGN KEY ( reserva_reservaid )
        REFERENCES reserva ( reservaid );

ALTER TABLE habitacion
    ADD CONSTRAINT habitacion_consecutivo_fk FOREIGN KEY ( consecutivo_codigo_cons )
        REFERENCES consecutivo ( codigo_cons );

ALTER TABLE habitacion
    ADD CONSTRAINT habitacion_est_hab_fk FOREIGN KEY ( est_hab_codigo_esthab )
        REFERENCES est_hab ( codigo_esthab );

ALTER TABLE habitacion
    ADD CONSTRAINT habitacion_precio_fk FOREIGN KEY ( precio_codigo_precio )
        REFERENCES precio ( codigo_precio );

ALTER TABLE historial_actividad
    ADD CONSTRAINT hist_act_act_fk FOREIGN KEY ( actividad_codigo_act )
        REFERENCES actividad ( codigo_act );

ALTER TABLE historial_actividad
    ADD CONSTRAINT historial_actividad_usuario_fk FOREIGN KEY ( usuario_cedula )
        REFERENCES usuario ( cedula );

ALTER TABLE precio
    ADD CONSTRAINT precio_consecutivo_fk FOREIGN KEY ( consecutivo_codigo_cons )
        REFERENCES consecutivo ( codigo_cons );

ALTER TABLE precio
    ADD CONSTRAINT precio_tipo_habitacion_fk FOREIGN KEY ( tipo_habitacion_codigo_tiphab )
        REFERENCES tipo_habitacion ( codigo_tiphab );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_consecutivo_fk FOREIGN KEY ( consecutivo_codigo_cons )
        REFERENCES consecutivo ( codigo_cons );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_usuario_fk FOREIGN KEY ( usuario_cedula )
        REFERENCES usuario ( cedula );

ALTER TABLE tarjeta
    ADD CONSTRAINT tarjeta_emisor_fk FOREIGN KEY ( emisor_codigo_emisor )
        REFERENCES emisor ( codigo_emisor );

ALTER TABLE tarjeta
    ADD CONSTRAINT tarjeta_usuario_fk FOREIGN KEY ( usuario_cedula )
        REFERENCES usuario ( cedula );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_consecutivo_fk FOREIGN KEY ( consecutivo_codigo_cons )
        REFERENCES consecutivo ( codigo_cons );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_estado_fk FOREIGN KEY ( estado_codigo_est )
        REFERENCES estado ( codigo_est );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_codigo_rol )
        REFERENCES rol ( codigo_rol );



----INSERT H-MANDIOLA HOTEL----


--INSERT EST_HAB
insert into est_hab (codigo_esthab, descripcion) values (1, 'Lista');
insert into est_hab (codigo_esthab, descripcion) values (2, 'Pendiente');


--INSERT ESTADO
insert into estado (codigo_est, tipo) values (3, 'Activo');
insert into estado (codigo_est, tipo) values (4, 'Inactivo');


--INSERT ROL
insert into rol (codigo_rol, tipo) values (5, 'Administrador');
insert into rol (codigo_rol, tipo) values (6, 'Seguridad');
insert into rol (codigo_rol, tipo) values (7, 'Consecutivo');
insert into rol (codigo_rol, tipo) values (8, 'Mantenimiento');
insert into rol (codigo_rol, tipo) values (9, 'Consulta');


--INSERT TIPO_ARTICULO
insert into tipo_articulo (codigo_tipart, tipo) values (10, 'Licor');
insert into tipo_articulo (codigo_tipart, tipo) values (11, 'Bebidas Gaseosas');
insert into tipo_articulo (codigo_tipart, tipo) values (12, 'Bebidas Naturales');
insert into tipo_articulo (codigo_tipart, tipo) values (13, 'Dulces');
insert into tipo_articulo (codigo_tipart, tipo) values (14, 'Helados');
insert into tipo_articulo (codigo_tipart, tipo) values (15, 'Flores');
insert into tipo_articulo (codigo_tipart, tipo) values (16, 'Tartas');


--INSERT TIPO_HABITACION
insert into tipo_habitacion (codigo_tiphab, tipo) values (17, 'Normal');
insert into tipo_habitacion (codigo_tiphab, tipo) values (18, 'Deluxe');
insert into tipo_habitacion (codigo_tiphab, tipo) values (19, 'Condominio');


