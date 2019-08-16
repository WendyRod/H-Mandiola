USE [H-Mandiola]
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_ACTIVIDAD]    Script Date: 13/8/2019 09:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ACTUALIZA_ACTIVIDAD]
	
	@pCodigo_act varchar(10),
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

	WHERE Codigo = @pCodigo_act

END

GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_ARTICULO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ACTUALIZA_ARTICULO]
	
	@pCodigo_art int,
	@pNombre varchar(30),
	@pPrecio int,
	@pReservaid varchar(10)

AS

BEGIN

	UPDATE dbo.Articulo
	SET 
	    Nombre =	ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    Reserva = ENCRYPTBYPASSPHRASE ('12345', @pReservaid),
		Precio = @pPrecio
		
	
	WHERE Codigo = @pCodigo_art

END

GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_BITACORA]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ACTUALIZA_BITACORA]
	
	@pCodigo_bit varchar(10), 	
	@pFecha_hora datetime, 	
	@pTipo varchar(20),	
	@pDescripcion varchar(100)
		
AS

BEGIN

	UPDATE dbo.Bitacora
	SET	
	    Fecha_Hora= @pFecha_hora,
	    Tipo =			ENCRYPTBYPASSPHRASE('12345',@pTipo),
		Descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion)

	WHERE Codigo = @pCodigo_bit

END

GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_HABITACION]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ACTUALIZA_HABITACION]
	
	@pCodigo_hab varchar(10),
	@pDescripcion varchar(250),
	@pEstado int,
	@pPrecio int

AS

BEGIN

	UPDATE dbo.Habitacion
	SET Descripcion= ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
	    Est_Hab = @pEstado,
		Precio = @pPrecio
	
	WHERE Codigo = @pCodigo_hab

END

GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_PRECIO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ACTUALIZA_PRECIO]
	
	@pCodigo_precio varchar(10),
	@pTipo_habitacion int,
	@precio int

AS

BEGIN
	UPDATE dbo.Precio
	SET 
	    Tipo_Habitacion = @pTipo_habitacion,
	    Precio = @precio
	
	WHERE Codigo = @pCodigo_precio

END

GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_USUARIO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ACTUALIZA_USUARIO]
	
	@pCedula varchar(10),
	@pNombre varchar(30),
	@pApellido1 varchar(30),
	@pApellido2 varchar(30),
	@pCorreo varchar(50),
	@pUsuario varchar(30),
	@pClave varchar(15),
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
	    Apellido2 = ENCRYPTBYPASSPHRASE('12345',@pApellido1),
	    Apellido2 = ENCRYPTBYPASSPHRASE('12345',@pApellido2),
		Rol = @pRol,
		Estado = @pEstado

	
	WHERE Email = @pCorreo

END

GO
/****** Object:  StoredProcedure [dbo].[CAMBIO_PASS]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       PROCEDURE [dbo].[CAMBIO_PASS]
	@pUsername nvarchar(30),
	@pPassword nvarchar(15)
AS
BEGIN
	UPDATE [dbo].[Usuario]
	SET @pPassword=Clave
	WHERE @pUsername=Usuario

  
END
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ACTIVIDAD]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_ACTIVIDAD]
	@pCodigo_act int
AS
BEGIN
	SELECT 
		dbo.Actividad.Codigo,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345',Nombre)) as Nombre,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345', Descripcion)) as Descripcion,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Dia)) as Dia,
		Horainicio, Horafinal

	FROM dbo.Actividad
	WHERE dbo.Actividad.Codigo = @pCodigo_act

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ARTICULO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_ARTICULO]
	@pCodigo_art int

AS

BEGIN

	SELECT 
		dbo.Articulo.Codigo,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345',Nombre)) as Nombre,
		CONVERT(varchar(10), DECRYPTBYPASSPHRASE('12345', Reserva)) as Reservaid,
		Precio
	FROM dbo.Articulo
	WHERE dbo.Articulo.Codigo = @pCodigo_art

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_BITACORA]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_BITACORA]
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
/****** Object:  StoredProcedure [dbo].[CONSULTA_CONSECUTIVO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CONSULTA_CONSECUTIVO]
	@codigo_cons int	
AS
BEGIN
	SELECT 
		[dbo].[Consecutivo].Codigo,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',Descripcion)) as Descripcion,
		Prefijo,
		Minimo,
		Maximo
	FROM dbo.Consecutivo
	WHERE dbo.Consecutivo.Consecutivo = @codigo_cons
END
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ERROR]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [H-Mandiola_Prueba]

CREATE PROCEDURE [dbo].[CONSULTA_ERROR]
	--@codigo Int	
AS
BEGIN
	SELECT * 
		--dbo.error.codigo_error,
		--fecha_hora,
		--CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',mensaje)) as mensaje
	FROM dbo.Error
	--WHERE dbo.error.codigo_error = @codigo
END
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_HABITACION]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_HABITACION]
	--@pCodigo_hab int
AS
BEGIN
	SELECT *
		/*dbo.habitacion.codigo_hab,
		CONVERT(nvarchar(100), DECRYPTBYPASSPHRASE('12345', descripcion)) as descripcion,
		est_hab_codigo_esthab,
		precio_codigo_precio*/
	FROM dbo.Habitacion
	--WHERE dbo.habitacion.codigo_hab = @pCodigo_hab

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_PRECIO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_PRECIO]
	@pCodigo_precio int
AS
BEGIN
	SELECT 
		dbo.Precio.Codigo,
		Tipo_Habitacion,
		Precio
	FROM dbo.Precio
	WHERE dbo.Precio.Codigo = @pCodigo_precio

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_RESERVA]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_RESERVA]
	@pReservaid int
AS
BEGIN
	SELECT 
		dbo.Reserva.Codigo,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Codigo_Promocional)) as Codigopromocional,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Mascota)) as Mascota,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', Metodo_Pago)) as Metodopago,
		Fecha_Entrada, Fecha_Salida, Cantidad_Adultos, Cantidad_Adultos, Cantidad_Niños, Precio
	FROM dbo.Reserva
	WHERE dbo.Reserva.Codigo = @pReservaid

END

GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ROL]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CONSULTA_ROL]
	
	@cod_rol int
AS
BEGIN
	SELECT 
		dbo.Rol.Codigo,
		CONVERT(nvarchar(30), DECRYPTBYPASSPHRASE('12345',dbo.Rol.Tipo)) as Tipo
	FROM dbo.Rol
	WHERE dbo.Rol.Codigo = @cod_rol
END
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_USUARIO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CONSULTA_USUARIO]
	
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
/****** Object:  StoredProcedure [dbo].[ELIMINA_ACTIVIDAD]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_ACTIVIDAD]
(
	@pCodigo_act varchar(10),
	@pNombre varchar(30),
	@pDescripcion varchar(30),
	@pDia char(1),
	@pHorainicio datetime,
	@pHorafinal datetime
)
AS
BEGIN
DELETE from dbo.Actividad
 WHERE 	    @pCodigo_act = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_ARTICULO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_ARTICULO]
(
	@pCodigo_art int,
	@pNombre varchar(30),
	@pPrecio int,
	@pReservaid varchar(10)
)
AS

BEGIN

DELETE from dbo.Articulo
 WHERE 	    @pCodigo_art = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_BITACORA]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_BITACORA]
(
	@pCodigo_bit varchar(10), 	
	@pFecha_hora datetime, 	
	@pTipo varchar(20),	
	@pDescripcion varchar(100)
)

AS

BEGIN

DELETE from dbo.Bitacora
 WHERE 	    @pCodigo_bit = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_CONSECUTIVO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELIMINA_CONSECUTIVO]
(
	@codigo_cons int,
	@descripcion varchar(50), 	
	@consecutivo varchar(5), 	
	@prefijo varchar(5),
	@minimo int,
	@maximo int
)
AS
BEGIN
DELETE from dbo.Consecutivo
 WHERE 	    @codigo_cons = Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_ERROR]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ELIMINA_ERROR]
(	
	@codigo int, 
	@fecha_hora date, 	
	@mensaje varchar(50)
)
AS
BEGIN
DELETE from dbo.Error
 WHERE 	    @codigo = Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_HABITACION]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_HABITACION]
(
	@pCodigo_hab varchar(10),
	@pDescripcion varchar(250),
	@pEstado int,
	@pPrecio int
)
AS

BEGIN

DELETE from dbo.Habitacion
 WHERE 	    @pCodigo_hab = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_PRECIO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_PRECIO]
(
	@pCodigo_precio varchar(10),
	@pTipo_habitacion int,
	@precio int
)

AS

BEGIN

DELETE from dbo.Precio
 WHERE 	    @pCodigo_precio = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_RESERVA]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_RESERVA]
(
	@pReservaid varchar(10),
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
 WHERE 	    @pReservaid = Codigo

END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_USUARIO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ELIMINA_USUARIO]
(	
	@pCedula varchar(10),
	@pNombre varchar(30),
	@pApellido1 varchar(30),
	@pApellido2 varchar(30),
	@pCorreo varchar(50),
	@pUsuario varchar(30),
	@pClave varchar(15),
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
/****** Object:  StoredProcedure [dbo].[EXISTE]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[EXISTE]
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
/****** Object:  StoredProcedure [dbo].[INSERTA_CONSECUTIVO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERTA_CONSECUTIVO]
	
	@descripcion varchar(50), 
	@consecutivo varchar(5),	
	@prefijo varchar(5),
	@minimo int,
	@maximo int

AS
BEGIN

	INSERT INTO [dbo].[Consecutivo] (Descripcion, Consecutivo, Prefijo, Minimo, Maximo)
	VALUES (ENCRYPTBYPASSPHRASE('12345',@descripcion),
			ENCRYPTBYPASSPHRASE('12345',@consecutivo),
			@prefijo,
			@minimo,
			@maximo)
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTA_ERROR]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [H-Mandiola_Prueba]

CREATE PROCEDURE [dbo].[INSERTA_ERROR]
	
	@fecha_hora date, 	
	@mensaje varchar(50)

AS
BEGIN

	INSERT INTO dbo.Error(Fecha_Hora, Mensaje)
	VALUES (@fecha_hora,
			ENCRYPTBYPASSPHRASE('12345',@mensaje))		
END
GO
/****** Object:  StoredProcedure [dbo].[MODIFICA_CONSECUTIVO]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MODIFICA_CONSECUTIVO]
	
	@codigo_cons int,
	@descripcion nvarchar(50),
	@consecutivo varchar(5),	
	@prefijo varchar(5),
	@minimo int,
	@maximo int

AS
BEGIN
	UPDATE dbo.Consecutivo
	SET	Descripcion = ENCRYPTBYPASSPHRASE('12345',@descripcion),
	    Prefijo = @prefijo,
	    Minimo = @minimo,
	    Maximo = @maximo
	WHERE Codigo = @codigo_cons
END
GO
/****** Object:  StoredProcedure [dbo].[MODIFICA_ERROR]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MODIFICA_ERROR]
	
	@codigo int, 
	@fecha_hora date, 	
	@mensaje nvarchar(50)

AS
BEGIN
	UPDATE dbo.Error
	SET	Fecha_Hora= @fecha_hora,
	    Mensaje = ENCRYPTBYPASSPHRASE('12345',@mensaje)
	WHERE Codigo = @codigo
END
GO
/****** Object:  StoredProcedure [dbo].[USUARIO_CONSULTA_ROL]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[USUARIO_CONSULTA_ROL]
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

GO
/****** Object:  StoredProcedure [dbo].[USUARIO_LOGIN]    Script Date: 13/8/2019 09:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[USUARIO_LOGIN]
	-- Add the parameters for the stored procedure here
	@pUsuario nvarchar(30),
	@pPassword nvarchar(15)
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Usuario, Clave FROM [dbo].[usuario] WHERE  Usuario=@pUsuario AND Clave=@pPassword; 
END
GO
/****** Object:  StoredProcedure [dbo].[USUARIO_REGISTRO]    Script Date: 13/8/2019 09:34:20 ******/
USE [H-Mandiola]
GO
/****** Object:  StoredProcedure [dbo].[USUARIO_REGISTRO]    Script Date: 15/8/2019 01:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER       PROCEDURE [dbo].[USUARIO_REGISTRO]
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
