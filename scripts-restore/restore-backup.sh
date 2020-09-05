export SA_PASSWORD=teste@123

#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..50};
do
	/opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -d master -i RestoreDb.sql
        if [ $? -eq 0 ]
	then
		echo "RestoreDb.sql completed"
		break
	else
	        echo "not ready yet..."
	        sleep 1
	fi
done
