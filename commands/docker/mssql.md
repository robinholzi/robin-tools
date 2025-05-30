Useful commands:

start terminal container
docker run -d -v /scratch/robinholzi/gh/modyn/:/modyn/ ubuntu bash -c "while true; do sleep 3600;

sqlcmd -U SA -P P@assword1 -d tempdb -q "SELECT name, database_id, create_date FROM sys.databases"

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@assword1" \
 -p 1433:1433 --name SA --hostname localhost \
 -d \
 mcr.microsoft.com/mssql/server:2017-latest

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@assword1" \
 -p 1433:1433 --name SA --hostname localhost \
 -d \
 mcr.microsoft.com/mssql/server:2022-latest

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@assword1" \
 -p 1433:1433 --name SA --hostname localhost \
 -d \
 mcr.microsoft.com/mssql/server:2019-latest

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@assword1" \
 -p 1433:1433 --name SA --hostname localhost \
 -d \
 mcr.microsoft.com/mssql/server:2017-latest

—

# add git lfs

git add --renormalize . 
