<h1>Bootcamp Módulo 4</h1> 
<p><img alt="henry" src="images/henry.jpeg" /> </p>
<h2>Elegir la opción correspondiente</h2>
<p>1) En Big Data, la característica <code>variedad</code> consiste en: </p>
<p>Opciones: </p>
<p>a- El establecimiento de un flujo de datos masivo y continuo
b- Poder gestionar y canalizar grandes volúmenes de datos provinientes de diversas fuentes
c- Poder trabajar con datos estructurados y no estructurados </p>
<p>2) Diferencia fundamental entre dataframes y datasets: </p>
<p>Opciones: </p>
<p>a- El dataset está disponible solo en Scala, mientras que el dataframe lo está únicamente en Python
b- Los datasets poseen columnas y filas. En cambio, los dataframes tienen una estructura de datos similar a un diccionario
c- El dataset es una estructura de datos que utiliza clases fuertemente tipadas. Esto lo hace en una estructura más perfomante que el Dataframe </p>
<p>3) El concepto de <code>escalabilidad horizontal</code>: </p>
<p>Opciones: </p>
<p>a- Consiste en un conjunto de equipos que trabajan como un todo respecto al procesamiento y almacenamiento de los datos
b- Es una arquitectura cliente-servidor adaptada a la gestión de grandes volúmenes de datos, pero replicado en varios servidores
c- Consiste en que para mejorar las capacidades de un cluster, no es necesario agregar hardware más potente en nodos existenes, sino que se pueden agregar nuevos nodos. Cada nodo en particular, no necesariamente tiene que ser un Hardware potente. La potencia del Cluster viene dada por la suma de los recursos de todos sus nodos.
d- Es una arquitectura cliente-servidor adaptada a la gestión de grandes volúmenes de datos
e- Funciona sobre cualquier sistema operativo </p>
<p>4) Al momento de usar clases fuertemente tipadas en Scala: </p>
<p>Opciones: </p>
<p>a- Si el dato ingestado no es acorde con los tipos definidos, el lenguaje lo infiere y lo carga
b- Si el dato ingestado no es acorde con los tipos definidos, arroja un error en tiempo de compilación
c- Es igualmente performante que el uso de un Dataframe, donde la estructura de datos se infiere</p>
<p>5) El Teorema CAP dice que: </p>
<p>Opciones: </p>
<p>a- Un sistema SQL tiene la característica de ser consistente
b- Un sistema No-SQL puede ser tolerante a particiones y consistente
c- No es posible para ningún sistema de bases de datos garantizar al mismo tiempo consistencia, disponibilidad y tolerancia a particiones 
d- Un sistema SQL puede ser consistente y estar disponible
e- Un sistema SQL o No-SQL no puede garantizar al mismo tiempo consistencia, disponibilidad y tolerancia a particiones</p>
<p>6) En un Data Warehouse los datos se organizan bajo un modelo relacional. Sin embargo: </p>
<p>Opciones: </p>
<p>a- En los últimos años, con la evolución de la tecnología de redes y la capacidad de cómputo, ha surgido un nuevo tipo de dato, no estructurado, que requiere de un enfoque distinto al tradicional a la hora de ser gestionado
b- El Data Warehouse, como tal, no está contemplado entre las herramientas de Big Data
c- Este esquema ha dejado de usarse en los últimos años </p>
<p>7) Respecto al Data Lake, ¿cuál de las siguientes afirmaciones es correcta?: </p>
<p>Opciones: </p>
<p>a- Es una mejora del Data Warehouse, ya que consiste en tener más capacidad de hardware para la gestión de grandes caudales de datos
b- Es un repositorio unificado de datos estructurados y no estructurados que prioriza el almacenamiento de los datos en su formato original, para posteriormente ser procesados de acuerdo a la demanda
c- Es un sistema de ETL distribuido</p>
<p>8) ¿Cuál de las siguientes afirmaciones NO es correcta? </p>
<p>Opciones: </p>
<p>a- Cada DataNode tiene su propio sistema de archivos local
b- Al ingestarse un nuevo archivo, el NameNode elige un DataNode del cluster y lo ubica allí
c- El NameNode optimiza el ancho de banda y balancea la carga de procesamiento y almacenamiento</p>
<p>9) En un cluster que tiene un factor de réplica de 3 y un tamaño de bloque de 128 MB, se guarda un archivo de 2000 MB ¿Cuántos segmentos del archivo original se deberán distribuir a lo largo del cluster? </p>
<p>Opciones: </p>
<p>a- 48</p>
<p>b- 47</p>
<p>c- 17</p>
<p>10) ¿Cuál de las siguientes formas es la más eficiente para almacenar datos en Hive? </p>
<p>Opciones: </p>
<p>a- Utilizar particiones sobre todos los campos de las tablas
b- Evaluar aquellos campos que sean frecuentemente utilizados como filtros en las consultas, para así aplicar particionamiento
c- Alojar los datos en formato CSV</p>
<p>11) En caso de realizar una operación de tipo DROP TABLE en Hive: </p>
<p>Opciones: </p>
<p>a- No está habilitada tal funcionalidad</p>
<p>b- Si la tabla es "External" se eliminan solo los datos fuente</p>
<p>c- Si la tabla es "Managed" se elimina tanto la metadata como los datos fuente</p>
<p>d- Si la tabla es "Managed" se elimina la metadata pero no los datos fuente</p>
<p>12) ¿Cuál de las siguientes afirmaciones NO es correcta? </p>
<p>Opciones: </p>
<p>a- Docker ejecuta sus procesos de forma nativa
b- Los servicios de docker pueden llegar a consumir más recursos de los que se les permite
c- Cada contenedor tiene un ID único y también poseen un nombre</p>
<p>13) Dentro de la arquitectura <code>docker</code> encontramos: </p>
<p>Opciones: </p>
<p>a- Contenedores, imágenes, volúmenes y redes
b- Imagenes, archivos YML, herramientas de Big Data y redes
c- Máquinas virtuales de poca capacidad de almacenamiento
d- Contenedores, servicios, volúmenes y redes
e- Contenedores y máquinas virtuales</p>
<p>14) Señale la característica relevante de <code>Apache Spark</code>: </p>
<p>Opciones: </p>
<p>a- Notable mejora en la velocidad de procesamiento debido al uso de la memoria RAM del cluster
b- Puede sustituir todas las funcionalidades de los motores No-SQL
c- Tolerancia a fallos de red</p>
<p>15) Kafka es un sistema de mensajes distribuido: </p>
<p>Opciones: </p>
<p>a- Que utiliza el patrón productor-consumidor y maneja el concepto de tópico para categorizar esos mensajes</p>
<p>b- Que solo se puede utilizar para procesamiento streaming</p>
<p>c- Que monitorea un proceso streaming</p>
<h2>Utilizando los archivos provistos en las carpetas "data_cp_airports" y "data_cp_flights" responder:</h2>
<h3>Nota: Para la realización de los puntos 16 al 20, se puede utilizar el entorno visto en clase ubicado en el repositorio: https://github.com/soyHenry/DS-M4-Cluster_Spark</h3>
<p>16) En la carpeta "data_cp_flights" hay un archivo Parquet, comprimido con Snappy, en adelante, la tabla "flights". ¿Qué cantidad de columnas posee? </p>
<p>Opciones: </p>
<p>1- 5</p>
<p>2- 7</p>
<p>3- 12</p>
<h3>Quitar de la tabla "flights" los registros que tengan valores nulos o faltantes en los campos "ArrDelay" y "DepDelay". Luego contestar:</h3>
<p>17) ¿Cuál es la tupla de aeropuertos, con mayor cantidad de vuelos entre sí? Nota: Es posible tomar el nombre del aeropuerto desde el archivo "airports.json" ubicado en la carpeta "data_cp_airports", donde "airport_id" se puede relacionar con "OriginAirportID" y "DestAirportID" de la tabla "flights" </p>
<p>Opciones: </p>
<p>1-Honolulu International - Kahului Airport
2-San Francisco International - Los Angeles International
3-Los Angeles International - McCarran International </p>
<h3>Contestar las siguientes tres preguntas (todas tienen la misma premisa antes de la pregunta):</h3>
<p>18) Si consideramos que cuando el campo ArrDelay es mayor a 25, el vuelo está demorado, contestar: ¿Cuál es la tupla de aeropuertos, con mayor cantidad de vuelos demorados entre sí? Nota: Es posible tomar el nombre del aeropuerto desde el archivo "airports.csv", donde "airport_id" se puede relacionar con "OriginAirportID" y "DestAirportID" de la tabla "flights" </p>
<p>Opciones: </p>
<p>1-Honolulu International - Kahului Airport
2-San Francisco International - Los Angeles International
3-Chicago O'Hare International - San Francisco International </p>
<p>19) Si consideramos que cuando el campo ArrDelay es mayor a 25, el vuelo está demorado, contestar: ¿Cuál es el aeropuerto con el mayor promedio de demora en arribos, teniendo en cuenta el de orígen? (OriginAirport - ArrDelay) </p>
<p>Opciones: </p>
<p>1-Port Columbus International
2-Honolulu International
3-Kahului Airport
4-Phoenix Sky Harbor International </p>
<p>20) Si consideramos que cuando el campo ArrDelay es mayor a 25, el vuelo está demorado, contestar: ¿Cuál es la cantidad de vuelos demorados? </p>
<p>Opciones: </p>
<p>1-380502
2-1255037
3-2309883 </p>