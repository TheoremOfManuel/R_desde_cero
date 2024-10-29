#FUNCIONES BÁSICAS DE R, 
# https://cran.r-project.org/doc/contrib/Short-refcard.pdf cheatsheet

"Ya se sabe que es recomendable usar <- como operador de asignacion de variables
pero si se tiene que asignar una variable dentro de una funcion es mas recomendable
usar el operador =

--------------------------------------------------------------------------------
Desde que varios vectores o matrices tengan las mismas cantidad de dimensiones
entre si se pueden hacer las operaciones matematicas ya conocidas simplemente
sumando el nombre de sus variables donde ya estan contenidos, con +, -, *, /

--------------------------------------------------------------------------------
Para pruebas logicas se tienen los operadores de siempre <,<=,>,>=,==, != y pues
simplemente retorna un booleano, esto se puede usar facilmente para seleccionar 
elementos de un objeto, como matriz, vector o incluso un data frame

dataframe[dataframe$variable>#,] me retorna todos los registros con todas
las columnas, pero donde la columna variable sea mayor que # pues para seleccionar
los elementos de un dataframe es [filas,columnas] donde las filas son los registros
y columnas son las variables

vector[vector>=#] me retorna los valores que son mayores o iguales que #.
--------------------------------------------------------------------------------
También tenemos los operadores logicos tal que: 
!x, negación de x
x&y, x&&y conjunción entre x e y
x|y, x||y, xor(x,y), disjuncion entre x e y

Es muy importante mencionar que si se le hace una prueba logica a un vector
es porque se le hace una prueba logica a cada entrada pero cuando se usa && o ||
es una conjuncion y disjuncion vectorial respectivamente, que hace que se le aplique
la conjuncion o disjuncion al vector de resultados al usar & o | respectivamente
"
edad <- c(15,19,13,NA,20)
deporte <- c(TRUE,TRUE,NA,FALSE,TRUE)
comic.fav <- c(NA,"Superman","Batman",NA,"BATMAN")
mimarco <- data.frame(edad,deporte,comic.fav)
mimarco[mimarco$edad >= 15 & mimarco$deporte == TRUE, ]#Me retorna todos los registros donde la edad es 15 y deporte es TRUE
# y pues notese que me muestra toda la información de todas las columnas.

#LA FUNCIÓN WITH es una función util pues simplifica el acceso a las variables dentro de un data
#frame u otro entorno evitando tener que escribir el nombre del dataframe repetidamente, es decir,
#permite trabajar directamente con las columnas del dataframe como si fueran variables individuales 
# por lo que permite escribir menos y de una forma mas natural. with(data,expre) donde data
#es el data frame y expre es la expresion que se desea evaluar. La misma instruccion anterior
#pero de una forma mas natural con la función with es
with(mimarco,mimarco[edad >= 15 & deporte == TRUE, ])

#-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#FUNCIONES SOBRE VECTORES 
"En R se pueden destacar las siguientes funciones basicas sobre vectores NUMERICOS: 

min(vec): valor minimo del vector
max(vec): valor máximo del vector
length(vec): tamaño del vector
range(vec): obtiene el rango de los valores del vector, es decir, el mínimo y el maximo
sum(vec): sumatoria de los elementos
prod(vec): prodcutoria de los elementos
which.min(vec): posicion del valor mínimo
which.max(vec): posicion del valor máximo
which(expr):retorna los indices de los elementos que satisfacen la expresion, pero notese que es 
una expresion logica
rev: invierte el vector


mean(vec): retorna la media
median(vec): retorna la mediana
sd(vec): retorna la desviacion estandar
unique(vec): retorna los valores sin repetirse
as.numeric(vec),as.character(vec),as.logical() castea los datos del vector, obvio deben tener sentido
all(vec expre) verifica si todos los elementos del vector satisfacen una condicion
any(vec expre) verifica si alguno de todos los elementos cumplen con alguna condicion
append(vec1,vec2) concatena 2 vectores 
sample() genera una muesta aleatoria del vector

NOTA: na.rm = TRUE sirve para eleminar los datos NA de algun objeto pues quiere decir
remover valores na.

"
myvec <- c(2,3,2,1,2,0,NA,0,9,6)
min(myvec) #en este caso el mínimo sera el NA pues no se sabe que puede teneer
min(myvec,na.rm = TRUE) #en este caso el mínimo será el cero, pues ya no hay NA
max(myvec) #en este caso sera na pues no se sabe que puede tener
max(myvec,na.rm = TRUE) #ahora como no hay NA el dato mayor sera el 9
range(myvec) #aparecera el minimo y el maximo automaticamente, en este caso NA y NA
range(myvec,na.rm = TRUE) #en este caso ahora si apareceran los disponibles
sum(myvec) #retorna NA pues no tiene todos los valores disponibles
sum(myvec,na.rm = TRUE)
prod(myvec,na.rm = TRUE) #pasara lo mismo, si no se quitan los NA retornara NA 
which.min(myvec) #posicion del numero menor
which.max(myvec)#posición del número mayor
unique(myvec)

#NOTESE para which  no es necesario usar na.rm = TRUE, y notese que se el valor
#mínimo o máximo esta mas de una vez, retorna el primero que encuentra.

# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#FUNCIONES MATEMÁTICAS 

#medidas trigonometricas sin,cos,tan,etc
angulos <- c(1,pi/2,pi)
sin(angulos) #sin(x)
tan(angulos) #tan(x)
cos(anglos) #cos(x)

#logaritmos log(x,base), si no se especifica la base es logaritmo natural
log(100)#base e
log10(100) #base 10 
log(125,base = 5)

#exponencial exp(x)
exp(1)

#raices
sqrt(49) #raiz cuadrada
#elevar a una fraccion 

#valor absoluto abs(x)
abs(-3.6)

# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#FUNCION SEQ  
"Sirve para crear frecuencias de numeros de una manera sencilla usando la funcion
seq de tal manera que 

seq(from=1,to=1,by,lenth.out)

from: inicio
to: fin, no siempre se alcanza
by: paso
length.out: longitud deseada de la secuencia"
seq(0,1,length.out=11) #seq(from=0, to=1, lenght.out=11)

"y tengase en cuenta que en R existe el operador binario : para construir
secuencias de uno en uno facilmente 

2:8   2,3,4,5,6,7,8
3:-5  3,2,1,0,-1,-2,-3,-4,-5

NOTA: Un operador binario es un operador que actúa sobre dos operandos. Es decir,
requiere dos entradas para llevar a cabo una operación como +,-,*,/, ==, etc se 
llaman binarios porque necesitan dos operandos"
# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#FUNCIÓN REP
"Se pueden crear repeticiones usando la función rep

rep(x, times=1,length.out=NA, each=1)

x: vector con los elementos a repetir o el elemento a repetir
times: veces que x se repite
length.out: longitud deseada para el vector resultante
each: número de veces que se debe repetir cada elemento de x

esta es una funcion muy versatil que permite hacer mucho.

times=1 por defecto, pero si se tiene que x es un vector
se puede seleccionar cuanto se repite cada elemento con times=c(1,2,1,1,...)
y da a conocer cuantas veces se repite cada elemento de x respectivamente.

each=1 es por defecto, aunque se usa es cuando TODOS los elementos se repiten
en un número específico de veces, seria como times=c(2,2,2,2,2,...) pero en lugar
de eso se pone each=2

"
rep(c(1,2,3,4),times=2) #repite 2 veces el vector

rep(c(1,2,3,4),each=2) #solo se repite 1 vez el vector pero cada elemento se repite 2 veces, por defecto time=1, y como
#todos se repiten por eso uso each, aunque tambien se pue usar el times pero pues no es necesario
rep(c(1,2,3,4),times=c(2,2,2,2)) #que viene a ser lo mismo

#tambien se puede hacer seleccionando cuantas veces se repite cada elemento
rep(x=1:4,times=c(2,1,2,1))#el elemento 1 y 3 se repite 2 veces y el elemento 2 y 4 solo 1 vez, no uso each porque no 
#todos se repiten

rep(x=1:4, each=2, len=4) #dice que de un vector de los numeros del 1 al 4, cada numero se repite 2 veces
#pero solo me mostrara los primeros 4 elementos del vector resultante

rep(x=1:3, each=2, times=3) #dice que de un vector de los primero 3 numeros, cada uno se repite 2 veces
#y todo este vector de numeros repetidos, se hara 3 veces


# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#FUNCIONES ROUND, CEILING, FLOOR Y TRUNC
"Funciones utiles para modificar u obtener información de un número

round(x,digits): redondea al número según los digitos indicados

ceiling(x) entrega el mínimo entero mayor o igual que x

floor(x) entrega el máximo entero menor o igual que x

trunc(x) entrega la parte entera de un numero"
# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|

#FUNCIONES SORT Y RANK
"Son funciones utiles y para ordenar elementos de un vector o paa saber las posiciones
que ocuparian los elementos de un vector al ser ordenado

sort(x,decrasing = FALSE)
rank(x)

x: vector a ordenar, con el que se trabajara
decreasing: sirve para indicar si el ordenamiento es de menor a mayor(por defecto) o de mayor a menor"

x <- c(2,3,6,4,9,5)
sort(x)
sort(x, decreasing=TRUE)
rank(x) #muestra como se deberian mover las posiciones de cada elemento para quedar ordenado de manera ascendente

# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#OTRAS FUNCIONES MUY UTILES E INTERESANTES


"
COMO CASTER EN R: Para castear en R hay funciones de conversión específicas
en lugar de asignar directamente una nueva clase con class(), las cuales son 

as.numeric(variable) -> convierte a tipo numerico
as.character(variable) -> convierte a tipo carácter
as.interger(variable) -> convierte a tipo entero
as.factor(variable) -> convierte a tipo factor o categoría
as.logical(variable) -> convierte a un tipo booleano
as.data.frame(variable) -> convierte a un data frame
as.matrix(variable) -> convierte a una matriz
as.list(variable) -> convierte a una lista
as.array(variable) -> conviete en un array multidimensional
etc

class(objeto): Retorna la clase a la cual pertenece un objeto

-----------------------------------------------------------------------------
set.seed(): establece la semilla para el generador de números aleatorios.
garantiza que al ejecutar funciones aleatorias se obtenga el mismo resultado
en cada ejecucion, se usa mucho en simulaciones estadisticas, machine learning
y pruebas y validaciones, Sirve para hacer predecibles las variables aleatorias
pues las funcines aleatorias son funciones de distribuciones.
-----------------------------------------------------------------------------
diag(): Tiene varias funcionalidades con matrices diagonales. 
puede crear una matriz diagonal, extraer la diagonal de una 
matriz existente o modificar los valores en la diagonal de una matriz. 
  diag(c(1,2,3)) crea una matriz donde la diagonal principal
  son los valores dados y de esto cero
  
  diag(4) crea una matriz identidad cuadrada de dimensiones igual 
  al numero dado
  
  diag(3,2): el primer elemento indica  lo que hay que colocar 
  en la diagonal princiapl y el segundo es la dimension
  
  diag(3,2,4): lo mismo que la anterior pero con 2 filas 
  y 4 columnas
  
  si no se pone nada en la informacion para llenar se pone 1 
  en la diagonal principal
  
  diag(mimatriz) extrae la diagonal principal de una matriz
  
  diag(mimatriz) <- c(10,20,30) modifica la diagonal principal
  por el los valores del vector dado
-----------------------------------------------------------------------------
cbind(): se usa para combinar o unir vectores, matrices o dataframes por columnas,
es decir, coloca cada objeto porporcionado como una columna en una nueva estructura
gerenalmente como una matriz o data frame.

  cbind(v1,v2,v3) crea un matriz donde esos vectores son las columnas
  cbind(m1,m2) crea una matriz mas grande unidas por columnas de esas 2 matrices
  df <- cbind(df,nueva_columna = c(1,2,3)) agrega COLUMNAS NUEVAS a una matriz
  o data frame ya existente
  
rbind(): funciona de manera similar a cbind() pero en lugar de unir por columnas
une por filas

Son formas diferentes de crear una matriz, la principal diferencia entre usar
esto y usar la funcion matrix() es la forma de guardar datos pues con matrix
hay que llenar el parametro data con un vector y dar las dimensiones,
pues con cbind o rbind, se crea directamente la matriz con los vectores dados.

t(matriz): me retorna la traspuesta de una matriz, cambia filas en columnas
y columnas en filas 
-----------------------------------------------------------------------------
apply(): Esta funcion sirve para aplicar una funcion a las filas 
o las columnas de una matriz o un data frame. ES MUY UTIL PARA EVITAR
BUCLES cuando se realizan operaciones repetitivas sobre filas o columnas de 
estructuras de datos haciendo el codigo mas eficiente y legible 

  apply(X, MARGIN, FUN, ...)
  x: matriz o data frame
  margin: indica si la funcion se aplica a 1-> para fila y 2-> para columnas
  fun: la funcion que se desea aplicar(sum, mean, min, etc)
  ... argumentos adicionales 
-----------------------------------------------------------------------------
sample(): sirve para seleccionar aleatoriamente elementos de un vector o generar
una muestra aleatoria de números, muy util para simulaciones, muestreo
o cuando se necesita crear datos de prueba.

  sample(x, size, replace = FALSE, prob = NULL)
  x: Vector o rango de valores a muestrear
  size: numero de elementos a seleccionar de X
  replace: indica se se permite la selección con reemplazo, si 
  es TRUE indica que un elemento puede ser seleccionado varias veces
  prob: un vector de probabilidades para cada elemento de X

-----------------------------------------------------------------------------
nchar(variable): retorna el numero de caracteres dentro de una cadena


-----------------------------------------------------------------------------
VARIABLES INCORPORADAS EN R

-letters: es un vector predefinido que contiene
las letras del alfabeto ingles, de la a - z, es una variable incorporada.
-LETTERS contiene las letras pero en mayúscula.
-month.abb: abreviatura de los nombre de los meses
-mont.name: nombres completos de los meses
-pi: el valor de pi

-----------------------------------------------------------------------------
PARA VERIFICAR EL TIEMPO DE PROCESAMIENTO 
Con el paquete "microbenchmark" podemos verificar los tiempos de procesamiento
para varias pruebas tal que

library(microbenchmark) #se llama el paquete
res <- microbenchmark(vect_origen=raices2(1,4,0),
                      vect_vector=raices3(1,4,0),
                      times = 50L)
res #y asi se hacen 50 pruebas para comparar las dos funciones

plot(res, col=c("tomato", "deepskyblue1")) #asi saco un boxplot de los resultados
y se puede notar que en verdad no hay mucha diferencia. ES IMPORTANTE COMPARAR
SIEMPRE LAS FUNCIONES VECTORIZADAS DE ORIGEN Y CON VECTORIZE PARA ELEGIR LA OPCIÓN
MAS OPTIMA. 
