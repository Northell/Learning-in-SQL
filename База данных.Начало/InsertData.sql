USE [Microschemes]
GO

/*	/*������� ������ �����, ����� �������*/
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
(1,'�������','718-817-797','��. ������ 12','4', GETDATE(), GETDATE(), 0),
(2,'���������','486-597-585','������� ��. 19','3', GETDATE(), GETDATE(), 0),
(3,'����������','555-555-550','��. ��������� 9','2', GETDATE(), GETDATE(), 0),
(4,'��������������','126-588-897','��. ��������� 99','1', GETDATE(), GETDATE(), 0),
(5,'�������','000-000-000','���������','5', GETDATE(), GETDATE(), 0)
GO

INSERT INTO Position ([CompanyId],[Name],[Info], [Price], [InsertDate], [UpdateDate], [IsDeleted])
VALUES
(1,'���������� p ���� �� 170�', 'qwerty1', 5, GETDATE(), GETDATE(), 0),
(2,'���������� � ���� 150�', 'qwerty2', 5, GETDATE(), GETDATE(), 0),
(3,'���������� � ���� 150�', 'qwerty3', 5, GETDATE(), GETDATE(), 0),
(4,'���������� � ���� �� -1�', 'qwerty4', 5, GETDATE(), GETDATE(), 0),
(5,'�������� ���������� � ���� �� 300�', 'qwerty5', 5, GETDATE(), GETDATE(), 0),
(1,'���������� n ���� �� 170�', 'qwerty6', 5, GETDATE(), GETDATE(), 0),
(2,'���������� n ���� 150�', 'qwerty7', 5, GETDATE(), GETDATE(), 0),
(3,'���������� n ���� 150�', 'qwerty8', 5, GETDATE(), GETDATE(), 0),
(4,'���������� n ���� �� -1�', 'qwerty9', 5, GETDATE(), GETDATE(), 0),
(5,'�������� ���������� n ���� �� 300�', 'qwerty10', 5, GETDATE(), GETDATE(), 0),
(1,'�������� �� 15 ��', 'qwerty11', 5, GETDATE(), GETDATE(), 0),
(2,'�������� �� 115 ��', 'qwerty12', 5, GETDATE(), GETDATE(), 0),
(3,'�������� �� infinity ��', 'qwerty13', 5, GETDATE(), GETDATE(), 0),
(4,'�� ��������', 'qwerty14', 5, GETDATE(), GETDATE(), 0),
(5,'������ � ������ ��������', 'qwerty15', 5, GETDATE(), GETDATE(), 0)
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
('������ �.�', 1, 150000, GETDATE(), GETDATE(), 0),
('������ �.�', 15, 14000, GETDATE(), GETDATE(), 0),
('������� �.�', 15 , 1500, GETDATE(), GETDATE(), 0),
('����� �.�',10, 158000000, GETDATE(), GETDATE(), 0),
('������ �.�', 10, 99999, GETDATE(), GETDATE(), 0),
('������� �.�',12, 98465, GETDATE(), GETDATE(), 0),
('������ �.�', 12, 4865759, GETDATE(), GETDATE(), 0),
('����� �.�', 15, 78676787, GETDATE(), GETDATE(), 0),
('������� �.�', 2, 46212354, GETDATE(), GETDATE(), 0),
('��������� �.�', 3, 161616, GETDATE(), GETDATE(), 0),
('������� �.�', 3, 48484, GETDATE(), GETDATE(), 0),
('����� �.�', 3, 11111, GETDATE(), GETDATE(), 0),
('������� �.�', 5, 135456, GETDATE(), GETDATE(), 0),
('�������� �.�', 6, 484848, GETDATE(), GETDATE(), 0),
('������� �.�', 6, 79576, GETDATE(), GETDATE(), 0),
('����� �.�', 8, 777878, GETDATE(), GETDATE(), 0),
('�������� � �', 8, 1111, GETDATE(), GETDATE(), 0),
('������� �.�', 7, 12121, GETDATE(), GETDATE(), 0),
('������ �.�', 9, 121212, GETDATE(), GETDATE(), 0),
('������� �.�', 13, 121212, GETDATE(), GETDATE(), 0)
GO


INSERT INTO [ClientOrder] (ClientId, [PositionId],[Qnt],[Summary], OrderAccepted, [InsertDate], [UpdateDate], [IsDeleted])
VALUES
(5, 2, 10, 1000, 1, GETDATE(), GETDATE(), 0)
go

set identity_insert Company off

