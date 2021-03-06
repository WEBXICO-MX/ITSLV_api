USE [master]
GO
/****** Object:  Database [ITSLV_api]    Script Date: 25/04/2016 16:09:44 ******/
CREATE DATABASE [ITSLV_api] ON  PRIMARY 
( NAME = N'ITSLV_api', FILENAME = N'C:\BD\ITSLV_api\ITSLV_api.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ITSLV_api_log', FILENAME = N'C:\BD\ITSLV_api\ITSLV_api_log.ldf' , SIZE = 4096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ITSLV_api] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITSLV_api].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITSLV_api] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITSLV_api] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITSLV_api] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITSLV_api] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITSLV_api] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITSLV_api] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITSLV_api] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITSLV_api] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITSLV_api] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITSLV_api] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITSLV_api] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITSLV_api] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITSLV_api] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITSLV_api] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITSLV_api] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITSLV_api] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITSLV_api] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITSLV_api] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITSLV_api] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITSLV_api] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITSLV_api] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITSLV_api] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITSLV_api] SET RECOVERY FULL 
GO
ALTER DATABASE [ITSLV_api] SET  MULTI_USER 
GO
ALTER DATABASE [ITSLV_api] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITSLV_api] SET DB_CHAINING OFF 
GO
USE [ITSLV_api]
GO
/****** Object:  User [itslv_app]    Script Date: 25/04/2016 16:09:44 ******/
CREATE USER [itslv_app] FOR LOGIN [itslv_app] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'itslv_app'
GO
/****** Object:  Table [dbo].[actividades_universitarias]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actividades_universitarias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[texto_previo] [varchar](200) NULL,
	[texto_completo] [text] NULL,
	[img] [varchar](50) NULL,
	[link] [varchar](100) NULL,
	[fecha_realizacion] [date] NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_ACTIVIDADES_UNIVERSITARIAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[areas]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[areas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_AREAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carreras]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carreras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[division_id] [int] NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_CARRERAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contactos]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[contenido] [text] NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_CONTACTOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[directorio]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[directorio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[area_id] [int] NULL,
	[nombre] [varchar](50) NULL,
	[puesto] [varchar](50) NULL,
	[tel] [varchar](15) NULL,
	[email] [varchar](50) NULL,
	[img] [varchar](100) NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_DIRECTORIO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[divisiones]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[divisiones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_DIVISIONES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[materias]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[materias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[grado] [int] NULL,
	[carrera_id] [int] NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_MATERIAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[img] [varchar](100) NULL,
	[link] [varchar](100) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_SERVICIOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 25/04/2016 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_completo] [varchar](100) NULL,
	[login] [varchar](15) NULL,
	[password] [varchar](15) NOT NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[actividades_universitarias] ON 

INSERT [dbo].[actividades_universitarias] ([id], [nombre], [texto_previo], [texto_completo], [img], [link], [fecha_realizacion], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'XVIII INTERNACIONAL COPA DE LOS RÍOS', N'XVIII INTERNACIONAL COPA DE LOS RÍOS EL DÍA SÁBADO 19 DE SEPTIEMBRE DEL AÑO EN CURSO...', N'<p>EL DÍA SÁBADO 19 DE SEPTIEMBRE DEL AÑO EN CURSO , SE LLEVÓ A CABO LA XVIII INTERNACIONAL COPA DE LOS RÍOS , EN LA NAVE UNO DEL PARQUE TABASCO, DE LA CIUDAD DE VILLAHERMOSA;  DONDE SE CONTÓ CON LA PARTICIPACIÓN DE 15 ALUMNOS DEL INSTITUTO TECNOLÓGICO SUPERIOR DE VILLA LA VENTA; OBTENIENDO LOS SIGUIENTES RESULTADOS </p>
<p>RESULTADOS DE LA INTERNACIONAL COPA DE LOS RESULTADOS DE LA INTERNACIONAL COPA DE LOS RÍOS 2015</p>
<table class="table table-bordered table-striped table-hover table-responsive">
<thead>
<tr>
<td>NOMBRE DEL COMPETIDOR</td>
<td>MODALIDAD COMBATE</td>
</tr>
</thead>
<tbody>
<tr>
<td>Karina Elena Posadas Ríos</td>
<td></td>
</tr>
<tr>
<td>Héctor Ocaña Cortázar</td>
<td>Plata</td>
</tr>
<tr>
<td>Erick Evanibaldo Ayala Trejo</td>
<td>Bronce</td>
</tr>
<tr>
<td>Marcos Eliel Pérez Martínez</td>
<td>Plata</td>
</tr>
<tr>
<td>Guadalupe Del Carmen Posadas Ríos</td>
<td></td>
</tr>
<tr>
<td>José Antonio de la Torre Domínguez</td>
<td>Plata</td>
</tr>
<tr>
<td>Atalia Itamar Montejo Barrera/td>
<td></td>
</tr>
<tr>
<td>José Guadalupe Sánchez Quiroz/td>
<td>Plata</td>
</tr>
<tr>
<td>Sandra Cruz Reyes/td>
<td>Plata</td>
</tr>
<tr>
<td> Jesús Salaya Salaya</td>
<td>Oro</td>
</tr>
<tr>
<td>Henry Obeth González Zamudio</td>
<td>Bronce</td>
</tr>
<tr>
<td>Julio Cesar Osorio Antonio</td>
<td>Bronce</td>
</tr>
<tr>
<td>Jesús Francisco Jiménez May</td>
<td>Bronce</td>
</tr>
<tr>
<td>Luis Alfonso Adorno Adorno</td>
<td>Oro</td>
</tr>
<tr>
<td>Luis Fernando Ramírez Gómez</td>
<td></td>
</tr>
</tbody><br/>
<p>MEDALLAS OBTENIDAS EN LA MODALIDAD DE COMBATE</p>
<table class="table table-bordered table-striped table-hover table-responsive">
<thead>
<tr><td>ORO</td><td>PLATA</td><td>BRONCE</td><td>TOTAL</td></tr>
</thead>
<tbody>
<tr><td>2</td><td>5</td><td>4</td><td>11</td></tr>
</tbody>
', N'img/actividades_universitarias/1.jpg', N'http://webxico.blogspot.mx/', {d '2016-04-25'}, {ts '2016-02-29 00:00:00.000'}, {ts '2016-02-29 00:00:00.000'}, 1)
INSERT [dbo].[actividades_universitarias] ([id], [nombre], [texto_previo], [texto_completo], [img], [link], [fecha_realizacion], [fecha_registro], [fecha_modificacion], [activo]) VALUES (2, N'Programa de Actividades XIII Aniversario - Tec La Venta', N'<p>Semana de 13 Aniversario del ITSLV </p>
<p>“Semana Académica, Cultural y Deportiva”</p>
<p>”Formando emprendedores a través de la innovación tecnológica"</p>', N'<p>Semana de 13 Aniversario del ITSLV </p>
<p>“Semana Académica, Cultural y Deportiva”</p>
<p>”Formando emprendedores a través de la innovación tecnológica"</p>', N'img/actividades_universitarias/2.jpg', NULL, {d '2016-02-23'}, {ts '2016-04-25 15:31:38.000'}, NULL, 1)
INSERT [dbo].[actividades_universitarias] ([id], [nombre], [texto_previo], [texto_completo], [img], [link], [fecha_realizacion], [fecha_registro], [fecha_modificacion], [activo]) VALUES (4, N'Felicitación a Los Alumnos por obtener el 1er Lugar en expo Plan de Negocios', N'Felicidades a los alumnos de la Ingeniería en Mecatrónica del ITSLV que ganaron el primer lugar en la categoría "Innovación tecnológica" de la 11va. ...', N'<p>Felicidades a los alumnos de la Ingeniería en Mecatrónica del ITSLV que ganaron el primer lugar en la categoría "Innovación tecnológica" de la 11va. Expo Plan de Negocios Universitarios, en el marco de la Expo CANACINTRA 2015.</p>
<p>El premio ascendió a $10,000.00 para los 3 alumnos ganadores, y de $3,000.00 para el asesor del proyecto. Este premio se entregó en la primera sesión de este año 2016, del Consejo de Vinculación-Empresas de Tabasco (COVINEET) que tuvo verificativo el 17 de febrero en las instalaciones de la CANACINTRA.</p>
<ul>
<li>Categoría
<ul>
<li>Innovación tecnológica</li>
</ul>
</li>
<li>Nombre del Proyecto
<ul>
<li>Control de seguros y encendido de un auto por vía bluetooth.</li>
</ul>
</li>
<li>Alumnos ganadores
<ul>
<li>Daniel de los Santos Rodríguez</li>
<li>Sergio Pérez Ramírez</li>
<li>Octavio Mayge Luna</li>
</ul>
</li>
<li>Asesores
<ul>
<li>Ing. Gloria Susana Villalobos Rodríguez</li>
<li>Ing. Teresa Tonel Rodríguez</li>
</ul>
</li>
</ul>', N'img/actividades_universitarias/3.jpg', NULL, {d '2016-04-25'}, {ts '2016-04-25 15:37:28.000'}, NULL, 1)
INSERT [dbo].[actividades_universitarias] ([id], [nombre], [texto_previo], [texto_completo], [img], [link], [fecha_realizacion], [fecha_registro], [fecha_modificacion], [activo]) VALUES (6, N'Movilidad Internacional: Alianza Pacifico - Perú', N'Buena suerte y buen viaje al alumno Henry Obeth González Zamudio estudiante del 6to Semestre de la Carrera de Ingeniería Industrial que cursará su semestre académico ...', N'<p>Buena suerte y buen viaje al alumno Henry Obeth González Zamudio estudiante del 6to Semestre de la Carrera de Ingeniería Industrial que cursará su semestre académico en la Universidad Señor de Sipán del 20 de marzo al 25 de julio del presente año en la ciudad de Chiclayo, Perú; Así mismo le deseamos feliz estancia también al docente de nuestro Instituto Mtro. Jhonny de la Cruz Ocaña que realizará una estadía del 01 de abril hasta el 31 de julio impartiendo las materias de Administración de Recursos Humanos y Liderazgo en nivel Licenciatura, y Planeamiento y Dirección Estratégica en nivel Maestría, todo esto centrado en la formación y promoción de la investigación conjunta con La Universidad Nacional Jorge Basadre Grohmann en la ciudad Tacana, Perú. Dichas Instituciones de nivel superior ampliamente reconocidas en nuestro hermano país sudamericano del Perú.</p>
<p>Lo anterior como parte de la Movilidad Internacional entre el Instituto Tecnológico Superior de Villa la Venta y la Alianza del Pacífico</p>
<p>El Alumno y el docente dan gracias al Director General del Tec la Venta Dr. Manrique Iván Ferrer Sánchez, las gestiones realizadas para esta inolvidable experiencia, en la que ahora Instituto se podrán realizar estudios en los países como Perú, Colombia y Chile.</p>', N'img/actividades_universitarias/4.jpg', NULL,{d '2016-04-25'}, {ts '2016-04-25 15:43:05.000'}, NULL, 1)
SET IDENTITY_INSERT [dbo].[actividades_universitarias] OFF
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([id], [nombre], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'Rectoría', CAST(N'2016-03-01 00:00:00.000' AS DateTime), CAST(N'2016-03-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[areas] ([id], [nombre], [fecha_registro], [fecha_modificacion], [activo]) VALUES (5, N'UNIDAD DE ACCESO A LA INFORMACIÓN', CAST(N'2016-03-03 16:17:48.000' AS DateTime), CAST(N'2016-03-03 16:19:41.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[areas] OFF
SET IDENTITY_INSERT [dbo].[carreras] ON 

INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'INGENIERÍA SISTEMAS COMPUTACIONALES', 1, CAST(N'2016-04-06 08:52:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (2, N'INGENIERÍA INDUSTRIAL', 1002, CAST(N'2016-04-06 10:13:21.000' AS DateTime), NULL, 1)
INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (3, N'INGENIERÍA EN INDUSTRIAS ALIMENTARIAS', 1002, CAST(N'2016-04-06 10:13:37.000' AS DateTime), NULL, 1)
INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (4, N' INGENIERÍA AMBIENTAL', 3, CAST(N'2016-04-06 10:13:51.000' AS DateTime), NULL, 1)
INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (5, N' INGENIERÍA EN MECATRÓNICA', 1, CAST(N'2016-04-06 10:14:07.000' AS DateTime), NULL, 1)
INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (6, N'INGENIERÍA PETROLERA', 3, CAST(N'2016-04-06 10:14:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[carreras] ([id], [nombre], [division_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (7, N' INGENIERÍA EN GESTIÓN EMPRESARIAL', 2, CAST(N'2016-04-06 10:14:34.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[carreras] OFF
SET IDENTITY_INSERT [dbo].[contactos] ON 

INSERT [dbo].[contactos] ([id], [nombre], [contenido], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'Llamar', N'<div class="col-xs-6 col-sm-4 col-md-3">
                    <p><a href="javascript:void(0);" onclick="window.open(''tel:+52 (993) 3-58-22-22'', ''_system'');"><img src="http://www.uttab.edu.mx/img/movil/android/contacto/Llamar.png" alt="Lllamar a la UTTAB" class="img-responsive"/></a></p>
                    <p class="visible-xs"><a href="javascript:void(0);" onclick="window.open(''tel:+52 (993) 3-58-22-22'', ''_system'');">+52 (993) 3-58-22-22</a></p>
                    <p class="visible-sm visible-md visible-lg" style="text-align:center;"><a href="javascript:void(0);" onclick="window.open(''tel:+52 (993) 3-58-22-22'', ''_system'');">+52 (993) 3-58-22-22</a></p>
                </div>', CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[contactos] OFF
SET IDENTITY_INSERT [dbo].[directorio] ON 

INSERT [dbo].[directorio] ([id], [area_id], [nombre], [puesto], [tel], [email], [img], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, 1, N'DR. MANRIQUE IVÁN FERRER SÁNCHEZ', N'Rector', N'019232320325', N'mferrer@itslv.edu.mx', N'http://transparencia.tabasco.gob.mx/TransArchivos/FP/12/DR.%20MANRIQUE%202_FP.jpg', CAST(N'2016-03-03 00:00:00.000' AS DateTime), CAST(N'2016-03-03 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[directorio] OFF
SET IDENTITY_INSERT [dbo].[divisiones] ON 

INSERT [dbo].[divisiones] ([id], [nombre], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'División de sistemas', CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[divisiones] ([id], [nombre], [fecha_registro], [fecha_modificacion], [activo]) VALUES (2, N'División de Administración', CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[divisiones] ([id], [nombre], [fecha_registro], [fecha_modificacion], [activo]) VALUES (3, N'División de Quimíca', CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[divisiones] ([id], [nombre], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1002, N'División de Industrial', CAST(N'2016-04-06 10:12:59.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[divisiones] OFF
SET IDENTITY_INSERT [dbo].[materias] ON 

INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'Dibujo', 1, 1, CAST(N'2016-04-06 10:14:43.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (2, N'Fundamentos de Programación', 1, 1, CAST(N'2016-04-06 10:22:30.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (3, N'Matemáticas para computadora', 1, 1, CAST(N'2016-04-06 10:22:39.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (4, N'Matemáticas I', 1, 1, CAST(N'2016-04-06 10:22:52.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (5, N'Física I', 1, 1, CAST(N'2016-04-06 10:23:02.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (6, N'Seminario de Ética', 1, 1, CAST(N'2016-04-06 10:23:14.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (7, N'Introducción a la Ing. en Sist. Computacionales', 1, 1, CAST(N'2016-04-06 10:23:24.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (8, N'Probabilidad y Estadística', 2, 1, CAST(N'2016-04-06 10:23:31.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (9, N'Programación Orientada a Objetos', 2, 1, CAST(N'2016-04-06 10:23:46.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (10, N'Química', 2, 1, CAST(N'2016-04-06 10:23:55.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (11, N'Matemáticas II', 2, 1, CAST(N'2016-04-06 10:27:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (12, N'Fundamentos de Investigación', 2, 1, CAST(N'2016-04-06 10:28:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (13, N'Desarrollo Sustentable', 2, 1, CAST(N'2016-04-06 10:28:17.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (14, N'Administración', 3, 1, CAST(N'2016-04-06 10:28:27.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (15, N'Tópicos Selectos de Programación', 3, 1, CAST(N'2016-04-06 10:28:37.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (16, N'Estructura de Datos', 3, 1, CAST(N'2016-04-06 10:28:46.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (17, N'Matemáticas III', 3, 1, CAST(N'2016-04-06 10:28:56.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (18, N'Física II', 3, 1, CAST(N'2016-04-06 10:29:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (19, N'Matemáticas IV', 3, 1, CAST(N'2016-04-06 10:29:12.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (20, N'Teoría de la Computación', 4, 1, CAST(N'2016-04-06 10:29:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (21, N'Taller de Investigación I', 4, 1, CAST(N'2016-04-06 10:29:30.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (22, N'Fundamentos de Bases de Datos', 4, 1, CAST(N'2016-04-06 10:29:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (23, N'Matemáticas V', 4, 1, CAST(N'2016-04-06 10:29:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (24, N'Investigación de Operaciones', 4, 1, CAST(N'2016-04-06 10:29:58.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (25, N'Circuitos Eléctricos y Electrónicos', 4, 1, CAST(N'2016-04-06 10:30:06.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (26, N'Programación de Sistemas', 5, 1, CAST(N'2016-04-06 10:30:15.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (27, N'Teoría de las Telecomunicaciones', 5, 1, CAST(N'2016-04-06 10:30:23.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (28, N'Taller de Bases de Datos', 5, 1, CAST(N'2016-04-06 10:30:31.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (29, N'Métodos Numéricos', 5, 1, CAST(N'2016-04-06 10:30:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (30, N'Lenguaje Ensamblador', 5, 1, CAST(N'2016-04-06 10:30:49.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (31, N'Arquitectura de Computadoras', 5, 1, CAST(N'2016-04-06 10:30:57.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (32, N'Redes de Computadoras', 6, 1, CAST(N'2016-04-06 10:31:06.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (33, N'Simulación', 6, 1, CAST(N'2016-04-06 10:31:16.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (34, N'Fundamentos de Desarrollo de Sistemas', 6, 1, CAST(N'2016-04-06 10:31:27.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (35, N'Taller de Investigación II', 6, 1, CAST(N'2016-04-06 10:31:42.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (36, N'Interfaces', 6, 1, CAST(N'2016-04-06 10:31:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (37, N'Programación de WEB', 7, 1, CAST(N'2016-04-06 10:31:58.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (38, N'Sistemas Operativos', 7, 1, CAST(N'2016-04-06 10:32:06.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (39, N'Graficación', 7, 1, CAST(N'2016-04-06 10:32:15.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (40, N'Planificación y Modelado', 7, 1, CAST(N'2016-04-06 10:32:25.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (41, N'Contabilidad Financiera', 7, 1, CAST(N'2016-04-06 10:32:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (42, N'Cultura Empresarial', 8, 1, CAST(N'2016-04-06 10:32:44.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (43, N'Form. y Evaluac. de Proyectos de Inversión', 8, 1, CAST(N'2016-04-06 10:32:55.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (44, N'Inteligencia Artificial I', 8, 1, CAST(N'2016-04-06 10:33:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (45, N'Desarrollo de Proyectos de Software', 8, 1, CAST(N'2016-04-06 10:33:16.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (46, N'Módulo de Especialidad', 8, 1, CAST(N'2016-04-06 10:33:24.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (47, N'Residencia Profesional', 8, 1, CAST(N'2016-04-06 10:33:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (48, N'Dibujo Industrial', 1, 2, CAST(N'2016-04-06 10:34:35.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (49, N'Seminario de Ética', 1, 2, CAST(N'2016-04-06 10:35:32.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (50, N'Matemáticas I', 1, 2, CAST(N'2016-04-06 10:35:45.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (51, N'Química', 1, 2, CAST(N'2016-04-06 10:35:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (52, N'Taller de Herramientas Intelectuales', 1, 2, CAST(N'2016-04-06 10:36:03.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (53, N'Ingeniería Industrial y sus Dimensiones', 1, 2, CAST(N'2016-04-06 10:36:12.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (54, N'Física I', 1, 2, CAST(N'2016-04-06 10:36:20.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (55, N'Fundamentos de Investigación', 2, 2, CAST(N'2016-04-06 10:36:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (56, N'Taller de Liderazgo', 2, 2, CAST(N'2016-04-06 10:36:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (57, N'Matemáticas II', 2, 2, CAST(N'2016-04-06 10:36:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (58, N'Materiales en Ingeniería', 2, 2, CAST(N'2016-04-06 10:37:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (59, N'Probabilidad', 2, 2, CAST(N'2016-04-06 10:37:12.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (60, N'Metrología y Normalización', 2, 2, CAST(N'2016-04-06 10:37:20.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (61, N'Física II', 2, 2, CAST(N'2016-04-06 10:37:29.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (62, N'Estudio del Trabajo I', 3, 2, CAST(N'2016-04-06 10:37:39.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (63, N'Higiene y Seguridad Industrial', 3, 2, CAST(N'2016-04-06 10:37:51.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (64, N'Matemáticas III', 3, 2, CAST(N'2016-04-06 10:37:58.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (65, N'Procesos de Fabricación', 3, 2, CAST(N'2016-04-06 10:38:10.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (66, N'Estadística I', 3, 2, CAST(N'2016-04-06 10:38:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (67, N'Electricidad y Electrónica Industrial', 3, 2, CAST(N'2016-04-06 10:38:31.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (68, N'Estudio del Trabajo II', 4, 2, CAST(N'2016-04-06 10:38:42.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (69, N'Taller de Investigación I', 4, 2, CAST(N'2016-04-06 10:39:09.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (70, N'Matemáticas IV', 4, 2, CAST(N'2016-04-06 10:39:16.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (71, N'Administración de Operaciones I', 4, 2, CAST(N'2016-04-06 10:39:24.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (72, N'Control Estadístico de Calidad', 4, 2, CAST(N'2016-04-06 10:39:32.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (73, N'Algoritmos y Lenguajes de Programación', 4, 2, CAST(N'2016-04-06 10:39:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (74, N'Análisis de la Realidad Nacional', 4, 2, CAST(N'2016-04-06 10:39:49.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (75, N'Administración de proyectos', 5, 2, CAST(N'2016-04-06 10:39:57.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (76, N'Administración de Operaciones II', 5, 2, CAST(N'2016-04-06 10:40:06.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (77, N'Investigación de Operaciones I', 5, 2, CAST(N'2016-04-06 10:40:15.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (78, N'Administración del Mantenimiento', 5, 2, CAST(N'2016-04-06 10:40:25.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (79, N'Estadística II', 5, 2, CAST(N'2016-04-06 10:40:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (80, N'Administración de la Calidad', 5, 2, CAST(N'2016-04-06 10:40:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (81, N'Ingeniería Económica', 6, 2, CAST(N'2016-04-06 10:40:49.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (82, N'Contabilidad de Costos', 6, 2, CAST(N'2016-04-06 10:40:57.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (83, N'Simulación', 6, 2, CAST(N'2016-04-06 10:41:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (84, N'Matemáticas V', 6, 2, CAST(N'2016-04-06 10:41:12.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (85, N'Taller de investigación II', 6, 2, CAST(N'2016-04-06 10:41:19.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (86, N'Desarrollo Sustentable', 6, 2, CAST(N'2016-04-06 10:41:28.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (87, N'Análisis Económico y Financiero', 7, 2, CAST(N'2016-04-06 10:41:43.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (88, N'Logística y Cadenas de Suministro', 7, 2, CAST(N'2016-04-06 10:41:52.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (89, N'Sistemas de Manufactura', 7, 2, CAST(N'2016-04-06 10:42:05.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (90, N'Planeación y Diseño de Instalaciones', 7, 2, CAST(N'2016-04-06 10:42:13.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (91, N'Investigación de Operaciones II', 7, 2, CAST(N'2016-04-06 10:42:28.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (92, N'Mercadotecnia', 7, 2, CAST(N'2016-04-06 10:42:37.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (93, N'Formulación y Evaluación de Proyectos', 8, 2, CAST(N'2016-04-06 10:42:46.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (94, N'Administración Gerencial', 8, 2, CAST(N'2016-04-06 10:42:55.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (95, N'Ingeniería de Sistemas', 8, 2, CAST(N'2016-04-06 10:43:05.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (96, N'Residencia Profesional', 8, 2, CAST(N'2016-04-06 10:43:14.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (97, N'Módulo de Especialidad', 8, 2, CAST(N'2016-04-06 10:43:32.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (98, N'Introducción a la Ingeniería Ambiental', 1, 4, CAST(N'2016-04-06 10:43:42.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (99, N'Matemáticas I', 1, 4, CAST(N'2016-04-06 10:46:37.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (100, N'Probabilidad y Estadística', 1, 4, CAST(N'2016-04-06 10:46:47.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (101, N'Química Inorgánica', 1, 4, CAST(N'2016-04-06 10:46:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (102, N'Desarrollo Sustentable', 1, 4, CAST(N'2016-04-06 10:47:03.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (103, N'Ecología', 1, 4, CAST(N'2016-04-06 10:47:13.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (104, N'Fundamentos de Investigación', 2, 4, CAST(N'2016-04-06 10:47:23.000' AS DateTime), CAST(N'2016-04-06 10:47:49.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (105, N'Matemáticas II', 2, 4, CAST(N'2016-04-06 10:47:30.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (106, N'Química Orgánica', 2, 4, CAST(N'2016-04-06 10:47:58.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (107, N'Química Analítica', 2, 4, CAST(N'2016-04-06 10:48:11.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (108, N'Matemáticas III', 2, 4, CAST(N'2016-04-06 10:48:29.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (109, N'Biología', 2, 4, CAST(N'2016-04-06 10:48:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (110, N'Dibujo', 3, 4, CAST(N'2016-04-06 10:48:48.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (111, N'Matemáticas IV', 3, 4, CAST(N'2016-04-06 10:49:15.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (112, N'Bioquímica', 3, 4, CAST(N'2016-04-06 10:49:23.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (113, N'Análisis Instrumental', 3, 4, CAST(N'2016-04-06 10:49:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (114, N'Termodinámica', 3, 4, CAST(N'2016-04-06 10:49:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (115, N'Residuos Sólidos', 3, 4, CAST(N'2016-04-06 10:49:52.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (116, N'Programación', 4, 4, CAST(N'2016-04-06 10:50:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (117, N'Matemáticas V', 4, 4, CAST(N'2016-04-06 10:50:13.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (118, N'Microbiología', 4, 4, CAST(N'2016-04-06 10:50:21.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (119, N'Fisicoquímica I', 4, 4, CAST(N'2016-04-06 10:50:30.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (120, N'Física', 4, 4, CAST(N'2016-04-06 10:50:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (121, N'Balance de Materia y Energía', 4, 4, CAST(N'2016-04-06 10:50:59.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (122, N'Fisicoquímica II', 5, 4, CAST(N'2016-04-06 10:51:15.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (123, N'Toxicología', 5, 4, CAST(N'2016-04-06 10:51:24.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (124, N'Contaminación Atmosférica', 5, 4, CAST(N'2016-04-06 10:51:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (125, N'Taller de Investigación I', 5, 4, CAST(N'2016-04-06 10:51:40.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (126, N'Fenómenos de Transporte', 5, 4, CAST(N'2016-04-06 10:51:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (127, N'Mecánica de Fluidos', 5, 4, CAST(N'2016-04-06 10:52:02.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (128, N'Contabilidad de Costos', 6, 4, CAST(N'2016-04-06 10:55:34.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (129, N'Diseño de Experimentos', 6, 4, CAST(N'2016-04-06 10:55:44.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (130, N'Remediación de Suelos', 6, 4, CAST(N'2016-04-06 10:55:59.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (131, N'Tratamiento de Aguas IAM-0434', 6, 4, CAST(N'2016-04-06 11:00:06.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (132, N'Seminario de Ética', 6, 4, CAST(N'2016-04-06 11:00:16.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (133, N'Ingeniería Económica', 7, 4, CAST(N'2016-04-06 11:00:30.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (134, N'Diseño de Elementos de Equipo', 7, 4, CAST(N'2016-04-06 11:00:44.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (135, N'Psicología Ambiental', 7, 4, CAST(N'2016-04-06 11:00:52.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (136, N'Economía Ambiental', 7, 4, CAST(N'2016-04-06 11:01:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (137, N'Taller de Investigación II', 7, 4, CAST(N'2016-04-06 11:01:08.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (138, N'Formulación y Evaluación de Proyectos', 8, 4, CAST(N'2016-04-06 11:01:17.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (139, N'Evaluación e Impacto Ambiental', 8, 4, CAST(N'2016-04-06 11:01:25.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (140, N'Tecnologías de Limpias y Recursos Renovables', 8, 4, CAST(N'2016-04-06 11:01:36.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (141, N'Administración y Gestión Ambiental', 8, 4, CAST(N'2016-04-06 11:01:45.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (142, N'Módulo de Especialidad', 8, 4, CAST(N'2016-04-06 11:01:57.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (143, N'Residencia Profesional', 8, 4, CAST(N'2016-04-06 11:02:08.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (144, N'Dibujo Asistido por Computadora', 1, 5, CAST(N'2016-04-06 11:02:17.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (145, N'L ógica de Programación', 1, 5, CAST(N'2016-04-06 11:02:57.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (146, N'Química', 1, 5, CAST(N'2016-04-06 11:03:07.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (147, N'Matemáticas I', 1, 5, CAST(N'2016-04-06 11:03:14.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (148, N'Fundamentos de Investigación', 1, 5, CAST(N'2016-04-06 11:03:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (149, N'Introducción a la Ingeniería Mecatrónica', 1, 5, CAST(N'2016-04-06 11:03:34.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (150, N'Metrología y Normalización', 2, 5, CAST(N'2016-04-06 11:03:42.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (151, N'Matemáticas IV', 2, 5, CAST(N'2016-04-06 11:03:52.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (152, N'Ciencias e Ingeniería de los Materiales', 2, 5, CAST(N'2016-04-06 11:04:02.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (153, N'Matemáticas II', 2, 5, CAST(N'2016-04-06 11:04:10.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (154, N'Matemáticas Discretas', 2, 5, CAST(N'2016-04-06 11:04:18.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (155, N'Estadística y Control de Calidad', 2, 5, CAST(N'2016-04-06 11:04:25.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (156, N'Electricidad y Magnetismo', 3, 5, CAST(N'2016-04-06 11:04:37.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (157, N'Procesos de Fabricación', 3, 5, CAST(N'2016-04-06 11:04:45.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (158, N'Seminario de Ética', 3, 5, CAST(N'2016-04-06 11:05:05.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (159, N'Matemáticas III', 3, 5, CAST(N'2016-04-06 11:05:14.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (160, N'Estática', 3, 5, CAST(N'2016-04-06 11:05:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (161, N'Contabilidad y Costos', 3, 5, CAST(N'2016-04-06 11:05:35.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (162, N'Análisis de Circuitos Eléctricos', 4, 5, CAST(N'2016-04-06 11:05:43.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (163, N'Dinámica', 4, 5, CAST(N'2016-04-06 11:05:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (164, N'Matemáticas V', 4, 5, CAST(N'2016-04-06 11:06:02.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (165, N'Programación Numérica', 4, 5, CAST(N'2016-04-06 11:06:11.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (166, N'Mecánica de Materiales', 4, 5, CAST(N'2016-04-06 11:06:19.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (167, N'Taller de Investigación I', 4, 5, CAST(N'2016-04-06 11:06:27.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (168, N'Electrónica I', 5, 5, CAST(N'2016-04-06 11:06:38.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (169, N'Electrónica Digital', 5, 5, CAST(N'2016-04-06 11:06:46.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (170, N'Mecanismos', 5, 5, CAST(N'2016-04-06 11:06:56.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (171, N'Termofluidos', 5, 5, CAST(N'2016-04-06 11:07:14.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (172, N'Desarrollo sustentable', 5, 5, CAST(N'2016-04-06 11:07:31.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (173, N'Diseño de Elementos Mecánicos', 5, 5, CAST(N'2016-04-06 11:07:41.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (174, N'Electrónica II', 6, 5, CAST(N'2016-04-06 11:07:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (175, N'Microcontroladores', 6, 5, CAST(N'2016-04-06 11:07:58.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (176, N'Dinámica de Sistemas', 6, 5, CAST(N'2016-04-06 11:08:08.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (177, N'Circuitos Hidráulicos y Neumáticos', 6, 5, CAST(N'2016-04-06 11:08:16.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (178, N'Taller de Investigación II', 6, 5, CAST(N'2016-04-06 11:08:23.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (179, N'Administración', 6, 5, CAST(N'2016-04-06 11:08:30.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (180, N'Máquinas Eléctricas', 7, 5, CAST(N'2016-04-06 11:08:38.000' AS DateTime), CAST(N'2016-04-06 11:10:18.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (181, N'Maquinas hidráulicas y Térmicas', 7, 5, CAST(N'2016-04-06 11:08:48.000' AS DateTime), CAST(N'2016-04-06 11:10:24.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (182, N'Control', 7, 5, CAST(N'2016-04-06 11:08:55.000' AS DateTime), CAST(N'2016-04-06 11:10:29.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (183, N'Análisis de Vibr aciones', 7, 5, CAST(N'2016-04-06 11:09:06.000' AS DateTime), CAST(N'2016-04-06 11:10:33.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (184, N'Instrumentación', 7, 5, CAST(N'2016-04-06 11:09:13.000' AS DateTime), CAST(N'2016-04-06 11:10:37.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (185, N'Taller de Comportamiento Humano en las Organizacio', 7, 5, CAST(N'2016-04-06 11:09:21.000' AS DateTime), CAST(N'2016-04-06 11:11:58.000' AS DateTime), 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (186, N'Control de Máquinas Eléctricas', 8, 5, CAST(N'2016-04-06 11:12:13.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (187, N'Mantenimiento', 8, 5, CAST(N'2016-04-06 11:12:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (188, N'Controladores L ógicos Programables', 8, 5, CAST(N'2016-04-06 11:12:32.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (189, N'Programación en Tiempo Real', 8, 5, CAST(N'2016-04-06 11:12:42.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (190, N'MODULO DE ESPECIALIDAD', 8, 5, CAST(N'2016-04-06 11:13:07.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (191, N'Seminario de Mecatrónica', 9, 5, CAST(N'2016-04-06 11:18:07.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (192, N'Administración de Proyectos', 9, 5, CAST(N'2016-04-06 11:18:15.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (193, N'Manufactura Avanzada', 9, 5, CAST(N'2016-04-06 11:18:26.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (194, N'RESIDENCIAS PROFESIONALES', 9, 5, CAST(N'2016-04-06 11:18:39.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (195, N'Matemáticas I', 1, 3, CAST(N'2016-04-06 12:38:29.117' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (196, N'Física I', 1, 3, CAST(N'2016-04-06 12:38:29.117' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (197, N'Química inorgánica', 1, 3, CAST(N'2016-04-06 12:38:29.117' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (198, N'Introducción a la Industria Alimentaria', 1, 3, CAST(N'2016-04-06 12:38:29.120' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (199, N'Desarrollo Humano', 1, 3, CAST(N'2016-04-06 12:38:29.120' AS DateTime), NULL, 1)
GO
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (200, N'Seminario de Ética', 1, 3, CAST(N'2016-04-06 12:38:29.120' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (201, N'Bilogia Celular', 1, 3, CAST(N'2016-04-06 12:38:29.120' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (202, N'Matemáticas II', 2, 3, CAST(N'2016-04-06 14:22:39.073' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (203, N'Física II', 2, 3, CAST(N'2016-04-06 14:22:39.077' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (204, N'Química Orgánica', 2, 3, CAST(N'2016-04-06 14:22:39.077' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (205, N'Laboratorio de Química Analítica', 2, 3, CAST(N'2016-04-06 14:22:39.077' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (206, N'Taller de comunicación', 2, 3, CAST(N'2016-04-06 14:22:39.077' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (207, N'Probabilidad', 2, 3, CAST(N'2016-04-06 14:22:39.077' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (208, N'Fisiologia Animal y vegetal', 2, 3, CAST(N'2016-04-06 14:22:39.077' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (209, N'Matemáticas III', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (210, N'Matemáticas VI', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (211, N'Bioquímica', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (212, N'Fisicoquimica', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (213, N'Estadistica Aplicada', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (214, N'Microbilogia', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (215, N'Producción Agricola', 3, 3, CAST(N'2016-04-06 14:27:42.107' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1001, N'Matemáticas V', 4, 3, CAST(N'2016-04-07 16:28:11.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1002, N'Programación', 4, 3, CAST(N'2016-04-07 16:29:31.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1003, N'Química de Alimentos', 4, 3, CAST(N'2016-04-07 16:29:43.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1004, N'Termodinámica', 4, 3, CAST(N'2016-04-07 16:29:58.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1005, N'Economía', 4, 3, CAST(N'2016-04-07 16:30:17.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1006, N'Microbiología de Alimentos', 4, 3, CAST(N'2016-04-07 16:30:29.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1007, N'Producción Pecuaria y Agricola', 4, 3, CAST(N'2016-04-07 16:30:47.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1008, N'Fenómenos de Transporte', 5, 3, CAST(N'2016-04-07 16:31:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1009, N'Matemáticas para la toma de decisiones', 5, 3, CAST(N'2016-04-07 16:32:18.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1010, N'Análisis de Alimentos', 5, 3, CAST(N'2016-04-07 16:32:39.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1011, N'Balance de Materia y Energia', 5, 3, CAST(N'2016-04-07 16:32:55.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1012, N'Control de Calidad en Alimentos', 5, 3, CAST(N'2016-04-07 16:33:18.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1013, N'Legislación en la Industria Agroalimentaria', 5, 3, CAST(N'2016-04-07 16:33:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1014, N'Fundamentos de Investigación', 5, 3, CAST(N'2016-04-07 16:33:56.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1015, N'Ingenieria de Alimentos I', 6, 3, CAST(N'2016-04-07 16:34:12.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1016, N'Ingenieria de Alimentos II', 6, 3, CAST(N'2016-04-07 16:34:33.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1017, N'Contabilidad de Costos', 6, 3, CAST(N'2016-04-07 16:34:49.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1018, N'Desarrollo Sustentable', 6, 3, CAST(N'2016-04-07 16:35:04.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1019, N'Administración', 6, 3, CAST(N'2016-04-07 16:35:17.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1020, N'Taller de Investigación', 6, 3, CAST(N'2016-04-07 16:35:29.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1021, N'Tecnología de Conservación', 7, 3, CAST(N'2016-04-07 16:35:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1022, N'Ingenieria de Alimentos III', 7, 3, CAST(N'2016-04-07 16:37:01.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1023, N'Dibujo y Diseño Asistido por Computadora', 7, 3, CAST(N'2016-04-07 16:37:14.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1024, N'Taller de investigación II', 7, 3, CAST(N'2016-04-07 16:37:36.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1025, N'Tecnologia de Alimentos II', 8, 3, CAST(N'2016-04-07 16:37:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1026, N'Tecnologia de Alimentos', 8, 3, CAST(N'2016-04-07 16:38:23.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1027, N'Taller de Planeación y Diseño de Plantas Alimentar', 8, 3, CAST(N'2016-04-07 16:38:40.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1028, N'Módulo de Especialidad', 8, 3, CAST(N'2016-04-07 16:39:16.000' AS DateTime), NULL, 1)
INSERT [dbo].[materias] ([id], [nombre], [grado], [carrera_id], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1029, N'Residencia', 9, 3, CAST(N'2016-04-07 16:39:32.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[materias] OFF
SET IDENTITY_INSERT [dbo].[servicios] ON 

INSERT [dbo].[servicios] ([id], [nombre], [img], [link], [activo]) VALUES (1, N'Calendario escolar', N'http://www.uttab.edu.mx/img/movil/android/mis_servicios/calendario_escolar.png', N'http://webxico.blogspot.mx/', 1)
SET IDENTITY_INSERT [dbo].[servicios] OFF
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [nombre_completo], [login], [password], [fecha_registro], [fecha_modificacion], [activo]) VALUES (1, N'Roberto Eder Weiss Juárez', N'eder.weiss87', N'M@rvel87.2016', CAST(N'2016-03-01 00:00:00.000' AS DateTime), CAST(N'2016-03-01 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[actividades_universitarias]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_2]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_2] ON [dbo].[actividades_universitarias]
(
	[fecha_realizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_3]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_3] ON [dbo].[actividades_universitarias]
(
	[fecha_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[areas]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[carreras]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_2]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_2] ON [dbo].[carreras]
(
	[division_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[contactos]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[directorio]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_2]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_2] ON [dbo].[directorio]
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[divisiones]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[materias]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_2]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_2] ON [dbo].[materias]
(
	[carrera_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[servicios]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_1]    Script Date: 25/04/2016 16:09:45 ******/
CREATE NONCLUSTERED INDEX [index_1] ON [dbo].[usuarios]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carreras]  WITH CHECK ADD  CONSTRAINT [FK_CARRERAS_REFERENCE_DIVISION] FOREIGN KEY([division_id])
REFERENCES [dbo].[divisiones] ([id])
GO
ALTER TABLE [dbo].[carreras] CHECK CONSTRAINT [FK_CARRERAS_REFERENCE_DIVISION]
GO
ALTER TABLE [dbo].[directorio]  WITH CHECK ADD  CONSTRAINT [FK_DIRECTOR_REFERENCE_AREAS] FOREIGN KEY([area_id])
REFERENCES [dbo].[areas] ([id])
GO
ALTER TABLE [dbo].[directorio] CHECK CONSTRAINT [FK_DIRECTOR_REFERENCE_AREAS]
GO
ALTER TABLE [dbo].[materias]  WITH CHECK ADD  CONSTRAINT [FK_MATERIAS_REFERENCE_CARRERAS] FOREIGN KEY([carrera_id])
REFERENCES [dbo].[carreras] ([id])
GO
ALTER TABLE [dbo].[materias] CHECK CONSTRAINT [FK_MATERIAS_REFERENCE_CARRERAS]
GO
ALTER TABLE [dbo].[actividades_universitarias]  WITH CHECK ADD  CONSTRAINT [CKC_ID_ACTIVIDA] CHECK  (([id]=lower([id])))
GO
ALTER TABLE [dbo].[actividades_universitarias] CHECK CONSTRAINT [CKC_ID_ACTIVIDA]
GO
USE [master]
GO
ALTER DATABASE [ITSLV_api] SET  READ_WRITE 
GO
