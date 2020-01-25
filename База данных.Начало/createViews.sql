use Microschemes
go

IF EXISTS(select * FROM sys.views where name = 'vPrice')
drop view vPrice
go

create view vPrice
as
	select p.PositionId, pos.Name, pos.Info, pos.Price, p.Qnt, (pos.Price * p.Qnt) TotalSumm, p.UpdateDate
	from dbo.Price p
		join dbo.Position pos on pos.Id = p.PositionId and pos.IsDeleted = 0
	where p.IsDeleted = 0;


go

IF EXISTS(select * FROM sys.views where name = 'vClientOrder')
drop view vClientOrder
go

create view vClientOrder
as
	select co.id, pos.Name, c.ClientName, co.Qnt, co.Summary, co.OrderAccepted, co.UpdateDate
	from dbo.ClientOrder co
		join dbo.Position pos on pos.Id = co.PositionId and pos.IsDeleted = 0
		join dbo.Client c on c.Id = co.ClientId


go
