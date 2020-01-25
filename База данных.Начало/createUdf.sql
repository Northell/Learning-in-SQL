use Microschemes
go

create function dbo.ClientsCounts()
returns int
as
begin	
	declare @count int;

	select @count = count(id)
	from dbo.Client
	where IsDeleted = 0

	return @count;
end;
go

create procedure dbo.AddClient
	@Name nvarchar(50), 
	@Disc tinyint
as
	insert into dbo.Client ([ClientName],[Discount],[Summary],[InsertDate], [UpdateDate], [IsDeleted])
	values (@Name, @Disc, 0, GETDATE(), GETDATE(), 0);

