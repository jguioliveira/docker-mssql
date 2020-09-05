USE master
GO

DECLARE @DBNAME nvarchar(128) = N'AdventureWorksLT2017'

IF NOT (EXISTS (SELECT 1 FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = @DBNAME OR name = @DBNAME)))
	BEGIN 
		PRINT 'Restoring AdventureWorksLT2017'
		-------------------------------------------------
		--> Restoring AdventureWorksLT2017
		-------------------------------------------------
		RESTORE DATABASE [AdventureWorksLT2017]
		FROM  DISK = N'/var/opt/mssql/backup/AdventureWorksLT2017.bak'
		WITH  FILE = 1,
		MOVE N'AdventureWorksLT2012_Data' TO N'/var/opt/mssql/data/AdventureWorksLT2012.mdf',
		MOVE N'AdventureWorksLT2012_Log' TO N'/var/opt/mssql/data/AdventureWorksLT2012_log.ldf',
		NOUNLOAD,
		STATS = 5
	END
GO

-------------------------------------------------
--> Set DEFAULT_DATABASE
-------------------------------------------------

USE master
GO
ALTER LOGIN [sa] WITH DEFAULT_DATABASE = [AdventureWorksLT2017]
GO
