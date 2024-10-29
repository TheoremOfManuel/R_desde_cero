#CREACION Y VECTORIZACIÓN DE FUNCIONES 

#FUNCIONES EN R
"Ya sabemos que una función es como un maquina que sirve para retornar
un resultado a partir de unos parametros dados, tenemos los argumentos
que sirven para reazliar un procedimiento de la fución, el cuerpo que es
quien utiliza la información brindada y los outputs que son la salida, 
lo que la funcion retornara. Para esto usaremos el comando reservado
function tal que: 

nombre_de_la_funcion <- function(par1,par2,...) {
  cuerpo
  cuerpo
  cuerpo
  .
  .
  .
  return(resultado)
}

En R tambien cuando una función encuentra un instrucción return, esta inmediatamente
termina a la ejecución y devuelve el valor especificado y todo el codigo despues
del return no se ejecuta. RECORDEMOS QUE ESTE TIPO DE LENGUAJES COMO PYTHON
SE LLAMAN LENGUAJES DE TIPADO DINÁMICO donde no es necesario declarar el tipo 
de una variable antes de asignarle un valor, en cambio java y c++ son de 
tipado estático pues hay que declarar el tipo de las variables antes de usarlas.
notemos que para retornar los valores usar un vector es util si son todos objetos
del mismo tipo, pero si usamos una lista podemos guardar varios objetos
de distintos tipos o pues tambien iguales. 
"

#VECTORIZACIÓN DE FUNCIONES
"R trabaja de forma vectorizada, es decir, la mayoría de procedimientos o funciones
quedan vectorizadas por naturaleza por esa razón podemos evaluar una función en un único valor 
o en un vector y el resultado será el resultado esperado. Sin embargo, en algunas situaciones
la vectorización no está garantizada y por eso al evaluar nuestra función en un vector,
el resultado no coincide con lo esperado. (Una función vectorizada es una función que 
puede operar directamente sobre vectores o arreglos completos en lugar de procesar
cada elemento uno por uno dentro de un bucle, estas funciones permiten escribir
codigo más simple y rápido. Suelen estar optimizadas internamente, por lo que 
suelen ejecutarse más rapido que un bucle que recorre cada elemento, usan codigo
mas corto y facil de leer ya que no necesitan bucles para procesar cada elemento
y consumen menos memoria). En resúmen permite aplicar una operación a todos los 
elementos de un vector al mismo tiempo.

HAY QUE ASEGURAR LA VECTORIZACIÓN EN LAS FUNCIONES QUE CREAMOS: 

FORMA1: lo primero es crear una funcion auxiliar que recibe un vector y no 
valores esperados. Es decir, suponer que la función los valores que se 
necesitan por medio de un vector y dentro de la funcion se sacan los valores
individuales, tal que: 

un ejercicio de hallar las raices de un polinomio de segundo grado

raices1 <- function(a, b, c) {
  raiz1 <- (-b - sqrt(b^2-4*a*c)) / (2*a)
  raiz2 <- (-b + sqrt(b^2-4*a*c)) / (2*a)
  return(c(raiz1, raiz2))
} 
Pero notese que si a esta funcion se le dan vectores, puede que funcione
pero no de la manera que queremos, asi que hcemos esa funcion 
auxiliar que reciba un vector,

raiz_aux <- function(x) {
    a <- x[1]
    b <- x[2]
    c <- x[3]
    raiz1 <- (-b - sqrt(b^2-4*a*c)) / (2*a)
    raiz2 <- (-b + sqrt(b^2-4*a*c)) / (2*a)
    return(c(raiz1, raiz2))
}

Y de esta semana se esta modificando el caso que se pase un vector como argumento
y la clave de crear la funcion vectorizada es que ella reciba los valores de los
coeficientes por separado. Que internamente se construya una matriz m con los 
valores individuales que ingrese el usuario y sa matriz se le aplique POR FILAS
la función auxiliar que cramos para obtener las respectivas raices. (en conclusión,
crear una funcion auxiliar que desarrolle el problema pero con una matriz como parametro,
pero esta sera pasada por otra funcion que es quien recibe todos los vectores que ingresa
el usuario, para crear una matriz con estos y que por cada fila se vaya evaluando
cada vector con esa funcion auxiliar creada anteriormente.)

raices2 <- function(v1, v2, v3){
  m <- cbind(v1, v2, v3) #creando una matriz por columnas
  res <- apply(X=m, MARGIN=1, FUN=raiz_aux) #quiere decir que se le aplicara la funcion raiz_aux a cada fila
  # de la matriz m
  rownames(res) <- c("raiz_1","raiz_2") #le pone nomber a las filas
  return(t(res)) #me retorna la transpuesta de la matriz, por eso el resultado
  #me aparece como columnas 

}

De esta manera al hacer raices2(c(1,1,1), c(4,3,2), c(0,2,-3) ) la funcion
creara una matriz donde cada vector sera una columna y se evaluaran las raices
por cada fila de esa matriz. ES MUY IMPORTANTE ENTENDER EL CONTEXTO DE COMO 
SE INGRESARAN LOS DATOS. 


FORMA2: Hay una función básica llamada Vectorize que nos ayuda a crear
funciones vectorizadas. por ejemplo

  raices3 <- Vectorize(raices1)
  
y de esta manera coincide con los resultados de la funciones raices2 que construimos

¿Y CUAL ES MEJOR? hay que verificar su tiempo de procesamiento
usando el paquete microbenchmark, se puede hacer una prueba comparando el tiempo
de ejecucion entre diferentes métodos o algoritmos. toma el tiempo en procesar
las instrucciones despues de la compilacion, tiempo que se demora en dar el resultado.

EN CASO DE NECESITAR MAS INFORMACION EN EL LIBRO DE R HAY VARIOS LINKS CON MAS INFORMACION
PARA ESTE TIPO DE FUNCIONES EN CASO DE SER REQUERIDAS. 
            
"