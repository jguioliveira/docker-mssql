USE master
GO

USE [master]
GO
CREATE DATABASE [AdventureWorksLT2017] ON 
( FILENAME = N'/var/opt/mssql/data/AdventureWorksLT2012.mdf' ),
( FILENAME = N'/var/opt/mssql/data/AdventureWorksLT2012_log.ldf' )
 FOR ATTACH
GO

-------------------------------------------------
--> Set DEFAULT_DATABASE
-------------------------------------------------

USE master
GO
ALTER LOGIN [sa] WITH DEFAULT_DATABASE = [AdventureWorksLT2017]
GO

