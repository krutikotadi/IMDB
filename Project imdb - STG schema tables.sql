-- IMDb Project
-- rick sherman
-- last modified: 2020-11-29, 2020-12-01

------------------------------------------------------------------------------------------------
-- imdb datasets core
------------------------------------------------------------------------------------------------

-- stg_imdb_name_basics definition
-- DROP TABLE stg_imdb_name_basics GO

CREATE TABLE stg_imdb_name_basics (
	table_SK int NOT NULL IDENTITY(1,1),
	nconst nvarchar(10) NOT NULL,
	primaryName nvarchar(255) NULL,
	birthYear int NULL,
	deathYear int NULL,
	birthYear_char nvarchar(4) NULL,
	deathYear_char nvarchar(4) NULL,
	primaryProfession nvarchar(255) NULL,
	knownForTitles nvarchar(1024) NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (nconst)
) ;

-- stg_imdb_title_akas definition
-- DROP TABLE stg_imdb_title_akas GO

CREATE TABLE stg_imdb_title_akas (
	table_SK int NOT NULL IDENTITY(1,1),
	titleId nvarchar(10) NOT NULL,
	[ordering] int NOT NULL,
	title nvarchar(1024) NULL,
	region nvarchar(255) NULL,
	[language] nvarchar(255) NULL,
	types nvarchar(255) NULL,
	[attributes] nvarchar(1024) NULL,
	isOriginalTitle nvarchar(255) NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (titleId,[ordering])
) ;

-- stg_imdb_title_basics definition
-- DROP TABLE stg_imdb_title_basics GO

CREATE TABLE stg_imdb_title_basics (
	table_SK int NOT NULL IDENTITY(1,1),
	tconst nvarchar(10) NOT NULL,
	titleType nvarchar(255) NULL,
	primaryTitle nvarchar(1024) NULL,
	originalTitle nvarchar(1024) NULL,
	isAdult bit NULL,
	startYear int NULL,
	endYear int NULL,
	runtimeMinutes int NULL,
	startYear_char nvarchar(4) NULL,
	endYear_char nvarchar(4) NULL,
	runtimeMinutes_char nvarchar(10) NULL,
	genres nvarchar(255) NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tconst)
) ;

-- stg_imdb_title_crew definition
-- DROP TABLE stg_imdb_title_crew GO

CREATE TABLE stg_imdb_title_crew (
	table_SK int NOT NULL IDENTITY(1,1),
	tconst nvarchar(10) NOT NULL,
	directors nvarchar(4000) NULL,
	writers nvarchar(4000) NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tconst)
) ;

-- stg_imdb_title_episode definition
-- DROP TABLE stg_imdb_title_episode GO

CREATE TABLE stg_imdb_title_episode (
	table_SK int NOT NULL IDENTITY(1,1),
	tconst nvarchar(10) NOT NULL,
	parentTconst nvarchar(10) NULL,
	seasonNumber int NULL,
	episodeNumber int NULL,
	seasonNumber_char nvarchar(10) NULL,
	episodeNumber_char nvarchar(10) NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tconst)
) ;

-- stg_imdb_title_principals definition
-- DROP TABLE stg_imdb_title_principals GO

CREATE TABLE stg_imdb_title_principals (
	table_SK int NOT NULL IDENTITY(1,1),
	tconst nvarchar(10) NOT NULL,
	[ordering] int NOT NULL,
	nconst nvarchar(10) NULL,
	category nvarchar(255) NULL,
	job nvarchar(1024) NULL,
	[characters] nvarchar(1024) NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tconst,[ordering])
) ;


-- stg_imdb_title_ratings definition
-- DROP TABLE stg_imdb_title_ratings GO

CREATE TABLE stg_imdb_title_ratings (	
                   table_SK int NOT NULL IDENTITY(1,1),
	tconst nvarchar(10) NOT NULL,
	averageRating real NULL,
	numVotes int NULL,

	SOR_SK int DEFAULT -1 NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tconst)
) ;

------------------------------------------------------------------------------------------------
-- box_office_worldwide
------------------------------------------------------------------------------------------------

-- stg_box_office_worldwide definition
-- DROP TABLE stg_box_office_worldwide GO

/* assigned 2020 11

CREATE TABLE stg_box_office_worldwide (
	box_office_worldwide_sk int NOT NULL IDENTITY(1,1),

	BoxOffice_Rank int NULL,
	-- tconst nvarchar(10) NULL,
	Title nvarchar(255) NULL,
	Worldwide_LifetimeGross bigint NULL,
	Domestic_LifetimeGross bigint NULL,
	Domestic_Pct real NULL,
	Foreign_LifetimeGross bigint NULL,
	Foreign_Pct real NULL,
	Release_Year int NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (box_office_worldwide_sk)
) ;
*/

drop table  if exists stg_box_office_worldwide;

CREATE TABLE stg_box_office_worldwide (
	box_office_worldwide_sk int NOT NULL IDENTITY(1,1),

	BoxOffice_Rank int NULL,
	tconst nvarchar(10) NULL, -- not required
	Title nvarchar(255) NULL,
	Worldwide_LifetimeGross bigint NULL,
	Domestic_LifetimeGross bigint NULL,
	Domestic_Pct real NULL,
	Foreign_LifetimeGross bigint NULL,
	Foreign_Pct real NULL,
	Release_Year int NULL,
	SOR_Input  varchar(80) null,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (box_office_worldwide_sk)
) ;

CREATE TABLE stg_box_office_worldwide_all (
	box_office_worldwide_sk int NOT NULL IDENTITY(1,1),

	BoxOffice_Rank int NULL,
	tconst nvarchar(10) NULL,
	Title nvarchar(255) NULL,
	Worldwide_LifetimeGross bigint NULL,
	Domestic_LifetimeGross bigint NULL,
	Domestic_Pct real NULL,
	Foreign_LifetimeGross bigint NULL,
	Foreign_Pct real NULL,
	Release_Year int NULL,
	SOR_Input  varchar(80) null,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (box_office_worldwide_sk)
) ;

-- stg_imdb_brands_gross definition
-- DROP TABLE stg_imdb_brands_gross GO

CREATE TABLE stg_imdb_brands_gross (
	Brands_Gross_SK int NOT NULL IDENTITY(1,1),

	Brand_Name nvarchar(80) NULL,
	Total_Revenue bigint NULL,
	Number_of_Releases int NULL,
	Top_Release nvarchar(255) NULL,
	Lifetime_Gross bigint NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (Brands_Gross_SK)
) ;


-- stg_imdb_brands_list definition
-- DROP TABLE stg_imdb_brands_list GO

CREATE TABLE stg_imdb_brands_list (
	Brands_Lists_SK int NOT NULL IDENTITY(1,1),

	Brand_Name nvarchar(255) NULL,
	Realease_Rank int NULL,
	Release_Name nvarchar(255) NULL,
	Lifetime_Gross bigint NULL,
	Max_Theaters int NULL,
	Opening_Gross bigint NULL,
	Open_Theaters int NULL,
	Release_Date datetime NULL,
	Distributor nvarchar(255) NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (Brands_Lists_SK)
) ;

-- stg_imdb_franchises_gross definition
-- DROP TABLE stg_imdb_franchises_gross GO

CREATE TABLE stg_imdb_franchises_gross (
	Franchises_Gross_SK int NOT NULL IDENTITY(1,1),

	Franchise nvarchar(80) NULL,
	Total_Revenue bigint NULL,
	Number_of_Releases int NULL,
	Top_Release nvarchar(255) NULL,
	Lifetime_Gross bigint NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (Franchises_Gross_SK)
) ;


-- stg_imdb_franchises_list definition
-- DROP TABLE stg_imdb_franchises_list GO

CREATE TABLE stg_imdb_franchises_list (
	Franchises_Lists_SK int NOT NULL IDENTITY(1,1),

	Franchise nvarchar(255) NULL,
	Realease_Rank int NULL,
	Release_Name nvarchar(255) NULL,
	Lifetime_Gross bigint NULL,
	Max_Theaters int NULL,
	Opening_Gross bigint NULL,
	Open_Theaters int NULL,
	Release_Date datetime NULL,
	Distributor nvarchar(255) NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (Franchises_Lists_SK)
) ;

------------------------------------------------------------------------------------------------
-- ISO reference
------------------------------------------------------------------------------------------------

-- stg_iso_country definition
-- DROP TABLE stg_iso_country GO

CREATE TABLE stg_iso_country (
	Country_SK int NOT NULL IDENTITY(1,1),

	country_name nvarchar(255) NULL,
	alpha_2 nvarchar(2) NULL,
	alpha_3 nvarchar(3) NULL,
	country_code int NULL,
	iso_3166_2 nvarchar(80) NULL,
	region nvarchar(255) NULL,
	sub_region nvarchar(255) NULL,
	intermediate_region nvarchar(255) NULL,
	region_code int NULL,
	sub_region_code int NULL,
	intermediate_region_code int NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (Country_SK)
) ;


-- stg_iso_language definition
-- DROP TABLE stg_iso_language GO

CREATE TABLE stg_iso_language (
	Language_SK int NOT NULL IDENTITY(1,1),

	alpha3_b nvarchar(3) NULL,
	alpha3_t nvarchar(3) NULL,
	alpha2 nvarchar(2) NULL,
	Language_Name nvarchar(255) NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (Language_SK)
) ;

------------------------------------------------------------------------------------------------
-- MovieLens
------------------------------------------------------------------------------------------------

-- stg_ml_genome_scores definition
-- DROP TABLE stg_ml_genome_scores GO

CREATE TABLE stg_ml_genome_scores (
	table_SK int NOT NULL IDENTITY(1,1),
	movieId int NOT NULL,
	tagId int NOT NULL,
	relevance real NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (movieId,tagId)
) ;

-- stg_ml_genome_tags definition
-- DROP TABLE stg_ml_genome_tags GO

CREATE TABLE stg_ml_genome_tags (
	table_SK int NOT NULL IDENTITY(1,1),
	tagId int NOT NULL,
	tag nvarchar(255) NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (tagId)
) ;


-- stg_ml_links definition
-- DROP TABLE stg_ml_links GO

CREATE TABLE stg_ml_links (
	table_SK int NOT NULL IDENTITY(1,1),
	movieId int NOT NULL,
	imdbId nvarchar(20) NULL,
	tmdbId int NULL,
	tconst nvarchar(20) NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (movieId)
) ;


-- stg_ml_movies definition
-- DROP TABLE stg_ml_movies GO

CREATE TABLE stg_ml_movies (
	table_SK int NOT NULL IDENTITY(1,1),
	movieId int NOT NULL,
	title nvarchar(255) NULL,
	genres nvarchar(255) NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (movieId)
) ;


-- stg_ml_ratings definition
-- DROP TABLE stg_ml_ratings GO

CREATE TABLE stg_ml_ratings (
	table_SK int NOT NULL IDENTITY(1,1),
	userId int NOT NULL,
	movieId int NOT NULL,
	rating real NULL,
	ratings_timestamp int NULL,
	ratings_datetime datetime NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (userId,movieId)
) ;


-- stg_ml_tags definition
-- DROP TABLE stg_ml_tags GO

CREATE TABLE stg_ml_tags (
	ml_tags_sk int NOT NULL IDENTITY(1,1),
	userId int NULL,
	movieId int NULL,
	tag nvarchar(255) NULL,
	ratings_timestamp int NULL,
	ratings_datetime datetime NULL,

	SOR_SK int DEFAULT ((-1)) NOT NULL,
	DI_JobID nvarchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (ml_tags_sk)
) ;