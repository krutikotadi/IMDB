--------------------------------------------------------------------------------------------
-- imdb project
-- The Numbers 
-- 2020-12-02
-- r sherman
--------------------------------------------------------------------------------------------

CREATE TABLE stg_numbers_daily_box_office (
	daily_box_office_sk int NOT NULL IDENTITY(1,1),

	Movie_Name nvarchar(255) NOT NULL,
	Show_Date datetime NOT NULL,
	Daily_Rank int NULL,
	Daily_Gross bigint NULL,
	Daily_Change_Pct decimal(10,3) NULL,
	Weekly_Change_Pct decimal(10,3) NULL,
	Number_of_Theaters int NULL,
	Gross_Per_Theater bigint NULL,
	Total_Gross bigint NULL,
	Number_of_Days int NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
                   DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (daily_box_office_sk)
) ;

CREATE TABLE stg_numbers_frachise_all_box_office (
	frachise_all_box_office_sk int NOT NULL IDENTITY(1,1),

	Franchise nvarchar(255) NOT NULL,
	No_of_Movies int NOT NULL,
	Domestic_Box_Office bigint NOT NULL,
	Infl_Adj_Dom_Box_Office bigint NOT NULL,
	Worldwide_Box_Office bigint NOT NULL,
	First_Year int NOT NULL,
	Last_Year int NOT NULL,
	No_of_Years int NOT NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (frachise_all_box_office_sk)
) ;

-- DROP TABLE stg_numbers_frachise_movies_box_office GO

CREATE TABLE stg_numbers_frachise_movies_box_office (
	frachise_movies_box_office_sk int NOT NULL IDENTITY(1,1),
	Franchise nvarchar(255) NOT NULL,
	Release_Date datetime NOT NULL,
	Movie_Name nvarchar(255) NOT NULL,
	Production_Budget bigint NULL,
	Opening_Weekend bigint NULL,
	Domestic_Box_Office bigint NULL,
	Worldwide_Box_Office bigint NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (frachise_movies_box_office_sk)
) ;