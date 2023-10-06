/*  EJERCICIO 1. Selecciona las victorias máximas y mínimas para cada equipo diferente en la tabla de stats. */

SELECT `TEAM_ID`, MAX(`W`), MIN(`W`) 
	FROM `Stats`
	GROUP BY `TEAM_ID`;

/*  EJERCICIO 2. Obtén los primeros 10 resultados de la tabla de teams */

SELECT * 
	FROM `Teams`
	LIMIT 10;

/*  EJERCICIO 3. Selecciona todos los datos de los equipos que tengan entre 20 y 30 victorias de la tabla stats. */

SELECT * 
	FROM `Stats`
	WHERE `W` BETWEEN 20 AND 30;

/*  EJERCICIO 4. Realiza un cuenteo de número total de equipos que existende la tabla teams. */

SELECT COUNT(`Team_ID`) AS `total_teams`
	FROM `teams`;

/*  EJERCICIO 5. Calcula la media de todos los puntos conseguidos de la tabla stats (redondeo a dos decimales): */

SELECT ROUND(AVG(`GP`),2) AS `GP_AVG`
	FROM `Stats`;

/*  EJERCICIO 6. Selecciona el máximo de victorias, máximo de puntos y la diferencia entre el máximo de puntos con la media de puntos 
como diferencia_media de la tabla stats (redondeado a dos decimales) */

SELECT MAX(`W`) AS `MAX_Victories`, MAX(`GP`) AS `MAX_GP`, ROUND((MAX(`GP`)-AVG(`GP`)),2) AS `MAXGP_AVGGP`
	FROM `Stats`;