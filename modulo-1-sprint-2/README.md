# Ejercicios con la segunda evaluación del Módulo 1 Adalab Data Analyst Bootcamp

## Descripción del proyecto:

El proyecto incluye los ejercicios de la evaluación 2, dentro del módulo 1. En este módulo, hemos aprendido programación en SQL y Python.

## Motivación del proyecto

Con estas evaluaciones, se pretende mostrar el nivel de adquisición de los conocimientos estudiados a lo largo del módulo. En concreto, en esta segunda parte del módulo 1, se ha estudiado:

- Python:
    - Funciones
    - Clases
    - Apertura, lectura y manipulación de ficheros
    - Manipulación de strings y Regex
    - Conexión Python - SQL
- SQL:
    - Queries de consulta avanzadas (GROUP BY, HAVING, CASE)
    - Queries en múltiples tablas (JOIN, UNION, INTERSECT, EXCEPT, SUBCONSULTAS, CTEs)

## Librerías utilizadas para ejecutar el código

En este archivo de python, únicamente es necesaria la importación de la librería `os`: Puedes consultar [aquí](https://docs.python.org/es/3.10/library/os.html) la documentación oficial.

## Estructura del proyecto

El proyecto se estructura en dos carpetas fundamentales:
- Python:
    - Archivo jupyter `evaluacion2_python`, que contiene los ejercicios resueltos de esta segunda evaluación. En ellos, se pide que se creen diferentes métodos para consultar información contenida dentro del fichero txt facilitado (`quijote.txt`)    
    - Carpeta `data`, donde se encuentra guardado el archivo `.txt` sobre el que se trabaja.

- SQL:
    - Archivo SQL `evaluacion2_SQL`, que contiene los ejercicios resueltos de esta segunda evaluación. En ellos, se presentan 6 ejercicios donde se piden datos que se extraen a través de queries de consulta (haciendo uso de lo aprendido en este último sprint)

## Enunciados de la Evaluación

### Ejercicios de Python

En esta evaluación tendremos que crearnos una clase. Estamos trabajando para una editorial y tienen muchos ficheros de tipo .txt. Quieren hacer un estudio de palabras de los textos que tienen, para ello nos piden que nos creemos una clase que:

- Reciba dos parámetros en el método constructor: 

    - La ruta donde se encuentra el fichero
    - El nombre y la extensión del fichero que quieren abrir. 

- Tenga un método que nos abra el fichero en python, como un único *string*. Este método tiene que ser capaz de abrir cualquier tipo de fichero y que este ubicado en cualquier ubicación de nuestros ordenadores. 

- Tenga un método que lea un número "X" de palabras del texto. En este caso, el número de palabras que queremos leer debe ser un parámetro de este método. En este código deberemos incluir:
    - Que si nos pasan como valor de número de palabras un número que no sea *integer*, nos salga un mensaje por pantalla que nos avise que la operación no se pueden hacer ya que necesitamos que sea un número *integer*. 

- Similar que en el paso anterior, crea un método que nos permita leer "X" lineas del texto. En este caso, el número de lineas que quiere leer el usuario no debe ser un parámetro del método. Tendremos que:

    - Crear un *input* en el método que le pregunte al usuario cuántas líneas quiere leer

    - Que tenga un control de errores por si el valor que nos pasa el usuario no es correcto, como por ejemplo un valor decimal. 

    - Además tenemos que tener en cuenta en el código que puede que el usuario quiera leer todas las líneas del archivo. Incluye en el programa el código necesario para que si el usuario nos indica que quiere leer todas las líneas el programa lo pueda hacer.  

    **BONUS** En vez de devolver el resultado como una lista de *string* devuelvelo como un único *string*. 

- En este punto de la evaluación ya os habréis dado cuenta que en este fichero las primeras lineas no corresponden al quijote. Pero entonces... ¿en qué punto empieza el libro del quijote? En concreto, el libro está comprendido entre la lineas 1780 y 74276. Crea un método que solo nos devuelva el contenido del libro, sin la introducción inicial. 


-  Crea un último método en la clase que nos permita extraer las veces que aparece determinada palabra en el libro. Para eso este método deberá: 

    - Recibir la palabra o palabras que quiere buscar el usuario en el texto. 
    - Devolver el número de veces que aparece dicha palabra. 
    - Para confirmar que vuestro código, deberéis buscar las siguientes palabras como ejemplos de este método: 

        - Quijote, debemos tener en cuenta que aparezca en mayúscula o en minúscula, es decir, "Quijote" o "quijote"

        - Alonso,  debemos tener en cuenta que aparezca en mayúscula o en minúscula, es decir, "Quijote" o "quijote"

        - Don Quijote, debemos tener en cuenta que aparezca en mayúscula o en minúscula, es decir, "Quijote" o "quijote"



### Ejercicios de SQL

Para esta evaluación usaremos la BBDD de northwind con la que ya estamos familiarizadas de los ejercicios de pair programming. En esta evaluación tendréis que contestar a las siguientes preguntas:

- Selecciona todos los campos de los productos, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9, que tengan stock en el almacén, y al mismo tiempo que sus precios unitarios estén entre 50 y 100. Por último, ordena los resultados por código de proveedor de forma ascendente.

- Devuelve el nombre y apellidos y el id de los empleados con códigos entre el 3 y el 6, además que hayan vendido a clientes que tengan códigos que comiencen con las letras de la A hasta la G. Por último, en esta búsqueda queremos filtrar solo por aquellos envíos que la fecha de pedido este comprendida entre el 22 y el 31 de Diciembre de cualquier año.

- Calcula el precio de venta de cada pedido una vez aplicado el descuento. Muestra el id del la orden, el id del producto, el nombre del producto, el precio unitario, la cantidad, el descuento y el precio de venta después de haber aplicado el descuento.

- Usando una subconsulta, muestra los productos cuyos precios estén por encima del precio medio total de los productos de la BBDD.

- ¿Qué productos ha vendido cada empleado y cuál es la cantidad vendida de cada uno de ellos?

- Basándonos en la query anterior, ¿qué empleado es el que vende más productos? Soluciona este ejercicio con una subquery
    
    **BONUS** ¿Podríais solucionar este mismo ejercicio con una CTE?