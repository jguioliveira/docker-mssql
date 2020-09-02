#FROM microsoft/mssql-server-windows-developer:latest
FROM mcr.microsoft.com/mssql/server:latest

# Switch to root user for access to apt-get install
USER root

WORKDIR /work

ADD ./backup/AdventureWorksLT2017.bak .

ADD ./RestoreDb.sql .
ADD ./restoredb.sh .
# ADD ./entrypoint.sh .

#RUN chmod +x ./Restore.sh
RUN ["chmod", "+x", "./restoredb.sh"]
#RUN ./Restore.sh RestoreDb.sql

# Switch back to mssql user and run the entrypoint script
USER mssql

ENTRYPOINT [ ]
#CMD /bin/bash ./entrypoint.sh

#RUN ./RestoreDb.sql
