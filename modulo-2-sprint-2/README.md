# Ejercicios con la segunda evaluación del Módulo 2 Adalab Data Analyst Bootcamp

## Descripción del proyecto:

El proyecto incluye los ejercicios de la segunda evaluación del módulo 2. En esta parte del módulo, hemos aprendido análisis exploratorio de datos, limpieza de datos y proceso completo ETL.

## Motivación del proyecto

Con estas evaluaciones, se pretende mostrar el nivel de adquisición de los conocimientos estudiados a lo largo del módulo. En concreto, en esta segunda parte del módulo 2, se ha estudiado:

- Análisis exploratiorio de datos:
    - Nulos y Outliers
    - Análisis exploratorio gráfico

- Limpieza:
    - Limpieza de strings
    - Limpieza de outliers
    - Limpieza de valores nulos
    - Limpieza de valores nulos con Sklearn

- ETL:
    - Extracción de datos (API's)
    - Transformación y limpieza
    - Inserción de datos en SQL
    - Clases y funciones de automatización de ETL
    - Pipeline ETL


## Librerías utilizadas para ejecutar el código

En estos archivos, se han utilizado las siguientes librerías:
- `NumPy`: Puedes consultar [aquí](https://numpy.org/doc/stable/user/) la documentación oficial.
- `Pandas`: Puedes consultar [aquí](https://pandas.pydata.org/docs/user_guide/index.html#user-guide) la documentación oficial.
- `Request`: Puedes consultar [aquí](https://pypi.org/project/requests/) la documentación oficial.
- `Geopy`: Puedes consultar [aquí](https://pypi.org/project/geopy/) la documentación oficial.
- `MySQL.connector`: Puedes consultar [aquí](https://dev.mysql.com/doc/connector-python/en/) la documentación oficial.

## Estructura del proyecto

El proyecto se estructura en:
- `carpeta src`: contiene:
    - `bbdd_universidades_esquema.png`. Imagen del esquema de la bbdd creada.
    - `script_creacion_bbdd_universidades.sql`. Script de sql que contiene la creación de la base de datos del proyecto.
    - `soporte.py`. Incluye el archivo python con las clases creadas durante la evaluación y necesarias para la ejecución del archivo main.py.
    - `carpeta bbdd_universidades_completo`. Contiene los scripts con la base de datos y la información ya insertada (resultado de finalizar el proceso ETL).

- `evaluacion_ejercicios.ipynb`: archivo jupyter que contiene los ejercicios resueltos de esta evaluación. 

- `evaluacion_clases.ipynb`: archivo jupyter que contiene las clases resultantes de los ejercicios (invocadas al final) que permiten realizar el proceso de ETL completo.

- `main.py`: archivo python que permite ejecutar el pipeline completo de ETL al ejecutarlo en la terminal.

## Enunciados de la Evaluación

Para llevar a cabo esta tarea, utilizaremos la API de "Universities Hipolabs", una fuente confiable y completa de información sobre las universidades en todo el mundo. Con la ayuda de esta API, podemos acceder a una gran cantidad de datos relevantes, incluyendo el nombre de la universidad, la ciudad donde esta ubicada, el nombre de la institución y otra información importante que nos permitirá llevar a cabo un análisis detallado.

Es importante tener en cuenta que este proyecto requerirá un conocimiento profundo de herramientas y técnicas de análisis de datos, así como habilidades en programación y manejo de APIs. También es importante tener una comprensión sólida de la estructura y organización de los datos, ya que esto nos permitirá hacer preguntas importantes y obtener respuestas significativas a partir de los datos.

En resumen, esta prueba técnica ofrece una excelente oportunidad para demostrar habilidades y conocimientos en análisis de datos y programación, mientras se trabaja en un proyecto real y relevante para una empresa. Al finalizar del proyecto, esperamos obtener información valiosa que ayudará a la empresa a tomar decisiones más informadas sobre las universidades en los tres países objetivo.

1. Utilizando la API extraed toda la información que podáis de ella. La url para hacer las llamadas es:
    `API_URL = "http://universities.hipolabs.com/search?country=NOMBREPAIS"`

2. Una vez tengáis todos los datos de la API, deberéis realizar una serie de procesos de limpieza, estos incluyen:
    - Cambiad los nombres de las columnas para homogeneizarlas, tenemos columnas que tienen - y otras _. Unifícalo para que todo vaya con _.
    - La columna de domains nos da una información similar a la de web_pages. Eliminad la columna domains.

3. Si exploramos la columna de web_pages, nos daremos cuenta que hay universidades, como por ejemplo la Universidad de "Cégep de Saint-Jérôme" de Canadá que en su columna de web_pages tiene más de un valor dentro de la lista. Esto es poco práctico y puede llegar a no tener sentido. el objetivo de este ejericio es que usando el método explode de pandas separéis cada elemento de la lista en una fila nueva.

4. Una vez hayáis realizado el explode, chequead si tenéis duplicados basándonos unicamente en el nombre de la universidad, en caso de que si, eliminandlos.

5. Si exploramos la columna de state_province veremos que hay universidades cuyo valor para esta columna es None. Cread una función para reemplazar los None por nulos de numpy.

6. Después del último cambio, os habréis dado cuenta que tenemos muchos valores nulos dentro de la columna de state_province, por lo que nuestro jefe nos pide que reemplacemos esos nulos por "Unknow". No nos piden ningún método especifico, asi que podremos usar el método que queramos.

7. Ahora nuestros jefes nos piden que saquemos las coordenadas de las provincias donde están ubicadas las universidades. Para eso nos piden que usemos la librería de geopy que aprendimos el día del repaso, aquí la documentación. Para desarrollar este ejercicio deberéis:
    - Sacar los valores únicos de la columna state_province.
    - Algunos de los valores que tenemos están con siglas, y deberéis reemplazarlos por lo siguiente:
        - NV: reemplazalo por Nevada
        - TX: reemplazalo por Texas
        - IN: reemplazalo por Indianapolis
        - CA: reemplazalo por California
        - VA: reemplazalo por Virginia
        - NY: reemplazalo por New York
        - MI: reemplazalo por Michigan
        - GA: reemplazalo por Georgia
        - ND: reemplazalo por North Dakota
    - Otros valores que tenemos más formateados son y que deberemos reemplazar:
        - New York, NY. Deberéis reemplazarlo por "New York".
        - 'Buenos Aires', 'Ciudad Autónoma de Buenos Aires'. En este caso deberéis poner en ambos casos "Buenos Aires"

    - Una vez realizados los pasos anteriores, crea una lista con los valores únicos de las provincias de las universidades.
    - Usando la API de geopy, extraed la latitud y la longitud de cada una de las provincias y almacenad los resultados en un dataframe.
    - Una vez que tengáis los datos del ejercicio anterior en un dataframe, unidlo con el de las universidades que hemos sacado de la API.

8. Crea una BBDD en mysql que contenga las siguientes tablas:

    - Tabla países: donde encontraremos las siguientes columnas:
        - idestado: primary key, integer, autoincremental
        - nombre_pais: varchar
        - nombre_provincia: varchar
        - latitud: decimal
        - longitud: decimal
    - Tabla universidades: donde encontraremos las siguientes columnas:
        - iduniversidades: primary key, integer, autoincremental
        - nombre_universidad: varchar
        - pagina_web: varchar
        - paises_idestado: foreing key

9. Introduce todo el código que habéis ido creando en funciones, siguiendo la misma lógica que hemos seguido en los pairs

10. **BONUS**
    - Introduce los datos en la BBDD de SQL.
    - Crea una clase con todo el código generado en esta evaluación.
