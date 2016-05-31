/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     25/05/2016 16:25:13                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('carreras') and o.name = 'FK_CARRERAS_REFERENCE_DIVISION')
alter table carreras
   drop constraint FK_CARRERAS_REFERENCE_DIVISION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('directorio') and o.name = 'FK_DIRECTOR_REFERENCE_AREAS')
alter table directorio
   drop constraint FK_DIRECTOR_REFERENCE_AREAS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('materias') and o.name = 'FK_MATERIAS_REFERENCE_CARRERAS')
alter table materias
   drop constraint FK_MATERIAS_REFERENCE_CARRERAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('actividades_universitarias')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index actividades_universitarias.index_1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('actividades_universitarias')
            and   name  = 'index_2'
            and   indid > 0
            and   indid < 255)
   drop index actividades_universitarias.index_2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('actividades_universitarias')
            and   name  = 'index_3'
            and   indid > 0
            and   indid < 255)
   drop index actividades_universitarias.index_3
go

if exists (select 1
            from  sysobjects
           where  id = object_id('actividades_universitarias')
            and   type = 'U')
   drop table actividades_universitarias
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('areas')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index areas.index_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('areas')
            and   type = 'U')
   drop table areas
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('carreras')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index carreras.index_1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('carreras')
            and   name  = 'index_2'
            and   indid > 0
            and   indid < 255)
   drop index carreras.index_2
go

if exists (select 1
            from  sysobjects
           where  id = object_id('carreras')
            and   type = 'U')
   drop table carreras
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('contactos')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index contactos.index_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('contactos')
            and   type = 'U')
   drop table contactos
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('directorio')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index directorio.index_1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('directorio')
            and   name  = 'index_2'
            and   indid > 0
            and   indid < 255)
   drop index directorio.index_2
go

if exists (select 1
            from  sysobjects
           where  id = object_id('directorio')
            and   type = 'U')
   drop table directorio
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('divisiones')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index divisiones.index_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('divisiones')
            and   type = 'U')
   drop table divisiones
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('materias')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index materias.index_1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('materias')
            and   name  = 'index_2'
            and   indid > 0
            and   indid < 255)
   drop index materias.index_2
go

if exists (select 1
            from  sysobjects
           where  id = object_id('materias')
            and   type = 'U')
   drop table materias
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('servicios')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index servicios.index_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('servicios')
            and   type = 'U')
   drop table servicios
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('usuarios')
            and   name  = 'index_1'
            and   indid > 0
            and   indid < 255)
   drop index usuarios.index_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('usuarios')
            and   type = 'U')
   drop table usuarios
go

/*==============================================================*/
/* Table: actividades_universitarias                            */
/*==============================================================*/
create table actividades_universitarias (
   id                   int                  not null
      constraint CKC_ID_ACTIVIDA check (id = lower(id)),
   nombre               varchar(100)         null,
   texto_previo         varchar(200)         null,
   texto_completo       text                 null,
   link                 varchar(200)         null,
   img                  varchar(150)         null,
   fecha_realizacion    date                 null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_ACTIVIDADES_UNIVERSITARIAS primary key (id)
)
go

/*==============================================================*/
/* Index: index_3                                               */
/*==============================================================*/
create index index_3 on actividades_universitarias (
fecha_registro ASC
)
go

/*==============================================================*/
/* Index: index_2                                               */
/*==============================================================*/
create index index_2 on actividades_universitarias (
fecha_realizacion ASC
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on actividades_universitarias (
id ASC
)
go

/*==============================================================*/
/* Table: areas                                                 */
/*==============================================================*/
create table areas (
   id                   int                  not null,
   nombre               varchar(50)          null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_AREAS primary key (id)
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on areas (
id ASC
)
go

/*==============================================================*/
/* Table: carreras                                              */
/*==============================================================*/
create table carreras (
   id                   int                  not null,
   nombre               varchar(50)          null,
   division_id          int                  null,
   icono                varchar(100)         null,
   img                  varchar(100)         null,
   url                  varchar(100)         null,
   informacion_extra    text                 null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_CARRERAS primary key (id)
)
go

/*==============================================================*/
/* Index: index_2                                               */
/*==============================================================*/
create index index_2 on carreras (
division_id ASC
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on carreras (
id ASC
)
go

/*==============================================================*/
/* Table: contactos                                             */
/*==============================================================*/
create table contactos (
   id                   int                  not null,
   nombre               varchar(50)          null,
   contenido            text                 null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_CONTACTOS primary key (id)
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on contactos (
id ASC
)
go

/*==============================================================*/
/* Table: directorio                                            */
/*==============================================================*/
create table directorio (
   id                   int                  not null,
   area_id              int                  null,
   nombre               varchar(50)          null,
   puesto               varchar(50)          null,
   tel                  varchar(15)          null,
   email                varchar(50)          null,
   img                  varchar(100)         null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_DIRECTORIO primary key (id)
)
go

/*==============================================================*/
/* Index: index_2                                               */
/*==============================================================*/
create index index_2 on directorio (
area_id ASC
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on directorio (
id ASC
)
go

/*==============================================================*/
/* Table: divisiones                                            */
/*==============================================================*/
create table divisiones (
   id                   int                  not null,
   nombre               varchar(50)          null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_DIVISIONES primary key (id)
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on divisiones (
id ASC
)
go

/*==============================================================*/
/* Table: materias                                              */
/*==============================================================*/
create table materias (
   id                   int                  not null,
   nombre               varchar(50)          null,
   grado                int                  null,
   carrera_id           int                  null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_MATERIAS primary key (id)
)
go

/*==============================================================*/
/* Index: index_2                                               */
/*==============================================================*/
create index index_2 on materias (
carrera_id ASC
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on materias (
id ASC
)
go

/*==============================================================*/
/* Table: servicios                                             */
/*==============================================================*/
create table servicios (
   id                   int                  not null,
   nombre               varchar(50)          null,
   img                  varchar(100)         null,
   link                 varchar(100)         null,
   activo               bit                  null,
   constraint PK_SERVICIOS primary key (id)
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on servicios (
id ASC
)
go

/*==============================================================*/
/* Table: usuarios                                              */
/*==============================================================*/
create table usuarios (
   id                   int                  not null,
   nombre_completo      varchar(100)         null,
   login                varchar(15)          null,
   password             varchar(15)          null,
   fecha_registro       datetime             null,
   fecha_modificacion   datetime             null,
   activo               bit                  null,
   constraint PK_USUARIOS primary key (id)
)
go

/*==============================================================*/
/* Index: index_1                                               */
/*==============================================================*/
create index index_1 on usuarios (
id ASC
)
go

alter table carreras
   add constraint FK_CARRERAS_REFERENCE_DIVISION foreign key (division_id)
      references divisiones (id)
go

alter table directorio
   add constraint FK_DIRECTOR_REFERENCE_AREAS foreign key (area_id)
      references areas (id)
go

alter table materias
   add constraint FK_MATERIAS_REFERENCE_CARRERAS foreign key (carrera_id)
      references carreras (id)
go

