USE master
GO

PRINT 'Restoring LAI'
 -------------------------------------------------
--> Restoring LAI 
-------------------------------------------------

RESTORE DATABASE AdventureWorksLT2017
FROM DISK =  N'/work/AdventureWorksLT2017.bak'
WITH FILE = 1,
     MOVE N'db_lai'
     TO  N'/var/opt/mssql/data/AdventureWorksLT2017.mdf',
     MOVE N'db_lai_log'
     TO  N'/var/opt/mssql/data/AdventureWorksLT2017_log.ldf',
     NOUNLOAD,
     STATS = 5;

GO

-------------------------------------------------
--> Set DEFAULT_DATABASE 
-------------------------------------------------

USE master;
GO
ALTER LOGIN [sa] WITH DEFAULT_DATABASE = [AdventureWorksLT2017]
GO
