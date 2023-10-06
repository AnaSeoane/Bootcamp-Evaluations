import requests
import pandas as pd
import numpy as np
import mysql.connector
from geopy.geocoders import Nominatim

class Crear_bbdd():
    
    def __init__(self, contraseña, nombre_bbdd):
        
        """
        Constructor de la clase Crear_bbdd.
        
        Args:
            contraseña (str): Contraseña para la base de datos MySQL.
            nombre_bbdd (str): Nombre de la base de datos a crear.
        """
        
        self.contraseña = contraseña
        self.nombre_bbdd = nombre_bbdd
        
        
    def crear_bbdd(self):
        
        """
        Crea una base de datos MySQL si no existe.
        """

        mydb = mysql.connector.connect(host="localhost",
                                        user="root",
                                        password=f'{self.contraseña}',
                                        auth_plugin = 'mysql_native_password') 
        mycursor = mydb.cursor()
        print("Conexión realizada con éxito")

        try:
            mycursor.execute(f"CREATE DATABASE IF NOT EXISTS {self.nombre_bbdd};")
            
        except:
            print("La BBDD ya existe")
        
        mycursor.close()
        mydb.close()
            
    def crear_tablas(self):
        
        """
        Crea tablas en la base de datos con relaciones entre ellas.
        """
    
        mydb = mysql.connector.connect(user='root',
                                        password= f'{self.contraseña}',
                                        host='127.0.0.1', 
                                        database=f"{self.nombre_bbdd}",
                                        auth_plugin = 'mysql_native_password')
        mycursor = mydb.cursor()
        
        try:
            mycursor.execute("""CREATE TABLE IF NOT EXISTS `paises` (
                                `idestado` INT NOT NULL AUTO_INCREMENT,
                                `nombre_pais` VARCHAR(45) NULL,
                                `nombre_provincia` VARCHAR(45) NULL,
                                `latitud` DECIMAL(10, 7) NULL,
                                `longitud` DECIMAL(11, 7) NULL,
                                PRIMARY KEY (`idestado`))
                                ENGINE = InnoDB;

                                CREATE TABLE IF NOT EXISTS `universidades` (
                                `iduniversidades` INT NOT NULL AUTO_INCREMENT,
                                `nombre_universidad` VARCHAR(100),
                                `pagina_web` VARCHAR(100) NULL,
                                `paises_idestado` INT NOT NULL,
                                PRIMARY KEY (`iduniversidades`),
                                CONSTRAINT `fk_universidades_paises`
                                    FOREIGN KEY (`paises_idestado`)
                                    REFERENCES `paises` (`idestado`)
                                    ON DELETE NO ACTION
                                    ON UPDATE NO ACTION)
                                ENGINE = InnoDB;""")
            
        except mysql.connector.Error as err:
                print(err)
                print("Error Code:", err.errno)
                print("SQLSTATE", err.sqlstate)
                print("Message", err.msg)
        
        mycursor.close()
        mydb.close()
        
        
class ETL_universidades:

    def llamar_api():
        
        """
        Realiza llamadas a una API para obtener información de universidades en diferentes países.
        
        Returns:
            pd.DataFrame: DataFrame con la información de universidades.
        """
        
        print('NOTA: Si quieres obtener información de universidades diferentes a "United States", "Canada", "Argentina", debes modificar el código de la clase ETL')
        
        df_universidades = pd.DataFrame() #creamos un dataframe vacío en el que ir sumando cada país
        
        paises = ["United States", "Canada", "Argentina"]
        
        for pais in paises:
            response = requests.get(url= f"http://universities.hipolabs.com/search?country={pais}")
            print(f"Resultado de la conexión de {pais}: {response.status_code} {response.reason}")
            df = pd.json_normalize(response.json())
            df_universidades = pd.concat([df_universidades, df], axis = 0)
        return df_universidades
    
    def limpiar(dataframe):
        
        """
        Limpia y transforma el DataFrame recibido.

        Args:
            dataframe (pd.DataFrame): DataFrame con información de universidades.

        Returns:
            pd.DataFrame: DataFrame limpio y transformado.
        """
    
        dataframe.columns = [column.replace("-", "_") for column in dataframe.columns] # Reemplazamos en los nombres de las columnas "-" por "_"
        dataframe.drop("domains", axis= 1, inplace= True) # Eliminamos la columna "domains" (por ser redundante con "web_page")
        dataframe = dataframe.explode("web_pages") # Creamos una fila por cada "web_page"
        dataframe.drop_duplicates(subset= "name", inplace= True) # Eliminamos duplicados por nombre de universidad
        dataframe["name"] = dataframe["name"].str.replace('"', '') # Reemplazamos las comillas en el nombre de la universidad para que no de error la inserción en SQL
        dataframe["state_province"].fillna("unknown", inplace= True) # Reemplazamos los nulos de "state_province" por "unknown"
        
        # Creamos el diccionario que necesitamos para limpiar los nombres de los estados:
        dict_siglas = {'unknown': 'unknown', 'Ontario': 'Ontario', 'British Columbia': 'British Columbia', 'Pennsylvania': 'Pennsylvania', 'Quebec': 'Quebec', 
                    'Buenos Aires': 'Buenos Aires', 'Ciudad Autónoma de Buenos Aires': 'Buenos Aires', 'Alberta': 'Alberta', 'NY': 'New York', 'New Brunswick': 'New Brunswick', 
                    'Nova Scotia': 'Nova Scotia', 'Manitoba': 'Manitoba', 'California': 'California', 'Córdoba': 'Córdoba', 'New York, NY': 'New York', 'Saskatchewan': 'Saskatchewan', 
                    'Texas': 'Texas', 'Entre Ríos': 'Entre Ríos', 'Santa Fé': 'Santa Fé', 'Mendoza': 'Mendoza', 'North Carolina': 'North Carolina', 'TX': 'Texas', 'Ohio': 'Ohio', 
                    'GA': 'Georgia', 'CA': 'California', 'Santiago Del Estero': 'Santiago Del Estero', 'Salta': 'Salta', 'Washington': 'Washington', 'Misiones': 'Misiones', 
                    'Catamarca': 'Catamarca', 'Yukon': 'Yukon', 'Formosa': 'Formosa', 'Jujuy': 'Jujuy', 'La Rioja': 'La Rioja', 'La Pampa': 'La Pampa', 'San Juan': 'San Juan', 
                    'San Luis': 'San Luis', 'Prince Edward Island': 'Prince Edward Island', 'Maine': 'Maine', 'Newfoundland and Labrador': 'Newfoundland and Labrador', 
                    'New York': 'New York', 'Utah': 'Utah', 'NV': 'Nevada', 'Iowa': 'Iowa', 'VA': 'Virginia', 'Indiana': 'Indiana', 'Colorado': 'Colorado', 'IN': 'Indianapolis', 
                    'Illinois': 'Illinois', 'Michigan': 'Michigan', 'New Hampshire': 'New Hampshire', 'South Carolina': 'South Carolina', 'Virginia': 'Virginia', 'Missouri': 'Missouri', 
                    'ND': 'North Dakota', 'MI': 'Michigan', 'Florida': 'Florida', 'Tucumán': 'Tucumán'}
        
        dataframe["state_province"] = dataframe["state_province"].map(dict_siglas, na_action="ignore") # Hacemos un map que reemplace los valores según el diccionario anterior
        
        # Sacamos el listado de estados que tenemos en nuestro dataframe
        lista_estados = dataframe["state_province"].unique()    

        df_geopy = pd.DataFrame(lista_estados, columns = ["state_province"]) # Creamos nuevo dataframe con estas provincias
        
        geo = Nominatim(user_agent = 'Ana') # Llamamos a geopy
        
        latitud = [] # Creamos dos listas nuevas, que serán nuestras nuevas columnas del dataframe
        longitud = [] 
        
        for estado in df_geopy["state_province"]: # Iteramos por cada estado de la columna "state_province"
            
            if estado == "unknown": # Si el estado es "unknown", queremos que nos devuelva np.nan
                latitud.append(np.nan)
                longitud.append(np.nan)
            
            else:       # Sino, sacamos la latitud y la longitud gracias a geopy
                lat = geo.geocode(estado)[-1][0]
                long = geo.geocode(estado)[-1][1]
                latitud.append(lat)
                longitud.append(long)

        df_geopy["latitud"] = latitud # Añadimos las listas al dataframe
        df_geopy["longitud"] = longitud
        
        # Por último, añadimos estas columnas al dataframe inicial:
        
        dataframe = pd.merge(left=dataframe, right=df_geopy, how='left', on='state_province')
        
        return dataframe
    
    def insertar_paises(dataframe, contraseña, nombre_bbdd):
        
        """
        Inserta información de países en la base de datos.

        Args:
            dataframe (pd.DataFrame): DataFrame con información de universidades.
            contraseña (str): Contraseña para la base de datos MySQL.
            nombre_bbdd (str): Nombre de la base de datos.

        """
    
        df_paises = dataframe[["state_province", "country", "latitud", "longitud"]].drop_duplicates()
        
        for _, fila in df_paises.iterrows():
            
            mydb = mysql.connector.connect(user='root',
                            password=f"{contraseña}",
                            host='127.0.0.1',
                            database=f"{nombre_bbdd}",
                            auth_plugin = 'mysql_native_password')
            
            mycursor = mydb.cursor()
            
            mycursor.execute("SELECT DISTINCT nombre_provincia, nombre_pais FROM paises;")
        
            ciudades = mycursor.fetchall()
            
            if tuple([fila["state_province"],fila["country"]]) not in ciudades:
                
                if fila["state_province"] != "unknown":
                    
                    try: 
                        mycursor.execute(f"""INSERT INTO paises (nombre_pais, nombre_provincia, latitud, longitud)
                                    VALUES ('{fila["country"]}', '{fila["state_province"]}', {fila["latitud"]}, {fila["longitud"]})""")
                        mydb.commit() 

                    except mysql.connector.Error as err:
                        print(err)
                        print("Error Code:", err.errno)
                        print("SQLSTATE", err.sqlstate)
                        print("Message", err.msg)
                
                else:
                    
                    try: 
                        mycursor.execute(f"""INSERT INTO paises (nombre_pais, nombre_provincia, latitud, longitud)
                                    VALUES ('{fila["country"]}', '{fila["state_province"]}', NULL, NULL)""")
                        mydb.commit() 

                    except mysql.connector.Error as err:
                        print(err)
                        print("Error Code:", err.errno)
                        print("SQLSTATE", err.sqlstate)
                        print("Message", err.msg) 
            mycursor.close()
            mydb.close()
                            
    def insertar_universidades(dataframe, contraseña, nombre_bbdd):
        
        """
        Inserta información de universidades en la base de datos.

        Args:
            dataframe (pd.DataFrame): DataFrame con información de universidades.
            contraseña (str): Contraseña para la base de datos MySQL.
            nombre_bbdd (str): Nombre de la base de datos.

        """

        for _, fila in dataframe.iterrows():
            
            mydb = mysql.connector.connect(user='root', password=f'{contraseña}',
                                    host='127.0.0.1', database=f'{nombre_bbdd}',  auth_plugin = 'mysql_native_password')
            mycursor = mydb.cursor()
            
            mycursor.execute("SELECT DISTINCT pagina_web FROM universidades;")
        
            webs = mycursor.fetchall()
            
            lista_webs = [web[0] for web in webs]
            
            if fila["web_pages"] not in lista_webs:
            
                try: 
                    mycursor.execute(f"""SELECT idestado
                                    FROM paises WHERE nombre_provincia = '{fila["state_province"]}' and nombre_pais = '{fila["country"]}'""")
                    idestado = mycursor.fetchall()[0][0]
                    
                    try: 
                        mycursor.execute(f"""
                                INSERT INTO universidades (nombre_universidad, pagina_web, paises_idestado) 
                                VALUES ("{fila["name"]}", "{fila["web_pages"]}", {idestado});
                                """)
                        mydb.commit() 

                    except mysql.connector.Error as err:
                        print('_______')
                        print(f'Error al insertar la universidad {fila["name"]} y la pagina {fila["web_pages"]} perteneciente al estado {fila["state_province"]} en el país {fila["country"]}')
                        print(err)
                        print("Error Code:", err.errno)
                        print("SQLSTATE", err.sqlstate)
                        print("Message", err.msg)
                        
                except: 
                    print(f'Sorry, no tenemos el estado {fila["state_province"]} en el país {fila["country"]} en la BBDD y por lo tanto no te podemos dar su id.')
                    
            mycursor.close()
            mydb.close()  