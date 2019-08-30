/*****************************************************
 * H-Mandiola * H-Mandiola * H-Mandiola * H-Mandiola * 
 *****************************************************/
USE [H-Mandiola];
GO

/*****************************************************
 * DROP TABLE * DROP TABLE * DROP TABLE * DROP TABLE *
 *****************************************************/

DROP TABLE IF EXISTS Bitacora;
GO
DROP TABLE IF EXISTS Error;
GO
DROP TABLE IF EXISTS Consecutivo;
GO
DROP TABLE IF EXISTS Admin;
GO
DROP TABLE IF EXISTS Tarjeta;
GO
DROP TABLE IF EXISTS Emisor;
GO
DROP TABLE IF EXISTS Historial_Actividad;
GO
DROP TABLE IF EXISTS Actividad;
GO
DROP TABLE IF EXISTS BookingID;
GO
DROP TABLE IF EXISTS Habitacion;
GO
DROP TABLE IF EXISTS Est_Hab;
GO
DROP TABLE IF EXISTS Tipo_Habitacion;
GO
DROP TABLE IF EXISTS ARTICULOS_RESERVA;
GO
DROP TABLE IF EXISTS Articulo;
GO
DROP TABLE IF EXISTS Tipo_Articulo;
GO
DROP TABLE IF EXISTS Precio;
GO
DROP TABLE IF EXISTS Reserva;
GO
DROP TABLE IF EXISTS Cliente;
GO
DROP TABLE IF EXISTS Estado;
GO

/*************************************************************
 * CREATE TABLE * CREATE TABLE * CREATE TABLE * CREATE TABLE *
 *************************************************************/

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
	CONSTRAINT Hist_act_Act_fk FOREIGN KEY ( Actividad ) REFERENCES Actividad ( Codigo ),
	CONSTRAINT Hist_Act_Usuario_fk FOREIGN KEY ( Usuario ) REFERENCES Cliente ( Codigo )
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

/*************************************************************
 * INSERTS * INSERTS * INSERTS * INSERTS * INSERTS * INSERTS *
 *************************************************************/

INSERT INTO Est_Hab (Codigo, Descripcion) VALUES (1, 'Lista');
INSERT INTO Est_Hab (Codigo, Descripcion) VALUES (2, 'Pendiente');

--INSERT ESTADO
INSERT INTO Estado (Codigo, Tipo) VALUES (1, 'Activo');
INSERT INTO Estado (Codigo, Tipo) VALUES (2, 'Inactivo');

--INSERT TIPO_ARTICULO
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (1, 'Licor');
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (2, 'Bebidas Gaseosas');
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (3, 'Bebidas Naturales');
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (4, 'Dulces');
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (5, 'Helados');
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (6, 'Flores');
INSERT INTO Tipo_Articulo (Codigo, Tipo) VALUES (7, 'Tartas');

--INSERT TIPO_HABITACION
INSERT INTO Tipo_Habitacion (Codigo, Tipo) VALUES (1, 'Normal');
INSERT INTO Tipo_Habitacion (Codigo, Tipo) VALUES (2, 'Deluxe');
INSERT INTO Tipo_Habitacion (Codigo, Tipo) VALUES (3, 'Condominio');

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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************************************
  * DROP STRORED PROCEDURES * DROP STRORED PROCEDURES *
 ******************************************************/

DROP PROCEDURE IF EXISTS [dbo].[OBTENER_ROLES];
GO

DROP PROCEDURE IF EXISTS [dbo].[ADMIN_LOGIN];
GO

DROP PROCEDURE IF EXISTS [dbo].[CLIENTE_LOGIN];
GO

DROP PROCEDURE IF EXISTS [dbo].[LLENAR_ADMIN];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_CLIENTE];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_ADMIN];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_ACTIVIDAD];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_CONSECUTIVO];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_HABITACION];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_PRECIO];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_ARTICULO];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_RESERVA];
GO

DROP PROCEDURE IF EXISTS [dbo].[EXISTE_BOOKINGID];
GO

DROP PROCEDURE IF EXISTS [dbo].[CONSULTA_BITACORA];
GO

DROP PROCEDURE IF EXISTS [dbo].[CONSULTA_ERROR];
GO

DROP PROCEDURE IF EXISTS [dbo].[CONSULTA_CLIENTEACTIVO];
GO

DROP PROCEDURE IF EXISTS [dbo].[CONSULTA_HABITACIONESLISTAS];
GO

DROP PROCEDURE IF EXISTS [dbo].[CONSULTA_PRECIO];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_ACTIVIDAD];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_ARTICULO];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_BITACORA];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_CONSECUTIVO];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_HABITACION];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_RESERVA];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_ARTICULOSRESERVA];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_BOOKINGID];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_PRECIO];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_CLIENTE];
GO

DROP PROCEDURE IF EXISTS [dbo].[INSERTA_ADMIN];
GO

DROP PROCEDURE IF EXISTS [dbo].[ELIMINA_HABITACION];
GO

DROP PROCEDURE IF EXISTS [dbo].[ELIMINA_ACTIVIDAD];
GO

DROP PROCEDURE IF EXISTS [dbo].[ELIMINA_PRECIO];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_CLIENTE_CLAVE];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_ADMIN_CLAVE];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_ADMIN_ROLES];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_CLIENTE_ESTADO];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_CONSECUTIVO];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_ACTIVIDAD];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_HABITACION];
GO

DROP PROCEDURE IF EXISTS [dbo].[ACTUALIZA_HABITACION];
GO


/*************************************************
 * OTROS * OTROS * OTROS * OTROS * OTROS * OTROS *
**************************************************/

CREATE OR ALTER PROCEDURE [dbo].[OBTENER_ROLES]
	@pCodigo    varchar(10)
AS
BEGIN
     SELECT
		Consecutivo AS Consecutivo
		,Mantenimiento AS Mantenimiento
		,Seguridad AS Seguridad
		,Consulta AS Consulta
		,Administrador AS Administrador 
	FROM
		[dbo].[Admin]
	WHERE	
		Codigo	=	@pCodigo;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ADMIN_LOGIN]
	@pUsuario	NVARCHAR(30),
	@pPassword	NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Usuario, Clave FROM [dbo].[Admin] WHERE  Usuario=@pUsuario AND Clave=@pPassword; 
END
GO

CREATE OR ALTER PROCEDURE [dbo].[CLIENTE_LOGIN]
	@pUsuario	NVARCHAR(30),
	@pPassword	NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Usuario, Clave FROM [dbo].[Cliente] WHERE  Usuario=@pUsuario AND Clave=@pPassword; 
END
GO

/****** Object:  StoredProcedure [dbo].[LLENAR_ADMIN]    Script Date: 30/08/2019 10:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALTER PROCEDURE [dbo].[LLENAR_ADMIN]
@pUsername	varchar(30)
AS



BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Usuario, Clave, Apellido1, Apellido2, Email, Administrador, Seguridad, Consecutivo, Mantenimiento, Consulta
	FROM Admin


END
GO

/*******************************************************
  * EXISTE * EXISTE * EXISTE * EXISTE * EXISTE * EXISTE *
 *******************************************************/

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_CLIENTE]
	@pUsuario	NVARCHAR(30),
	@pCorreo	NVARCHAR(50)
AS
BEGIN 
	DECLARE @result VARCHAR(10);
	SELECT @result = Codigo FROM [Cliente] WHERE Usuario LIKE @pUsuario OR Email LIKE @pCorreo;
	if @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_ADMIN]
	@pUsuario	NVARCHAR(30),
	@pCorreo	NVARCHAR(50)
AS
BEGIN 
	DECLARE @result VARCHAR(10);
	SELECT @result = Codigo FROM [Admin] WHERE Usuario LIKE @pUsuario OR Email LIKE @pCorreo;
	if @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_ACTIVIDAD]
	@pCodigo	VARCHAR(10)
AS
BEGIN 
	DECLARE @result VARCHAR(10);
	SELECT @result = Codigo FROM Actividad WHERE Codigo LIKE @pCodigo;
	if @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_CONSECUTIVO]
	@pCodigo		INT
AS
BEGIN 
	DECLARE @result INT;
	SELECT @result = Codigo FROM [Consecutivo] WHERE Codigo = @pCodigo;
	IF @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_HABITACION]
	@pCodigo		VARCHAR(10)
AS
BEGIN 
	DECLARE @result VARCHAR(10);
	SELECT @result = Codigo FROM [Habitacion] WHERE Codigo LIKE @pCodigo;
	IF @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_PRECIO]
	@pCodigo		VARCHAR(10)
AS
BEGIN 
	DECLARE @result VARCHAR(10);
	SELECT @result = Codigo FROM [Precio] WHERE Codigo LIKE @pCodigo;
	IF @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_ARTICULO]
	@pCodigo		INT
AS
BEGIN 
	DECLARE @result INT;
	SELECT @result = Codigo FROM [Articulo] WHERE Codigo = @pCodigo;
	IF @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_RESERVA]
	@pCodigo		VARCHAR(10)
AS
BEGIN 
	DECLARE @result VARCHAR(10);
	SELECT @result = Codigo FROM [Reserva] WHERE Codigo LIKE @pCodigo;
	IF @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EXISTE_BOOKINGID]
	@pCodigo		VARCHAR(7)
AS
BEGIN 
	DECLARE @result VARCHAR(7);
	SELECT @result = Codigo FROM [BookingID] WHERE Codigo LIKE @pCodigo;
	IF @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

/*********************************************
 * CONSULTA * CONSULTA * CONSULTA * CONSULTA *
 *********************************************/

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_BITACORA]
AS
BEGIN
	SELECT * 
	FROM Bitacora;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_ERROR]
AS
BEGIN
	SELECT * 
	FROM Error;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_CLIENTEACTIVO]
AS
BEGIN
	SELECT
		C.Codigo
		,CONCAT(C.Nombre,' ', C.Apellido1, ' ', C.Apellido2) AS [Nombre Completo]
		,H.Numero
	FROM
		BookingID AS B
		INNER JOIN Habitacion AS H
		ON (B.Habitacion = H.Codigo)
		INNER JOIN Reserva AS R
		ON (B.Reserva = R.Codigo)
		INNER JOIN Cliente AS C
		ON (R.Usuario = C.Codigo)
	WHERE
		C.Estado = 1 AND R.Fecha_Salida <= GETDATE();
END
GO

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_HABITACION]
AS
BEGIN
	SELECT *
	FROM [Habitacion];
END
GO

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_HABITACIONESLISTAS]
AS
BEGIN
	SELECT 
		H.Codigo
		,H.Descripcion
		,H.Numero
		,H.Tipo
		,P.Precio
	FROM Habitacion AS H
		INNER JOIN Precio AS P
		ON (H.Precio = P.Codigo)
		INNER JOIN Est_Hab AS E
		ON (E.Codigo = H.Est_Hab)
	WHERE 
		H.Est_Hab = 1;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_PRECIO]
AS
BEGIN
	SELECT *
	FROM [Precio];
END
GO

/***************************************************
 * INSERTA * INSERTA * INSERTA * INSERTA * INSERTA *
 ***************************************************/

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_ACTIVIDAD]
	@pNombre VARCHAR (30), 	
	@pDescripcion VARCHAR(30)
AS
BEGIN
	DECLARE @pCodigo VARCHAR (10);
	SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
						CAST([Consecutivo] AS VARCHAR(5))
						FROM [dbo].[Consecutivo]
						WHERE [Descripcion] = 'Actividad';

	INSERT INTO dbo.Actividad (Codigo,Nombre,Descripcion)
	VALUES (@pCodigo, @pNombre, @pDescripcion);
			
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Actividad';
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_ARTICULO]
	@pNombre	VARCHAR(30)
	,@pTipo		INT
	,@pPrecio	VARCHAR(10)
AS
BEGIN
	INSERT INTO [Articulo] VALUES (@pNombre, @pTipo, @pPrecio);
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_BITACORA]
	@pTipo VARCHAR(30),
	@pDescripcion VARCHAR(100)
AS
BEGIN
	DECLARE @pCodigo VARCHAR (10);
	SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
						CAST([Consecutivo] AS VARCHAR(5))
						FROM [dbo].[Consecutivo]
						WHERE [Descripcion] = 'Bitácora';
	INSERT INTO dbo.Bitacora(Codigo,Fecha_Hora, Tipo,Descripcion)
	VALUES (@pCodigo, getdate(), @pTipo, @pDescripcion);
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Bitácora';
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_CONSECUTIVO]
	@pCodigo		INT,
	@pDescripcion	VARCHAR(50), 
	@pConsecutivo	VARCHAR(5),
	@pPoseePrefijo	BIT,	
	@pPrefijo		VARCHAR(5),
	@pPoseeRango	BIT,
	@pMinimo		INT,
	@pMaximo		INT
AS
BEGIN
	INSERT INTO [dbo].[Consecutivo] (Codigo, Descripcion, Consecutivo, PoseePrefijo, Prefijo, PoseeRango, Minimo, Maximo)
	VALUES (@pDescripcion,
			@pConsecutivo,
			@pCodigo,
			@pPoseePrefijo,
			@pPrefijo,
			@pPoseeRango,
			@pMinimo,
			@pMaximo);
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_ERROR]
	@pFecha_hora DATETIME, 	
	@pMensaje VARCHAR(50)
AS
BEGIN

	INSERT INTO dbo.Error(Fecha_Hora, Mensaje)
	VALUES (getdate()
			,@pMensaje);
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_HABITACION]
	@pNumero			INT, 	
	@pDescripcion		VARCHAR(250),
	@pEst_Hab			INT,
	@pPrecio			VARCHAR(10),
	@pTipo				INT
AS
BEGIN
	-- Se le asigna un codigo.
	DECLARE @pCodigo	VARCHAR (10);
	SELECT @pCodigo =	CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
						CAST([Consecutivo] AS VARCHAR(5))
						FROM [dbo].[Consecutivo]
						WHERE [Descripcion] = 'Habitación';
	-- Se inserta el Habitacion.
	INSERT 
		INTO Habitacion
			(Codigo
			,Numero
			,Descripcion
			,Est_Hab
			,Precio
			,Tipo)
		VALUES
			(@pCodigo
			,@pNumero
			,@pDescripcion
			,@pEst_Hab
			,@pPrecio
			,@pTipo);
	-- Se actualiza el consecutivo.					
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Habitación';
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_RESERVA]
	@pFecha_Entrada			date,
	@pFecha_Salida			date, 		
	@pCantidad_Dias			INT,
	@pCodigo_Promocional	BIT,
	@pCantidad_Adultos		INT,
	@pCantidad_Niños		INT,
	@pMascota				BIT,
	@pMetodo_Pago			NVARCHAR(50),
	@pPrecio				INT,
	@pUsuario				VARCHAR(10)
AS
BEGIN
	-- Se le asigna un codigo.
	DECLARE @pCodigo VARCHAR(10);
	SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
						CAST([Consecutivo] AS VARCHAR(5))
						FROM [dbo].[Consecutivo]
						WHERE [Descripcion] = 'Reserva';
	-- Se inserta el Reserva.
	INSERT 
		INTO Reserva
		(Codigo
		,Fecha_Entrada
		,Fecha_Salida
		,Cantidad_Dias
		,Codigo_Promocional
		,Cantidad_Adultos
		,Cantidad_Niños
		,Mascota
		,Metodo_Pago
		,Precio,Usuario)
	VALUES 
		(@pCodigo
		,convert(date,'DD/MM/YYYY')
		,convert(date,'DD/MM/YYYY')
		,@pCantidad_Dias
		,@pCodigo_Promocional
		,@pCantidad_Adultos
		,@pCantidad_Niños
		,@pMascota
		,@pMetodo_Pago
		,@pPrecio
		,@pUsuario);
	-- Se actualiza el consecutivo.
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Reserva'
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_ARTICULOSRESERVA]
	@pCantidad		INT,
	@pArticulo		INT,
	@pReserva		VARCHAR(10)
AS
BEGIN
	INSERT
		INTO	ARTICULOS_RESERVA
	VALUES
		(@pCantidad
		,@pArticulo
		,@pReserva);
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_BOOKINGID]
	@pHabitacion		varchar(10)
	,@pReserva			varchar(10)
AS
BEGIN
	/* Codigo */
	DECLARE @r			varchar(7);
	DECLARE @Resultado	varchar(7);
	DECLARE @Valido		BIT = 0;
	DECLARE @existe		INT;

	WHILE (@Valido = 0)
		BEGIN

			SELECT @r = coalesce(@r, '') + n
			FROM (SELECT top 7 
			CHAR(number) n FROM
			master..spt_values
			WHERE type = 'P' AND 
			(number between ascii(0) and ascii(9)
			or number between ascii('A') and ascii('Z'))
			ORDER BY NEWID()) a;

			EXEC	@existe	 =	[dbo].[EXISTE_BOOKINGID] @pCodigo = @r;

			IF	@existe = 0
				BEGIN
					SET @Valido = 1;
					SET @Resultado = @r;
				END
			ELSE
				BEGIN
						SET @Valido = 0;
				END
		END

		INSERT
			INTO BookingID
		VALUES
			(@Resultado
			,@pHabitacion
			,@pReserva);
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_PRECIO]
	@pPrecio		INT
AS
BEGIN
	-- Se le asigna un codigo.
	DECLARE @pCodigo VARCHAR(10);
	SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
						CAST([Consecutivo] AS VARCHAR(5))
						FROM [dbo].[Consecutivo]
						WHERE [Descripcion] = 'Precio';
	INSERT 
		INTO [dbo].[Precio]
	VALUES
		(@pCodigo
		,@pPrecio);
	-- Se actualiza el consecutivo.
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Precio';
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_CLIENTE]
		@pNombre	NVARCHAR(30),
		@pApellido1 NVARCHAR(30),
		@pApellido2 NVARCHAR(30),
		@pCorreo	NVARCHAR(50),
		@pUsuario	NVARCHAR(30),
		@pClave		NVARCHAR(15),
		@pPregunta	NVARCHAR(50),
		@pRespuesta NVARCHAR(30),
		@pEstado	INT
AS
BEGIN
	DECLARE @pCodigo	VARCHAR(10);
	DECLARE @existe		INT;
	EXEC	@existe	 =	[dbo].[EXISTE_CLIENTE] @pUsuario, @pCorreo;

	IF	@existe	=	1
		BEGIN
			RETURN 0
		END
	ELSE
		BEGIN
			-- Se le asigna un codigo.
			SELECT @pCodigo =	CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) + 
								CAST([Consecutivo] AS VARCHAR(5))
								FROM [dbo].[Consecutivo]
								WHERE [Descripcion] = 'Cliente';
			-- Se inserta el cliente.
			INSERT INTO [dbo].[Cliente]
					([Codigo], [Nombre], [Apellido1], [Apellido2], [Email], [Usuario], [Clave], [Pregunta], [Respuesta], [Estado])
				VALUES
          			(@pCodigo, @pNombre, @pApellido1, @pApellido2, LOWER(@pCorreo), @pUsuario, @pClave, @pPregunta, @pRespuesta, @pEstado);

			-- Se actualiza el consecutivo.
			UPDATE
				[dbo].[Consecutivo]
			SET	
				[Consecutivo]	=	[Consecutivo] + 1
			WHERE
				[Descripcion]	=	'Cliente';

			RETURN 1;
		END	
END
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERTA_ADMIN]
	@pNombre NVARCHAR(30),
	@pApellido1 NVARCHAR(30),
	@pApellido2 NVARCHAR(30),
	@pCorreo NVARCHAR(50),
	@pUsuario NVARCHAR(30),
	@pClave NVARCHAR(30),
	@pAdministrador BIT,
	@pSeguridad BIT,
    @pConsecutivo BIT,
    @pMantenimiento BIT,
    @pConsulta BIT
AS
BEGIN
	DECLARE @pCodigo	VARCHAR(10);
	DECLARE @existe		INT	=	-1;
	EXEC	@existe	 =	[dbo].[EXISTE_ADMIN] @pUsuario, @pCorreo;

	IF	@existe	=	1
		BEGIN
			RETURN 0
		END
	ELSE
		BEGIN
			-- Se le asigna un codigo.
			SELECT @pCodigo =	CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) + 
								CAST([Consecutivo] AS VARCHAR(5))
								FROM [dbo].[Consecutivo]
								WHERE [Descripcion] = 'Usuario';
			-- Se inserta el admin.
			INSERT INTO [dbo].[Admin]
				   ([Codigo]
				   ,[Nombre]
				   ,[Apellido1]
				   ,[Apellido2]
				   ,[Email]
				   ,[Usuario]
				   ,[Clave]
				   ,[Administrador]
				   ,[Seguridad]
				   ,[Consecutivo]
				   ,[Mantenimiento]
				   ,[Consulta])
			 VALUES
          			(@pCodigo
					,@pNombre
					,@pApellido1
					,@pApellido2
					,LOWER(@pCorreo)
					,@pUsuario
					,@pClave
					,@pAdministrador
					,@pSeguridad
					,@pConsecutivo
					,@pMantenimiento
					,@pConsulta);
			-- Se actualiza el consecutivo.
			UPDATE
				[dbo].[Consecutivo]
			SET	
				[Consecutivo]	=	[Consecutivo] + 1
			WHERE
				[Descripcion]	=	'Usuario';

			RETURN 1;
		END	
END
GO

/***************************************************
 * ELIMINA * ELIMINA * ELIMINA * ELIMINA * ELIMINA *
 ***************************************************/

CREATE OR ALTER PROCEDURE [dbo].[ELIMINA_HABITACION]
	@pCodigo		VARCHAR(10)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_HABITACION] @pCodigo;
	IF	@result = 1
		BEGIN
			DELETE 
				FROM [dbo].[Habitacion]
				WHERE Codigo LIKE @pCodigo;
				RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ELIMINA_ACTIVIDAD]
	@pCodigo		VARCHAR(10)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_ACTIVIDAD] @pCodigo;
	IF	@result = 1
		BEGIN
			DELETE 
				FROM [dbo].[Precio]
				WHERE Codigo LIKE @pCodigo;
				RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ELIMINA_PRECIO]
	@pCodigo		VARCHAR(10)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_PRECIO] @pCodigo;
	IF	@result = 1
		BEGIN
			DELETE 
				FROM [dbo].[Precio]
				WHERE Codigo LIKE @pCodigo;
				RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

/*************************************************
 * ACTUALIZA * ACTUALIZA * ACTUALIZA * ACTUALIZA *
 *************************************************/

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_CLIENTE_CLAVE]
	@pUsuario			NVARCHAR(30)
	,@pCorreo			NVARCHAR(50)
	,@pNuevaClave		NVARCHAR(30)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_CLIENTE] @pUsuario, @pCorreo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Cliente]
			SET
				Clave = @pNuevaClave
			WHERE
				Usuario = @pUsuario;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END 
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_ADMIN_CLAVE]
	@pUsuario			NVARCHAR(30)
	,@pCorreo			NVARCHAR(50)
	,@pNuevaClave		NVARCHAR(30)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_ADMIN] @pUsuario, @pCorreo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Admin]
			SET
				Clave = @pNuevaClave
			WHERE
				Usuario = @pUsuario;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END 
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_ADMIN_ROLES]    Script Date: 30/08/2019 10:33:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE or ALTER PROCEDURE [dbo].[ACTUALIZA_ADMIN_ROLES]
(
  @pAdministrador   BIT,
  @pConsecutivo  BIT,
  @pConsulta BIT,
  @pMantenimiento  BIT,
  @pSeguridad BIT,
  @pCodigo VARCHAR(10)
)

AS


Update Admin
SET
		Administrador = @pAdministrador,
		Consecutivo = @pConsecutivo,
		Consulta = @pConsulta,
		Mantenimiento = @pMantenimiento,
		Seguridad = @pSeguridad

Where Codigo = @pCodigo


GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_CLIENTE_ESTADO]
	@pUsuario		NVARCHAR(30)
	,@pCorreo			NVARCHAR(50)
	,@pEstado		NVARCHAR(30)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_CLIENTE] @pUsuario, @pCorreo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Cliente]
			SET
				Estado = @pEstado
			WHERE
				Usuario = @pUsuario;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END 
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_CONSECUTIVO]	
	@pCodigo		INT,
	@pDescripcion	NVARCHAR(50),
	@pConsecutivo	VARCHAR(5),
	@pPoseePrefijo	BIT,	
	@pPrefijo		VARCHAR(5),
	@pPoseeRango	BIT,
	@pMinimo		INT,
	@pMaximo		INT
AS
BEGIN
DECLARE @result INT;
	EXEC @result = [EXISTE_CONSECUTIVO] @pCodigo;
	IF	@result = 1
		BEGIN
			DECLARE @MAX_Anterior INT;
			SELECT @MAX_Anterior = Maximo FROM Consecutivo WHERE Codigo = @pCodigo;
			IF @MAX_Anterior <= @pMaximo
				BEGIN
					UPDATE 
						[Consecutivo]
					SET	
						Descripcion		= @pDescripcion,
						Consecutivo		= @pConsecutivo,
						PoseePrefijo	= @pPoseePrefijo,
						Prefijo			= @pPrefijo,
						PoseeRango		= @pPoseeRango,
						Minimo			= @pMinimo,
						Maximo			= @pMaximo
					WHERE 
						Codigo = @pCodigo;
					RETURN 1;
				END
			ELSE
				BEGIN
					RETURN 0;
				END
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_ACTIVIDAD]
	@pCodigo		VARCHAR(10)
	,@pNombre		VARCHAR(30)
	,@pDesc			VARCHAR(30)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_ACTIVIDAD] @pCodigo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Actividad]
			SET
				Nombre = @pNombre
				,Descripcion = @pDesc
			WHERE
				Codigo LIKE @pCodigo;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_HABITACION]
	@pCodigo		VARCHAR(10)
	,@pNumero		VARCHAR(30)
	,@pDesc			VARCHAR(30)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_HABITACION] @pCodigo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Habitacion]
			SET
				Numero = @pNumero
				,Descripcion = @pDesc
			WHERE
				Codigo LIKE @pCodigo;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_HABITACION]
	@pCodigo		VARCHAR(10)
	,@pNumero		VARCHAR(30)
	,@pDesc			VARCHAR(30)
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_HABITACION] @pCodigo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Habitacion]
			SET
				Numero = @pNumero
				,Descripcion = @pDesc
			WHERE
				Codigo LIKE @pCodigo;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_ROLES]
	@pCodigo				VARCHAR(10)
	,@pCorreo				VARCHAR(50)
	,@pAdministrador		BIT
    ,@pSeguridad			BIT
    ,@pConsecutivo			BIT
    ,@pMantenimiento		BIT
    ,@pConsulta				BIT
AS
BEGIN
	DECLARE @result INT;
	EXEC @result = [EXISTE_ADMIN] @pCodigo, @pCorreo;
	IF	@result = 1
		BEGIN
			UPDATE
				[Admin]
			SET
				Administrador	=	@pAdministrador
				,Seguridad		=	@pSeguridad
				,Consecutivo	=	@pConsecutivo
				,Mantenimiento	=	@pMantenimiento
				,Consulta		=	@pConsulta
			WHERE
				Codigo LIKE @pCodigo;
			RETURN 1;
		END
	ELSE
		BEGIN
			RETURN 0;
		END
END
GO

/*******************************************************
 * VISTAS * VISTAS * VISTAS * VISTAS * VISTAS * VISTAS *
 *******************************************************/

 DROP VIEW IF EXISTS [dbo].[VIEW_PRECIOS]
 GO

 CREATE OR ALTER VIEW [dbo].[VIEW_PRECIOS]
 AS
 SELECT	
	P.Codigo AS [Codigo Precio]
	,P.Precio
	,CASE
		WHEN H.Precio LIKE P.Codigo THEN CONCAT('Habitacion: #', H.Numero, ', Tipo: ', TH.Tipo)
		WHEN A.Precio LIKE P.Codigo THEN CONCAT('Articulo: ', A.Nombre, ', Tipo: ', TA.Tipo)
		ELSE ''
	END AS [Descripcion]
 FROM 
	Precio AS P
	LEFT JOIN
	Habitacion AS H
	ON (P.Codigo = H.Precio)
	LEFT JOIN 
	Tipo_Habitacion AS TH
	ON(H.Tipo = TH.Codigo)
	LEFT JOIN
	Articulo AS A
	ON (A.Precio = P.Codigo)
	LEFT JOIN 
	Tipo_Articulo AS TA
	ON(A.Tipo_Articulo = TA.Codigo)
WHERE
	(H.Precio IS NOT NULL AND A.Precio IS NULL) OR (H.Precio IS NULL AND A.Precio IS NOT NULL);
GO

/*****************************************************
 * H-Mandiola * H-Mandiola * H-Mandiola * H-Mandiola *
 *****************************************************/