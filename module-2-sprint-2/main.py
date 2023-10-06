import requests
import pandas as pd
import numpy as np
import mysql.connector
from geopy.geocoders import Nominatim

import src.soporte as sp


consulta = input("¡Hola! ¿Quieres crear también la base de datos?")

if consulta.lower() == "si" or consulta.lower() == "sí":
        
        bbdd = sp.Crear_bbdd("AlumnaAdalab", "universidades")
        
        print("_____________________________________________")
        
        print("Vamos a crear la base de datos:")
        
        bbdd.crear_bbdd()
        
        print("_____________________________________________")
        
        print("Vamos a crear las tablas:")
        
        bbdd.crear_tablas()
        
        df = sp.ETL_universidades
        
        df_universidades = df.llamar_api()
        
        print("_____________________________________________")
        
        print("Vamos con el proceso de limpieza de los datos")
        
        df_universidades = df.limpiar(df_universidades)
        
        print("_____________________________________________")
        
        print("Ahora vamos a insertar los siguientes datos en MYSQL")
        
        print(df_universidades)
        
        df.insertar_paises(df_universidades, "AlumnaAdalab", "universidades")
        
        print("_____________________________________________")
        
        print("¡Inserción enla tabla paises lograda con éxito!")
        
        df.insertar_universidades(df_universidades, "AlumnaAdalab", "universidades")
        
        print("_____________________________________________")
        
        print("¡Inserción enla tabla universidades lograda con éxito!")
        
else:
        
        df = sp.ETL_universidades
        
        df_universidades = df.llamar_api()
        
        print("_____________________________________________")
        
        print("Vamos con el proceso de limpieza de los datos")
        
        df_universidades = df.limpiar(df_universidades)
        
        print("_____________________________________________")
        
        print("Ahora vamos a insertar los siguientes datos en MYSQL")
        
        print(df_universidades)
        
        df.insertar_paises(df_universidades, "AlumnaAdalab", "universidades")
        
        print("_____________________________________________")
        
        print("¡Inserción enla tabla paises lograda con éxito!")
        
        df.insertar_universidades(df_universidades, "AlumnaAdalab", "universidades")
        
        print("_____________________________________________")
        
        print("¡Inserción enla tabla universidades lograda con éxito!")