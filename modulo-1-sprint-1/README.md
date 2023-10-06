# Ejercicios con la primera evaluación del Módulo 1 Adalab Data Analyst Bootcamp

## Descripción del proyecto:

El proyecto incluye los ejercicios de la primera evaluación del módulo 1. En esta parte del módulo, hemos aprendido Python básico y SQL básico.

## Motivación del proyecto

Con estas evaluaciones, se pretende mostrar el nivel de adquisición de los conocimientos estudiados a lo largo del módulo. En concreto, en esta primeraa parte del módulo 1, se ha estudiado:

- Python:
    - Variables, booleanas, operadores numéricos y binarios
    - Listas
    - Diccionarios
    - Tuplas y sets
    - Sentencias de control (condicionales, loops, break y continue)
    - Bucles for

- SQL:
    - Modelo relacional
    - Creación de tablas
    - Alteración de tablas
    - Inserción de datos
    - Consultas básicas (SELECT, WHERE, IS NULL, NOT NULL, ORDER BY, DISTINCT, LIMIT, OFFSET, BETWEEN, IN y AS)
    - Consultas avanzadas (MIN, MAX, SUM, AVG, COUNT)


## Estructura del proyecto

El proyecto se estructura en:

- `evaluacion_python_1.ipynb`: archivo jupyter que contiene los ejercicios resueltos de esta evaluación. 
- `SQLScript_Creacion.sql`: archivo sql que contiene el script con los ejercicios de creación de base de datos. 
- `SQLScript_Consultas.sql`: archivo sql que contiene el script con los ejercicios de consultas a la base de datos. 



## Enunciados de la Evaluación

### Ejercicios de Python

En este apartado tendréis el jupyter con una serie de preguntas que usaremos para la primera evaluación de contenidos del módulo 1 de Python.
Descarga este archivo y completa los ejercicios propuestos:

1. Métodos de *strings* 

    Dado el siguiente *string* 

    ```python
    string = """Hoy estamos en una clase de repaso,
    el objetivo es intentar solucionar todas vuestras dudas, 
    preguntad todo lo que queráis!"""
    ```

    Contesta a las siguientes preguntas: 

    - Crea dos variables nuevas: 
        - Una con el *string* en mayúsculas
        - Otra con las letras en minúsculas

    - Pon todas las primeras letras del *string* en mayúscula

    - Separa el *string*  por los espacios y almacena el resultado en una lista llamanda `texto_lista`

    - De la lista obtenida en el ejercicio anterior, selecciona solo los 5 primero elementos y almacena los resultados en una variable que se llame `texto_lista_corta` 

    - De la lista obtenida en el ejercicio 4. Vuelve a convertirlo en *string* 
    - Con el *string* obtenido en el paso anterior: 
        - Esta la palabra "el" en el *string* 
        - Reemplaza "Hoy" por nada
        - El ejercicio anterior nos ha dejado espacios al inicio del string, eliminalos

2. Encuentra el número que no está en la lista. 
    Tenemos una lista desordenada con números positivos de 1 a n. Siempre faltará un sólo número de esta lista aleatoria, ¿cómo identifico cuál falta? Cread un programa para que este código devuelva los resultados deseados:

    ```python
    lista1 = [3,7,1,2,8,4,5] # nos tiene que devolver 6
    lista2 = [4,6,1,3,5] #  nos tiene que devolver 2
    lista3 = [34,35,36,38,39,40] # nos tiene que devolver 37
    ```

    **BONUS**: Introduce los resultados obtenidos en un diccionario, indicando que numero falta para cada una de las listas:
    ```python
    resultados = {'falta_lista_1': valor_numerico_1, 'falta_lista_2': valor_numerico_2, 'falta_lista_3': valor_numerico_3}
    ```

3. Mover los ceros a la izquierda
    Nos dan un *string* con números aleatorios. Algunos de ellos son 0. Encuentra todos los ceros y ponlos al principio de la lista, manteniendo el orden de los demás números.

    Ejemplo:

    ```python
    A = [1,10,88,0,59,63,0,20,0]

    # tiene que devolver
    [0, 0, 0, 1, 10, 88, 59, 63, 20]
    ```

4. Invertir palabras de una frase
    Nos dan una frase en que quieren que las letras de cada palabra acaben teniendo el orden invertido, manteniendo el orden de las palabras.

    ```python
    frase = 'Hola Ada'
    print(frase) # nos daría 'aloH adA'
    ```

5. ¿Es un DNI valido?
    Los DNI españoles pueden ser:

    - NIF (Numero de Identificación Fiscal) - 8 numeros y una letra, o
    - NIE (Numero de Identificación de Extranjeros) - 1 letra, 7 numeros y 1 letra.

    ```python
    lista_dni = ["X-1234567-Z", "X-1234567", "12345678-M", "1234567-T", "12345677"] 
    ```


6. **BONUS**: Encuentra los k números más cerca a X
    Haz una programa que compare los contenidos de una lista a un número dado X. Queremos que nos devuelva los k números que son más parecidos al número dado.

    Ejemplo:
    ```python
    L = [4, 19, -5, 100, 53, 43, 74, -83, 13.5, 26]
    # Dados los siguientes valores 
    x =30
    k = 3 
    # el número de números que tendremos que buscar en la lista que se parecen a 30 
    # El output debería ser igual a [26, 19, 43]
    ```

### Ejercicios de SQL

Desde la empresa *Sports Analytics* nos han enviado un conjunto de datos referentes a las clasificaciones de partidos de la NBA de los años 2016 - 2021.

Como parte de la entrevista técnica nos han pedido que hagamos una BBDD en SQL que contenga las siguente tablas (mostramos una pequeña parte de la información que deberán de contener):

- Tabla de Season: Información de las temporadas
- Tabla Teams: Contiene la informacion de los nombres de los equipos.
- Tabla Stats: Contiene la información de las estadísticas de los diferentes equipos:

De esta forma, nos han pedido lo siguiente:

1. Crear una base de datos que contenga tres tablas distintas, que contengan los campos mostrados en los ejemplos anteriores.
    - Tabla season
    - Tabla teams
    - Tabla stats
    Donde la tabla stats será aquella que tenga referencias a las tablas seasons y teams. Todas las tablas deberán contener una clave primaria.

2. Realizar la insercción de datos, en las tablas de la base de datos creada. Los datos a insertar se encuentran [aqui](/data/Script_datos_insertar.sql)

3. Realizar las siguientes consultas:
    - Selecciona las victorias máximas y mínimas para cada equipo diferente en la tabla de seasons.
    - Obtén los primeros 10 resultados de la tabla de teams
    - Selecciona todos los datos de los equipos que tengan entre 20 y 30 victorias de la tabla stats.
    - Realiza un cuenteo de número total de equipos que existende la tabla teams.
    - Calcula la media de todos los puntos conseguidos de la tabla stats
    - Selecciona el máximo de victorias, máximo de puntos y la diferencia entre el máximo de puntos con la media de puntos como diferencia_media de la tabla stats.