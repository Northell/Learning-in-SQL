USE [Microschemes]
GO

ALTER INDEX ALL ON  dbo.Price 
   REORGANIZE;  
--

ALTER INDEX ALL ON  dbo.Position
   REORGANIZE;  
--

ALTER INDEX ALL ON  dbo.Company 
   REORGANIZE;  
--

ALTER INDEX ALL ON  dbo.Client
   REORGANIZE;

ALTER INDEX ALL ON  dbo.ClientOrder
   REORGANIZE;  --