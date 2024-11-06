#INGRESAR DATOS EN R 
"La función readline sirve para mostrar un mensaje
e ingresar datos por la consola que luego se puede usar
para alguna operación." 

my_name <- readline(prompt="Ingrese su nombre: ") #donde la funcion prompt es para mostrar el mensaje
my_age  <- readline(prompt="Ingrese su edad en años: ")
my_age  <- as.integer(my_age) #aca se esta castando el dato

print(paste("Hola,", my_name, 
            "el año siguiente usted tendra", 
            my_age + 1, 
            "años de edad.")) #salida



#USANDO VENTANA EMERGENTE CON SVDIALOGS. 
"El paquete svDialogs se puede usar para crear ventanas emergentes con un mensaje 
y solicitando información  que se puede guardar en una variable"
find.package("svDialogs", quiet = TRUE) #para saber si esta
install.packages("svDialogs") # Para instalar el paquete
library(svDialogs)            # Para usar el paquete

#FUNCIÓN dlgInput()
"Muestra el cuadro de diálogo donde el usuario puede 
escrir un valor o texto
  dlgInput(message="texto", default="",...)
  message: mensaje que se muestra en el cuadro
  default: VAlor predeterminado que aparece en el
  cuadro de texto
  ... otros"
my_name <- dlgInput(message="Ingrese su nombre: ")$res
my_age  <- dlgInput(message="Ingrese su edad en años: ")$res
my_age  <- as.integer(my_age) # convert character into integer
#poner $res extrae el valor ingresado por el usuario
print(paste("Hola,", my_name, 
            "el año siguiente usted tendá", 
            my_age + 1, 
            "años de edad."))

#USANDO BOTONES PARA RESPONDER
#FUNCIÓN winDialog
"La función winDialog del paquete __utils_ sirve para crear botones de diálogo
en windows, tal que:

  windialog(type=..., message="",...)
  type: tipos de botones para que puedan salir(ok, okcancel, yesno,
  yesnocancel)
  menssage: mensaje que aparece en el cuadro de dialogo
"
library(utils)
winDialog(type="ok", message="¿Usted quiere BORRAR el archivo?")
winDialog(type="okcancel", message="¿Usted quiere BORRAR el archivo?")
winDialog(type="yesno", message="¿Usted quiere BORRAR el archivo?")
winDialog(type="yesnocancel", message="¿Usted quiere BORRAR el archivo?")
"Obviamente todo se guarda en una variable para ser usado el boton correpondiente"
#-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|

#LECTURA DE BASES DE DATOS
"Una base de datos es un sistema organizado para almacenar, gestionar y acceder a datos
de manera estructurada. Los datos estan organizados en tablas, filas y columnas, en la cual
cada fila representa un registro y cada columna una caracteristica y en la cual se puede
buscar, actualizar y eiminar datos facilmente. 

Para R, usualmente los archivos con la información para ser leídos se pueden almacenar
en formato: 

  plano con extensión .txt 
  Excel con extensión .csv
  
Ejemplo de una base de datos simple.
Edad	Fuma	Pais
35	TRUE	Colombia
46	TRUE	Francia
23	FALSE	Malta

- Almacenamiento de información en Excel: Para almacenar información en Excel, 
abrimos un archivo nuevo en esta  aplicación y copiamos la información como se ve 
en el ejemplo de arriba. Se debe iniciar en la parte superior izquierda, no se 
deben dejar filas vacias, ni colorear, ni poner bordes. Por último se guarda el
archivo en la carpeta deseada y al momento de nombrar el archivo se debe modificar
la opcion de tipo de archivo a csv(delimitado por comas) 

- Almacenamiento de información en bloc de notas: Para guardar la información de
la base de datos abrimos un achivo nuevo de bloc de notas y copiamos la información
tal como se muestra en la tabla, en la esquina superior izquierda separando las columnas
con el espacio del tabulador y los registros con enter. ES IMPORTANTE QUE EL CURSOR
QUEDE EN LA PRIMERA LINEA DE ABAJO LUEGO DE LA TABLA, EN EL RENGLON VACIO."

#FUNCIÓN read.table
"Es una función que se usa para leer datos desde un archivo .txt o .csv y trabajar
con ellos en R, tal que: 

  read.table(file, header=BOOLEANO, sep="", ...)
  
  file: Ruta del archivo que quieres leer
  header: Indica si la primera fila del archivo contiene los nombre de las
  columnas con TRUE o si todos los datos son valores con FALSE.
  sep: Especifíca el separador de los datos, "," para archivos CSV O 
  "/t" para tabulaciones en archivos de texto
  dec: símbolo con el cual están indicados los decimales.
"
#ejemplo archivo .csv
datos <- read.table(file="C:/Users/usuario/Escritorio/ejemplo_lectura_BD.csv",
                    header=TRUE, sep=",");datos 
#nota: recuerde que \ no es compatible, debe usar /, en caso de que tenga 
#problemas, basta con poner file.choose() en file para que se abra una ventana
# y asi pueda seleccionar manualmente el archivo. 
#Otra forma es con r("url") y asi R sabe que es una dirección.

#ejemplo archivo .txt
datos <- read.table(file=file.choose(), header=TRUE, sep="\t");datos
#el separador \t se pone en caso de que el bloc de notas separe los datos con tabulador

as.data.frame(datos) #se castea a un dataframe para una mejor vizualizacion

#LECTURA DE BASES DE DATOS DE EXCEL
#FUNCIÓN read_excel()
"Cuando los datos están disponibles en un archivo estándar de Excel, y dentro
de cada archivo hojas con la información a utilizar. En estos casos es recomendable
usar el paquete readxl y en particular la funcion read_exel, tal que: 

library(readxl) #descargarla en caso que no se tenga
usaremos la funcion read_excel, se usa para leer los archivos de tipo .xls o 
.xlsx y cargar su contenido en R como un data R

  datos <- read_excel(path, sheet=NULL, range=NULL, col_names=True, col_types=NULL, ...)
  path: Ruta del archivo a leer
  sheet: Nombre de la hoja de excel en caso que tenga mas de 1 hoja
  range: Rango de celdas para leer, por si no que desean todas. 
  col_names: Indica si la primera fila debe usarse como los nombres de las 
  columnas y es TRUE por defecto
  col_types: Permite especificar el tipo de dato de cada columna 
  
  De manera análoga para visualizarla se puede castear a un data frame tal que
  as.data.frame(datos)
"
# |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
#TABLAS DE FRECUENCIA 
"Son una forma de organizar y resumir datos mostrando la cantidad de veces que 
cada valor o categoría aparece en un conjunto de datos. Son especialmente
útiles para comprender la distribución de los datos y analizar patrones. Contiene
las categorías, la frecuencia absoluta (cantidad de veces que cada valor aparece
en el conjunto de datos), frecuencia relativa (proporción que representa cada valor
en relación al total), frecuencia acumulada (suma de las frecuencias absolutas)
y permiten ver rápidamente cómo se distribuyen los datos en diferentes valores
o categorías, útiles para el analisis exploratorio e identificar patrones, 
tendencias y datos anómalos y la contrucción de gráficos de barras, histogramas
y otros."

#FUNCIÓN table()
"Es una función para crear tablas de frecuencia a partir de uno o más vectores
o variables. 
  table(x, exclude, useNA, ...)
x: nombre de objetos para los cuales se contruira la tabla
exclude: vector con los niveles a remover de la tabla. Exclude=NULL se desean
ver los NA, lo que equivale a usar useNA='always'
useNA: Lugar para decidir que pasara con los NA, 'no' si no se desean usar,
'ifany' y 'always' si se desean incluir."

fuma <- c('Frecuente', 'Nunca', 'A veces', 'A veces', 'A veces',
          'Nunca', 'Frecuente', NA, 'Frecuente', NA, 'hola', 
          'Nunca', 'Hola', 'Frecuente', 'Nunca')
table(fuma)
table(fuma, useNA='always') #Muestra los Na
table(fuma, exclude=c('Hola', 'hola'))# excluye las dos columnas con nombre hola
tabla1 <- table(fuma, exclude=c('Hola', 'hola', NA))
tabla1

"Nota: Al crear una tabla con la intstrucción table(var1, var2) la variable 1
quedara por filas mientras que la variable 2 quedara como columnas"

sexo <- c('Hombre', 'Hombre', 'Hombre', NA, 'Mujer',
          'Casa', 'Mujer', 'Mujer', 'Mujer', 'Hombre', 'Mujer', 
          'Hombre', NA, 'Mujer', 'Mujer')
table(sexo, fuma)

"De manera análoga podemos quitar las variables o categorías que no nos
sirven con la función exclude"

tabla2 <- table(sexo, fuma, exclude=c('Hola', 'hola', 'Casa', NA))
tabla2

#FUNCIÓN prop.table
"Se usa para crear tablas de frecuencia relativa a partir de las tablas
de frecuncia absoluta, es decir, calcula las proporciones de cada valor
con relación al total

  prop.table(x, margin=NULL)
  x: tabla de frecuencia creada con table() o una matriz de datos númericos
  margin: Forma de calcular la proporcion
    1: Proporción por filas 
    2: Proporción por columnas
    NULL: para frecuencias globales (por defecto)"
prop.table(x=tabla1)
tabla3 <- prop.table(x=tabla2) #proporción global
tabla3
tabla4 <- prop.table(x=tabla2, margin=2) #proporción marginal por columnas
tabla4

#FUNCIÓN addmargins
"Se usa para agregar totales de filas, columnas o ambos en una tabla o matriz. 
útil para ver las sumas o promedios totales de cada fila y columna y obtener
un resumen completo de datos

    addmargins(x, margin, FUN=sum, ...)
    x: tabla o matriz a agregar margenes
    margin: indica margenes a agregar 
      1: para columnas
      2: para filas
      NULL: de manera global(por defecto)
    FUN: Función para calcular margenes(por defecto sum)

ES MUY IMPORTANTE QUE 1 Y 2 ES EL CONTRARIO A LA ANTERIOR FUNCIÓN PROP.TABLE
simplemente que en el output se nota como si fuera alrevez en la interfaz."
tabla3
addmargins(tabla3)
addmargins(tabla3, margin=1)
addmargins(tabla3, margin=2)

#FUNCIÓN hist
"Es una función para crear tablas de frecuencia para variables cuanttativas
tal que: 

  hist(x, breaks='Sturges', include.lowest=TRUE, right=TRUE, plot=FLASE)
  x: vector númerico
  
  breaks: Vector para los limites de los interavlos. Si no se especifica se usa la 
  regla de Sturges para definir el numero de intervalos y el ancho. 
  
  include.lowest: Booleano, TRUE para que un valor pueda coincidir con un limite
  del intervalo izquierdo, FALSE para que quede en el lado derecho (Recuerde que 
  deben ser intervalos semi-abiertos).
  
  right: Booleano, TRUE para intervalos abierto a derecha y FALSE para cerrados 
  a derecha.
  
  plot: Booleano, FALSE para solo la tabla de freciencia, TRUE para la representacion
  grafica de historgrama y se tendran que usar mas parametros para organizar la gráfica.
  "
x <- rnorm(n=200, mean=170, sd=5)
res1 <- hist(x=x, breaks='Sturges', plot=FALSE)
res1
