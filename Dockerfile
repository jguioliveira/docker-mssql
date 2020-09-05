#FROM microsoft/mssql-server-windows-developer:latest
FROM mcr.microsoft.com/mssql/server:latest

# Switch to root user for access to apt-get install
USER root

ENV MSSQL_PID Developer
ENV MSSQL_MEMORY_LIMIT_MB 1024
ENV ACCEPT_EULA Y

# Comandos para Restore do Banco de Dados
# WORKDIR /var/opt/mssql/backup
# COPY ./backup/ .
# WORKDIR /opt/var/scripts
# COPY ./scripts-restore/ .
# RUN ["chmod", "+x", "/opt/var/scripts/restore-backup.sh"]

# Comandos para Attach do Banco de Dados
WORKDIR /var/opt/mssql/data
COPY ./data/ .
WORKDIR /opt/var/scripts
COPY ./scripts-attach/ .

COPY ./entrypoint.sh .

RUN ["chmod", "+x", "/opt/var/scripts/attach-database.sh"]

# Switch back to mssql user and run the entrypoint script
USER mssql

ENTRYPOINT [ "/bin/bash", "/opt/var/scripts/entrypoint.sh" ]
