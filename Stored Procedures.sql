USE [H-Mandiola]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ACTUALIZA_ACTIVIDAD]
	
	@pCodigo varchar(10),
	@pNombre varchar(30),
	@pDescripcion varchar(30),
	@pDia char(1),
	@pHorainicio datetime,
	@pHorafinal datetime

AS

BEGIN

	UPDATE dbo.Actividad 
	SET 
	    Nombre =		ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
		Dia =			ENCRYPTBYPASSPHRASE('12345',@pDia),
		Horainicio = @pHorainicio,
		Horafinal = @pHorafinal

	WHERE Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ACTUALIZA_ARTICULO]
	
	@pCodigo int,
	@pNombre varchar(30),
	@pPrecio int,
	@pReserva varchar(30)

AS

BEGIN

	UPDATE [dbo].[Articulo]
	SET 
	    Nombre =	ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Reserva = ENCRYPTBYPASSPHRASE ('12345', @pReserva),
		Precio = @pPrecio
		
	
	WHERE Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER  PROCEDURE [dbo].[ACTUALIZA_BITACORA]
	
	@pCodigo varchar(10), 	
	@pFecha_hora datetime, 	
	@pTipo varchar(30),	
	@pDescripcion varchar(100)
		
AS

BEGIN

	UPDATE dbo.Bitacora
	SET	
	    Fecha_Hora= @pFecha_hora,
	    Tipo =			ENCRYPTBYPASSPHRASE('12345',@pTipo),
		Descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion)

	WHERE Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ACTUALIZA_HABITACION]
	
	@pCodigo varchar(10),
	@pDescripcion varchar(250),
	@pEstado int,
	@pPrecio int

AS

BEGIN

	UPDATE dbo.Habitacion
	SET Descripcion= ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
	    Est_Hab = @pEstado,
		Precio = @pPrecio
	
	WHERE Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER  PROCEDURE [dbo].[ACTUALIZA_PRECIO]
	
	@pCodigo varchar(10),
	@pTipo_habitacion int,
	@pPrecio int

AS

BEGIN
	UPDATE dbo.Precio
	SET 
	    Tipo_Habitacion = @pTipo_habitacion,
	    Precio = @pPrecio
	
	WHERE Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ACTUALIZA_USUARIO]
	
	@pNombre varchar(30),
	@pApellido1 varchar(30),
	@pApellido2 varchar(30),
	@pCorreo varchar(50),
	@pUsuario varchar(30),
	@pClave varchar(30),
	@pRol int,
	@pPregunta varchar(50),
	@pRespuesta varchar(30),
	@pEstado int
	
AS

BEGIN

	UPDATE dbo.Usuario 
	SET Usuario = ENCRYPTBYPASSPHRASE('12345',@pUsuario),
	    Clave = ENCRYPTBYPASSPHRASE('12345',@pClave),
        Email = ENCRYPTBYPASSPHRASE('12345',@pCorreo),
	    Pregunta= ENCRYPTBYPASSPHRASE('12345',@pPregunta),
	    Respuesta = ENCRYPTBYPASSPHRASE('12345',@pRespuesta),
	    Nombre = ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Apellido1 = ENCRYPTBYPASSPHRASE('12345',@pApellido1),
	    Apellido2 = ENCRYPTBYPASSPHRASE('12345',@pApellido2),
		Rol = @pRol,
		Estado = @pEstado

	
	WHERE Email = @pCorreo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE or ALTER       PROCEDURE [dbo].[CAMBIO_PASS]
	@pUsername nvarchar(30),
	@pPassword nvarchar(30)
AS
BEGIN
	UPDATE [dbo].[Usuario]
	SET @pPassword=Clave
	WHERE @pUsername=Usuario

  
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[CONSULTA_ACTIVIDAD]
	@pCodigo int
AS
BEGIN
	SELECT 
		dbo.Actividad.Codigo,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345',Nombre)) as Nombre,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345', Descripcion)) as Descripcion,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Dia)) as Dia,
		Horainicio, Horafinal

	FROM dbo.Actividad
	WHERE dbo.Actividad.Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[CONSULTA_ARTICULO]
	@pCodigo int

AS

BEGIN

	SELECT 
		dbo.Articulo.Codigo,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345',Nombre)) as Nombre,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345', Reserva)) as Reservaid,
		Precio
	FROM dbo.Articulo
	WHERE dbo.Articulo.Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER  PROCEDURE [dbo].[CONSULTA_BITACORA]
	--@pCodigo_bit int 	
AS
BEGIN
	SELECT * 
		--dbo.bitacora.codigo_bit,
		--fecha_hora,
		--CONVERT(varchar(20),	DECRYPTBYPASSPHRASE('12345',tipo)) as tipo,
		--CONVERT(varchar(100),	DECRYPTBYPASSPHRASE('12345',descripcion)) as descripcion
	
	FROM dbo.Bitacora
	--WHERE dbo.bitacora.codigo_bit = @pCodigo_bit

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[CONSULTA_CONSECUTIVO]
	@pCodigo int	
AS
BEGIN
	SELECT 
		[dbo].[Consecutivo].Codigo,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',Descripcion)) as Descripcion,
		Prefijo,
		Minimo,
		Maximo
	FROM dbo.Consecutivo
	WHERE dbo.Consecutivo.Consecutivo = @pCodigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[CONSULTA_ERROR]
	--@codigo Int	
AS
BEGIN
	SELECT * 
		--dbo.error.codigo_error,
		--fecha_hora,
		--CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',mensaje)) as mensaje
	FROM dbo.Error;
	--WHERE dbo.error.codigo_error = @codigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[CONSULTA_HABITACION]
	--@pCodigo_hab int
AS
BEGIN
	SELECT *
		/*dbo.habitacion.codigo_hab,
		CONVERT(nvarchar(100), DECRYPTBYPASSPHRASE('12345', descripcion)) as descripcion,
		est_hab_codigo_esthab,
		precio_codigo_precio*/
	FROM dbo.Habitacion;
	--WHERE dbo.habitacion.codigo_hab = @pCodigo_hab

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[CONSULTA_PRECIO]
	@pCodigo int
AS
BEGIN
	SELECT 
		dbo.Precio.Codigo,
		Tipo_Habitacion,
		Precio
	FROM dbo.Precio
	WHERE dbo.Precio.Codigo = @pCodigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[CONSULTA_RESERVA]
	@pReserva int
AS
BEGIN
	SELECT 
		dbo.Reserva.Codigo,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Codigo_Promocional)) as "Codigo Promocional",
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Mascota)) as Mascota,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Metodo_Pago)) as Metodopago,
		Fecha_Entrada, Fecha_Salida, Cantidad_Adultos, Cantidad_Adultos, Cantidad_Niños, Precio
	FROM dbo.Reserva
	WHERE dbo.Reserva.Codigo = @pReserva

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE or ALTER PROCEDURE [dbo].[CONSULTA_ROL]
	
	@pCodigo int
AS
BEGIN
	SELECT 
		dbo.Rol.Codigo,
		CONVERT(nvarchar(30), DECRYPTBYPASSPHRASE('12345',dbo.Rol.Tipo)) as Tipo
	FROM dbo.Rol
	WHERE dbo.Rol.Codigo = @pCodigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[CONSULTA_USUARIO]
	
	@pCorreo varchar(50)
AS
BEGIN
	SELECT 
		dbo.Usuario.Email,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Usuario)) as Usuario,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Clave)) as Contrasena,
		CONVERT(varchar(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Pregunta)) as Pregunta_seguridad,
		CONVERT(varchar(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Respuesta)) as Respuesta_seguridad,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Nombre)) as Nombre,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido1)) as Primer_apellido,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido2)) as Segundo_apellido,
		Rol, Estado
	FROM dbo.Usuario
	WHERE dbo.Usuario.Email= @pCorreo

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ELIMINA_ACTIVIDAD]
(
	@pCodigo varchar(10),
	@pNombre varchar(30),
	@pDescripcion varchar(30),
	@pDia char(1),
	@pHorainicio datetime,
	@pHorafinal datetime
)
AS
BEGIN
DELETE from dbo.Actividad
 WHERE 	    @pCodigo = Codigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ELIMINA_ARTICULO]
(
	@pCodigo int,
	@pNombre varchar(30),
	@pPrecio int,
	@pReservaid varchar(10)
)
AS

BEGIN

DELETE from dbo.Articulo
 WHERE 	    @pCodigo = Codigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ELIMINA_BITACORA]
(
	@pCodigo varchar(10), 	
	@pFecha_hora datetime, 	
	@pTipo varchar(30),	
	@pDescripcion varchar(100)
)

AS

BEGIN

DELETE from dbo.Bitacora
 WHERE 	    @pCodigo = Codigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[ELIMINA_CONSECUTIVO]
(
	@pCodigo int,
	@descripcion varchar(50), 	
	@consecutivo varchar(5), 	
	@prefijo varchar(5),
	@minimo int,
	@maximo int
)
AS
BEGIN
DELETE from dbo.Consecutivo
 WHERE 	    @pCodigo = Codigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE or ALTER PROCEDURE [dbo].[ELIMINA_ERROR]
(	
	@pCodigo int, 
	@pFecha_hora date, 	
	@pMensaje varchar(50)
)
AS
BEGIN
DELETE from dbo.Error
 WHERE 	    @pCodigo = Codigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER  PROCEDURE [dbo].[ELIMINA_HABITACION]
(
	@pCodigo varchar(10),
	@pDescripcion varchar(250),
	@pEstado int,
	@pPrecio int
)
AS

BEGIN

DELETE from dbo.Habitacion
 WHERE 	    @pCodigo = Codigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER   PROCEDURE [dbo].[ELIMINA_PRECIO]
(
	@pCodigo varchar(10),
	@pTipo_habitacion int,
	@pPrecio int
)

AS

BEGIN

DELETE from dbo.Precio
 WHERE 	    @pCodigo = Codigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER  PROCEDURE [dbo].[ELIMINA_RESERVA]
(
	@pReserva varchar(10),
	@pFechaentrada date,
	@pFechasalida date,
	@pCantidaddias int,
	@pCodigopromocional char(1),
	@pCantidadultos int,
	@pCantidniños int,
	@pMascota char(1),
	@pMetodopago char(1),
	@pPrecio int
)
AS

BEGIN

DELETE from dbo.Reserva
 WHERE 	    @pReserva = Codigo

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER  PROCEDURE [dbo].[ELIMINA_USUARIO]
(	
	--@pCodigo varchar(10),
	@pNombre varchar(30),
	@pApellido1 varchar(30),
	@pApellido2 varchar(30),
	@pCorreo varchar(50),
	@pUsuario varchar(30),
	@pClave varchar(30),
	@pRol int,
	@pPregunta varchar(50),
	@pRespuesta varchar(30),
	@pEstado int
)

AS

BEGIN

DELETE from dbo.Usuario
 WHERE 	    @pCorreo = Email

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[EXISTE]
	@pCodigo int
AS
BEGIN 
	DECLARE @rol int;
	SELECT @rol = Usuario.Codigo FROM Usuario WHERE Usuario.Codigo = @pCodigo;
	if @@ROWCOUNT = 1
		return 1;
	return 0;
END;

/*
DECLARE @result int;
execute @result = [dbo].[EXISTE]  @pCedula = 117260658;
select @result;
*/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[INSERTA_CONSECUTIVO]
	
	@pCodigo int,
	@pDescripcion varchar(50), 
	@pConsecutivo varchar(5),
	@pPoseePrefijo bit,	
	@pPrefijo varchar(5),
	@pPoseeRango bit,
	@pMinimo int,
	@pMaximo int

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
			@pMaximo)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[INSERTA_ERROR]
	
	@pFecha_hora date, 	
	@pMensaje varchar(50)

AS
BEGIN

	INSERT INTO dbo.Error(Fecha_Hora, Mensaje)
	VALUES (@pFecha_hora,
			ENCRYPTBYPASSPHRASE('12345',@pMensaje))		
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[INSERTA_RESERVA]
	
	@pCodigo varchar(10),
	@pFecha_Entrada date,
	@pFecha_Salida date, 		
	@pCantidad_Dias int,
	@pCodigo_Promocional char(1),
	@pCantidad_Adultos int,
	@pCantidad_Niños int,
	@pMascota char (1),
	@pMetodo_Pago char (1),
	@pPrecio int,
	@pUsuario varchar(10)

AS

SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
					CAST([Consecutivo] AS VARCHAR(5))
					FROM [dbo].[Consecutivo]
					WHERE [Descripcion] = 'Reserva'

BEGIN

	INSERT INTO dbo.Reserva(Fecha_Entrada,Fecha_Salida,Cantidad_Dias,Codigo_Promocional,Cantidad_Adultos,Cantidad_Niños,
							Mascota,Metodo_Pago,Precio,Usuario)
	VALUES (@pFecha_Entrada,@pFecha_Salida,@pCantidad_Dias,@pCantidad_Adultos,@pCantidad_Niños,@pPrecio,
			ENCRYPTBYPASSPHRASE('N',@pCodigo_Promocional),
			ENCRYPTBYPASSPHRASE('N',@pMascota),
			ENCRYPTBYPASSPHRASE('T',@pMetodo_Pago),
			ENCRYPTBYPASSPHRASE('12345',@pUsuario))

	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Reserva'


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[INSERTA_ACTIVIDAD]
	
	@pCodigo varchar (10),
	@pNombre varchar (30), 	
	@pDescripcion varchar(30),
	@pDia char (1),
	@pHorainicio date,
	@pHorafinal date

AS

SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
					CAST([Consecutivo] AS VARCHAR(5))
					FROM [dbo].[Consecutivo]
					WHERE [Descripcion] = 'Actividad'

BEGIN

	INSERT INTO dbo.Actividad (Nombre,Descripcion,Dia,Horainicio,Horafinal)
	VALUES (ENCRYPTBYPASSPHRASE('12345',@pNombre),
			ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
			ENCRYPTBYPASSPHRASE('M',@pDia),
			@pHorainicio,@pHorafinal)	
			
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Actividad'
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[INSERTA_HABITACION]
	
	@pCodigo varchar (10),
	@pNumero int, 	
	@pDescripcion varchar(250),
	@pEst_Hab int,
	@pPrecio varchar (10)

AS

SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) +
					CAST([Consecutivo] AS VARCHAR(5))
					FROM [dbo].[Consecutivo]
					WHERE [Descripcion] = 'Habitacion'

BEGIN

	INSERT INTO dbo.Habitacion(Numero, Descripcion, Est_Hab, Precio)
	VALUES (@pNumero,@pEst_Hab,
			ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
			ENCRYPTBYPASSPHRASE('12345',@pPrecio))
			
	UPDATE [dbo].[Consecutivo]
	SET [Consecutivo] = [Consecutivo] + 1
	WHERE [Descripcion] = 'Habitacion'		

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROCEDURE [dbo].[MODIFICA_CONSECUTIVO]
	
	@pCodigo int,
	@pDescripcion nvarchar(50),
	@pPoseePrefijo bit,
	@pConsecutivo varchar(5),	
	@pPrefijo varchar(5),
	@pPoseeRango bit,
	@pMinimo int,
	@pMaximo int

AS
BEGIN
	UPDATE dbo.Consecutivo
	SET	Descripcion = ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
		PoseePrefijo = @pPoseePrefijo,
	    Prefijo = @pPrefijo,
		PoseeRango = @pPoseeRango,
	    Minimo = @pMinimo,
	    Maximo = @pMaximo
	WHERE Codigo = @pCodigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE or ALTER PROCEDURE [dbo].[MODIFICA_ERROR]
	
	@pCodigo int, 
	@pFecha_hora date, 	
	@pMensaje nvarchar(50)

AS
BEGIN
	UPDATE dbo.Error
	SET	Fecha_Hora= @pFecha_hora,
	    Mensaje = ENCRYPTBYPASSPHRASE('12345',@pMensaje)
	WHERE Codigo = @pCodigo
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*CREATE or ALTER  PROCEDURE [dbo].[USUARIO_CONSULTA_ROL]
	@pCorreo varchar(50)
AS
BEGIN
	SELECT 
		dbo.Usuario.Email ,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Usuario)) as Usuario,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Clave)) as Contrasena,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Nombre)) as Nombre,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido1)) as Primer_apellido,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.Usuario.Apellido2)) as Segundo_apellido,
		dbo.Rol.Codigo,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.Rol.Tipo)) as Tipo
	FROM dbo.Usuario 
		INNER JOIN dbo.usuario_rol
			INNER JOIN dbo.rol
			ON dbo.usuario_rol.codigo_rol = dbo.Rol.Codigo
		ON dbo.Usuario.Email = dbo.usuario_rol.email 
	WHERE dbo.Usuario.Email = @pCorreo

END

GO*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  or ALTER     PROCEDURE [dbo].[USUARIO_LOGIN]
	@pUsuario nvarchar(30),
	@pPassword nvarchar(15)

AS
BEGIN
	SET NOCOUNT ON;

	SELECT Usuario, Clave FROM [dbo].[Usuario] WHERE  Usuario=@pUsuario AND Clave=@pPassword; 
END
GO
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALTER       PROCEDURE [dbo].[USUARIO_REGISTRO]
	--@pCodigo int,
	@pNombre nvarchar(30),
	@pApellido1 nvarchar(30),
	@pApellido2 nvarchar(30),
	@pCorreo nvarchar(50),
	@pUsuario nvarchar(30),
	@pClave nvarchar(15),
	@pRol int,
	@pEstado int
	

	
AS

DECLARE @pCodigo varchar(10)

SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) + 
                CAST([Consecutivo] AS VARCHAR(5))
                FROM [dbo].[Consecutivo]
                WHERE [Descripcion] = 'Usuario'

BEGIN
	DECLARE @existe int = -1;
	DECLARE @rol int = -1;
	EXEC @existe= Existe @pCodigo

	IF @rol =1 or @rol = 2 or @rol=3
		BEGIN
			PRINT 'YA EXISTE EL USUARIO'
			RETURN 0
		END
		
	ELSE
		BEGIN
			INSERT INTO [dbo].[Usuario]
				   ([Codigo],[Nombre],[Apellido1],[Apellido2],[Email], [Usuario], [Clave],
				    [Rol], [Estado])
			 VALUES
          			(@pCodigo, @pNombre,@pApellido1,@pApellido2,LOWER(@pCorreo), @pUsuario, @pClave, @pRol, @pEstado);

		UPDATE [dbo].[Consecutivo]
        SET [Consecutivo] = [Consecutivo] + 1
        WHERE [Descripcion] ='Usuario'

			RETURN 1
		END
		
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALTER       PROCEDURE [dbo].[CLIENTE_REGISTRO]
	--@pCodigo int,
	@pNombre nvarchar(30),
	@pApellido1 nvarchar(30),
	@pApellido2 nvarchar(30),
	@pCorreo nvarchar(50),
	@pUsuario nvarchar(30),
	@pClave nvarchar(15),
	@pPregunta nvarchar(50),
	@pRespuesta nvarchar(30),
	@pRol int,
	@pEstado int
	

	
AS

DECLARE @pCodigo varchar(10)

SELECT @pCodigo = CAST(ISNULL([Prefijo],'') AS VARCHAR(5)) + 
                CAST([Consecutivo] AS VARCHAR(5))
                FROM [dbo].[Consecutivo]
                WHERE [Descripcion] = 'Usuario'

BEGIN
	DECLARE @existe int = -1;
	DECLARE @rol int = -1;
	EXEC @existe= Existe @pCodigo

	IF @rol =1 or @rol = 2 or @rol=3
		BEGIN
			PRINT 'YA EXISTE EL USUARIO'
			RETURN 0
		END
		
	ELSE
		BEGIN
			INSERT INTO [dbo].[Usuario]
				   ([Codigo],[Nombre],[Apellido1],[Apellido2],[Email], [Usuario], [Clave], [Pregunta], [Respuesta],
				    [Rol], [Estado])
			 VALUES
          			(@pCodigo, @pNombre,@pApellido1,@pApellido2,LOWER(@pCorreo), @pUsuario, @pClave,@pPregunta,
					@pRespuesta, @pRol, @pEstado);

		UPDATE [dbo].[Consecutivo]
        SET [Consecutivo] = [Consecutivo] + 1
        WHERE [Descripcion] ='Cliente'

			RETURN 1
		END
		
END