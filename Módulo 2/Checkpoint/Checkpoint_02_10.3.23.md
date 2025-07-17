# Checkpoint - Módulo 2
Atención:
Cómo responder:

Cuando se pida una respuesta numérica y tenga decimales, redondear al segundo decimal(Recordar que el 5 redonde para arriba)
Ejemplo: 1.3421 -> 1.34
1.8888 -> 1.89
1.855 -> 1.86

Expresar porcentajes entre de la siguiente manera:
- Entre 0 y 1
- 25% ---> 0.25

Link a los archivos necesarios para realizar el CP:
https://drive.google.com/drive/folders/1zPnNL577d8Jz3dD9-0G5zXGqw5NKLWxV?usp=sharing

## Responder Verdadero ó Falso

## 1) Todos las métricas son KPI's

No todas las métricas son KPI
Las métricas son valores medibles de alguno de los distintos procesos que se realizan en la empresa, pero su análisis no ofrecerá información sobre la eficiencia de las estrategias empresariales. Por lo tanto, aunque todos los KPI son métricas de negocio, no todas las métricas son KPI

## 2) Dentro de un espacio muestral, ¿es posible tener eventos desconocidos, debido a que no es posible saber todos los escenarios posibles dentro de un experimento aleatorio?

verdadero

## Elegir la opción correcta

## 3) ¿Cuál es el KPI a utilizar si quisiera saber si a un cliente se lo puede considerar "muy bueno" en relación al gasto que realiza en mi negocio desde que es cliente?
   1- LTV
   2- CAC
   3- cONVERSION RATE
   4- CHURN RATE

1

## 4) El espacio muestral es:
   1- El conjunto de todos los resultados posibles de un experimento.<br>
   2- Una tabla con las distintas funciones de probabilidad.<br>
   3- Un evento que puede describirse con una característica única.<br>

   1

## 5) Dos sucesos son compatibles:
   1- Cuando pueden ocurrir al mismo tiempo.<br>
   2- Cuando son mutuamente excluyentes.<br>
   3- Cuando corresponden a un conjunto de eventos colectivamente exhaustivo.<br>

   1

## Resuelve los siguientes ejercicios:

## 6) Un jugador tiene dos dados, lanza los dos dados a la vez y suma el resultado obtenido de los dados lanzados, ¿cuál es la suma resultante más probable al momento de lanzar los dos dados?

Espacio muestral - {(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2 ),(2,3),(2,4),(2,5),(2,6),(3,1),(3,2),(3,3),(3,4), (3,5),(3,6),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(5 ,1),(5,2),(5,3),(5,4),(5,5),(5,6),(6,1),(6,2),(6,3 ),(6,4),(6,5),(6,6)}

{(1,1),
(1,2),(2,1)
(1,3),(2,2 )(3,1)
(1,4),(2,3)(3,2)(4,1)
(1,5),(2,4)(3,3)(4,2)(5 ,1)
(1,6),(2,5),(3,4)(4,3)(5,2)(6,1)
(2,6),(3,5),(4,4)(5,3)(6,2)
(3,6),,,,,(4,5),(5,4)(6,3 )
(4,6),,,,,(5,5),(6,4)
(5,6),,,,,(6,5)
(6,6)}

Número total de "resultados" = n (espacio muestral) = 36

Casos de obtener una puntuación total de como máximo 7 puntos = { (1,6),(2,5),(3,4),(4,3),(5,2),(6,1)} = 6

Por lo tanto, la probabilidad es: 6/36 = 1/6= 0.17

## 7) Dado un mazo de cartas de la baraja francesa, conocida como de poker, ¿Cuál es la probabilidad de sacar dos cartas rojas si no se hace una reposición de la carta luego de sacar la primera? *La baraja francesa es un conjunto de naipes o cartas, formado por 52 unidades repartidas en cuatro palos: corazones, diamantes, tréboles y picas. No tienen comodínes.

*La baraja francesa es un conjunto de naipes o cartas, formado por 52 unidades repartidas en cuatro palos: corazones, diamantes, tréboles y picas. No tienen comodínes.

def probabilidadNaipes(categoria):
   cartas_totales = 52
   cartas_color = 26
   cartas_palo = 13
   if categoria == 'rojo' or categoria == 'negro':
      return cartas_color / cartas_totales
   elif categoria in ('pica', 'trebol', 'corazon', 'diamante'):
      return cartas_palo / cartas_totales

probabilidadNaipes('rojo')

P= 26/52*25/51 
round(26/52*25/51,2)= 0.25

## 8)  Se tienen 4 canicas blancas y 4 canicas negras dentro de un frasco, luego de manera aleatoria se sacan dos canicas, una detrás de la otra. ¿Cuál es la probabilidad de que ambas sean de un mismo color? 

p= 4/8*3/7 + 4/8*3/7

print (4/8*3/7 + 4/8*3/7)     
0.42857142857142855
round(4/8*3/7 + 4/8*3/7,2)
0.43

## 9) En una cola en el banco, llaman en promedio 2 personas cada 8 minutos. ¿Cuál es la probabilidad de que en esos 8 minutos llamen a 1 persona o más personas? 

Uso Poisson

from math import e, factorial
from statistics import NormalDist

#DISTRIBUCIÓN DE POISSON
def probabilidad_poisson(lamba_np,x):
     probabilidad = (pow(e,-lamba_np) * pow(lamba_np,x))/factorial(x)
     return probabilidad

print(1-(probabilidad_poisson(2,0)+probabilidad_poisson(2,1)))
round ( 1-(probabilidad_poisson(2,0)+probabilidad_poisson(2,1)), 2)

0.5939941502901619
0.59

## 10) En un control de calidad, se tiene  que de 65 productos seleccionados, 2 poseen fallas de fabricación, ¿Cuál es la probabilidad de encontrar un producto con fallas si se seleccionan 5 productos?

Uso Hipergeometrica

#DISTRIBUCIÓN HIPERGEOMÉTRICA
from scipy import stats
#M es N, N es n, n es k, k es x

M, n, k, N = [12, 5, 1, 3]
# hypergeom.cdf(x, M, n, N)
hypergeo = stats.hypergeom(M,n,N)

def probabilidad_hipergeometrica(N,X,n,x):
  Xx = factorial(X)/(factorial(x)*factorial(X-x))
  NX_nx= factorial(N-X)/(factorial(n-x)*factorial((N-X)-(n-x)))
  Nn = factorial(N)/(factorial(n)*factorial(N-n))
  hipergeometrica = (Xx * NX_nx)/Nn

  return hipergeometrica

probabilidad_hipergeometrica(65,2,5,1)
round(probabilidad_hipergeometrica(65,2,5,1) ,2)

0.14

## En tu motor de base de datos MySQL, ejecutá las instrucciones del script 'Checkpoint_Create_Insert.sql' (Si no trabajas con MySQL es posible que tengas que realizar algunos ajustes en el script. También están provistas las tablas en formato csv dentro de la carpeta 'tablas_cp').
Se crearan 3 tablas:<br>
* venta:
* canal_venta
* producto<br>
<img src='Checkpoint_DER.jpg'>

Una empresa de venta de productos tiene como objetivo hacer crecer su canal de ventas OnLine, por tal motivo la dirección se plantean algunas cuestiones para entender como va evolucionando el negocio

## Contestar las siguientes preguntas, utilizando el DER y mysql:

## 11) ¿Cuál es el año con la mayor cantidad de productos vendidos? Responder con número de año. Ejemplo: 2024

SELECT year(Fecha) as Año, sum(Cantidad) as Cantidad_Venta
from checkpoint_m2.venta
group by year (fecha)
order by Cantidad_Venta desc;

RTA 2020

## 12) ¿Cuál es el canal de venta que tiene la segunda posición en cantidad de ventas en 2020?
1- OnLine<br>
2- Telefónica<br>
3- Presencial<br>

select cv.Canal, v.IdCanal, sum(cantidad) as Numero_ventas
from checkpoint_m2.venta v
join checkpoint_m2.canal_venta cv on (cv.IdCanal = v.IdCanal)
where YEAR(Fecha) = '2020' 
group by v.IdCanal
order by Numero_ventas

Primero es presencial y 2do Telefonica
Rta telefonico

## 13) ¿Cuál es el Id del empleado que menor cantidad de productos vendió en el histórico de ventas de la empresa?

   1- 3603<br>
   2- 3504<br>
   3- 1723<br>
   4- 3186<br>
   5- 2557<br>
  

select IdEmpleado, sum(Cantidad) as Prod_vendido
from checkpoint_m2.venta
group by IdEmpleado
order by Prod_vendido asc;

RTA 1723

## 14) Se define el tiempo de entrega como el tiempo en días transcurrido entre que se realiza la compra y se efectua la entrega. 
## Para analizar mejoras en el servicio, la dirección desea saber: cuál es el año con el promedio más alto de este tiempo de entrega. (Fecha = Fecha de venta; Fecha_Entrega = Fecha de entrega) *

select Year(Fecha) ,avg(timestampdiff(DAY, Fecha, Fecha_Entrega)) as Prom_Entrega
from checkpoint_m2.venta
group by Year(Fecha)
order by Prom_Entrega desc;

RTA 2020

## 15) ¿Cuál es el promedio de precio de los productos cuyo concepto comienza con la letra C?

select p.Concepto, sum(v.Precio) as PROM
from checkpoint_m2.venta v
join checkpoint_m2.producto p on (p.IDProducto = v.IdProducto)
where p.Concepto LIKE 'C%'
group by v.IDProducto
order by PROM desc;

select avg(Precio) as Promedio
from checkpoint_m2.producto
where Concepto LIKE 'C%';

555.7542105

round(555.7542105 ,2) 
555.75

## 16) ¿Cuantos productos tienen la palabra " CD " (mayúsculas o minúsculas) en alguna parte de su descripción (Concepto = Descripción del Producto) y su precio es mayor a 500? *

select COUNT(*) 
from checkpoint_m2.producto
where concepto like "%CD%" and precio >500 ;

RTA 3

## 17) ¿Cuál es el id del Producto cuyo nombre es EPSON COPYFAX 2000?

select *
from checkpoint_m2.producto
where Concepto = 'EPSON COPYFAX 2000';

RTA 42737

## 18) Cual fue el mes (Fecha = Fecha de Venta) con menor venta (Venta = Precio*Cantidad) de la sucursal 13 para el año 2015 ? *
   1- 9<br>
   2- 3<br>
   3- 12<br>
   4- 6<br>
   5- 8<br>

SELECT month(Fecha), sum(Cantidad * Precio) as Cantidad_Venta
from checkpoint_m2.venta
where YEAR(Fecha) = '2015' and IdSucursal = '13'
group by month(Fecha)
order by Cantidad_Venta asc;

RTA MES 6



















