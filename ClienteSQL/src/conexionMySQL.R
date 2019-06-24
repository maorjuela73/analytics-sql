# Librería para conexión con BD MySQL
# install.packages("RMySQL")
library(RMySQL)

# Cadenna de conexión
conexionLocal <- dbConnect(MySQL(), 
                           user="analytics-user", 
                           password="analytics-user", 
                           host="52.38.6.74",
                           port=3306,
                           dbname='',
                           encoding="UTF-8")

# Función para enviar DDL
dbSendQuery(
  conexionLocal,
  "USE world;"
)

# Cuidado con este tipo de instrucciones
dbSendQuery(
  conexionLocal,
  "DROP DATABASE IF EXISTS `importantdatabase` ;"
)

# Consulta especializada: existencia de tablas
dbExistsTable(conexionLocal, 'country')
dbExistsTable(conexionLocal, 'city')
dbExistsTable(conexionLocal, 'countrylanguage')

example1 <- dbGetQuery(conexionLocal, "SELECT * FROM country")


