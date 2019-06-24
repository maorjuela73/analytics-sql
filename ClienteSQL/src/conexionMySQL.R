# Librería para conexión con BD MySQL
# install.packages("RMySQL")
library(RMySQL)

# Cadena de conexión
conexion <- dbConnect(MySQL(), 
                           user="analytics-user", 
                           password="analytics-user", 
                           host="52.38.6.74",
                           port=3306,
                           dbname='')

# Función para seleccionar la base de datos
dbSendQuery(
  conexion,
  "USE world;"
)

# ¡Cuidado con este tipo de instrucciones! Sentencia DDL que borra una base de datos
dbSendQuery(
  conexion,
  "DROP DATABASE IF EXISTS `importantdatabase` ;"
)

# Consulta especializada: existencia de tablas
dbExistsTable(conexion, 'country')
dbExistsTable(conexion, 'city')
dbExistsTable(conexion, 'countrylanguage')

# Consulta de ejemplo: Retorna todos los campos de la tabla country
paises <- dbGetQuery(conexion, "SELECT * FROM country")

continentes <- dbGetQuery(conexion, "SELECT DISTINCT Continent FROM country;")

# Consulta agregada en R
ciudades_col <- dbGetQuery(conexion, "SELECT * FROM city WHERE CountryCode = 'COL';")

library(dplyr)
ciudades_col %>% 
  group_by(District) %>% 
  summarise(
    MinPoblacion = min(Population), 
    PromPoblacion = mean(Population), 
    MaxPoblacion = max(Population)) %>% 
  View()

