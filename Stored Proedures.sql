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

	UPDATE dbo.actividad 
	SET 
	    nombre =		ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
		dia =			ENCRYPTBYPASSPHRASE('12345',@pDia),
		horainicio = @pHorainicio,
		horafinal = @pHorafinal

	WHERE codigo_act = @pCodigo_act

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

	UPDATE dbo.articulo
	SET 
	    nombre =	ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    reserva_reservaid = ENCRYPTBYPASSPHRASE ('12345', @pReservaid),
		precio = @pPrecio
		
	
	WHERE codigo_art = @pCodigo_art

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

	UPDATE dbo.bitacora
	SET	
	    fecha_hora= @pFecha_hora,
	    tipo =			ENCRYPTBYPASSPHRASE('12345',@pTipo),
		descripcion =	ENCRYPTBYPASSPHRASE('12345',@pDescripcion)

	WHERE codigo_bit = @pCodigo_bit

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

	UPDATE dbo.habitacion
	SET descripcion= ENCRYPTBYPASSPHRASE('12345',@pDescripcion),
	    est_hab_codigo_esthab = @pEstado,
		precio_codigo_precio = @pPrecio
	
	WHERE codigo_hab = @pCodigo_hab

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
	UPDATE dbo.precio
	SET 
	    tipo_habitacion_codigo_tiphab = @pTipo_habitacion,
	    precio = @precio
	
	WHERE codigo_precio = @pCodigo_precio

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

	UPDATE dbo.usuario 
	SET usuario = ENCRYPTBYPASSPHRASE('12345',@pUsuario),
	    clave = ENCRYPTBYPASSPHRASE('12345',@pClave),
        email = ENCRYPTBYPASSPHRASE('12345',@pCorreo),
	    pregunta= ENCRYPTBYPASSPHRASE('12345',@pPregunta),
	    respuesta = ENCRYPTBYPASSPHRASE('12345',@pRespuesta),
	    nombre = ENCRYPTBYPASSPHRASE('12345',@pNombre),
	    apellido1 = ENCRYPTBYPASSPHRASE('12345',@pApellido1),
	    apellido2 = ENCRYPTBYPASSPHRASE('12345',@pApellido2),
		rol_codigo_rol = @pRol,
		estado_codigo_est = @pEstado

	
	WHERE email = @pCorreo

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
	UPDATE [dbo].[usuario]
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
		dbo.actividad.codigo_act,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345',nombre)) as nombre,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345', descripcion)) as descripcion,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', dia)) as dia,
		horainicio, horafinal

	FROM dbo.actividad
	WHERE dbo.actividad.codigo_act = @pCodigo_act

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
		dbo.Articulo.codigo_art,
		CONVERT(varchar(30), DECRYPTBYPASSPHRASE('12345',nombre)) as nombre,
		CONVERT(varchar(10), DECRYPTBYPASSPHRASE('12345', reserva_reservaid)) as reservaid,
		precio
	FROM dbo.Articulo
	WHERE dbo.Articulo.codigo_art = @pCodigo_art

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
	
	FROM dbo.bitacora
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
		[dbo].[consecutivo].codigo_cons,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',descripcion)) as descripcion,
		prefijo,
		minimo,
		maximo
	FROM dbo.consecutivo
	WHERE dbo.Consecutivo.consecutivo = @codigo_cons
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
	FROM dbo.error
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
	FROM dbo.habitacion
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
		dbo.precio.codigo_precio,
		tipo_habitacion_codigo_tiphab,
		precio
	FROM dbo.precio
	WHERE dbo.precio.codigo_precio = @pCodigo_precio

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
		dbo.reserva.reservaid,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', codigopromocional)) as codigopromocional,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', mascota)) as mascota,
		CONVERT(char(1), DECRYPTBYPASSPHRASE('12345', metodopago)) as metodopago,
		fechaentrada, fechasalida, cantidaddias, cantidadadultos, cantidadniños, precio
	FROM dbo.reserva
	WHERE dbo.reserva.reservaid = @pReservaid

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
		dbo.rol.codigo_rol,
		CONVERT(nvarchar(30), DECRYPTBYPASSPHRASE('12345',dbo.rol.tipo)) as Tipo
	FROM dbo.rol
	WHERE dbo.rol.codigo_rol = @cod_rol
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
		dbo.usuario.email,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.usuario)) as usuario,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.clave)) as contrasena,
		CONVERT(varchar(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.pregunta)) as pregunta_seguridad,
		CONVERT(varchar(100),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.respuesta)) as respuesta_seguridad,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.nombre)) as nombre,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.apellido1)) as primer_apellido,
		CONVERT(varchar(50),	DECRYPTBYPASSPHRASE('12345',dbo.Usuario.apellido2)) as segundo_apellido,
		rol_codigo_rol, estado_codigo_est
	FROM dbo.usuario
	WHERE dbo.usuario.email= @pCorreo

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
DELETE from dbo.actividad
 WHERE 	    @pCodigo_act = codigo_act

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
 WHERE 	    @pCodigo_art = codigo_art

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

DELETE from dbo.bitacora
 WHERE 	    @pCodigo_bit = codigo_bit

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
DELETE from dbo.consecutivo
 WHERE 	    @codigo_cons = codigo_cons
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
DELETE from dbo.error
 WHERE 	    @codigo = codigo_error
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

DELETE from dbo.habitacion
 WHERE 	    @pCodigo_hab = codigo_hab

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
 WHERE 	    @pCodigo_precio = codigo_precio

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

DELETE from dbo.reserva
 WHERE 	    @pReservaid = reservaid

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

DELETE from dbo.usuario
 WHERE 	    @pCorreo = email

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
	SELECT @rol = Usuario.Codigo FROM USUARIO WHERE Usuario.Codigo = @pCodigo;
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

	INSERT INTO [dbo].[consecutivo] (descripcion, consecutivo, prefijo, minimo, maximo)
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

	INSERT INTO dbo.error (fecha_hora, mensaje)
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
	UPDATE dbo.consecutivo
	SET	descripcion = ENCRYPTBYPASSPHRASE('12345',@descripcion),
	    prefijo = @prefijo,
	    minimo = @minimo,
	    maximo = @maximo
	WHERE codigo_cons = @codigo_cons
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
	UPDATE dbo.error
	SET	fecha_hora= @fecha_hora,
	    mensaje = ENCRYPTBYPASSPHRASE('12345',@mensaje)
	WHERE codigo_error = @codigo
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
		dbo.usuario.email ,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.usuario.usuario)) as usuario,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.usuario.clave)) as contrasena,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.usuario.nombre)) as nombre,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.usuario.apellido1)) as primer_apellido,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.usuario.apellido2)) as segundo_apellido,
		dbo.rol.codigo_rol,
		CONVERT(varchar(50), DECRYPTBYPASSPHRASE('12345',dbo.rol.tipo)) as tipo
	FROM dbo.usuario 
		INNER JOIN dbo.usuario_rol
			INNER JOIN dbo.rol
			ON dbo.usuario_rol.codigo_rol = dbo.rol.codigo_rol
		ON dbo.usuario.email = dbo.usuario_rol.email 
	WHERE dbo.usuario.email = @pCorreo

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[USUARIO_REGISTRO]
	@pCodigo int,
	@pNombre nvarchar(30),
	@pApellido1 nvarchar(30),
	@pApellido2 nvarchar(30),
	@pCorreo nvarchar(50),
	@pUsuario nvarchar(30),
	@pClave nvarchar(15),
	@pRol int,
	@pEstado int
	

	
AS

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
			RETURN 1
		END
END



GO
