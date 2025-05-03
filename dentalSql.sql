USE [DentalClinic]
GO
/****** Object:  Table [dbo].[diagnostico_tratamiento]    Script Date: 3/05/2025 18:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnostico_tratamiento](
	[IdDiagnostico] [int] IDENTITY(1,1) NOT NULL,
	[IdHistorial] [int] NOT NULL,
	[fecha_diagnostico] [date] NULL,
	[diagnostico] [varchar](500) NOT NULL,
	[tratamiento_recomendado] [varchar](500) NULL,
	[procedimiento_realizado] [varchar](500) NULL,
	[observaciones] [varchar](500) NULL,
	[estado] [varchar](30) NULL,
	[costo_estimado] [decimal](10, 2) NULL,
	[profesional_responsable] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDiagnostico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_clinico]    Script Date: 3/05/2025 18:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_clinico](
	[IdHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[fecha_creacion] [date] NULL,
	[motivo_consulta] [varchar](500) NOT NULL,
	[sintomas] [varchar](200) NULL,
	[observaciones_generales] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odontograma]    Script Date: 3/05/2025 18:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odontograma](
	[IdOdontograma] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[fecha_registro] [date] NOT NULL,
	[numero_diente] [int] NULL,
	[estado] [varchar](50) NOT NULL,
	[observaciones] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOdontograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 3/05/2025 18:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[dni] [varchar](20) NULL,
	[fecha_nacimiento] [date] NULL,
	[telefono_fijo] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[fecha_registro] [date] NULL,
	[lugar_nacimiento] [varchar](100) NULL,
	[ciudad] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[celular] [varchar](9) NULL,
	[grado_instruccion] [varchar](30) NULL,
	[ocupacion] [varchar](200) NULL,
	[procedencia] [varchar](100) NULL,
	[alergia_medicamentos] [varchar](200) NULL,
	[apoderado] [varchar](200) NULL,
	[telefono_apoderado] [varchar](9) NULL,
	[edad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[diagnostico_tratamiento]  WITH CHECK ADD FOREIGN KEY([IdHistorial])
REFERENCES [dbo].[historial_clinico] ([IdHistorial])
GO
ALTER TABLE [dbo].[historial_clinico]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[Odontograma]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[paciente] ([IdPaciente])
GO
