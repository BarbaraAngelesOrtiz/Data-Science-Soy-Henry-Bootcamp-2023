import requests
import pymysql
from io import StringIO
import csv

link = "https://datosabiertos.bogota.gov.co/dataset/1727a802-538d-4f05-8f96-afe4196397a6/resource/53e4692a-2b82-46c9-9025-ad159a5a11b8/download/cicloparqueaderos-del-sistema-transmilenio-agosto-2020.csv"


dato = requests.get(link)
nueva_tabla = StringIO(dato.text)
doc = csv.reader(nueva_tabla, delimiter=";")
next(doc)

datos = [(i[0], i[3], i[4], i[5], i[6]) for i in doc] 
del datos[-1]

conexion = pymysql.connect(host = 'localhost', user = 'root', password = 'password', database = "datos_cicloruta")
cursor = conexion.cursor()
cantidad = cursor.execute("select * from cicloruta")
for _ in range(cantidad):
    print(cursor.fetchone())