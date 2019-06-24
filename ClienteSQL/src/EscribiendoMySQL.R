# Leyendo datos del portapapeles
library(readr)
orders <- read.csv("clipboard",sep = '\t')
customers <- read.csv("clipboard",sep = '\t')

# Guardando tablas resultados en la base de datos
conexion <- dbConnect(MySQL(), 
                      user="analytics-user", 
                      password="analytics-user", 
                      host="52.38.6.74",
                      port=3306,
                      dbname='orders_data')
dbWriteTable(conexion, 'customers', customers, overwrite=TRUE, row.names = FALSE)
dbWriteTable(conexion, 'orders', orders, overwrite=TRUE, row.names = FALSE)