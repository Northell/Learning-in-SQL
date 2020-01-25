USE [Microschemes]
GO

/*	/*Сначала чистим кобчи, затем таблицы*/
if exists (select 1 from sys.objects where name = 'Company_CountryID_FK' and type='F')
begin
alter table company drop constraint  Company_CountryID_FK
end

if exists (select 1 from sys.objects where name = 'FK_PositionId_toPosition' and type='F')
begin
alter table price drop constraint  FK_PositionId_toPosition
end

if exists (select 1 from sys.objects where name = 'FK_ClientId_toClient' and type='F')
begin
alter table clientorder drop constraint  FK_ClientId_toClient
end

if exists (select 1 from sys.objects where name = 'FK_PositionId_toPosition_cli' and type='F')
begin
alter table clientorder drop constraint  FK_PositionId_toPosition_cli
end

if exists (select 1 from sys.objects where name = 'FK_CompanyId_toCompany' and type='F')
begin
alter table position drop constraint  FK_CompanyId_toCompany
end

Truncate table dbo.Price
Truncate table dbo.clientorder 
Truncate table dbo.Client
Truncate table dbo.Company
Truncate table dbo.Position*/






set identity_insert dbo.Company on


Insert Into Company ([Id], [Name], [PhoneNumber], [Address], [PaymentRating], [InsertDate], [UpdateDate], [IsDeleted])
Values
(1,'Питушка','718-817-797','пр. Ленина 12','4', GETDATE(), GETDATE(), 0),
(2,'НеПитушка','486-597-585','Невский пр. 19','3', GETDATE(), GETDATE(), 0),
(3,'СуперГипер','555-555-550','ул. Матросова 9','2', GETDATE(), GETDATE(), 0),
(4,'НеСуперНеГипер','126-588-897','ул. Матросова 99','1', GETDATE(), GETDATE(), 0),
(5,'Микрачи','000-000-000','Неверлэнд','5', GETDATE(), GETDATE(), 0)
GO

INSERT INTO Position ([CompanyId],[Name],[Info], [Price], [InsertDate], [UpdateDate], [IsDeleted])
VALUES
(1,'Транзистор p типа на 170В', 'qwerty1', 5, GETDATE(), GETDATE(), 0),
(2,'Транзистор р типа 150В', 'qwerty2', 5, GETDATE(), GETDATE(), 0),
(3,'Транзистор р типа 150В', 'qwerty3', 5, GETDATE(), GETDATE(), 0),
(4,'Транзистор р типа на -1В', 'qwerty4', 5, GETDATE(), GETDATE(), 0),
(5,'Конечный транзистор р типа на 300В', 'qwerty5', 5, GETDATE(), GETDATE(), 0),
(1,'Транзистор n типа на 170В', 'qwerty6', 5, GETDATE(), GETDATE(), 0),
(2,'Транзистор n типа 150В', 'qwerty7', 5, GETDATE(), GETDATE(), 0),
(3,'Транзистор n типа 150В', 'qwerty8', 5, GETDATE(), GETDATE(), 0),
(4,'Транзистор n типа на -1В', 'qwerty9', 5, GETDATE(), GETDATE(), 0),
(5,'Конечный транзистор n типа на 300В', 'qwerty10', 5, GETDATE(), GETDATE(), 0),
(1,'Резистор на 15 Ом', 'qwerty11', 5, GETDATE(), GETDATE(), 0),
(2,'Резистор на 115 Ом', 'qwerty12', 5, GETDATE(), GETDATE(), 0),
(3,'Резистор на infinity Ом', 'qwerty13', 5, GETDATE(), GETDATE(), 0),
(4,'Не резистор', 'qwerty14', 5, GETDATE(), GETDATE(), 0),
(5,'Старый и ржавый резистор', 'qwerty15', 5, GETDATE(), GETDATE(), 0)
GO


Insert  INTO Price ([PositionId], [Qnt], [InsertDate], [UpdateDate], [IsDeleted])
VALUES 
( 10, 22, GETDATE(), GETDATE(), 0),
( 5, 1, GETDATE(), GETDATE(), 0),
( 1, 456, GETDATE(), GETDATE(), 0),
( 2, 4, GETDATE(), GETDATE(), 0),
( 8, 2, GETDATE(), GETDATE(), 0),
( 6, 0, GETDATE(), GETDATE(), 0),
( 3, 26, GETDATE(), GETDATE(), 0),
( 14, 13, GETDATE(), GETDATE(), 0),
( 13, 13, GETDATE(), GETDATE(), 0),
( 2, 2, GETDATE(), GETDATE(), 0),
( 9, 2, GETDATE(), GETDATE(), 0),
( 12, 2, GETDATE(), GETDATE(), 0),
( 4, 2, GETDATE(), GETDATE(), 0),
( 4, 12, GETDATE(), GETDATE(), 0),
( 2, 2, GETDATE(), GETDATE(), 0)
GO

INSERT INTO Client([ClientName],[Discount],[Summary],[InsertDate], [UpdateDate], [IsDeleted])
VALUES
('Хромов А.Е', 1, 150000, GETDATE(), GETDATE(), 0),
('Храмов Е.А', 15, 14000, GETDATE(), GETDATE(), 0),
('Царицын Б.В', 15 , 1500, GETDATE(), GETDATE(), 0),
('Чазов Я.Ф',10, 158000000, GETDATE(), GETDATE(), 0),
('Чапаев У.Й', 10, 99999, GETDATE(), GETDATE(), 0),
('Челомей У.Е',12, 98465, GETDATE(), GETDATE(), 0),
('Рыжков Е.Ж', 12, 4865759, GETDATE(), GETDATE(), 0),
('Рытин Х.Щ', 15, 78676787, GETDATE(), GETDATE(), 0),
('Сабитов Ю.П', 2, 46212354, GETDATE(), GETDATE(), 0),
('Сальников Ж.Ж', 3, 161616, GETDATE(), GETDATE(), 0),
('Сахаров Х.Е', 3, 48484, GETDATE(), GETDATE(), 0),
('Путин Х.К', 3, 11111, GETDATE(), GETDATE(), 0),
('Попырин Ц.Е', 5, 135456, GETDATE(), GETDATE(), 0),
('Пономарёв Ц.Е', 6, 484848, GETDATE(), GETDATE(), 0),
('Потапов З.Д', 6, 79576, GETDATE(), GETDATE(), 0),
('Машир Ж.О', 8, 777878, GETDATE(), GETDATE(), 0),
('Медведев О О', 8, 1111, GETDATE(), GETDATE(), 0),
('Мелехов Ш.Н', 7, 12121, GETDATE(), GETDATE(), 0),
('Минеев Ш.Щ', 9, 121212, GETDATE(), GETDATE(), 0),
('Миронов Ш.Е', 13, 121212, GETDATE(), GETDATE(), 0)
GO


INSERT INTO [ClientOrder] (ClientId, [PositionId],[Qnt],[Summary], OrderAccepted, [InsertDate], [UpdateDate], [IsDeleted])
VALUES
(5, 2, 10, 1000, 1, GETDATE(), GETDATE(), 0)
go

set identity_insert Company off

