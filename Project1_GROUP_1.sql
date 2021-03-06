/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [BIClass]
GO
/****** Object:  StoredProcedure [Project1].[AddForeignKeysToStarSchemeData]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Project1].[AddForeignKeysToStarSchemeData]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimCustomer] FOREIGN KEY([CustomerKey])
	REFERENCES [CH01-01-Dimension].[DimCustomer] ([CustomerKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimCustomer]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimGender] FOREIGN KEY([Gender])
	REFERENCES [CH01-01-Dimension].[DimGender] ([Gender])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimGender]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimMaritalStatus] FOREIGN KEY([MaritalStatus])
	REFERENCES [CH01-01-Dimension].[DimMaritalStatus] ([MaritalStatus])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimMaritalStatus]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimOccupation] FOREIGN KEY([OccupationKey])
	REFERENCES [CH01-01-Dimension].[DimOccupation] ([OccupationKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimOccupation]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimOrderDate] FOREIGN KEY([OrderDate])
	REFERENCES [CH01-01-Dimension].[DimOrderDate] ([OrderDate])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimOrderDate]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimProduct] FOREIGN KEY([ProductKey])
	REFERENCES [CH01-01-Dimension].[DimProduct] ([ProductKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimProduct]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimTerritory] FOREIGN KEY([TerritoryKey])
	REFERENCES [CH01-01-Dimension].[DimTerritory] ([TerritoryKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimTerritory]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_SalesManagers] FOREIGN KEY([SalesManagerKey])
	REFERENCES [CH01-01-Dimension].[SalesManagers] ([SalesManagerKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_SalesManagers]
	--

	ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
	REFERENCES [CH01-01-Dimension].[DimProductCategory] ([ProductCategoryKey])
	--

	ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimProductCategory]
	--


	ALTER TABLE [CH01-01-Dimension].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY([ProductSubcategoryKey])
	REFERENCES [CH01-01-Dimension].[DimProductSubcategory] ([ProductSubcategoryKey])
	--

	ALTER TABLE [CH01-01-Dimension].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimProductSubcategory]
END
GO
/****** Object:  StoredProcedure [Project1].[DropForeignKeysFromStarSchemeData]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Project1].[DropForeignKeysFromStarSchemeData]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimCustomer]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimGender] 

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimMaritalStatus]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimOccupation] 

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimOrderDate] 

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimProduct]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimTerritory]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_SalesManagers]

END
GO
/****** Object:  StoredProcedure [Project1].[Load_Data]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================
-- Author: Idrees Ally
-- Create Date:  9/18/17
-- Description:
-- =====================

CREATE PROCEDURE [Project1].[Load_Data]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT INTO [CH01-01-Fact].Data
		(SalesManagerKey, OccupationKey,
		TerritoryKey, ProductKey, CustomerKey,
		ProductCategory, SalesManager, ProductSubcategory, ProductCode, ProductName, Color, ModelName, OrderQuantity, UnitPrice,
		ProductStandardCost, SalesAmount, OrderDate, MonthName, MonthNumber, Year, CustomerName, MaritalStatus, Gender, Education,
		Occupation, TerritoryRegion, TerritoryCountry, TerritoryGroup)
	SELECT 
		old.SalesManagerKey, old.OccupationKey,
		dt.TerritoryKey, dp.ProductKey, dc.CustomerKey,
		old.ProductCategory, old.SalesManager, old.ProductSubcategory, old.ProductCode, old.ProductName, old.Color, old.ModelName, old.OrderQuantity, old.UnitPrice,
		old.ProductStandardCost, old.SalesAmount, old.OrderDate, old.MonthName, old.MonthNumber, old.Year, old.CustomerName, old.MaritalStatus, old.Gender, old.Education,
		old.Occupation, old.TerritoryRegion, old.TerritoryCountry, old.TerritoryGroup
FROM
	FileUpload.OriginallyLoadedData AS old INNER JOIN
	[CH01-01-Dimension].DimProduct AS dp
		ON dp.ProductName = old.ProductName INNER JOIN
	[CH01-01-Dimension].DimTerritory as dt
		ON dt.TerritoryCountry = old.TerritoryCountry AND
			dt.TerritoryGroup = old.TerritoryGroup AND
			dt.TerritoryRegion = old.TerritoryRegion INNER JOIN
	[CH01-01-Dimension].DimCustomer as dc
		ON dc.CustomerName = old.CustomerName
END;
GO
/****** Object:  StoredProcedure [Project1].[Load_DimCustomer]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimCustomer]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimCustomer]
		(CustomerName)
	SELECT old.CustomerName
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
	[Ch01-01-Dimension].DimCustomer AS dc 
			ON dc.CustomerName = old.CustomerName;
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimGender]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimGender]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimGender]
		(Gender, GenderDescription)
	SELECT DISTINCT dg.Gender, GenderDescription = (CASE dg.Gender
			WHEN 'M' THEN 'MALE'
			ELSE 'FEMALE' END)
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
		[CH01-01-Dimension].[DimGender] AS dg ON
			dg.Gender = old.Gender
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimMaritalStatus]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimMaritalStatus]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimMaritalStatus]
		(MaritalStatus, MaritalStatusDescription)
	SELECT DISTINCT dm.MaritalStatus, MaritalStatusDescription  = (CASE dm.MaritalStatusDescription
			WHEN 'S' THEN 'SINGLE'
			WHEN 'D' THEN 'DIVORCED'
			WHEN 'W' THEN 'WIDOWED'
			ELSE 'MARRIED' END)
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
		[CH01-01-Dimension].[DimMaritalStatus] AS dm ON
			dm.MaritalStatus = old.MaritalStatus
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimOccupation]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimOccupation]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimOccupation]
		(Occupation)
	SELECT old.Occupation
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
		[Ch01-01-Dimension].DimOccupation AS do
			ON do.Occupation = old.Occupation;
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimOrderDate]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimOrderDate]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimOrderDate]
		(OrderDate, MonthName, MonthNumber, Year)

	SELECT dod.OrderDate, dod.MonthName, dod.MonthNumber, dod.Year
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
		[CH01-01-Dimension].[DimOrderDate] AS dod
			ON dod.OrderDate = old.OrderDate 
				AND dod.MonthName = old.MonthName 
				AND dod.MonthNumber = old.MonthNumber 
				AND dod.Year = old.Year;
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimProduct]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimProduct]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimProduct]
		(ProductSubCategoryKey, ProductCategory, ProductSubcategory, ProductCode, ProductName, Color, ModelName)
	SELECT dp.ProductSubcategoryKey, dp.ProductCategory, dp.ProductSubcategory, dp.ProductCode, dp.ProductName, dp.Color,dp.ModelName
	FROM [CH01-01-Fact].Data AS old INNER JOIN
		[CH01-01-Dimension].[DimProduct] AS dp
			ON dp.ProductCategory = old.ProductCategory 
			AND dp.ProductSubcategory = old.ProductSubcategory 
			AND dp.ProductCode = old.ProductCode 
			AND dp.ProductName = old.ProductName 
			AND dp.Color = old.Color 
			AND dp.ModelName = old.ModelName INNER JOIN
		[CH01-01-Dimension].DimProductSubcategory AS dps
			ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey;
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimProductCategory]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimProductCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- ERROR: An explicit value for the identity column in table 'CH01-01-Dimension.DimProductCategory' 
	--can only be specified when a column list is used and IDENTITY_INSERT is ON.
	--INSERT INTO [CH01-01-Dimension].DimProductCategory
	--SELECT old.ProductCategory, old.ProductCategory
	--FROM FileUpload.OriginallyLoadedData as old INNER JOIN
	--	[CH01-01-Dimension].DimProductCategory as dpc
	--		ON dpc.ProductCategory = old.ProductCategory AND
	--		dpc.ProductCategory = old.ProductCategory;
			--Maybe ProductCategoryKey
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimProductSubcategory]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimProductSubcategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].DimProductSubcategory
		(ProductSubcategoryKey, ProductCategoryKey, ProductSubcategory)
	SELECT old.ProductSubcategory, dpc.ProductCategoryKey, old.ProductSubcategory
	FROM FileUpload.OriginallyLoadedData as old INNER JOIN
		[CH01-01-Dimension].DimProductSubcategory as dps
			ON dps.ProductSubcategoryKey = old.ProductSubcategory 
			AND	dps.ProductSubcategory = old.ProductSubcategory INNER JOIN
		[CH01-01-Dimension].DimProductCategory as dpc 
			ON dpc.ProductCategoryKey = dps.ProductCategoryKey;
			--Maybe ProductSubcategoryKey
END
GO
/****** Object:  StoredProcedure [Project1].[Load_DimTerritory]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_DimTerritory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CH01-01-Dimension].[DimTerritory]
		(TerritoryGroup, TerritoryCountry, TerritoryRegion)
	SELECT dt.TerritoryGroup, dt.TerritoryCountry, dt.TerritoryRegion
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
		[CH01-01-Dimension].[DimTerritory] AS dt
			ON dt.TerritoryGroup = old.TerritoryGroup 
			AND dt.TerritoryCountry = old.TerritoryCountry 
			AND	dt.TerritoryRegion = old.TerritoryRegion;
END
GO
/****** Object:  StoredProcedure [Project1].[Load_SalesManagers]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[Load_SalesManagers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [CH01-01-Dimension].[SalesManagers]
		(SalesManager, Category, Office)
	SELECT sm.SalesManager, sm.Category, sm.Office
	FROM FileUpload.OriginallyLoadedData AS old INNER JOIN
		[CH01-01-Dimension].[SalesManagers] AS sm
			ON sm.SalesManager = old. SalesManager
			 AND Category IS NULL 
			 AND Office IS NULL;
END
GO
/****** Object:  StoredProcedure [Project1].[LoadStarSchemaData]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE procedure [Project1].[LoadStarSchemaData]
    -- Add the parameters for the stored procedure here
    @YesNo char(1) = 'N'
as
begin
    set nocount on;

    declare @return_value int;

	exec [Project1].[DropForeignKeysFromStarSchemeData];
    --
    --	Check to see whether to truncate the Star Schema Data
    --
    if (@YesNo = 'Y') exec @return_value = [Project1].[TruncateStarSchemaData];

    --
    --	Load the star schema
    --
    exec @return_value = [Project1].[Load_DimProductCategory];
    exec @return_value = [Project1].[Load_DimProductSubcategory];
    exec @return_value = [Project1].[Load_DimProduct];
    exec @return_value = [Project1].[Load_SalesManagers];
    exec @return_value = [Project1].[Load_DimGender];
    exec @return_value = [Project1].[Load_DimMaritalStatus];
    exec @return_value = [Project1].[Load_DimOccupation];
    exec @return_value = [Project1].[Load_DimOrderDate];
    exec @return_value = [Project1].[Load_DimTerritory];
    exec @return_value = [Project1].[Load_DimCustomer];
    exec @return_value = [Project1].[Load_Data];

	exec [Project1].[AddForeignKeysToStarSchemeData];

end;
GO
/****** Object:  StoredProcedure [Project1].[TruncateStarSchemaData]    Script Date: 9/26/2017 11:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project1].[TruncateStarSchemaData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		truncate table [CH01-01-Fact].data;
		truncate table [CH01-01-Dimension].SalesManagers;
		truncate table [CH01-01-Dimension].DimProductSubcategory;
		truncate table [CH01-01-Dimension].DimProductCategory;
		truncate table [CH01-01-Dimension].DimGender;
		truncate table [CH01-01-Dimension].DimMaritalStatus;
		truncate table [CH01-01-Dimension].DimOccupation;
		truncate table [CH01-01-Dimension].DimOrderDate;
		truncate table [CH01-01-Dimension].DimTerritory;
		truncate table [CH01-01-Dimension].DimProduct;
		truncate table [CH01-01-Dimension].DimCustomer;

end
GO
