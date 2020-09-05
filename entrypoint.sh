# sobe serviço sql & executa rotina de restore do db & sleep infinity para manter processo em execução
# /opt/mssql/bin/sqlservr & /opt/var/scripts/restore-backup.sh & sleep infinity

# sobe serviço sql & executa rotina de attach do db & sleep infinity para manter processo em execução
/opt/mssql/bin/sqlservr & /opt/var/scripts/attach-database.sh & sleep infinity
