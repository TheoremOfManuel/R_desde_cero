#INICIANDO CON R
#asigancion de variables, tipos de objeto y un poco mas

#1 Asignación de variables
"""Hay diferentes formas de asignar variables pero las mas comunes son con
   variable <- dato, o con variable = dato
1.1 variable1 <- 2
1.2 variable2 = 4

Operadores en R son: + suma; - resta; * multiplicación; / división; ^ potencia
%% modulo; %/% retorna la parte entera del cociente

Algo interesante es que con hacer num:num se crea una lista de numeros
y que al poner ; al final de cada linea quiere decir que esta ya termino
entonces es como si fuera otra linea diferente
"""

#2 Tipos de datos en R
""" Existen varios tipos de datos fundamentales que se usan para almacenar
y manipular información: 

2.1. Númericos(Numeric)
Son datos que incluyen números enteros y decimales:

  Interger: Son números enteros sin parte decimal se pueden definir agregando una L
  x <- 10L

  Double: Números de punto flotante o decimales
  x <- 10.5

2.2. Cadenas de texto:
cadenas de tipo texto (Character) deben ir entre comillas dobles o simples
string <- 'Cadena'

2.3. Booleanos: Se hacen TRUE O FALSE en mayúscula 
bool <- TRUE 

2.4. Factores: Los factores se utilizan para almacenar datos categóricos y pueden
tener niveles definidos. útiles cuando se trabaja con datos categóricos, como grupos
o categorías y permiten optimizar memoria
colores <- factor(c('rojo','verde','azul','rojo'))

2.5. Fechas y Tiempos: DAte representa solo la fecha sin hora usando la función as.Date()
fecha <- as.Date('2024-10-1') FORMATO AAAA-MM-DD
POSIXct/POSIXLt: se usan para almacenar fechas y horas. POSIXct alamcena los datos
como la cantidad de segundnos desde 1970, mientras que POSIXLt almacena los datos 
como una lista de componentes de fecha y hora 
tiempo <- as.POSIXct('2024-10-01 12:45:00')
"""
#3 Tipos de objetos-------------------------------------------------------------------
"3.1. Vectores: Arreglos ordenados donde se puede almacenar información de tipo numérico(variable cuantitativa),
alfanumérico(variable cualitativa) o lógico(TRUE FALSE), pero no mezclas de estos. la funcion de R
para crearlo es c() que significa concatenar y dentro de los parentesis se pone 
la info
nota: NA not available y se representa sin comillas
edad <- c(15,19,13,NA,20) Cuantitativo

deporte <- c(TRUE,TRUE,NA,FALSE,TRUE) Logico 

comic.fav <- c(NA,'superman','Batman',NA, 'Batman') Cualitativo y notese que pede ser 
con comillas simples '' o dobles.

SI SE DESEA VER LO QUE ESTA ALMACENADO LA INFORMACIÓN EN CADA UNO DE LOS VECTORES, SE DEBE ESCRIBIR
EN LA CONSOLA EL NOMBRE DE LOS OBJETOS Y LUEGO SE CORRE. Los vectores deben ser de un tipo
de dato especifico pues tambien pueden ser argumentos. 

nota: como #:# crea una lista de numeros entonces hacer
x <- c(1:14)
x <- 1:14 
es equivalente, ambos con vectores con los numeros en orden del 1 al 14"

edades <- c(12,13,14,NA,15)
#edades se muestran los datos en la interfaz de salida

"Para extraer un elemento almacenado dentro de un vector se usan los corchetes [] y dentro de ellos 
la posicion o posiciones que interesan empezando en 1

ej: si se quiere extraer la edad de la tercera persona se pone el nombre del vector y luego [3] para indicar la 
el objeto de la tercera

para seleccionar varios elementos se hace con [inicio:fin] ambos incluidos y teniendo
en cuenta que empieza en 1. Aunque si quiero conocer varios elementos pero en especifico
se escriben las posiciones en un pequeño vector como [c(#,#)] y asi me muestra los elementos en las posiciones
de ese vector. Si queremos ver todos los elementos menos alguno en especifico se pone [-#] y el numero
de la posición del elemento que no se quiere ver
"
edades[3] #14
edades[5] #15
edades[1:5] # 12 13 14 NA 15
edades[c(1,5)] #12 15
edades[-1] #13 14 NA 15

"3.2. Matrices Son arreglos rectangulares de filas y columnas con información numérica,
alfanumérica o lógica. Para contruir una matriz se usa la función matrix(). y de parametros
tiene los elementos que se introducen, cantidad de fias, y de columnas
matriz <- matrix(data=1:20,nrow = 4,ncol = 5,byrow = FALSE) se crea una matriz de 4 filas y 20 
columnas con los primeros 20 numeros positivos.

nota: El argumento data de la funcion sirve para indicar los datos que se van a 
almacenar en la matriz , nrow y ncol sirven para definir la dimension de la matriz 
y por ultimo el argumento byrow indica si la información contenida en data se debe ingresar
por filas o no"

matriz <- matrix(data=1:20,nrow = 4,ncol = 5,byrow = FALSE) #se llena por columnas, byrow = FALSE, es asi por defecto
matriz
#matriz <- matrix(data=1:20,nrow = 4,ncol = 5,byrow = TRUE) #se llena por filas, byrow = TRUE
#matriz

"Para extraer elementos de una matriz, al igual que los vecotres se usan los corchetes [,]y seraparado
por una coma, el numero de filas y el numero de columnas que nos interesan"

matriz[3,4] #elemento fila 3 columna 4
matriz[2,] #todos los elementos de la fila 2
matriz[,5] #todos los elementos de la columna 5
matriz[,-c(2,4)] #toda la matriz sin las columnas 2 y 4
matriz[-1,-3] #toda la matriz pero sin la fila 1 ni la columna 3
matriz[,c(2,4)]#imprimiar las colunmas 2 y 4

"Por eso notese la importancia de la coma pues separa lo que se desea mostrar y tengase en cuenta
que al usar un vector c() se impimiran es las filas o columnas depende de como se ponga respectivamente
anotadas en este vector. Algo importante para mencionar es que solo se puede de un tipo de variable
como lo son los vectores. Además es imporante notar que esta función matrix solamene
sirve para crear una matriz donde los datos que tendran será un vector dado de esa manera, 
mas adelante se introducira la forma de crear una matriz uniendo varios vectores"

m1 <- matrix(c(1,2,3,4),2,2); m1


"3.3 Arreglos, Un arreglo es una matriz de VARIAS DIMENSIONES con información numérica, alfanumérica o 
lógica. Para construirlo se usa la funcion array(). Por ejemplo para crear una arreglo 3x4x2 con las primeras
24 letras del alfabeto en minúscula se escribe como : 
  
    miarray <- array(data=letters[1:24],dim = c(3,4,2))
  
Donde el argumento data de la funcion sirve para indicar los datos que se van a almacenar y el argumento
dim sirve para indicar las dimensiones del arreglo. y pues para ver lo que tiene en el simplemente
se llama con su respectivo nombre, y pues como es una matriz de 3 dimensiones se muestran sus respectivas
caras pero sera diferente correspondiente a sus dimensiones.
Para recuperar elementos del arreglo se usan corchetes y dentro de estos las respectivas coordenadas
del elemento de interes, por lo que el orden es importante

miarray[1,3,2]: objeto de la fila 1, col 3 y de la segunda capa
miarray[,,2] toda la segunda capa completa
miarray[,3,]mostrar la col 3 de ambas capas
miarray[,c(1,3),] me mostrara los elementos de la primera y tercera columna de ambas capas
"
miarray <- array(data=letters[1:24],dim = c(3,4,2))
miarray
miarray[,,2]
miarray[,3,]
miarray[,c(1,3),]

"De manera analoga a como vimos en las matrices, hay una función para combinar matrices y crear
un array multidimensional, pero mas adelante se verá este. "

"3.4 MARCO DE DATOS O DATA FRAME: El marco de datos o data frame es uno de los objetos mas usados
porque permite AGRUPAR vectores con información de diferente tipo numérica, alfanumérica o lógica en un
mismo objeto, la única restricción es que los vectores DEBEN TENER LA MISMA LONGITUD. Para crear
un marco de datos se usa la función data.frame(), tal que:
      
      mimarco <- data.frame(edad,deporte,comic.fav)
      
      y para verlo solo hay que poner su respectivo nombre en la consola y mostrara
      una tabla con todos los vectores. Donde los nombres de las columnas son los nombres
      de los vectores con sus respectivas entradas y notese que a la izquierda
      se muestra la cantidad de informacion, la cantidad de registros, la cantidad de renglones
      que representan como cada persona.
"
edad <- c(15,19,13,NA,20)
deporte <- c(TRUE,TRUE,NA,FALSE,TRUE)
comic.fav <- c(NA,"Superman","Batman",NA,"BATMAN")
mimarco <- data.frame(edad,deporte,comic.fav)
mimarco
" Para recuperar las variables(columnas) almacenadas en un marco de datos se puede usar
el operador $, los corchetes [], y los corchetes dobles tal que: 
  
  mimarco$deporte -> y muestra el vector deportes, se recomienda hacer esto
  cuando el nombre de la variable(vector) es corto sino es mejor usar los corchetes,
  de esta manera se retorna un vector.
  
indicando la columna por medio de corchetes se usa:

  mimarco[,2] que es recomendable si el nombre de la variable es largo y se recuerda su ubicación.
  tambien retorna la informacion como un vector
  
Indicando el nombre de la variable usando [[]] con su nombre dentro y tambien retorna un vector.

  mimarco[["deporte"]]
  
se usamos mimarco["deporte"] retorna la variable en forma de marco de dato y no como vector
  
De esta manera como se pueden tener varios registros, entonces, para ver varios registros de una misma
variable se puede como: 
  mimarco[2:4,1] que representa mostrar los datos del 2 al 4 de la variable 1(edad en este caso)
y pues como ya hemos aprendido tambien podemos ver algunos datos especificos de una variable en especifico
o pues de toda las variables poniendo el c() y ahi seleccionamos el numero del registro.
TIENE LA FORMA[FILAS,COLUMNAS] por lo tanto nunca se puede olvidar la ","
"
mimarco$edad
mimarco[1:4,1]
mimarco[c(1,3),1]
mimarco[,c(1,3)] #como no estoy indicando nada mas, quiere decir que me muestre las columnas
mimarco[c(1,3),]#que me muestre todos los datos de los registros 1 y 3



#SUBCONJUNTOS *importante*
"Para extraer subconjuntos de un marco de datos se puede usar la función subset(x,subset,select). donde
el parametro x sirve para indicar el marco de datos original, el parámetro subset sirve para colocar la condición
y el parametro select sirve para quedarnos sólo con algunas de las variables del marco de datos.Tal que:

  subset(mimarco,subset = deporte == TRUE) -> y de esta manera me muestra todos un subconjunto
  del data frame, el cual me muestra solo los datos donde la variable deporte tiene TRUE
  
  subset(mimarco,subset = edad>=17) -> muesra todos los resgistros donde la edad es mayor o igual a 17
  
  si quiero por ejemplo que me muestre solamente unas variables en especifico pero a partir de una variable
  subset(mimarco,subset=edad<20,select=c('deporte','comic.fav')) me mostrara las variables deporte y comic.fav
  de los registros donde la edad es menor a 20.
  
  luego pues obviamente hay conectores logicos para tener mas de una condicion o el complemento de la condicion y asi

" 
subset(mimarco,subset = deporte == TRUE)
subset(mimarco,subset = edad>=17)

"3.5 LISTAS: Son objetos para almacenar objetos de diferente tipo, para crearla se usa la instrucción list()
por ejemplo las listas pueden tener vectores, matrices o un marco de datos"

set.seed(12345) #fija la semilla de tal manera que los números aleatorios generados en la segunda linea
#siempre los mismos
mivector <- runif(n=5) #vector con 4 números aleatorios
matriz2 <- matrix(data=1:12, ncol=6)#matriz de 6x2 con los primeros 12 numeros
milista <- list(E1=mivector, E2=matriz2, E3=mimarco) #construye la lista y se colocan los 3 objetos
#cada uno con un nombre especifico en este caso E1,E2 y E3.

" Para recuperar lo elementos almacenados en la lista se usa el operador $, corchetes dobles o sencillos, tal que:
    milista$E2, me muestra el objeto guardaro en el segundo espacio o equivalente
    milista[[2]] que viene a ser lo mismo a lo de arriba pues el resultado de ambos
    es el objeto directamente almacenado, en este caso, una matriz.
    
    milista[2] Aunque es similar a los anteriores no es lo mismo pues al usar este el resultado es una 
    lista cuyo contenido es el objeto almacenado 
    
"

#NOTA
"AL USAR $ O [[]] SE IMPRIME DIRECTAMENTE EL OBJETO, PERO, AL USAR [] IMPRIME UNA LISTA QUE TIENE EL OBJETO"

#ejercicios 
matriz1 <- matrix(data=1:100, nrow=10,ncol=10);matriz1 #De esta manera se guarda y se imprime
matriz3 <- diag(3) #NOTESE QUE EL METODO diag CREA UNA MATRIZ IDENTIDAD CUADRADA DE LA DIMENSION QUE SE DA
lista <- list(E1=matriz1,E2=matriz2)
"
edad <- c(15, 19, 13, NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)vec
comic.fav <- c(NA, 'Superman', 'Batman', NA, 'Batman')
matrix(edad, deporte, comic.fav) AL PARECER SE QUIEREN RELACIONAR TODOS LOS VECTORES
PERO PARA ESTO COMO YA SE SABE LO QUE HAY QUE HACER ES UN DATAFRAME
"

#GUIA DE ESTILO, para unas buenas practicas
"""1.1 El nombre de los archivos debe tener sentido y termine con extension.R

1.2 Para los OBJETOS se recomienda no usar los símbolos - y _ . Para las variables
es preferible usar letras minúsculas y separar las palabras con puntos (peso.maiz)
o usar camel case tal que (pesoMaiz). Para las funciones tambien usar camel case
pero incluyendo la primera letra con mayúscula (PlotRes), y para los nombres de las
constantes que inicien con la letra K (kPrecioBus)

1.3 Se recomienda que cada línea tenga como máximo 80 caracteres, en caso de ser muy larga
se debe cortar con una coma

1.4 Usar espacios alrededor de todos los operadores binarios =, +, -, <, etc y asi como 
en el español nunca colocar espacio antes de una coma pero siempre uno despúes. Tambien 
es bueno usar espacios antes de un paréntesis EXCEPTO cuando se llama una función

tab <- table(df[df$days < 0, 2]) 
tot <- sum(x[, 1]) 
tot <- sum(x[1, ])

if (debug) # Correcto
if(debug) # Funciona pero no se recomienda
colMeans (x)

Espacios extras pueden ser usados si con esto se mejora la apariencia del código, como por ejemplo

plot(x = x.coord,
     y = data.mat[, MakeColName(metric, ptiles[1], "roiOpt")],
     ylim = ylim,
     xlab = "dates",
     ylab = metric,
     main = (paste(metric, " for 3 samples ", sep = "")))

Y es importante No colocar espacios alrededor del código que esté dentro de paréntesis o 
corchetes, la única excepcion es luego de una coma.

Los signos de llaves {} se usan para agrupar bloques de código y se recomienda que nunca
una llave este abierta y cerrada en una misma linea, lo mas recomendable es que empieze
en una linea y termine en otra diferente. Y la sentencia else debe ir entre cierre y 
apertura de llaves, }else{

1.5 Para realizar asignaciones se recomienda es usar <- y no = a menos de que sea
para llenar los parametros de alguna funcion.

1.6 No se recomienda colocar varias instrucciones separadas por ;, en la misma linea
pues aunque funciona es dificil de leer, pues en varias ocasiones si ahorra bastantes
lineas de codigo
"""
#-----------------------------------------------------------------------------------
#INFORMACIÓN DE LA SESIÓN 
sessionInfo() #enseña la version y paquetes activos
# ============================
# Objetos en mi sesión:
# ============================

ls()  # Objetos activos - Forma 1
objects()  # Objetos activos - Forma 2

rm("x1") # Eliminando un objeto

rm(list=ls()) # Eliminando todos los objetos  es recomendable usarla solo al principio

# ========================================
# En cuál carpeta está  activa mi sesión:
# ========================================

getwd()

# ========================================
# Fijando una carpeta para mi sesión:
# ========================================

setwd(r"(C:\Users\mtang\onedrive\Escritorio\Documentos_estudio\estadistica\PLE)") #para cambiar la dirección de sesión
#Si se tiene una dirección con los / y no tener que cambiar todo podemos poner
#la dirección entre paréntesis y luego entre comillas y se pone una r antes
#de las comillas
setwd(r"(C:\Users\mtang\onedrive\Escritorio\clase_2)") #y si se trabaja por ejemplo con rmarkdown
#es muy útil pues hay que trabajar con direcciones