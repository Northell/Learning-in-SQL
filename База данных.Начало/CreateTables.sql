USE Microschemes
go



/****** Object:  Table [dbo].[ClientTable]    Script Date: 17.01.2020 15:08:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ���������, ���� �� �������, ���� �� - �������
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

-- �������� ������� Company. ��� ���������� ��������
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Id �����
	[Name] [nvarchar](50) NOT NULL, -- �����
	[PhoneNumber] [nvarchar](50) NULL, -- �������
	[Address] [nvarchar](70) NULL, -- �����
	[PaymentRating] [float] null, -- ������� ������������������ (1-5)

	[InsertDate] [datetime] not null, -- ���� ���������� ������
	[UpdateDate] [datetime] not null, -- ���� �������� ������
	[IsDeleted] bit not null default 0, -- ������� �������� ������

	constraint PK_Company_Id primary key clustered (Id), -- ��������� ����
	constraint PaymentRatingCheck check (PaymentRating between 1 and 5) -- ����������� ���� PaymentRating
)
GO

--�������� ������� Position. ��� ���������� �������, ������ � Company
CREATE TABLE [dbo].[Position](
	[Id] int IDENTITY(1,1) NOT NULL, -- Id ������
	[CompanyId] int NOT NULL, -- id �����
	[Name] [nvarchar](50) NOT NULL, -- ������������
	[Info] [nvarchar](100) NULL, -- ���� �� ������
	[Price] float NOT NULL, -- ���������

	[InsertDate] [datetime] not null, -- ���� ���������� ������
	[UpdateDate] [datetime] not null, -- ���� �������� ������
	[IsDeleted] bit not null default 0, -- ������� �������� ������

	constraint PK_Position_Id primary key clustered (Id), -- ��������� ����
	constraint FK_CompanyId_toCompany foreign key (CompanyId) references [dbo].[Company] ([Id]) -- �������� � Company
)
GO

--�������� ������� Price, ��� ������� ��� ���� "� ���"
CREATE TABLE [dbo].[Price](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- id � ��������
	[PositionId] [int] not null, -- Id ������ 
	[Qnt] [nvarchar](50) NOT NULL, -- ���������� � �������

	[InsertDate] [datetime] not null, -- ���� ���������� ������
	[UpdateDate] [datetime] not null, -- ���� �������� ������
	[IsDeleted] bit not null default 0, -- ������� �������� ������

	constraint PK_Price_Id primary key clustered (Id), -- ��������� ����
	constraint FK_PositionId_toPosition foreign key (PositionId) references [dbo].[Position] ([Id]) -- �������� � Position
)
GO

CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- id �������
	[ClientName] [nvarchar](50) NOT NULL, -- ��� ����������� �������
	[Discount] tinyint  NOT NULL, -- ������, %
	[Summary] [int] NOT NULL, -- ����� ����� ������������ �����

	[InsertDate] [datetime] not null, -- ���� ���������� ������
	[UpdateDate] [datetime] not null, -- ���� �������� ������
	[IsDeleted] bit not null default 0, -- ������� �������� ������

	constraint PK_Clients_Id primary key clustered (Id), -- ��������� ����
	constraint DiscountCheck check (Discount between 0 and 100) -- ����������� ���� ������ �� 0 �� 100 ���������
) ON [PRIMARY]
GO

-- ������ ��������
create table [dbo].[ClientOrder](
	id int identity(1, 1) not null, -- id ������
	ClientId int not null, --id �������
	[PositionId] [int] NOT NULL, -- Id ������
	[Qnt] int NOT NULL, -- ����������
	[Summary] [int] NOT NULL, -- ����� ����� ������������ � ���������� ������
	OrderAccepted bit not null default 0, -- ����� ������

	[InsertDate] [datetime] not null, -- ���� ���������� ������
	[UpdateDate] [datetime] not null, -- ���� �������� ������
	[IsDeleted] bit not null default 0, -- ������� �������� ������

	constraint PK_ClientOrder_Id primary key clustered (Id), -- ��������� ����
	constraint FK_ClientId_toClient foreign key (ClientId) references [dbo].Client ([Id]), -- �������� � Client
	constraint FK_PositionId_toPosition_cli foreign key ([PositionId]) references [dbo].[Position] ([Id]) -- �������� � Position
)
go

CREATE INDEX INDEX_PRICE ON Price ([Id]); /*��� ������� �� ���������������� ������*/
go

CREATE INDEX INDEX_Company ON Company ([Id]); 
go

CREATE INDEX INDEX_Position ON Position ([Id]); 
go

CREATE INDEX INDEX_Client ON Client ([Id]); 
go

CREATE UNIQUE INDEX  ClientOrder ON  ClientOrder  (id DESC, ClientId DESC, InsertDate desc);  