create database [NimapInfotechTask]
USE [NimapInfotechTask]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CId], [CategoryName]) VALUES (1, N'Groceries')
GO
INSERT [dbo].[Category] ([CId], [CategoryName]) VALUES (2, N'Beverages')
GO
INSERT [dbo].[Category] ([CId], [CategoryName]) VALUES (3, N'Electronics')
GO
INSERT [dbo].[Category] ([CId], [CategoryName]) VALUES (4, N'Furniture')
GO
INSERT [dbo].[Category] ([CId], [CategoryName]) VALUES (5, N'Stationary')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (1, N'Lichhi', 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (2, N'Traficona', 2)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (3, N'Dell', 3)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (4, N'Whirlpool', 4)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (5, N'Pens', 5)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (6, N'Geometribox', 5)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId]) VALUES (1002, N'Dell', 3)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CId])
GO
/****** Object:  StoredProcedure [dbo].[SpDeleteCategory]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpDeleteCategory](@CId int)
as
begin
Delete from Category where CId=@CId
end
GO
/****** Object:  StoredProcedure [dbo].[SpDeleteProduct]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpDeleteProduct](@ProductId int)
as
begin
Delete from Product where ProductId=@ProductId
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetCategory]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SpGetCategory]
as
begin
select * from Category 
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetCategoryById]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetCategoryById](@CId int)
as 
begin
Select * from Category where CId=@CId 
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetProduct]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetProduct]
as
begin
select * from Product 
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetProductById]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetProductById](@ProductId int)
as 
begin
Select * from Product where ProductId=@ProductId 
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetProductDetails]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetProductDetails]
as
begin
select ProductId,ProductName,CategoryId,CategoryName from Product
inner join Category
on Product.CategoryId=Category.CId
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetProducts]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetProducts]
as
begin
select * from Product
inner join Category
on Product.CategoryId=Category.CId
end
GO
/****** Object:  StoredProcedure [dbo].[SpInsertCategory]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpInsertCategory](@CategoryName varchar(50))
as 
begin
insert into Category values(@CategoryName)
end
GO
/****** Object:  StoredProcedure [dbo].[SpInsertProduct]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpInsertProduct](@ProductName varchar(50),@CategoryId int)
as 
begin
insert into Product values(@ProductName,@CategoryId)
end
GO
/****** Object:  StoredProcedure [dbo].[SpUpdateCategory]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpUpdateCategory](@CId int, @CategoryName varchar(50))
as
begin
update Category set CategoryName=@CategoryName where CId=@CId
end
GO
/****** Object:  StoredProcedure [dbo].[SpUpdateProduct]    Script Date: 04-05-2023 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpUpdateProduct](@ProductId int, @ProductName varchar(50),@CategoryId int)
as
begin
update Product set ProductName=@ProductName,CategoryId=@CategoryId where ProductId=@ProductId
end
GO
