# Ejercicios con la primera evaluación del Módulo 2 Adalab Data Analyst Bootcamp

## Descripción del proyecto:

El proyecto incluye los ejercicios de la evaluación ´1, dentro del módulo 2. En este módulo, hemos aprendido estadística básica, Numpy, Pandas y creación de gráficos a través de las librerías Matplotlib y Seaborn

## Motivación del proyecto

Con estas evaluaciones, se pretende mostrar el nivel de adquisición de los conocimientos estudiados a lo largo del módulo. En concreto, en esta primera parte del módulo 2, se ha estudiado:

- Numpy:
    - Introducción a los arrays
    - Indexación
    - Operaciones estadísticas y matemáticas
    - Conjuntos y distribuciones aleatorias

- Pandas:
    - Introducción a Series y Dataframes
    - Carga y guardado de datos
    - Métodos de esta librería
    - Filtrado de datos
    - Unión de datos
    - Groupby
    - Apply

- Visualización:
    - Gráficos y personalización con Matplotlib
    - Gráficos y personalización con Seaborn

- Estadística:
    - Principales elementos de estadística descriptiva (tendencia central y medidas de dispersión)
    - Cuartiles, estadística con Pandas y tablas de frecuencias
    - Tablas de contingencia, correlación, sesgos e intervalos de confianza

## Librerías utilizadas para ejecutar el código

En estos archivos, se han utilizado las siguientes librerías:
- `NumPy`: Puedes consultar [aquí](https://numpy.org/doc/stable/user/) la documentación oficial.
- `Pandas`: Puedes consultar [aquí](https://pandas.pydata.org/docs/user_guide/index.html#user-guide) la documentación oficial.
- `Matplotlib`: Puedes consultar [aquí](https://matplotlib.org/stable/users/index.html) la documentación oficial.
- `Seaborn`: Puedes consultar [aquí](https://seaborn.pydata.org/tutorial.html) la documentación oficial.

## Estructura del proyecto

El proyecto se estructura en tres carpetas fundamentales:
- `data`: Contiene los ficheros utilizados para la realización de los ejercicios de `Pandas`.

- `NumPy`:
    - Archivo jupyter `NumPy_ejercicios`, que contiene los ejercicios resueltos de esta evaluación. En ellos, se incluyen 10 ejercicios breves relacionados con operaciones con arrays.

- `Pandas`: Contiene tres archivos:
    - Archivo jupyter `Pandas_I_exploracion`, que contiene ejercicios resueltos de la exploración del csv aportado para la evaluación.
    - Archivo jupyter `Pandas_II_preparacion`, que contiene cuatro ejercicios de limpieza de datos. El resultado de estos ejercicios es otro csv sobre el que se realizarán los ejercicios del siguiente apartado.
    - Archivo jupyter `Pandas_III_filtradoyvis`, que contiene ejercicios de filtrado y análisis de los datos.

## Enunciados de la Evaluación

### Ejercicios de NumPy

- Importa la librería de NumPy.
- Crea un array de 1 dimension y 10 elementos.
- Reemplaza todos los números impares por el valor "impar" y los pares por "par". Para hacer esto os tendréis que crear un array nuevo donde vayáis añadiendo los valores nuevos.
- Cambiad la forma del array del ejercicio 3 a un array de 2 filas y 5 columnas.
- Extrae los elementos comunes de los siguientes arrays
    ```python
    array1 = np.array([1,2,3,2,3,4,3,4,5,6])
    array2 = np.array([7,2,10,2,7,4,9,4,9,8])
    ```
- Extraed los elementos que están en el array1 pero no en el array2.
- Extraed las posiciones donde tengamos elementos que sean iguales.
- Cread un array de 3 filas y 5 columnas, con números enteros del 0 al 50. Una vez creado, extrae los valores que sean menores que 10 y mayores que 40.
- Cread un array de 5x3 con números decimales aleatorios entre el 5 y el 10.
- Crea un array de tres dimensiones de 2x4x7 con números entre el 1 y el 20
- Transponed el array para que tenga 4 matrices, 7 filas y 2 columnas


### Ejercicios de Pandas

Para la parte de Pandas usaremos el mismo conjunto de datos de música de Spotify, en concreto tendremos un conjunto de datos de canciones de varios artistas en el mundo y para cada canción está presente:

- Varias estadísticas de la versión musical en spotify, incluido el número de streams;
- Número de visualizaciones del vídeo musical oficial de la canción en youtube.

Los ejercicios que os plantemos para esta parte de la evaluación son:
- Importad Pandas
- Exploración del conjunto de datos: Cargad el fichero, al cargarlo os aparecerá una columna llamada "Unnamed: 0". Cargad el dataset sin que aparezca esta columna. Además realizad un análisis exploratorio que incluya:
    - Cuando leais el fichero, veremos que no podemos ver todas las columnas, utilizad el comando correcto para poder visualizarlas todas cuando hacemos un head
    - Primeras 5 filas del dataframe
    - Últimas 5 filas del dataframe
    - 10 filas aleatorias del dataframe
    - ¿Cuántas filas y columnas tenemos en el dataframe
    - ¿Cuáles son los tipos de los datos de cada columna del dataframe
    - ¿Cuántos valores nulos tenemos por columna?
    - ¿Tenemos filas duplicadas en el dataframe ?
    - Muestra los principales estadísticos para las columnas numéricas del dataframe
    - Muestra los principales estadísticos para las columnas categóricas del dataframe
- Preparación de los datos:
    - Los nombres de las columnas empiezan con mayúsculas, poned todos los nombres de las columnas en minúsculas.
    - Haciendo el análisis exploratorio nos deberíamos haber dado cuenta de que algunas de las variables (danceability, energy, key, loudness, speechiness, acousticness, instrumentalness) no son del tipo que deberían. Esto es debido a que los decimales están establecidos como comas y no con puntos. Cread una función que nos permita cambiar esas comas por puntos para que los datos tengan el tipo correcto.
        - Después de haber hecho los cambios, chequead los tipos de datos. ¿Son ya del tipo correcto? En caso de que no, cread otra función o modificar la anterior para que sean de tipo float.
    - Hay algunas canciones cuyo título está en mayúsulas. Crea una función para que todos los títulos estén en minúscula. Haced lo mismo para las columnas de "title" y "album".
    - Algunos de los artistas tienen símbolos raros, en concreto el símbolo $. Cread una función que nos elimine este símbolo de los nombres de los artistas.
- Filtrado de datos y Visualización:
    - ¿Cuáles son los valores únicos de la columna "album_type"? Cread tres dataframes diferentes, uno para cada tipo de "album_type". ¿Cuántas canciones tenemos en cada tipo?
    - Usando el dataframe de los albumes que hemos creado en el ejercicio anterior. ¿Cuál es la media y la desviación estándar de "danceability", "acousticness" y "speechiness" de cada artista?. Mostrad los resultados en tres dataframes diferentes, uno para cada métrica ("danceability", "acousticness" y "speechiness"). Ordenar los resultados de mayor a menor en base a la media.
    - Se quiere estudiar si existe una relación entre la cantidad de visitas que reciben los videos de música de un artista en una plataforma de streaming y la cantidad de likes que estos videos obtienen. Por lo tanto, querremos contestar a la siguiente pregunta: ¿Son aquellos artistas que tienen más visitas los que más likes tienen? Para solucionar este ejercicio deberéis:
        - Agrupar por artista y calcular la media de visitas y de likes.
        - Quedaros con los 10 artistas que más visitas han tenido.
        - Quedaros con los 10 artistas que más likes han tenido.
        - Haced un subplot, donde en uno tengamos los 10 artistas con más likes y en el otro los 10 artistas con mas views.
        - **BONUS** Haced lo mismo para los datos de tipo "single".
    - Ahora queremos analizar la colaboración entre artistas en la industria musical, se tienen datos de las colaboraciones realizadas en los últimos años. Se desea conocer cuáles son los artistas que han colaborado en mayor cantidad de canciones y generar un ranking con los diez primeros. ¿Qué artistas con los que más colaboraciones tienen? Para esto tendréis que:
        - Filtrad los datos para quedaros solo con aquellos datos donde en la columna "track" tengamos "feat".
        - Contad cuantas canciones tiene cada artista utilizando el dataframe generado en el paso anterior.
        - Mostrad los resultados en una gráfica, seleccionado los 10 artistas con más colaboraciones.
        - Deberéis contestar a las siguientes preguntas:
            - ¿Cuáles son los diez artistas que más han colaborado según los datos que tenemos?
            - ¿Cuál es el número de canciones en los que ha colaborado el artista que ocupa el primer lugar en el ranking?
            - ¿Cuál es el artista que ocupa el décimo lugar en el ranking y en cuántas canciones ha colaborado?
        - Utilizando el dataframe original, queremos explorar si el tipo de álbum influye en la cantidad de vistas que recibe en una plataforma de transmisión de música. Para ello, debemos generar un boxplot con las variables necesarias y responder las siguientes preguntas:
            - ¿Qué tipo de álbumes tienden a tener más vistas en promedio?
            - ¿Hay algún tipo de álbumes que tenga una mayor dispersión en las vistas recibidas?
            - ¿Existen valores atípicos (outliers) en alguna categoría de álbumes?
            - ¿Qué conclusión se puede obtener sobre la relación entre el tipo de álbum y la cantidad de vistas recibidas?