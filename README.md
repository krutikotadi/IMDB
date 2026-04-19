# IMDb Data Analysis: Data Warehousing & BI for IMDb

Overview
An end-to-end data warehousing project that integrates data from four major entertainment sources — IMDb, MovieLens, Box Office Mojo, and The Numbers — into a dimensional data model for business intelligence and analytics. The project follows a complete ETL pipeline from raw data ingestion through staging, integration, and reporting layers.

Dimensional Model
The integration layer transforms raw staging data into a star schema:
Dimension Tables — genres, title types, names (actors/directors/writers), title basics, title episodes, title AKAs, job categories, professions, crew (directors & writers), principals, brands, franchises, ISO countries, and ISO languages.
Fact Tables — IMDb title ratings, box office worldwide revenue, brands gross & list, franchises gross & list, MovieLens ratings, genome scores, genome tags, tags, and The Numbers daily/franchise box office.
Data Quality — the model includes dedicated reject tables for data validation across dimensions and facts (e.g., dim_imdb_title_akas_rejects, fct_ml_ratings_rejects), ensuring data integrity throughout the pipeline.


Data Sources & Downloads
The raw datasets are not included in this repository due to file size. They can be obtained from:

IMDb Datasets: https://datasets.imdbws.com/ (title.basics, title.ratings, name.basics, title.crew, title.principals, title.episode, title.akas)
MovieLens 25M: https://grouplens.org/datasets/movielens/25m/
Box Office Mojo: https://www.boxofficemojo.com/ (top 1000 worldwide, franchises, brands)
The Numbers: https://www.the-numbers.com/ (daily box office, franchise box office)
