USE Microschemes
go



/****** Object:  Table [dbo].[ClientTable]    Script Date: 17.01.2020 15:08:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- проверяем, есть ли таблицы, если да - дропаем
IF OBJECT_ID(N'dbo.ClientOrder', N'U') IS NOT NULL
DROP Table dbo.ClientOrder
IF OBJECT_ID(N'dbo.Client', N'U') IS NOT NULL
DROP Table dbo.Client
IF OBJECT_ID(N'dbo.Price', N'U') IS NOT NULL
DROP Table dbo.Price
IF OBJECT_ID(N'dbo.Position', N'U') IS NOT NULL
DROP Table dbo.Position
IF OBJECT_ID(N'dbo.Company', N'U') IS NOT NULL
Drop Table [dbo].Company

-- Создание таблицы Company. это справочник компаний
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Id Фирмы
	[Name] [nvarchar](50) NOT NULL, -- Фирма
	[PhoneNumber] [nvarchar](50) NULL, -- Телефон
	[Address] [nvarchar](70) NULL, -- Адрес
	[PaymentRating] [float] null, -- Рейтинг Платежеспособности (1-5)

	[InsertDate] [datetime] not null, -- дата добавления записи
	[UpdateDate] [datetime] not null, -- дата удаления записи
	[IsDeleted] bit not null default 0, -- признак удаления записи

	constraint PK_Company_Id primary key clustered (Id), -- первичный ключ
	constraint PaymentRatingCheck check (PaymentRating between 1 and 5) -- ограничение поля PaymentRating
)
GO

--Создание таблицы Position. это справочник товаров, связан с Company
CREATE TABLE [dbo].[Position](
	[Id] int IDENTITY(1,1) NOT NULL, -- Id Товара
	[CompanyId] int NOT NULL, -- id фирмы
	[Name] [nvarchar](50) NOT NULL, -- Наименование
	[Info] [nvarchar](100) NULL, -- инфо по товару
	[Price] float NOT NULL, -- Стоимость

	[InsertDate] [datetime] not null, -- дата добавления записи
	[UpdateDate] [datetime] not null, -- дата удаления записи
	[IsDeleted] bit not null default 0, -- признак удаления записи

	constraint PK_Position_Id primary key clustered (Id), -- первичный ключ
	constraint FK_CompanyId_toCompany foreign key (CompanyId) references [dbo].[Company] ([Id]) -- привязка к Company
)
GO

--Создание таблицы Price, это каталог что есть "у нас"
CREATE TABLE [dbo].[Price](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- id в каталоге
	[PositionId] [int] not null, -- Id Товара 
	[Qnt] [nvarchar](50) NOT NULL, -- Количество в наличии

	[InsertDate] [datetime] not null, -- дата добавления записи
	[UpdateDate] [datetime] not null, -- дата удаления записи
	[IsDeleted] bit not null default 0, -- признак удаления записи

	constraint PK_Price_Id primary key clustered (Id), -- первичный ключ
	constraint FK_PositionId_toPosition foreign key (PositionId) references [dbo].[Position] ([Id]) -- привязка к Position
)
GO

CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- id клиента
	[ClientName] [nvarchar](50) NOT NULL, -- Имя Постоянного клиента
	[Discount] tinyint  NOT NULL, -- Скидка, %
	[Summary] [int] NOT NULL, -- Общая сумма приобретения всего

	[InsertDate] [datetime] not null, -- дата добавления записи
	[UpdateDate] [datetime] not null, -- дата удаления записи
	[IsDeleted] bit not null default 0, -- признак удаления записи

	constraint PK_Clients_Id primary key clustered (Id), -- первичный ключ
	constraint DiscountCheck check (Discount between 0 and 100) -- ограничение поля скидки от 0 до 100 процентов
) ON [PRIMARY]
GO

-- заказы клиентов
create table [dbo].[ClientOrder](
	id int identity(1, 1) not null, -- id заказа
	ClientId int not null, --id клиента
	[PositionId] [int] NOT NULL, -- Id Товара
	[Qnt] int NOT NULL, -- Количество
	[Summary] [int] NOT NULL, -- Общая сумма приобретения в конкретном заказе
	OrderAccepted bit not null default 0, -- заказ принят

	[InsertDate] [datetime] not null, -- дата добавления записи
	[UpdateDate] [datetime] not null, -- дата удаления записи
	[IsDeleted] bit not null default 0, -- признак удаления записи

	constraint PK_ClientOrder_Id primary key clustered (Id), -- первичный ключ
	constraint FK_ClientId_toClient foreign key (ClientId) references [dbo].Client ([Id]), -- привязка к Client
	constraint FK_PositionId_toPosition_cli foreign key ([PositionId]) references [dbo].[Position] ([Id]) -- привязка к Position
)
go

CREATE INDEX INDEX_PRICE ON Price ([Id]); /*это обычный не кластеризованный индекс*/
go

CREATE INDEX INDEX_Company ON Company ([Id]); 
go

CREATE INDEX INDEX_Position ON Position ([Id]); 
go

CREATE INDEX INDEX_Client ON Client ([Id]); 
go

CREATE UNIQUE INDEX  ClientOrder ON  ClientOrder  (id DESC, ClientId DESC, InsertDate desc);  