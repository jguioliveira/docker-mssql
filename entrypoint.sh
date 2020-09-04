# sobe serviço sql & executa rotina de restore do db & sleep infinity para manter processo em execução
/opt/mssql/bin/sqlservr & /work/restoredb.sh & sleep infinity
