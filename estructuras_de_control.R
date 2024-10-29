#INSTRUCCIONES DE CONTROL

#CONDICIONALES
"
A continuación se presentan las diferentes estructuras de control: 

1.1 INSTRUCCIÓN IF: Para realizar operaciones de una sola condición  
if (condición) {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
}

1.2 INSTRUCCION IF y ELSE: Para realizar operaciones con solo 2 condiciones
una u otra de descarte
if(condicion) {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
} else {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
}

1.3 INSTRUCCION ifelse: Se recomienda usar ifelse cuando hay una sola
instrucción para el caso if y para el caso else. tal que

ifelse(condicion,operacion SI cumple, operacion NO cumple)

1.4 INSRUCCION else-if: Para operaciones que tienen mas de dos sentencias
 
if (condicion) {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
} else if (condicion) {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
} else {

operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
}

Notese que simpre se deja un espacio antes de abrir la llave para las sentencias

"
#-------------------------------------------------------------------------------
#CICLOS Y BUCLES

#CICLO FOR
"Como ya sabemos el ciclo for es para recorrer objetos o para iterar un numero
determinado de veces

for (variableIteradora in objetoIterable) {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
}
"
#CICLO WHILE
" Se usa para repetir un procedimiento una cantidad indefinida de veces
todo dependiendo de una condicion dada tal que

while (condicion){
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
}
"

#INTRUCCION REPEAT
"La instrucción repeat es muy útil pues es el equivalente al do-while en java
pues es un bucle que se reproduce al menos una vez y despues se evalua
la condición a diferencia del bucle while que primero se evalua la condicion
para poder empezar 

repeat {
  operacion 1
  operacion 2
  operacion 3
  .
  .
  .
  operacion final
  if (condicion) break

}
ES MUY IMPORTANTE TENER EN CUENTA QUE EL REPEAT SIEMPRE DEBE TENER UN BREAK
O SI NO TENDRA UN CICLO INFINITO.

el break sirve para terminar la iteracion sin importar nada mas. Pero 
la diferencia principal entre un ciclo while y un repeat radica en como 
se evalua la condicion de salida. El ciclo while evalua la condicion antes de la 
iteracion y el repeat evalua la condicion luego de almenos 1 repeticion. 
es equivalente a el ciclo Do-while en java."

#nota
"Es importante mencionar y recordar acerca de las variables que usamos para ayudarnos
con este tipo de estructuras de control como las variables contadoras o sumatorias o 
las variables sentinelas para ver si se quiere seguir pidiendo algo, pues todas
estas variables permiten un control muy amplio pues ayudan a ser evaludas como
condición de estas estructuras de control que usamos "