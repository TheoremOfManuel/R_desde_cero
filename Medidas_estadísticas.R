#MEDIDAS ESTADÍSTICAS

#MEDIDAS DE TENDENCIA CENTRAL
url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo'#base de datos
datos <- read.table(file=url, header=T)#crear una tabla de frecuencia de los datos
head(datos)  # Para ver el encabezado de la base de datos

#MEDIA 
"Para calcularla media de una variable cuantitativa, se usa la
función mean. 
    mean(x, trim=0, na.rm=FALSE)
    x: vector o conjunto de datos
    trim: fracción que indica que 
    proporción de los valores debe 
    eliminarse antes de calcular la
    media(0 por defecto)
    na.rm = valor booleano, TRUE
    para eliminar los NA, y FALSE
"
mean(datos$altura) #la estatura meida de los estudiantes en cm
