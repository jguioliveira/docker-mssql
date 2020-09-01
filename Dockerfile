#FROM microsoft/mssql-server-windows-developer:latest
FROM mcr.microsoft.com/mssql/server:latest

RUN mkdir /work

COPY /backups/AdventureWorksLT2017.bak /work

COPY /src/RestoreDb.sql /work

COPY /src/Restore.sh /work

WORKDIR /work

RUN chmod 755 Restore.sh

RUN ./Restore.sh RestoreDb.sql