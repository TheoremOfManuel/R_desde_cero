#INGRESAR DATOS EN R 
"la funcion readline sirve para mostrar un mensaje
e ingresar datos por la consola que luego se puede usar
para alguna operación. 

my_name <- readline(prompt="Ingrese su nombre: ") #donde la funcion prompt es para mostrar el mensjae
my_age  <- readline(prompt="Ingrese su edad en años: ")
my_age  <- as.integer(my_age) #aca se esta castand el dato

print(paste("Hola,", my_name, 
            "el año siguiente usted tendra", 
            my_age + 1, 
            "años de edad.")) #salida

"

#USANDO VENTANA EMERGENTE CON SVDIALOGS. 
"el paquete svDialogs se puede usar para crear ventanas emergentes con un mensaje 
y solicitando información  que se puede guardar en una variable"
find.package("svDialogs", quiet = TRUE)
install.packages("svDialogs") # Para instalar el paquete
library(svDialogs)            # Para usar el paquete

my_name <- dlgInput(message="Ingrese su nombre: ")$res
my_age  <- dlgInput(message="Ingrese su edad en años: ")$res
my_age  <- as.integer(my_age) # convert character into integer

print(paste("Hola,", my_name, 
            "el año siguiente usted tendá", 
            my_age + 1, 
            "años de edad."))

#USANDO BOTONES PARA RESPONDER 
"La función winDialog del paquete __utils_ sirve para crear botones de dialogo
en windows. tal que: 
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
abrimos un archivo nuevo en esta  aplicación y copiamos la informacion como se ve 
en el ejemplo de arriba ySe debe iniciar en la parte superior izquierda, no se 
deben dejar filas vacias, ni colorear, ni poner bordes. Por ultimo se guarda el
archivo en la carpeta deseada y al momentode nombrar el archivo se debe modificar
la opcion de tipo de archivo a csv(delimitado por comas) 

- Almacenamiento de información en bloc de notas: Para guardar la informacion de
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
  columnas con TRUE o si todos los datos son valores con FALSE
  sep: Especifica el separados de los datos, "," para archivos CSV O 
  "/t" para tabulacions en archivos de texto
  dec: símbolo con el cual están indicados los decimales.
"
#ejemplo archivo .csv
datos <- read.table(file="C:/Users/usuario/Escritorio/ejemplo_lectura_BD.csv",
                    header=TRUE, sep=",");datos 
#nota: recuerde que \ no es compatible, debe usar /, en caso de que tenga 
#problemas, basta con poner file.choose() en file para que se abra una ventana
# y asi pueda seleccionar manualmente el archivo

#ejemplo archivo .txt
datos <- read.table(file=file.choose(), header=TRUE, sep="\t");datos
#el separador \t se pone en caso de que el bloc de notas separe los datos con tabulador

as.data.frame(datos) #se castea a un dataframe para una mejor vizualizacion

#LECTURA DE BASES DE DATOS DE EXCEL
"Cuando los datos están disponibles en un archivo estándar de Excel, y dentro
de cada archivo hojas con la informaciónn a utilizar. En estos casos es recomendable
usar el paquete readxl y en particular la funcion read_exel, tal que: 

library(readxl) #descargarla en caso que no se tenga
usaremos la funcion read_excel, se usa para leer los archivos de tipo .xls o 
.xlsx y cargar su contenido en R como un data R

  read_excel(path, sheet=NULL, range=NULL, col_names=True, col_types=NULL, ...)
  path: Ruta del archivo a leer
  sheet: Nombre de la hoja de excel en caso que tenga mas de 1 hoja
  range: Rango de celdas para leer, por si no que desean todas. 
  col_names: Indica si la primera fila debe usarse como los nombres de las 
  columnas y es TRUE por defecto
  col_types: Permite especificar el tipo de dato de cada columna 
  

"
