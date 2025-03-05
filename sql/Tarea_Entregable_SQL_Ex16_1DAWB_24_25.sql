
Nombre: <Pon aqu� tu nombre>

/************************************************************************/
	INSTRUCCIONES:
	==============
-Salva este fichero con las iniciales de tu nombre y apellidos,
 en el directorio "C:\TAREA_ENTREGABLE\ ":
	Ejemplo:	Si tu nombre es             Tomas Coronado Garcia
			    el fichero debe llamarse:   00TCG_TE.sql
El numero que pones delante de tus iniciales debe ser el que aparece a continuaci�n:

01 Fran Alba Mu�oz
02 Sergio Arag�n Garc�a
03 Alejandro Borrego Cruz
04 Alfonso Jes�s Castej�n Moreno
05 
06 Indalecio Dom�nguez Hita
07 Pablo Fern�ndez Fern�ndez
08 Roc�o Luque Montes
09 Jos� �ngel Masfarr� Merch�n
10 Daniel Montes Iglesias
11 �ngel Mu�oz Guti�rrez
12 Ezequiel Ortega Bravo
13 Abel Suazo Cabeza de Vaca


-En este archivo pon tu nombre completo, arriba, 
- y lee atentamente todas los enunciados para realizar las consultas.

-Entra en el pgAdmin4 y en Notepadplus, create una nueva base de datos

-Carga el script para el examen desde el fichero "Empresa_Datos_T_Entr_Ex16_ult_POSTGRE.sql".

-Donde ponga "SQL>", copiar�s las sentencias SQL que has utilizado.

-Donde ponga "Resultado:" copiar�s el resultado que la consola SQL*Plus te devuelve.

-RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. Es lo que voy a evaluar, si lo pierdes, es tu responsabilidad.
-PUNTUACI�N:  	Cada pregunta se evaluar� de 0 a 10 puntos, sumando el resultado final y dividiendo entre el numero de preguntas para obtener el resultado final.


-ENTREGA: Cuando finalices entrega antes de la hora limite de entrega, 
- subiendo a este fichero SQL a Moodle.


/************************************************************************/
	Descripci�n de las tablas:
	==========================

CENTROS
-------
# Cod_ce	NUMBER(2)			N�mero identificativo del centro
  Nombre_ce	VARCHAR2(30)		Nombre del centro
  Dir_ce	VARCHAR2(35)		Direcci�n del centro

DEPARTAMENTOS
-------------
# Cod_de		NUMBER(3)		N�mero identificativo del departamento
* Centro_de		NUMBER(2)		N�mero del centro de trabajo donde est� el departamento
* Director_de	NUMBER(4)		N�mero del empleado que es director del departamento
  TipoDir_de	CHAR(1)			Tipo de director: 'P', en propiedad y 'F', en funciones
  Presuesto_de	NUMBER(6)		Presupuesto anual del departamento
* Dptojefe_de	NUMBER(3)		N�mero del departamento del que depende
  Nombre_de		VARCHAR2(30)	Nombre del departamento

EMPLEADOS
---------
# Cod_em		NUMBER(4)		N�mero identificativo del empleado
* Dpto_em		NUMBER(3)		N�mero del departamento al que est� asignado el empleado
  ExtTel_em		NUMBER(3)		Extensi�n telef�nica del empleado
  FechaNac_em	DATE			Fecha de nacimiento
  FechaIng_em	DATE			Fecha de ingreso en la empresa
  Salario_em	NUMBER(5)		Salario mensual en euros
  Comision_em	NUMBER(5)		Comisi�n mensual en euros
  Numhijos_em	NUMBER(2)		N�mero de hijos
  Apellidos_em	VARCHAR2(30)	Apellidos del empleado
  Nombre_em		VARCHAR2(15)	Nombre del empleado

Nota: 
	# PRIMARY KEY
	* FOREIGN KEY

/************************************************************************/
/** ENUNCIADOS PARA REALIZAR LAS CONSULTAS **/	
/************************************************************************/
1.- Hallar el n�mero de empleados de toda la empresa.

SQL>

RESULTADO:

/************************************************************************/
2.- Hallar la masa salarial (salarios+comisiones) de la empresa.

SQL>

RESULTADO:

/************************************************************************/
3.- Obtener un listado que incluya el nombre de cada uno de los departamentos 
junto al nombre y apellidos de su director.

SQL>

RESULTADO:

/************************************************************************/
4.- Obtener, por orden alfab�tico, los nombres y apellidos 
de los empleados cuyo salario es igual o superior 
al mayor de los salarios de los empleados del departamento 122.

SQL>

RESULTADO:

/************************************************************************/
5.- Obtener, por orden alfab�tico, los nombres, apellidos y las comisiones 
de los empleados del departamento 110.

SQL>

RESULTADO:

/************************************************************************/
6.- Datos de los empleados que cobran el salario m�ximo de su departamento.	

SQL>

RESULTADO:

/************************************************************************/
7.- Calcular aquellos empleados que llevan m�s de 35 a�os en la empresa. 
Muestre todos los datos de cada uno de ellos.

SQL>

RESULTADO:

/************************************************************************/
8.- Hallar, por orden de n�mero de empleado, el nombre, 
apellidos y el salario total (salario m�s comisi�n) 
de los empleados cuyo salario total supera los 1300 euros mensuales.

SQL>

RESULTADO:

/************************************************************************/
9.- Mostrar para cada empleado el n�mero de meses que lleva 
el empleado en la empresa junto con su nombre.

SQL>

RESULTADO:

/************************************************************************/
10.- Mostrar un listado donde aparezca el c�digo de los departamentos 
y su nombre conjuntamente con el c�digo de los centros en donde est�n situados 
y el nombre de estos centros.

SQL>

RESULTADO:



11.- Hallar, en una consulta, los siguientes datos para cada departamento junto con su c�digo:
	a) N�mero de empleados.
	b) Salario medio, m�ximo y m�nimo
	c) Media de las comisiones.

Poner un alias a las columnas que usen funciones de grupo o agregaci�n.

SQL>

RESULTADO:

/************************************************************************/
12.-  Calcular cuantos n�meros de tel�fono distintos usa cada departamento, 
mostrando el c�digo y el nombre de cada departamento.

SQL>

RESULTADO:

/************************************************************************/
13.- Mostrar los departamentos (n�mero y nombre) 
con sus centros (n�mero y nombre) y la edad media de sus empleados 
de aquellos departamentos que tienen una edad media en sus empleados mayor a 35 a�os.

SQL>

RESULTADO:

/************************************************************************/
14.- Para cada grupo de empleados que cobran el mismo salario 
y tienen el mismo n�mero de hijos, diga cuantos empleados forman el grupo 
y en cuantos departamentos est�n trabajando.

SQL>

RESULTADO:

/************************************************************************/
15.- Para cada extensi�n telef�nica, hallar cu�ntos empleados la usan 
y el salario medio de �stos.

SQL>

RESULTADO:

/************************************************************************/
16.- Hallar el salario medio por departamento para aquellos 
departamentos cuyo salario m�ximo es inferior al salario medio de todos los empleados.

SQL>

RESULTADO:

