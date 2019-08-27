USE [H-Mandiola]

DROP TABLE IF EXISTS Actividad;
DROP TABLE IF EXISTS Articulo;
DROP TABLE IF EXISTS Bitacora;
DROP TABLE IF EXISTS BookingID;
DROP TABLE IF EXISTS Consecutivo;
DROP TABLE IF EXISTS Emisor;
DROP TABLE IF EXISTS Error;
DROP TABLE IF EXISTS Est_Hab;
DROP TABLE IF EXISTS Estado;
DROP TABLE IF EXISTS Habitacion;
DROP TABLE IF EXISTS Historial_Actividad;
DROP TABLE IF EXISTS Precio;
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Rol;
DROP TABLE IF EXISTS Tarjeta;
DROP TABLE IF EXISTS Tipo_Articulo;
DROP TABLE IF EXISTS Tipo_Habitacion;
DROP TABLE IF EXISTS Usuario;

GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 25/8/2019 21:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [Actividad_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Precio] [int] NOT NULL,
	[Tipo_Articulo] [int] NOT NULL,
	[Reserva] [varchar](10) NOT NULL,
 CONSTRAINT [Articulo_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Codigo] [varchar](10) NOT NULL,
	[Fecha_Hora] [date] NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [Bitacora_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingID]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingID](
	[Codigo] [nvarchar](1) NOT NULL,
	[Habitacion] [varchar](10) NOT NULL,
	[Reserva] [varchar](10) NOT NULL,
 CONSTRAINT [Bookingid_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consecutivo]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consecutivo](
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Consecutivo] [int] NOT NULL,
	[PoseePrefijo] [bit] NULL,
	[Prefijo] [varchar](5) NULL,
	[PoseeRango] [bit] NULL,
	[Minimo] [int] NULL,
	[Maximo] [int] NULL,
 CONSTRAINT [Consecutivo_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emisor]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emisor](
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [Emisor_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[Codigo] [int] NOT NULL,
	[Fecha_Hora] [date] NOT NULL,
	[Mensaje] [varchar](50) NOT NULL,
 CONSTRAINT [Error_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Est_Hab]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Est_Hab](
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [Est_Hab_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Codigo] [int] NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
 CONSTRAINT [Estado_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Estado_tipo_un] UNIQUE NONCLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[Codigo] [varchar](10) NOT NULL,
	[Numero] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Est_Hab] [int] NOT NULL,
	[Precio] [varchar](10) NOT NULL,
 CONSTRAINT [Habitacion_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial_Actividad]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Actividad](
	[Codigo] [int] NOT NULL,
	[Usuario] [varchar](10) NOT NULL,
	[Actividad] [varchar](10) NOT NULL,
 CONSTRAINT [Historial_Actividad_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio](
	[Codigo] [varchar](10) NOT NULL,
	[Tipo_Habitacion] [int] NOT NULL,
	[Precio] [int] NULL,
 CONSTRAINT [Precio_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[Codigo] [varchar](10) NOT NULL,
	[Fecha_Entrada] [date] NOT NULL,
	[Fecha_Salida] [date] NOT NULL,
	[Cantidad_Dias] [int] NOT NULL,
	[Codigo_Promocional] [char](1) NOT NULL,
	[Cantidad_Adultos] [int] NOT NULL,
	[Cantidad_Niños] [int] NOT NULL,
	[Mascota] [char](1) NOT NULL,
	[Metodo_Pago] [char](1) NOT NULL,
	[Precio] [int] NULL,
	[Usuario] [varchar](10) NOT NULL,
 CONSTRAINT [Reserva_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Codigo] [int] NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
 CONSTRAINT [Rol_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Rol_tipo_un] UNIQUE NONCLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[Codigo] [int] NOT NULL,
	[Numero_Tarjeta] [int] NOT NULL,
	[Fecha_Exp] [date] NOT NULL,
	[Usuario] [varchar](10) NOT NULL,
	[Emisor] [int] NOT NULL,
 CONSTRAINT [Tarjeta_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Articulo]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Articulo](
	[Codigo] [int] NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
 CONSTRAINT [Tipo_Articulo_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Tipo_Articulo_Tipo_un] UNIQUE NONCLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Habitacion]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Habitacion](
	[Codigo] [int] NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
 CONSTRAINT [Tipo_Habitacion_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/8/2019 21:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido1] [varchar](30) NOT NULL,
	[Apellido2] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
	[Clave] [varchar](30) NOT NULL,
	[Pregunta] [varchar](50) NULL,
	[Respuesta] [varchar](30) NULL,
	[Rol] [int] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [Usuario_pk] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Usuario_email_un] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Usuario_usuario_un] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Articulo_Reserva_fk] FOREIGN KEY([Reserva])
REFERENCES [dbo].[Reserva] ([Codigo])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Articulo_Reserva_fk]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Articulo_Tipo_Articulo_fk] FOREIGN KEY([Tipo_Articulo])
REFERENCES [dbo].[Tipo_Articulo] ([Codigo])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Articulo_Tipo_Articulo_fk]
GO
ALTER TABLE [dbo].[BookingID]  WITH CHECK ADD  CONSTRAINT [Bookingid_Habitacion_fk] FOREIGN KEY([Habitacion])
REFERENCES [dbo].[Habitacion] ([Codigo])
GO
ALTER TABLE [dbo].[BookingID] CHECK CONSTRAINT [Bookingid_Habitacion_fk]
GO
ALTER TABLE [dbo].[BookingID]  WITH CHECK ADD  CONSTRAINT [Bookingid_Reserva_fk] FOREIGN KEY([Reserva])
REFERENCES [dbo].[Reserva] ([Codigo])
GO
ALTER TABLE [dbo].[BookingID] CHECK CONSTRAINT [Bookingid_Reserva_fk]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [Habitacion_Est_Hab_fk] FOREIGN KEY([Est_Hab])
REFERENCES [dbo].[Est_Hab] ([Codigo])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [Habitacion_Est_Hab_fk]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [Habitacion_Precio_fk] FOREIGN KEY([Precio])
REFERENCES [dbo].[Precio] ([Codigo])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [Habitacion_Precio_fk]
GO
ALTER TABLE [dbo].[Historial_Actividad]  WITH CHECK ADD  CONSTRAINT [Hist_act_Act_fk] FOREIGN KEY([Actividad])
REFERENCES [dbo].[Actividad] ([Codigo])
GO
ALTER TABLE [dbo].[Historial_Actividad] CHECK CONSTRAINT [Hist_act_Act_fk]
GO
ALTER TABLE [dbo].[Historial_Actividad]  WITH CHECK ADD  CONSTRAINT [Hist_Act_Usuario_fk] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([Codigo])
GO
ALTER TABLE [dbo].[Historial_Actividad] CHECK CONSTRAINT [Hist_Act_Usuario_fk]
GO
ALTER TABLE [dbo].[Precio]  WITH CHECK ADD  CONSTRAINT [Precio_Tipo_Habitacion_fk] FOREIGN KEY([Tipo_Habitacion])
REFERENCES [dbo].[Tipo_Habitacion] ([Codigo])
GO
ALTER TABLE [dbo].[Precio] CHECK CONSTRAINT [Precio_Tipo_Habitacion_fk]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [Reserva_Usuario_fk] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([Codigo])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [Reserva_Usuario_fk]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [Tarjeta_Emisor_fk] FOREIGN KEY([Emisor])
REFERENCES [dbo].[Emisor] ([Codigo])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [Tarjeta_Emisor_fk]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [Tarjeta_Usuario_fk] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([Codigo])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [Tarjeta_Usuario_fk]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [Usuario_estado_fk] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Codigo])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [Usuario_estado_fk]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [Usuario_Rol_fk] FOREIGN KEY([Rol])
REFERENCES [dbo].[Rol] ([Codigo])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [Usuario_Rol_fk]
GO