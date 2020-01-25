USE [master] 
GO  
IF exists (select 1 from sys.databases	where name='MicroSchemes')
Drop database MicroSchemes
go

CREATE DATABASE [MicroSchemes]  
ON Primary 
( NAME = N'Microschemes',  
    FILENAME = N'E:\Program Files\MS SQL\MSSQL14.MSSQLSERVER\MSSQL\DATA\Microschemes.mdf' , 
	SIZE = 8192KB ,
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 65536KB   
    )  
	LOG ON
( NAME = N'Microschemes_log',
  FILENAME = N'E:\Program Files\MS SQL\MSSQL14.MSSQLSERVER\MSSQL\DATA\Microschemes_log.ldf' , 
SIZE = 8192KB , 
MAXSIZE = 2048GB , 
FILEGROWTH = 65536KB
)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Microschemes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO