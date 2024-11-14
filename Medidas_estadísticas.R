#MEDIDAS ESTADÍSTICAS

#MEDIDAS DE TENDENCIA CENTRAL
url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo'#base de datos
datos <- read.table(file=url, header=T)#crear una tabla de frecuencia de los datos
head(datos)  # Para ver el encabezado de la base de datos

#MEDIA 
"Para calcularla media muestral(calculada frente a una muestra de la población) de una variable cuantitativa, se usa la
función mean. 
    mean(x, trim=0, na.rm=FALSE)
    x: vector o conjunto de datos
    trim: fracción que indica que 
    proporción de los valores debe 
    eliminarse antes de calcular la
    media(0 por defecto)
    na.rm = valor booleano, TRUE
    para eliminar los NA, y FALSE
  Pue sla media poblacional necestia el acceso a todos los elementos de la polación
  que se calcula de manera muy teórica y rara vez se tienen. En caso que 
  se tengan todo los datos y se halla la esperanza de la v.a se tendrá
  la media poblacional 
"
mean(datos$altura) #la estatura meida de los estudiantes en cm

"Supongamos que se quiere la altura pero diferenciado por sexo, para esto
hay que partir el vector altura según los niveles de la variable sexo, lo 
cual se consigue con la función (split)
"
sapply(split(datos$altura, datos$sexo),mean)

"Es importante mencionar que cuando hay un NA retornara NA como respuesta finial
por lo tanto hay que eliminar los NA para poder hallar la media"
edad <- c(18, 23, 26, 32, NA, 32, 29)
mean(edad)
mean(edad, na.rm=TRUE)
mean(na.omit(edad))

#MEDIANA 
"usamos la función median y se indica si se desea
quitar o no los valores NA, tal que: 

  median(x, na.rm=FALSE)

Donde x es la variable de interes para la cual se quiere
calcular la mediana "

#Moda
"Como la tabla es el valor que mas se repite  lo que mejor
se puede hacer es hacer una tabla de frecuencia de cada variable
y contar"
tabla <- table(datos$edad); tabla
str(tabla) #indica las variables que hay y su tipo
sort(tabla) #me muestra que el 25 es el que mas tiene frecuencia


#MEDIDAS DE VARIABILIDAD

#RANGO: Rango de una variable cualitativa
"
  range(x, na.rm=FALSE)"

#Varianza
"Calcula la varianza muestral de una variable cuantitativa
se usa 
    var(x, na.rm=FALSE)

la función var se puede aplicar
tanto a vectores como a marcos de datos. Al aplicarse a marcos de datos
se obtiene una matriz en que la diagonal representa
las varianzas de cada una de las variables mientras que arriba
y abajo de esta diagonal se encuentran las covarianzas 
entre pares de variables "

#DESVIACIÓN ESTANDAR
"Raiz de la varianza: 
  sd(x, na.rm=FALSE)
ojo, este no sirve para matrices, solamente sirve para
vectores "

#COEFICIENTE DE VARIACIÓN
"Se define como CV = desviacion/media

  coef_var <- function(x, na.rm = FALSE){
    return sd(x, na.rm=FALSE)/mean(x, na.rm=FALSE)
}"

#CUANTILES 
"Para obtener cualquier cuantil se usa la funcion
quantile, tal que:  
  
  quantile(x, probs, na.rm = FALSE)
  x: conjunto de datos
  probs: vector de probabilidades que 
  indica los cuantiles deseados, 0, 1, 0.25, etc"
  
#MEDIDAS DE CORRELACIÓN 
"Recordemos que indica que tan relacionadas
están dos variables entre si, se mide entre -1 y 1 donde
una correlación de 1 es perfecta (las variables cambian juntas), 
pero -1 (aumenta mientras la otra disminuye de manera correcta) o 
0 para indicar que no hay relación. 

  cor(x, y, use"everything", method=c("pearson","kendall","spearman"))
  x, y: vectores cuantitativos
  use: parametro que indica lo que se debe hacer cuando se 
  presenten registros NA en alguno de los vectores. 
  method: tipo de coeficiente de correlación