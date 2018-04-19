###########################################################
###      Read data from Microsoft SQL Server by R      ####
###########################################################

#1. Install RODBC package
install.packages("RODBC")


#2. Load the RODBC package
library(RODBC)


#3. Create connection to the MS SQL Server
conn<-odbcDriverConnect("driver={SQL Server};
                         server=acm-bi-01;
                         database=Cubes;
                         trusted_connection=true")

   #driver={SQL Server}            no need to change
   #server=acm-bi-01               acm-bi-01 is the server name, please change to your server name
   #database=Cubes                 Cubes is the database name
   #trusted_connection=true        Use this for automatic windows authentication, or
   #                               use username=... and password=... for your windows account, or
   #                               use uid=... and pwd=... for your MS SQL Server account


#4. Query tables from the database using the connection
sqlQuery(channel=conn,query='Select * from Fact_stock')
                             #sumbit a SQL query by a valid SQL statement


#5. Discounnect from the database

odbcClose(conn)

# Michael Di Su 05/04/2018