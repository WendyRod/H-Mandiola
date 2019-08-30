USE [H-Mandiola]
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_ACTIVIDAD]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 * Procedimiento que modifia la información de una actividad.
 */
CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_ACTIVIDAD]
		@pCodigo		VARCHAR(10),
		@pNombre		VARCHAR(30),
		@pDescripcion	VARCHAR(30)
AS
BEGIN
	UPDATE 
		[dbo].[Actividad]
	SET 
	    Nombre		=	ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion)
	WHERE
		Codigo	=	@pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_ARTICULO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 * Procedimiento que modifia la información de una actividad.
 */
CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_ARTICULO]
		@pCodigo	INT,
		@pNombre	VARCHAR(30),
		@pPrecio	INT
AS
BEGIN
	UPDATE
		[dbo].[Articulo]
	SET 
	    Nombre	=	ENCRYPTBYPASSPHRASE('12345',@pNombre),
		Precio	=	@pPrecio
	WHERE
		Codigo	=	@pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_BITACORA]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_BITACORA]
		@pCodigo		VARCHAR(10), 	
		@pFecha_hora	DATETIME, 	
		@pTipo			VARCHAR(30),	
		@pDescripcion	VARCHAR(100)
AS
BEGIN
	UPDATE 
		[dbo].[Bitacora]
	SET	
	    Fecha_Hora	=	@pFecha_hora,
	    Tipo		=	ENCRYPTBYPASSPHRASE('12345',@pTipo),
		Descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion)
	WHERE 
		Codigo		=	@pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_HABITACION]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_HABITACION]
		@pCodigo		VARCHAR(10),
		@pNumero		INT,
		@pDescripcion	VARCHAR(250),
		@pEstado		INT,
		@pPrecio		INT
AS
BEGIN
	UPDATE 
		[dbo].[Habitacion]
	SET 
		Numero		=	@pNumero,
	    Descripcion	=	ENCRYPTBYPASSPHRASE('12345', @pDescripcion),
	    Est_Hab		=	@pEstado,
		Precio		=	@pPrecio
	WHERE
		Codigo		=	@pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_PRECIO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_PRECIO]
		@pCodigo			VARCHAR(10),
		@pTipo_habitacion	INT,
		@pPrecio			INT
AS
BEGIN
	UPDATE 
		[dbo].[Precio]
	SET 
	    Tipo_Habitacion	=	@pTipo_habitacion,
	    Precio			=	@pPrecio
	WHERE 
		Codigo			=	@pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_USUARIO_CLIENTE]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_USUARIO_CLIENTE]
		@pCodigo	VARCHAR(10),
		@pNombre	VARCHAR(30),
		@pApellido1 VARCHAR(30),
		@pApellido2 VARCHAR(30),
		@pCorreo	VARCHAR(50),
		@pUsuario	VARCHAR(30),
		@pClave		VARCHAR(30),
		@pPregunta	VARCHAR(50),
		@pRespuesta VARCHAR(30),
		@pEstado	VARCHAR(30)
AS
BEGIN
	UPDATE 
		[dbo].[Usuario_Cliente]
	SET 
		Usuario		=	ENCRYPTBYPASSPHRASE('12345',@pUsuario),
	    Clave		=	ENCRYPTBYPASSPHRASE('12345',@pClave),
        Email		=	ENCRYPTBYPASSPHRASE('12345',@pCorreo),
	    Pregunta	=	ENCRYPTBYPASSPHRASE('12345',@pPregunta),
	    Respuesta	=	ENCRYPTBYPASSPHRASE('12345',@pRespuesta),
	    Nombre		=	ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Apellido1	=	ENCRYPTBYPASSPHRASE('12345',@pApellido1),
	    Apellido2	=	ENCRYPTBYPASSPHRASE('12345',@pApellido2),
		Estado		=	@pEstado
	WHERE 
		Codigo		=	@pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_USUARIO_ADMIN]    Script Date: 28/8/2019 12:25:26 ******/
CREATE OR ALTER PROCEDURE [dbo].[ACTUALIZA_USUARIO_ADMIN]
		@pCodigo		VARCHAR(10),
		@pNombre		VARCHAR(30),
		@pApellido1		VARCHAR(30),
		@pApellido2		VARCHAR(30),
		@pCorreo		VARCHAR(50),
		@pUsuario		VARCHAR(30),
		@pClave			VARCHAR(30),
		@pAdministrador	BIT NULL,
		@pSeguridad		BIT NULL,
		@pConsecutivo	BIT NULL,
		@pMantenimiento	BIT NULL,
		@pConsulta		BIT NULL
AS
BEGIN
	UPDATE 
		[dbo].[Usuario_Admin]
	SET 
		Usuario			= ENCRYPTBYPASSPHRASE('12345',@pUsuario),
	    Clave			= ENCRYPTBYPASSPHRASE('12345',@pClave),
        Email			= ENCRYPTBYPASSPHRASE('12345',@pCorreo),
	    Nombre			= ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Apellido1		= ENCRYPTBYPASSPHRASE('12345',@pApellido1),
	    Apellido2		= ENCRYPTBYPASSPHRASE('12345',@pApellido2),
		Administrador	= @pAdministrador,
		Seguridad		= @pSeguridad,
		Consecutivo		= @pConsecutivo,
		Mantenimiento	= @pMantenimiento,
		Consulta		= @pConsulta
	WHERE
		Codigo			= @pCodigo;
END
GO

/****** Object:  StoredProcedure [dbo].[CAMBIO_PASS_CLIENTE]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[CAMBIO_PASS_CLIENTE]
	@pUsername	NVARCHAR(30),
	@pPassword	NVARCHAR(30)
AS
BEGIN
	UPDATE
		[dbo].[Usuario_Cliente]
	SET
		@pPassword	=	Clave
	WHERE
		@pUsername	=	Usuario;
END
GO

/****** Object:  StoredProcedure [dbo].[ACTUALIZA_USUARIO_ADMIN]    Script Date: 28/8/2019 12:25:26 ******/
CREATE OR ALTER PROCEDURE [dbo].[CAMBIO_PASS_ADMIN]
	@pUsername	NVARCHAR(30),
	@pPassword	NVARCHAR(30)
AS
BEGIN
	UPDATE
		[dbo].[Usuario_Admin]
	SET	
		@pPassword	=	Clave
	WHERE
		@pUsername	=	Usuario;
END
GO

/****** Object:  StoredProcedure [dbo].[EXISTE_CLIENTE]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[EXISTE_CLIENTE]
	@pUsuario	NVARCHAR(30),
	@pCorreo	NVARCHAR(50)
AS
BEGIN 
	DECLARE @result INT;
	SELECT @result = Codigo FROM [Usuario_Cliente] WHERE Usuario LIKE @pUsuario OR Email LIKE @pCorreo;
	if @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO

/****** Object:  StoredProcedure [dbo].[EXISTE_ADMIN]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[EXISTE_ADMIN]
	@pUsuario	NVARCHAR(30),
	@pCorreo	NVARCHAR(50)
AS
BEGIN 
	DECLARE @result INT;
	SELECT @result = Codigo FROM [Usuario_Admin] WHERE Usuario LIKE @pUsuario OR Email LIKE @pCorreo;
	if @@ROWCOUNT >=1
		return 1;
	return 0;
END;
GO


/****** Object:  StoredProcedure [dbo].[CLIENTE_REGISTRO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[CLIENTE_REGISTRO]
		@pNombre	NVARCHAR(30),
		@pApellido1 NVARCHAR(30),
		@pApellido2 NVARCHAR(30),
		@pCorreo	NVARCHAR(50),
		@pUsuario	NVARCHAR(30),
		@pClave		NVARCHAR(15),
		@pPregunta	NVARCHAR(50),
		@pRespuesta NVARCHAR(30),
		@pEstado	NVARCHAR(30)
AS
BEGIN
	DECLARE @pCodigo	VARCHAR(10);
	DECLARE @existe		INT	=	-1;
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
			INSERT INTO [dbo].[Usuario_Cliente]
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

/****** Object:  StoredProcedure [dbo].[ADMIN_REGISTRO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[ADMIN_REGISTRO]
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
			INSERT INTO [dbo].[Usuario_Admin]
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

/****** Object:  StoredProcedure [dbo].[INSERT_ARTICULO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[INSERT_ARTICULO]
    @pNombre                        VARCHAR(30),
    @pPrecio                        INT,
    @pTipo_Articulo                 INT
AS
BEGIN
	DECLARE @pCodigoPrecio	VARCHAR(10);
	-- Se le asigna un codigo.
	SELECT @pCodigoPrecio =	CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) + 
							CAST([Consecutivo] AS VARCHAR(5))
							FROM [dbo].[Consecutivo]
							WHERE [Descripcion] = 'Precio';
	-- Se inserta el cliente.
	INSERT INTO [dbo].[Articulo]
		VALUES
          	(@pNombre, @pPrecio, @pTipo_Articulo);

	-- Se actualiza el consecutivo.
	UPDATE
		[dbo].[Consecutivo]
	SET	
		[Consecutivo]	=	[Consecutivo] + 1
	WHERE
		[Descripcion]	=	'Articulo';	
END
GO


/****** Object:  StoredProcedure [dbo].[CONSULTA_ACTIVIDAD]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[CONSULTA_ACTIVIDAD]
	--@pCodigo INT
AS
BEGIN
	SELECT *
		/*dbo.Actividad.Codigo,
		CONVERT(VARCHAR(30), DECRYPTBYPASSPHRASE('12345',Nombre)) as Nombre,
		CONVERT(VARCHAR(30), DECRYPTBYPASSPHRASE('12345', Descripcion)) as Descripcion,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Dia)) as Dia,
		Horainicio, Horafinal*/

	FROM dbo.Actividad
	--WHERE dbo.Actividad.Codigo = @pCodigo

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ARTICULO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[CONSULTA_ARTICULO]
	--@pCodigo INT

AS

BEGIN

	SELECT *
		/*dbo.Articulo.Codigo,
		CONVERT(VARCHAR(30), DECRYPTBYPASSPHRASE('12345',Nombre)) as Nombre,
		CONVERT(VARCHAR(30), DECRYPTBYPASSPHRASE('12345', Reserva)) as Reservaid,
		Precio*/
	FROM dbo.Articulo
	--WHERE dbo.Articulo.Codigo = @pCodigo

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_BITACORA]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER    PROCEDURE [dbo].[CONSULTA_BITACORA]
	--@pCodigo_bit INT 	
AS
BEGIN
	SELECT * 
		--dbo.bitacora.codigo_bit,
		--fecha_hora,
		--CONVERT(VARCHAR(20),	DECRYPTBYPASSPHRASE('12345',tipo)) as tipo,
		--CONVERT(VARCHAR(100),	DECRYPTBYPASSPHRASE('12345',descripcion)) as descripcion
	
	FROM dbo.Bitacora
	--WHERE dbo.bitacora.codigo_bit = @pCodigo_bit

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_CONSECUTIVO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[CONSULTA_CONSECUTIVO]
	--@pCodigo INT	
AS
BEGIN
	SELECT *
		/*[dbo].[Consecutivo].Codigo,
		CONVERT(VARCHAR(50), DECRYPTBYPASSPHRASE('12345',Descripcion)) as Descripcion,
		Prefijo,
		Minimo,
		Maximo*/
	FROM dbo.Consecutivo
	--WHERE dbo.Consecutivo.Consecutivo = @pCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ERROR]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[CONSULTA_ERROR]
	--@codigo Int	
AS
BEGIN
	SELECT * 
		--dbo.error.codigo_error,
		--fecha_hora,
		--CONVERT(VARCHAR(50), DECRYPTBYPASSPHRASE('12345',mensaje)) as mensaje
	FROM dbo.Error;
	--WHERE dbo.error.codigo_error = @codigo
END
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_HABITACION]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[CONSULTA_HABITACION]
	--@pCodigo_hab INT
AS
BEGIN
	SELECT *
		/*dbo.habitacion.codigo_hab,
		CONVERT(NVARCHAR(100), DECRYPTBYPASSPHRASE('12345', descripcion)) as descripcion,
		est_hab_codigo_esthab,
		precio_codigo_precio*/
	FROM dbo.Habitacion;
	--WHERE dbo.habitacion.codigo_hab = @pCodigo_hab

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_PRECIO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[CONSULTA_PRECIO]
	--@pCodigo INT
AS
BEGIN
	SELECT *
		/*dbo.Precio.Codigo,
		Tipo_Habitacion,
		Precio*/
	FROM dbo.Precio
	--WHERE dbo.Precio.Codigo = @pCodigo

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_RESERVA]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[CONSULTA_RESERVA]
	--@pReserva INT
AS
BEGIN
	SELECT *
		/*dbo.Reserva.Codigo,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Codigo_Promocional)) as "Codigo Promocional",
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Mascota)) as Mascota,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Metodo_Pago)) as Metodopago,
		Fecha_Entrada, Fecha_Salida, Cantidad_Adultos, Cantidad_Adultos, Cantidad_Niños, Precio*/
	FROM dbo.Reserva
	--WHERE dbo.Reserva.Codigo = @pReserva

END
GO

/****** Object:  StoredProcedure [dbo].[CONSULTA_USUARIO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[CONSULTA_CLIENTE]
	
	--@pCorreo VARCHAR(50)
AS
BEGIN
	SELECT *
		/*dbo.Usuario.Email,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Usuario)) as Usuario,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Clave)) as Contrasena,
		CONVERT(VARCHAR(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Pregunta)) as Pregunta_seguridad,
		CONVERT(VARCHAR(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Respuesta)) as Respuesta_seguridad,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Nombre)) as Nombre,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido1)) as Primer_apellido,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido2)) as Segundo_apellido,
		Rol, Estado*/
	FROM dbo.Usuario_Cliente
	--WHERE dbo.Usuario.Email= @pCorreo

END

GO
CREATE OR ALTER     PROCEDURE [dbo].[CONSULTA_ADMIN]
	
	--@pCorreo VARCHAR(50)
AS
BEGIN
	SELECT *
		/*dbo.Usuario.Email,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Usuario)) as Usuario,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Clave)) as Contrasena,
		CONVERT(VARCHAR(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Pregunta)) as Pregunta_seguridad,
		CONVERT(VARCHAR(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Respuesta)) as Respuesta_seguridad,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Nombre)) as Nombre,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido1)) as Primer_apellido,
		CONVERT(VARCHAR(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido2)) as Segundo_apellido,
		Rol, Estado*/
	FROM dbo.Usuario_Admin
	--WHERE dbo.Usuario.Email= @pCorreo

END


GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_ACTIVIDAD]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[ELIMINA_ACTIVIDAD]
(
	@pCodigo VARCHAR(10),
	@pNombre VARCHAR(30),
	@pDescripcion VARCHAR(30)
)
AS
BEGIN
DELETE from dbo.Actividad
 WHERE 	    @pCodigo = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_ARTICULO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[ELIMINA_ARTICULO]
(
	@pCodigo INT,
	@pNombre VARCHAR(30),
	@pPrecio INT,
	@pTipo_Articulo INT
)
AS

BEGIN

DELETE from dbo.Articulo
 WHERE 	    @pCodigo = Codigo

END
GO

/****** Object:  StoredProcedure [dbo].[ELIMINA_BITACORA]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[ELIMINA_BITACORA]
	@pCodigo VARCHAR(10), 	
	@pFecha_hora DATETIME, 	
	@pTipo VARCHAR(30),	
	@pDescripcion VARCHAR(100)
AS
BEGIN
	DELETE FROM dbo.Bitacora
	WHERE @pCodigo = Codigo
END
GO

/****** Object:  StoredProcedure [dbo].[ELIMINA_CONSECUTIVO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[ELIMINA_CONSECUTIVO]
	@pCodigo INT,
	@pDescripcion VARCHAR(50), 	
	@pConsecutivo INT,
	@pPoseePrefijo bit,
	@pPrefijo VARCHAR(5),
	@pPoseeRango bit,
	@pMinimo INT,
	@pMaximo INT
AS
BEGIN
DELETE from dbo.Consecutivo
 WHERE 	    @pCodigo = Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_ERROR]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   PROCEDURE [dbo].[ELIMINA_ERROR]
(	
	@pCodigo INT, 
	@pFecha_hora dateTime, 	
	@pMensaje VARCHAR(50)
)
AS
BEGIN
DELETE from dbo.Error
 WHERE 	    @pCodigo = Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_HABITACION]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER    PROCEDURE [dbo].[ELIMINA_HABITACION]
(
	@pCodigo VARCHAR(10),
	@pNumero INT,
	@pDescripcion VARCHAR(250),
	@pEstado INT,
	@pPrecio VARCHAR(10)
)
AS

BEGIN

DELETE from dbo.Habitacion
 WHERE 	    @pCodigo = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_PRECIO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [dbo].[ELIMINA_PRECIO]
(
	@pCodigo VARCHAR(10),
	@pTipo_habitacion INT,
	@pPrecio INT
)

AS

BEGIN

DELETE from dbo.Precio
 WHERE 	    @pCodigo = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_RESERVA]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER    PROCEDURE [dbo].[ELIMINA_RESERVA]
(
	@pCodigo VARCHAR(10),
	@pFechaentrada date,
	@pFechasalida date,
	@pCantidaddias INT,
	@pCodigopromocional char(1),
	@pCantidadultos INT,
	@pCantidadniños INT,
	@pMascota char(1),
	@pMetodopago char(1),
	@pPrecio INT,
	@pUsuario VARCHAR(10)
)
AS

BEGIN

DELETE from dbo.Reserva
 WHERE 	    @pCodigo = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_CLIENTE]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER    PROCEDURE [dbo].[ELIMINA_CLIENTE]
	@pCodigo VARCHAR(10)
AS
BEGIN

	DELETE 
		FROM 
			[dbo].[Usuario_Cliente]
		WHERE
			@pCodigo = Codigo;
END
GO

/****** Object:  StoredProcedure [dbo].[ELIMINA_ADMIN]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER    PROCEDURE [dbo].[ELIMINA_ADMIN]
	@pCodigo VARCHAR(10)
AS
BEGIN
	DELETE 
		FROM 
			[dbo].[Usuario_Admin]
		WHERE
			@pCodigo = Codigo;
END
GO

/****** Object:  StoredProcedure [dbo].[INSERTA_ACTIVIDAD]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[INSERTA_ACTIVIDAD]
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
			--ENCRYPTBYPASSPHRASE('12345',@pNombre),
			--ENCRYPTBYPASSPHRASE('12345',@pDescripcion))
			
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Actividad';
END
GO

/****** Object:  StoredProcedure [dbo].[INSERTA_BITACORA]    Script Date: 25/8/2019 22:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER  PROCEDURE [dbo].[INSERTA_BITACORA]
	@pTipo VARCHAR(30),
	@pDescripcion VARCHAR(100)
AS
BEGIN
	DECLARE @pCodigo VARCHAR (10)
	SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
						CAST([Consecutivo] AS VARCHAR(5))
						FROM [dbo].[Consecutivo]
						WHERE [Descripcion] = 'Bitácora'
	INSERT INTO dbo.Bitacora(Codigo,Fecha_Hora, Tipo,Descripcion)
	VALUES (@pCodigo, getdate(), @pTipo, @pDescripcion)
			--ENCRYPTBYPASSPHRASE('12345',@pNombre),
			--ENCRYPTBYPASSPHRASE('12345',@pDescripcion))
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Bitácora'
END
GO

/****** Object:  StoredProcedure [dbo].[INSERTA_CONSECUTIVO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	VALUES (ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
			ENCRYPTBYPASSPHRASE('12345',@pConsecutivo),
			@pCodigo,
			@pPoseePrefijo,
			@pPrefijo,
			@pPoseeRango,
			@pMinimo,
			@pMaximo);
END
GO

/****** Object:  StoredProcedure [dbo].[INSERTA_ERROR]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[INSERTA_ERROR]
	
	@pFecha_hora DATETIME, 	
	@pMensaje VARCHAR(50)

AS
BEGIN

	INSERT INTO dbo.Error(Fecha_Hora, Mensaje)
	VALUES (getdate(),
			ENCRYPTBYPASSPHRASE('12345',@pMensaje))		
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTA_HABITACION]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[INSERTA_HABITACION]
	
	@pNumero INT, 	
	@pDescripcion VARCHAR(250),
	@pEst_Hab INT,
	@pPrecio VARCHAR (10)

AS

DECLARE @pCodigo VARCHAR (10);
SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
					CAST([Consecutivo] AS VARCHAR(5))
					FROM [dbo].[Consecutivo]
					WHERE [Descripcion] = 'Habitación'

BEGIN

	INSERT INTO dbo.Habitacion(Codigo, Numero, Descripcion, Est_Hab, Precio)
	VALUES (@pCodigo, @pNumero,@pDescripcion,--ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
			@pEst_Hab,
			@pPrecio)
			--ENCRYPTBYPASSPHRASE('12345',@pPrecio))
			
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Habitación'		

END
GO
/****** Object:  StoredProcedure [dbo].[INSERTA_RESERVA]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[INSERTA_RESERVA]
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
DECLARE @pCodigo VARCHAR(10);
SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
					CAST([Consecutivo] AS VARCHAR(5))
					FROM [dbo].[Consecutivo]
					WHERE [Descripcion] = 'Reserva'

BEGIN
	
	INSERT INTO dbo.Reserva(Codigo,Fecha_Entrada, Fecha_Salida,Cantidad_Dias,Codigo_Promocional,Cantidad_Adultos,Cantidad_Niños,
							Mascota,Metodo_Pago,Precio,Usuario)
	VALUES (@pCodigo,convert(date,'DD/MM/YYYY'), convert(date,'DD/MM/YYYY'),@pCantidad_Dias, @pCodigo_Promocional,@pCantidad_Adultos,@pCantidad_Niños, @pMascota, @pMetodo_Pago,@pPrecio, @pUsuario);
			/*ENCRYPTBYPASSPHRASE('N',@pCodigo_Promocional),
			ENCRYPTBYPASSPHRASE('N',@pMascota),
			ENCRYPTBYPASSPHRASE('T',@pMetodo_Pago),
			ENCRYPTBYPASSPHRASE('12345',@pUsuario))*/

	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Reserva'
END
GO

/****** Object:  StoredProcedure [dbo].[MODIFICA_CONSECUTIVO]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[MODIFICA_CONSECUTIVO]
	
	@pCodigo INT,
	@pDescripcion NVARCHAR(50),
	@pConsecutivo VARCHAR(5),
	@pPoseePrefijo bit,	
	@pPrefijo VARCHAR(5),
	@pPoseeRango bit,
	@pMinimo INT,
	@pMaximo INT

AS
BEGIN
	UPDATE dbo.Consecutivo
	SET	Descripcion = ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
		Consecutivo = @pConsecutivo,
		PoseePrefijo = @pPoseePrefijo,
	    Prefijo = @pPrefijo,
		PoseeRango = @pPoseeRango,
	    Minimo = @pMinimo,
	    Maximo = @pMaximo
	WHERE Codigo = @pCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[MODIFICA_ERROR]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   PROCEDURE [dbo].[MODIFICA_ERROR]
	
	@pCodigo INT, 
	@pFecha_hora DATETIME, 	
	@pMensaje NVARCHAR(50)

AS
BEGIN
	UPDATE dbo.Error
	SET	Fecha_Hora= @pFecha_hora,
	    Mensaje = ENCRYPTBYPASSPHRASE('12345',@pMensaje)
	WHERE Codigo = @pCodigo
END
GO

/****** Object:  StoredProcedure [dbo].[USUARIO_CLIENTE_LOGIN]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER        PROCEDURE [dbo].[USUARIO_CLIENTE_LOGIN]
	@pUsuario	NVARCHAR(30),
	@pPassword	NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Usuario, Clave FROM [dbo].[Usuario_Cliente] WHERE  Usuario=@pUsuario AND Clave=@pPassword; 
END
GO

/****** Object:  StoredProcedure [dbo].[USUARIO_ADMIN_LOGIN]    Script Date: 25/8/2019 20:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[USUARIO_ADMIN_LOGIN]
	@pUsuario NVARCHAR(30),
	@pPassword NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Usuario, Clave FROM [dbo].[Usuario_Admin] WHERE  Usuario=@pUsuario AND Clave=@pPassword; 
END
GO

/** Object:  StoredProcedure [dbo].[ObtenertRoles]    Script Date: 28/8/2019 22:22:43 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[ObtenertRoles]
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
		[dbo].[Usuario_Admin]
	WHERE	
		Codigo	=	@pCodigo;
END
GO