-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2019 a las 14:28:27
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `yanosoyelsenado`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `-----------ALERTAREINCOPORACION` ()  NO SQL
insert into alertas (tipoalerta,descripcionalerta,estado)
SELECT '1ra reincorporacion','el alumno debe firmar la reincorporacion',1
FROM alertas a 
INNER JOIN reincorporaciones r on r.idReincorporacion = a.estado
WHERE r.tipoReincorporacion='primera reincorporacion' and r.estado=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//ASISTENCIAxCURSOCUALITATIVODOEm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where ( c.idCurso=pidcurso and s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//ASISTENCIAxCURSOCUALITATIVOm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo ,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso 
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where ( c.idCurso=pidcurso and s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//LISTADOxALUMNOCUANTIDOEm` (IN `pbuscarnombre` VARCHAR(30), IN `pbuscarapellido` VARCHAR(30), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
SELECT a.nombre, a.apellido, c.anio, c.division, 
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Tarde' AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',


COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN seguimientos s ON axc.idAlumnxcurso = s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON sm.idSubmotivo = m.idSubmotivo
WHERE a.nombre LIKE ('%',pbuscarnombre,'%') AND a.apellido LIKE ('%',pbuscarapellido,'%')  AND s.fecha BETWEEN pfecha1 AND pfecha2
GROUP BY  a.nombre, a.apellido, c.anio, c.division$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//LISTADOXCURSOCUANTIDOEm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
select a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', 
sum(if (m.asistencia= 'Ausente',m.valorAsistencia,0))+
sum(if(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(if(m.asistencia= 'Tarde',m.valorAsistencia,0)) as 'Total faltas',

COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Tarde Teorico', 
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) as 'valor Tarde teorico', 
COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Taller',1,null)) as 'Tarde Taller',
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) as 'Valor Tarde Taller',
COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Tarde Ed fisica', 
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) as 'Valor Tarde Ed fisica', 
COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Tarde Contra-turno',
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'Valor Tarde Contra-turno',

COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Ausente Teorico', 
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) as 'Valor Ausente Teorico', 
COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Taller',1,null)) as 'Ausente Taller',
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) as 'Valor Ausente Taller',
COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Ausente Ed fisica', 
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) as 'Valor Ausente Ed fisica',
COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Ausente  Contra-turno',
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'Total Ausente  Contra-turno',


COUNT(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Ausente con presencia Teorico', 
SUM(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) as 'Ausente con presencia Taller', 
COUNT(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Ausente con presencia Taller',
SUM(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'valor Teorico contra-turno',
COUNT(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Teorico contra-turno ',
SUM(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'valor Teorico contra-turno'
FROM alumnos a 
INNER JOIN alumnxcurso axc on a.idAlumno = axc.idAlumno
INNER JOIN cursos c on axc.idCurso = c.idCurso
inner JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso 
INNER JOIN motivos m on s.idMotivo = m.idMotivo
INNER JOIN submotivos sm on m.idSubmotivo = sm.idSubmotivo
 WHERE  c.idCurso= pidcurso and  s.fecha BETWEEN pfecha1 and pfecha2
group by a.nombre, a.apellido, c.anio, c.division$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//LISTADOXCURSOCUANTIm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
select a.idAlumno ,a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', 
sum(if (m.asistencia= 'Ausente',m.valorAsistencia,0))+
sum(if(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(if(m.asistencia= 'Tarde',m.valorAsistencia,0)) as 'Total faltas',

COUNT(if(m.asistencia = 'Presente'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Presente Teorico', 
COUNT(if(m.asistencia = 'Presente'and sm.tiposubmotivo = 'Taller',1,null)) as 'Presente Taller',
COUNT(if(m.asistencia = 'Presente'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Presente Ed fisica', 
COUNT(if(m.asistencia = 'Presente'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Presente Contra-turno', 

COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Tarde Teorico', 
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) as 'valor Tarde teorico', 
COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Taller',1,null)) as 'Tarde Taller',
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) as 'Valor Tarde Taller',
COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Tarde Ed fisica', 
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) as 'Valor Tarde Ed fisica', 
COUNT(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Tarde Contra-turno',
SUM(if(m.asistencia = 'Tarde'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'Valor Tarde Contra-turno',

COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Ausente Teorico', 
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) as 'Valor Ausente Teorico', 
COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Taller',1,null)) as 'Ausente Taller',
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) as 'Valor Ausente Taller',
COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Ausente Ed fisica', 
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) as 'Valor Ausente Ed fisica',
COUNT(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Ausente  Contra-turno',
SUM(if(m.asistencia = 'Ausente'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'Total Ausente  Contra-turno',


COUNT(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico',1,null)) as 'Ausente con presencia Teorico', 
SUM(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) as 'Ausente con presencia Taller', 
COUNT(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Ed Fisica',1,null)) as 'Ausente con presencia Taller',
SUM(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'valor Teorico contra-turno',
COUNT(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico contra-turno',1,null)) as 'Teorico contra-turno ',
SUM(if(m.asistencia = 'Ausente con presencia'and sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) as 'valor Teorico contra-turno'
FROM alumnos a 
INNER JOIN alumnxcurso axc on a.idAlumno = axc.idAlumno
INNER JOIN cursos c on axc.idCurso = c.idCurso
inner JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso 
INNER JOIN motivos m on s.idMotivo = m.idMotivo
INNER JOIN submotivos sm on m.idSubmotivo = sm.idSubmotivo 
 WHERE c.idCurso = pidcurso and s.fecha BETWEEN pfecha1 and pfecha2
group by a.nombre, a.apellido, c.anio, c.division$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//LISTATOALUMNOCUALITATIVOm` (IN `pbuscarnombre` VARCHAR(30), IN `pbuscarapellido` VARCHAR(30), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo ,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where (a.nombre like concat('%',pbuscarnombre,'%') and a.apellido like concat('%',pbuscarapellido,'%') and s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//MODIFICARASISTENCIA` (IN `pIdseg` INT, IN `pidUsuarios` INT, IN `pidMotivos` INT, IN `pidSubmotivo` INT, IN `pjustificados` VARCHAR(80), IN `pobservaciones` VARCHAR(255), IN `pidAlumnxcurso` INT, IN `pcursos` INT, IN `pfecha` VARCHAR(10), IN `phora` TIME)  NO SQL
BEGIN
IF EXISTS (SELECT * FROM seguimientos WHERE idSeguimiento = pIdseg)
THEN
UPDATE seguimientos s
LEFT OUTER JOIN usuarios u ON s.idUsuario = u.idUsuario
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
SET s.estado = 7
WHERE s.idSeguimiento = pIdSeg
;
INSERT INTO `seguimientos`(`idAlumnxcurso`,`idUsuario`,`idSubmotivo`,`idMotivo`, `idCurso`, `fecha`, `hora`, `justificado`, `observaciones`,`estado`)
VALUES (pidAlumnxcurso,pidUsuarios,pidSubmotivo,pidMotivos, pcursos, pfecha, phora,pjustificados,pobservaciones,1);
INSERT INTO `modificaciones` (`idUsuario`, `tipomodificacion`, `fechaModificacion`, `horaModificacion`)
VALUES (pidUsuarios, 'Modificacion de asistencia', CURRENT_DATE(), CURRENT_TIME());
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//REGISTROASISTENCIA` (IN `pidAlumnxcurso` INT, IN `pidUsuarios` INT, IN `pidMotivos` INT(3), IN `pfecha` VARCHAR(10), IN `phora` VARCHAR(5), IN `pjustificados` VARCHAR(45), IN `pobservaciones` VARCHAR(45), IN `psubmotivos` INT(2), IN `pcursos` INT)  NO SQL
BEGIN
IF NOT EXISTS (SELECT idAlumnxcurso FROM seguimientos WHERE idAlumnxcurso = pidAlumnxcurso AND `idUsuario` = pidUsuarios AND `idSubmotivo` = psubmotivos AND `idMotivo` = pidMotivos AND `idCurso` = pcursos AND `fecha` = pfecha AND `hora` = phora AND `justificado` = pjustificados AND `estado` = 1 AND `observaciones` = pobservaciones)
THEN
INSERT INTO `seguimientos`(`idAlumnxcurso`,`idUsuario`,`idSubmotivo`,`idMotivo`, `idCurso`, `fecha`, `hora`, `justificado`,`estado`, `observaciones`)
VALUES (pidAlumnxcurso,pidUsuarios,psubmotivos,pidMotivos, pcursos, pfecha, phora,pjustificados,1,pobservaciones);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//zzzHecha` (IN `pNom` INT(20), IN `pApe` INT(20), IN `pFechaMin` INT(10), IN `pFechaMax` INT(10))  NO SQL
BEGIN
IF (LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE re.estado=0
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE a.nombre LIKE CONCAT('%',TRIM(pNom),'%') AND (re.estado=0)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN

SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (re.estado=0)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN

SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado=0) 
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;



IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.id_estado = 1)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;



IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `//zzzPendiente` (IN `pNom` INT(20), IN `pApe` INT(20), IN `pFechaMin` INT(10), IN `pFechaMax` INT(10))  NO SQL
BEGIN
IF (LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE re.estado>0
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE a.nombre LIKE CONCAT(TRIM(pNom), "%") AND (re.estado>0)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN

SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (re.estado>0)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN

SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado>0) 
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;



IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.id_estado = 1)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;



IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND NOW()) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF(LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',c.anio AS 'Anio',c.division AS 'Division', c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (re.fecha BETWEEN pFechaMin AND pFechaMax) AND (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ALERTA3SEGUIDAS` (IN `pfechamin` INT(2), IN `pFechamax` INT(4))  NO SQL
BEGIN
select a.nombre, a.apellido, c.anio, c.division
from seguimientos s, alumnxcurso axc, alumnos a, motivos m, cursos c
where s.idAlumnxcurso = axc.idAlumnxcurso
and axc.idAlumno = a.idAlumno
and s.idMotivo = m.idMotivo
and axc.idCurso = c.idCurso
and (s.fecha BETWEEN pfechamin AND pFechamax)
and m.asistencia = 'Ausente'
and EXISTS (
    select 1 from seguimientos s1, motivos m1 where s1.fecha BETWEEN s.fecha and DATE_ADD(s.fecha, INTERVAL 2 DAY)
    and s1.idMotivo = m1.idMotivo
    and m1.asistencia = 'Ausente'
    and s1.idAlumnxcurso = s.idAlumnxcurso
    GROUP by s1.idAlumnxcurso
    HAVING count(*) = 3    
    )
group by a.nombre, a.apellido, c.anio, c.division;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ASIGAR_MATERIACURSO` (IN `idMateria` INT, IN `idCurso` INT, IN `idUsuario` INT)  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM materiasxcursos WHERE id_Materia = idMateria AND id_Curso = idCurso)
THEN
INSERT INTO `materiasxcursos` (`id_Materia`, `id_Curso`,`id_estado`,`id_usuario`)
VALUES (idMateria, idCurso,1,idUsuario);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ASISTENCIAxCURSOCUALITATIVODOEm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where ( c.idCurso=pidcurso  and m.idMotivo!=1 and m.idMotivo!=5 AND m.idMotivo!=9 and s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ASISTENCIAxCURSOCUALITATIVOm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo ,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso 
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where ( c.idCurso=pidcurso and s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_materia` (IN `m_idmateria` INT, IN `m_idUsuario` INT)  NO SQL
BEGIN
UPDATE materias m
SET m.id_estado = 9, m.id_usuario = m_idUsuario
WHERE m.idMateria = m_idmateria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Borrar_MateriaXCurso` (IN `mxc_idUsuario` INT(11), IN `mxc_idMateriaxCurso` INT)  NO SQL
BEGIN
UPDATE materiasxcursos mxc
set mxc.id_estado = 9, mxc.id_usuario = mxc_idUsuario
where mxc.idMateriaxCurso = mxc_idMateriaxCurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_nota` (IN `n_idNotas` INT(11), IN `n_idUsuario` INT)  NO SQL
BEGIN
UPDATE notas n
SET n.id_estado = 9, n.id_usuario = n_idUsuario
WHERE n.id_notas = n_idNotas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_profesor` (IN `p_idprofesor` INT, IN `p_idUsuario` INT)  NO SQL
BEGIN
UPDATE profesores p
SET p.id_estado = 9, p.id_usuario = p_idUsuario
WHERE p.idProfesor = p_idprofesor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_profesorxmateriaxcurso` (IN `pxmxc_idProfxMatexCurso` INT, IN `pxmxc_idUsuario` INT)  NO SQL
BEGIN
UPDATE profesoresxmateriasxcursos pxmxc
SET pxmxc.id_estado = 9, pxmxc.id_usuario = pxmxc_idUsuario
WHERE pxmxc.idProfxMateriaxCurso = pxmxc_idProfxMatexCurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_trimestrenota` (IN `t_idTrimestreNota` INT(11), IN `t_idUsuario` INT(11))  NO SQL
BEGIN
UPDATE trimestresnota tn
SET tn.id_estado = 9, tn.id_usuario = t_idUsuario
WHERE tn.id_trimestrenota = t_idTrimestreNota;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCARALUMNO` (IN `pNumDoc` VARCHAR(40), IN `pNom` VARCHAR(40), IN `pApe` VARCHAR(40))  NO SQL
BEGIN

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.idEstado < 8  AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;


IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones' , c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.documento LIKE CONCAT(TRIM(pNumDoc), "%") AND (a.idEstado <8)  AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;


IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.nombre LIKE CONCAT(TRIM(pNom), "%") AND (a.idEstado BETWEEN 1 AND 7) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso  WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;


IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (a.idEstado <8) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.documento LIKE CONCAT(TRIM(pNumDoc), "%") AND a.nombre LIKE CONCAT(TRIM(pNom), "%") AND (a.idEstado <8) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;


IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.documento LIKE CONCAT(TRIM(pNumDoc), "%") AND a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (a.idEstado <8) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM Alumnxcurso  WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.nombre LIKE CONCAT(TRIM(pNom), "%") AND a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (a.idEstado <8) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0)
THEN
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',DATE_FORMAT(a.fecha_Nacimiento, "%d-%m-%Y") as 'Fecha de nacimiento', a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' , e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones', c.idCurso as "idCurso", axc.idAlumnxcurso as "IdAlunmxCurso"
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
WHERE a.documento LIKE CONCAT(TRIM(pNumDoc), "%") AND a.nombre LIKE CONCAT(TRIM(pNom), "%") AND a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (a.idEstado < 8) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso 
 WHERE idAlumno = a.idAlumno) and a.idAlumno != 0
ORDER BY axc.ciclolectivo, c.anio,c.division, a.apellido, a.nombre
;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarAlumnosXNota` (IN `Pnombre` VARCHAR(50), IN `Papellido` VARCHAR(50), IN `PidCurso` INT(11), IN `PidTrimestre` INT(11), IN `PidCicloElectivo` INT(11), IN `PidMateria` INT(11))  NO SQL
BEGIN

IF(LENGTH(TRIM(Pnombre)) < 1 AND LENGTH(TRIM(Papellido)) < 1 )
THEN
SELECT n.Calificacion, tn.Trimestre, m.Nombre
FROM notas n
INNER JOIN alumnxcurso axc ON n.id_alumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno 
INNER JOIN trimestresnota tn ON n.id_trimestrenota = tn.id_trimestrenota
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN materiasxcursos mxc ON c.idCurso = mxc.id_Curso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
WHERE c.idCurso = PidCurso AND tn.id_trimestrenota = PidTrimestre AND axc.ciclolectivo = PidCicloElectivo AND m.idMateria = PidMateria;
END IF;
   
IF(LENGTH(TRIM(Pnombre)) > 0 AND LENGTH(TRIM(Papellido)) > 0) 
THEN
SELECT n.Calificacion, tn.Trimestre, m.Nombre
FROM notas n
INNER JOIN alumnxcurso axc ON n.id_alumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno 
INNER JOIN trimestresnota tn ON n.id_trimestrenota = tn.id_trimestrenota
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN materiasxcursos mxc ON c.idCurso = mxc.id_Curso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
WHERE c.idCurso = PidCurso AND tn.id_trimestrenota = PidTrimestre AND axc.ciclolectivo = PidCicloElectivo AND m.idMateria = PidMateria AND a.nombre LIKE Concat('%',Pnombre,'%') AND a.apellido LIKE Concat('%',Papellido,'%');
END IF;

IF(LENGTH(TRIM(Pnombre)) < 1 AND LENGTH(TRIM(Papellido)) > 0) 
THEN
SELECT n.Calificacion, tn.Trimestre, m.Nombre
FROM notas n
INNER JOIN alumnxcurso axc ON n.id_alumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno 
INNER JOIN trimestresnota tn ON n.id_trimestrenota = tn.id_trimestrenota
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN materiasxcursos mxc ON c.idCurso = mxc.id_Curso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
WHERE c.idCurso = PidCurso AND tn.id_trimestrenota = PidTrimestre AND axc.ciclolectivo = PidCicloElectivo AND m.idMateria = PidMateria AND a.apellido LIKE Concat('%',Papellido,'%');
END IF;

IF(LENGTH(TRIM(Pnombre)) > 0 AND LENGTH(TRIM(Papellido)) < 1) 
THEN
SELECT n.Calificacion, tn.Trimestre, m.Nombre
FROM notas n
INNER JOIN alumnxcurso axc ON n.id_alumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno 
INNER JOIN trimestresnota tn ON n.id_trimestrenota = tn.id_trimestrenota
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN materiasxcursos mxc ON c.idCurso = mxc.id_Curso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
WHERE c.idCurso = PidCurso AND tn.id_trimestrenota = PidTrimestre AND axc.ciclolectivo = PidCicloElectivo AND m.idMateria = PidMateria AND a.nombre LIKE Concat('%',Pnombre,'%');
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCARUSUARIO` (IN `pNom` VARCHAR(30), IN `pApe` VARCHAR(30))  NO SQL
BEGIN
IF( LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1)
THEN
SELECT u.idUsuario as 'Id',u.nombre as 'Nombre', u.apellido as 'Apellido', c.tipodecargo as 'Tipo De Cargo'
FROM usuarios u 
INNER JOIN cargos c on u.idCargo = c.idCargo
where u.estado=1
ORDER BY u.apellido, u.nombre
;
END IF;
IF( LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1)
THEN
SELECT u.idUsuario as 'Id',u.nombre as 'Nombre', u.apellido as 'Apellido', c.tipodecargo as 'Tipo De Cargo'
FROM usuarios u 
INNER JOIN cargos c on u.idCargo = c.idCargo
WHERE u.nombre LIKE CONCAT(TRIM(pNom), "%") and u.estado=1
ORDER BY u.apellido, u.nombre
;
END IF;

IF( LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0)
THEN
SELECT u.idUsuario as 'Id',u.nombre as 'Nombre', u.apellido as 'Apellido', c.tipodecargo as 'Tipo De Cargo'
FROM usuarios u 
INNER JOIN cargos c on u.idCargo = c.idCargo
WHERE u.apellido LIKE CONCAT(TRIM(pApe), "%") and u.estado=1
ORDER BY u.apellido, u.nombre
;
END IF;
IF( LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0)
THEN
SELECT u.idUsuario as 'Id',u.nombre as 'Nombre', u.apellido as 'Apellido', c.tipodecargo as 'Tipo De Cargo'
FROM usuarios u 
INNER JOIN cargos c on u.idCargo = c.idCargo
WHERE u.nombre LIKE CONCAT(TRIM(pNom), "%") AND u.apellido LIKE CONCAT(TRIM(pApe), "%")and u.estado=1
ORDER BY u.apellido, u.nombre;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarxcursomodificarAsistencia` (IN `pidCurso` VARCHAR(2), IN `pFecha` VARCHAR(10), IN `psubmotivo` INT(1))  NO SQL
BEGIN
select s.idSeguimiento,a.idAlumno,a.apellido,a.nombre,sm.tiposubmotivo as 'actividad',m.asistencia,s.hora,s.justificado,s.observaciones
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where (axc.idCurso =pidCurso) and (s.fecha = pFecha ) and (s.idSubmotivo = psubmotivo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_materia` (IN `Pmateria` VARCHAR(50), IN `Pespecialidad` VARCHAR(50), IN `Pcurso` VARCHAR(50))  NO SQL
BEGIN

IF(LENGTH(TRIM(Pmateria)) <1 AND LENGTH(TRIM(Pespecialidad)) <1 AND LENGTH(TRIM(Pcurso)) <1)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
ORDER BY concat(c.anio,c.division);

END IF;

IF(LENGTH(TRIM(Pmateria)) <1 AND LENGTH(TRIM(Pespecialidad)) <1 AND LENGTH(TRIM(Pcurso)) >0)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE c.anio = substring(Pcurso,1,1) AND c.division = substring(Pcurso,2,1);
END IF;

IF(LENGTH(TRIM(Pmateria)) <1 AND LENGTH(TRIM(Pespecialidad)) >0 AND LENGTH(TRIM(Pcurso)) <1)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE e.Especialidad like concat('%',Pespecialidad,'%')
ORDER BY concat(c.anio,c.division);
END IF;

IF(LENGTH(TRIM(Pmateria)) <1 AND LENGTH(TRIM(Pespecialidad)) >0 AND LENGTH(TRIM(Pcurso)) >0)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE e.Especialidad like concat('%',Pespecialidad,'%') AND c.anio = substring(Pcurso,1,1) AND c.division = substring(Pcurso,2,1)
ORDER BY concat(c.anio,c.division);
END IF;

IF(LENGTH(TRIM(Pmateria)) >0 AND LENGTH(TRIM(Pespecialidad)) <1 AND LENGTH(TRIM(Pcurso)) <1)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE m.Nombre like concat('%',Pmateria,'%');
END IF;

IF(LENGTH(TRIM(Pmateria)) >0 AND LENGTH(TRIM(Pespecialidad)) <1 AND LENGTH(TRIM(Pcurso)) >0)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE m.Nombre like concat('%',Pmateria,'%') AND c.anio = substring(Pcurso,1,1) AND c.division = substring(Pcurso,2,1)
ORDER BY concat(c.anio,c.division);
END IF;

IF(LENGTH(TRIM(Pmateria)) >0 AND LENGTH(TRIM(Pespecialidad)) >0 AND LENGTH(TRIM(Pcurso)) <1)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE e.especialidad like concat('%',Pespecialidad,'%') AND m.Nombre like concat('%',Pmateria,'%')
ORDER BY concat(c.anio,c.division);
END IF;

IF(LENGTH(TRIM(Pmateria)) >0 AND LENGTH(TRIM(Pespecialidad)) >0 AND LENGTH(TRIM(Pcurso)) >0)
THEN
SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE e.especialidad like concat('%',Pespecialidad,'%') AND m.Nombre like concat('%',Pmateria,'%') AND c.anio = substring(Pcurso,1,1) AND c.division = substring(Pcurso,2,1)
ORDER BY concat(c.anio,c.division);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Profesor` (IN `Pnombre` VARCHAR(40), IN `Pdocumento` VARCHAR(40), IN `Papellido` VARCHAR(40))  NO SQL
BEGIN
IF(LENGTH(TRIM(Pdocumento)) <1 AND LENGTH(TRIM(Pnombre)) <1 AND LENGTH(TRIM(Papellido)) <1)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores 
WHERE id_estado <> 9; 
END IF;
IF(LENGTH(TRIM(Pdocumento)) > 0 AND LENGTH(TRIM(Pnombre)) <1 AND LENGTH(TRIM(Papellido)) <1)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores  
WHERE id_estado <> 9 AND Documento like Concat('%',Pdocumento,'%');
END IF;

IF(LENGTH(TRIM(Pdocumento)) <1 AND LENGTH(TRIM(Pnombre)) > 0 AND LENGTH(TRIM(Papellido)) <1)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores 
WHERE id_estado <> 9 AND Nombre LIKE Concat('%',Pnombre,'%');
END IF;

IF(LENGTH(TRIM(Pdocumento)) > 0 AND LENGTH(TRIM(Pnombre)) > 0 AND LENGTH(TRIM(Papellido)) <1)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores 
WHERE id_estado <> 9 AND Nombre LIKE Concat('%',Pnombre,'%') AND Documento LIKE Concat('%',Pdocumento,'%');
END IF;

IF(LENGTH(TRIM(Pdocumento)) <1 AND LENGTH(TRIM(Pnombre)) <1 AND LENGTH(TRIM(Papellido)) > 0)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores 
WHERE id_estado <> 9 AND Apellido LIKE Concat('%',Papellido,'%');
END IF;

IF(LENGTH(TRIM(Pdocumento)) > 0 AND LENGTH(TRIM(Pnombre)) <1 AND LENGTH(TRIM(Papellido)) > 0)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores  
WHERE id_estado <> 9 AND Apellido LIKE Concat('%',Papellido,'%') AND Documento LIKE Concat('%',Pdocumento,'%');
END IF;

IF(LENGTH(TRIM(Pdocumento)) <1 AND LENGTH(TRIM(Pnombre)) > 0 AND LENGTH(TRIM(Papellido)) > 0)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores 
WHERE id_estado <> 9 AND Apellido LIKE Concat('%',Papellido,'%') AND Nombre LIKE Concat('%',Pnombre,'%');
END IF;

IF(LENGTH(TRIM(Pdocumento)) > 0 AND LENGTH(TRIM(Pnombre)) > 0 AND LENGTH(TRIM(Papellido)) > 0)
THEN
SELECT idProfesor as 'Numero de identidad del profesor', Nombre as 'Nombre del Profesor', Apellido as 'Apellido del profesor', FechaNac as 'Fecha de nacimiento', Telefono as 'Numero de Telefono', Mail as 'E-Mail', Documento as 'DNI', id_tipodocumento as 'tipo de documento',profesores.id_estado as 'Estado', id_usuario as 'Id del Usuario'
FROM profesores 
WHERE id_estado <> 9 AND Nombre LIKE Concat('%',Pnombre,'%') AND Apellido LIKE Concat('%',Papellido,'%') AND Documento LIKE Concat('%',Pdocumento,'%');
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `busqueda-motivo` (IN `pFechaMin` VARCHAR(10), IN `pFechaMax` VARCHAR(10), IN `pIdCur` VARCHAR(2), IN `pIdMot` VARCHAR(2))  NO SQL
BEGIN

IF(LENGTH(TRIM(pIdMot)) > 0 AND LENGTH(TRIM(pIdCur)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
IF ((pIdMot = 0) )
THEN
SELECT a.nombre AS Nombre, a.apellido AS Apellido, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', m.asistencia AS Asistencia, su.tiposubmotivo as donde, s.justificado AS Justificacion, DATE_FORMAT(s.fecha, "%d-%m-%Y") AS Fecha, s.hora AS Hora, axc.ciclolectivo AS 'Ciclo Lectivo', s.observaciones AS Observaciones, axc.idAlumnxcurso, axc.idAlumno, axc.idCurso, s.idSeguimiento
FROM seguimientos s
INNER JOIN alumnxcurso axc ON s.idAlumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos su ON s.idSubmotivo=su.idSubmotivo
WHERE (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (axc.idCurso = pIdCur) AND (s.estado = 1) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY axc.ciclolectivo, a.apellido, a.nombre, s.fecha, s.hora;
END IF;
IF ((pIdMot > 0) )
THEN
SELECT a.nombre AS Nombre, a.apellido AS Apellido, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', m.asistencia AS Asistencia, su.tiposubmotivo as donde, s.justificado AS Justificacion, DATE_FORMAT(s.fecha, "%d-%m-%Y") AS Fecha, s.hora AS Hora, axc.ciclolectivo AS 'Ciclo Lectivo', s.observaciones AS Observaciones, axc.idAlumnxcurso, axc.idAlumno, axc.idCurso, s.idSeguimiento
FROM seguimientos s
INNER JOIN alumnxcurso axc ON s.idAlumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos su ON s.idSubmotivo=su.idSubmotivo
WHERE (s.idMotivo = pIdMot) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (axc.idCurso = pIdCur) AND (s.estado = 1) AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY axc.ciclolectivo, a.apellido, a.nombre, s.fecha, s.hora
;
END IF;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `busqueda-retiroanticipado` (IN `pidcurso` INT(2), IN `pfechamin` VARCHAR(10), IN `pfechamax` INT(10))  NO SQL
SELECT a.idAlumno as 'Id',a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento', a.telefono AS'Telefono', c.turno AS 'Turno', e.tipodeestado AS 'Tipo de Estado' , COALESCE(a.observaciones,'Sin observaciones') AS 'Observaciones'
FROM retirosantisipados re 
INNER JOIN alumnos a on a.idAlumno = re.idAlumno
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
where ( (c.idCurso=pidcurso) AND (re.fecha BETWEEN pfechamin AND pfechamax)AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno))
ORDER BY  a.apellido, a.nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR ACTIVO` ()  NO SQL
SELECT * FROM estados WHERE idEstado != 0 and idEstado != 2 and idEstado != 3 and idEstado != 4 and idEstado != 5 and idEstado != 6 and idEstado != 7 and idEstado != 8 and idEstado != 9$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR ASIS, TARDE, RETIRO ANTICIPADO` ()  NO SQL
SELECT idEvento, tipoevento FROM eventos WHERE idEvento != 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR CICLO BASICO/ESPECIALIDADES` ()  NO SQL
SELECT * FROM especialidad WHERE idEspecialidad != 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR CICLOS LECTIVO` ()  NO SQL
Select Ciclolectivo From ciclos Order By Ciclolectivo ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR CURSO Y DIVISION` ()  NO SQL
select idCurso, concat_ws('',c.anio,'° ',c.division,'°')
as 'Cursos' from cursos as c where idCurso!= 0 and estado =0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR CURSOSXESPECIALIDAD` (IN `Pespecialidad` INT)  NO SQL
SELECT concat(c.anio,'º',c.division,'ª') as Curso
FROM cursos c
INNER JOIN especialidad e ON e.idEspecialidad=c.especialidad 
WHERE e.idEspecialidad=Pespecialidad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR ESPECIALIDAD` ()  NO SQL
SELECT * FROM especialidad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR ESTADOS` ()  NO SQL
SELECT * FROM estados WHERE idEstado!= 0 and idEstado <10$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR MOTIVOS` ()  NO SQL
SELECT idMotivo, asistencia FROM `motivos` WHERE idMotivo!= 0 and idMotivo != 13 and
idMotivo != 14 and estado=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR RETIROS` ()  NO SQL
SELECT idMotivo, asistencia FROM `motivos` WHERE idMotivo!= 0 and idEvento=3 and idSubmotivo=1 and estado=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR SUBMOTIVOS` ()  NO SQL
SELECT * FROM `submotivos` WHERE idSubmotivo!= 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR TIPO DE CARGO` ()  NO SQL
SELECT permiso, tipodecargo FROM cargos WHERE idCargo!= 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `C MOSTRAR TIPOS DE DOCUMENTOS` ()  NO SQL
SELECT * FROM `tiposdocumentos`WHERE idTipodocumento!= 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cursoxcuali1` (IN `pidCurso` VARCHAR(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
SET @count=1;
select s.idSubmotivo , s.fecha
from seguimientos s
where (s.idCurso=pidCurso and s.fecha BETWEEN pfecha1 and pfecha2 )
GROUP BY s.fecha,s.idSubmotivo
ORDER BY s.fecha asc ;
IF NOT EXISTS (SELECT * FROM temp WHERE idAlumnxcurso = idAlumnxcurso )
THEN
INSERT INTO `temp`( `idAlumnxcurso`) 
SELECT DISTINCT axc.idAlumnxcurso
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN seguimientos s ON axc.idAlumnxcurso = s.idAlumnxcurso

WHERE s.idCurso = pidCurso AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno) ;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cursoxcuali2` (IN `pidCurso` VARCHAR(2), IN `pFecha` VARCHAR(10), IN `pidSubmot` INT(1))  NO SQL
BEGIN
select t.fila,a.apellido,a.nombre, concat_ws('',day(s.fecha),'/',MONTH(s.fecha),'-',if (s.idSubmotivo=1, 'TE',(if (s.idSubmotivo=2, 'TA','ED')) ) ) AS "fecha",m.asistencia,s.justificado
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
INNER JOIN temp t ON t.idAlumnxcurso = axc.idAlumnxcurso
where (axc.idCurso =pidCurso and s.fecha = pFecha AND sm.idSubmotivo=pidSubmot AND a.idEstado < 8)
ORDER BY a.nombre,a.apellido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINARALUMNO` (IN `pidAlumno` INT, IN `pidUsuario` INT)  NO SQL
BEGIN
UPDATE alumnos AS a
INNER join alumnxcurso axc ON  a.idAlumno = axc.idAlumno
SET a.idEstado = 8
WHERE a.idAlumno = pidAlumno;
INSERT INTO modificaciones (modificaciones.idUsuario, modificaciones.fechaModificacion, modificaciones.horaModificacion,modificaciones.tipoModificacion,modificaciones.idSeguimiento,modificaciones.idMotivo,modificaciones.idSubmotivo)
VALUES (pidUsuario, CURRENT_DATE(), CURRENT_TIME(), "Eliminacion de alumno",0,0,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarusuario` (IN `pIdUsua` INT, IN `pidUsuario` INT)  NO SQL
BEGIN
UPDATE usuarios s
SET s.estado = 8
WHERE s.idUsuario = pIdUsua ;

INSERT INTO modificaciones (modificaciones.idUsuario, modificaciones.fechaModificacion, modificaciones.horaModificacion,modificaciones.tipoModificacion,modificaciones.idSeguimiento,modificaciones.idMotivo,modificaciones.idSubmotivo)
VALUES (pidUsuario, CURRENT_DATE(), CURRENT_TIME(),  "Eliminacion de Usuario",0,0,0);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_motivo` (IN `pIdMotivo` INT, IN `pidUsuario` INT)  NO SQL
BEGIN
UPDATE motivos m
SET m.estado = 0
WHERE m.idMotivo = pIdMotivo ;
INSERT INTO modificaciones (modificaciones.idUsuario, modificaciones.fechaModificacion, modificaciones.horaModificacion,modificaciones.tipoModificacion,modificaciones.idSeguimiento,modificaciones.idMotivo,modificaciones.idSubmotivo)
VALUES (pidUsuario, CURRENT_DATE(), CURRENT_TIME(), "Eliminacion de motivo",0,0,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `IMPRESION` (IN `pIdrein` INT, IN `pIdUsua` INT)  NO SQL
BEGIN
IF EXISTS (SELECT * FROM reincorporaciones WHERE idReincorporacion = pIdrein)
THEN
UPDATE reincorporaciones r
SET r.imprimir = 0
WHERE r.idReincorporacion =pIdrein;
INSERT INTO `modificaciones` (modificaciones.idUsuario, `tipomodificacion`, `fechaModificacion`, `horaModificacion`,modificaciones.idSeguimiento, modificaciones.idMotivo, modificaciones.idSubmotivo)
VALUES (pIdUsua, 'Impresion de Reincorporacion', CURRENT_DATE(), CURRENT_TIME(),0,0,0);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `imprimir reincorporacion` (IN `pIdAlum` INT, IN `pciclo` INT(4))  NO SQL
BEGIN
SET @fecha1 := (SELECT `inicio del 1º trimestre` FROM `trimestres` WHERE ciclo = pciclo AND idtrimestre = (SELECT MAX(idtrimestre) FROM trimestres WHERE ciclo = pciclo));
SET @fecha2 := (SELECT `final del 1º trimestre` FROM `trimestres` WHERE ciclo = pciclo AND idtrimestre = (SELECT MAX(idtrimestre) FROM trimestres WHERE ciclo = pciclo));
SET @fecha3 := (SELECT `inicio del 2º trimestre` FROM `trimestres` WHERE ciclo = pciclo AND idtrimestre = (SELECT MAX(idtrimestre) FROM trimestres WHERE ciclo = pciclo));
SET @fecha4 := (SELECT `final del 2º trimestre` FROM `trimestres` WHERE ciclo = pciclo AND idtrimestre = (SELECT MAX(idtrimestre) FROM trimestres WHERE ciclo = pciclo));
SET @fecha5 := (SELECT `inicio del 3º trimestre` FROM `trimestres` WHERE ciclo = pciclo AND idtrimestre = (SELECT MAX(idtrimestre) FROM trimestres WHERE ciclo = pciclo));
SET @fecha6 := (SELECT `final del 3º trimestre` FROM `trimestres` WHERE ciclo = pciclo AND idtrimestre = (SELECT MAX(idtrimestre) FROM trimestres WHERE ciclo = pciclo));
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos',c.turno, 
COUNT(IF(m.asistencia = 'tarde' and sm.tiposubmotivo = 'teorico',m.valorAsistencia,null)) as 'Tarde teorico',
COUNT(if(m.asistencia ='tarde' and sm.tiposubmotivo = 'Ed fisica',m.valorAsistencia,null))+
COUNT(if(m.asistencia='Tarde' AND sm.tiposubmotivo='Taller',m.valorAsistencia,null)) as 'CT Tarde',
COUNT(if(m.asistencia='Ausente con presencia' AND sm.tiposubmotivo='teorico',m.valorAsistencia,null)) as 'A/P teorico',
COUNT(if(m.asistencia='Ausente con presencia' and sm.tiposubmotivo='Taller',m.valorAsistencia,null))+
COUNT(if(m.asistencia='Ausente con presencia'AND sm.tiposubmotivo='Ed Fisica',m.valorAsistencia,null)) as 'CT A/P',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Taller',m.valorAsistencia,null)) as 'Ausente taller',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Ed fisica',m.valorAsistencia,null)) as 'Ausente Ed Fisica',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,null)) as 'Ausencia teorico'
FROM alumnos a 
inner JOIN alumnxcurso axc on a.idAlumno=axc.idAlumnxcurso
INNER JOIN cursos c on axc.idCurso=c.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso=s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo=s.idMotivo
inner JOIN submotivos sm on s.idSubmotivo=sm.idSubmotivo
where a.idAlumno=pIdAlum AND (s.fecha BETWEEN @fecha1 AND @fecha2)
GROUP BY a.nombre,a.apellido

UNION ALL
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos',c.turno, COUNT(IF(m.asistencia = 'tarde' and sm.tiposubmotivo = 'teorico',m.valorAsistencia,null)) as 'Tarde teorico',
COUNT(if(m.asistencia ='tarde' and sm.tiposubmotivo = 'Ed fisica',m.valorAsistencia,null))+
COUNT(if(m.asistencia='Tarde' AND sm.tiposubmotivo='Taller',m.valorAsistencia,null)) as 'CT Tarde',
COUNT(if(m.asistencia='Ausente con presencia' AND sm.tiposubmotivo='teorico',m.valorAsistencia,null)) as 'A/P teorico',
COUNT(if(m.asistencia='Ausente con presencia' and sm.tiposubmotivo='Taller',m.valorAsistencia,null))+
COUNT(if(m.asistencia='Ausente con presencia'AND sm.tiposubmotivo='Ed Fisica',m.valorAsistencia,null)) as 'CT A/P',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Taller',m.valorAsistencia,null)) as 'Ausente taller',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Ed fisica',m.valorAsistencia,null)) as 'Ausente Ed Fisica',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,null)) as 'Ausencia teorico'
FROM alumnos a 
inner JOIN alumnxcurso axc on a.idAlumno=axc.idAlumnxcurso
INNER JOIN cursos c on axc.idCurso=c.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso=s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo=s.idMotivo
inner JOIN submotivos sm on s.idSubmotivo=sm.idSubmotivo
where a.idAlumno=pIdAlum AND (s.fecha BETWEEN @fecha3 AND @fecha4)
GROUP BY a.nombre,a.apellido

UNION ALL
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos',c.turno, COUNT(IF(m.asistencia = 'tarde' and sm.tiposubmotivo = 'teorico',m.valorAsistencia,null)) as 'Tarde teorico',
COUNT(if(m.asistencia ='tarde' and sm.tiposubmotivo = 'Ed fisica',m.valorAsistencia,null))+
COUNT(if(m.asistencia='Tarde' AND sm.tiposubmotivo='Taller',m.valorAsistencia,null)) as 'CT Tarde',
COUNT(if(m.asistencia='Ausente con presencia' AND sm.tiposubmotivo='teorico',m.valorAsistencia,null)) as 'A/P teorico',
COUNT(if(m.asistencia='Ausente con presencia' and sm.tiposubmotivo='Taller',m.valorAsistencia,null))+
COUNT(if(m.asistencia='Ausente con presencia'AND sm.tiposubmotivo='Ed Fisica',m.valorAsistencia,null)) as 'CT A/P',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Taller',m.valorAsistencia,null)) as 'Ausente taller',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Ed fisica',m.valorAsistencia,null)) as 'Ausente Ed Fisica',
COUNT(if(m.asistencia='Ausente' and sm.tiposubmotivo = 'Teorico',m.valorAsistencia,null)) as 'Ausencia teorico'
FROM alumnos a 
inner JOIN alumnxcurso axc on a.idAlumno=axc.idAlumnxcurso
INNER JOIN cursos c on axc.idCurso=c.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso=s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo=s.idMotivo
inner JOIN submotivos sm on s.idSubmotivo=sm.idSubmotivo


where a.idAlumno=pIdAlum AND (s.fecha BETWEEN @fecha5 AND @fecha6)


GROUP BY a.nombre,a.apellido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InformeAlumnoCuantitavo` (IN `pNumDoc` VARCHAR(8), IN `pNom` VARCHAR(20), IN `pApe` VARCHAR(20), IN `pFechaMin` VARCHAR(10), IN `pFechaMax` VARCHAR(10))  NO SQL
BEGIN

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN

SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo

WHERE s.estado = 1
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 

INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE a.documento LIKE CONCAT(TRIM(pNumDoc), "%") AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE a.nombre LIKE CONCAT(TRIM(pNom), "%") AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE a.apellido LIKE CONCAT(TRIM(pApe), "%") AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%"))  AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%"))  AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso

inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.id_estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) < 1)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND NOW()) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) < 1 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) < 1 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) < 1 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) < 1 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;

IF(LENGTH(TRIM(pNumDoc)) > 0 AND LENGTH(TRIM(pNom)) > 0 AND LENGTH(TRIM(pApe)) > 0 AND LENGTH(TRIM(pFechaMin)) > 0 AND LENGTH(TRIM(pFechaMax)) > 0)
THEN
SELECT a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') AS 'Cursos' ,
SUM(IF (m.asistencia= 'Ausente',m.valorAsistencia,0))+
SUM(IF(m.asistencia = 'Ausente con presencia',m.valorAsistencia,0))+
SUM(IF(m.asistencia= 'Tarde',m.valorAsistencia,0)) AS 'Total faltas',

COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Presente Teorico', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Presente Taller',
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Presente Ed fisica', 
COUNT(IF(m.asistencia = 'Presente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Presente Contra-turno', 

COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Tarde Teorico', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'valor Tarde teorico', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Tarde Taller',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Tarde Taller',
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Tarde Ed fisica', 
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Tarde Ed fisica', 
COUNT(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Tarde Contra-turno',
SUM(IF(m.asistencia = 'Tarde'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Valor Tarde Contra-turno',

COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente Teorico', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico',m.valorAsistencia,0)) AS 'Valor Ausente Teorico', 
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',1,NULL)) AS 'Ausente Taller',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Valor Ausente Taller',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente Ed fisica', 
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Ed Fisica',m.valorAsistencia,0)) AS 'Valor Ausente Ed fisica',
COUNT(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Ausente  Contra-turno',
SUM(IF(m.asistencia = 'Ausente'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'Total Ausente  Contra-turno',

COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico',1,NULL)) AS 'Ausente con presencia Teorico', 
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Taller',m.valorAsistencia,0)) AS 'Ausente con presencia Taller', 
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Ed Fisica',1,NULL)) AS 'Ausente con presencia Taller',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno',
COUNT(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',1,NULL)) AS 'Teorico contra-turno ',
SUM(IF(m.asistencia = 'Ausente con presencia'AND sm.tiposubmotivo = 'Teorico contra-turno',m.valorAsistencia,0)) AS 'valor Teorico contra-turno'

FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno 
INNER JOIN cursos c ON axc.idCurso = c.idCurso
inner JOIN seguimientos s ON axc.idAlumnxcurso =s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON m.idSubmotivo = sm.idSubmotivo
WHERE (a.documento LIKE CONCAT(TRIM(pNumDoc), "%")) AND (a.nombre LIKE CONCAT(TRIM(pNom), "%")) AND (a.apellido LIKE CONCAT(TRIM(pApe), "%")) AND (s.fecha BETWEEN pFechaMin AND pFechaMax) AND (s.estado = 1)
GROUP BY axc.idAlumnxcurso, axc.idAlumno, axc.idCurso
;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INGRESAR_ALUMNO` (IN `pnom` VARCHAR(20), IN `pape` VARCHAR(20), IN `pfenac` VARCHAR(10), IN `ptel` INT(10), IN `ptdoc` INT(1), IN `pndoc` INT(8), IN `pobs` VARCHAR(255), IN `pIdUsuaModif` INT, IN `pIdCur` INT, IN `pCic` INT)  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM alumnos WHERE alumnos.idTipodocumento = ptdoc AND alumnos.documento = pndoc)
THEN
INSERT INTO `alumnos`(`nombre`, `apellido`, alumnos.fecha_Nacimiento,`telefono`, `idTipodocumento`, `documento`,`observaciones`, `idEstado`)
VALUES (pnom, pape,pfenac,ptel, ptdoc, pndoc,pobs,1);
INSERT INTO `alumnxcurso` (`idAlumno`, `idCurso`, `estado`, `ciclolectivo`)
VALUES ((SELECT MAX(idAlumno) FROM alumnos), pIdCur, 1, pCic);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INGRESAR_MOTIVO` (IN `pasist` VARCHAR(30), IN `pcompu` VARCHAR(11), IN `pvalorasist` FLOAT, IN `pidsubmotivo` INT(10), IN `pidevento` INT(1), IN `pObse` VARCHAR(255), IN `pDescri` TEXT)  NO SQL
BEGIN

INSERT INTO motivos(asistencia,Descripcion, computableNoComputable,valorAsistencia, idSubmotivo, idEvento,estado,Observacion)
VALUES (pasist,pDescri, pcompu,pvalorasist,pidsubmotivo, pidevento,1,pObse);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar trimestre` (IN `pfechea1` VARCHAR(10), IN `pfecha2` VARCHAR(10), IN `pfecha3` VARCHAR(10), IN `pfecha4` VARCHAR(10), IN `pfecha5` VARCHAR(10), IN `pfecha6` VARCHAR(10), IN `pciclo` INT(4))  NO SQL
INSERT INTO `trimestres`( `inicio del 1º trimestre`, `final del 1º trimestre`, `inicio del 2º trimestre`, `final del 2º trimestre`, `inicio del 3º trimestre`, `final del 3º trimestre`, `ciclo`) 
VALUES (pfechea1,pfecha2,pfecha3,pfecha4,pfecha5,pfecha6,pciclo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_materias` (IN `m_nombre` VARCHAR(100), IN `m_idespecialidad` INT(30), IN `m_idestado` INT(11), IN `m_idUsuario` INT(11))  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM materias WHERE Nombre = m_nombre AND id_especialidad = m_idespecialidad)
THEN
INSERT INTO `materias` (`Nombre`, `id_especialidad`, `id_estado`,`id_usuario`)
VALUES (m_nombre, m_idespecialidad, m_idestado, m_idUsuario);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_materiaxcurso` (IN `idMateria` INT(11), IN `idCurso` INT(11))  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM materiasxcursos WHERE id_Materia = idMateria AND id_Curso = idCurso)
THEN
INSERT INTO `materiasxcursos` (`id_Materia`, `id_Curso`)
VALUES (idMateria, idCurso);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_nota` (IN `n_ciclolectivo` INT, IN `n_idCurso` INT(11), IN `n_idAlumxCurso` INT(11), IN `n_idMateriaxCurso` INT(11), IN `n_idTrimestreNota` INT(11), IN `n_Calificacion` INT(10), IN `n_idProfxMatexCurso` INT(11), IN `n_idUsuario` INT(11), IN `n_idEstado` INT(40))  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM notas WHERE id_curso=n_idCurso AND id_alumnxcurso = n_idAlumxCurso AND id_materiaxcurso = n_idMateriaxCurso AND id_trimestrenota = n_idTrimestreNota)
THEN
INSERT INTO `notas` (`id_ciclolectivo`, `id_curso`,`id_alumnxcurso`,`id_materiaxcurso`,`id_trimestrenota`,`Calificacion`,`id_profxmatexcurso`,`id_usuario`,`id_estado`)
VALUES ( n_ciclolectivo,n_idCurso, n_idAlumxCurso,n_idMateriaxCurso, n_idTrimestreNota, n_Calificacion, n_idProfxMatexCurso, n_idUsuario, n_idEstado);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_PROFESOR` (IN `I_nombre` VARCHAR(30), IN `I_apellido` VARCHAR(30), IN `I_fechanac` VARCHAR(10), IN `I_telefono` INT(10), IN `I_mail` INT(30), IN `I_documento` INT(10), IN `I_idtipodoc` INT(45), IN `I_idestado` INT(30), IN `I_idUsuario` INT)  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM profesores WHERE profesores.id_tipodocumento = I_idtipodoc AND profesores.Documento = I_documento)
THEN
INSERT INTO profesores(Nombre,Apellido,Documento,FechaNac,Telefono,Mail,id_estado,id_tipodocumento,id_usuario)
VALUES(I_nombre,I_apellido,I_documento,I_fechanac,I_telefono,I_mail,I_idestado,I_idtipodoc,I_idUsuario);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_profesorxmateriaxcurso` (IN `pxmxc_idprofesor` INT(11), IN `pxmxc_idmateriaxcurso` INT(11), IN `pxmxc_idestado` INT(11), IN `pxmxc_idUsuario` INT(11))  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM profesoresxmateriasxcursos WHERE id_profesor = pxmxc_idprofesor AND id_MateriaxCurso = pxmxc_idmateriaxcurso)
THEN
INSERT INTO `profesoresxmateriasxcursos` (`id_profesor`, `id_MateriaxCurso`,`id_estado`,`id_usuario`)
VALUES (pxmxc_idprofesor,pxmxc_idmateriaxcurso,pxmxc_idestado,pxmxc_idUsuario);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_trimestrenota` (IN `t_Trimestre` VARCHAR(30), IN `t_idEstado` INT(40), IN `t_idUsuario` INT(11))  NO SQL
BEGIN
IF NOT EXISTS (SELECT * FROM trimestresnota WHERE Trimestre = t_Trimestre)
THEN
INSERT INTO `trimestresnota` (`trimestre`,`id_estado`,`id_usuario`)
VALUES (t_Trimestre, t_idEstado, t_idUsuario);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_USUARIO` (IN `pIdUsuaModif` INT, IN `Pnom` VARCHAR(30), IN `Pape` VARCHAR(30), IN `Pctra` VARCHAR(30), IN `Pidcar` INT(20))  BEGIN
IF NOT EXISTS (SELECT * FROM usuarios WHERE nombre = Pnom AND contrasenia = Pctra)
THEN
INSERT INTO `usuarios` (`nombre`, `apellido`, `contrasenia`, `idCargo`, `estado`)
VALUES (Pnom,Pape, Pctra, Pidcar, 1);
INSERT INTO `modificaciones` (`idUsuario`, `fechaModificacion`, `horaModificacion`, `tipomodificacion`)
VALUES (pIdUsuaModif, CURRENT_DATE(), CURRENT_TIME(),'Insercion de Usuario');
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOASISTENCIAALUMNOxCURSOxJUSTIFICACIONxFECHA` (IN `pidcurso` INT(10), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
SELECT a.idAlumno,a.nombre,a.apellido,c.idCurso,m.asistencia, s.justificado, s.fecha
FROM cursos c, seguimientos s, alumnxcurso axc, alumnos a, motivos m, submotivos sub 

WHERE (c.idCurso = pidcurso && a.idAlumno = axc.idAlumno && axc.idAlumno = s.idAlumnxcurso && sub.idSubmotivo = s.idSubmotivo && m.idMotivo = s.idMotivo && s.justificado <> '' and s.fecha  BETWEEN pfecha1 and pfecha2 );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOASISTENCIAxCURSOxFECHA` (IN `pidcurso` INT(10), IN `pfecha1` DATE, IN `pfecha2` DATE)  NO SQL
BEGIN
select a.idAlumno,a.nombre,a.apellido,m.asistencia, m.valorAsistencia, s.fecha, s.hora 
from cursos c,seguimientos s,alumnxcurso axc,alumnos a,motivos m, submotivos sub
where (c.idCurso = pidcurso && a.idAlumno = axc.idAlumno && axc.idAlumno = s.idAlumnxcurso && sub.idSubmotivo = s.idSubmotivo && m.idMotivo = s.idMotivo and s.fecha  BETWEEN pfecha1 and pfecha2 );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoscursoretant` (IN `pcurso` INT, IN `pfecha` VARCHAR(10))  NO SQL
select a.idAlumno, a.nombre,a.apellido, m.asistencia, s.hora,s.idSeguimiento
from alumnos a
INNER JOIN alumnxcurso axc on axc.idAlumno= a.idAlumno
INNER JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on s.idAlumnxcurso = axc.idAlumnxcurso
INNER JOIN motivos m on s.idMotivo = m.idMotivo
WHERE (s.idCurso= pcurso and  s.fecha = pfecha )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOUSUARIO` ()  NO SQL
SELECT u.nombre, u.apellido,c.tipodecargo , u.estado
FROM usuarios u
INNER JOIN cargos c on c.idCargo = u.idCargo
WHERE u.idUsuario != 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOxALUMNOCUANTIDOEm` (IN `pbuscarnombre` VARCHAR(30), IN `pbuscarapellido` VARCHAR(30), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
SELECT a.nombre, a.apellido, c.anio, c.division, 
sum(if (m.idMotivo in(2,3,4,6,7,8,10,11,12,13,14),m.valorAsistencia,0)) as 'Total faltas',

COUNT(if(m.idMotivo in(2),1,null)) as 'Tarde Teorico', 
SUM(if(m.idMotivo in(2),m.valorAsistencia,0)) as 'valor Tarde teorico', 

COUNT(if(m.idMotivo in (6),1,null)) as 'Tarde Taller',
SUM(if(m.idMotivo in (6), m.valorAsistencia,0)) as 'Valor Tarde Taller',

COUNT(if(m.idMotivo in (10),1,null)) as 'Tarde Ed fisica', 
SUM(if(m.idMotivo in (10),m.valorAsistencia,0)) as 'Valor Tarde Ed fisica', 

COUNT(if(m.idMotivo in (3,15),1,null)) as 'Ausente Teorico', 
SUM(if(m.idMotivo in (3,15),m.valorAsistencia,0)) as 'Valor Ausente Teorico',

COUNT(if(m.idMotivo in (7),1,null)) as 'Ausente Taller',
SUM(if(m.idMotivo in (7),m.valorAsistencia,0)) as 'Valor Ausente Taller',

COUNT(if(m.idMotivo in (11),1,null)) as 'Ausente Ed fisica', 
SUM(if(m.idMotivo in (11),m.valorAsistencia,0)) as 'Valor Ausente Ed fisica',

COUNT(if(m.idMotivo in (4),1,null)) as 'Ausente con presencia Teorico', 
SUM(if(m.idMotivo in (4),m.valorAsistencia,0)) as 'Ausente con presencia Taller', 
COUNT(if(m.idMotivo in (8),1,null)) as 'Ausente con presencia Taller',
SUM(if(m.idMotivo in (8),m.valorAsistencia,0)) as 'valor Teorico contra-turno'
FROM alumnos a 
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN seguimientos s ON axc.idAlumnxcurso = s.idAlumnxcurso 
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
INNER JOIN submotivos sm ON sm.idSubmotivo = m.idSubmotivo
WHERE a.nombre = pbuscarnombre AND a.apellido = pbuscarapellido  AND s.fecha BETWEEN pfecha1 AND pfecha2
GROUP BY  a.nombre, a.apellido, c.anio, c.division$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOxCURSO` (IN `pciclo` INT(4), IN `paxc` INT(11), IN `psubmotivo` INT(11), IN `pbuscarfache` VARCHAR(10))  NO SQL
select a.idAlumno as 'Id', a.nombre as 'Nombre', a.apellido as 'Apellido',a.documento as 'Documento'
from alumnxcurso axc 
inner join alumnos a on axc.idAlumno = a.idAlumno
inner join cursos c on axc.idCurso = c.idCurso
where axc.ciclolectivo = pciclo and axc.idCurso = paxc AND axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso) FROM alumnxcurso WHERE idAlumno = a.idAlumno)
and  axc.idAlumnxcurso 
in (select max(idAlumnxcurso) 
from alumnxcurso 
    group by idAlumno)
and axc.idAlumnxcurso 
 not in ( select s.idAlumnxcurso 
         from seguimientos s
where fecha = pbuscarfache
         and s.idSubmotivo = psubmotivo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOXCURSOCUANTIDOEm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
select a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', 
sum(if (m.idMotivo in(2,3,4,6,7,8,10,11,12,13,14),m.valorAsistencia,0)) as 'Total faltas',
COUNT(if(m.idMotivo in(2),1,null)) as 'Tarde Teorico', 
SUM(if(m.idMotivo in(2),m.valorAsistencia,0)) as 'valor Tarde teorico', 

COUNT(if(m.idMotivo in (6),1,null)) as 'Tarde Taller',
SUM(if(m.idMotivo in (6), m.valorAsistencia,0)) as 'Valor Tarde Taller',

COUNT(if(m.idMotivo in (10),1,null)) as 'Tarde Ed fisica', 
SUM(if(m.idMotivo in (10),m.valorAsistencia,0)) as 'Valor Tarde Ed fisica', 

COUNT(if(m.idMotivo in (3,15),1,null)) as 'Ausente Teorico', 
SUM(if(m.idMotivo in (3,15),m.valorAsistencia,0)) as 'Valor Ausente Teorico',

COUNT(if(m.idMotivo in (7),1,null)) as 'Ausente Taller',
SUM(if(m.idMotivo in (7),m.valorAsistencia,0)) as 'Valor Ausente Taller',

COUNT(if(m.idMotivo in (11),1,null)) as 'Ausente Ed fisica', 
SUM(if(m.idMotivo in (11),m.valorAsistencia,0)) as 'Valor Ausente Ed fisica',

COUNT(if(m.idMotivo in (4),1,null)) as 'Ausente con presencia Teorico', 
SUM(if(m.idMotivo in (4),m.valorAsistencia,0)) as 'Ausente con presencia Taller', 
COUNT(if(m.idMotivo in (8),1,null)) as 'Ausente con presencia Taller',
SUM(if(m.idMotivo in (8),m.valorAsistencia,0)) as 'valor Teorico contra-turno'
FROM alumnos a 
INNER JOIN alumnxcurso axc on a.idAlumno = axc.idAlumno
INNER JOIN cursos c on axc.idCurso = c.idCurso
inner JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso 
INNER JOIN motivos m on s.idMotivo = m.idMotivo
INNER JOIN submotivos sm on m.idSubmotivo = sm.idSubmotivo 
 WHERE c.idCurso = pidcurso and s.fecha BETWEEN pfecha1 and pfecha2
group by a.nombre, a.apellido, c.anio, c.division$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADOXCURSOCUANTIm` (IN `pidcurso` INT(2), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
select a.nombre, a.apellido, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', 
sum(if (m.idMotivo in(2,3,4,6,7,8,10,11,12,13,14),m.valorAsistencia,0)) as 'Total faltas',

COUNT(if(m.idMotivo in(1), 1,null)) as 'Presente Teorico', 
COUNT(if(m.idMotivo in(5),1,null)) as 'Presente Taller',
COUNT(if(m.idMotivo in(9),1,null))as 'Presente Ed fisica', 

COUNT(if(m.idMotivo in(2),1,null)) as 'Tarde Teorico', 
SUM(if(m.idMotivo in(2),m.valorAsistencia,0)) as 'valor Tarde teorico', 

COUNT(if(m.idMotivo in (6),1,null)) as 'Tarde Taller',
SUM(if(m.idMotivo in (6), m.valorAsistencia,0)) as 'Valor Tarde Taller',

COUNT(if(m.idMotivo in (10),1,null)) as 'Tarde Ed fisica', 
SUM(if(m.idMotivo in (10),m.valorAsistencia,0)) as 'Valor Tarde Ed fisica', 

COUNT(if(m.idMotivo in (3,15),1,null)) as 'Ausente Teorico', 
SUM(if(m.idMotivo in (3,15),m.valorAsistencia,0)) as 'Valor Ausente Teorico',

COUNT(if(m.idMotivo in (7),1,null)) as 'Ausente Taller',
SUM(if(m.idMotivo in (7),m.valorAsistencia,0)) as 'Valor Ausente Taller',

COUNT(if(m.idMotivo in (11),1,null)) as 'Ausente Ed fisica', 
SUM(if(m.idMotivo in (11),m.valorAsistencia,0)) as 'Valor Ausente Ed fisica',

COUNT(if(m.idMotivo in (4),1,null)) as 'Ausente con presencia Teorico', 
SUM(if(m.idMotivo in (4),m.valorAsistencia,0)) as 'Ausente con presencia Taller', 
COUNT(if(m.idMotivo in (8),1,null)) as 'Ausente con presencia Taller',
SUM(if(m.idMotivo in (8),m.valorAsistencia,0)) as 'valor Teorico contra-turno'
FROM alumnos a 
INNER JOIN alumnxcurso axc on a.idAlumno = axc.idAlumno
INNER JOIN cursos c on axc.idCurso = c.idCurso
inner JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso 
INNER JOIN motivos m on s.idMotivo = m.idMotivo
INNER JOIN submotivos sm on m.idSubmotivo = sm.idSubmotivo 
 WHERE c.idCurso = pidcurso and s.fecha BETWEEN pfecha1 and pfecha2
group by a.nombre, a.apellido, c.anio, c.division$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTATOALUMNOCUALITATIVODOEm` (IN `pbuscarnombre` VARCHAR(30), IN `pbuscarapellido` VARCHAR(30), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo ,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where (m.idMotivo!=1 and  m.idMotivo !=5 AND m.idMotivo !=9 and  a.nombre like pbuscarnombre and a.apellido like pbuscarapellido AND s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTATOALUMNOCUALITATIVOm` (IN `pbuscarnombre` VARCHAR(30), IN `pbuscarapellido` VARCHAR(30), IN `pfecha1` VARCHAR(10), IN `pfecha2` VARCHAR(10))  NO SQL
BEGIN
select a.nombre,a.apellido,m.asistencia,sm.tiposubmotivo ,m.valorAsistencia, s.justificado,s.fecha, s.hora 
from alumnos a
inner join alumnxcurso axc on a.idAlumno = axc.idAlumno
inner JOIN cursos c on c.idCurso = axc.idCurso
INNER JOIN seguimientos s on axc.idAlumnxcurso = s.idAlumnxcurso
INNER JOIN motivos m on m.idMotivo = s.idMotivo
INNER JOIN submotivos sm on sm.idSubmotivo = m.idSubmotivo
where (a.nombre=pbuscarnombre and a.apellido=pbuscarapellido and s.fecha  BETWEEN pfecha1 and pfecha2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGIN_USUARIO` (IN `pUsuar` VARCHAR(100), IN `pContr` VARCHAR(100))  BEGIN
IF EXISTS (SELECT * FROM usuarios WHERE nombre = pUsuar AND contrasenia = pContr )
THEN
SELECT u.idUsuario AS 'Id',u.nombre AS 'Usuario', c.idCargo AS 'Cargo', u.estado AS 'Estado' 
FROM usuarios u
INNER JOIN cargos c ON u.idCargo = c.idCargo
WHERE u.nombre = pUsuar AND u.contrasenia = pContr AND u.estado=1;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MayorPromedioxCurso` (IN `p_idcurso` INT, IN `Pciclolectivo` INT)  NO SQL
select a.nombre AS 'Nombre Alumno',
a.apellido AS 'Apellido Alumno',

(
    	sum(Calificacion)/ 
            (
                ( 
                    select COUNT(id_Curso) 
                    from materiasxcursos 
                    where id_curso = p_idcurso 
                )*3 
            ) 
		) as promedio,
concat(c.anio,'º',c.division,'ª') as Curso,
c.turno ,
c.especialidad 
from notas n 
INNER join alumnxcurso ac on n.id_alumnxcurso = ac.idAlumnxcurso 
INNER JOIN cursos c on ac.idCurso = c.idCurso 
INNER JOIN alumnos a ON ac.idAlumno = a.idAlumno
where id_trimestrenota in(1,2,3) 
and c.idcurso = p_idcurso and n.id_ciclolectivo = Pciclolectivo
GROUP by id_alumnxcurso ORDER by promedio DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MayorPromedioXTrimestreXturno-cuarto` (IN `turno` VARCHAR(20), IN `trimestre` INT(11))  NO SQL
BEGIN
IF (turno="tarde")
THEN
/*CUARTO AÑO*/
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido, concat(C.anio,'º', C.division,'ª') as Curso
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(16,18) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
/*QUINTO AÑO*/
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido, concat(C.anio,'º', C.division,'ª')  as Curso
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(20,22) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
/*SEXTO AÑO*/
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido, concat(C.anio,'º', C.division,'ª')  as Curso
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(24,26) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
END IF;

IF (turno="mañana")
THEN
/*CUARTO AÑO*/
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido, concat(C.anio,'º', C.division,'ª')  as Curso
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(15,17) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
/*QUINTO AÑO*/
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido, concat(C.anio,'º', C.division,'ª')  as Curso
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(19,21) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
/*SEXTO AÑO*/
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido, concat(C.anio,'º', C.division,'ª')  as Curso
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(23,25) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
   END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICARASISTENCIA2` (IN `pIdseg` INT, IN `pidUsuarios` INT, IN `pidMotivos` INT, IN `pidSubmotivo` INT, IN `pjustificados` VARCHAR(80), IN `pobservaciones` VARCHAR(255), IN `pidAlumnxcurso` INT, IN `pcursos` INT, IN `pfecha` VARCHAR(10), IN `phora` TIME)  NO SQL
BEGIN
IF EXISTS (SELECT * FROM seguimientos WHERE idSeguimiento = pIdseg)
THEN
UPDATE seguimientos s
LEFT OUTER JOIN usuarios u ON s.idUsuario = u.idUsuario
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
SET s.idAlumnxcurso = pidAlumnxcurso,
    s.idSubmotivo=pidSubmotivo,
	s.idMotivo=pidMotivos,
	s.idCurso=pcursos,
	s.fecha=pfecha,
	s.hora=phora,
	s.justificado=pjustificados,
	s.observaciones=pobservaciones,
	s.estado= 1
WHERE s.idSeguimiento = pIdseg
;




INSERT INTO `modificaciones` (`idUsuario`,`fechaModificacion`,`horaModificacion`,`estado`,`tipomodificacion`,`idSeguimiento`,`idMotivo`,`idSubmotivo`)
VALUES (pidUsuarios,CURRENT_DATE(), CURRENT_TIME(),1 ,'Modificacion de asistencia', pIdseg, pidMotivos, pidSubmotivo);

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarJustificacion` (IN `pIdseg` INT, IN `pJust` VARCHAR(40), IN `pObs` VARCHAR(255), IN `pidUsuarios` INT)  NO SQL
BEGIN
IF EXISTS (SELECT * FROM seguimientos WHERE idSeguimiento = pIdseg)
THEN
UPDATE seguimientos s
LEFT OUTER JOIN usuarios u ON s.idUsuario = u.idUsuario
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
SET s.justificado = pJust, s.observaciones=pObs
WHERE s.idSeguimiento = pIdSeg
;
INSERT INTO `modificaciones` (`idUsuario`, `tipomodificacion`, `fechaModificacion`, `horaModificacion`)
VALUES (pidUsuarios, 'Modificacion de Justificacion', CURRENT_DATE(), CURRENT_TIME());
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarUsuario` (IN `pidUsu` INT, IN `pnom` VARCHAR(30), IN `pape` VARCHAR(20), IN `pcontra` VARCHAR(20), IN `pest` INT, IN `pcar` INT, IN `pIdUsuaModif` INT)  NO SQL
BEGIN
IF EXISTS( SELECT * FROM usuarios WHERE idUsuario = pidUsu)
THEN
UPDATE usuarios u
SET  u.nombre = CASE WHEN pnom = "" THEN u.nombre ELSE pnom END, u.apellido = CASE WHEN pape = "" THEN u.apellido ELSE pape END, u.contrasenia = CASE WHEN pcontra = "" THEN u.contrasenia ELSE pcontra END , u.estado = CASE WHEN pest = "" THEN u.estado ELSE pest END, u.idCargo = CASE WHEN pcar = "" THEN u.idCargo ELSE pcar END
WHERE idUsuario = pidUsu;
INSERT INTO `modificaciones` (`idUsuario`, `fechaModificacion`, `horaModificacion`, `tipomodificacion`,modificaciones.idSeguimiento,modificaciones.idMotivo,modificaciones.idSubmotivo)
VALUES (pIdUsuaModif, CURRENT_DATE(), CURRENT_TIME(),'Modificacion de Usuario',0,0,0);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_ALUMNO` (IN `pnom` VARCHAR(10), IN `pIdAlum` INT, IN `Pape` VARCHAR(10), IN `pFech` VARCHAR(10), IN `pTipodoc` VARCHAR(1), IN `pNumDoc` VARCHAR(8), IN `pTel` VARCHAR(10), IN `pIdEsta` VARCHAR(1), IN `pObse` VARCHAR(255), IN `pidUsua` INT)  NO SQL
BEGIN
IF EXISTS (SELECT * FROM alumnos WHERE idAlumno = pIdAlum)
THEN
UPDATE alumnos a
SET a.nombre = CASE WHEN pnom = "" THEN a.nombre ELSE pnom END,
a.apellido = CASE WHEN Pape = "" THEN a.apellido ELSE Pape END,
a.fecha_Nacimiento = CASE WHEN pFech = "" THEN a.fecha_Nacimiento ELSE pFech END,
a.idTipodocumento = CASE WHEN pTipodoc = "" THEN a.idTipodocumento ELSE pTipodoc END,
a.documento = CASE WHEN pNumDoc = "" THEN a.documento ELSE pNumDoc END,
a.telefono = CASE WHEN pTel = "" THEN a.telefono ELSE pTel END,
a.idEstado = CASE WHEN pIdEsta = "" THEN a.idEstado ELSE pIdEsta END, a.observaciones = pObse
WHERE a.idAlumno = pIdAlum;
INSERT INTO `modificaciones` (`idUsuario`, `tipomodificacion`, `fechaModificacion`, `horaModificacion`,modificaciones.idSeguimiento,modificaciones.idMotivo, modificaciones.idSubmotivo)
VALUES (pidUsua, 'Modificacion de alumno', CURRENT_DATE(), CURRENT_TIME(),0,0,0);
end IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_AlumnoXCurso` (IN `pIdAlum` INT, IN `pIdCur` INT, IN `pIdUsua` INT, IN `pAnio` INT)  BEGIN
IF EXISTS (SELECT * FROM alumnos WHERE idAlumno = pIdAlum)
THEN 
INSERT INTO alumnxcurso (`idAlumno`,`idCurso`,`ciclolectivo`,`estado`)
VALUES (pIdAlum, pIdCur, pAnio, 1);
INSERT INTO modificaciones (`idUsuario`, `tipomodificacion`, `fechaModificacion`, `horaModificacion`,modificaciones.idSeguimiento,modificaciones.idMotivo, modificaciones.idSubmotivo)
VALUES (pIdUsua, 'Modificacion de alumno por curso', CURRENT_DATE(), CURRENT_TIME(),0,0,0);
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_materia` (IN `m_idmateria` INT, IN `m_nombre` VARCHAR(100), IN `m_idespecialidad` INT(30), IN `m_idestado` INT(11), IN `m_idUsuario` INT(11))  NO SQL
BEGIN
UPDATE materias m
SET m.Nombre = m_nombre, m.id_especialidad = m_idespecialidad, m.id_estado = m_idestado, m.id_usuario = m_idUsuario
WHERE m.idMateria = m_idmateria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_materiaxcurso` (IN `mxc_idmateriaxcurso` INT, IN `mxc_idmateria` INT, IN `mxc_idcurso` INT, IN `mxc_idestado` INT, IN `mxc_idUsuario` INT)  NO SQL
BEGIN
UPDATE materiasxcursos mxc
SET mxc.id_Materia = mxc_idmateria, mxc.id_Curso = mxc_idcurso, mxc.id_estado = mxc_idestado, mxc.id_usuario = mxc_idUsuario
WHERE mxc.idMateriaxCurso = mxc_idmateriaxcurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_motivo` (IN `pidmotivo` INT(3), IN `pasist` VARCHAR(30), IN `pcompu` VARCHAR(11), IN `pvalorasist` FLOAT, IN `pidsubmotivo` INT(10), IN `pidevento` INT(1), IN `pIdUsuaModif` INT, IN `PObse` VARCHAR(255), IN `pdescrip` TEXT)  NO SQL
BEGIN
IF EXISTS( SELECT * FROM motivos m WHERE idMotivo = pidmotivo)
THEN
UPDATE motivos m
SET
 
 m.asistencia = CASE WHEN pasist = "" THEN m.asistencia ELSE pasist END,
 m.Descripcion = CASE WHEN pdescrip = "" THEN m.Descripcion ELSE pdescrip END,
 m.computableNoComputable = CASE WHEN pcompu = "" THEN m.computableNoComputable ELSE pcompu END ,
 
 
 /*m.valorAsistencia = CASE WHEN pvalorasist = "" THEN m.valorAsistencia ELSE pvalorasist END,*/
 
  
 m.valorAsistencia =  pvalorasist ,
 
 
 m.idSubmotivo = CASE WHEN pidsubmotivo = "" THEN m.idSubmotivo ELSE pidsubmotivo END,
 m.idEvento = CASE WHEN pidevento = "" THEN m.idEvento ELSE pidevento END,
 m.Observacion= CASE WHEN PObse = "" THEN m.Observacion ELSE PObse END
WHERE idMotivo = pidmotivo;
INSERT INTO modificaciones (idUsuario, fechaModificacion, horaModificacion, tipomodificacion,modificaciones.idSeguimiento,modificaciones.idMotivo,modificaciones.idSubmotivo)
VALUES (pIdUsuaModif, CURRENT_DATE(), CURRENT_TIME(),'Modificacion de Motivo',0,0,0);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_notas` (IN `n_idNotas` INT(11), IN `n_idCurso` INT(11), IN `n_idAlumxCurso` INT(11), IN `n_idMateriaxCurso` INT(11), IN `n_idTrimestreNota` INT(11), IN `n_Calificacion` INT(10), IN `n_idProfxMatexCurso` INT(11), IN `n_idUsuario` INT(11), IN `n_idEstado` INT(11), IN `n_ciclolectivo` INT(11))  NO SQL
BEGIN
UPDATE notas n
SET n.id_ciclolectivo = n_ciclolectivo, n.id_curso = n_idCurso, n.id_alumnxcurso = n_idAlumxCurso, n.id_materiaxcurso = n_idMateriaxCurso, n.id_trimestrenota = n_idTrimestreNota, n.Calificacion = n_Calificacion, n.id_profxmatexcurso = n_idProfxMatexCurso, n.id_usuario = n_idUsuario, n.id_estado = n_idEstado
WHERE n.id_notas = n_idNotas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_profesores` (IN `p_idprofesor` INT, IN `p_nombre` VARCHAR(30), IN `p_apellido` VARCHAR(30), IN `p_FecNac` VARCHAR(10), IN `p_telefono` INT(10), IN `p_mail` VARCHAR(30), IN `p_documento` INT(10), IN `p_idtipodocumento` INT(45), IN `p_idestado` INT(30), IN `p_idUsuario` INT(11))  NO SQL
BEGIN
UPDATE profesores p
SET p.Nombre = p_nombre, p.Apellido = p_apellido, p.FechaNac = p_FecNac, p.Telefono = p_telefono, p.Mail = p_mail, p.Documento = p_documento, p.id_tipodocumento = p_idtipodocumento, p.id_estado = p_idestado, p.id_usuario = p_idUsuario
WHERE p.idProfesor = p_idprofesor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_profesorxmateriaxcurso` (IN `pxmxc_idProfxMatexCurso` INT, IN `pxmxc_idprofesor` INT, IN `pxmxc_idMateriaxCurso` INT, IN `pxmxc_idestado` INT, IN `pxmxc_idUsuario` INT)  NO SQL
BEGIN
UPDATE profesoresxmateriasxcursos pxmxc
SET pxmxc.id_profesor = pxmxc_idprofesor, pxmxc.id_MateriaxCurso = pxmxc_idMateriaxCurso, pxmxc.id_estado = pxmxc_idestado, pxmxc.id_usuario = pxmxc_idUsuario
WHERE pxmxc.idProfxMateriaxCurso = pxmxc_idProfxMatexCurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_trimestresnota` (IN `tn_idTrimestreNota` INT(11), IN `tn_Trimestre` VARCHAR(30), IN `tn_idEstado` INT(40), IN `tn_idUsuario` INT(11))  NO SQL
BEGIN
UPDATE trimestresnota tn
SET tn.Trimestre = tn_Trimestre, tn.id_estado = tn_idEstado, tn.id_usuario = tn_idUsuario
WHERE tn.id_trimestrenota = tn_idTrimestreNota;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarMotivos` ()  NO SQL
BEGIN
SELECT m.idMotivo as 'Id',m.asistencia as 'Asistencia', m.Descripcion as 'Descripcion', s.tiposubmotivo as 'Actividad', e.tipoevento as 'Evento',

/*m.computableNoComputable as 'Computable'*/
(if (m.computableNoComputable=1 ,'Si','No')) AS "Computable"

, m.valorAsistencia as 'Valor', m.Observacion as 'Observacion'
FROM motivos m 
INNER JOIN submotivos s ON m.idSubmotivo = s.idSubmotivo
INNER JOIN eventos e ON m.idEvento = e.idEvento
WHERE m.estado = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `promedioxalumno` (IN `id_promalumn` INT(20))  NO SQL
SELECT AVG(calificacion) as promedio, id_alumnxcurso,A.nombre, A.apellido 
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso 
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno 
WHERE id_alumnxcurso=id_promalumn$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Prom_bandera-4to` (IN `turno` VARCHAR(20), IN `trimestre` INT(20))  NO SQL
BEGIN
IF (turno="tarde")
THEN
/*CUARTO AÑO TARDE*/
SELECT AVG(calificacion) as Promedio, concat_ws('',A.nombre,' ',a.apellido) as "Alumno", concat_ws('',c.anio,'º ',c.division,'º') as "Curso"
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(16,18) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
END IF;

IF (turno="mañana")
THEN
/*CUARTO AÑO MAÑANA*/
SELECT AVG(calificacion) as Promedio, concat_ws('',A.nombre,' ',a.apellido) as "Alumno", concat_ws('',c.anio,'º ',c.division,'º') as "Curso"
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(15,17) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Prom_bandera-5to` (IN `turno` VARCHAR(20), IN `trimestre` INT(20))  NO SQL
BEGIN
IF (turno="tarde")
THEN
/*QUINTO AÑO TARDE*/
SELECT AVG(calificacion) as Promedio, concat_ws('',A.nombre,' ',a.apellido) as "Alumno", concat_ws('',c.anio,'º ',c.division,'º') as "Curso"
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(20,22) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
END IF;
IF (turno="mañana")
THEN
/*QUINTO AÑO MAÑANA*/
SELECT AVG(calificacion) as Promedio, concat_ws('',A.nombre,' ',a.apellido) as "Alumno", concat_ws('',c.anio,'º ',c.division,'º') as "Curso"
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(19,21) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Prom_bandera-6to` (IN `turno` VARCHAR(20), IN `trimestre` INT(20))  NO SQL
BEGIN
IF (turno="tarde")
THEN
/*SEXTO AÑO TARDE*/
SELECT AVG(calificacion) as Promedio, concat_ws('',A.nombre,' ',a.apellido) as "Alumno", concat_ws('',c.anio,'º ',c.division,'º') as "Curso"
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(24,26) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
END IF;

IF (turno="mañana")
THEN
/*SEXTO AÑO MAÑANA*/
SELECT AVG(calificacion) as Promedio, concat_ws('',A.nombre,' ',a.apellido) as "Alumno", concat_ws('',c.anio,'º ',c.division,'º') as "Curso"
FROM notas N 
INNER JOIN alumnxcurso AC ON N.id_alumnxcurso=AC.idAlumnxcurso
INNER JOIN alumnos A ON A.idAlumno=AC.idAlumno
INNER JOIN cursos C ON C.idCurso=AC.idCurso
WHERE C.idCurso IN(23,25) AND N.id_trimestrenota=trimestre GROUP BY id_alumnxcurso ORDER by promedio DESC LIMIT 3;
   END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTROASISTENCIA` (IN `pidAlumnxcurso` INT, IN `pidUsuarios` INT, IN `pidMotivos` INT(3), IN `pfecha` VARCHAR(10), IN `phora` VARCHAR(5), IN `pjustificados` VARCHAR(45), IN `pobservaciones` VARCHAR(45), IN `psubmotivos` INT(2), IN `pcursos` INT(2), IN `pEvento` INT(1))  NO SQL
BEGIN
IF EXISTS (SELECT * FROM motivos WHERE idEvento = pEvento )
THEN
INSERT INTO
`seguimientos`(`idAlumnxcurso`,`idUsuario`,`idSubmotivo`,`idMotivo`, `idCurso`, `fecha`, `hora`, `justificado`,`estado`, `observaciones`)
VALUES (pidAlumnxcurso,pidUsuarios,psubmotivos,pidMotivos, pcursos, pfecha, phora,pjustificados,1,pobservaciones);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Reincorporacion echa` (IN `pidcurso` VARCHAR(2), IN `pciclo` VARCHAR(4))  NO SQL
BEGIN
IF (LENGTH(TRIM(pidcurso)) < 1 AND LENGTH(TRIM(pciclo)) < 1 )
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE re.estado=0
ORDER BY re.idReincorporacion ASC;
END IF;

IF (LENGTH(TRIM(pidcurso)) > 0 AND LENGTH(TRIM(pciclo)) < 1 )
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (axc.idCurso LIKE CONCAT(TRIM(pidcurso), "%")) AND  (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF (LENGTH(TRIM(pidcurso)) < 1 AND LENGTH(TRIM(pciclo)) > 0 )
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (axc.ciclolectivo LIKE CONCAT(TRIM(pciclo), "%")) AND  (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF (LENGTH(TRIM(pidcurso)) > 0 AND LENGTH(TRIM(pciclo)) > 0 )
THEN
SELECT re.idReincorporacion,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (axc.idCurso LIKE CONCAT(TRIM(pidcurso), "%")) AND (axc.ciclolectivo LIKE CONCAT(TRIM(pciclo), "%")) AND  (re.estado=0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reincorporacion echa por idalumno` (IN `pIdalum` INT(11))  NO SQL
BEGIN
SELECT re.idReincorporacion,a.idAlumno, a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono', concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha,if (re.imprimir=1, 'Pendiente','Echa') AS "Impresion" 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE re.estado=0 AND a.idAlumno = pIdalum
ORDER BY re.idReincorporacion ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Reincorporacion pendiente` (IN `pidcurso` VARCHAR(2), IN `pciclo` VARCHAR(4))  NO SQL
BEGIN
IF (LENGTH(TRIM(pidcurso)) < 1 AND LENGTH(TRIM(pciclo)) < 1 )
THEN
SELECT re.idReincorporacion,a.idAlumno, a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono', concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha,if (re.imprimir=1, 'Pendiente','Hecha') AS "Impresion" 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE re.estado>0
ORDER BY re.idReincorporacion ASC;
END IF;

IF (LENGTH(TRIM(pidcurso)) > 0 AND LENGTH(TRIM(pciclo)) < 1 )
THEN
SELECT re.idReincorporacion,a.idAlumno,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha,if (re.imprimir=1, 'Pendiente','Hecha') AS "Impresion" 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (axc.idCurso LIKE CONCAT(TRIM(pidcurso), "%")) AND  (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF (LENGTH(TRIM(pidcurso)) < 1 AND LENGTH(TRIM(pciclo)) > 0 )
THEN
SELECT re.idReincorporacion,a.idAlumno,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha,if (re.imprimir=1, 'Pendiente','Hecha') AS "Impresion"  
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (axc.ciclolectivo LIKE CONCAT(TRIM(pciclo), "%")) AND  (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;

IF (LENGTH(TRIM(pidcurso)) > 0 AND LENGTH(TRIM(pciclo)) > 0 )
THEN
SELECT re.idReincorporacion,a.idAlumno,a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono',concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha,if (re.imprimir=1, 'Pendiente','Hecha') AS "Impresion"  
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE (axc.idCurso LIKE CONCAT(TRIM(pidcurso), "%")) AND (axc.ciclolectivo LIKE CONCAT(TRIM(pciclo), "%")) AND  (re.estado>0)
and axc.idAlumnxcurso = (SELECT MAX(idAlumnxcurso)
FROM alumnxcurso WHERE idAlumno = a.idAlumno)
ORDER BY re.idReincorporacion ASC;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Reincorporacion pendiente por idalumno` (IN `pIdalum` INT(11))  NO SQL
BEGIN
SELECT re.idReincorporacion,a.idAlumno, a.nombre AS 'Nombre', a.apellido AS'Apellido', td.tipodocumento AS 'Tipo Documento', a.documento AS'Documento',a.telefono AS'Telefono', concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' , c.turno AS 'Turno', c.especialidad AS 'Especialidad',  axc.ciclolectivo AS 'Ciclo' ,re.tipoReincorporacion,re.fecha,if (re.imprimir=1, 'Pendiente','Hecha') AS "Impresion" 
FROM alumnos a
INNER JOIN alumnxcurso axc ON a.idAlumno = axc.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN estados e ON a.idEstado = e.idEstado
INNER JOIN tiposdocumentos td ON a.idTipodocumento = td.idTipodocumento
INNER JOIN reincorporaciones re on a.idAlumno= re.idAlumno
WHERE re.estado>0 AND a.idAlumno = pIdalum
ORDER BY re.idReincorporacion ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REINCORPORACIONxALUMNOxCURSO` (IN `pidcurso` INT(2), IN `pciclolectivo` INT(4), IN `pidalum` INT(11))  BEGIN

insert into reincorporaciones (`tipoReincorporacion`,`estado`,`idAlumnxcurso`, `idAlumno`, `fecha`, `observaciones`,`ciclolectivo`,`imprimir`)
select 'Primera reincorporacion', 1, 
       axc.idAlumnxcurso, axc.idAlumno, current_date(),
       'Primera reincorporacion automatica', pciclolectivo,1
from seguimientos s, motivos m, alumnxcurso axc, cursos c
where s.idAlumnxcurso = axc.idAlumnxcurso
and s.idMotivo = m.idMotivo
 and c.idCurso = pidcurso
 and axc.idCurso = c.idCurso
and axc.ciclolectivo = pciclolectivo
and axc.idAlumno = pidalum
And axc.idAlumno not in (select idAlumno from reincorporaciones where tipoReincorporacion like 'Primera reincorporacion' AND ciclolectivo = pciclolectivo)
group by axc.idAlumnxcurso
HAVING SUM(m.valorAsistencia)>=15;
 

IF EXISTS (SELECT * FROM reincorporaciones where idAlumno = pidalum AND estado=1 AND  ciclolectivo = pciclolectivo  and  tipoReincorporacion like 'primera reincorporacion')
THEN
SELECT concat_ws('', 'primera reincorporacion de ', a.nombre," ",a.apellido,"")  AS "alerta de reincorporacion"
FROM alumnos a 
INNER JOIN reincorporaciones r ON r.idAlumno = a.idAlumno
WHERE a.idAlumno = pidalum 
;
END IF;

insert into reincorporaciones (tipoReincorporacion, estado, idAlumnxcurso, idAlumno, fecha, observaciones, ciclolectivo,imprimir)
select 'Segunda reincorporacion', 1, 
       axc.idAlumnxcurso, axc.idAlumno, current_date(),
       'Segunda reincorporacion automatica',pciclolectivo,1
from seguimientos s, motivos m, alumnxcurso axc, cursos c
where s.idAlumnxcurso = axc.idAlumnxcurso
and s.idMotivo = m.idMotivo
and axc.idCurso = c.idCurso
and axc.ciclolectivo = pciclolectivo
and c.idCurso = pidcurso
and axc.idAlumno = pidalum
And axc.idAlumno not in (select idAlumno from reincorporaciones where tipoReincorporacion like 'Segunda reincorporacion' AND ciclolectivo = pciclolectivo)
group by axc.idAlumnxcurso
HAVING SUM(m.valorAsistencia)>=25;
IF EXISTS (SELECT * FROM reincorporaciones where idAlumno = pidalum AND estado=1 AND  ciclolectivo = pciclolectivo  and  tipoReincorporacion like 'Segunda reincorporacion')
THEN
SELECT concat_ws('', 'Segunda reincorporacion de ', a.nombre," ",a.apellido,"")  AS "alerta de reincorporacion"
FROM alumnos a 
INNER JOIN reincorporaciones r ON r.idAlumno = a.idAlumno
WHERE a.idAlumno = pidalum 
;
END IF;




 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REINCORPORAR` (IN `pIdrein` INT, IN `pIdUsua` INT)  NO SQL
BEGIN
IF EXISTS (SELECT * FROM reincorporaciones WHERE idReincorporacion = pIdrein)
THEN
UPDATE reincorporaciones r
SET r.estado=0
WHERE r.idReincorporacion =pIdrein;
INSERT INTO `modificaciones` (`idUsuario`, `tipomodificacion`, `fechaModificacion`, `horaModificacion`)
VALUES (pIdUsua, 'Reincorporacion del alumno', CURRENT_DATE(), CURRENT_TIME());
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteAlumxMes` (IN `pmes` VARCHAR(2), IN `pciclo` INT(4), IN `pAs1` INT, IN `pAs2` INT)  NO SQL
BEGIN
select a.idAlumno,a.nombre,a.apellido,a.documento,a.telefono, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos', MONTHNAME(s.fecha) mes, SUM(m.valorAsistencia) TotalInasistencias,s.observaciones
FROM seguimientos s
INNER JOIN alumnxcurso axc ON s.idAlumnxcurso = axc.idAlumnxcurso
INNER JOIN alumnos a ON axc.idAlumno = a.idAlumno
INNER JOIN cursos c ON axc.idCurso = c.idCurso
INNER JOIN motivos m ON s.idMotivo = m.idMotivo
where ( MONTH(s.fecha) = pmes and YEAR(s.fecha) = pciclo ) 
GROUP BY a.idAlumno,a.nombre,a.apellido, c.anio, MONTHNAME(s.fecha) HAVING SUM(m.valorAsistencia) between pAs1 and pAs2 ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_DE_LOS_ALUMNOSxCURSOxMES` (IN `pidcurso` INT(2), IN `pmes` INT(2), IN `pciclo` INT(4))  NO SQL
BEGIN
select a.idAlumno,a.nombre,a.apellido, c.anio, c.division, MONTHNAME(s.fecha) mes, SUM(m.valorAsistencia) TotalInasistencias 
from cursos c,seguimientos s,alumnxcurso axc,alumnos a,motivos m 
where (  s.idAlumnxcurso = axc.idAlumnxcurso && c.idCurso=pidcurso && a.idAlumno=axc.idAlumno && c.idCurso=axc.idCurso && m.idMotivo= s.idMotivo and MONTH(s.fecha) = pmes and YEAR(s.fecha) = pciclo ) 
GROUP BY a.idAlumno,a.nombre,a.apellido, c.anio, MONTHNAME(s.fecha) HAVING SUM(m.valorAsistencia) between 7 and 14

UNION ALL
select a.idAlumno,a.nombre,a.apellido, c.anio, c.division, MONTHNAME(s.fecha) mes, SUM(m.valorAsistencia) TotalInasistencias 
from cursos c,seguimientos s,alumnxcurso axc,alumnos a,motivos m 
where (  s.idAlumnxcurso = axc.idAlumnxcurso && c.idCurso=pidcurso && a.idAlumno=axc.idAlumno && c.idCurso=axc.idCurso && m.idMotivo= s.idMotivo and MONTH(s.fecha) = pmes and YEAR(s.fecha) = pciclo ) 
GROUP BY a.idAlumno,a.nombre,a.apellido, c.anio, MONTHNAME(s.fecha) HAVING SUM(m.valorAsistencia) between 15 and 25

UNION ALL
select a.idAlumno,a.nombre,a.apellido, c.anio, c.division, MONTHNAME(s.fecha) mes, SUM(m.valorAsistencia) TotalInasistencias 
from cursos c,seguimientos s,alumnxcurso axc,alumnos a,motivos m 
where (  s.idAlumnxcurso = axc.idAlumnxcurso && c.idCurso=pidcurso && a.idAlumno=axc.idAlumno && c.idCurso=axc.idCurso && m.idMotivo= s.idMotivo and MONTH(s.fecha) = pmes and YEAR(s.fecha) = pciclo ) 
GROUP BY a.idAlumno,a.nombre,a.apellido, c.anio, MONTHNAME(s.fecha) HAVING SUM(m.valorAsistencia) > 25;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetAnt` (IN `palumn` INT(11), IN `pusuario` INT(11), IN `pseg` INT(11), IN `pobvs` VARCHAR(255), IN `pestado` INT(11), IN `pmotivo` INT(11), IN `pevento` INT(1))  BEGIN

IF EXISTS (SELECT * FROM motivos where 3 = pevento )
THEN

INSERT INTO retirosantisipados (idAlumno,idSeguimientos,idUsuario,fecha,hora,observaciones,estado,idmotivo)
VALUES (palumn,pseg,pusuario,CURRENT_DATE(),CURRENT_TIME(),pobvs,pestado,pmotivo);

IF ((14 = pmotivo))
THEN
uPDATE seguimientos SET idMotivo=4 WHERE idSeguimiento=pseg;

insert INTO modificaciones (idUsuario, tipomodificacion, fechaModificacion, horaModificacion,idSeguimiento)
VALUES (pusuario, 'Modificacion de asistencia por retiro anticipado', CURRENT_DATE(), CURRENT_TIME(),pseg);
END IF;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vaciar temp` ()  NO SQL
TRUNCATE temp$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verMaterias` ()  NO SQL
BEGIN

SELECT m.idMateria, m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', e.Especialidad as 'Especialidad de la materia', concat_ws('',c.anio,'º ',c.division,'º') as 'Cursos', c.idCurso, mxc.idMateriaxCurso, pxmxc.idProfxMateriaxCurso, p.idProfesor
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN especialidad e ON m.id_especialidad = e.idEspecialidad
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
ORDER BY concat(c.anio,c.division);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verMateriaXCurso` (IN `Pcurso` VARCHAR(40))  NO SQL
BEGIN
SELECT m.idMateria as 'ID Materia', m.Nombre as 'Materia', mxc.idMateriaxCurso as 'ID MateriaxCurso'
FROM materiasxcursos mxc
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE c.idCurso = Pcurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verNotasXAlumnoXCurso ---Pivot` (IN `Pnombre` VARCHAR(50), IN `Papellido` VARCHAR(50), IN `Pcurso` INT(11), IN `Pciclolectivo` INT(11))  NO SQL
BEGIN
create table nuevatb SELECT m.Nombre,
	 max(case when tn.Trimestre = 'Primer Trimestre' then n.Calificacion end) as 'PrimerTrimestre',
     max(case when tn.Trimestre = 'Segundo Trimestre' then n.Calificacion end) as 'SegundoTrimestre',
     max(case when tn.Trimestre = 'Tercer Trimestre' then n.Calificacion end) as 'TercerTrimestre',
      max(case when tn.Trimestre = 'Diciembre' then n.Calificacion end) as 'Diciembre',
       max(case when tn.Trimestre = 'Febrero' then n.Calificacion end) as 'Febrero'
     
FROM trimestresnota tn
LEFT JOIN notas n ON tn.id_trimestrenota = n.id_trimestrenota
LEFT JOIN alumnxcurso axc ON n.id_alumnxcurso = axc.idAlumnxcurso
LEFT JOIN alumnos a ON axc.idAlumno = a.idAlumno
LEFT JOIN cursos c ON n.id_curso = c.idCurso
LEFT JOIN materiasxcursos mxc on n.id_materiaxcurso = mxc.idMateriaxCurso
LEFT JOIN materias m on mxc.id_Materia = m.idMateria
WHERE a.nombre LIKE concat('%',Pnombre,'%') AND a.apellido LIKE concat('%',Papellido,'%') AND c.idCurso = Pcurso AND n.id_ciclolectivo = Pciclolectivo
GROUP BY m.Nombre;

SELECT nombre as 'Materia',PrimerTrimestre, SegundoTrimestre,TercerTrimestre,((PrimerTrimestre + SegundoTrimestre + TercerTrimestre)/3) as Promedio,Diciembre,Febrero FROM nuevatb;

DROP TABLE nuevatb;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verNotaXMateriaXCurso---Pivot` (IN `Pmateria` VARCHAR(50), IN `Pcurso` INT(11), IN `Pciclolectivo` INT(11))  NO SQL
BEGIN
CREATE TABLE nuevatb2 SELECT a.nombre,a.apellido,
	max(case when tn.Trimestre = 'Primer Trimestre' then n.Calificacion end) as 'PrimerTrimestre',
    max(case when tn.Trimestre = 'Segundo Trimestre' then n.Calificacion end) as 'SegundoTrimestre',
    max(case when tn.Trimestre = 'Tercer Trimestre' then n.Calificacion end) as 'TercerTrimestre'
    FROM trimestresnota tn
LEFT JOIN notas n ON tn.id_trimestrenota = n.id_trimestrenota
LEFT JOIN alumnxcurso axc ON n.id_alumnxcurso = axc.idAlumnxcurso
LEFT JOIN alumnos a ON axc.idAlumno = a.idAlumno
LEFT JOIN cursos c ON n.id_curso = c.idCurso
LEFT JOIN materiasxcursos mxc on n.id_materiaxcurso = mxc.idMateriaxCurso
LEFT JOIN materias m on mxc.id_Materia = m.idMateria
WHERE c.idCurso=Pcurso AND m.Nombre LIKE concat('%',Pmateria,'%') AND n.id_ciclolectivo = Pciclolectivo
GROUP BY a.nombre, a.apellido;

SELECT nombre as 'Nombre del alumno', apellido as 'Apellido del alumno', PrimerTrimestre,SegundoTrimestre,TercerTrimestre,((PrimerTrimestre+SegundoTrimestre+TercerTrimestre)/3)as Promedio FROM nuevatb2;

DROP TABLE nuevatb2;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verProfesorXMateriaXCurso` (IN `Pcurso` VARCHAR(40))  NO SQL
BEGIN
SELECT m.Nombre as 'Materia', p.Nombre as 'Nombre del profesor', p.Apellido as 'Apellido del profesor', pxmxc.idProfxMateriaxCurso, mxc.idMateriaxCurso 
FROM profesores p
INNER JOIN profesoresxmateriasxcursos pxmxc ON p.idProfesor = pxmxc.id_profesor
INNER JOIN materiasxcursos mxc ON pxmxc.id_MateriaxCurso = mxc.idMateriaxCurso
INNER JOIN materias m ON mxc.id_Materia = m.idMateria
INNER JOIN cursos c ON mxc.id_Curso = c.idCurso
WHERE c.idCurso = Pcurso;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas`
--

CREATE TABLE `alertas` (
  `idAlerta` int(11) NOT NULL,
  `descripcionalerta` varchar(255) DEFAULT NULL,
  `tipoalerta` varchar(30) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alertas`
--

INSERT INTO `alertas` (`idAlerta`, `descripcionalerta`, `tipoalerta`, `estado`) VALUES
(0, '0', '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumno` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_Nacimiento` varchar(10) NOT NULL,
  `telefono` int(10) NOT NULL,
  `idTipodocumento` int(11) NOT NULL,
  `documento` int(8) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`idAlumno`, `nombre`, `apellido`, `fecha_Nacimiento`, `telefono`, `idTipodocumento`, `documento`, `observaciones`, `idEstado`) VALUES
(0, '0', '0', '0', 0, 0, 0, '0', 0),
(1, 'Guts', 'Berserk', '1999/01/01', 1122333355, 1, 69559999, 'Su cara parece tallada por los mismisimos angeles', 1),
(2, 'Caska', 'Berserk', '1994-01-01', 1123174222, 1, 43995438, NULL, 8),
(3, 'Naruto', 'Uzumaki', '1997-04-01', 1234321200, 1, 50232129, NULL, 4),
(4, 'Sasuke', 'Uchiha', '1997-04-01', 1034568872, 2, 43910293, NULL, 5),
(5, 'Ashen', 'One', '1998-01-10', 1103334306, 1, 43012932, 'No lee berserk', 7),
(6, 'Artorias', 'Del Abismo', '2013-06-29', 1598013231, 3, 23459012, NULL, 2),
(7, 'Gwin', 'Lord', '1994-03-25', 1223301231, 1, 23901243, NULL, 6),
(8, 'Mannus', 'Padre Del Abismo', '1880-12-25', 1234565392, 1, 42345678, NULL, 8),
(9, 'Griffith', 'Lepute', '1996-02-01', 1504567890, 1, 43483647, 'Tampoco lee berserk', 3),
(10, 'Ezequiel', 'Piedra', '1999-10-04', 1234567890, 2, 42214583, '', 1),
(11, 'Mouhamed', 'Mou', '2001-09-11', 1234567890, 1, 42210001, '', 1),
(12, 'azabache', 'azabache', '2000-08-11', 1234567890, 3, 42210002, '', 1),
(13, 'Rodrigo', 'Lopezz', '2000-08-12', 1234567890, 1, 42210003, 'Aca deberia ir algo', 2),
(14, 'PETER', 'losanos', '2000-08-13', 1234567890, 1, 42210004, '', 1),
(15, 'pache', 'elpache', '2000-08-14', 1234567890, 1, 42210005, '', 1),
(16, 'sarzuri', 'manka', '2000-07-14', 1234567890, 1, 42210006, '', 1),
(17, 'maxi', 'demou', '2000-07-15', 1234567890, 1, 42210007, '', 2),
(18, 'karina', 'triguero', '2000-07-18', 1234567890, 1, 42210008, 'Aca deberia ir algo', 2),
(19, 'Diego', 'Maradona', '2000-04-18', 1234567890, 1, 42210009, '', 1),
(20, 'batman', 'Maradona', '2000-04-19', 1234567890, 3, 42210010, '', 1),
(21, 'pele', 'Maradona', '2000-04-20', 1234567890, 1, 42210011, '', 1),
(22, 'maradona', 'Maradona', '2000-04-24', 1234567890, 1, 42210012, '', 1),
(23, 'roberto', 'gomez', '2000-04-21', 1234567890, 1, 42210013, '', 1),
(24, 'alberto', 'einstein', '2000-04-20', 1234567890, 2, 42210014, '', 1),
(25, 'manuel', 'belgrano', '2000-05-20', 1234567890, 1, 42210015, '', 1),
(26, 'manuel', 'sarmiento', '2000-05-21', 1234567890, 1, 42210016, 'Aca deberia ir algo', 5),
(27, 'sarmiento', 'sarmiento', '2000-05-22', 1234567890, 1, 42210017, '', 1),
(28, 'tortuga', 'ninja', '2000-07-22', 1234567890, 1, 42210018, '', 5),
(29, 'cumbia', 'ninja', '2000-07-23', 1234567890, 1, 42210019, '', 6),
(30, 'zapato', 'zinzuela', '2000-03-25', 1234567890, 1, 42210020, '', 1),
(31, 'pizza', 'anchoas', '2000-03-22', 1234567890, 1, 42210021, '', 1),
(32, 'pizza', 'muzzarella', '2000-03-22', 1234567890, 1, 42210022, '', 7),
(33, 'pizza', 'napolitana', '2000-03-23', 1234567890, 1, 42210023, '', 1),
(34, 'pizza', 'sinpizza', '2000-03-23', 1234567890, 2, 42210024, '', 6),
(35, 'napoleon', 'sinpizza', '2000-03-23', 1234567890, 1, 42210025, '', 1),
(36, 'renault', 'doce', '2000-03-23', 1234567890, 1, 42210026, '', 1),
(37, 'renault', 'diecinueve', '2000-03-23', 1234567890, 1, 42210027, 'Esta morido', 1),
(38, 'renault', 'clio', '2000-03-23', 1234567890, 3, 42210028, '', 8),
(39, 'peugeot', 'trecientos', '2000-03-23', 1234567890, 1, 42210029, '', 1),
(40, 'peugeot', 'cuatrocientos', '2000-03-23', 1234567890, 1, 42210030, 'Este tambien', 1),
(41, 'cietroen', 'uno', '2000-03-23', 1234567890, 1, 42210031, '', 1),
(42, 'flash', 'gordon', '2000-03-23', 1234567890, 1, 42210032, '', 8),
(43, 'holk', 'hogan', '2000-03-23', 1234567890, 1, 42210033, '', 8),
(44, 'manolo', 'ostras', '2000-03-23', 1234567890, 1, 42210034, '', 1),
(45, 'jose', 'torero', '2000-03-23', 1234567890, 3, 42210035, '', 1),
(46, 'benancio', 'sacashi', '2000-03-23', 1234567890, 1, 42210036, '', 1),
(47, 'yamimoto', 'noanda', '2000-03-23', 1234567890, 1, 42210037, '', 1),
(48, 'tesaka', 'tumoko', '2000-03-23', 1234567890, 1, 42210038, 'Aca deberia ir algo', 1),
(49, 'salid', 'ademerhencia', '2000-03-23', 1234567890, 1, 42210039, 'Aca deberia ir algo', 7),
(50, 'franco', 'escamilla', '2000-03-23', 1234567890, 1, 42210040, '', 1),
(51, 'mouse', 'inalambrico', '2000-03-23', 1234567890, 1, 42210041, '', 1),
(52, 'mouse', 'erregebe', '2000-03-23', 1234567890, 1, 42210042, '', 1),
(53, 'diego', 'delavega', '2000-03-23', 1234567890, 2, 42210043, '', 2),
(54, 'oso', 'yogi', '2000-03-23', 1234567890, 2, 42210044, '', 1),
(55, 'oso', 'bubu', '2000-03-23', 1234567890, 1, 42210045, '', 1),
(56, 'jose', 'Torrente', '2000-03-23', 1234567890, 1, 42210046, '', 1),
(57, 'zulma', 'lobato', '2000-03-23', 1234567890, 1, 42210047, 'Hola', 1),
(58, 'sangre', 'dragon', '2000-03-23', 1234567890, 1, 42210048, NULL, 2),
(59, 'leonel', 'messi', '2000-03-23', 1234567890, 3, 42210049, NULL, 1),
(60, 'homero', 'simpson', '2000-03-23', 1234567890, 1, 42210050, '', 1),
(61, 'bart', 'simpson', '2000-03-23', 1234567890, 1, 42210051, '', 8),
(62, 'lisa', 'simpson', '2000-03-23', 1234567890, 1, 42210052, '', 1),
(63, 'nedd', 'flanders', '2000-03-23', 1234567890, 1, 42210053, '', 1),
(64, 'Elba', 'Neado', '2000-02-27', 1569785611, 1, 43595924, 'No lee berserk', 5),
(65, 'Elba', 'Tido cosmico', '2000-02-24', 1569781411, 1, 43695302, 'No lee berserk', 1),
(66, 'Estefi', 'Errote', '2000-12-27', 1599705611, 1, 42644642, NULL, 7),
(67, 'Elman', 'Co', '2000-06-17', 1539785721, 1, 43691197, 'No lee berserk', 1),
(68, 'Elpa', 'Ragua', '2000-08-01', 1569454611, 1, 43691232, NULL, 2),
(69, 'Zorro', 'Uno', '2000-12-12', 1569712511, 1, 43705642, 'Es una referencia', 1),
(70, 'Zorro', 'Dos', '2000-02-06', 1569780311, 1, 43633042, 'Es otra referencia', 1),
(71, 'Hana', 'Song', '2000-01-03', 1591215611, 2, 41644342, NULL, 5),
(72, 'Orisa', 'Robot', '2000-06-23', 1539785231, 2, 44691197, NULL, 1),
(73, 'Reinhardt', 'Wilhelm', '2000-04-01', 1569454147, 1, 43630232, NULL, 4),
(74, 'Mako', 'Rutledge', '2000-11-12', 1569712530, 1, 43791642, 'Aca deberia ir algo', 1),
(75, 'Winston', 'Dela Luna', '2000-12-06', 1569789011, 1, 43691822, 'Aca tambien', 1),
(76, 'Hammond', 'Wreking ball', '2000-07-01', 1569789561, 1, 43165642, NULL, 4),
(77, 'Aleksandra', 'Zaryanova', '2000-07-23', 1569744211, 1, 43085642, NULL, 1),
(78, 'Bastion', 'Omnico', '2000-03-27', 1599739911, 3, 44524642, NULL, 6),
(79, 'Akande', 'Ogundimu', '2000-10-17', 1539785377, 1, 43601197, NULL, 1),
(80, 'Genji', 'Shimada', '2000-10-01', 1503454611, 1, 43445232, NULL, 1),
(81, 'Hanzo', 'Shimada', '2000-12-03', 1569765511, 1, 43705642, 'Es una referencia', 1),
(82, 'Jaminson', 'flawkes', '2000-02-26', 1569782311, 1, 43691042, 'Es otra referencia', 1),
(83, 'Jesse', 'Mccree', '2000-10-24', 1569782211, 1, 43695642, NULL, 2),
(84, 'Mei', 'Ling Zhou', '2000-05-23', 1566591611, 1, 43695642, NULL, 1),
(85, 'Fareeha', 'Amari', '2000-06-27', 1599032611, 3, 42774642, NULL, 1),
(86, 'Gabriel', 'Reyes', '2000-06-17', 1519985721, 1, 43691127, 'No lee berserk', 1),
(87, 'Jack', 'Morrison', '2000-08-16', 1569454692, 2, 43698732, NULL, 1),
(88, 'Mako', 'Rutledge', '2000-01-12', 1569712388, 1, 43742642, 'Es de overwatch', 1),
(89, 'Olivia', 'Colomar', '2000-02-10', 1569781631, 1, 43121042, 'Este tambien', 4),
(90, 'Satya', 'Vaswani', '2000-03-07', 1569785901, 1, 43695222, NULL, 1),
(91, 'Torbj?rn', 'Lindholm', '2000-06-13', 1569781131, 1, 43699842, NULL, 1),
(92, 'Lena', 'Oxton', '2000-12-26', 1599705441, 3, 42646342, NULL, 1),
(93, 'Amelie', 'Lacroix', '2000-11-17', 1539265721, 3, 43691417, NULL, 1),
(94, 'Briggite', 'Lindholm', '2000-08-11', 1569498611, 1, 43692332, 'Esta OP nerf pls', 1),
(95, 'Lucio', 'Correia dos Santos', '2001-12-12', 1569712511, 1, 43705642, NULL, 1),
(96, 'Angela', 'ziegler', '2001-02-06', 1569723311, 2, 43806042, NULL, 1),
(97, 'Moira', 'O Deorain', '2001-09-01', 1567285611, 1, 43695442, NULL, 8),
(98, 'Zennyata', 'Omnico', '2001-03-23', 1561685611, 1, 43632642, NULL, 1),
(99, 'Marilyn', 'Florcita', '2001-06-11', 1515364801, 2, 43561203, 'solo tenia 12 a?os :,v', 1),
(100, 'tlacuache', 'Tuturututu', '2001-04-25', 1515361101, 1, 41261203, NULL, 1),
(101, 'Roberto', 'Culoabierto', '2001-09-04', 1514861101, 1, 43661203, NULL, 1),
(102, 'Federico', 'Gonzales', '2001-10-25', 1515364501, 1, 41277203, NULL, 1),
(103, 'Anacleta', 'Tuvieja', '2001-02-14', 1515331101, 1, 41331203, NULL, 1),
(104, 'Guillermo', 'Franchella', '2001-07-15', 1528361101, 1, 41301203, NULL, 2),
(105, 'Mela', 'Mamas', '2001-04-03', 1516661101, 1, 41261603, NULL, 1),
(106, 'Akiyasen', 'Missue?os', '2001-11-22', 1516584101, 1, 43661203, NULL, 1),
(107, 'Oliver', 'Sykes', '2001-11-20', 1516361101, 2, 41266403, NULL, 3),
(108, 'Julia', 'Volkova', '1985-02-20', 1515431388, 1, 42861203, 'tatu comeback', 1),
(109, 'Lena', 'Katina', '1984-10-04', 1515239101, 1, 42161203, 'tatu comeback', 1),
(110, 'Bizcocho', 'Devainilla', '2002-06-13', 1560361101, 2, 41151203, NULL, 2),
(111, 'Johanna', 'Soledad', '2001-06-04', 1514835101, 1, 42231203, NULL, 1),
(112, 'Micaela', 'Torres', '2001-12-28', 1515373501, 1, 41697203, 'Aca va algo', 1),
(113, 'Harry', 'Potter', '2001-02-08', 1515336656, 3, 41330003, NULL, 1),
(114, 'Hermione', 'Granger', '2001-07-22', 1520061101, 1, 41051203, NULL, 3),
(115, 'Ron', 'Weasley', '2001-07-07', 1516381101, 1, 41001603, 'El alumno es tarado', 1),
(116, 'Luna', 'Lovegood', '2001-11-01', 1510322101, 1, 43699203, NULL, 1),
(117, 'Oliver', 'Langer', '2001-01-20', 1518861101, 3, 41664403, NULL, 3),
(118, 'Lexa', 'Woods', '1989-02-20', 1544431388, 1, 42661203, 'uwu', 1),
(119, 'Clarke', 'Griffin', '1990-10-04', 1555239101, 1, 42167203, 'uwu', 1),
(120, 'Kara', 'Danvers', '2001-10-25', 1535361101, 1, 41260203, NULL, 1),
(121, 'Lena', 'Luthor', '2001-09-11', 1514861333, 2, 43671203, NULL, 1),
(122, 'Gemela', 'Torres', '2001-09-11', 1547364501, 1, 46377203, NULL, 1),
(123, 'Abril', 'Quesada', '2001-02-20', 1599331101, 1, 41441203, 'Ola bb', 1),
(124, 'Celeste', 'Color', '2002-07-15', 1598761101, 1, 43301203, NULL, 2),
(125, 'Jenny', 'Atr', '2001-04-13', 1563961101, 1, 41233603, NULL, 1),
(126, 'Brian', 'Navaja Suelta', '2002-10-22', 1516114101, 1, 41161203, NULL, 1),
(127, 'Natasha', 'Negovanlis', '2002-02-20', 1537361101, 2, 41262903, NULL, 3),
(128, 'Gabriela', 'Huerta', '2002-02-15', 1515444388, 1, 46661203, 'Aca va algo', 1),
(129, 'Jon', 'Snow', '1994-10-04', 158839101, 1, 42881203, 'Aca tambien', 1),
(130, 'Daenerys', 'Targaryen', '2003-06-18', 1135361101, 2, 41151663, NULL, 2),
(131, 'Arya', 'Stark', '2003-06-04', 1514035101, 1, 43931203, NULL, 1),
(132, 'Brandon', 'Stark', '2004-12-28', 1566373501, 2, 41377203, 'The north remembers', 1),
(133, 'Robb', 'Stark', '2002-02-17', 1515386656, 3, 42930003, NULL, 1),
(134, 'Luciano', 'Buzzo', '2001-04-27', 1527301101, 1, 41961203, NULL, 3),
(135, 'Rickon', 'Stark', '2004-07-07', 1513781101, 1, 42301603, 'Corre en zig zag', 1),
(136, 'China', 'Supermercado', '2005-11-01', 1510652101, 1, 43677203, 'Talado eh', 1),
(137, 'Clark', 'Kent', '2004-01-20', 1542861101, 3, 44664403, NULL, 3),
(138, 'Andrea', 'Fernandez', '2004-02-20', 1503431388, 1, 42081203, 'Aca va algo', 1),
(139, 'Ben', 'Diez', '2004-10-04', 1555203101, 1, 42160003, NULL, 1),
(140, 'Luis', 'Miguel', '2005-11-03', 1566443322, 1, 43434399, NULL, 3),
(141, 'Mike', 'Wasawsky', '2005-06-03', 1566356612, 1, 4366044, NULL, 8),
(142, 'Cesar', 'Gomez', '2005-12-08', 1548682393, 1, 43556561, NULL, 1),
(143, 'Fabiana', 'Forra', '2005-11-06', 1536766443, 2, 43652101, 'Indocumentada', 1),
(144, 'Sandro', 'Armesto', '2005-01-01', 1563300443, 1, 43300393, NULL, 1),
(145, 'Marito', 'Baracus', '2005-04-11', 1536230202, 1, 44365684, NULL, 2),
(146, 'Geralt', 'Witcher', '2005-06-07', 1566604878, 1, 42369878, NULL, 7),
(147, 'Tomas', 'Viola', '2005-11-11', 1544743554, 1, 42697989, NULL, 8),
(148, 'Elvio', 'Lado', '2006-05-13', 1543034811, 1, 43956800, 'Tiene traumas', 1),
(150, 'lenin', 'vladimir', '2002-08-23', 1565346677, 1, 43568899, NULL, 1),
(151, 'iosef', 'stanlin', '2002-08-24', 1566873400, 1, 43568898, NULL, 2),
(152, 'Daiana', 'Azabache Espinoza', '2000-02-19', 1536640021, 1, 43875620, NULL, 1),
(153, 'Maximiliano', 'Benites Enciso', '1998-01-10', 1535540821, 1, 49375620, NULL, 1),
(154, 'Ezequiel', 'Dacosta Guerra', '1997-12-25', 1536649331, 1, 44875620, NULL, 1),
(155, 'Sebastian', 'Gonzales Romani', '2000-06-04', 1536641021, 1, 43875631, NULL, 1),
(156, 'Cristian', 'Huayhua Colquechuyma', '2000-01-22', 1537740021, 1, 43873230, NULL, 1),
(157, 'Rodrigo', 'Lopez Cardenas', '2000-02-17', 1536645021, 1, 46205620, NULL, 1),
(158, 'Pedro Julian', 'Lozano', '1999-08-15', 1536640521, 1, 43878720, NULL, 1),
(159, 'Cristian', 'Mollo Mamani', '1999-12-10', 1536222021, 1, 43666620, NULL, 1),
(160, 'Joel Matias', 'Mouhamed', '2000-03-02', 1536440021, 1, 48575620, NULL, 1),
(161, 'Marcelo', 'Pacheco Condori', '1999-05-16', 1577740021, 1, 43775620, NULL, 1),
(162, 'Ezequiel David', 'Roca', '2000-02-19', 1536640021, 1, 43875620, NULL, 1),
(163, 'Abigail', 'Sarzuri Clemente', '1999-01-08', 1522522184, 1, 41756095, NULL, 1),
(164, 'Karina', 'Triguero Ichuta', '1999-09-22', 1549640021, 1, 49775620, NULL, 1),
(165, 'Andres Hector', 'Valdez', '1999-09-06', 1536640021, 1, 43875620, NULL, 1),
(166, 'pepe calato', 'pepe alv', '1995-01-12', 303456, 1, 3334306, 'ACM1PT', 8),
(168, 'dsa', 'aoadhaldj', '1998-01-10', 1123174820, 1, 83639376, 'xd', 1),
(169, 'prueba', 'prueba', '2000-09-09', 1143786443, 1, 42311234, 'prueba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnxcurso`
--

CREATE TABLE `alumnxcurso` (
  `idAlumnxcurso` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `ciclolectivo` int(4) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnxcurso`
--

INSERT INTO `alumnxcurso` (`idAlumnxcurso`, `idAlumno`, `idCurso`, `ciclolectivo`, `estado`) VALUES
(0, 0, 0, 0, 0),
(1, 1, 25, 2019, 1),
(2, 2, 25, 2019, 1),
(3, 3, 25, 2019, 1),
(4, 4, 25, 2019, 1),
(5, 5, 25, 2019, 1),
(6, 6, 25, 2019, 1),
(7, 7, 25, 2019, 1),
(8, 8, 25, 2019, 1),
(9, 9, 25, 2019, 1),
(10, 10, 26, 2019, 1),
(11, 11, 26, 2019, 1),
(12, 12, 26, 2019, 1),
(13, 13, 26, 2019, 1),
(14, 14, 26, 2019, 1),
(15, 15, 26, 2019, 1),
(16, 16, 26, 2019, 1),
(17, 17, 26, 2019, 1),
(18, 18, 26, 2019, 1),
(19, 19, 26, 2019, 1),
(20, 20, 23, 2019, 1),
(21, 21, 23, 2019, 1),
(22, 22, 23, 2019, 1),
(23, 23, 23, 2019, 1),
(24, 24, 23, 2019, 1),
(25, 25, 23, 2019, 1),
(26, 26, 23, 2019, 1),
(27, 27, 23, 2019, 1),
(28, 28, 23, 2019, 1),
(29, 29, 23, 2019, 1),
(30, 30, 22, 2019, 1),
(31, 31, 22, 2019, 1),
(32, 32, 22, 2019, 1),
(33, 33, 22, 2019, 1),
(34, 34, 22, 2019, 1),
(35, 35, 22, 2019, 1),
(36, 36, 22, 2019, 1),
(37, 37, 22, 2019, 1),
(38, 38, 22, 2019, 1),
(39, 39, 22, 2019, 1),
(40, 40, 22, 2019, 1),
(41, 41, 22, 2019, 1),
(42, 42, 22, 2019, 1),
(43, 43, 22, 2019, 1),
(44, 44, 19, 2019, 1),
(45, 45, 24, 2019, 1),
(46, 46, 24, 2019, 1),
(47, 47, 24, 2019, 1),
(48, 48, 24, 2019, 1),
(49, 49, 24, 2019, 1),
(50, 50, 24, 2019, 1),
(51, 51, 24, 2019, 1),
(52, 52, 24, 2019, 1),
(53, 53, 24, 2019, 1),
(54, 54, 21, 2019, 1),
(55, 55, 21, 2019, 1),
(56, 56, 21, 2019, 1),
(57, 57, 21, 2019, 1),
(58, 58, 21, 2019, 1),
(59, 59, 21, 2019, 1),
(60, 60, 21, 2019, 1),
(61, 61, 21, 2019, 1),
(62, 62, 21, 2019, 1),
(63, 63, 21, 2019, 1),
(64, 64, 20, 2019, 1),
(65, 65, 20, 2019, 1),
(66, 66, 20, 2019, 1),
(67, 67, 20, 2019, 1),
(68, 68, 20, 2019, 1),
(69, 69, 20, 2019, 1),
(70, 70, 20, 2019, 1),
(71, 71, 20, 2019, 1),
(72, 72, 20, 2019, 1),
(73, 73, 20, 2019, 1),
(74, 74, 19, 2019, 1),
(75, 75, 19, 2019, 1),
(76, 76, 19, 2019, 1),
(77, 77, 19, 2019, 1),
(78, 78, 19, 2019, 1),
(79, 79, 19, 2019, 1),
(80, 80, 19, 2019, 1),
(81, 81, 19, 2019, 1),
(82, 82, 19, 2019, 1),
(83, 83, 19, 2019, 1),
(84, 84, 18, 2019, 1),
(85, 85, 18, 2019, 1),
(86, 86, 18, 2019, 1),
(87, 87, 18, 2019, 1),
(88, 88, 18, 2019, 1),
(89, 89, 18, 2019, 1),
(90, 90, 18, 2019, 1),
(91, 91, 18, 2019, 1),
(92, 92, 18, 2019, 1),
(93, 93, 18, 2019, 1),
(94, 94, 17, 2019, 1),
(95, 95, 17, 2019, 1),
(96, 96, 17, 2019, 1),
(97, 97, 17, 2019, 1),
(98, 98, 17, 2019, 1),
(99, 99, 17, 2019, 1),
(100, 100, 17, 2019, 1),
(101, 101, 17, 2019, 1),
(102, 102, 17, 2019, 1),
(103, 103, 17, 2019, 1),
(104, 104, 16, 2019, 1),
(105, 105, 16, 2019, 1),
(106, 106, 16, 2019, 1),
(107, 107, 16, 2019, 1),
(108, 108, 16, 2019, 1),
(109, 109, 16, 2019, 1),
(110, 110, 16, 2019, 1),
(111, 111, 16, 2019, 1),
(112, 112, 16, 2019, 1),
(113, 113, 16, 2019, 1),
(114, 114, 15, 2019, 1),
(115, 115, 15, 2019, 1),
(116, 116, 15, 2019, 1),
(117, 117, 15, 2019, 1),
(118, 118, 15, 2019, 1),
(119, 119, 15, 2019, 1),
(120, 120, 15, 2019, 1),
(121, 121, 15, 2019, 1),
(122, 122, 15, 2019, 1),
(123, 123, 15, 2019, 1),
(124, 124, 14, 2019, 1),
(125, 125, 14, 2019, 1),
(126, 126, 14, 2019, 1),
(127, 127, 14, 2019, 1),
(128, 128, 14, 2019, 1),
(129, 129, 14, 2019, 1),
(130, 130, 14, 2019, 1),
(131, 131, 14, 2019, 1),
(132, 132, 14, 2019, 1),
(133, 133, 14, 2019, 1),
(134, 134, 13, 2019, 1),
(135, 135, 13, 2019, 1),
(136, 136, 13, 2019, 1),
(137, 137, 13, 2019, 1),
(138, 138, 13, 2019, 1),
(139, 139, 13, 2019, 1),
(140, 140, 13, 2019, 1),
(141, 141, 13, 2019, 1),
(142, 142, 13, 2019, 1),
(143, 143, 13, 2019, 1),
(144, 144, 12, 2019, 1),
(145, 145, 12, 2019, 1),
(146, 146, 12, 2019, 1),
(147, 147, 12, 2019, 1),
(148, 148, 12, 2019, 1),
(149, 150, 24, 2019, 1),
(150, 151, 23, 2019, 1),
(151, 151, 23, 2019, 1),
(152, 152, 26, 2019, 1),
(153, 153, 26, 2019, 1),
(154, 154, 26, 2019, 1),
(155, 155, 26, 2019, 1),
(156, 156, 26, 2019, 1),
(157, 157, 26, 2019, 1),
(158, 158, 26, 2019, 1),
(159, 159, 26, 2019, 1),
(160, 160, 26, 2019, 1),
(161, 161, 26, 2019, 1),
(162, 162, 26, 2019, 1),
(163, 163, 26, 2019, 1),
(164, 164, 26, 2019, 1),
(165, 165, 26, 2019, 1),
(166, 166, 1, 2019, 1),
(169, 168, 1, 2019, 1),
(170, 1, 25, 1, 1),
(172, 1, 2, 2019, 1),
(173, 169, 26, 2019, 1),
(174, 168, 2, 2019, 1),
(175, 165, 3, 2019, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `idCargo` int(11) NOT NULL,
  `tipodecargo` varchar(30) NOT NULL,
  `permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `tipodecargo`, `permiso`) VALUES
(0, '0', 0),
(1, 'preceptor', 1),
(2, 'subjefe preceptores', 2),
(3, 'jefe de preceptores', 3),
(4, 'rectoria', 4),
(5, 'DOE', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `Ciclolectivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`Ciclolectivo`) VALUES
(2018),
(2019),
(2020),
(2021),
(2022),
(2023),
(2024),
(2025),
(2026),
(2027),
(2028),
(2029),
(2030),
(2031),
(2032),
(2033),
(2034),
(2035),
(2036),
(2037),
(2038),
(2039),
(2040);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` int(11) NOT NULL,
  `anio` int(1) NOT NULL,
  `division` int(1) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `especialidad` int(30) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `anio`, `division`, `turno`, `especialidad`, `estado`) VALUES
(0, 0, 0, '0', 0, 0),
(1, 1, 1, 'Mañana', 1, 0),
(2, 1, 2, 'Mañana', 1, 0),
(3, 1, 3, 'Tarde', 1, 0),
(4, 1, 4, 'Tarde', 1, 0),
(5, 1, 5, 'Mañana', 1, 0),
(6, 1, 6, 'Tarde', 1, 0),
(7, 2, 2, 'Mañana', 1, 0),
(8, 2, 3, 'Mañana', 1, 0),
(9, 2, 4, 'Tarde', 1, 0),
(10, 2, 5, 'Tarde', 1, 0),
(11, 3, 2, 'Tarde', 1, 0),
(12, 3, 3, 'Mañana', 1, 0),
(13, 3, 4, 'Mañana', 1, 0),
(14, 3, 5, 'Tarde', 1, 0),
(15, 4, 1, 'Mañana', 2, 0),
(16, 4, 2, 'Tarde', 2, 0),
(17, 4, 3, 'Mañana', 2, 0),
(18, 4, 4, 'Tarde', 3, 0),
(19, 5, 1, 'Mañana', 2, 0),
(20, 5, 2, 'Tarde', 2, 0),
(21, 5, 3, 'Mañana', 2, 0),
(22, 5, 4, 'Tarde', 3, 0),
(23, 6, 1, 'Mañana', 2, 0),
(24, 6, 2, 'Tarde', 2, 0),
(25, 6, 3, 'Mañana', 2, 0),
(26, 6, 4, 'Tarde', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `Especialidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `Especialidad`) VALUES
(1, 'ciclo  basico'),
(2, 'Administracion'),
(3, 'Computacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL,
  `tipodeestado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstado`, `tipodeestado`) VALUES
(0, '0'),
(1, 'Activo'),
(2, 'Enfermo'),
(3, 'Excursion'),
(4, 'Viaje'),
(5, 'Pase de Escuela'),
(6, 'Tramite'),
(7, 'Otros'),
(8, 'Alumno borrado'),
(9, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `idEvento` int(11) NOT NULL,
  `tipoevento` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`idEvento`, `tipoevento`, `estado`) VALUES
(0, '0', 0),
(1, 'asistencia', NULL),
(2, 'ingreso tarde', NULL),
(3, 'Retiro anticipado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `id_especialidad` int(30) DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMateria`, `Nombre`, `id_especialidad`, `id_estado`, `id_usuario`) VALUES
(1, 'Adm. y Sist de Redes de Computadoras', 3, 1, 2),
(2, 'Análisis de Sistemas', 3, 9, 0),
(3, 'Base de Datos', 2, 0, 0),
(4, 'Biologia', 1, 0, 0),
(5, 'Ciencia Tec. Sociedad', 3, 0, 0),
(6, 'Computacion 3', 2, 0, 0),
(7, 'Computación Aplicada', 2, 0, 0),
(8, 'Computación aplicada 2', 2, 0, 0),
(9, 'Contabilidad 1', 2, 0, 0),
(10, 'Contabilidad 2', 2, 0, 0),
(11, 'Costos', 2, 0, 0),
(12, 'Ciudadanía y trabajo', 2, 1, 1),
(13, 'Derecho Social', 2, 1, 2),
(14, 'Desarrollo de sistemas', 3, 0, 0),
(15, 'Dirección y Adminitración de Personal', 2, 0, 0),
(16, 'Economía', 2, 0, 0),
(17, 'Ed. Ciudadana', 1, 0, 0),
(18, 'Ed. Ciudadana', 2, 0, 0),
(19, 'Ed. Ciudadana', 3, 0, 0),
(20, 'Educación Artística', 1, 0, 0),
(21, 'Física', 1, 0, 0),
(22, 'Física', 2, 0, 0),
(23, 'Física', 3, 0, 0),
(24, 'Formación Ética y Ciudadana', 3, 0, 0),
(25, 'Geografía', 1, 0, 0),
(26, 'Geografía', 2, 0, 0),
(27, 'Geografía', 3, 0, 0),
(28, 'Geografía E. Argentina', 2, 0, 0),
(29, 'Historia', 1, 0, 0),
(30, 'Historia', 2, 0, 0),
(31, 'Historia', 3, 0, 0),
(32, 'Historia de la industria y comercio', 2, 0, 0),
(33, 'Inglés', 1, 0, 0),
(34, 'Inglés tecnico', 2, 0, 0),
(35, 'Inglés tecnico', 3, 0, 0),
(36, 'Interpretación de Balances', 2, 0, 0),
(37, 'Introducción al derecho', 2, 0, 0),
(38, 'Investigación de Mercado', 2, 0, 0),
(39, 'Investigación y Análisis de Micro y Macro', 2, 0, 0),
(40, 'Lab. De algoritmo y estructura de datos', 3, 0, 0),
(41, 'Lab. de Programación orientada a objetos', 3, 0, 0),
(42, 'Lengua y literatura', 1, 0, 0),
(43, 'Lengua y literatura', 2, 0, 0),
(44, 'Lengua y literatura', 3, 0, 0),
(45, 'Lógica computacional', 3, 0, 0),
(46, 'Matemática', 1, 0, 0),
(47, 'Matemática', 2, 0, 0),
(48, 'Matemática', 3, 0, 0),
(49, 'Matemática financiera', 2, 0, 0),
(50, 'Nociones de Auditoria', 2, 0, 0),
(51, 'Organización de la Producción', 2, 0, 0),
(52, 'Organización de la Producción 2', 2, 0, 0),
(53, 'Organización de las computadoras', 3, 0, 0),
(54, 'Practicas profesionalizantes', 3, 0, 0),
(55, 'Programación sobre redes', 3, 0, 0),
(56, 'Proyecto Informático 1', 3, 0, 0),
(57, 'Proyecto Informático 2', 3, 0, 0),
(58, 'Psicología de las organizaciones', 2, 0, 0),
(59, 'Psicología industrial', 2, 0, 0),
(60, 'Química', 2, 0, 0),
(61, 'Química', 3, 0, 0),
(62, 'Química aplicada', 2, 0, 0),
(63, 'Redes', 3, 0, 0),
(64, 'Tec. Ban y Seguros', 2, 0, 0),
(65, 'Tecn. de Repres', 1, 0, 0),
(66, 'Tecn. de Repres', 2, 0, 0),
(67, 'Tecn. de Repres', 3, 0, 0),
(68, 'Técnica de la comercialización', 2, 0, 0),
(69, 'Teoría de la organización', 2, 0, 0),
(70, 'Teoria y Técnica Impositiva', 2, 0, 0),
(71, 'Nociones de Administracion Financiera', 2, 0, 0),
(72, 'Gestión de las organizaciones', 3, 0, 0);

--
-- Disparadores `materias`
--
DELIMITER $$
CREATE TRIGGER `ACTUALIZA_MATERIAS_BU` BEFORE UPDATE ON `materias` FOR EACH ROW INSERT INTO materias_actualizadas
(Anterior_Nombre, Anterior_idEspecialidad, Anterior_idEstado, Anterior_idUsuario, Nuevo_Nombre, Nuevo_idEspecialidad, Nuevo_idEstado, Nuevo_idUsuario, F_Modificacion)
VALUES (OLD.Nombre, OLD.id_especialidad, OLD.id_estado, OLD.id_usuario,
        NEW.Nombre, NEW.id_especialidad, NEW.id_estado, NEW.id_usuario, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasxcursos`
--

CREATE TABLE `materiasxcursos` (
  `idMateriaxCurso` int(11) NOT NULL,
  `id_Materia` int(11) DEFAULT NULL,
  `id_Curso` int(11) DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasxcursos`
--

INSERT INTO `materiasxcursos` (`idMateriaxCurso`, `id_Materia`, `id_Curso`, `id_estado`, `id_usuario`) VALUES
(1, 18, 11, 1, 2),
(2, 66, 11, 9, 0),
(3, 30, 11, 1, 5),
(4, 43, 11, 0, 0),
(5, 34, 11, 0, 0),
(6, 60, 11, 0, 0),
(7, 47, 11, 0, 0),
(8, 26, 11, 0, 0),
(9, 22, 11, 0, 0),
(10, 66, 12, 0, 0),
(11, 60, 12, 0, 0),
(12, 43, 12, 0, 0),
(13, 34, 12, 0, 0),
(14, 30, 12, 0, 0),
(15, 47, 12, 0, 0),
(16, 22, 12, 0, 0),
(17, 26, 12, 0, 0),
(18, 18, 13, 0, 0),
(19, 66, 13, 0, 0),
(20, 60, 13, 0, 0),
(21, 43, 13, 0, 0),
(22, 34, 13, 0, 0),
(23, 30, 13, 0, 0),
(24, 47, 13, 0, 0),
(25, 26, 13, 0, 0),
(26, 22, 13, 1, 0),
(27, 44, 14, 1, 0),
(28, 23, 14, 0, 0),
(29, 67, 14, 1, 0),
(30, 31, 14, 1, 0),
(31, 35, 14, 1, 0),
(32, 48, 14, 1, 1),
(33, 19, 14, 1, 1),
(34, 27, 14, 1, 1),
(35, 61, 14, 1, 1),
(36, 34, 15, 1, 2),
(37, 12, 15, 1, 2),
(38, 49, 15, 1, 2),
(39, 7, 15, 1, 0),
(40, 69, 15, 1, 0),
(41, 32, 15, 1, 0),
(42, 9, 15, 1, 0),
(43, 43, 15, 1, 0),
(44, 62, 15, 1, 0),
(45, 47, 15, 1, 0),
(46, 49, 16, 1, 0),
(47, 47, 16, 1, 0),
(48, 32, 16, 1, 0),
(49, 43, 16, 1, 0),
(50, 34, 16, 1, 0),
(51, 9, 16, 1, 0),
(52, 69, 16, 1, 0),
(53, 12, 16, 1, 0),
(54, 7, 16, 1, 0),
(55, 62, 16, 1, 0),
(56, 49, 17, 1, 0),
(57, 47, 17, 1, 0),
(58, 32, 17, 1, 0),
(59, 43, 17, 1, 0),
(60, 34, 17, 1, 0),
(61, 9, 17, 1, 0),
(62, 69, 17, 1, 0),
(63, 12, 17, 1, 0),
(64, 7, 17, 1, 0),
(65, 62, 17, 1, 0),
(66, 53, 18, 1, 0),
(67, 45, 18, 1, 0),
(68, 48, 18, 1, 0),
(69, 41, 18, 1, 0),
(70, 35, 18, 1, 0),
(71, 3, 18, 1, 0),
(72, 56, 18, 1, 0),
(73, 31, 18, 1, 0),
(74, 27, 18, 1, 0),
(75, 44, 18, 1, 0),
(76, 37, 19, 1, 0),
(77, 59, 19, 1, 0),
(78, 28, 19, 1, 0),
(79, 11, 19, 1, 0),
(80, 8, 19, 1, 0),
(81, 51, 19, 1, 0),
(82, 34, 19, 1, 0),
(83, 43, 19, 1, 0),
(84, 47, 19, 1, 0),
(85, 16, 19, 1, 0),
(86, 37, 21, 1, 0),
(87, 58, 21, 1, 0),
(88, 28, 21, 1, 0),
(89, 11, 21, 1, 0),
(90, 51, 21, 1, 0),
(91, 8, 21, 1, 0),
(92, 34, 21, 1, 0),
(93, 43, 21, 1, 0),
(94, 47, 21, 1, 0),
(95, 16, 21, 1, 0),
(96, 47, 21, 1, 0),
(97, 43, 21, 1, 0),
(98, 37, 21, 1, 0),
(99, 11, 21, 1, 0),
(100, 34, 21, 1, 0),
(101, 8, 21, 1, 0),
(102, 28, 21, 1, 0),
(103, 51, 21, 1, 0),
(104, 16, 21, 1, 0),
(105, 58, 21, 1, 0),
(106, 44, 22, 1, 0),
(107, 41, 22, 1, 0),
(108, 48, 22, 1, 0),
(109, 2, 22, 1, 0),
(110, 35, 22, 1, 0),
(111, 3, 22, 1, 0),
(112, 63, 22, 1, 0),
(113, 16, 22, 1, 0),
(114, 57, 22, 1, 0),
(115, 51, 23, 1, 0),
(116, 36, 23, 1, 0),
(117, 71, 23, 1, 0),
(118, 51, 23, 1, 0),
(119, 71, 23, 1, 0),
(120, 38, 23, 1, 0),
(121, 68, 23, 1, 0),
(122, 13, 23, 1, 0),
(123, 34, 23, 1, 0),
(124, 6, 23, 1, 0),
(125, 11, 23, 1, 0),
(126, 39, 23, 1, 0),
(127, 15, 23, 1, 0),
(128, 59, 23, 1, 0),
(129, 64, 23, 1, 0),
(130, 36, 24, 1, 0),
(131, 11, 24, 1, 0),
(132, 15, 24, 1, 0),
(133, 68, 24, 1, 0),
(134, 71, 24, 1, 0),
(135, 51, 24, 1, 0),
(136, 34, 24, 1, 0),
(137, 6, 24, 1, 0),
(138, 52, 24, 1, 0),
(139, 39, 24, 1, 0),
(140, 13, 24, 1, 0),
(141, 59, 24, 1, 0),
(142, 64, 24, 1, 0),
(143, 38, 24, 1, 0),
(144, 51, 25, 1, 0),
(145, 71, 25, 1, 0),
(146, 36, 25, 1, 0),
(147, 13, 25, 1, 0),
(148, 34, 25, 1, 0),
(149, 68, 25, 1, 0),
(150, 38, 25, 1, 0),
(151, 52, 25, 1, 0),
(152, 6, 25, 1, 0),
(153, 11, 25, 1, 0),
(154, 39, 25, 1, 0),
(155, 15, 25, 1, 0),
(156, 71, 25, 1, 0),
(157, 59, 25, 1, 0),
(158, 64, 25, 1, 0),
(159, 14, 26, 1, 0),
(160, 55, 26, 1, 0),
(161, 48, 26, 1, 0),
(162, 1, 26, 1, 0),
(163, 35, 26, 1, 0),
(164, 5, 26, 1, 0),
(165, 24, 26, 1, 0),
(166, 54, 26, 1, 0),
(167, 72, 26, 1, 0);

--
-- Disparadores `materiasxcursos`
--
DELIMITER $$
CREATE TRIGGER `Actualiza_MateriaxCurso_BU` BEFORE UPDATE ON `materiasxcursos` FOR EACH ROW INSERT INTO materiasxcursos_actualizadas
(Anterior_idMateria, Anterior_idCurso, Anterior_idEstado, Anterior_idUsuario, Nuevo_idMateria,Nuevo_idCurso,Nuevo_idEstado,Nuevo_idUsuario,F_Modificacion)
VALUES (OLD.id_Materia, OLD.id_Curso, OLD.id_estado, OLD.id_usuario,
        NEW.id_Materia, NEW.id_Curso, NEW.id_estado, NEW.id_usuario, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasxcursos_actualizadas`
--

CREATE TABLE `materiasxcursos_actualizadas` (
  `Anterior_idMateria` int(11) DEFAULT NULL,
  `Anterior_idCurso` int(11) DEFAULT NULL,
  `Anterior_idEstado` int(11) DEFAULT NULL,
  `Anterior_idUsuario` int(11) DEFAULT NULL,
  `Nuevo_idMateria` int(11) DEFAULT NULL,
  `Nuevo_idCurso` int(11) DEFAULT NULL,
  `Nuevo_idEstado` int(11) DEFAULT NULL,
  `Nuevo_idUsuario` int(11) DEFAULT NULL,
  `F_Modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasxcursos_actualizadas`
--

INSERT INTO `materiasxcursos_actualizadas` (`Anterior_idMateria`, `Anterior_idCurso`, `Anterior_idEstado`, `Anterior_idUsuario`, `Nuevo_idMateria`, `Nuevo_idCurso`, `Nuevo_idEstado`, `Nuevo_idUsuario`, `F_Modificacion`) VALUES
(1, 3, 0, 0, 2, 4, 1, 5, '2019-10-05'),
(1, 1, 9, 2, 18, 11, 1, 2, '2019-10-10'),
(1, 2, 9, 0, 66, 11, 9, 0, '2019-10-10'),
(2, 4, 1, 5, 30, 11, 1, 5, '2019-10-10'),
(1, 4, 0, 0, 43, 11, 0, 0, '2019-10-10'),
(2, 3, 0, 0, 34, 11, 0, 0, '2019-10-10'),
(1, 25, 0, 0, 60, 11, 0, 0, '2019-10-10'),
(60, 11, 0, 0, 67, 12, 0, 0, '2019-10-14'),
(67, 12, 0, 0, 66, 12, 0, 0, '2019-10-14'),
(6, 22, 0, 0, 60, 12, 0, 0, '2019-10-14'),
(5, 16, 0, 0, 43, 12, 0, 0, '2019-10-14'),
(3, 12, 0, 0, 34, 12, 0, 0, '2019-10-14'),
(4, 24, 0, 0, 30, 12, 0, 0, '2019-10-14'),
(1, 23, 0, 0, 47, 12, 0, 0, '2019-10-14'),
(6, 13, 0, 0, 22, 12, 0, 0, '2019-10-14'),
(2, 15, 0, 0, 26, 12, 0, 0, '2019-10-14'),
(3, 5, 0, 0, 18, 13, 0, 0, '2019-10-14'),
(2, 8, 0, 0, 66, 13, 0, 0, '2019-10-14'),
(66, 13, 0, 0, 60, 13, 0, 0, '2019-10-14'),
(6, 7, 0, 0, 66, 13, 0, 0, '2019-10-14'),
(1, 9, 0, 0, 43, 13, 0, 0, '2019-10-14'),
(5, 10, 0, 0, 34, 13, 0, 0, '2019-10-14'),
(3, 11, 0, 0, 30, 13, 0, 0, '2019-10-14'),
(3, 14, 0, 0, 47, 13, 0, 0, '2019-10-14'),
(5, 17, 0, 0, 26, 13, 0, 0, '2019-10-14'),
(3, 18, 0, 0, 22, 13, 1, 0, '2019-10-14'),
(4, 19, 0, 0, 44, 14, 1, 0, '2019-10-14'),
(6, 20, 0, 0, 23, 14, 0, 0, '2019-10-14'),
(3, 21, 0, 0, 35, 14, 1, 0, '2019-10-14'),
(NULL, NULL, 0, 1, 48, 14, 0, 1, '2019-10-14'),
(NULL, NULL, 0, 1, 19, 14, 0, 1, '2019-10-14'),
(48, 14, 0, 1, 48, 14, 1, 1, '2019-10-14'),
(19, 14, 0, 1, 19, 14, 1, 1, '2019-10-14'),
(NULL, NULL, 0, 1, 27, 14, 1, 1, '2019-10-14'),
(NULL, NULL, 0, 1, 61, 14, 1, 1, '2019-10-14'),
(NULL, NULL, 0, 2, 34, 15, 1, 2, '2019-10-14'),
(NULL, NULL, 0, 2, 12, 15, 1, 2, '2019-10-14'),
(NULL, NULL, 0, 2, 49, 15, 1, 2, '2019-10-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_actualizadas`
--

CREATE TABLE `materias_actualizadas` (
  `Anterior_Nombre` varchar(100) DEFAULT NULL,
  `Anterior_idEspecialidad` int(30) DEFAULT NULL,
  `Anterior_idEstado` int(11) DEFAULT NULL,
  `Anterior_idUsuario` int(11) DEFAULT NULL,
  `Nuevo_Nombre` varchar(100) DEFAULT NULL,
  `Nuevo_idEspecialidad` int(30) DEFAULT NULL,
  `Nuevo_idEstado` int(11) DEFAULT NULL,
  `Nuevo_idUsuario` int(11) DEFAULT NULL,
  `F_Modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materias_actualizadas`
--

INSERT INTO `materias_actualizadas` (`Anterior_Nombre`, `Anterior_idEspecialidad`, `Anterior_idEstado`, `Anterior_idUsuario`, `Nuevo_Nombre`, `Nuevo_idEspecialidad`, `Nuevo_idEstado`, `Nuevo_idUsuario`, `F_Modificacion`) VALUES
('perro', 2, 1, 2, 'NEGRO', 1, 3, 1, '2019-10-05'),
('matematica', 3, 9, 2, 'marito', 3, 1, 2, '2019-10-07'),
('', 1, 1, 2, 'Xde', 1, 1, 2, '2019-10-07'),
('marito', 3, 1, 2, 'Adm. y Sist de Redes de Computadoras', 3, 1, 2, '2019-10-10'),
('ingles tec', 3, 9, 0, 'Análisis de Sistemas', 3, 9, 0, '2019-10-10'),
('analisis de sistema estructurado', 2, 0, 0, 'Base de Datos', 2, 0, 0, '2019-10-10'),
('programacion en redes', 3, 0, 0, 'Biologia', 1, 0, 0, '2019-10-10'),
('redes', 3, 0, 0, 'Ciencia Tec. Sociedad', 3, 0, 0, '2019-10-10'),
('practicas profesionalisantes', 3, 0, 0, 'Computacion', 3, 0, 0, '2019-10-10'),
('Computacion', 3, 0, 0, 'Computacion 3', 3, 0, 0, '2019-10-10'),
('Computacion 3', 3, 0, 0, 'Computacion 3', 2, 0, 0, '2019-10-10'),
('sociedad y estado', 3, 0, 0, 'Computación Aplicada', 2, 0, 0, '2019-10-10'),
('ciencia y tecnologia', 3, 0, 0, 'Computación aplicada 2\'', 2, 0, 0, '2019-10-10'),
('ed fiscia', 3, 0, 0, 'Contabilidad 1', 2, 0, 0, '2019-10-10'),
('gestion de procesos productivos', 3, 0, 0, 'Contabilidad 2', 2, 0, 0, '2019-10-10'),
('dibujo', 2, 0, 0, 'Costos', 2, 0, 0, '2019-10-10'),
('NEGRO', 1, 3, 1, 'Ciudadanía y trabajo', 2, 1, 1, '2019-10-10'),
('Xde', 1, 1, 2, 'Derecho Social', 2, 1, 2, '2019-10-10'),
('Computación aplicada 2\'', 2, 0, 0, 'Computación aplicada 2', 2, 0, 0, '2019-10-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificaciones`
--

CREATE TABLE `modificaciones` (
  `idModificacion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaModificacion` varchar(10) NOT NULL,
  `horaModificacion` time NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `tipomodificacion` varchar(45) DEFAULT NULL,
  `idSeguimiento` int(11) NOT NULL,
  `idMotivo` int(11) NOT NULL,
  `idSubmotivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modificaciones`
--

INSERT INTO `modificaciones` (`idModificacion`, `idUsuario`, `fechaModificacion`, `horaModificacion`, `estado`, `tipomodificacion`, `idSeguimiento`, `idMotivo`, `idSubmotivo`) VALUES
(16, 2, '2018-11-02', '14:58:30', NULL, 'Eliminacion de alumno', 0, 0, 0),
(17, 1, '2018-11-02', '14:59:59', NULL, 'Eliminacion de alumno', 0, 0, 0),
(18, 4, '2018-11-02', '15:35:03', NULL, 'Insercion de Usuario', 0, 0, 0),
(19, 4, '2018-11-02', '15:51:49', NULL, 'Modificacion de Usuario', 0, 0, 0),
(20, 0, '2018-11-02', '17:14:06', NULL, 'Modificacion de alumno', 0, 0, 0),
(21, 1, '2018-11-02', '19:35:57', NULL, 'Modificacion de alumno por curso', 0, 0, 0),
(22, 1, '2018-11-02', '19:45:08', NULL, 'Reincorporacion del alumno', 0, 0, 0),
(23, 4, '2018-11-02', '19:50:47', NULL, 'Eliminacion de Usuario', 0, 0, 0),
(24, 1, '2018-11-02', '19:52:07', NULL, 'Modificacion de Justificacion', 0, 0, 0),
(25, 1, '2018-11-02', '19:55:11', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(26, 8, '2018-11-04', '11:49:10', NULL, 'Modificacion de asistencia', 0, 0, 0),
(27, 8, '2018-11-04', '11:51:41', NULL, 'Modificacion de alumno', 0, 0, 0),
(28, 8, '2018-11-04', '11:52:47', NULL, 'Modificacion de alumno por curso', 0, 0, 0),
(29, 8, '2018-11-04', '11:54:33', NULL, 'Modificacion de alumno por curso', 0, 0, 0),
(30, 8, '2018-11-04', '11:56:17', NULL, 'Modificacion de Usuario', 0, 0, 0),
(31, 8, '2018-11-04', '11:57:13', 0, 'Modificacion de Justificacion', 0, 0, 0),
(32, 1, '2018-11-05', '16:16:40', 1, 'Modificacion de asistencia', 1, 1, 1),
(33, 1, '2018-11-09', '15:47:51', NULL, 'Eliminacion de alumno', 0, 0, 0),
(34, 1, '2018-11-09', '15:49:54', NULL, 'Insercion de Usuario', 0, 0, 0),
(35, 1, '2018-11-09', '15:52:55', NULL, 'Modificacion de Usuario', 0, 0, 0),
(36, 2, '2018-11-09', '15:53:44', NULL, 'Modificacion de Usuario', 0, 0, 0),
(37, 1, '2018-11-09', '16:06:38', NULL, 'Eliminacion de Usuario', 0, 0, 0),
(38, 1, '2018-11-11', '15:32:48', NULL, 'Modificacion de asistencia en el retiro antic', 2, 0, 0),
(39, 1, '2018-11-13', '16:06:50', NULL, 'Modificacion de asistencia por retiro anticip', 1, 0, 0),
(40, 1, '2018-11-14', '15:23:51', NULL, 'Modificacion de alumno por curso', 0, 0, 0),
(41, 1, '2018-11-14', '15:28:33', NULL, 'Modificacion de alumno por curso', 0, 0, 0),
(42, 10, '2018-12-03', '11:30:07', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(43, 10, '2018-12-03', '11:39:44', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(44, 10, '2018-12-03', '11:52:28', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(45, 10, '2018-12-03', '11:52:34', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(46, 10, '2018-12-03', '12:02:40', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(47, 10, '2018-12-03', '12:03:36', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(48, 10, '2018-12-03', '12:03:52', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(49, 10, '2018-12-03', '12:04:25', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(50, 10, '2018-12-03', '12:04:35', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(51, 10, '2018-12-03', '12:14:21', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(52, 10, '2018-12-03', '12:14:42', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(53, 10, '2018-12-03', '12:18:51', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(54, 10, '2018-12-03', '12:19:05', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(55, 10, '2018-12-03', '12:21:44', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(56, 10, '2018-12-03', '12:25:28', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(57, 10, '2018-12-03', '12:29:56', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(58, 10, '2018-12-03', '12:34:38', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(59, 10, '2018-12-03', '20:55:43', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(60, 10, '2018-12-03', '21:03:20', NULL, 'Reincorporacion del alumno', 0, 0, 0),
(61, 10, '2018-12-03', '23:13:32', NULL, 'Eliminacion de motivo', 0, 0, 0),
(62, 10, '2018-12-04', '00:57:27', NULL, 'Modificacion de Justificacion', 0, 0, 0),
(63, 10, '2018-12-04', '01:07:42', NULL, 'Modificacion de Motivo', 0, 0, 0),
(64, 10, '2018-12-04', '01:09:34', NULL, 'Modificacion de Motivo', 0, 0, 0),
(65, 10, '2018-12-04', '01:09:53', NULL, 'Modificacion de Motivo', 0, 0, 0),
(66, 10, '2018-12-04', '01:10:10', NULL, 'Modificacion de Motivo', 0, 0, 0),
(67, 10, '2018-12-04', '01:10:36', NULL, 'Modificacion de Motivo', 0, 0, 0),
(68, 10, '2018-12-04', '01:19:28', NULL, 'Modificacion de Motivo', 0, 0, 0),
(69, 10, '2018-12-04', '01:19:50', NULL, 'Modificacion de Motivo', 0, 0, 0),
(70, 10, '2018-12-04', '01:22:35', NULL, 'Modificacion de Motivo', 0, 0, 0),
(71, 10, '2018-12-04', '01:22:49', NULL, 'Modificacion de Motivo', 0, 0, 0),
(72, 10, '2018-12-04', '01:23:04', NULL, 'Modificacion de Motivo', 0, 0, 0),
(73, 10, '2018-12-04', '01:23:17', NULL, 'Modificacion de Motivo', 0, 0, 0),
(74, 10, '2018-12-04', '01:31:53', NULL, 'Modificacion de Motivo', 0, 0, 0),
(75, 10, '2018-12-04', '01:32:11', NULL, 'Modificacion de Motivo', 0, 0, 0),
(76, 10, '2018-12-04', '01:32:34', NULL, 'Modificacion de Motivo', 0, 0, 0),
(77, 10, '2018-12-04', '01:32:49', NULL, 'Modificacion de Motivo', 0, 0, 0),
(78, 10, '2018-12-04', '01:33:02', NULL, 'Modificacion de Motivo', 0, 0, 0),
(79, 10, '2018-12-04', '01:33:18', NULL, 'Modificacion de Motivo', 0, 0, 0),
(80, 10, '2018-12-04', '01:33:27', NULL, 'Modificacion de Motivo', 0, 0, 0),
(81, 10, '2018-12-04', '01:33:38', NULL, 'Modificacion de Motivo', 0, 0, 0),
(82, 10, '2018-12-04', '01:35:40', NULL, 'Modificacion de Motivo', 0, 0, 0),
(83, 1, '2018-12-04', '01:37:52', NULL, 'Modificacion de Motivo', 0, 0, 0),
(84, 10, '2018-12-04', '01:42:50', NULL, 'Modificacion de Motivo', 0, 0, 0),
(85, 10, '2018-12-04', '01:43:02', NULL, 'Modificacion de Motivo', 0, 0, 0),
(86, 10, '2018-12-04', '01:43:14', NULL, 'Modificacion de Motivo', 0, 0, 0),
(87, 10, '2018-12-04', '01:43:27', NULL, 'Modificacion de Motivo', 0, 0, 0),
(88, 10, '2018-12-04', '01:44:02', NULL, 'Modificacion de Motivo', 0, 0, 0),
(89, 10, '2018-12-04', '01:44:15', NULL, 'Modificacion de Motivo', 0, 0, 0),
(90, 10, '2018-12-04', '01:44:25', NULL, 'Modificacion de Motivo', 0, 0, 0),
(91, 10, '2018-12-04', '01:45:49', NULL, 'Modificacion de Motivo', 0, 0, 0),
(92, 10, '2018-12-04', '01:45:59', NULL, 'Modificacion de Motivo', 0, 0, 0),
(93, 10, '2018-12-04', '01:46:06', NULL, 'Modificacion de Motivo', 0, 0, 0),
(94, 10, '2018-12-04', '01:47:02', NULL, 'Modificacion de Motivo', 0, 0, 0),
(95, 10, '2018-12-04', '01:47:10', NULL, 'Modificacion de Motivo', 0, 0, 0),
(96, 6, '2018-12-04', '01:48:34', NULL, 'Modificacion de Motivo', 0, 0, 0),
(97, 10, '2018-12-04', '08:19:29', NULL, 'Modificacion de Motivo', 0, 0, 0),
(98, 10, '2018-12-04', '08:19:50', NULL, 'Modificacion de Motivo', 0, 0, 0),
(99, 10, '2018-12-04', '08:20:04', NULL, 'Modificacion de Motivo', 0, 0, 0),
(100, 10, '2018-12-04', '08:21:22', NULL, 'Modificacion de Motivo', 0, 0, 0),
(101, 10, '2018-12-04', '08:21:30', NULL, 'Modificacion de Motivo', 0, 0, 0),
(102, 10, '2018-12-04', '08:21:50', NULL, 'Modificacion de Motivo', 0, 0, 0),
(103, 10, '2018-12-04', '08:21:59', NULL, 'Modificacion de Motivo', 0, 0, 0),
(104, 10, '2018-12-04', '09:05:28', NULL, 'Modificacion de Motivo', 0, 0, 0),
(105, 10, '2018-12-04', '09:05:49', NULL, 'Modificacion de Motivo', 0, 0, 0),
(106, 10, '2018-12-04', '09:34:11', NULL, 'Modificacion de Motivo', 0, 0, 0),
(107, 10, '2018-12-04', '09:34:28', NULL, 'Modificacion de Motivo', 0, 0, 0),
(108, 10, '2018-12-04', '09:35:35', NULL, 'Modificacion de Motivo', 0, 0, 0),
(109, 10, '2018-12-04', '09:35:51', NULL, 'Modificacion de Motivo', 0, 0, 0),
(110, 10, '2018-12-04', '09:36:02', NULL, 'Modificacion de Motivo', 0, 0, 0),
(111, 10, '2018-12-04', '09:51:41', NULL, 'Modificacion de Motivo', 0, 0, 0),
(112, 10, '2018-12-04', '09:51:54', NULL, 'Modificacion de Motivo', 0, 0, 0),
(113, 10, '2018-12-04', '14:57:16', NULL, 'Modificacion de Motivo', 0, 0, 0),
(114, 10, '2018-12-04', '14:57:31', NULL, 'Modificacion de Motivo', 0, 0, 0),
(115, 10, '2018-12-04', '15:43:34', NULL, 'Modificacion de Motivo', 0, 0, 0),
(116, 10, '2018-12-04', '15:43:47', NULL, 'Modificacion de Motivo', 0, 0, 0),
(117, 10, '2018-12-04', '15:44:08', NULL, 'Modificacion de Motivo', 0, 0, 0),
(118, 10, '2018-12-04', '16:00:38', 1, 'Modificacion de asistencia', 3527, 6, 2),
(119, 10, '2018-12-04', '17:06:01', NULL, 'Modificacion de Motivo', 0, 0, 0),
(120, 10, '2018-12-04', '17:06:16', NULL, 'Modificacion de Motivo', 0, 0, 0),
(121, 10, '2018-12-04', '17:06:34', NULL, 'Eliminacion de motivo', 0, 0, 0),
(122, 10, '2018-12-04', '17:07:00', NULL, 'Modificacion de Motivo', 0, 0, 0),
(123, 10, '2018-12-04', '17:07:14', NULL, 'Modificacion de Motivo', 0, 0, 0),
(124, 10, '2018-12-04', '17:16:07', NULL, 'Modificacion de Motivo', 0, 0, 0),
(125, 10, '2018-12-04', '17:16:30', NULL, 'Modificacion de Motivo', 0, 0, 0),
(126, 10, '2018-12-04', '17:16:40', NULL, 'Modificacion de Motivo', 0, 0, 0),
(127, 10, '2018-12-04', '17:26:46', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(128, 10, '2018-12-04', '17:27:53', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(129, 10, '2018-12-04', '17:29:02', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(130, 10, '2018-12-04', '17:29:12', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(131, 10, '2018-12-12', '18:10:35', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(132, 10, '2018-12-12', '18:13:50', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(133, 10, '2018-12-12', '18:53:46', NULL, 'Impresion de Reincorporacion', 0, 0, 0),
(134, 10, '2019-10-17', '13:31:01', NULL, 'Eliminacion de alumno', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivos`
--

CREATE TABLE `motivos` (
  `idMotivo` int(11) NOT NULL,
  `asistencia` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL,
  `computableNoComputable` int(11) NOT NULL,
  `valorAsistencia` float NOT NULL,
  `idSubmotivo` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `estado` int(1) DEFAULT NULL,
  `Observacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `motivos`
--

INSERT INTO `motivos` (`idMotivo`, `asistencia`, `Descripcion`, `computableNoComputable`, `valorAsistencia`, `idSubmotivo`, `idEvento`, `estado`, `Observacion`) VALUES
(0, '0', '', 0, 0, 0, 0, 0, ''),
(1, 'Presente', 'P', 1, 0, 1, 1, 1, ''),
(2, 'Tarde', '', 1, 0.25, 1, 2, 1, ''),
(3, 'Ausente', 'A', 1, 1, 1, 1, 1, ''),
(4, 'Ausente con presencia', 'AP', 1, 0.5, 1, 1, 1, ''),
(5, 'Presente', '', 1, 0, 2, 1, 1, ''),
(6, 'Tarde', '', 1, 0.25, 2, 2, 1, ''),
(7, 'Ausente', '', 1, 0.5, 2, 1, 1, ''),
(8, 'Ausente con precencia', '', 1, 0.5, 2, 1, 1, ''),
(9, 'Presente', '', 1, 0, 3, 1, 1, ''),
(10, 'Tarde', '', 1, 0.25, 3, 2, 1, ''),
(11, 'Ausente', '', 1, 0.5, 3, 1, 1, ''),
(12, 'Ausente con presencia ', '', 1, 0.5, 3, 1, 1, ''),
(13, 'retiro anticipado', '', 1, 0, 1, 3, 1, ''),
(14, 'retiro antipicado aus', '', 1, 0.5, 1, 3, 1, ''),
(15, 'aus . 0,5', '', 1, 0.5, 1, 1, 1, ''),
(22, 'Presente-Tarde', 'PT', 1, 0.15, 2, 2, 1, ''),
(23, 'Presente-Ausente', 'PA', 1, 1, 2, 3, 0, 'lol'),
(24, 'Retiro', 'RT', 1, 0, 1, 3, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_notas` int(11) NOT NULL,
  `id_ciclolectivo` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_alumnxcurso` int(11) NOT NULL,
  `id_materiaxcurso` int(11) NOT NULL,
  `id_trimestrenota` int(11) NOT NULL,
  `Calificacion` int(10) DEFAULT NULL,
  `id_profxmatexcurso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_estado` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `id_ciclolectivo`, `id_curso`, `id_alumnxcurso`, `id_materiaxcurso`, `id_trimestrenota`, `Calificacion`, `id_profxmatexcurso`, `id_usuario`, `id_estado`) VALUES
(1, 2019, 26, 10, 159, 1, 9, 1, 9, 1),
(2, 2019, 26, 11, 159, 1, 7, 1, 9, 1),
(3, 2019, 26, 12, 159, 1, 6, 1, 9, 1),
(4, 2019, 26, 13, 159, 1, 4, 1, 9, 1),
(5, 2019, 26, 14, 159, 1, 6, 1, 9, 1),
(6, 2019, 26, 15, 159, 1, 9, 1, 9, 1),
(7, 2019, 26, 16, 159, 1, 5, 1, 9, 1),
(8, 2019, 26, 17, 159, 1, 10, 1, 9, 1),
(9, 2019, 26, 10, 160, 1, 10, 2, 9, 1),
(10, 2019, 26, 11, 160, 1, 2, 2, 9, 1),
(11, 2019, 26, 12, 160, 1, 8, 2, 9, 1),
(12, 2019, 26, 13, 160, 1, 7, 2, 9, 1),
(13, 2019, 26, 14, 160, 1, 6, 2, 9, 1),
(14, 2019, 26, 15, 160, 1, 4, 2, 9, 1),
(15, 2019, 26, 16, 160, 1, 9, 2, 9, 1),
(16, 2019, 26, 10, 161, 1, 6, 3, 9, 1),
(17, 2019, 26, 11, 161, 1, 7, 3, 9, 1),
(18, 2019, 26, 12, 161, 1, 7, 3, 9, 1),
(19, 2019, 26, 13, 161, 1, 4, 3, 9, 1),
(20, 2019, 26, 14, 161, 1, 8, 3, 9, 1),
(21, 2019, 26, 15, 161, 1, 7, 3, 9, 1),
(22, 2019, 26, 16, 161, 1, 10, 3, 9, 1),
(23, 2019, 26, 10, 162, 1, 8, 4, 9, 1),
(24, 2019, 26, 11, 162, 1, 8, 4, 9, 1),
(25, 2019, 26, 12, 162, 1, 6, 4, 9, 1),
(26, 2019, 26, 13, 162, 1, 10, 4, 9, 0),
(27, 2019, 26, 14, 162, 1, 6, 4, 9, 1),
(28, 2019, 26, 15, 162, 1, 5, 4, 9, 1),
(29, 2019, 26, 16, 162, 1, 6, 4, 9, 1),
(30, 2019, 26, 10, 163, 1, 6, 5, 9, 1),
(31, 2019, 26, 11, 163, 1, 7, 5, 9, 1),
(32, 2019, 26, 12, 163, 1, 9, 5, 9, 1),
(33, 2019, 26, 13, 163, 1, 5, 5, 9, 1),
(34, 2019, 26, 14, 163, 1, 8, 5, 9, 1),
(35, 2019, 26, 15, 163, 1, 7, 5, 9, 1),
(36, 2019, 26, 16, 163, 1, 7, 5, 9, 1),
(37, 2019, 26, 10, 164, 1, 5, 6, 9, 1),
(38, 2019, 26, 11, 164, 1, 10, 6, 9, 1),
(39, 2019, 26, 12, 164, 1, 7, 6, 9, 1),
(40, 2019, 26, 13, 164, 1, 8, 6, 9, 1),
(41, 2019, 26, 14, 164, 1, 6, 6, 9, 1),
(42, 2019, 26, 15, 164, 1, 5, 6, 9, 1),
(43, 2019, 26, 16, 164, 1, 8, 6, 9, 1),
(44, 2019, 26, 10, 165, 1, 9, 7, 9, 1),
(45, 2019, 26, 11, 165, 1, 10, 7, 9, 1),
(46, 2019, 26, 12, 165, 1, 8, 7, 9, 1),
(47, 2019, 26, 13, 165, 1, 7, 7, 9, 1),
(48, 2019, 26, 14, 165, 1, 6, 7, 9, 1),
(49, 2019, 26, 15, 165, 1, 5, 7, 9, 1),
(50, 2019, 26, 16, 165, 1, 9, 7, 9, 1),
(51, 2019, 26, 10, 166, 1, 10, 8, 9, 1),
(52, 2019, 26, 11, 166, 1, 8, 8, 9, 1),
(53, 2019, 26, 12, 166, 1, 7, 8, 9, 1),
(54, 2019, 26, 13, 166, 1, 8, 8, 9, 1),
(55, 2019, 26, 14, 166, 1, 6, 8, 9, 1),
(56, 2019, 26, 15, 166, 1, 5, 8, 9, 1),
(57, 2019, 26, 16, 166, 1, 8, 8, 9, 1),
(58, 2019, 26, 10, 167, 1, 0, 9, 9, 1),
(59, 2019, 26, 11, 167, 1, 7, 9, 9, 1),
(60, 2019, 26, 12, 167, 1, 3, 9, 9, 1),
(61, 2019, 26, 13, 167, 1, 6, 9, 9, 1),
(62, 2019, 26, 14, 167, 1, 8, 9, 9, 1),
(63, 2019, 26, 15, 167, 1, 0, 9, 9, 1),
(64, 2019, 26, 16, 167, 1, 8, 9, 9, 1),
(65, 2019, 26, 17, 167, 1, 10, 4, 1, 1),
(66, 2019, 26, 10, 161, 2, 5, 3, 9, 1),
(67, 2019, 26, 11, 161, 2, 6, 3, 9, 1),
(68, 2019, 26, 12, 161, 2, 10, 3, 9, 1),
(69, 2019, 26, 13, 161, 2, 10, 3, 9, 1),
(70, 2019, 26, 14, 161, 2, 9, 3, 9, 1),
(71, 2019, 26, 15, 161, 2, 4, 3, 9, 1),
(72, 2019, 26, 16, 161, 2, 6, 3, 9, 1),
(73, 2019, 26, 10, 161, 3, 5, 3, 9, 1),
(74, 2019, 26, 11, 161, 3, 6, 3, 9, 1),
(75, 2019, 26, 12, 161, 3, 10, 3, 9, 1),
(76, 2019, 26, 13, 161, 3, 10, 3, 9, 1),
(77, 2019, 26, 14, 161, 3, 9, 3, 9, 1),
(78, 2019, 26, 15, 161, 3, 4, 3, 9, 1),
(79, 2019, 26, 16, 161, 3, 6, 3, 9, 1),
(81, 2019, 26, 10, 159, 2, 9, 1, 9, 1),
(82, 2019, 26, 11, 159, 2, 6, 1, 9, 1),
(83, 2019, 26, 12, 159, 2, 8, 1, 9, 1),
(84, 2019, 26, 13, 159, 2, 5, 1, 9, 1),
(85, 2019, 26, 14, 159, 2, 10, 1, 9, 1),
(86, 2019, 26, 15, 159, 2, 3, 1, 9, 1),
(87, 2019, 26, 16, 159, 2, 6, 1, 9, 1),
(88, 2019, 26, 17, 159, 2, 8, 1, 9, 1),
(89, 2019, 26, 10, 160, 2, 5, 2, 9, 1),
(90, 2019, 26, 11, 160, 2, 6, 2, 9, 1),
(91, 2019, 26, 12, 160, 2, 7, 2, 9, 1),
(92, 2019, 26, 13, 160, 2, 8, 2, 9, 1),
(93, 2019, 26, 14, 160, 2, 4, 2, 9, 1),
(94, 2019, 26, 15, 160, 2, 9, 2, 9, 1),
(95, 2019, 26, 16, 160, 2, 10, 2, 9, 1),
(96, 2019, 26, 17, 160, 2, 8, 2, 9, 1),
(97, 2019, 26, 10, 161, 2, 6, 3, 9, 1),
(98, 2019, 26, 11, 161, 2, 7, 3, 9, 1),
(99, 2019, 26, 12, 161, 2, 8, 3, 9, 1),
(100, 2019, 26, 13, 161, 2, 9, 3, 9, 1),
(101, 2019, 26, 14, 161, 2, 8, 3, 9, 1),
(102, 2019, 26, 15, 161, 2, 10, 3, 9, 1),
(103, 2019, 26, 16, 161, 2, 10, 3, 9, 1),
(104, 2019, 26, 17, 161, 2, 5, 3, 9, 1),
(105, 2019, 26, 10, 162, 2, 8, 4, 9, 1),
(106, 2019, 26, 11, 162, 2, 7, 4, 9, 1),
(107, 2019, 26, 12, 162, 2, 6, 4, 9, 1),
(108, 2019, 26, 13, 162, 2, 9, 4, 9, 1),
(109, 2019, 26, 14, 162, 2, 5, 4, 9, 1),
(110, 2019, 26, 15, 162, 2, 7, 4, 9, 1),
(111, 2019, 26, 16, 162, 2, 8, 4, 9, 1),
(112, 2019, 26, 17, 162, 2, 5, 4, 9, 1),
(113, 2019, 26, 10, 163, 2, 8, 5, 9, 1),
(114, 2019, 26, 11, 163, 2, 7, 5, 9, 1),
(115, 2019, 26, 12, 163, 2, 6, 5, 9, 1),
(116, 2019, 26, 13, 163, 2, 9, 5, 9, 1),
(117, 2019, 26, 14, 163, 2, 8, 5, 9, 1),
(118, 2019, 26, 15, 163, 2, 7, 5, 9, 1),
(119, 2019, 26, 16, 163, 2, 6, 5, 9, 1),
(120, 2019, 26, 17, 163, 2, 6, 5, 9, 1),
(121, 2019, 26, 10, 164, 2, 9, 6, 9, 1),
(122, 2019, 26, 11, 164, 2, 10, 6, 9, 1),
(123, 2019, 26, 12, 164, 2, 8, 6, 9, 1),
(124, 2019, 26, 13, 164, 2, 6, 6, 9, 1),
(125, 2019, 26, 14, 164, 2, 9, 6, 9, 1),
(126, 2019, 26, 15, 164, 2, 5, 6, 9, 1),
(127, 2019, 26, 16, 164, 2, 5, 6, 9, 1),
(128, 2019, 26, 17, 164, 2, 8, 6, 9, 1),
(129, 2019, 26, 10, 165, 2, 5, 7, 9, 1),
(130, 2019, 26, 11, 165, 2, 6, 7, 9, 1),
(131, 2019, 26, 12, 165, 2, 7, 7, 9, 1),
(132, 2019, 26, 13, 165, 2, 8, 7, 9, 1),
(133, 2019, 26, 14, 165, 2, 4, 7, 9, 1),
(134, 2019, 26, 15, 165, 2, 9, 7, 9, 1),
(135, 2019, 26, 16, 165, 2, 10, 7, 9, 1),
(136, 2019, 26, 17, 165, 2, 8, 7, 9, 1),
(137, 2019, 26, 10, 166, 2, 9, 8, 9, 1),
(138, 2019, 26, 11, 156, 2, 6, 8, 9, 1),
(139, 2019, 26, 12, 156, 2, 7, 8, 9, 1),
(140, 2019, 26, 13, 166, 2, 5, 8, 9, 1),
(141, 2019, 26, 14, 166, 2, 8, 8, 9, 1),
(142, 2019, 26, 15, 166, 2, 5, 8, 9, 1),
(143, 2019, 26, 16, 166, 2, 4, 8, 9, 1),
(144, 2019, 26, 17, 166, 2, 8, 8, 9, 1),
(145, 2019, 26, 10, 167, 2, 8, 9, 9, 1),
(146, 2019, 26, 11, 167, 2, 7, 9, 9, 1),
(147, 2019, 26, 12, 167, 2, 5, 9, 9, 1),
(148, 2019, 26, 13, 167, 2, 9, 9, 9, 1),
(149, 2019, 26, 14, 167, 2, 10, 9, 9, 1),
(150, 2019, 26, 15, 167, 2, 6, 9, 9, 1),
(151, 2019, 26, 16, 167, 2, 5, 9, 9, 1),
(152, 2019, 26, 17, 167, 2, 8, 9, 9, 1),
(153, 2019, 26, 10, 159, 3, 9, 1, 9, 1),
(154, 2019, 26, 11, 159, 3, 6, 1, 9, 1),
(155, 2019, 26, 12, 159, 3, 8, 1, 9, 1),
(156, 2019, 26, 13, 159, 3, 5, 1, 9, 1),
(157, 2019, 26, 14, 159, 3, 10, 1, 9, 1),
(158, 2019, 26, 15, 159, 3, 3, 1, 9, 1),
(159, 2019, 26, 16, 159, 3, 6, 1, 9, 1),
(160, 2019, 26, 17, 159, 3, 8, 1, 9, 1),
(161, 2019, 26, 10, 160, 3, 5, 2, 9, 1),
(162, 2019, 26, 11, 160, 3, 6, 2, 9, 1),
(163, 2019, 26, 12, 160, 3, 7, 2, 9, 1),
(164, 2019, 26, 13, 160, 3, 8, 2, 9, 1),
(165, 2019, 26, 14, 160, 3, 4, 2, 9, 1),
(166, 2019, 26, 15, 160, 3, 9, 2, 9, 1),
(167, 2019, 26, 16, 160, 3, 10, 2, 9, 1),
(168, 2019, 26, 17, 160, 3, 8, 2, 9, 1),
(169, 2019, 26, 10, 161, 3, 6, 3, 9, 1),
(170, 2019, 26, 11, 161, 3, 7, 3, 9, 1),
(171, 2019, 26, 12, 161, 3, 8, 3, 9, 1),
(172, 2019, 26, 13, 161, 3, 9, 3, 9, 1),
(173, 2019, 26, 14, 161, 3, 8, 3, 9, 1),
(174, 2019, 26, 15, 161, 3, 10, 3, 9, 1),
(175, 2019, 26, 16, 161, 3, 10, 3, 9, 1),
(176, 2019, 26, 17, 161, 3, 5, 3, 9, 1),
(177, 2019, 26, 10, 162, 3, 8, 4, 9, 1),
(178, 2019, 26, 11, 162, 3, 7, 4, 9, 1),
(179, 2019, 26, 12, 162, 3, 6, 4, 9, 1),
(180, 2019, 26, 13, 162, 3, 9, 4, 9, 1),
(181, 2019, 26, 14, 162, 3, 5, 4, 9, 1),
(182, 2019, 26, 15, 162, 3, 7, 4, 9, 1),
(183, 2019, 26, 16, 162, 3, 8, 4, 9, 1),
(184, 2019, 26, 17, 162, 3, 5, 4, 9, 1),
(185, 2019, 26, 10, 163, 3, 8, 5, 9, 1),
(186, 2019, 26, 11, 163, 3, 7, 5, 9, 1),
(187, 2019, 26, 12, 163, 3, 6, 5, 9, 1),
(188, 2019, 26, 13, 163, 3, 9, 5, 9, 1),
(189, 2019, 26, 14, 163, 3, 8, 5, 9, 1),
(190, 2019, 26, 15, 163, 3, 7, 5, 9, 1),
(191, 2019, 26, 16, 163, 3, 6, 5, 9, 1),
(192, 2019, 26, 17, 163, 3, 6, 5, 9, 1),
(193, 2019, 26, 10, 164, 3, 9, 6, 9, 1),
(194, 2019, 26, 11, 164, 3, 10, 6, 9, 1),
(195, 2019, 26, 12, 164, 3, 8, 6, 9, 1),
(196, 2019, 26, 13, 164, 3, 6, 6, 9, 1),
(197, 2019, 26, 14, 164, 3, 9, 6, 9, 1),
(198, 2019, 26, 15, 164, 3, 5, 6, 9, 1),
(199, 2019, 26, 16, 164, 3, 5, 6, 9, 1),
(200, 2019, 26, 17, 164, 3, 8, 6, 9, 1),
(201, 2019, 26, 10, 165, 3, 5, 7, 9, 1),
(202, 2019, 26, 11, 165, 3, 6, 7, 9, 1),
(203, 2019, 26, 12, 165, 3, 7, 7, 9, 1),
(204, 2019, 26, 13, 165, 3, 8, 7, 9, 1),
(205, 2019, 26, 14, 165, 3, 4, 7, 9, 1),
(206, 2019, 26, 15, 165, 3, 9, 7, 9, 1),
(207, 2019, 26, 16, 165, 3, 10, 7, 9, 1),
(208, 2019, 26, 17, 165, 3, 8, 7, 9, 1),
(209, 2019, 26, 10, 166, 3, 9, 8, 9, 1),
(210, 2019, 26, 11, 156, 3, 6, 8, 9, 1),
(211, 2019, 26, 12, 156, 3, 7, 8, 9, 1),
(212, 2019, 26, 13, 166, 3, 5, 8, 9, 1),
(213, 2019, 26, 14, 166, 3, 8, 8, 9, 1),
(214, 2019, 26, 15, 166, 3, 5, 8, 9, 1),
(215, 2019, 26, 16, 166, 3, 4, 8, 9, 1),
(216, 2019, 26, 17, 166, 3, 8, 8, 9, 1),
(217, 2019, 26, 10, 167, 3, 8, 9, 9, 1),
(218, 2019, 26, 11, 167, 3, 7, 9, 9, 1),
(219, 2019, 26, 12, 167, 3, 5, 9, 9, 1),
(220, 2019, 26, 13, 167, 3, 9, 9, 9, 1),
(221, 2019, 26, 14, 167, 3, 10, 9, 9, 1),
(222, 2019, 26, 15, 167, 3, 6, 9, 9, 1),
(223, 2019, 26, 16, 167, 3, 5, 9, 9, 1),
(224, 2019, 26, 17, 167, 3, 8, 9, 9, 1),
(227, 2019, 22, 30, 106, 1, 5, 11, 9, 1),
(228, 2019, 22, 31, 107, 1, 4, 12, 9, 1),
(229, 2019, 22, 32, 108, 1, 10, 13, 9, 1),
(230, 2019, 22, 33, 109, 1, 2, 14, 9, 1),
(231, 2019, 22, 34, 110, 1, 9, 15, 9, 1),
(232, 2019, 22, 35, 111, 1, 8, 16, 9, 1),
(233, 2019, 22, 36, 112, 1, 5, 17, 9, 1),
(234, 2019, 22, 37, 113, 1, 7, 18, 9, 1),
(235, 2019, 22, 38, 114, 1, 6, 19, 9, 1),
(236, 2019, 22, 39, 109, 1, 2, 13, 9, 1),
(237, 2019, 22, 40, 110, 1, 2, 14, 9, 1),
(238, 2019, 22, 41, 111, 1, 1, 15, 9, 1),
(239, 2019, 22, 42, 112, 1, 5, 16, 9, 1),
(240, 2019, 22, 43, 114, 1, 4, 17, 9, 1),
(241, 2019, 22, 30, 106, 2, 5, 11, 9, 1),
(242, 2019, 22, 31, 107, 2, 4, 12, 9, 1),
(243, 2019, 22, 32, 108, 2, 10, 13, 9, 1),
(244, 2019, 22, 33, 109, 2, 2, 14, 9, 1),
(245, 2019, 22, 34, 110, 2, 9, 15, 9, 1),
(246, 2019, 22, 35, 111, 2, 8, 16, 9, 1),
(247, 2019, 22, 36, 112, 2, 5, 17, 9, 1),
(248, 2019, 22, 37, 113, 2, 7, 18, 9, 1),
(249, 2019, 22, 38, 114, 2, 6, 19, 9, 1),
(250, 2019, 22, 39, 109, 2, 2, 13, 9, 1),
(251, 2019, 22, 40, 110, 2, 2, 14, 9, 1),
(252, 2019, 22, 41, 111, 2, 1, 15, 9, 1),
(253, 2019, 22, 42, 112, 2, 5, 16, 9, 1),
(254, 2019, 22, 43, 114, 2, 4, 17, 9, 1),
(309, 2019, 22, 30, 108, 1, 10, 13, 9, 1),
(310, 2019, 22, 30, 109, 1, 4, 14, 9, 1),
(311, 2019, 22, 30, 110, 1, 2, 15, 9, 1),
(312, 2019, 22, 30, 111, 1, 3, 16, 9, 1),
(313, 2019, 22, 30, 112, 1, 1, 17, 9, 1),
(314, 2019, 22, 30, 113, 1, 5, 18, 9, 1),
(315, 2019, 22, 30, 114, 1, 6, 19, 9, 1),
(316, 2019, 22, 30, 107, 2, 10, 12, 9, 1),
(317, 2019, 22, 30, 108, 2, 10, 13, 9, 1),
(318, 2019, 22, 30, 109, 2, 9, 14, 9, 1),
(319, 2019, 22, 30, 110, 2, 8, 15, 9, 1),
(320, 2019, 22, 30, 111, 2, 7, 16, 9, 1),
(321, 2019, 22, 30, 112, 2, 1, 17, 9, 1),
(322, 2019, 22, 30, 113, 2, 2, 18, 9, 1),
(323, 2019, 22, 30, 114, 2, 3, 19, 9, 1),
(324, 2019, 22, 30, 106, 3, 4, 11, 9, 1),
(325, 2019, 22, 30, 107, 3, 6, 12, 9, 1),
(326, 2019, 22, 30, 108, 3, 9, 13, 9, 1),
(327, 2019, 22, 30, 109, 3, 6, 14, 9, 1),
(328, 2019, 22, 30, 110, 3, 10, 15, 9, 1),
(329, 2019, 22, 30, 111, 3, 4, 16, 9, 1),
(330, 2019, 22, 30, 112, 3, 2, 17, 9, 1),
(331, 2019, 22, 30, 113, 3, 3, 18, 9, 1),
(332, 2019, 22, 30, 114, 3, 1, 19, 9, 1),
(333, 2019, 22, 31, 106, 1, 5, 11, 9, 1),
(334, 2019, 22, 31, 107, 1, 6, 12, 9, 1),
(335, 2019, 22, 31, 108, 1, 7, 13, 9, 1),
(336, 2019, 22, 31, 109, 1, 10, 14, 9, 1),
(337, 2019, 22, 31, 110, 1, 10, 15, 9, 1),
(338, 2019, 22, 31, 111, 1, 9, 16, 9, 1),
(339, 2019, 22, 31, 112, 1, 8, 17, 9, 1),
(340, 2019, 22, 31, 113, 1, 7, 18, 9, 1),
(341, 2019, 22, 31, 114, 1, 1, 19, 9, 1),
(342, 2019, 22, 31, 106, 2, 2, 11, 9, 1),
(343, 2019, 22, 31, 107, 2, 3, 12, 9, 1),
(344, 2019, 22, 31, 108, 2, 4, 13, 9, 1),
(345, 2019, 22, 31, 109, 2, 6, 14, 9, 1),
(346, 2019, 22, 31, 110, 2, 9, 15, 9, 1),
(347, 2019, 22, 31, 111, 2, 6, 16, 9, 1),
(348, 2019, 22, 31, 112, 2, 10, 17, 9, 1),
(349, 2019, 22, 31, 113, 2, 4, 18, 9, 1),
(350, 2019, 22, 31, 114, 2, 2, 19, 9, 1),
(351, 2019, 22, 31, 106, 3, 3, 11, 9, 1),
(352, 2019, 22, 31, 107, 3, 1, 12, 9, 1),
(353, 2019, 22, 31, 108, 3, 5, 13, 9, 1),
(354, 2019, 22, 31, 109, 3, 6, 14, 9, 1),
(355, 2019, 22, 31, 110, 3, 7, 15, 9, 1),
(356, 2019, 22, 31, 111, 3, 10, 16, 9, 1),
(357, 2019, 22, 31, 112, 3, 10, 17, 9, 1),
(358, 2019, 22, 31, 113, 3, 9, 18, 9, 1),
(359, 2019, 22, 31, 114, 3, 8, 19, 9, 1),
(360, 2019, 22, 32, 106, 1, 7, 11, 9, 1),
(361, 2019, 22, 32, 107, 1, 1, 12, 9, 1),
(362, 2019, 22, 32, 109, 1, 3, 14, 9, 1),
(363, 2019, 22, 32, 110, 1, 4, 15, 9, 1),
(364, 2019, 22, 32, 111, 1, 6, 16, 9, 1),
(365, 2019, 22, 32, 112, 1, 9, 17, 9, 1),
(366, 2019, 22, 32, 113, 1, 6, 18, 9, 1),
(367, 2019, 22, 32, 114, 1, 10, 19, 9, 1),
(368, 2019, 22, 32, 106, 2, 4, 11, 9, 1),
(369, 2019, 22, 32, 107, 2, 2, 12, 9, 1),
(370, 2019, 22, 32, 109, 2, 1, 14, 9, 1),
(371, 2019, 22, 32, 110, 2, 5, 15, 9, 1),
(372, 2019, 22, 32, 111, 2, 6, 16, 9, 1),
(373, 2019, 22, 32, 112, 2, 7, 17, 9, 1),
(374, 2019, 22, 32, 113, 2, 10, 18, 9, 1),
(375, 2019, 22, 32, 114, 2, 10, 19, 9, 1),
(376, 2019, 22, 32, 106, 3, 9, 11, 9, 1),
(377, 2019, 22, 32, 107, 3, 8, 12, 9, 1),
(378, 2019, 22, 32, 108, 3, 7, 13, 9, 1),
(379, 2019, 22, 32, 109, 3, 1, 14, 9, 1),
(380, 2019, 22, 32, 110, 3, 2, 15, 9, 1),
(381, 2019, 22, 32, 111, 3, 3, 16, 9, 1),
(382, 2019, 22, 32, 112, 3, 4, 17, 9, 1),
(383, 2019, 22, 32, 113, 3, 6, 18, 9, 1),
(384, 2019, 22, 32, 114, 3, 9, 19, 9, 1),
(385, 2019, 22, 33, 106, 1, 6, 11, 9, 1),
(386, 2019, 22, 33, 107, 1, 10, 12, 9, 1),
(387, 2019, 22, 33, 108, 1, 4, 13, 9, 1),
(388, 2019, 22, 33, 110, 1, 3, 15, 9, 1),
(389, 2019, 22, 33, 111, 1, 1, 16, 9, 1),
(390, 2019, 22, 33, 112, 1, 5, 17, 9, 1),
(391, 2019, 22, 33, 113, 1, 6, 18, 9, 1),
(392, 2019, 22, 33, 114, 1, 7, 19, 9, 1),
(393, 2019, 22, 33, 106, 2, 10, 11, 9, 1),
(394, 2019, 22, 33, 107, 2, 10, 12, 9, 1),
(395, 2019, 22, 33, 108, 2, 9, 13, 9, 1),
(396, 2019, 22, 33, 110, 2, 7, 15, 9, 1),
(397, 2019, 22, 33, 111, 2, 1, 16, 9, 1),
(398, 2019, 22, 33, 112, 2, 2, 17, 9, 1),
(399, 2019, 22, 33, 113, 2, 3, 18, 9, 1),
(400, 2019, 22, 33, 114, 2, 4, 19, 9, 1),
(401, 2019, 22, 33, 106, 3, 6, 11, 9, 1),
(402, 2019, 22, 33, 107, 3, 9, 12, 9, 1),
(403, 2019, 22, 33, 108, 3, 6, 13, 9, 1),
(404, 2019, 22, 33, 109, 3, 10, 14, 9, 1),
(405, 2019, 22, 33, 110, 3, 4, 15, 9, 1),
(406, 2019, 22, 33, 111, 3, 2, 16, 9, 1),
(407, 2019, 22, 33, 112, 3, 3, 17, 9, 1),
(408, 2019, 22, 33, 113, 3, 1, 18, 9, 1),
(409, 2019, 22, 33, 114, 3, 5, 19, 9, 1),
(410, 2019, 22, 34, 106, 1, 6, 11, 9, 1),
(411, 2019, 22, 34, 107, 1, 7, 12, 9, 1),
(412, 2019, 22, 34, 108, 1, 10, 13, 9, 1),
(413, 2019, 22, 34, 109, 1, 10, 14, 9, 1),
(414, 2019, 22, 34, 111, 1, 8, 16, 9, 1),
(415, 2019, 22, 34, 112, 1, 7, 17, 9, 1),
(416, 2019, 22, 34, 113, 1, 1, 18, 9, 1),
(417, 2019, 22, 34, 114, 1, 2, 19, 9, 1),
(418, 2019, 22, 34, 106, 2, 3, 11, 9, 1),
(419, 2019, 22, 34, 107, 2, 4, 12, 9, 1),
(420, 2019, 22, 34, 108, 2, 6, 13, 9, 1),
(421, 2019, 22, 34, 109, 2, 9, 14, 9, 1),
(422, 2019, 22, 34, 111, 2, 10, 16, 9, 1),
(423, 2019, 22, 34, 112, 2, 4, 17, 9, 1),
(424, 2019, 22, 34, 113, 2, 2, 18, 9, 1),
(425, 2019, 22, 34, 114, 2, 3, 19, 9, 1),
(426, 2019, 22, 34, 106, 3, 1, 11, 9, 1),
(427, 2019, 22, 34, 107, 3, 5, 12, 9, 1),
(428, 2019, 22, 34, 108, 3, 6, 13, 9, 1),
(429, 2019, 22, 34, 109, 3, 7, 14, 9, 1),
(430, 2019, 22, 34, 110, 3, 10, 15, 9, 1),
(431, 2019, 22, 34, 111, 3, 10, 16, 9, 1),
(432, 2019, 22, 34, 112, 3, 9, 17, 9, 1),
(433, 2019, 22, 34, 113, 3, 8, 18, 9, 1),
(434, 2019, 22, 34, 114, 3, 7, 19, 9, 1),
(435, 2019, 22, 35, 106, 1, 1, 11, 9, 1),
(436, 2019, 22, 35, 107, 1, 2, 12, 9, 1),
(437, 2019, 22, 35, 108, 1, 3, 13, 9, 1),
(438, 2019, 22, 35, 109, 1, 4, 14, 9, 1),
(439, 2019, 22, 35, 110, 1, 6, 15, 9, 1),
(440, 2019, 22, 35, 112, 1, 6, 17, 9, 1),
(441, 2019, 22, 35, 113, 1, 10, 18, 9, 1),
(442, 2019, 22, 35, 114, 1, 4, 19, 9, 1),
(443, 2019, 22, 35, 106, 2, 2, 11, 9, 1),
(444, 2019, 22, 35, 107, 2, 3, 12, 9, 1),
(445, 2019, 22, 35, 108, 2, 1, 13, 9, 1),
(446, 2019, 22, 35, 109, 2, 5, 14, 9, 1),
(447, 2019, 22, 35, 110, 2, 6, 15, 9, 1),
(448, 2019, 22, 35, 112, 2, 10, 17, 9, 1),
(449, 2019, 22, 35, 113, 2, 10, 18, 9, 1),
(450, 2019, 22, 35, 114, 2, 9, 19, 9, 1),
(451, 2019, 22, 35, 106, 3, 8, 11, 9, 1),
(452, 2019, 22, 35, 107, 3, 7, 12, 9, 1),
(453, 2019, 22, 35, 108, 3, 1, 13, 9, 1),
(454, 2019, 22, 35, 109, 3, 2, 14, 9, 1),
(455, 2019, 22, 35, 110, 3, 3, 15, 9, 1),
(456, 2019, 22, 35, 111, 3, 4, 16, 9, 1),
(457, 2019, 22, 35, 112, 3, 6, 17, 9, 1),
(458, 2019, 22, 35, 113, 3, 9, 18, 9, 1),
(459, 2019, 22, 35, 114, 3, 6, 19, 9, 1),
(460, 2019, 22, 36, 106, 1, 10, 11, 9, 1),
(461, 2019, 22, 36, 107, 1, 4, 12, 9, 1),
(462, 2019, 22, 36, 108, 1, 2, 13, 9, 1),
(463, 2019, 22, 36, 109, 1, 3, 14, 9, 1),
(464, 2019, 22, 36, 110, 1, 1, 15, 9, 1),
(465, 2019, 22, 36, 111, 1, 5, 16, 9, 1),
(466, 2019, 22, 36, 113, 1, 7, 18, 9, 1),
(467, 2019, 22, 36, 114, 1, 10, 19, 9, 1),
(468, 2019, 22, 36, 106, 2, 10, 11, 9, 1),
(469, 2019, 22, 36, 107, 2, 9, 12, 9, 1),
(470, 2019, 22, 36, 108, 2, 8, 13, 9, 1),
(471, 2019, 22, 36, 109, 2, 7, 14, 9, 1),
(472, 2019, 22, 36, 110, 2, 1, 15, 9, 1),
(473, 2019, 22, 36, 111, 2, 2, 16, 9, 1),
(474, 2019, 22, 36, 113, 2, 4, 18, 9, 1),
(475, 2019, 22, 36, 114, 2, 6, 19, 9, 1),
(476, 2019, 22, 36, 106, 3, 9, 11, 9, 1),
(477, 2019, 22, 36, 107, 3, 6, 12, 9, 1),
(478, 2019, 22, 36, 108, 3, 10, 13, 9, 1),
(479, 2019, 22, 36, 109, 3, 4, 14, 9, 1),
(480, 2019, 22, 36, 110, 3, 2, 15, 9, 1),
(481, 2019, 22, 36, 111, 3, 3, 16, 9, 1),
(482, 2019, 22, 36, 112, 3, 1, 17, 9, 1),
(483, 2019, 22, 36, 113, 3, 5, 18, 9, 1),
(484, 2019, 22, 36, 114, 3, 6, 19, 9, 1),
(485, 2019, 22, 37, 106, 1, 7, 11, 9, 1),
(486, 2019, 22, 37, 107, 1, 10, 12, 9, 1),
(487, 2019, 22, 37, 108, 1, 10, 13, 9, 1),
(488, 2019, 22, 37, 109, 1, 9, 14, 9, 1),
(489, 2019, 22, 37, 110, 1, 8, 15, 9, 1),
(490, 2019, 22, 37, 111, 1, 7, 16, 9, 1),
(491, 2019, 22, 37, 112, 1, 1, 17, 9, 1),
(492, 2019, 22, 37, 114, 1, 3, 19, 9, 1),
(493, 2019, 22, 37, 106, 2, 4, 11, 9, 1),
(494, 2019, 22, 37, 107, 2, 6, 12, 9, 1),
(495, 2019, 22, 37, 108, 2, 9, 13, 9, 1),
(496, 2019, 22, 37, 109, 2, 6, 14, 9, 1),
(497, 2019, 22, 37, 110, 2, 10, 15, 9, 1),
(498, 2019, 22, 37, 111, 2, 4, 16, 9, 1),
(499, 2019, 22, 37, 112, 2, 2, 17, 9, 1),
(500, 2019, 22, 37, 114, 2, 1, 19, 9, 1),
(501, 2019, 22, 37, 106, 3, 5, 11, 9, 1),
(502, 2019, 22, 37, 107, 3, 6, 12, 9, 1),
(503, 2019, 22, 37, 108, 3, 7, 13, 9, 1),
(504, 2019, 22, 37, 109, 3, 10, 14, 9, 1),
(505, 2019, 22, 37, 110, 3, 10, 15, 9, 1),
(506, 2019, 22, 37, 111, 3, 9, 16, 9, 1),
(507, 2019, 22, 37, 112, 3, 8, 17, 9, 1),
(508, 2019, 22, 37, 113, 3, 7, 18, 9, 1),
(509, 2019, 22, 37, 114, 3, 1, 19, 9, 1),
(510, 2019, 22, 38, 106, 1, 2, 11, 9, 1),
(511, 2019, 22, 38, 107, 1, 3, 12, 9, 1),
(512, 2019, 22, 38, 108, 1, 4, 13, 9, 1),
(513, 2019, 22, 38, 109, 1, 6, 14, 9, 1),
(514, 2019, 22, 38, 110, 1, 9, 15, 9, 1),
(515, 2019, 22, 38, 111, 1, 6, 16, 9, 1),
(516, 2019, 22, 38, 112, 1, 10, 17, 9, 1),
(517, 2019, 22, 38, 113, 1, 4, 18, 9, 1),
(518, 2019, 22, 38, 106, 2, 3, 11, 9, 1),
(519, 2019, 22, 38, 107, 2, 1, 12, 9, 1),
(520, 2019, 22, 38, 108, 2, 5, 13, 9, 1),
(521, 2019, 22, 38, 109, 2, 6, 14, 9, 1),
(522, 2019, 22, 38, 110, 2, 7, 15, 9, 1),
(523, 2019, 22, 38, 111, 2, 10, 16, 9, 1),
(524, 2019, 22, 38, 112, 2, 10, 17, 9, 1),
(525, 2019, 22, 38, 113, 2, 9, 18, 9, 1),
(526, 2019, 22, 38, 106, 3, 7, 11, 9, 1),
(527, 2019, 22, 38, 107, 3, 1, 12, 9, 1),
(528, 2019, 22, 38, 108, 3, 2, 13, 9, 1),
(529, 2019, 22, 38, 109, 3, 3, 14, 9, 1),
(530, 2019, 22, 38, 110, 3, 4, 15, 9, 1),
(531, 2019, 22, 38, 111, 3, 6, 16, 9, 1),
(532, 2019, 22, 38, 112, 3, 9, 17, 9, 1),
(533, 2019, 22, 38, 113, 3, 6, 18, 9, 1),
(534, 2019, 22, 38, 114, 3, 10, 19, 9, 1),
(535, 2019, 22, 39, 106, 1, 4, 11, 9, 1),
(536, 2019, 22, 39, 107, 1, 2, 12, 9, 1),
(537, 2019, 22, 39, 108, 1, 3, 13, 9, 1),
(538, 2019, 22, 39, 110, 1, 5, 15, 9, 1),
(539, 2019, 22, 39, 111, 1, 6, 16, 9, 1),
(540, 2019, 22, 39, 112, 1, 7, 17, 9, 1),
(541, 2019, 22, 39, 113, 1, 10, 18, 9, 1),
(542, 2019, 22, 39, 114, 1, 10, 19, 9, 1),
(543, 2019, 22, 39, 106, 2, 9, 11, 9, 1),
(544, 2019, 22, 39, 107, 2, 8, 12, 9, 1),
(545, 2019, 22, 39, 108, 2, 7, 13, 9, 1),
(546, 2019, 22, 39, 110, 2, 2, 15, 9, 1),
(547, 2019, 22, 39, 111, 2, 3, 16, 9, 1),
(548, 2019, 22, 39, 112, 2, 4, 17, 9, 1),
(549, 2019, 22, 39, 113, 2, 6, 18, 9, 1),
(550, 2019, 22, 39, 114, 2, 9, 19, 9, 1),
(551, 2019, 22, 39, 106, 3, 6, 11, 9, 1),
(552, 2019, 22, 39, 107, 3, 10, 12, 9, 1),
(553, 2019, 22, 39, 108, 3, 4, 13, 9, 1),
(554, 2019, 22, 39, 109, 3, 2, 14, 9, 1),
(555, 2019, 22, 39, 110, 3, 3, 15, 9, 1),
(556, 2019, 22, 39, 111, 3, 1, 16, 9, 1),
(557, 2019, 22, 39, 112, 3, 5, 17, 9, 1),
(558, 2019, 22, 39, 113, 3, 6, 18, 9, 1),
(559, 2019, 22, 39, 114, 3, 7, 19, 9, 1),
(560, 2019, 22, 40, 106, 1, 10, 11, 9, 1),
(561, 2019, 22, 40, 107, 1, 10, 12, 9, 1),
(562, 2019, 22, 40, 108, 1, 9, 13, 9, 1),
(563, 2019, 22, 40, 109, 1, 8, 14, 9, 1),
(564, 2019, 22, 40, 111, 1, 1, 16, 9, 1),
(565, 2019, 22, 40, 112, 1, 2, 17, 9, 1),
(566, 2019, 22, 40, 113, 1, 3, 18, 9, 1),
(567, 2019, 22, 40, 114, 1, 4, 19, 9, 1),
(568, 2019, 22, 40, 106, 2, 6, 11, 9, 1),
(569, 2019, 22, 40, 107, 2, 9, 12, 9, 1),
(570, 2019, 22, 40, 108, 2, 6, 13, 9, 1),
(571, 2019, 22, 40, 109, 2, 10, 14, 9, 1),
(572, 2019, 22, 40, 111, 2, 2, 16, 9, 1),
(573, 2019, 22, 40, 112, 2, 3, 17, 9, 1),
(574, 2019, 22, 40, 113, 2, 1, 18, 9, 1),
(575, 2019, 22, 40, 114, 2, 5, 19, 9, 1),
(576, 2019, 22, 40, 106, 3, 6, 11, 9, 1),
(577, 2019, 22, 40, 107, 3, 7, 12, 9, 1),
(578, 2019, 22, 40, 108, 3, 10, 13, 9, 1),
(579, 2019, 22, 40, 109, 3, 10, 14, 9, 1),
(580, 2019, 22, 40, 110, 3, 9, 15, 9, 1),
(581, 2019, 22, 40, 111, 3, 8, 16, 9, 1),
(582, 2019, 22, 40, 112, 3, 7, 17, 9, 1),
(583, 2019, 22, 40, 113, 3, 1, 18, 9, 1),
(584, 2019, 22, 40, 114, 3, 2, 19, 9, 1),
(585, 2019, 22, 41, 106, 1, 3, 11, 9, 1),
(586, 2019, 22, 41, 107, 1, 4, 12, 9, 1),
(587, 2019, 22, 41, 108, 1, 6, 13, 9, 1),
(588, 2019, 22, 41, 109, 1, 9, 14, 9, 1),
(589, 2019, 22, 41, 110, 1, 6, 15, 9, 1),
(590, 2019, 22, 41, 112, 1, 4, 17, 9, 1),
(591, 2019, 22, 41, 113, 1, 2, 18, 9, 1),
(592, 2019, 22, 41, 114, 1, 3, 19, 9, 1),
(593, 2019, 22, 41, 106, 2, 1, 11, 9, 1),
(594, 2019, 22, 41, 107, 2, 5, 12, 9, 1),
(595, 2019, 22, 41, 108, 2, 6, 13, 9, 1),
(596, 2019, 22, 41, 109, 2, 7, 14, 9, 1),
(597, 2019, 22, 41, 110, 2, 10, 15, 9, 1),
(598, 2019, 22, 41, 112, 2, 9, 17, 9, 1),
(599, 2019, 22, 41, 113, 2, 8, 18, 9, 1),
(600, 2019, 22, 41, 114, 2, 7, 19, 9, 1),
(601, 2019, 22, 41, 106, 3, 1, 11, 9, 1),
(602, 2019, 22, 41, 107, 3, 2, 12, 9, 1),
(603, 2019, 22, 41, 108, 3, 3, 13, 9, 1),
(604, 2019, 22, 41, 109, 3, 4, 14, 9, 1),
(605, 2019, 22, 41, 110, 3, 6, 15, 9, 1),
(606, 2019, 22, 41, 111, 3, 9, 16, 9, 1),
(607, 2019, 22, 41, 112, 3, 6, 17, 9, 1),
(608, 2019, 22, 41, 113, 3, 10, 18, 9, 1),
(609, 2019, 22, 41, 114, 3, 4, 19, 9, 1),
(610, 2019, 22, 42, 106, 1, 2, 11, 9, 1),
(611, 2019, 22, 42, 107, 1, 3, 12, 9, 1),
(612, 2019, 22, 42, 108, 1, 1, 13, 9, 1),
(613, 2019, 22, 42, 109, 1, 5, 14, 9, 1),
(614, 2019, 22, 42, 110, 1, 6, 15, 9, 1),
(615, 2019, 22, 42, 111, 1, 7, 16, 9, 1),
(616, 2019, 22, 42, 113, 1, 10, 18, 9, 1),
(617, 2019, 22, 42, 114, 1, 9, 19, 9, 1),
(618, 2019, 22, 42, 106, 2, 8, 11, 9, 1),
(619, 2019, 22, 42, 107, 2, 7, 12, 9, 1),
(620, 2019, 22, 42, 108, 2, 1, 13, 9, 1),
(621, 2019, 22, 42, 109, 2, 2, 14, 9, 1),
(622, 2019, 22, 42, 110, 2, 3, 15, 9, 1),
(623, 2019, 22, 42, 111, 2, 4, 16, 9, 1),
(624, 2019, 22, 42, 113, 2, 9, 18, 9, 1),
(625, 2019, 22, 42, 114, 2, 6, 19, 9, 1),
(626, 2019, 22, 42, 106, 3, 10, 11, 9, 1),
(627, 2019, 22, 42, 107, 3, 4, 12, 9, 1),
(628, 2019, 22, 42, 108, 3, 2, 13, 9, 1),
(629, 2019, 22, 42, 109, 3, 3, 14, 9, 1),
(630, 2019, 22, 42, 110, 3, 1, 15, 9, 1),
(631, 2019, 22, 42, 111, 3, 5, 16, 9, 1),
(632, 2019, 22, 42, 112, 3, 6, 17, 9, 1),
(633, 2019, 22, 42, 113, 3, 7, 18, 9, 1),
(634, 2019, 22, 42, 114, 3, 10, 19, 9, 1),
(635, 2019, 22, 43, 106, 1, 10, 11, 9, 1),
(636, 2019, 22, 43, 107, 1, 9, 12, 9, 1),
(637, 2019, 22, 43, 108, 1, 8, 13, 9, 1),
(638, 2019, 22, 43, 109, 1, 7, 14, 9, 1),
(639, 2019, 22, 43, 110, 1, 1, 15, 9, 1),
(640, 2019, 22, 43, 111, 1, 2, 16, 9, 1),
(641, 2019, 22, 43, 112, 1, 3, 17, 9, 1),
(642, 2019, 22, 43, 113, 1, 4, 18, 9, 1),
(643, 2019, 22, 43, 106, 2, 9, 11, 9, 1),
(644, 2019, 22, 43, 107, 2, 6, 12, 9, 1),
(645, 2019, 22, 43, 108, 2, 10, 13, 9, 1),
(646, 2019, 22, 43, 109, 2, 4, 14, 9, 1),
(647, 2019, 22, 43, 110, 2, 2, 15, 9, 1),
(648, 2019, 22, 43, 111, 2, 3, 16, 9, 1),
(649, 2019, 22, 43, 112, 2, 1, 17, 9, 1),
(650, 2019, 22, 43, 113, 2, 5, 18, 9, 1),
(651, 2019, 22, 43, 106, 3, 7, 11, 9, 1),
(652, 2019, 22, 43, 107, 3, 10, 12, 9, 1),
(653, 2019, 22, 43, 108, 3, 10, 13, 9, 1),
(654, 2019, 22, 43, 109, 3, 9, 14, 9, 1),
(655, 2019, 22, 43, 110, 3, 8, 15, 9, 1),
(656, 2019, 22, 43, 111, 3, 7, 16, 9, 1),
(657, 2019, 22, 43, 112, 3, 1, 17, 9, 1),
(658, 2019, 22, 43, 113, 3, 2, 18, 9, 1),
(659, 2019, 22, 43, 114, 3, 3, 19, 9, 1),
(662, 2018, 26, 154, 159, 1, 4, 2, 0, 0),
(668, 2018, 26, 154, 159, 2, 10, 2, 0, 0),
(669, 2018, 26, 154, 159, 3, 6, 2, 0, 0),
(670, 2018, 26, 162, 161, 1, 10, 4, 0, 0),
(671, 2018, 26, 162, 163, 1, 10, 6, 0, 0),
(964, 2019, 24, 45, 130, 1, 8, 40, 1, 1),
(965, 2019, 24, 45, 131, 1, 8, 41, 1, 1),
(966, 2019, 24, 45, 132, 1, 8, 42, 1, 1),
(967, 2019, 24, 45, 133, 1, 8, 43, 1, 1),
(968, 2019, 24, 45, 134, 1, 8, 44, 1, 1),
(969, 2019, 24, 45, 135, 1, 8, 45, 1, 1),
(970, 2019, 24, 45, 136, 1, 8, 46, 1, 1),
(971, 2019, 24, 45, 137, 1, 8, 47, 1, 1),
(972, 2019, 24, 45, 138, 1, 8, 48, 1, 1),
(973, 2019, 24, 45, 139, 1, 8, 49, 1, 1),
(974, 2019, 24, 45, 140, 1, 8, 50, 1, 1),
(975, 2019, 24, 45, 141, 1, 8, 51, 1, 1),
(976, 2019, 24, 45, 142, 1, 8, 52, 1, 1),
(977, 2019, 24, 45, 143, 1, 8, 53, 1, 1),
(978, 2019, 18, 84, 66, 1, 1, 30, 1, 1),
(979, 2019, 18, 85, 66, 1, 2, 30, 1, 1),
(980, 2019, 18, 86, 66, 1, 3, 30, 1, 1),
(981, 2019, 18, 87, 66, 1, 4, 30, 1, 1),
(982, 2019, 18, 88, 66, 1, 5, 30, 1, 1),
(983, 2019, 18, 89, 66, 1, 6, 30, 1, 1),
(984, 2019, 18, 90, 66, 1, 7, 30, 1, 1),
(985, 2019, 18, 91, 66, 1, 8, 30, 1, 1),
(986, 2019, 18, 92, 66, 1, 9, 30, 1, 1),
(987, 2019, 18, 93, 66, 1, 10, 30, 1, 1),
(988, 2019, 18, 84, 66, 2, 1, 30, 1, 1),
(989, 2019, 18, 85, 66, 2, 2, 30, 1, 1),
(990, 2019, 18, 86, 66, 2, 3, 30, 1, 1),
(991, 2019, 18, 87, 66, 2, 4, 30, 1, 1),
(992, 2019, 18, 88, 66, 2, 5, 30, 1, 1),
(993, 2019, 18, 89, 66, 2, 6, 30, 1, 1),
(994, 2019, 18, 90, 66, 2, 7, 30, 1, 1),
(995, 2019, 18, 91, 66, 2, 8, 30, 1, 1),
(996, 2019, 18, 92, 66, 2, 9, 30, 1, 1),
(997, 2019, 18, 93, 66, 2, 10, 30, 1, 1),
(998, 2019, 18, 84, 66, 3, 1, 30, 1, 1),
(999, 2019, 18, 85, 66, 3, 2, 30, 1, 1),
(1000, 2019, 18, 86, 66, 3, 3, 30, 1, 1),
(1001, 2019, 18, 87, 66, 3, 4, 30, 1, 1),
(1002, 2019, 18, 88, 66, 3, 5, 30, 1, 1),
(1003, 2019, 18, 89, 66, 3, 6, 30, 1, 1),
(1004, 2019, 18, 90, 66, 3, 7, 30, 1, 1),
(1005, 2019, 18, 91, 66, 3, 8, 30, 1, 1),
(1006, 2019, 18, 92, 66, 3, 9, 30, 1, 1),
(1007, 2019, 18, 93, 66, 3, 10, 30, 1, 1),
(1008, 2019, 18, 84, 67, 1, 1, 31, 1, 1),
(1009, 2019, 18, 85, 67, 1, 2, 31, 1, 1),
(1010, 2019, 18, 86, 67, 1, 3, 31, 1, 1),
(1011, 2019, 18, 87, 67, 1, 4, 31, 1, 1),
(1012, 2019, 18, 88, 67, 1, 5, 31, 1, 1),
(1013, 2019, 18, 89, 67, 1, 6, 31, 1, 1),
(1014, 2019, 18, 90, 67, 1, 7, 31, 1, 1),
(1015, 2019, 18, 91, 67, 1, 8, 31, 1, 1),
(1016, 2019, 18, 92, 67, 1, 9, 31, 1, 1),
(1017, 2019, 18, 93, 67, 1, 10, 31, 1, 1),
(1018, 2019, 18, 84, 67, 2, 1, 31, 1, 1),
(1019, 2019, 18, 85, 67, 2, 2, 31, 1, 1),
(1020, 2019, 18, 86, 67, 2, 3, 31, 1, 1),
(1021, 2019, 18, 87, 67, 2, 4, 31, 1, 1),
(1022, 2019, 18, 88, 67, 2, 5, 31, 1, 1),
(1023, 2019, 18, 89, 67, 2, 6, 31, 1, 1),
(1024, 2019, 18, 90, 67, 2, 7, 31, 1, 1),
(1025, 2019, 18, 91, 67, 2, 8, 31, 1, 1),
(1026, 2019, 18, 92, 67, 2, 9, 31, 1, 1),
(1027, 2019, 18, 93, 67, 2, 10, 31, 1, 1),
(1028, 2019, 18, 84, 67, 3, 1, 31, 1, 1),
(1029, 2019, 18, 85, 67, 3, 2, 31, 1, 1),
(1030, 2019, 18, 86, 67, 3, 3, 31, 1, 1),
(1031, 2019, 18, 87, 67, 3, 4, 31, 1, 1),
(1032, 2019, 18, 88, 67, 3, 5, 31, 1, 1),
(1033, 2019, 18, 89, 67, 3, 6, 31, 1, 1),
(1034, 2019, 18, 90, 67, 3, 7, 31, 1, 1),
(1035, 2019, 18, 91, 67, 3, 8, 31, 1, 1),
(1036, 2019, 18, 92, 67, 3, 9, 31, 1, 1),
(1037, 2019, 18, 93, 67, 3, 10, 31, 1, 1),
(1038, 2019, 18, 84, 68, 1, 1, 32, 1, 1),
(1039, 2019, 18, 85, 68, 1, 2, 32, 1, 1),
(1040, 2019, 18, 86, 68, 1, 3, 32, 1, 1),
(1041, 2019, 18, 87, 68, 1, 4, 32, 1, 1),
(1042, 2019, 18, 88, 68, 1, 5, 32, 1, 1),
(1043, 2019, 18, 89, 68, 1, 6, 32, 1, 1),
(1044, 2019, 18, 90, 68, 1, 7, 32, 1, 1),
(1045, 2019, 18, 91, 68, 1, 8, 32, 1, 1),
(1046, 2019, 18, 92, 68, 1, 9, 32, 1, 1),
(1047, 2019, 18, 93, 68, 1, 10, 32, 1, 1),
(1048, 2019, 18, 84, 68, 2, 1, 32, 1, 1),
(1049, 2019, 18, 85, 68, 2, 2, 32, 1, 1),
(1050, 2019, 18, 86, 68, 2, 3, 32, 1, 1),
(1051, 2019, 18, 87, 68, 2, 4, 32, 1, 1),
(1052, 2019, 18, 88, 68, 2, 5, 32, 1, 1),
(1053, 2019, 18, 89, 68, 2, 6, 32, 1, 1),
(1054, 2019, 18, 90, 68, 2, 7, 32, 1, 1),
(1055, 2019, 18, 91, 68, 2, 8, 32, 1, 1),
(1056, 2019, 18, 92, 68, 2, 9, 32, 1, 1),
(1057, 2019, 18, 93, 68, 2, 10, 32, 1, 1),
(1058, 2019, 18, 84, 68, 3, 1, 32, 1, 1),
(1059, 2019, 18, 85, 68, 3, 2, 32, 1, 1),
(1060, 2019, 18, 86, 68, 3, 3, 32, 1, 1),
(1061, 2019, 18, 87, 68, 3, 4, 32, 1, 1),
(1062, 2019, 18, 88, 68, 3, 5, 32, 1, 1),
(1063, 2019, 18, 89, 68, 3, 6, 32, 1, 1),
(1064, 2019, 18, 90, 68, 3, 7, 32, 1, 1),
(1065, 2019, 18, 91, 68, 3, 8, 32, 1, 1),
(1066, 2019, 18, 92, 68, 3, 9, 32, 1, 1),
(1067, 2019, 18, 93, 68, 3, 10, 32, 1, 1),
(1068, 2019, 18, 84, 69, 1, 1, 33, 1, 1),
(1069, 2019, 18, 85, 69, 1, 2, 33, 1, 1),
(1070, 2019, 18, 86, 69, 1, 3, 33, 1, 1),
(1071, 2019, 18, 87, 69, 1, 4, 33, 1, 1),
(1072, 2019, 18, 88, 69, 1, 5, 33, 1, 1),
(1073, 2019, 18, 89, 69, 1, 6, 33, 1, 1),
(1074, 2019, 18, 90, 69, 1, 7, 33, 1, 1),
(1075, 2019, 18, 91, 69, 1, 8, 33, 1, 1),
(1076, 2019, 18, 92, 69, 1, 9, 33, 1, 1),
(1077, 2019, 18, 93, 69, 1, 10, 33, 1, 1),
(1078, 2019, 18, 84, 69, 2, 1, 33, 1, 1),
(1079, 2019, 18, 85, 69, 2, 2, 33, 1, 1),
(1080, 2019, 18, 86, 69, 2, 3, 33, 1, 1),
(1081, 2019, 18, 87, 69, 2, 4, 33, 1, 1),
(1082, 2019, 18, 88, 69, 2, 5, 33, 1, 1),
(1083, 2019, 18, 89, 69, 2, 6, 33, 1, 1),
(1084, 2019, 18, 90, 69, 2, 7, 33, 1, 1),
(1085, 2019, 18, 91, 69, 2, 8, 33, 1, 1),
(1086, 2019, 18, 92, 69, 2, 9, 33, 1, 1),
(1087, 2019, 18, 93, 69, 2, 10, 33, 1, 1),
(1088, 2019, 18, 84, 69, 3, 1, 33, 1, 1),
(1089, 2019, 18, 85, 69, 3, 2, 33, 1, 1),
(1090, 2019, 18, 86, 69, 3, 3, 33, 1, 1),
(1091, 2019, 18, 87, 69, 3, 4, 33, 1, 1),
(1092, 2019, 18, 88, 69, 3, 5, 33, 1, 1),
(1093, 2019, 18, 89, 69, 3, 6, 33, 1, 1),
(1094, 2019, 18, 90, 69, 3, 7, 33, 1, 1),
(1095, 2019, 18, 91, 69, 3, 8, 33, 1, 1),
(1096, 2019, 18, 92, 69, 3, 9, 33, 1, 1),
(1097, 2019, 18, 93, 69, 3, 10, 33, 1, 1),
(1098, 2019, 18, 84, 70, 1, 1, 34, 1, 1),
(1099, 2019, 18, 85, 70, 1, 2, 34, 1, 1),
(1100, 2019, 18, 86, 70, 1, 3, 34, 1, 1),
(1101, 2019, 18, 87, 70, 1, 4, 34, 1, 1),
(1102, 2019, 18, 88, 70, 1, 5, 34, 1, 1),
(1103, 2019, 18, 89, 70, 1, 6, 34, 1, 1),
(1104, 2019, 18, 90, 70, 1, 7, 34, 1, 1),
(1105, 2019, 18, 91, 70, 1, 8, 34, 1, 1),
(1106, 2019, 18, 92, 70, 1, 9, 34, 1, 1),
(1107, 2019, 18, 93, 70, 1, 10, 34, 1, 1),
(1108, 2019, 18, 84, 70, 2, 1, 34, 1, 1),
(1109, 2019, 18, 85, 70, 2, 2, 34, 1, 1),
(1110, 2019, 18, 86, 70, 2, 3, 34, 1, 1),
(1111, 2019, 18, 87, 70, 2, 4, 34, 1, 1),
(1112, 2019, 18, 88, 70, 2, 5, 34, 1, 1),
(1113, 2019, 18, 89, 70, 2, 6, 34, 1, 1),
(1114, 2019, 18, 90, 70, 2, 7, 34, 1, 1),
(1115, 2019, 18, 91, 70, 2, 8, 34, 1, 1),
(1116, 2019, 18, 92, 70, 2, 9, 34, 1, 1),
(1117, 2019, 18, 93, 70, 2, 10, 34, 1, 1),
(1118, 2019, 18, 84, 70, 3, 1, 34, 1, 1),
(1119, 2019, 18, 85, 70, 3, 2, 34, 1, 1),
(1120, 2019, 18, 86, 70, 3, 3, 34, 1, 1),
(1121, 2019, 18, 87, 70, 3, 4, 34, 1, 1),
(1122, 2019, 18, 88, 70, 3, 5, 34, 1, 1),
(1123, 2019, 18, 89, 70, 3, 6, 34, 1, 1),
(1124, 2019, 18, 90, 70, 3, 7, 34, 1, 1),
(1125, 2019, 18, 91, 70, 3, 8, 34, 1, 1),
(1126, 2019, 18, 92, 70, 3, 9, 34, 1, 1),
(1127, 2019, 18, 93, 70, 3, 10, 34, 1, 1),
(1128, 2019, 18, 84, 71, 1, 1, 35, 1, 1),
(1129, 2019, 18, 85, 71, 1, 2, 35, 1, 1),
(1130, 2019, 18, 86, 71, 1, 3, 35, 1, 1),
(1131, 2019, 18, 87, 71, 1, 4, 35, 1, 1),
(1132, 2019, 18, 88, 71, 1, 5, 35, 1, 1),
(1133, 2019, 18, 89, 71, 1, 6, 35, 1, 1),
(1134, 2019, 18, 90, 71, 1, 7, 35, 1, 1),
(1135, 2019, 18, 91, 71, 1, 8, 35, 1, 1),
(1136, 2019, 18, 92, 71, 1, 9, 35, 1, 1),
(1137, 2019, 18, 93, 71, 1, 10, 35, 1, 1),
(1138, 2019, 18, 84, 71, 2, 1, 35, 1, 1),
(1139, 2019, 18, 85, 71, 2, 2, 35, 1, 1),
(1140, 2019, 18, 86, 71, 2, 3, 35, 1, 1),
(1141, 2019, 18, 87, 71, 2, 4, 35, 1, 1),
(1142, 2019, 18, 88, 71, 2, 5, 35, 1, 1),
(1143, 2019, 18, 89, 71, 2, 6, 35, 1, 1),
(1144, 2019, 18, 90, 71, 2, 7, 35, 1, 1),
(1145, 2019, 18, 91, 71, 2, 8, 35, 1, 1),
(1146, 2019, 18, 92, 71, 2, 9, 35, 1, 1),
(1147, 2019, 18, 93, 71, 2, 10, 35, 1, 1),
(1148, 2019, 18, 84, 71, 3, 1, 35, 1, 1),
(1149, 2019, 18, 85, 71, 3, 2, 35, 1, 1),
(1150, 2019, 18, 86, 71, 3, 3, 35, 1, 1),
(1151, 2019, 18, 87, 71, 3, 4, 35, 1, 1),
(1152, 2019, 18, 88, 71, 3, 5, 35, 1, 1),
(1153, 2019, 18, 89, 71, 3, 6, 35, 1, 1),
(1154, 2019, 18, 90, 71, 3, 7, 35, 1, 1),
(1155, 2019, 18, 91, 71, 3, 8, 35, 1, 1),
(1156, 2019, 18, 92, 71, 3, 9, 35, 1, 1),
(1157, 2019, 18, 93, 71, 3, 10, 35, 1, 1),
(1158, 2019, 18, 84, 72, 1, 1, 36, 1, 1),
(1159, 2019, 18, 85, 72, 1, 2, 36, 1, 1),
(1160, 2019, 18, 86, 72, 1, 3, 36, 1, 1),
(1161, 2019, 18, 87, 72, 1, 4, 36, 1, 1),
(1162, 2019, 18, 88, 72, 1, 5, 36, 1, 1),
(1163, 2019, 18, 89, 72, 1, 6, 36, 1, 1),
(1164, 2019, 18, 90, 72, 1, 7, 36, 1, 1),
(1165, 2019, 18, 91, 72, 1, 8, 36, 1, 1),
(1166, 2019, 18, 92, 72, 1, 9, 36, 1, 1),
(1167, 2019, 18, 93, 72, 1, 10, 36, 1, 1),
(1168, 2019, 18, 84, 72, 2, 1, 36, 1, 1),
(1169, 2019, 18, 85, 72, 2, 2, 36, 1, 1),
(1170, 2019, 18, 86, 72, 2, 3, 36, 1, 1),
(1171, 2019, 18, 87, 72, 2, 4, 36, 1, 1),
(1172, 2019, 18, 88, 72, 2, 5, 36, 1, 1),
(1173, 2019, 18, 89, 72, 2, 6, 36, 1, 1),
(1174, 2019, 18, 90, 72, 2, 7, 36, 1, 1),
(1175, 2019, 18, 91, 72, 2, 8, 36, 1, 1),
(1176, 2019, 18, 92, 72, 2, 9, 36, 1, 1),
(1177, 2019, 18, 93, 72, 2, 10, 36, 1, 1),
(1178, 2019, 18, 84, 72, 3, 1, 36, 1, 1),
(1179, 2019, 18, 85, 72, 3, 2, 36, 1, 1),
(1180, 2019, 18, 86, 72, 3, 3, 36, 1, 1),
(1181, 2019, 18, 87, 72, 3, 4, 36, 1, 1),
(1182, 2019, 18, 88, 72, 3, 5, 36, 1, 1),
(1183, 2019, 18, 89, 72, 3, 6, 36, 1, 1),
(1184, 2019, 18, 90, 72, 3, 7, 36, 1, 1),
(1185, 2019, 18, 91, 72, 3, 8, 36, 1, 1),
(1186, 2019, 18, 92, 72, 3, 9, 36, 1, 1),
(1187, 2019, 18, 93, 72, 3, 10, 36, 1, 1),
(1188, 2019, 18, 84, 73, 1, 1, 37, 1, 1),
(1189, 2019, 18, 85, 73, 1, 2, 37, 1, 1),
(1190, 2019, 18, 86, 73, 1, 3, 37, 1, 1),
(1191, 2019, 18, 87, 73, 1, 4, 37, 1, 1),
(1192, 2019, 18, 88, 73, 1, 5, 37, 1, 1),
(1193, 2019, 18, 89, 73, 1, 6, 37, 1, 1),
(1194, 2019, 18, 90, 73, 1, 7, 37, 1, 1),
(1195, 2019, 18, 91, 73, 1, 8, 37, 1, 1),
(1196, 2019, 18, 92, 73, 1, 9, 37, 1, 1),
(1197, 2019, 18, 93, 73, 1, 10, 37, 1, 1),
(1198, 2019, 18, 84, 73, 2, 1, 37, 1, 1),
(1199, 2019, 18, 85, 73, 2, 2, 37, 1, 1),
(1200, 2019, 18, 86, 73, 2, 3, 37, 1, 1),
(1201, 2019, 18, 87, 73, 2, 4, 37, 1, 1),
(1202, 2019, 18, 88, 73, 2, 5, 37, 1, 1),
(1203, 2019, 18, 89, 73, 2, 6, 37, 1, 1),
(1204, 2019, 18, 90, 73, 2, 7, 37, 1, 1),
(1205, 2019, 18, 91, 73, 2, 8, 37, 1, 1),
(1206, 2019, 18, 92, 73, 2, 9, 37, 1, 1),
(1207, 2019, 18, 93, 73, 2, 10, 37, 1, 1),
(1208, 2019, 18, 84, 73, 3, 1, 37, 1, 1),
(1209, 2019, 18, 85, 73, 3, 2, 37, 1, 1),
(1210, 2019, 18, 86, 73, 3, 3, 37, 1, 1),
(1211, 2019, 18, 87, 73, 3, 4, 37, 1, 1),
(1212, 2019, 18, 88, 73, 3, 5, 37, 1, 1),
(1213, 2019, 18, 89, 73, 3, 6, 37, 1, 1),
(1214, 2019, 18, 90, 73, 3, 7, 37, 1, 1),
(1215, 2019, 18, 91, 73, 3, 8, 37, 1, 1),
(1216, 2019, 18, 92, 73, 3, 9, 37, 1, 1),
(1217, 2019, 18, 93, 73, 3, 10, 37, 1, 1),
(1218, 2019, 18, 84, 74, 1, 1, 38, 1, 1),
(1219, 2019, 18, 85, 74, 1, 2, 38, 1, 1),
(1220, 2019, 18, 86, 74, 1, 3, 38, 1, 1),
(1221, 2019, 18, 87, 74, 1, 4, 38, 1, 1),
(1222, 2019, 18, 88, 74, 1, 5, 38, 1, 1),
(1223, 2019, 18, 89, 74, 1, 6, 38, 1, 1),
(1224, 2019, 18, 90, 74, 1, 7, 38, 1, 1),
(1225, 2019, 18, 91, 74, 1, 8, 38, 1, 1),
(1226, 2019, 18, 92, 74, 1, 9, 38, 1, 1),
(1227, 2019, 18, 93, 74, 1, 10, 38, 1, 1),
(1228, 2019, 18, 84, 74, 2, 1, 38, 1, 1),
(1229, 2019, 18, 85, 74, 2, 2, 38, 1, 1),
(1230, 2019, 18, 86, 74, 2, 3, 38, 1, 1),
(1231, 2019, 18, 87, 74, 2, 4, 38, 1, 1),
(1232, 2019, 18, 88, 74, 2, 5, 38, 1, 1),
(1233, 2019, 18, 89, 74, 2, 6, 38, 1, 1),
(1234, 2019, 18, 90, 74, 2, 7, 38, 1, 1),
(1235, 2019, 18, 91, 74, 2, 8, 38, 1, 1),
(1236, 2019, 18, 92, 74, 2, 9, 38, 1, 1),
(1237, 2019, 18, 93, 74, 2, 10, 38, 1, 1),
(1238, 2019, 18, 84, 74, 3, 1, 38, 1, 1),
(1239, 2019, 18, 85, 74, 3, 2, 38, 1, 1),
(1240, 2019, 18, 86, 74, 3, 3, 38, 1, 1),
(1241, 2019, 18, 87, 74, 3, 4, 38, 1, 1),
(1242, 2019, 18, 88, 74, 3, 5, 38, 1, 1),
(1243, 2019, 18, 89, 74, 3, 6, 38, 1, 1),
(1244, 2019, 18, 90, 74, 3, 7, 38, 1, 1),
(1245, 2019, 18, 91, 74, 3, 8, 38, 1, 1),
(1246, 2019, 18, 92, 74, 3, 9, 38, 1, 1),
(1247, 2019, 18, 93, 74, 3, 10, 38, 1, 1),
(1248, 2019, 18, 84, 75, 1, 1, 39, 1, 1),
(1249, 2019, 18, 85, 75, 1, 2, 39, 1, 1),
(1250, 2019, 18, 86, 75, 1, 3, 39, 1, 1),
(1251, 2019, 18, 87, 75, 1, 4, 39, 1, 1),
(1252, 2019, 18, 88, 75, 1, 5, 39, 1, 1),
(1253, 2019, 18, 89, 75, 1, 6, 39, 1, 1),
(1254, 2019, 18, 90, 75, 1, 7, 39, 1, 1),
(1255, 2019, 18, 91, 75, 1, 8, 39, 1, 1),
(1256, 2019, 18, 92, 75, 1, 9, 39, 1, 1),
(1257, 2019, 18, 93, 75, 1, 10, 39, 1, 1),
(1258, 2019, 18, 84, 75, 2, 1, 39, 1, 1),
(1259, 2019, 18, 85, 75, 2, 2, 39, 1, 1),
(1260, 2019, 18, 86, 75, 2, 3, 39, 1, 1),
(1261, 2019, 18, 87, 75, 2, 4, 39, 1, 1),
(1262, 2019, 18, 88, 75, 2, 5, 39, 1, 1),
(1263, 2019, 18, 89, 75, 2, 6, 39, 1, 1),
(1264, 2019, 18, 90, 75, 2, 7, 39, 1, 1),
(1265, 2019, 18, 91, 75, 2, 8, 39, 1, 1),
(1266, 2019, 18, 92, 75, 2, 9, 39, 1, 1),
(1267, 2019, 18, 93, 75, 2, 10, 39, 1, 1),
(1268, 2019, 18, 84, 75, 3, 1, 39, 1, 1),
(1269, 2019, 18, 85, 75, 3, 2, 39, 1, 1),
(1270, 2019, 18, 86, 75, 3, 3, 39, 1, 1),
(1271, 2019, 18, 87, 75, 3, 4, 39, 1, 1),
(1272, 2019, 18, 88, 75, 3, 5, 39, 1, 1),
(1273, 2019, 18, 89, 75, 3, 6, 39, 1, 1),
(1274, 2019, 18, 90, 75, 3, 7, 39, 1, 1),
(1275, 2019, 18, 91, 75, 3, 8, 39, 1, 1),
(1276, 2019, 18, 92, 75, 3, 9, 39, 1, 1),
(1277, 2019, 18, 93, 75, 3, 10, 39, 1, 1);

--
-- Disparadores `notas`
--
DELIMITER $$
CREATE TRIGGER `Actualiza_Notas_BU` BEFORE UPDATE ON `notas` FOR EACH ROW INSERT INTO notas_actualizadas (Anterior_idCurso,Anterior_idAlumnxCurso,Anterior_idMateriaxCurso,Anterior_idTrimestreNota,Anterior_Calificacion,Anterior_idProfxMatexCurso,Anterior_idUsuario,Anterior_idEstado,Nuevo_idCurso,Nuevo_idAlumnxCurso,Nuevo_idMateriaxCurso,Nuevo_idTrimestreNota,Nuevo_Calificacion,Nuevo_idProfxMatexCurso,Nuevo_idUsuario,Nuevo_idEstado,F_Modificacion) VALUES
(OLD.id_curso, OLD.id_alumnxcurso,OLD.id_materiaxcurso,OLD.id_trimestrenota,OLD.Calificacion,OLD.id_profxmatexcurso,OLD.id_usuario,OLD.id_estado,
 NEW.id_curso, NEW.id_alumnxcurso,NEW.id_materiaxcurso,NEW.id_trimestrenota,NEW.Calificacion,NEW.id_profxmatexcurso,NEW.id_usuario,NEW.id_estado, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_actualizadas`
--

CREATE TABLE `notas_actualizadas` (
  `Anterior_idCurso` int(11) DEFAULT NULL,
  `Anterior_idAlumnxCurso` int(11) DEFAULT NULL,
  `Anterior_idMateriaxCurso` int(11) DEFAULT NULL,
  `Anterior_idTrimestreNota` int(11) DEFAULT NULL,
  `Anterior_Calificacion` int(10) DEFAULT NULL,
  `Anterior_idProfxMatexCurso` int(11) DEFAULT NULL,
  `Anterior_idUsuario` int(11) DEFAULT NULL,
  `Anterior_idEstado` int(11) DEFAULT NULL,
  `Nuevo_idCurso` int(11) DEFAULT NULL,
  `Nuevo_idAlumnxCurso` int(11) DEFAULT NULL,
  `Nuevo_idMateriaxCurso` int(11) DEFAULT NULL,
  `Nuevo_idTrimestreNota` int(11) DEFAULT NULL,
  `Nuevo_Calificacion` int(10) DEFAULT NULL,
  `Nuevo_idProfxMatexCurso` int(11) DEFAULT NULL,
  `Nuevo_idUsuario` int(11) DEFAULT NULL,
  `Nuevo_idEstado` int(11) DEFAULT NULL,
  `F_Modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas_actualizadas`
--

INSERT INTO `notas_actualizadas` (`Anterior_idCurso`, `Anterior_idAlumnxCurso`, `Anterior_idMateriaxCurso`, `Anterior_idTrimestreNota`, `Anterior_Calificacion`, `Anterior_idProfxMatexCurso`, `Anterior_idUsuario`, `Anterior_idEstado`, `Nuevo_idCurso`, `Nuevo_idAlumnxCurso`, `Nuevo_idMateriaxCurso`, `Nuevo_idTrimestreNota`, `Nuevo_Calificacion`, `Nuevo_idProfxMatexCurso`, `Nuevo_idUsuario`, `Nuevo_idEstado`, `F_Modificacion`) VALUES
(26, 124, 1, 1, 9, 305, 9, 1, 26, 124, 72, 1, 9, 305, 9, 1, '2019-10-15'),
(26, 124, 72, 1, 9, 305, 9, 1, 26, 124, 167, 1, 9, 305, 9, 1, '2019-10-15'),
(26, 124, 167, 1, 9, 305, 9, 1, 26, 11, 167, 1, 9, 305, 9, 1, '2019-10-15'),
(26, 11, 167, 1, 9, 305, 9, 1, 26, 11, 167, 1, 9, 329, 9, 1, '2019-10-15'),
(26, 11, 167, 1, 9, 329, 9, 1, 26, 11, 167, 1, 9, 1, 9, 1, '2019-10-15'),
(26, 1, 14, 1, 7, 1, 9, 1, 26, 1, 14, 1, 7, 1, 9, 1, '2019-10-16'),
(26, 2, 14, 1, 6, 1, 9, 1, 26, 2, 14, 1, 6, 1, 9, 1, '2019-10-16'),
(26, 3, 14, 1, 4, 1, 9, 1, 26, 3, 14, 1, 4, 1, 9, 1, '2019-10-16'),
(26, 4, 14, 1, 6, 1, 9, 1, 26, 4, 14, 1, 6, 1, 9, 1, '2019-10-16'),
(26, 5, 14, 1, 9, 1, 9, 1, 26, 5, 14, 1, 9, 1, 9, 1, '2019-10-16'),
(26, 6, 14, 1, 5, 1, 9, 1, 26, 6, 14, 1, 5, 1, 9, 1, '2019-10-16'),
(26, 7, 14, 1, 10, 1, 9, 1, 26, 7, 14, 1, 10, 1, 9, 1, '2019-10-16'),
(26, 1, 55, 1, 10, 2, 9, 1, 26, 1, 55, 1, 10, 2, 9, 1, '2019-10-16'),
(26, 2, 55, 1, 2, 2, 9, 1, 26, 2, 55, 1, 2, 2, 9, 1, '2019-10-16'),
(26, 3, 55, 1, 8, 2, 9, 1, 26, 3, 55, 1, 8, 2, 9, 1, '2019-10-16'),
(26, 4, 55, 1, 7, 2, 9, 1, 26, 4, 55, 1, 7, 2, 9, 1, '2019-10-16'),
(26, 5, 55, 1, 6, 2, 9, 1, 26, 5, 55, 1, 6, 2, 9, 1, '2019-10-16'),
(26, 6, 55, 1, 4, 2, 9, 1, 26, 6, 55, 1, 4, 2, 9, 1, '2019-10-16'),
(26, 7, 55, 1, 9, 2, 9, 1, 26, 7, 55, 1, 9, 2, 9, 1, '2019-10-16'),
(26, 1, 48, 1, 6, 3, 9, 1, 26, 1, 48, 1, 6, 3, 9, 1, '2019-10-16'),
(26, 2, 48, 1, 7, 3, 9, 1, 26, 2, 48, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 3, 48, 1, 7, 3, 9, 1, 26, 3, 48, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 4, 48, 1, 4, 3, 9, 1, 26, 4, 48, 1, 4, 3, 9, 1, '2019-10-16'),
(26, 5, 48, 1, 8, 3, 9, 1, 26, 5, 48, 1, 8, 3, 9, 1, '2019-10-16'),
(26, 6, 48, 1, 7, 3, 9, 1, 26, 6, 48, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 7, 48, 1, 10, 3, 9, 1, 26, 7, 48, 1, 10, 3, 9, 1, '2019-10-16'),
(26, 1, 1, 1, 8, 4, 9, 1, 26, 1, 1, 1, 8, 4, 9, 1, '2019-10-16'),
(26, 2, 1, 1, 8, 4, 9, 1, 26, 2, 1, 1, 8, 4, 9, 1, '2019-10-16'),
(26, 3, 1, 1, 6, 4, 9, 1, 26, 3, 1, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 4, 1, 1, 10, 4, 9, 1, 26, 4, 1, 1, 10, 4, 9, 1, '2019-10-16'),
(26, 5, 1, 1, 6, 4, 9, 1, 26, 5, 1, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 6, 1, 1, 5, 4, 9, 1, 26, 6, 1, 1, 5, 4, 9, 1, '2019-10-16'),
(26, 7, 1, 1, 6, 4, 9, 1, 26, 7, 1, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 1, 35, 1, 6, 5, 9, 1, 26, 1, 35, 1, 6, 5, 9, 1, '2019-10-16'),
(26, 2, 35, 1, 7, 5, 9, 1, 26, 2, 35, 1, 7, 5, 9, 1, '2019-10-16'),
(26, 3, 35, 1, 9, 5, 9, 1, 26, 3, 35, 1, 9, 5, 9, 1, '2019-10-16'),
(26, 4, 35, 1, 5, 5, 9, 1, 26, 4, 35, 1, 5, 5, 9, 1, '2019-10-16'),
(26, 5, 35, 1, 8, 5, 9, 1, 26, 5, 35, 1, 8, 5, 9, 1, '2019-10-16'),
(26, 6, 35, 1, 7, 5, 9, 1, 26, 6, 35, 1, 7, 5, 9, 1, '2019-10-16'),
(26, 7, 35, 1, 7, 5, 9, 1, 26, 7, 35, 1, 7, 5, 9, 1, '2019-10-16'),
(26, 1, 5, 1, 5, 6, 9, 1, 26, 1, 5, 1, 5, 6, 9, 1, '2019-10-16'),
(26, 2, 5, 1, 10, 6, 9, 1, 26, 2, 5, 1, 10, 6, 9, 1, '2019-10-16'),
(26, 3, 5, 1, 7, 6, 9, 1, 26, 3, 5, 1, 7, 6, 9, 1, '2019-10-16'),
(26, 4, 5, 1, 8, 6, 9, 1, 26, 4, 5, 1, 8, 6, 9, 1, '2019-10-16'),
(26, 5, 5, 1, 6, 6, 9, 1, 26, 5, 5, 1, 6, 6, 9, 1, '2019-10-16'),
(26, 6, 5, 1, 5, 6, 9, 1, 26, 6, 5, 1, 5, 6, 9, 1, '2019-10-16'),
(26, 7, 5, 1, 8, 6, 9, 1, 26, 7, 5, 1, 8, 6, 9, 1, '2019-10-16'),
(26, 1, 24, 1, 9, 7, 9, 1, 26, 1, 24, 1, 9, 7, 9, 1, '2019-10-16'),
(26, 2, 24, 1, 10, 7, 9, 1, 26, 2, 24, 1, 10, 7, 9, 1, '2019-10-16'),
(26, 3, 24, 1, 8, 7, 9, 1, 26, 3, 24, 1, 8, 7, 9, 1, '2019-10-16'),
(26, 4, 24, 1, 7, 7, 9, 1, 26, 4, 24, 1, 7, 7, 9, 1, '2019-10-16'),
(26, 5, 24, 1, 6, 7, 9, 1, 26, 5, 24, 1, 6, 7, 9, 1, '2019-10-16'),
(26, 6, 24, 1, 5, 7, 9, 1, 26, 6, 24, 1, 5, 7, 9, 1, '2019-10-16'),
(26, 7, 24, 1, 9, 7, 9, 1, 26, 7, 24, 1, 9, 7, 9, 1, '2019-10-16'),
(26, 1, 54, 1, 10, 8, 9, 1, 26, 1, 54, 1, 10, 8, 9, 1, '2019-10-16'),
(26, 2, 54, 1, 8, 8, 9, 1, 26, 2, 54, 1, 8, 8, 9, 1, '2019-10-16'),
(26, 3, 54, 1, 7, 8, 9, 1, 26, 3, 54, 1, 7, 8, 9, 1, '2019-10-16'),
(26, 4, 54, 1, 8, 8, 9, 1, 26, 4, 54, 1, 8, 8, 9, 1, '2019-10-16'),
(26, 5, 54, 1, 6, 8, 9, 1, 26, 5, 54, 1, 6, 8, 9, 1, '2019-10-16'),
(26, 6, 54, 1, 5, 8, 9, 1, 26, 6, 54, 1, 5, 8, 9, 1, '2019-10-16'),
(26, 7, 54, 1, 8, 8, 9, 1, 26, 7, 54, 1, 8, 8, 9, 1, '2019-10-16'),
(26, 1, 72, 1, 9, 9, 9, 1, 26, 1, 72, 1, 0, 9, 9, 1, '2019-10-16'),
(26, 2, 72, 1, 7, 9, 9, 1, 26, 2, 72, 1, 7, 9, 9, 1, '2019-10-16'),
(26, 3, 72, 1, 3, 9, 9, 1, 26, 3, 72, 1, 3, 9, 9, 1, '2019-10-16'),
(26, 4, 72, 1, 6, 9, 9, 1, 26, 4, 72, 1, 6, 9, 9, 1, '2019-10-16'),
(26, 5, 72, 1, 8, 9, 9, 1, 26, 5, 72, 1, 8, 9, 9, 1, '2019-10-16'),
(26, 6, 72, 1, 9, 9, 9, 1, 26, 6, 72, 1, 9, 9, 9, 1, '2019-10-16'),
(26, 7, 72, 1, 8, 9, 9, 1, 26, 7, 72, 1, 8, 9, 9, 1, '2019-10-16'),
(26, 17, 161, 1, 10, 4, 1, 1, 26, 17, 161, 1, 10, 4, 1, 1, '2019-10-16'),
(26, 1, 14, 1, 7, 1, 9, 1, 26, 1, 159, 1, 7, 1, 9, 1, '2019-10-16'),
(26, 11, 159, 1, 9, 1, 9, 1, 26, 10, 159, 1, 9, 1, 9, 1, '2019-10-16'),
(26, 1, 159, 1, 7, 1, 9, 1, 26, 10, 159, 1, 7, 1, 9, 1, '2019-10-16'),
(26, 2, 159, 1, 6, 1, 9, 1, 26, 10, 159, 1, 6, 1, 9, 1, '2019-10-16'),
(26, 3, 159, 1, 4, 1, 9, 1, 26, 10, 159, 1, 4, 1, 9, 1, '2019-10-16'),
(26, 4, 159, 1, 6, 1, 9, 1, 26, 10, 159, 1, 6, 1, 9, 1, '2019-10-16'),
(26, 5, 159, 1, 9, 1, 9, 1, 26, 10, 159, 1, 9, 1, 9, 1, '2019-10-16'),
(26, 6, 159, 1, 5, 1, 9, 1, 26, 10, 159, 1, 5, 1, 9, 1, '2019-10-16'),
(26, 7, 159, 1, 10, 1, 9, 1, 26, 10, 159, 1, 10, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 7, 1, 9, 1, 26, 11, 159, 1, 7, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 6, 1, 9, 1, 26, 12, 159, 1, 6, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 4, 1, 9, 1, 26, 13, 159, 1, 4, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 6, 1, 9, 1, 26, 14, 159, 1, 6, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 9, 1, 9, 1, 26, 15, 159, 1, 9, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 5, 1, 9, 1, 26, 16, 159, 1, 5, 1, 9, 1, '2019-10-16'),
(26, 10, 159, 1, 10, 1, 9, 1, 26, 17, 159, 1, 10, 1, 9, 1, '2019-10-16'),
(26, 1, 160, 1, 10, 2, 9, 1, 26, 10, 160, 1, 10, 2, 9, 1, '2019-10-16'),
(26, 2, 160, 1, 2, 2, 9, 1, 26, 11, 160, 1, 2, 2, 9, 1, '2019-10-16'),
(26, 3, 160, 1, 8, 2, 9, 1, 26, 12, 160, 1, 8, 2, 9, 1, '2019-10-16'),
(26, 4, 160, 1, 7, 2, 9, 1, 26, 13, 160, 1, 7, 2, 9, 1, '2019-10-16'),
(26, 5, 160, 1, 6, 2, 9, 1, 26, 14, 160, 1, 6, 2, 9, 1, '2019-10-16'),
(26, 6, 160, 1, 4, 2, 9, 1, 26, 15, 160, 1, 4, 2, 9, 1, '2019-10-16'),
(26, 7, 160, 1, 9, 2, 9, 1, 26, 16, 160, 1, 9, 2, 9, 1, '2019-10-16'),
(26, 1, 161, 1, 6, 3, 9, 1, 26, 10, 161, 1, 6, 3, 9, 1, '2019-10-16'),
(26, 2, 161, 1, 7, 3, 9, 1, 26, 11, 161, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 3, 161, 1, 7, 3, 9, 1, 26, 12, 161, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 4, 161, 1, 4, 3, 9, 1, 26, 13, 161, 1, 4, 3, 9, 1, '2019-10-16'),
(26, 5, 161, 1, 8, 3, 9, 1, 26, 14, 161, 1, 8, 3, 9, 1, '2019-10-16'),
(26, 6, 161, 1, 7, 3, 9, 1, 26, 15, 161, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 7, 161, 1, 10, 3, 9, 1, 26, 16, 161, 1, 10, 3, 9, 1, '2019-10-16'),
(26, 1, 162, 1, 8, 4, 9, 1, 26, 10, 162, 1, 8, 4, 9, 1, '2019-10-16'),
(26, 2, 162, 1, 8, 4, 9, 1, 26, 11, 162, 1, 8, 4, 9, 1, '2019-10-16'),
(26, 3, 162, 1, 6, 4, 9, 1, 26, 12, 162, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 4, 162, 1, 10, 4, 9, 1, 26, 13, 162, 1, 10, 4, 9, 0, '2019-10-16'),
(26, 10, 160, 1, 10, 2, 9, 1, 26, 10, 160, 1, 10, 2, 9, 1, '2019-10-16'),
(26, 11, 160, 1, 2, 2, 9, 1, 26, 11, 160, 1, 2, 2, 9, 1, '2019-10-16'),
(26, 12, 160, 1, 8, 2, 9, 1, 26, 12, 160, 1, 8, 2, 9, 1, '2019-10-16'),
(26, 13, 160, 1, 7, 2, 9, 1, 26, 13, 160, 1, 7, 2, 9, 1, '2019-10-16'),
(26, 14, 160, 1, 6, 2, 9, 1, 26, 14, 160, 1, 6, 2, 9, 1, '2019-10-16'),
(26, 15, 160, 1, 4, 2, 9, 1, 26, 15, 160, 1, 4, 2, 9, 1, '2019-10-16'),
(26, 16, 160, 1, 9, 2, 9, 1, 26, 16, 160, 1, 9, 2, 9, 1, '2019-10-16'),
(26, 10, 161, 1, 6, 3, 9, 1, 26, 10, 161, 1, 6, 3, 9, 1, '2019-10-16'),
(26, 11, 161, 1, 7, 3, 9, 1, 26, 11, 161, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 12, 161, 1, 7, 3, 9, 1, 26, 12, 161, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 13, 161, 1, 4, 3, 9, 1, 26, 13, 161, 1, 4, 3, 9, 1, '2019-10-16'),
(26, 14, 161, 1, 8, 3, 9, 1, 26, 14, 161, 1, 8, 3, 9, 1, '2019-10-16'),
(26, 15, 161, 1, 7, 3, 9, 1, 26, 15, 161, 1, 7, 3, 9, 1, '2019-10-16'),
(26, 16, 161, 1, 10, 3, 9, 1, 26, 16, 161, 1, 10, 3, 9, 1, '2019-10-16'),
(26, 10, 162, 1, 8, 4, 9, 1, 26, 10, 162, 1, 8, 4, 9, 1, '2019-10-16'),
(26, 11, 162, 1, 8, 4, 9, 1, 26, 11, 162, 1, 8, 4, 9, 1, '2019-10-16'),
(26, 12, 162, 1, 6, 4, 9, 1, 26, 12, 162, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 13, 162, 1, 10, 4, 9, 0, 26, 13, 162, 1, 10, 4, 9, 0, '2019-10-16'),
(26, 5, 162, 1, 6, 4, 9, 1, 26, 14, 162, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 6, 162, 1, 5, 4, 9, 1, 26, 15, 162, 1, 5, 4, 9, 1, '2019-10-16'),
(26, 7, 162, 1, 6, 4, 9, 1, 26, 16, 162, 1, 6, 4, 9, 1, '2019-10-16'),
(26, 1, 163, 1, 6, 5, 9, 1, 26, 10, 163, 1, 6, 5, 9, 1, '2019-10-16'),
(26, 2, 163, 1, 7, 5, 9, 1, 26, 11, 163, 1, 7, 5, 9, 1, '2019-10-16'),
(26, 3, 163, 1, 9, 5, 9, 1, 26, 12, 163, 1, 9, 5, 9, 1, '2019-10-16'),
(26, 4, 163, 1, 5, 5, 9, 1, 26, 13, 163, 1, 5, 5, 9, 1, '2019-10-16'),
(26, 5, 163, 1, 8, 5, 9, 1, 26, 14, 163, 1, 8, 5, 9, 1, '2019-10-16'),
(26, 6, 163, 1, 7, 5, 9, 1, 26, 15, 163, 1, 7, 5, 9, 1, '2019-10-16'),
(26, 7, 163, 1, 7, 5, 9, 1, 26, 16, 163, 1, 7, 5, 9, 1, '2019-10-16'),
(26, 1, 164, 1, 5, 6, 9, 1, 26, 10, 164, 1, 5, 6, 9, 1, '2019-10-16'),
(26, 2, 164, 1, 10, 6, 9, 1, 26, 11, 164, 1, 10, 6, 9, 1, '2019-10-16'),
(26, 3, 164, 1, 7, 6, 9, 1, 26, 12, 164, 1, 7, 6, 9, 1, '2019-10-16'),
(26, 4, 164, 1, 8, 6, 9, 1, 26, 13, 164, 1, 8, 6, 9, 1, '2019-10-16'),
(26, 5, 164, 1, 6, 6, 9, 1, 26, 14, 164, 1, 6, 6, 9, 1, '2019-10-16'),
(26, 6, 164, 1, 5, 6, 9, 1, 26, 15, 164, 1, 5, 6, 9, 1, '2019-10-16'),
(26, 7, 164, 1, 8, 6, 9, 1, 26, 16, 164, 1, 8, 6, 9, 1, '2019-10-16'),
(26, 1, 165, 1, 9, 7, 9, 1, 26, 10, 165, 1, 9, 7, 9, 1, '2019-10-16'),
(26, 2, 165, 1, 10, 7, 9, 1, 26, 0, 165, 1, 10, 7, 9, 1, '2019-10-16'),
(26, 0, 165, 1, 10, 7, 9, 1, 26, 11, 165, 1, 10, 7, 9, 1, '2019-10-16'),
(26, 3, 165, 1, 8, 7, 9, 1, 26, 12, 165, 1, 8, 7, 9, 1, '2019-10-16'),
(26, 4, 165, 1, 7, 7, 9, 1, 26, 13, 165, 1, 7, 7, 9, 1, '2019-10-16'),
(26, 5, 165, 1, 6, 7, 9, 1, 26, 14, 165, 1, 6, 7, 9, 1, '2019-10-16'),
(26, 6, 165, 1, 5, 7, 9, 1, 26, 15, 165, 1, 5, 7, 9, 1, '2019-10-16'),
(26, 7, 165, 1, 9, 7, 9, 1, 26, 16, 165, 1, 9, 7, 9, 1, '2019-10-16'),
(26, 1, 166, 1, 10, 8, 9, 1, 26, 10, 166, 1, 10, 8, 9, 1, '2019-10-16'),
(26, 2, 166, 1, 8, 8, 9, 1, 26, 11, 166, 1, 8, 8, 9, 1, '2019-10-16'),
(26, 3, 166, 1, 7, 8, 9, 1, 26, 12, 166, 1, 7, 8, 9, 1, '2019-10-16'),
(26, 4, 166, 1, 8, 8, 9, 1, 26, 13, 166, 1, 8, 8, 9, 1, '2019-10-16'),
(26, 5, 166, 1, 6, 8, 9, 1, 26, 14, 166, 1, 6, 8, 9, 1, '2019-10-16'),
(26, 6, 166, 1, 5, 8, 9, 1, 26, 15, 166, 1, 5, 8, 9, 1, '2019-10-16'),
(26, 7, 166, 1, 8, 8, 9, 1, 26, 16, 166, 1, 8, 8, 9, 1, '2019-10-16'),
(26, 1, 167, 1, 0, 9, 9, 1, 26, 10, 167, 1, 0, 9, 9, 1, '2019-10-16'),
(26, 2, 167, 1, 7, 9, 9, 1, 26, 11, 167, 1, 7, 9, 9, 1, '2019-10-16'),
(26, 3, 167, 1, 3, 9, 9, 1, 26, 12, 167, 1, 3, 9, 9, 1, '2019-10-16'),
(26, 4, 167, 1, 6, 9, 9, 1, 26, 13, 167, 1, 6, 9, 9, 1, '2019-10-16'),
(26, 5, 167, 1, 8, 9, 9, 1, 26, 14, 167, 1, 8, 9, 9, 1, '2019-10-16'),
(26, 6, 167, 1, 9, 9, 9, 1, 26, 15, 167, 1, 0, 9, 9, 1, '2019-10-16'),
(26, 7, 167, 1, 8, 9, 9, 1, 26, 15, 167, 1, 8, 9, 9, 1, '2019-10-16'),
(26, 15, 167, 1, 8, 9, 9, 1, 26, 16, 167, 1, 8, 9, 9, 1, '2019-10-16'),
(26, 15, 161, 1, 4, 3, 9, 1, 26, 15, 161, 2, 4, 3, 9, 1, '2019-10-16'),
(19, 74, 76, 1, 7, 20, 1, 1, 19, 74, 76, 2, 7, 20, 1, 1, '2019-10-17'),
(19, 75, 77, 1, 8, 21, 1, 1, 19, 75, 77, 2, 2, 21, 1, 1, '2019-10-17'),
(19, 74, 76, 1, 1, 20, 0, 0, 19, 76, 76, 1, 1, 20, 0, 0, '2019-10-17'),
(19, 76, 76, 1, 1, 20, 0, 0, 19, 76, 78, 2, 1, 20, 0, 0, '2019-10-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `idProfesor` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `FechaNac` varchar(10) DEFAULT NULL,
  `Telefono` int(10) DEFAULT NULL,
  `Mail` varchar(30) DEFAULT NULL,
  `Documento` int(10) DEFAULT NULL,
  `id_tipodocumento` int(45) DEFAULT NULL,
  `id_estado` int(30) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`idProfesor`, `Nombre`, `Apellido`, `FechaNac`, `Telefono`, `Mail`, `Documento`, `id_tipodocumento`, `id_estado`, `id_usuario`) VALUES
(1, 'Ivo', 'Zattoni', '20/05/1999', 1123543275, 'pedritovm@gmail.com', 39434565, 2, 9, 2),
(2, 'Christian', 'Nuñez', '25/05/1994', 1189844562, 'julianserrano@gmail.com', 27787565, 3, 1, 0),
(3, 'Mario', 'Buschiazzo', '25/05/1989', 1128678275, 'robertopincel@gmail.com', 39525765, 2, 1, 0),
(4, 'Santos', 'Sanchez', '22/05/1979', 1122387845, 'elrubiussomg@gmail.com', 39438245, 2, 1, 0),
(5, 'Natalia', 'Marcos', '21/05/1984', 1164534555, 'vegeta777@gmail.com', 39435216, 3, 1, 0),
(6, 'Ariel', 'Dardon', '28/11/1987', 1168345375, 'gokussj4f@gmail.com', 34434565, 1, 1, 0),
(7, 'Sandro', 'Armesto', '22/03/1995', 1125543541, 'kuchau@gmail.com', 28434565, 1, 1, 0),
(8, 'Liliana', 'Nuñez', '15/07/1989', 1154542346, 'expertosbob@gmail.com', 21434565, 3, 10, 0),
(9, 'olamina', 'equisde', '10/12/1983', 1123543554, 'pacoamoroso@gmail.com', 99124265, 2, 1, 0),
(10, 'nedea', 'clave', '80/11/1985', 1122344832, 'cosculandia@gmail.com', 12354565, 3, 1, 0),
(11, 'elperro', 'coscu', '01/08/1990', 1189327538, 'cosculandia2@gmail.com', 23552365, 1, 1, 0),
(12, 'frankaster', 'pelado', '08/08/1997', 1123468567, 'cosculandia3@gmail.com', 29465423, 2, 11, 0),
(13, 'mirta', 'legrand', '21/04/1996', 1134578926, '200decadas@gmail.com', 38678665, 3, 1, 0),
(14, 'amalia', 'granata', '18/05/1980', 1153872354, 'cabezadetermo@gmail.com', 29434565, 3, 1, 0),
(15, 'elpo', 'laquito', '14/02/1990', 1193234857, 'dejadellorar@gmail.com', 11235123, 1, 10, 0),
(16, 'eminem', 'marshal', '16/04/1975', 1156756756, 'ahrenose@gmail.com', 38243521, 2, 1, 0),
(17, 'barto', 'elhomo', '18/04/1996', 1123467579, 'gmailfalso123@gmail.com', 22168561, 1, 1, 0),
(18, 'aquiles', 'bailo', '05/09/1994', 1123343564, 'hectorrr@gmail.com', 49123572, 3, 10, 0),
(19, 'saske', 'naruto', '25/11/1993', 1178567464, 'elotaco@gmail.com', 22315651, 1, 1, 0),
(20, 'shrek', 'diosito', '31/10/1969', 1198797897, 'todopoderoso@gmail.com', 19123152, 2, 1, 0),
(21, 'agustin', 'castro', '23/01/1963', 1193604685, 'fporcatring@gmail.com', 29434134, 2, 1, 0),
(22, 'omonte', 'nose', '28/02/1970', 1198353454, 'el1000litar@gmail.com', 27653454, 1, 10, 0),
(23, 'federico', 'lensina', '23/05/1983', 1175623543, 'repetidor@gmail.com', 32341412, 3, 10, 0),
(24, 'mequedo', 'sinombres', '18/07/1974', 1157563654, 'aynose@gmail.com', 21235123, 3, 1, 0),
(25, 'homero', 'tomson', '14/02/1979', 1178652437, 'lehablaausted@gmail.com', 41235324, 1, 1, 0),
(26, 'cerreo', 'craxter', '06/08/1986', 1197835445, 'fachaman@gmail.com', 15341312, 1, 1, 0),
(27, 'ysya', 'alejo', '02/01/1969', 1186783245, 'vinedeotroplaneta@gmail.com', 21245764, 2, 1, 0),
(28, 'alucard', 'dracula', '15/11/1977', 1186782345, 'queatrevido@gmail.com', 32131251, 1, 1, 0),
(29, 'nosborn', 'galan', '22/05/1994', 1198743456, 'nbrgalan@gmail.com', 36164725, 1, 10, 0),
(30, 'wasauski', 'soliban', '24/12/1990', 1198746424, 'damealanena@gmail.com', 14846174, 1, 10, 0),
(31, 'peter', 'parker', '15/11/1999', 1123474575, 'fporucm@gmail.com', 24246125, 1, 1, 0),
(32, 'antonio', 'estrella', '10/04/1992', 1123472354, 'filantropo@gmail.com', 25147162, 1, 1, 0),
(33, 'messi', 'chikito', '19/08/1980', 1179235689, 'messi1@gmail.com', 38131613, 1, 1, 0),
(34, 'diego', 'maradona', '18/09/1982', 1134584687, 'd10s@gmail.com', 36412352, 1, 1, 0),
(35, 'lachi', 'kita', '14/04/1984', 1127385986, 'chiki123@gmail.com', 34357815, 1, 1, 0),
(36, 'diego', 'delavega', '28/04/1974', 1198326583, 'elzorro@gmail.com', 24324165, 2, 1, 0),
(37, 'mauricio', 'catman', '16/03/1976', 1134576466, 'dongato@gmail.com', 33334565, 2, 1, 0),
(38, 'mauro', 'lombardito', '21/08/1967', 1186356835, 'duketossj@gmail.com', 17857453, 1, 10, 0),
(39, 'pablito', 'lescano', '16/02/1969', 1154793544, 'pablitoo@gmail.com', 43671234, 3, 1, 0),
(40, 'Marcos', 'Costa', '11/05/2000', 1155547820, 'M.costa@gmail.com', 0, 1, 11, 0),
(41, 'julio', 'profe', '2009-12-31', 123456, '123456', 123456, 1, 1, 10),
(42, 'Benito ', 'de Sascachetun', '2000-1-11', 1133964519, '0', 42422424, 1, 1, 10);

--
-- Disparadores `profesores`
--
DELIMITER $$
CREATE TRIGGER `Actualiza_Profesores_BU` BEFORE UPDATE ON `profesores` FOR EACH ROW INSERT INTO profesores_actualizados(Anterior_Nombre,Anterior_Apellido,Anterior_FechaNac,Anterior_Telefono,Anterior_Mail,Anterior_Documento,Anterior_idTipoDocumento,Anterior_idEstado,Anterior_idUsuario, Nuevo_Nombre,Nuevo_Apellido,Nuevo_FechaNac,Nuevo_Telefono,Nuevo_Mail,Nuevo_Documento,Nuevo_idTipoDocumento,Nuevo_idEstado,Nuevo_idUsuario,F_Modificacion)VALUES
(OLD.Nombre, OLD.Apellido,OLD.FechaNac, OLD.Telefono, OLD.Mail, OLD.Documento, OLD.id_tipodocumento,OLD.id_estado, OLD.id_usuario,
 NEW.Nombre, NEW.Apellido,NEW.FechaNac, NEW.Telefono, NEW.Mail, NEW.Documento, NEW.id_tipodocumento,NEW.id_estado, NEW.id_usuario, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesoresxmateriasxcursos`
--

CREATE TABLE `profesoresxmateriasxcursos` (
  `idProfxMateriaxCurso` int(11) NOT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  `id_MateriaxCurso` int(11) DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesoresxmateriasxcursos`
--

INSERT INTO `profesoresxmateriasxcursos` (`idProfxMateriaxCurso`, `id_profesor`, `id_MateriaxCurso`, `id_estado`, `id_usuario`) VALUES
(1, 32, 167, 1, 1),
(2, 1, 159, 1, 1),
(3, 2, 160, 1, 1),
(4, 3, 161, 1, 1),
(5, 4, 162, 1, 1),
(6, 5, 163, 1, 1),
(7, 6, 164, 1, 1),
(8, 6, 165, 1, 1),
(9, 7, 166, 1, 1),
(10, 8, 167, 1, 1),
(11, 18, 106, 1, 1),
(12, 19, 107, 1, 1),
(13, 18, 108, 1, 1),
(14, 20, 109, 1, 1),
(15, 3, 110, 1, 1),
(16, 6, 111, 1, 1),
(17, 1, 112, 1, 1),
(18, 5, 113, 1, 1),
(19, 8, 114, 1, 1),
(20, 9, 76, 1, 1),
(21, 10, 77, 1, 1),
(22, 11, 78, 1, 1),
(23, 12, 79, 1, 1),
(24, 13, 80, 1, 1),
(25, 14, 81, 1, 1),
(26, 15, 82, 1, 1),
(27, 16, 83, 1, 1),
(28, 17, 84, 1, 1),
(29, 18, 85, 1, 1),
(30, 11, 66, 1, 1),
(31, 21, 67, 1, 1),
(32, 24, 68, 1, 1),
(33, 25, 69, 1, 1),
(34, 14, 70, 1, 1),
(35, 17, 71, 1, 1),
(36, 20, 72, 1, 1),
(37, 7, 73, 1, 1),
(38, 15, 74, 1, 1),
(39, 9, 75, 1, 1),
(40, 12, 130, 1, 1),
(41, 8, 131, 1, 1),
(42, 25, 132, 1, 1),
(43, 24, 133, 1, 1),
(44, 17, 134, 1, 1),
(45, 5, 135, 1, 1),
(46, 2, 136, 1, 1),
(47, 14, 137, 1, 1),
(48, 16, 138, 1, 1),
(49, 19, 139, 1, 1),
(50, 16, 140, 1, 1),
(51, 1, 141, 1, 1),
(52, 4, 142, 1, 1),
(53, 11, 143, 1, 1);

--
-- Disparadores `profesoresxmateriasxcursos`
--
DELIMITER $$
CREATE TRIGGER `Actualiza_profesoresxmateriasxcursos_BU` BEFORE UPDATE ON `profesoresxmateriasxcursos` FOR EACH ROW INSERT INTO profesoresxmateriasxcursos_actualizados (Anterior_idProfesor,Anterior_MateriaxCurso,Anterior_idEstado,Anterior_idUsuario,Nuevo_idProfesor,Nuevo_idMateriaxCurso,Nuevo_idEstado,Nuevo_idUsuario,F_Modificacion) VALUES 
(OLD.id_profesor, OLD.id_MateriaxCurso, OLD.id_estado, OLD.id_usuario,
 NEW.id_profesor, NEW.id_MateriaxCurso, NEW.id_estado, NEW.id_usuario, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesoresxmateriasxcursos_actualizados`
--

CREATE TABLE `profesoresxmateriasxcursos_actualizados` (
  `Anterior_idProfesor` int(11) DEFAULT NULL,
  `Anterior_MateriaxCurso` int(11) DEFAULT NULL,
  `Anterior_idEstado` int(11) DEFAULT NULL,
  `Anterior_idUsuario` int(11) DEFAULT NULL,
  `Nuevo_idProfesor` int(11) NOT NULL,
  `Nuevo_idMateriaxCurso` int(11) NOT NULL,
  `Nuevo_idEstado` int(11) NOT NULL,
  `Nuevo_idUsuario` int(11) NOT NULL,
  `F_Modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesoresxmateriasxcursos_actualizados`
--

INSERT INTO `profesoresxmateriasxcursos_actualizados` (`Anterior_idProfesor`, `Anterior_MateriaxCurso`, `Anterior_idEstado`, `Anterior_idUsuario`, `Nuevo_idProfesor`, `Nuevo_idMateriaxCurso`, `Nuevo_idEstado`, `Nuevo_idUsuario`, `F_Modificacion`) VALUES
(2, 2, 9, 2, 32, 167, 9, 1, '2019-10-15'),
(32, 167, 9, 1, 32, 167, 1, 1, '2019-10-16'),
(18, 106, 1, 1, 18, 106, 1, 1, '2019-10-17'),
(19, 107, 1, 1, 19, 107, 1, 1, '2019-10-17'),
(18, 108, 1, 1, 18, 108, 1, 1, '2019-10-17'),
(20, 109, 1, 1, 20, 109, 1, 1, '2019-10-17'),
(3, 110, 1, 1, 3, 110, 1, 1, '2019-10-17'),
(6, 111, 1, 1, 6, 111, 1, 1, '2019-10-17'),
(1, 112, 1, 1, 1, 112, 1, 1, '2019-10-17'),
(5, 113, 1, 1, 5, 113, 1, 1, '2019-10-17'),
(8, 114, 1, 1, 8, 114, 1, 1, '2019-10-17'),
(9, 76, 1, 1, 9, 76, 1, 1, '2019-10-17'),
(10, 77, 1, 1, 10, 77, 1, 1, '2019-10-17'),
(11, 78, 1, 1, 11, 78, 1, 1, '2019-10-17'),
(12, 79, 1, 1, 12, 79, 1, 1, '2019-10-17'),
(13, 80, 1, 1, 13, 80, 1, 1, '2019-10-17'),
(14, 81, 1, 1, 14, 81, 1, 1, '2019-10-17'),
(15, 82, 1, 1, 15, 82, 1, 1, '2019-10-17'),
(16, 83, 1, 1, 16, 83, 1, 1, '2019-10-17'),
(17, 84, 1, 1, 17, 84, 1, 1, '2019-10-17'),
(18, 85, 1, 1, 18, 85, 1, 1, '2019-10-17'),
(12, 130, 1, 1, 12, 130, 1, 1, '2019-10-30'),
(8, 131, 1, 1, 8, 131, 1, 1, '2019-10-30'),
(25, 132, 1, 1, 25, 132, 1, 1, '2019-10-30'),
(24, 133, 1, 1, 24, 133, 1, 1, '2019-10-30'),
(17, 134, 1, 1, 17, 134, 1, 1, '2019-10-30'),
(5, 135, 1, 1, 5, 135, 1, 1, '2019-10-30'),
(2, 136, 1, 1, 2, 136, 1, 1, '2019-10-30'),
(14, 137, 1, 1, 14, 137, 1, 1, '2019-10-30'),
(16, 138, 1, 1, 16, 138, 1, 1, '2019-10-30'),
(19, 139, 1, 1, 19, 139, 1, 1, '2019-10-30'),
(16, 140, 1, 1, 16, 140, 1, 1, '2019-10-30'),
(1, 141, 1, 1, 1, 141, 1, 1, '2019-10-30'),
(4, 142, 1, 1, 4, 142, 1, 1, '2019-10-30'),
(11, 143, 1, 1, 11, 143, 1, 1, '2019-10-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_actualizados`
--

CREATE TABLE `profesores_actualizados` (
  `Anterior_Nombre` varchar(30) DEFAULT NULL,
  `Anterior_Apellido` varchar(30) DEFAULT NULL,
  `Anterior_FechaNac` varchar(10) DEFAULT NULL,
  `Anterior_Telefono` int(10) DEFAULT NULL,
  `Anterior_Mail` varchar(30) DEFAULT NULL,
  `Anterior_Documento` int(10) DEFAULT NULL,
  `Anterior_idTipoDocumento` int(45) DEFAULT NULL,
  `Anterior_idEstado` int(30) DEFAULT NULL,
  `Anterior_idUsuario` int(11) DEFAULT NULL,
  `Nuevo_Nombre` varchar(30) DEFAULT NULL,
  `Nuevo_Apellido` varchar(30) DEFAULT NULL,
  `Nuevo_FechaNac` varchar(10) DEFAULT NULL,
  `Nuevo_Telefono` int(10) DEFAULT NULL,
  `Nuevo_Mail` varchar(30) DEFAULT NULL,
  `Nuevo_Documento` int(10) DEFAULT NULL,
  `Nuevo_idTipoDocumento` int(45) DEFAULT NULL,
  `Nuevo_idEstado` int(30) DEFAULT NULL,
  `Nuevo_idUsuario` int(11) DEFAULT NULL,
  `F_Modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores_actualizados`
--

INSERT INTO `profesores_actualizados` (`Anterior_Nombre`, `Anterior_Apellido`, `Anterior_FechaNac`, `Anterior_Telefono`, `Anterior_Mail`, `Anterior_Documento`, `Anterior_idTipoDocumento`, `Anterior_idEstado`, `Anterior_idUsuario`, `Nuevo_Nombre`, `Nuevo_Apellido`, `Nuevo_FechaNac`, `Nuevo_Telefono`, `Nuevo_Mail`, `Nuevo_Documento`, `Nuevo_idTipoDocumento`, `Nuevo_idEstado`, `Nuevo_idUsuario`, `F_Modificacion`) VALUES
('pedro', 'vm', '20/05/1999', 1123543275, 'pedritovm@gmail.com', 39434565, 2, 9, 2, 'Ivo', 'Zattoni', '20/05/1999', 1123543275, 'pedritovm@gmail.com', 39434565, 2, 9, 2, '2019-10-15'),
('july', 'trespe', '25/05/1994', 1189844562, 'julianserrano@gmail.com', 27787565, 3, 1, 0, 'Christian', 'Nuñez', '25/05/1994', 1189844562, 'julianserrano@gmail.com', 27787565, 3, 1, 0, '2019-10-16'),
('roberto', 'pintos', '25/05/1989', 1128678275, 'robertopincel@gmail.com', 39525765, 2, 1, 0, 'Mario', 'Buschiazzo', '25/05/1989', 1128678275, 'robertopincel@gmail.com', 39525765, 2, 1, 0, '2019-10-16'),
('elrubius', 'omeje', '22/05/1979', 1122387845, 'elrubiussomg@gmail.com', 39438245, 2, 1, 0, 'Santos', 'Sanchez', '22/05/1979', 1122387845, 'elrubiussomg@gmail.com', 39438245, 2, 1, 0, '2019-10-16'),
('vegeta', 'triplesiete', '21/05/1984', 1164534555, 'vegeta777@gmail.com', 39435216, 3, 1, 0, 'Natalia', 'Marcos', '21/05/1984', 1164534555, 'vegeta777@gmail.com', 39435216, 3, 1, 0, '2019-10-16'),
('goku', 'elweon', '28/11/1987', 1168345375, 'gokussj4f@gmail.com', 34434565, 1, 1, 0, 'Ariel', 'Dardon', '28/11/1987', 1168345375, 'gokussj4f@gmail.com', 34434565, 1, 1, 0, '2019-10-16'),
('macuin', 'rasho', '22/03/1995', 1125543541, 'kuchau@gmail.com', 28434565, 1, 1, 0, 'Sandro', 'Armesto', '22/03/1995', 1125543541, 'kuchau@gmail.com', 28434565, 1, 1, 0, '2019-10-16'),
('mister', 'increible', '15/07/1989', 1154542346, 'expertosbob@gmail.com', 21434565, 3, 10, 0, 'Liliana', 'Nuñez', '15/07/1989', 1154542346, 'expertosbob@gmail.com', 21434565, 3, 10, 0, '2019-10-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reincorporaciones`
--

CREATE TABLE `reincorporaciones` (
  `idReincorporacion` int(11) NOT NULL,
  `tipoReincorporacion` varchar(45) NOT NULL,
  `idAlumnxcurso` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `ciclolectivo` int(11) NOT NULL,
  `imprimir` tinyint(1) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reincorporaciones`
--

INSERT INTO `reincorporaciones` (`idReincorporacion`, `tipoReincorporacion`, `idAlumnxcurso`, `idAlumno`, `fecha`, `observaciones`, `ciclolectivo`, `imprimir`, `estado`) VALUES
(1, 'Primera reincorporacion', 160, 160, '2018-11-02', 'Primera reincorporacion automatica', 2018, 0, 1),
(2, 'Primera reincorporacion', 165, 165, '2018-11-02', 'Primera reincorporacion automatica', 2018, 0, 1),
(3, 'Segunda reincorporacion', 165, 165, '2018-11-13', 'Segunda reincorporacion automatica', 2018, 0, 1),
(4, 'Primera reincorporacion', 169, 168, '2018-11-14', 'Primera reincorporacion automatica', 2018, 1, 1),
(5, 'Primera reincorporacion', 158, 158, '2018-12-03', 'Primera reincorporacion automatica', 2018, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retirosantisipados`
--

CREATE TABLE `retirosantisipados` (
  `idRetiroantisipado` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idSeguimientos` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `hora` varchar(5) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idmotivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `retirosantisipados`
--

INSERT INTO `retirosantisipados` (`idRetiroantisipado`, `idAlumno`, `idSeguimientos`, `idUsuario`, `fecha`, `hora`, `observaciones`, `estado`, `idmotivo`) VALUES
(1, 20, 1, 1, '2018-11-04', '17:25', 'fds', NULL, 1),
(2, 21, 2, 1, '2018-11-05', '15:10', '', 0, 3),
(3, 21, 2, 1, '2018-11-11', '15:32', '', 0, 13),
(4, 3, 4, 1, '2018-11-13', '16:05', 'vevervsdv', 0, 13),
(5, 1, 1, 1, '2018-11-13', '16:06', 'vfdsvd', 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientos`
--

CREATE TABLE `seguimientos` (
  `idSeguimiento` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idMotivo` int(11) NOT NULL,
  `idSubmotivo` int(11) NOT NULL,
  `idAlumnxcurso` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora` time NOT NULL,
  `justificado` varchar(150) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `seguimientos`
--

INSERT INTO `seguimientos` (`idSeguimiento`, `idUsuario`, `idMotivo`, `idSubmotivo`, `idAlumnxcurso`, `idCurso`, `fecha`, `hora`, `justificado`, `observaciones`, `estado`) VALUES
(0, 0, 0, 0, 0, 0, '0', '00:00:00', '0', '0', 0),
(1, 1, 4, 1, 20, 23, '2018-09-20', '13:54:00', '', '', 1),
(2, 7, 13, 1, 21, 23, '2018-09-20', '13:00:00', '', '', 1),
(3, 7, 1, 1, 22, 23, '2018-09-20', '13:00:00', '', '', 1),
(4, 7, 2, 1, 23, 23, '2018-09-20', '13:00:00', '', '', 1),
(5, 7, 2, 1, 24, 23, '2018-09-20', '13:00:00', '', '', 1),
(6, 7, 3, 1, 25, 23, '2018-09-20', '13:00:00', '', '', 1),
(7, 7, 3, 1, 26, 23, '2018-09-20', '13:00:00', '', '', 1),
(8, 7, 4, 1, 27, 23, '2018-09-20', '13:00:00', '', '', 1),
(9, 7, 3, 1, 28, 23, '2018-09-20', '13:00:00', '', '', 1),
(10, 7, 4, 1, 29, 23, '2018-09-20', '13:00:00', '', '', 1),
(11, 3, 1, 2, 10, 11, '2018-09-20', '13:00:00', '', '', 1),
(12, 3, 2, 2, 11, 11, '2018-09-20', '13:00:00', '', '', 1),
(13, 3, 2, 2, 12, 11, '2018-09-20', '13:00:00', '', '', 1),
(14, 3, 3, 2, 13, 11, '2018-09-20', '13:00:00', '', '', 1),
(15, 3, 3, 2, 14, 11, '2018-09-20', '13:00:00', '', '', 1),
(16, 3, 2, 2, 15, 11, '2018-09-20', '13:00:00', '', '', 1),
(17, 3, 4, 2, 16, 11, '2018-09-20', '13:00:00', '', '', 1),
(18, 3, 2, 2, 17, 11, '2018-09-20', '13:00:00', '', '', 1),
(19, 3, 1, 2, 18, 11, '2018-09-20', '13:00:00', '', '', 1),
(20, 3, 4, 1, 19, 11, '2018-09-20', '13:00:00', '', '', 1),
(21, 7, 11, 3, 20, 23, '2018-09-21', '13:00:00', 'Hoy tambien', '', 1),
(22, 7, 11, 3, 21, 23, '2018-09-21', '13:00:00', '', '', 1),
(23, 7, 9, 3, 22, 23, '2018-09-21', '13:00:00', '', '', 1),
(24, 7, 11, 3, 23, 23, '2018-09-21', '13:00:00', '', '', 1),
(25, 7, 12, 3, 24, 23, '2018-09-21', '13:00:00', '', '', 1),
(26, 7, 11, 3, 25, 23, '2018-09-21', '13:00:00', '', '', 1),
(27, 7, 11, 3, 26, 23, '2018-09-21', '13:00:00', '', '', 1),
(28, 7, 10, 3, 27, 23, '2018-09-21', '13:00:00', '', '', 1),
(29, 7, 11, 3, 28, 23, '2018-09-21', '13:00:00', '', '', 1),
(30, 7, 9, 3, 29, 23, '2018-09-21', '13:00:00', '', '', 1),
(32, 1, 1, 1, 20, 23, '2018-09-21', '13:00:00', '', '', 1),
(33, 1, 1, 1, 21, 23, '2018-09-21', '13:00:00', '', '', 1),
(34, 1, 1, 1, 23, 23, '2018-09-21', '13:00:00', '', '', 1),
(35, 1, 1, 1, 24, 23, '2018-09-21', '13:00:00', '', '', 1),
(37, 1, 1, 1, 25, 23, '2018-09-21', '13:00:00', '', '', 1),
(38, 1, 1, 1, 26, 23, '2018-09-21', '13:00:00', '', '', 1),
(39, 1, 1, 1, 27, 23, '2018-09-21', '13:00:00', '', '', 1),
(40, 1, 1, 1, 28, 23, '2018-09-21', '13:00:00', '', '', 1),
(41, 1, 1, 1, 29, 23, '2018-09-21', '13:00:00', '', '', 1),
(42, 7, 3, 1, 20, 23, '2018-09-22', '13:00:00', 'tramite de alumno', '', 1),
(43, 7, 2, 1, 21, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(44, 7, 1, 1, 22, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(45, 7, 4, 1, 23, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(46, 7, 4, 1, 24, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(47, 7, 3, 1, 25, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(48, 7, 3, 1, 26, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(49, 7, 3, 1, 27, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(50, 7, 2, 1, 28, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(51, 7, 1, 1, 29, 23, '2018-09-22', '13:00:00', NULL, NULL, 1),
(52, 4, 3, 1, 20, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(53, 4, 1, 1, 21, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(54, 4, 2, 1, 22, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(55, 4, 1, 1, 23, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(56, 4, 4, 1, 24, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(57, 4, 3, 1, 25, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(58, 4, 3, 1, 26, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(59, 4, 3, 1, 27, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(60, 4, 2, 1, 28, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(61, 4, 1, 1, 29, 23, '2018-09-23', '13:00:00', NULL, NULL, 1),
(62, 7, 9, 3, 20, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(63, 7, 9, 3, 21, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(64, 7, 10, 3, 22, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(65, 7, 12, 3, 23, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(66, 7, 11, 3, 24, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(67, 7, 11, 3, 25, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(68, 7, 11, 3, 26, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(69, 7, 9, 3, 27, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(70, 7, 9, 3, 28, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(71, 7, 9, 3, 29, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(72, 7, 1, 1, 20, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(73, 7, 1, 1, 21, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(74, 7, 1, 1, 22, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(75, 7, 1, 1, 23, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(76, 7, 1, 1, 24, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(77, 7, 1, 1, 25, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(78, 7, 1, 1, 26, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(79, 7, 1, 1, 27, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(80, 7, 1, 1, 28, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(81, 7, 1, 1, 29, 23, '2018-09-24', '13:00:00', NULL, NULL, 1),
(82, 7, 2, 1, 20, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(83, 7, 1, 1, 21, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(84, 7, 2, 1, 22, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(85, 7, 4, 1, 23, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(86, 7, 4, 1, 24, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(87, 7, 3, 1, 25, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(88, 7, 3, 1, 26, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(89, 7, 1, 1, 27, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(90, 7, 2, 1, 28, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(91, 7, 2, 1, 29, 23, '2018-09-27', '13:00:00', NULL, NULL, 1),
(92, 2, 2, 1, 20, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(93, 2, 1, 1, 21, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(94, 2, 4, 1, 22, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(95, 2, 3, 1, 23, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(96, 2, 1, 1, 24, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(97, 2, 3, 1, 25, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(98, 2, 3, 1, 26, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(99, 2, 2, 1, 27, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(100, 2, 2, 1, 28, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(101, 2, 2, 1, 29, 23, '2018-09-28', '13:00:00', NULL, NULL, 1),
(102, 3, 8, 2, 20, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(103, 3, 5, 2, 21, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(104, 3, 5, 2, 22, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(105, 3, 6, 2, 23, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(106, 3, 7, 2, 24, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(107, 3, 7, 2, 25, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(108, 3, 7, 2, 26, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(109, 3, 6, 2, 27, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(110, 3, 6, 2, 28, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(111, 3, 7, 2, 29, 23, '2018-09-29', '13:00:00', NULL, NULL, 1),
(112, 1, 1, 1, 10, 11, '2018-09-21', '13:00:00', 'Aviso que no vendra', '', 1),
(113, 1, 1, 1, 11, 11, '2018-09-21', '13:00:00', '', '', 1),
(114, 1, 2, 1, 12, 11, '2018-09-21', '13:00:00', '', '', 1),
(115, 1, 4, 1, 13, 11, '2018-09-21', '13:00:00', '', '', 1),
(116, 1, 3, 1, 14, 11, '2018-09-21', '13:00:00', '', '', 1),
(117, 1, 2, 1, 15, 11, '2018-09-21', '13:00:00', '', '', 1),
(118, 1, 2, 1, 16, 11, '2018-09-21', '13:00:00', '', '', 1),
(119, 1, 3, 1, 17, 11, '2018-09-21', '13:00:00', '', '', 1),
(120, 1, 4, 1, 18, 11, '2018-09-21', '13:00:00', '', '', 1),
(121, 1, 1, 1, 19, 11, '2018-09-21', '13:00:00', '', '', 1),
(122, 1, 3, 1, 10, 11, '2018-09-22', '13:00:00', '', '', 1),
(123, 1, 3, 1, 11, 11, '2018-09-22', '13:00:00', '', '', 1),
(124, 1, 4, 1, 12, 11, '2018-09-22', '13:00:00', '', '', 1),
(125, 1, 1, 1, 13, 11, '2018-09-22', '13:00:00', '', '', 1),
(126, 1, 3, 1, 14, 11, '2018-09-22', '13:00:00', '', '', 1),
(127, 1, 2, 1, 15, 11, '2018-09-22', '13:00:00', '', '', 1),
(128, 1, 1, 1, 16, 11, '2018-09-22', '13:00:00', '', '', 1),
(129, 1, 3, 1, 17, 11, '2018-09-22', '13:00:00', '', '', 1),
(130, 1, 4, 1, 18, 11, '2018-09-22', '13:00:00', '', '', 1),
(131, 1, 1, 1, 19, 11, '2018-09-22', '13:00:00', '', '', 1),
(132, 1, 1, 1, 10, 11, '2018-09-23', '13:00:00', '', '', 1),
(133, 1, 3, 1, 11, 11, '2018-09-23', '13:00:00', '', '', 1),
(134, 1, 2, 1, 12, 11, '2018-09-23', '13:00:00', '', '', 1),
(135, 1, 1, 1, 13, 11, '2018-09-23', '13:00:00', '', '', 1),
(136, 1, 3, 1, 14, 11, '2018-09-23', '13:00:00', '', 'Esta de viaje', 1),
(137, 1, 1, 1, 15, 11, '2018-09-23', '13:00:00', '', '', 1),
(138, 1, 2, 1, 16, 11, '2018-09-23', '13:00:00', '', '', 1),
(139, 1, 4, 1, 17, 11, '2018-09-23', '13:00:00', '', '', 1),
(140, 1, 3, 1, 18, 11, '2018-09-23', '13:00:00', '', '', 1),
(141, 1, 2, 1, 19, 11, '2018-09-23', '13:00:00', '', '', 1),
(142, 5, 1, 1, 10, 11, '2018-09-24', '13:00:00', '', '', 1),
(143, 5, 1, 1, 11, 11, '2018-09-24', '13:00:00', '', '', 1),
(144, 5, 1, 1, 12, 11, '2018-09-24', '13:00:00', '', '', 1),
(145, 5, 1, 1, 13, 11, '2018-09-24', '13:00:00', '', '', 1),
(146, 5, 1, 1, 14, 11, '2018-09-24', '13:00:00', '', '', 1),
(147, 5, 1, 1, 15, 11, '2018-09-24', '13:00:00', '', '', 1),
(148, 5, 1, 1, 16, 11, '2018-09-24', '13:00:00', '', '', 1),
(149, 5, 1, 1, 17, 11, '2018-09-24', '13:00:00', '', '', 1),
(150, 5, 1, 1, 18, 11, '2018-09-24', '13:00:00', '', '', 1),
(151, 5, 1, 1, 19, 11, '2018-09-24', '13:00:00', '', '', 1),
(152, 1, 5, 2, 10, 11, '2018-09-24', '13:00:00', '', '', 1),
(153, 1, 8, 2, 11, 11, '2018-09-24', '13:00:00', '', '', 1),
(154, 1, 6, 2, 12, 11, '2018-09-24', '13:00:00', '', '', 1),
(155, 1, 8, 2, 13, 11, '2018-09-24', '13:00:00', '', '', 1),
(156, 1, 5, 2, 14, 11, '2018-09-24', '13:00:00', '', '', 1),
(157, 1, 7, 2, 15, 11, '2018-09-24', '13:00:00', '', '', 1),
(158, 1, 7, 2, 16, 11, '2018-09-24', '13:00:00', '', '', 1),
(159, 1, 5, 2, 17, 11, '2018-09-24', '13:00:00', '', '', 1),
(160, 1, 7, 2, 18, 11, '2018-09-24', '13:00:00', '', '', 1),
(161, 1, 6, 2, 19, 11, '2018-09-24', '13:00:00', '', '', 1),
(162, 1, 4, 1, 10, 11, '2018-09-27', '13:00:00', 'Aviso que no vendra', '', 1),
(163, 1, 1, 1, 11, 11, '2018-09-27', '13:00:00', '', '', 1),
(164, 1, 2, 1, 12, 11, '2018-09-27', '13:00:00', '', '', 1),
(165, 1, 4, 1, 13, 11, '2018-09-27', '13:00:00', '', '', 1),
(166, 1, 3, 1, 14, 11, '2018-09-27', '13:00:00', '', '', 1),
(167, 1, 2, 1, 15, 11, '2018-09-27', '13:00:00', '', '', 1),
(168, 1, 2, 1, 16, 11, '2018-09-27', '13:00:00', '', '', 1),
(169, 1, 3, 1, 17, 11, '2018-09-27', '13:00:00', '', '', 1),
(170, 1, 4, 1, 18, 11, '2018-09-27', '13:00:00', '', '', 1),
(171, 1, 1, 1, 19, 11, '2018-09-27', '13:00:00', '', '', 1),
(172, 1, 1, 1, 10, 11, '2018-09-28', '13:00:00', '', '', 1),
(173, 1, 1, 1, 11, 11, '2018-09-28', '13:00:00', '', '', 1),
(174, 1, 2, 1, 12, 11, '2018-09-28', '13:00:00', '', '', 1),
(175, 1, 4, 1, 13, 11, '2018-09-28', '13:00:00', '', '', 1),
(176, 1, 3, 1, 14, 11, '2018-09-28', '13:00:00', '', '', 1),
(177, 1, 2, 1, 15, 11, '2018-09-28', '13:00:00', '', '', 1),
(178, 1, 2, 1, 16, 11, '2018-09-28', '13:00:00', '', 'C murio', 1),
(179, 1, 3, 1, 17, 11, '2018-09-28', '13:00:00', '', '', 1),
(180, 1, 4, 1, 18, 11, '2018-09-28', '13:00:00', '', '', 1),
(181, 1, 1, 1, 19, 11, '2018-09-28', '13:00:00', '', '', 1),
(182, 7, 3, 1, 20, 23, '2018-10-20', '13:00:00', 'Aviso que faltaba', '', 1),
(183, 7, 1, 1, 21, 23, '2018-10-20', '13:00:00', '', '', 1),
(184, 7, 1, 1, 22, 23, '2018-10-20', '13:00:00', '', '', 1),
(185, 7, 2, 1, 23, 23, '2018-10-20', '13:00:00', '', '', 1),
(186, 7, 2, 1, 24, 23, '2018-10-20', '13:00:00', '', '', 1),
(187, 7, 3, 1, 25, 23, '2018-10-20', '13:00:00', '', '', 1),
(188, 7, 3, 1, 26, 23, '2018-10-20', '13:00:00', '', '', 1),
(189, 7, 4, 1, 27, 23, '2018-10-20', '13:00:00', '', '', 1),
(190, 7, 3, 1, 28, 23, '2018-10-20', '13:00:00', '', '', 1),
(191, 7, 4, 1, 29, 23, '2018-10-20', '13:00:00', '', '', 1),
(192, 3, 1, 2, 10, 11, '2018-10-20', '13:00:00', '', '', 1),
(193, 3, 2, 2, 11, 11, '2018-10-20', '13:00:00', '', '', 1),
(194, 3, 2, 2, 12, 11, '2018-10-20', '13:00:00', '', '', 1),
(195, 3, 3, 2, 13, 11, '2018-10-20', '13:00:00', '', '', 1),
(196, 3, 3, 2, 14, 11, '2018-10-20', '13:00:00', '', '', 1),
(197, 3, 2, 2, 15, 11, '2018-10-20', '13:00:00', '', '', 1),
(198, 3, 4, 2, 16, 11, '2018-10-20', '13:00:00', '', '', 1),
(199, 3, 2, 2, 17, 11, '2018-10-20', '13:00:00', '', '', 1),
(200, 3, 1, 2, 18, 11, '2018-10-20', '13:00:00', '', '', 1),
(201, 3, 4, 1, 19, 11, '2018-10-20', '13:00:00', '', '', 1),
(202, 7, 11, 3, 20, 23, '2018-10-21', '13:00:00', 'Hoy tambien', '', 1),
(203, 7, 11, 3, 21, 23, '2018-10-21', '13:00:00', '', '', 1),
(204, 7, 9, 3, 22, 23, '2018-10-21', '13:00:00', '', '', 1),
(205, 7, 11, 3, 23, 23, '2018-10-21', '13:00:00', '', '', 1),
(206, 7, 12, 3, 24, 23, '2018-10-21', '13:00:00', '', '', 1),
(207, 7, 11, 3, 25, 23, '2018-10-21', '13:00:00', '', '', 1),
(208, 7, 11, 3, 26, 23, '2018-10-21', '13:00:00', '', '', 1),
(209, 7, 10, 3, 27, 23, '2018-10-21', '13:00:00', '', '', 1),
(210, 7, 11, 3, 28, 23, '2018-10-21', '13:00:00', '', '', 1),
(211, 7, 9, 3, 29, 23, '2018-10-21', '13:00:00', '', '', 1),
(212, 1, 1, 1, 20, 23, '2018-10-21', '13:00:00', '', '', 1),
(213, 1, 1, 1, 21, 23, '2018-10-21', '13:00:00', '', '', 1),
(214, 1, 1, 1, 23, 23, '2018-10-21', '13:00:00', '', '', 1),
(215, 1, 1, 1, 24, 23, '2018-10-21', '13:00:00', '', '', 1),
(216, 1, 1, 1, 25, 23, '2018-10-21', '13:00:00', '', '', 1),
(217, 1, 1, 1, 26, 23, '2018-10-21', '13:00:00', '', '', 1),
(218, 1, 1, 1, 27, 23, '2018-10-21', '13:00:00', '', '', 1),
(219, 1, 1, 1, 28, 23, '2018-10-21', '13:00:00', '', '', 1),
(220, 1, 1, 1, 29, 23, '2018-10-21', '13:00:00', '', '', 1),
(221, 7, 3, 1, 20, 23, '2018-10-22', '13:00:00', 'Esta enfermo', NULL, 1),
(222, 7, 2, 1, 21, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(223, 7, 1, 1, 22, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(224, 7, 4, 1, 23, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(225, 7, 4, 1, 24, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(226, 7, 3, 1, 25, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(227, 7, 3, 1, 26, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(228, 7, 3, 1, 27, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(229, 7, 2, 1, 28, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(230, 7, 1, 1, 29, 23, '2018-10-22', '13:00:00', NULL, NULL, 1),
(231, 4, 3, 1, 20, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(232, 4, 1, 1, 21, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(233, 4, 2, 1, 22, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(234, 4, 1, 1, 23, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(235, 4, 4, 1, 24, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(236, 4, 3, 1, 25, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(237, 4, 3, 1, 26, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(238, 4, 3, 1, 27, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(239, 4, 2, 1, 28, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(240, 4, 1, 1, 29, 23, '2018-10-23', '13:00:00', NULL, NULL, 1),
(241, 7, 9, 3, 20, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(242, 7, 9, 3, 21, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(243, 7, 10, 3, 22, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(244, 7, 12, 3, 23, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(245, 7, 11, 3, 24, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(246, 7, 11, 3, 25, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(247, 7, 11, 3, 26, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(248, 7, 9, 3, 27, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(249, 7, 9, 3, 28, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(250, 7, 9, 3, 29, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(251, 7, 1, 1, 20, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(252, 7, 1, 1, 21, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(253, 7, 1, 1, 22, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(254, 7, 1, 1, 23, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(255, 7, 1, 1, 24, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(256, 7, 1, 1, 25, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(257, 7, 1, 1, 26, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(258, 7, 1, 1, 27, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(259, 7, 1, 1, 28, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(260, 7, 1, 1, 29, 23, '2018-10-24', '13:00:00', NULL, NULL, 1),
(261, 7, 1, 1, 20, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(262, 7, 1, 1, 21, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(263, 7, 2, 1, 22, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(264, 7, 4, 1, 23, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(265, 7, 4, 1, 24, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(266, 7, 3, 1, 25, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(267, 7, 3, 1, 26, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(268, 7, 1, 1, 27, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(269, 7, 2, 1, 28, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(270, 7, 2, 1, 29, 23, '2018-10-27', '13:00:00', NULL, NULL, 1),
(271, 2, 2, 1, 20, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(272, 2, 1, 1, 21, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(273, 2, 4, 1, 22, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(274, 2, 3, 1, 23, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(275, 2, 1, 1, 24, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(276, 2, 3, 1, 25, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(277, 2, 3, 1, 26, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(278, 2, 2, 1, 27, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(279, 2, 2, 1, 28, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(280, 2, 2, 1, 29, 23, '2018-10-28', '13:00:00', NULL, NULL, 1),
(281, 3, 8, 2, 20, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(282, 3, 5, 2, 21, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(283, 3, 5, 2, 22, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(284, 3, 6, 2, 23, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(285, 3, 7, 2, 24, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(286, 3, 7, 2, 25, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(287, 3, 7, 2, 26, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(288, 3, 6, 2, 27, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(289, 3, 6, 2, 28, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(290, 3, 7, 2, 29, 23, '2018-10-29', '13:00:00', NULL, NULL, 1),
(291, 1, 11, 1, 10, 11, '2018-10-21', '13:00:00', 'Aviso que no vendra', '', 1),
(292, 1, 1, 1, 11, 11, '2018-10-21', '13:00:00', '', '', 1),
(293, 1, 2, 1, 12, 11, '2018-10-21', '13:00:00', '', '', 1),
(294, 1, 4, 1, 13, 11, '2018-10-21', '13:00:00', '', '', 1),
(295, 1, 3, 1, 14, 11, '2018-10-21', '13:00:00', '', '', 1),
(296, 1, 2, 1, 15, 11, '2018-10-21', '13:00:00', '', '', 1),
(297, 1, 2, 1, 16, 11, '2018-10-21', '13:00:00', '', '', 1),
(298, 1, 3, 1, 17, 11, '2018-10-21', '13:00:00', '', '', 1),
(299, 1, 4, 1, 18, 11, '2018-10-21', '13:00:00', '', '', 1),
(300, 1, 1, 1, 19, 11, '2018-10-21', '13:00:00', '', '', 1),
(301, 1, 3, 1, 10, 11, '2018-10-22', '13:00:00', '', '', 1),
(302, 1, 3, 1, 11, 11, '2018-10-22', '13:00:00', '', '', 1),
(303, 1, 4, 1, 12, 11, '2018-10-22', '13:00:00', '', '', 1),
(304, 1, 1, 1, 13, 11, '2018-10-22', '13:00:00', '', '', 1),
(305, 1, 3, 1, 14, 11, '2018-10-22', '13:00:00', '', '', 1),
(306, 1, 2, 1, 15, 11, '2018-10-22', '13:00:00', '', '', 1),
(307, 1, 1, 1, 16, 11, '2018-10-22', '13:00:00', '', '', 1),
(308, 1, 3, 1, 17, 11, '2018-10-22', '13:00:00', '', '', 1),
(309, 1, 4, 1, 18, 11, '2018-10-22', '13:00:00', '', '', 1),
(310, 1, 1, 1, 19, 11, '2018-10-22', '13:00:00', '', '', 1),
(311, 1, 1, 1, 10, 11, '2018-10-23', '13:00:00', '', '', 1),
(312, 1, 3, 1, 11, 11, '2018-10-23', '13:00:00', '', '', 1),
(313, 1, 2, 1, 12, 11, '2018-10-23', '13:00:00', '', '', 1),
(314, 1, 1, 1, 13, 11, '2018-10-23', '13:00:00', '', '', 1),
(315, 1, 3, 1, 14, 11, '2018-10-23', '13:00:00', '', 'Esta de viaje', 1),
(316, 1, 1, 1, 15, 11, '2018-10-23', '13:00:00', '', '', 1),
(317, 1, 2, 1, 16, 11, '2018-10-23', '13:00:00', '', '', 1),
(318, 1, 4, 1, 17, 11, '2018-10-23', '13:00:00', '', '', 1),
(319, 1, 3, 1, 18, 11, '2018-10-23', '13:00:00', '', '', 1),
(320, 1, 2, 1, 19, 11, '2018-10-23', '13:00:00', '', '', 1),
(321, 5, 1, 1, 10, 11, '2018-10-24', '13:00:00', '', '', 1),
(322, 5, 1, 1, 11, 11, '2018-10-24', '13:00:00', '', '', 1),
(323, 5, 1, 1, 12, 11, '2018-10-24', '13:00:00', '', '', 1),
(324, 5, 1, 1, 13, 11, '2018-10-24', '13:00:00', '', '', 1),
(325, 5, 1, 1, 14, 11, '2018-10-24', '13:00:00', '', '', 1),
(326, 5, 1, 1, 15, 11, '2018-10-24', '13:00:00', '', '', 1),
(327, 5, 1, 1, 16, 11, '2018-10-24', '13:00:00', '', '', 1),
(328, 5, 1, 1, 17, 11, '2018-10-24', '13:00:00', '', '', 1),
(329, 5, 1, 1, 18, 11, '2018-10-24', '13:00:00', '', '', 1),
(330, 5, 1, 1, 19, 11, '2018-10-24', '13:00:00', '', '', 1),
(331, 1, 5, 2, 10, 11, '2018-10-24', '13:00:00', '', '', 1),
(332, 1, 8, 2, 11, 11, '2018-10-24', '13:00:00', '', '', 1),
(333, 1, 6, 2, 12, 11, '2018-10-24', '13:00:00', '', '', 1),
(334, 1, 8, 2, 13, 11, '2018-10-24', '13:00:00', '', '', 1),
(335, 1, 5, 2, 14, 11, '2018-10-24', '13:00:00', '', '', 1),
(336, 1, 7, 2, 15, 11, '2018-10-24', '13:00:00', '', '', 1),
(337, 1, 7, 2, 16, 11, '2018-10-24', '13:00:00', '', '', 1),
(338, 1, 5, 2, 17, 11, '2018-10-24', '13:00:00', '', '', 1),
(339, 1, 7, 2, 18, 11, '2018-10-24', '13:00:00', '', '', 1),
(340, 1, 6, 2, 19, 11, '2018-10-24', '13:00:00', '', '', 1),
(341, 1, 4, 1, 10, 11, '2018-10-27', '13:00:00', 'Aviso que no vendra', '', 1),
(342, 1, 1, 1, 11, 11, '2018-10-27', '13:00:00', '', '', 1),
(343, 1, 2, 1, 12, 11, '2018-10-27', '13:00:00', '', '', 1),
(344, 1, 4, 1, 13, 11, '2018-10-27', '13:00:00', '', '', 1),
(345, 1, 3, 1, 14, 11, '2018-10-27', '13:00:00', '', '', 1),
(346, 1, 2, 1, 15, 11, '2018-10-27', '13:00:00', '', '', 1),
(347, 1, 2, 1, 16, 11, '2018-10-27', '13:00:00', '', '', 1),
(348, 1, 3, 1, 17, 11, '2018-10-27', '13:00:00', '', '', 1),
(349, 1, 4, 1, 18, 11, '2018-10-27', '13:00:00', '', '', 1),
(350, 1, 1, 1, 19, 11, '2018-10-27', '13:00:00', '', '', 1),
(351, 1, 1, 1, 10, 11, '2018-10-28', '13:00:00', '', '', 1),
(352, 1, 1, 1, 11, 11, '2018-10-28', '13:00:00', '', '', 1),
(353, 1, 2, 1, 12, 11, '2018-10-28', '13:00:00', '', '', 1),
(354, 1, 4, 1, 13, 11, '2018-10-28', '13:00:00', '', '', 1),
(355, 1, 3, 1, 14, 11, '2018-10-28', '13:00:00', '', '', 1),
(356, 1, 2, 1, 15, 11, '2018-10-28', '13:00:00', '', '', 1),
(357, 1, 2, 1, 16, 11, '2018-10-28', '13:00:00', '', 'C murio', 1),
(358, 1, 3, 1, 17, 11, '2018-10-28', '13:00:00', '', '', 1),
(359, 1, 4, 1, 18, 11, '2018-10-28', '13:00:00', '', '', 1),
(360, 1, 1, 1, 19, 11, '2018-10-28', '13:00:00', '', '', 1),
(361, 4, 1, 1, 45, 24, '2018-09-24', '12:40:00', '', '', 1),
(362, 4, 2, 1, 46, 24, '2018-09-24', '12:40:00', '', '', 1),
(363, 4, 3, 1, 47, 24, '2018-09-24', '12:40:00', '', '', 1),
(364, 4, 3, 1, 48, 24, '2018-09-24', '12:40:00', '', '', 1),
(365, 4, 1, 1, 49, 24, '2018-09-24', '12:40:00', '', '', 1),
(366, 4, 2, 1, 50, 24, '2018-09-24', '12:40:00', '', '', 1),
(367, 4, 1, 1, 51, 24, '2018-09-24', '12:40:00', '', '', 1),
(368, 4, 1, 1, 52, 24, '2018-09-24', '12:40:00', '', '', 1),
(369, 4, 1, 1, 53, 24, '2018-09-24', '12:40:00', '', '', 1),
(370, 2, 9, 3, 45, 24, '2018-09-25', '13:00:00', '', '', 1),
(371, 2, 10, 3, 46, 24, '2018-09-25', '13:00:00', '', '', 1),
(372, 2, 9, 3, 47, 24, '2018-09-25', '13:00:00', '', '', 1),
(373, 2, 11, 3, 48, 24, '2018-09-25', '13:00:00', '', '', 1),
(374, 2, 9, 3, 49, 24, '2018-09-25', '13:00:00', '', '', 1),
(375, 2, 9, 3, 50, 24, '2018-09-25', '13:00:00', '', '', 1),
(376, 2, 9, 3, 51, 24, '2018-09-25', '13:00:00', '', '', 1),
(377, 2, 11, 3, 52, 24, '2018-09-25', '13:00:00', '', '', 1),
(378, 2, 12, 3, 53, 24, '2018-09-25', '13:00:00', '', '', 1),
(379, 4, 1, 1, 45, 24, '2018-09-25', '13:00:00', '', '', 1),
(380, 4, 1, 1, 46, 24, '2018-09-25', '13:00:00', '', '', 1),
(381, 4, 11, 1, 47, 24, '2018-09-25', '13:00:00', '', '', 1),
(382, 4, 1, 1, 48, 24, '2018-09-25', '13:00:00', '', '', 1),
(383, 4, 1, 1, 49, 24, '2018-09-25', '13:00:00', '', '', 1),
(384, 4, 1, 1, 50, 24, '2018-09-25', '13:00:00', '', '', 1),
(385, 4, 1, 1, 51, 24, '2018-09-25', '13:00:00', '', '', 1),
(386, 4, 1, 1, 52, 24, '2018-09-25', '13:00:00', '', '', 1),
(387, 4, 1, 1, 53, 24, '2018-09-25', '13:00:00', '', '', 1),
(388, 6, 3, 1, 45, 24, '2018-09-26', '13:10:00', '', '', 1),
(389, 6, 2, 1, 46, 24, '2018-09-26', '13:10:00', '', '', 1),
(390, 6, 4, 1, 47, 24, '2018-09-26', '13:10:00', '', '', 1),
(391, 6, 1, 1, 48, 24, '2018-09-26', '13:10:00', '', '', 1),
(392, 6, 1, 1, 49, 24, '2018-09-26', '13:10:00', '', '', 1),
(393, 6, 2, 1, 50, 24, '2018-09-26', '13:10:00', '', '', 1),
(394, 6, 2, 1, 51, 24, '2018-09-26', '13:10:00', '', '', 1),
(395, 6, 3, 1, 52, 24, '2018-09-26', '13:10:00', '', '', 1),
(396, 6, 1, 1, 53, 24, '2018-09-26', '13:10:00', '', '', 1),
(397, 4, 9, 3, 45, 24, '2018-09-27', '13:00:00', '', '', 1),
(398, 4, 10, 3, 46, 24, '2018-09-27', '13:00:00', '', '', 1),
(399, 4, 9, 3, 47, 24, '2018-09-27', '13:00:00', '', '', 1),
(400, 4, 9, 3, 48, 24, '2018-09-27', '13:00:00', '', '', 1),
(401, 4, 11, 3, 49, 24, '2018-09-27', '13:00:00', '', '', 1),
(402, 4, 10, 3, 50, 24, '2018-09-27', '13:00:00', '', '', 1),
(403, 4, 9, 3, 51, 24, '2018-09-27', '13:00:00', '', '', 1),
(404, 4, 1, 3, 52, 24, '2018-09-27', '13:00:00', '', '', 1),
(405, 4, 1, 3, 53, 24, '2018-09-27', '13:00:00', '', '', 1),
(406, 4, 1, 1, 45, 24, '2018-09-27', '13:00:00', '', '', 1),
(407, 4, 1, 1, 46, 24, '2018-09-27', '13:00:00', '', '', 1),
(408, 4, 1, 1, 47, 24, '2018-09-27', '13:00:00', '', '', 1),
(409, 4, 1, 1, 48, 24, '2018-09-27', '13:00:00', '', '', 1),
(410, 4, 1, 1, 49, 24, '2018-09-27', '13:00:00', '', '', 1),
(411, 4, 1, 1, 50, 24, '2018-09-27', '13:00:00', '', '', 1),
(412, 4, 1, 1, 21, 24, '2018-09-27', '13:00:00', '', '', 1),
(413, 4, 1, 1, 52, 24, '2018-09-27', '13:00:00', '', '', 1),
(414, 4, 1, 1, 53, 24, '2018-09-27', '13:00:00', '', '', 1),
(415, 4, 4, 1, 45, 24, '2018-09-28', '13:00:00', '', '', 1),
(416, 4, 2, 1, 46, 24, '2018-09-28', '13:00:00', '', '', 1),
(417, 4, 3, 1, 47, 24, '2018-09-28', '13:00:00', '', '', 1),
(418, 4, 3, 1, 48, 24, '2018-09-28', '13:00:00', '', '', 1),
(419, 4, 1, 1, 49, 24, '2018-09-28', '13:00:00', '', '', 1),
(420, 4, 1, 1, 50, 24, '2018-09-28', '13:00:00', '', '', 1),
(421, 4, 1, 1, 51, 24, '2018-09-28', '13:00:00', '', '', 1),
(422, 4, 1, 1, 52, 24, '2018-09-28', '13:00:00', '', '', 1),
(423, 4, 2, 1, 53, 24, '2018-09-28', '13:00:00', '', '', 1),
(424, 4, 1, 1, 45, 24, '2018-09-29', '13:00:00', '', '', 1),
(425, 4, 3, 1, 46, 24, '2018-09-29', '13:00:00', '', '', 1),
(426, 4, 3, 1, 47, 24, '2018-09-29', '13:00:00', '', '', 1),
(427, 4, 1, 1, 48, 24, '2018-09-29', '13:00:00', '', '', 1),
(428, 4, 1, 1, 49, 24, '2018-09-29', '13:00:00', '', '', 1),
(429, 4, 2, 1, 50, 24, '2018-09-29', '13:00:00', '', '', 1),
(430, 4, 1, 1, 51, 24, '2018-09-29', '13:00:00', '', '', 1),
(431, 4, 1, 1, 52, 24, '2018-09-29', '13:00:00', '', '', 1),
(432, 4, 2, 1, 53, 24, '2018-09-29', '13:00:00', '', '', 1),
(433, 4, 1, 1, 45, 24, '2018-10-01', '12:40:00', '', '', 1),
(434, 4, 4, 1, 46, 24, '2018-10-01', '12:40:00', '', '', 1),
(435, 4, 2, 1, 47, 24, '2018-10-01', '12:40:00', '', '', 1),
(436, 4, 2, 1, 48, 24, '2018-10-01', '12:40:00', '', '', 1),
(437, 4, 1, 1, 49, 24, '2018-10-01', '12:40:00', '', '', 1),
(438, 4, 2, 1, 50, 24, '2018-10-01', '12:40:00', '', '', 1),
(439, 4, 4, 1, 51, 24, '2018-10-01', '12:40:00', '', '', 1),
(440, 4, 3, 1, 52, 24, '2018-10-01', '12:40:00', '', '', 1),
(441, 4, 4, 1, 53, 24, '2018-10-01', '12:40:00', '', '', 1),
(442, 2, 10, 3, 45, 24, '2018-10-02', '13:00:00', '', '', 1),
(443, 2, 11, 3, 46, 24, '2018-10-02', '13:00:00', '', '', 1),
(444, 2, 9, 3, 47, 24, '2018-10-02', '13:00:00', '', '', 1),
(445, 2, 9, 3, 48, 24, '2018-10-02', '13:00:00', '', '', 1),
(446, 2, 9, 3, 49, 24, '2018-10-02', '13:00:00', '', '', 1),
(447, 2, 10, 3, 50, 24, '2018-10-02', '13:00:00', '', '', 1),
(448, 2, 11, 3, 51, 24, '2018-10-02', '13:00:00', '', '', 1),
(449, 2, 12, 3, 52, 24, '2018-10-02', '13:00:00', '', '', 1),
(450, 2, 11, 3, 53, 24, '2018-10-02', '13:00:00', '', '', 1),
(451, 2, 1, 1, 45, 24, '2018-10-02', '13:00:00', '', '', 1),
(452, 2, 1, 1, 46, 24, '2018-10-02', '13:00:00', '', '', 1),
(453, 2, 1, 1, 47, 24, '2018-10-02', '13:00:00', '', '', 1),
(454, 2, 1, 1, 48, 24, '2018-10-02', '13:00:00', '', '', 1),
(455, 2, 1, 1, 49, 24, '2018-10-02', '13:00:00', '', '', 1),
(456, 2, 1, 1, 50, 24, '2018-10-02', '13:00:00', '', '', 1),
(457, 2, 1, 1, 51, 24, '2018-10-02', '13:00:00', '', '', 1),
(458, 2, 1, 1, 52, 24, '2018-10-02', '13:00:00', '', '', 1),
(459, 2, 1, 1, 53, 24, '2018-10-02', '13:00:00', '', '', 1),
(460, 4, 1, 1, 45, 24, '2018-10-03', '13:10:00', '', '', 1),
(461, 4, 2, 1, 46, 24, '2018-10-03', '13:10:00', '', '', 1),
(462, 4, 1, 1, 47, 24, '2018-10-03', '13:10:00', '', '', 1),
(463, 4, 1, 1, 48, 24, '2018-10-03', '13:10:00', '', '', 1),
(464, 4, 1, 1, 49, 24, '2018-10-03', '13:10:00', '', '', 1),
(465, 4, 2, 1, 50, 24, '2018-10-03', '13:10:00', '', '', 1),
(466, 4, 4, 1, 51, 24, '2018-10-03', '13:10:00', '', '', 1),
(467, 4, 3, 1, 52, 24, '2018-10-03', '13:10:00', '', '', 1),
(468, 4, 3, 1, 53, 24, '2018-10-03', '13:10:00', '', '', 1),
(469, 4, 11, 3, 45, 24, '2018-10-04', '13:00:00', '', '', 1),
(470, 4, 10, 3, 46, 24, '2018-10-04', '13:00:00', '', '', 1),
(471, 4, 9, 3, 47, 24, '2018-10-04', '13:00:00', '', '', 1),
(472, 4, 9, 3, 48, 24, '2018-10-04', '13:00:00', '', '', 1),
(473, 4, 11, 3, 49, 24, '2018-10-04', '13:00:00', '', '', 1),
(474, 4, 11, 3, 50, 24, '2018-10-04', '13:00:00', '', '', 1),
(475, 4, 10, 3, 51, 24, '2018-10-04', '13:00:00', '', '', 1),
(476, 4, 10, 3, 52, 24, '2018-10-04', '13:00:00', '', '', 1),
(477, 4, 12, 3, 53, 24, '2018-10-04', '13:00:00', '', '', 1),
(478, 4, 1, 1, 45, 24, '2018-10-04', '13:00:00', '', '', 1),
(479, 4, 1, 1, 46, 24, '2018-10-04', '13:00:00', '', '', 1),
(480, 4, 1, 1, 47, 24, '2018-10-04', '13:00:00', '', '', 1),
(481, 4, 1, 1, 48, 24, '2018-10-04', '13:00:00', '', '', 1),
(482, 4, 1, 1, 49, 24, '2018-10-04', '13:00:00', '', '', 1),
(483, 4, 1, 1, 50, 24, '2018-10-04', '13:00:00', '', '', 1),
(484, 4, 1, 1, 51, 24, '2018-10-04', '13:00:00', '', '', 1),
(485, 4, 1, 1, 52, 24, '2018-10-04', '13:00:00', '', '', 1),
(486, 4, 1, 1, 53, 24, '2018-10-04', '13:00:00', '', '', 1),
(487, 4, 1, 1, 45, 24, '2018-10-05', '13:00:00', '', '', 1),
(488, 4, 2, 1, 46, 24, '2018-10-05', '13:00:00', '', '', 1),
(489, 4, 3, 1, 47, 24, '2018-10-05', '13:00:00', '', '', 1),
(490, 4, 3, 1, 48, 24, '2018-10-05', '13:00:00', '', '', 1),
(491, 4, 1, 1, 49, 24, '2018-10-05', '13:00:00', '', '', 1),
(492, 4, 3, 1, 50, 24, '2018-10-05', '13:00:00', '', '', 1),
(493, 4, 1, 1, 51, 24, '2018-10-05', '13:00:00', '', '', 1),
(494, 4, 1, 1, 52, 24, '2018-10-05', '13:00:00', '', '', 1),
(495, 4, 4, 1, 53, 24, '2018-10-05', '13:00:00', '', '', 1),
(496, 4, 2, 1, 45, 24, '2018-10-08', '12:40:00', '', '', 1),
(497, 4, 1, 1, 46, 24, '2018-10-08', '12:40:00', '', '', 1),
(498, 4, 2, 1, 47, 24, '2018-10-08', '12:40:00', '', '', 1),
(499, 4, 2, 1, 48, 24, '2018-10-08', '12:40:00', '', '', 1),
(500, 4, 1, 1, 49, 24, '2018-10-08', '12:40:00', '', '', 1),
(501, 4, 2, 1, 50, 24, '2018-10-08', '12:40:00', '', '', 1),
(502, 4, 4, 1, 51, 24, '2018-10-08', '12:40:00', '', '', 1),
(503, 4, 3, 1, 52, 24, '2018-10-08', '12:40:00', '', '', 1),
(504, 4, 3, 1, 53, 24, '2018-10-08', '12:40:00', '', '', 1),
(505, 2, 10, 3, 45, 24, '2018-10-09', '13:00:00', '', '', 1),
(506, 2, 9, 3, 46, 24, '2018-10-09', '13:00:00', '', '', 1),
(507, 2, 9, 3, 47, 24, '2018-10-09', '13:00:00', '', '', 1),
(508, 2, 10, 3, 48, 24, '2018-10-09', '13:00:00', '', '', 1),
(509, 2, 9, 3, 49, 24, '2018-10-09', '13:00:00', '', '', 1),
(510, 2, 11, 3, 50, 24, '2018-10-09', '13:00:00', '', '', 1),
(511, 2, 9, 3, 51, 24, '2018-10-09', '13:00:00', '', '', 1),
(512, 2, 12, 3, 52, 24, '2018-10-09', '13:00:00', '', '', 1),
(513, 2, 12, 3, 53, 24, '2018-10-09', '13:00:00', '', '', 1),
(514, 2, 1, 1, 45, 24, '2018-10-09', '13:00:00', '', '', 1),
(515, 2, 1, 1, 46, 24, '2018-10-09', '13:00:00', '', '', 1),
(516, 2, 1, 1, 47, 24, '2018-10-09', '13:00:00', '', '', 1),
(517, 2, 1, 1, 48, 24, '2018-10-09', '13:00:00', '', '', 1),
(518, 2, 1, 1, 49, 24, '2018-10-09', '13:00:00', '', '', 1),
(519, 2, 1, 1, 50, 24, '2018-10-09', '13:00:00', '', '', 1),
(520, 2, 1, 1, 51, 24, '2018-10-09', '13:00:00', '', '', 1),
(521, 2, 1, 1, 52, 24, '2018-10-09', '13:00:00', '', '', 1),
(522, 2, 1, 1, 53, 24, '2018-10-09', '13:00:00', '', '', 1),
(523, 4, 1, 1, 45, 24, '2018-10-10', '13:10:00', '', '', 1),
(524, 4, 2, 1, 46, 24, '2018-10-10', '13:10:00', '', '', 1),
(525, 4, 1, 1, 47, 24, '2018-10-10', '13:10:00', '', '', 1),
(526, 4, 1, 1, 48, 24, '2018-10-10', '13:10:00', '', '', 1),
(527, 4, 1, 1, 49, 24, '2018-10-10', '13:10:00', '', '', 1),
(528, 4, 2, 1, 50, 24, '2018-10-10', '13:10:00', '', '', 1),
(529, 4, 4, 1, 51, 24, '2018-10-10', '13:10:00', '', '', 1),
(530, 4, 3, 1, 52, 24, '2018-10-10', '13:10:00', '', '', 1),
(531, 4, 3, 1, 53, 24, '2018-10-10', '13:10:00', '', '', 1),
(532, 4, 9, 3, 45, 24, '2018-10-11', '13:00:00', '', '', 1),
(533, 4, 10, 3, 46, 24, '2018-10-11', '13:00:00', '', '', 1),
(534, 4, 9, 3, 47, 24, '2018-10-11', '13:00:00', '', '', 1),
(535, 4, 9, 3, 48, 24, '2018-10-11', '13:00:00', '', '', 1),
(536, 4, 9, 3, 49, 24, '2018-10-11', '13:00:00', '', '', 1),
(537, 4, 10, 3, 50, 24, '2018-10-11', '13:00:00', '', '', 1),
(538, 4, 9, 3, 51, 24, '2018-10-11', '13:00:00', '', '', 1),
(539, 4, 9, 3, 52, 24, '2018-10-11', '13:00:00', '', '', 1),
(540, 4, 11, 3, 53, 24, '2018-10-11', '13:00:00', '', '', 1),
(541, 4, 1, 1, 45, 24, '2018-10-11', '13:00:00', '', '', 1),
(542, 4, 1, 1, 46, 24, '2018-10-11', '13:00:00', '', '', 1),
(543, 4, 1, 1, 47, 24, '2018-10-11', '13:00:00', '', '', 1),
(544, 4, 1, 1, 48, 24, '2018-10-11', '13:00:00', '', '', 1),
(545, 4, 1, 1, 49, 24, '2018-10-11', '13:00:00', '', '', 1),
(546, 4, 1, 1, 50, 24, '2018-10-11', '13:00:00', '', '', 1),
(547, 4, 1, 1, 51, 24, '2018-10-11', '13:00:00', '', '', 1),
(548, 4, 1, 1, 52, 24, '2018-10-11', '13:00:00', '', '', 1),
(549, 4, 1, 1, 53, 24, '2018-10-11', '13:00:00', '', '', 1),
(550, 4, 4, 1, 45, 24, '2018-10-12', '13:00:00', '', '', 1),
(551, 4, 2, 1, 46, 24, '2018-10-12', '13:00:00', '', '', 1),
(552, 4, 3, 1, 47, 24, '2018-10-12', '13:00:00', '', '', 1),
(553, 4, 1, 1, 48, 24, '2018-10-12', '13:00:00', '', '', 1),
(554, 4, 2, 1, 49, 24, '2018-10-12', '13:00:00', '', '', 1),
(555, 4, 2, 1, 50, 24, '2018-10-12', '13:00:00', '', '', 1),
(556, 4, 3, 1, 51, 24, '2018-10-12', '13:00:00', '', '', 1),
(557, 4, 1, 1, 52, 24, '2018-10-12', '13:00:00', '', '', 1),
(558, 4, 4, 1, 53, 24, '2018-10-12', '13:00:00', '', '', 1),
(559, 4, 2, 1, 45, 24, '2018-10-15', '12:40:00', '', '', 1),
(560, 4, 2, 1, 46, 24, '2018-10-15', '12:40:00', '', '', 1),
(561, 4, 3, 1, 47, 24, '2018-10-15', '12:40:00', '', '', 1),
(562, 4, 2, 1, 48, 24, '2018-10-15', '12:40:00', '', '', 1),
(563, 4, 1, 1, 49, 24, '2018-10-15', '12:40:00', '', '', 1),
(564, 4, 2, 1, 50, 24, '2018-10-15', '12:40:00', '', '', 1),
(565, 4, 4, 1, 51, 24, '2018-10-15', '12:40:00', '', '', 1),
(566, 4, 3, 1, 52, 24, '2018-10-15', '12:40:00', '', '', 1),
(567, 4, 3, 1, 53, 24, '2018-10-15', '12:40:00', '', '', 1),
(568, 2, 12, 3, 45, 24, '2018-10-06', '13:00:00', '', '', 1),
(569, 2, 9, 3, 46, 24, '2018-10-06', '13:00:00', '', '', 1),
(570, 2, 10, 3, 47, 24, '2018-10-06', '13:00:00', '', '', 1),
(571, 2, 10, 3, 48, 24, '2018-10-06', '13:00:00', '', '', 1),
(572, 2, 9, 3, 49, 24, '2018-10-06', '13:00:00', '', '', 1),
(573, 2, 11, 3, 50, 24, '2018-10-06', '13:00:00', '', '', 1),
(574, 2, 9, 3, 51, 24, '2018-10-06', '13:00:00', '', '', 1),
(575, 2, 9, 3, 52, 24, '2018-10-06', '13:00:00', '', '', 1),
(576, 2, 12, 3, 53, 24, '2018-10-06', '13:00:00', '', '', 1),
(577, 2, 1, 1, 45, 24, '2018-10-16', '13:00:00', '', '', 1),
(578, 2, 1, 1, 46, 24, '2018-10-16', '13:00:00', '', '', 1),
(579, 2, 1, 1, 47, 24, '2018-10-16', '13:00:00', '', '', 1),
(580, 2, 1, 1, 48, 24, '2018-10-16', '13:00:00', '', '', 1),
(581, 2, 1, 1, 49, 24, '2018-10-16', '13:00:00', '', '', 1),
(582, 2, 1, 1, 50, 24, '2018-10-16', '13:00:00', '', '', 1),
(583, 2, 1, 1, 51, 24, '2018-10-16', '13:00:00', '', '', 1),
(584, 2, 1, 1, 52, 24, '2018-10-16', '13:00:00', '', '', 1),
(585, 2, 1, 1, 53, 24, '2018-10-16', '13:00:00', '', '', 1),
(586, 4, 1, 1, 45, 24, '2018-10-17', '13:10:00', '', '', 1),
(587, 4, 2, 1, 46, 24, '2018-10-17', '13:10:00', '', '', 1),
(588, 4, 1, 1, 47, 24, '2018-10-17', '13:10:00', '', '', 1),
(589, 4, 4, 1, 48, 24, '2018-10-17', '13:10:00', '', '', 1),
(590, 4, 1, 1, 49, 24, '2018-10-17', '13:10:00', '', '', 1),
(591, 4, 2, 1, 50, 24, '2018-10-17', '13:10:00', '', '', 1),
(592, 4, 4, 1, 51, 24, '2018-10-17', '13:10:00', '', '', 1),
(593, 4, 3, 1, 52, 24, '2018-10-17', '13:10:00', '', '', 1),
(594, 4, 3, 1, 53, 24, '2018-10-17', '13:10:00', '', '', 1),
(595, 4, 9, 3, 45, 24, '2018-10-18', '13:00:00', '', '', 1),
(596, 4, 9, 3, 46, 24, '2018-10-18', '13:00:00', '', '', 1),
(597, 4, 9, 3, 47, 24, '2018-10-18', '13:00:00', '', '', 1),
(598, 4, 9, 3, 48, 24, '2018-10-18', '13:00:00', '', '', 1),
(599, 4, 9, 3, 49, 24, '2018-10-18', '13:00:00', '', '', 1),
(600, 4, 10, 3, 50, 24, '2018-10-18', '13:00:00', '', '', 1),
(601, 4, 9, 3, 51, 24, '2018-10-18', '13:00:00', '', '', 1),
(602, 4, 9, 3, 52, 24, '2018-10-18', '13:00:00', '', '', 1),
(603, 4, 11, 3, 53, 24, '2018-10-18', '13:00:00', '', '', 1),
(604, 4, 1, 1, 45, 24, '2018-10-18', '13:00:00', '', '', 1),
(605, 4, 1, 1, 46, 24, '2018-10-18', '13:00:00', '', '', 1),
(606, 4, 1, 1, 47, 24, '2018-10-18', '13:00:00', '', '', 1),
(607, 4, 1, 1, 48, 24, '2018-10-18', '13:00:00', '', '', 1),
(608, 4, 1, 1, 49, 24, '2018-10-18', '13:00:00', '', '', 1),
(609, 4, 1, 1, 50, 24, '2018-10-18', '13:00:00', '', '', 1),
(610, 4, 1, 1, 51, 24, '2018-10-18', '13:00:00', '', '', 1),
(611, 4, 1, 1, 52, 24, '2018-10-18', '13:00:00', '', '', 1),
(612, 4, 1, 1, 53, 24, '2018-10-18', '13:00:00', '', '', 1),
(613, 4, 4, 1, 45, 24, '2018-10-19', '13:00:00', '', '', 1),
(614, 4, 2, 1, 46, 24, '2018-10-19', '13:00:00', '', '', 1),
(615, 4, 3, 1, 47, 24, '2018-10-19', '13:00:00', '', '', 1),
(616, 4, 1, 1, 48, 24, '2018-10-19', '13:00:00', '', '', 1),
(617, 4, 2, 1, 49, 24, '2018-10-19', '13:00:00', '', '', 1),
(618, 4, 2, 1, 50, 24, '2018-10-19', '13:00:00', '', '', 1),
(619, 4, 3, 1, 51, 24, '2018-10-19', '13:00:00', '', '', 1),
(620, 4, 1, 1, 52, 24, '2018-10-19', '13:00:00', '', '', 1),
(621, 4, 4, 1, 53, 24, '2018-10-19', '13:00:00', '', '', 1),
(622, 4, 1, 1, 45, 24, '2018-10-22', '12:40:00', '', '', 1),
(623, 4, 2, 1, 46, 24, '2018-10-22', '12:40:00', '', '', 1),
(624, 4, 3, 1, 47, 24, '2018-10-22', '12:40:00', '', '', 1),
(625, 4, 2, 1, 48, 24, '2018-10-22', '12:40:00', '', '', 1),
(626, 4, 1, 1, 49, 24, '2018-10-22', '12:40:00', '', '', 1),
(627, 4, 2, 1, 50, 24, '2018-10-22', '12:40:00', '', '', 1),
(628, 4, 4, 1, 51, 24, '2018-10-22', '12:40:00', '', '', 1),
(629, 4, 3, 1, 52, 24, '2018-10-22', '12:40:00', '', '', 1),
(630, 4, 3, 1, 53, 24, '2018-10-22', '12:40:00', '', '', 1),
(631, 2, 12, 3, 45, 24, '2018-10-23', '13:00:00', '', '', 1),
(632, 2, 9, 3, 46, 24, '2018-10-23', '13:00:00', '', '', 1),
(633, 2, 9, 3, 47, 24, '2018-10-23', '13:00:00', '', '', 1),
(634, 2, 10, 3, 48, 24, '2018-10-23', '13:00:00', '', '', 1),
(635, 2, 9, 3, 49, 24, '2018-10-23', '13:00:00', '', '', 1),
(636, 2, 11, 3, 50, 24, '2018-10-23', '13:00:00', '', '', 1),
(637, 2, 9, 3, 51, 24, '2018-10-23', '13:00:00', '', '', 1),
(638, 2, 9, 3, 52, 24, '2018-10-23', '13:00:00', '', '', 1),
(639, 2, 12, 3, 53, 24, '2018-10-23', '13:00:00', '', '', 1),
(640, 2, 1, 1, 45, 24, '2018-10-23', '13:00:00', '', '', 1),
(641, 2, 1, 1, 46, 24, '2018-10-23', '13:00:00', '', '', 1),
(642, 2, 1, 1, 47, 24, '2018-10-23', '13:00:00', '', '', 1),
(643, 2, 1, 1, 48, 24, '2018-10-23', '13:00:00', '', '', 1),
(644, 2, 1, 1, 49, 24, '2018-10-23', '13:00:00', '', '', 1),
(645, 2, 1, 1, 50, 24, '2018-10-23', '13:00:00', '', '', 1),
(646, 2, 1, 1, 51, 24, '2018-10-23', '13:00:00', '', '', 1),
(647, 2, 1, 1, 52, 24, '2018-10-23', '13:00:00', '', '', 1),
(648, 2, 1, 1, 53, 24, '2018-10-23', '13:00:00', '', '', 1),
(649, 4, 1, 1, 45, 24, '2018-10-24', '13:10:00', '', '', 1),
(650, 4, 2, 1, 46, 24, '2018-10-24', '13:10:00', '', '', 1),
(651, 4, 1, 1, 47, 24, '2018-10-24', '13:10:00', '', '', 1),
(652, 4, 4, 1, 48, 24, '2018-10-24', '13:10:00', '', '', 1),
(653, 4, 1, 1, 49, 24, '2018-10-24', '13:10:00', '', '', 1),
(654, 4, 2, 1, 50, 24, '2018-10-24', '13:10:00', '', '', 1),
(655, 4, 4, 1, 51, 24, '2018-10-24', '13:10:00', '', '', 1),
(656, 4, 3, 1, 52, 24, '2018-10-24', '13:10:00', '', '', 1),
(657, 4, 3, 1, 53, 24, '2018-10-24', '13:10:00', '', '', 1),
(658, 4, 9, 3, 45, 24, '2018-10-25', '13:00:00', '', '', 1),
(659, 4, 9, 3, 46, 24, '2018-10-25', '13:00:00', '', '', 1),
(660, 4, 9, 3, 47, 24, '2018-10-25', '13:00:00', '', '', 1),
(661, 4, 9, 3, 48, 24, '2018-10-25', '13:00:00', '', '', 1),
(662, 4, 9, 3, 49, 24, '2018-10-25', '13:00:00', '', '', 1),
(663, 4, 10, 3, 50, 24, '2018-10-25', '13:00:00', '', '', 1),
(664, 4, 9, 3, 51, 24, '2018-10-25', '13:00:00', '', '', 1),
(665, 4, 9, 3, 52, 24, '2018-10-25', '13:00:00', '', '', 1),
(666, 4, 11, 3, 53, 24, '2018-10-25', '13:00:00', '', '', 1),
(667, 4, 1, 1, 45, 24, '2018-10-25', '13:00:00', '', '', 1),
(668, 4, 1, 1, 46, 24, '2018-10-25', '13:00:00', '', '', 1),
(669, 4, 1, 1, 47, 24, '2018-10-25', '13:00:00', '', '', 1),
(670, 4, 1, 1, 48, 24, '2018-10-25', '13:00:00', '', '', 1),
(671, 4, 1, 1, 49, 24, '2018-10-25', '13:00:00', '', '', 1),
(672, 4, 1, 1, 50, 24, '2018-10-25', '13:00:00', '', '', 1),
(673, 4, 1, 1, 51, 24, '2018-10-25', '13:00:00', '', '', 1),
(674, 4, 1, 1, 52, 24, '2018-10-25', '13:00:00', '', '', 1),
(675, 4, 1, 1, 53, 24, '2018-10-25', '13:00:00', '', '', 1),
(676, 4, 4, 1, 45, 24, '2018-10-26', '13:00:00', '', '', 1),
(677, 4, 2, 1, 46, 24, '2018-10-26', '13:00:00', '', '', 1),
(678, 4, 3, 1, 47, 24, '2018-10-26', '13:00:00', '', '', 1),
(679, 4, 1, 1, 48, 24, '2018-10-26', '13:00:00', '', '', 1),
(680, 4, 2, 1, 49, 24, '2018-10-26', '13:00:00', '', '', 1),
(681, 4, 2, 1, 50, 24, '2018-10-26', '13:00:00', '', '', 1),
(682, 4, 3, 1, 51, 24, '2018-10-26', '13:00:00', '', '', 1),
(683, 4, 1, 1, 52, 24, '2018-10-26', '13:00:00', '', '', 1),
(684, 4, 4, 1, 53, 24, '2018-10-26', '13:00:00', '', '', 1),
(685, 4, 1, 1, 45, 24, '2018-11-01', '12:40:00', '', '', 1),
(686, 4, 2, 1, 46, 24, '2018-11-01', '12:40:00', '', '', 1),
(687, 4, 3, 1, 47, 24, '2018-11-01', '12:40:00', '', '', 1),
(688, 4, 2, 1, 48, 24, '2018-11-01', '12:40:00', '', '', 1),
(689, 4, 1, 1, 49, 24, '2018-11-01', '12:40:00', '', '', 1),
(690, 4, 2, 1, 50, 24, '2018-11-01', '12:40:00', '', '', 1),
(691, 4, 4, 1, 51, 24, '2018-11-01', '12:40:00', '', '', 1),
(692, 4, 3, 1, 52, 24, '2018-11-01', '12:40:00', '', '', 1),
(693, 4, 3, 1, 53, 24, '2018-11-01', '12:40:00', '', '', 1),
(694, 2, 12, 3, 45, 24, '2018-11-02', '13:00:00', '', '', 1),
(695, 2, 9, 3, 46, 24, '2018-11-02', '13:00:00', '', '', 1),
(696, 2, 9, 3, 47, 24, '2018-11-02', '13:00:00', '', '', 1),
(697, 2, 10, 3, 48, 24, '2018-11-02', '13:00:00', '', '', 1),
(698, 2, 9, 3, 49, 24, '2018-11-02', '13:00:00', '', '', 1),
(699, 2, 11, 3, 50, 24, '2018-11-02', '13:00:00', '', '', 1),
(700, 2, 9, 3, 51, 24, '2018-11-02', '13:00:00', '', '', 1),
(701, 2, 9, 3, 52, 24, '2018-11-02', '13:00:00', '', '', 1),
(702, 2, 12, 3, 53, 24, '2018-11-02', '13:00:00', '', '', 1),
(703, 2, 1, 1, 45, 24, '2018-11-02', '13:00:00', '', '', 1),
(704, 2, 1, 1, 46, 24, '2018-11-02', '13:00:00', '', '', 1),
(705, 2, 1, 1, 47, 24, '2018-11-02', '13:00:00', '', '', 1),
(706, 2, 1, 1, 48, 24, '2018-11-02', '13:00:00', '', '', 1),
(707, 2, 1, 1, 49, 24, '2018-11-02', '13:00:00', '', '', 1),
(708, 2, 1, 1, 50, 24, '2018-11-02', '13:00:00', '', '', 1),
(709, 2, 1, 1, 51, 24, '2018-11-02', '13:00:00', '', '', 1),
(710, 2, 1, 1, 52, 24, '2018-11-02', '13:00:00', '', '', 1),
(711, 2, 1, 1, 53, 24, '2018-11-02', '13:00:00', '', '', 1),
(712, 4, 1, 1, 45, 24, '2018-11-03', '13:10:00', '', '', 1),
(713, 4, 2, 1, 46, 24, '2018-11-03', '13:10:00', '', '', 1),
(714, 4, 1, 1, 47, 24, '2018-11-03', '13:10:00', '', '', 1),
(715, 4, 4, 1, 48, 24, '2018-11-03', '13:10:00', '', '', 1),
(716, 4, 1, 1, 49, 24, '2018-11-03', '13:10:00', '', '', 1),
(717, 4, 2, 1, 50, 24, '2018-11-03', '13:10:00', '', '', 1),
(718, 4, 4, 1, 51, 24, '2018-11-03', '13:10:00', '', '', 1),
(719, 4, 3, 1, 52, 24, '2018-11-03', '13:10:00', '', '', 1),
(720, 4, 3, 1, 53, 24, '2018-11-03', '13:10:00', '', '', 1),
(721, 4, 9, 3, 45, 24, '2018-11-04', '13:00:00', '', '', 1),
(722, 4, 9, 3, 46, 24, '2018-11-04', '13:00:00', '', '', 1),
(723, 4, 9, 3, 47, 24, '2018-11-04', '13:00:00', '', '', 1),
(724, 4, 9, 3, 48, 24, '2018-11-04', '13:00:00', '', '', 1),
(725, 4, 9, 3, 49, 24, '2018-11-04', '13:00:00', '', '', 1),
(726, 4, 10, 3, 50, 24, '2018-11-04', '13:00:00', '', '', 1),
(727, 4, 9, 3, 51, 24, '2018-11-04', '13:00:00', '', '', 1),
(728, 4, 9, 3, 52, 24, '2018-11-04', '13:00:00', '', '', 1),
(729, 4, 11, 3, 53, 24, '2018-11-04', '13:00:00', '', '', 1),
(730, 4, 1, 1, 45, 24, '2018-11-04', '13:00:00', '', '', 1),
(731, 4, 1, 1, 46, 24, '2018-11-04', '13:00:00', '', '', 1),
(732, 4, 1, 1, 47, 24, '2018-11-04', '13:00:00', '', '', 1),
(733, 4, 1, 1, 48, 24, '2018-11-04', '13:00:00', '', '', 1),
(734, 4, 1, 1, 49, 24, '2018-11-04', '13:00:00', '', '', 1),
(735, 4, 1, 1, 50, 24, '2018-11-04', '13:00:00', '', '', 1),
(736, 4, 1, 1, 51, 24, '2018-11-04', '13:00:00', '', '', 1),
(737, 4, 1, 1, 52, 24, '2018-11-04', '13:00:00', '', '', 1),
(738, 4, 1, 1, 53, 24, '2018-11-04', '13:00:00', '', '', 1),
(739, 4, 4, 1, 45, 24, '2018-11-05', '13:00:00', '', '', 1),
(740, 4, 2, 1, 46, 24, '2018-11-05', '13:00:00', '', '', 1),
(741, 4, 3, 1, 47, 24, '2018-11-05', '13:00:00', '', '', 1),
(742, 4, 1, 1, 48, 24, '2018-11-05', '13:00:00', '', '', 1),
(743, 4, 2, 1, 49, 24, '2018-11-05', '13:00:00', '', '', 1),
(744, 4, 2, 1, 50, 24, '2018-11-05', '13:00:00', '', '', 1),
(745, 4, 3, 1, 51, 24, '2018-11-05', '13:00:00', '', '', 1),
(746, 4, 1, 1, 52, 24, '2018-11-05', '13:00:00', '', '', 1),
(747, 4, 4, 1, 53, 24, '2018-11-05', '13:00:00', '', '', 1),
(748, 4, 1, 1, 45, 24, '2018-11-08', '12:40:00', '', '', 1),
(749, 4, 2, 1, 46, 24, '2018-11-08', '12:40:00', '', '', 1),
(750, 4, 3, 1, 47, 24, '2018-11-08', '12:40:00', '', '', 1),
(751, 4, 2, 1, 48, 24, '2018-11-08', '12:40:00', '', '', 1),
(752, 4, 1, 1, 49, 24, '2018-11-08', '12:40:00', '', '', 1),
(753, 4, 2, 1, 50, 24, '2018-11-08', '12:40:00', '', '', 1),
(754, 4, 4, 1, 51, 24, '2018-11-08', '12:40:00', '', '', 1),
(755, 4, 3, 1, 52, 24, '2018-11-08', '12:40:00', '', '', 1),
(756, 4, 3, 1, 53, 24, '2018-11-08', '12:40:00', '', '', 1),
(757, 2, 12, 3, 45, 24, '2018-11-09', '13:00:00', '', '', 1),
(758, 2, 9, 3, 46, 24, '2018-11-09', '13:00:00', '', '', 1),
(759, 2, 9, 3, 47, 24, '2018-11-09', '13:00:00', '', '', 1),
(760, 2, 10, 3, 48, 24, '2018-11-09', '13:00:00', '', '', 1),
(761, 2, 9, 3, 49, 24, '2018-11-09', '13:00:00', '', '', 1),
(762, 2, 11, 3, 50, 24, '2018-11-09', '13:00:00', '', '', 1),
(763, 2, 9, 3, 51, 24, '2018-11-09', '13:00:00', '', '', 1),
(764, 2, 9, 3, 52, 24, '2018-11-09', '13:00:00', '', '', 1),
(765, 2, 12, 3, 53, 24, '2018-11-09', '13:00:00', '', '', 1),
(766, 2, 1, 1, 45, 24, '2018-11-09', '13:00:00', '', '', 1),
(767, 2, 1, 1, 46, 24, '2018-11-09', '13:00:00', '', '', 1),
(768, 2, 1, 1, 47, 24, '2018-11-09', '13:00:00', '', '', 1),
(769, 2, 1, 1, 48, 24, '2018-11-09', '13:00:00', '', '', 1),
(770, 2, 1, 1, 49, 24, '2018-11-09', '13:00:00', '', '', 1),
(771, 2, 1, 1, 50, 24, '2018-11-09', '13:00:00', '', '', 1),
(772, 2, 1, 1, 51, 24, '2018-11-09', '13:00:00', '', '', 1),
(773, 2, 1, 1, 52, 24, '2018-11-09', '13:00:00', '', '', 1),
(774, 2, 1, 1, 53, 24, '2018-11-09', '13:00:00', '', '', 1),
(775, 4, 1, 1, 45, 24, '2018-11-10', '13:10:00', '', '', 1),
(776, 4, 2, 1, 46, 24, '2018-11-10', '13:10:00', '', '', 1),
(777, 4, 1, 1, 47, 24, '2018-11-10', '13:10:00', '', '', 1),
(778, 4, 4, 1, 48, 24, '2018-11-10', '13:10:00', '', '', 1),
(779, 4, 1, 1, 49, 24, '2018-11-10', '13:10:00', '', '', 1),
(780, 4, 2, 1, 50, 24, '2018-11-10', '13:10:00', '', '', 1),
(781, 4, 4, 1, 51, 24, '2018-11-10', '13:10:00', '', '', 1),
(782, 4, 3, 1, 52, 24, '2018-11-10', '13:10:00', '', '', 1),
(783, 4, 3, 1, 53, 24, '2018-11-10', '13:10:00', '', '', 1),
(784, 4, 9, 3, 45, 24, '2018-11-11', '13:00:00', '', '', 1),
(785, 4, 9, 3, 46, 24, '2018-11-11', '13:00:00', '', '', 1),
(786, 4, 9, 3, 47, 24, '2018-11-11', '13:00:00', '', '', 1),
(787, 4, 9, 3, 48, 24, '2018-11-11', '13:00:00', '', '', 1),
(788, 4, 9, 3, 49, 24, '2018-11-11', '13:00:00', '', '', 1),
(789, 4, 10, 3, 50, 24, '2018-11-11', '13:00:00', '', '', 1),
(790, 4, 9, 3, 51, 24, '2018-11-11', '13:00:00', '', '', 1),
(791, 4, 9, 3, 52, 24, '2018-11-11', '13:00:00', '', '', 1),
(792, 4, 11, 3, 53, 24, '2018-11-11', '13:00:00', '', '', 1),
(793, 4, 1, 1, 45, 24, '2018-11-11', '13:00:00', '', '', 1),
(794, 4, 1, 1, 46, 24, '2018-11-11', '13:00:00', '', '', 1),
(795, 4, 1, 1, 47, 24, '2018-11-11', '13:00:00', '', '', 1),
(796, 4, 1, 1, 48, 24, '2018-11-11', '13:00:00', '', '', 1),
(797, 4, 1, 1, 49, 24, '2018-11-11', '13:00:00', '', '', 1),
(798, 4, 1, 1, 50, 24, '2018-11-11', '13:00:00', '', '', 1),
(799, 4, 1, 1, 51, 24, '2018-11-11', '13:00:00', '', '', 1),
(800, 4, 1, 1, 52, 24, '2018-11-11', '13:00:00', '', '', 1),
(801, 4, 12, 1, 53, 24, '2018-11-11', '13:00:00', '', '', 1),
(802, 4, 4, 1, 45, 24, '2018-11-12', '13:00:00', '', '', 1),
(803, 4, 2, 1, 46, 24, '2018-11-12', '13:00:00', '', '', 1),
(804, 4, 3, 1, 47, 24, '2018-11-12', '13:00:00', '', '', 1),
(805, 4, 1, 1, 48, 24, '2018-11-12', '13:00:00', '', '', 1),
(806, 4, 2, 1, 49, 24, '2018-11-12', '13:00:00', '', '', 1),
(807, 4, 2, 1, 50, 24, '2018-11-12', '13:00:00', '', '', 1),
(808, 4, 3, 1, 51, 24, '2018-11-12', '13:00:00', '', '', 1),
(809, 4, 1, 1, 52, 24, '2018-11-12', '13:00:00', '', '', 1),
(810, 4, 4, 1, 53, 24, '2018-11-12', '13:00:00', '', '', 1),
(811, 4, 1, 1, 45, 24, '2018-11-15', '12:40:00', '', '', 1),
(812, 4, 2, 1, 46, 24, '2018-11-15', '12:40:00', '', '', 1),
(813, 4, 3, 1, 47, 24, '2018-11-15', '12:40:00', '', '', 1),
(814, 4, 2, 1, 48, 24, '2018-11-15', '12:40:00', '', '', 1),
(815, 4, 1, 1, 49, 24, '2018-11-15', '12:40:00', '', '', 1),
(816, 4, 2, 1, 50, 24, '2018-11-15', '12:40:00', '', '', 1),
(817, 4, 4, 1, 51, 24, '2018-11-15', '12:40:00', '', '', 1),
(818, 4, 3, 1, 52, 24, '2018-11-15', '12:40:00', '', '', 1),
(819, 4, 3, 1, 53, 24, '2018-11-15', '12:40:00', '', '', 1),
(820, 2, 12, 3, 45, 24, '2018-11-18', '13:00:00', '', '', 1),
(821, 2, 9, 3, 46, 24, '2018-11-18', '13:00:00', '', '', 1),
(822, 2, 9, 3, 47, 24, '2018-11-18', '13:00:00', '', '', 1),
(823, 2, 10, 3, 48, 24, '2018-11-18', '13:00:00', '', '', 1),
(824, 2, 9, 3, 49, 24, '2018-11-18', '13:00:00', '', '', 1),
(825, 2, 11, 3, 50, 24, '2018-11-18', '13:00:00', '', '', 1),
(826, 2, 9, 3, 51, 24, '2018-11-18', '13:00:00', '', '', 1),
(827, 2, 9, 3, 52, 24, '2018-11-18', '13:00:00', '', '', 1),
(828, 2, 12, 3, 53, 24, '2018-11-18', '13:00:00', '', '', 1),
(829, 2, 1, 1, 45, 24, '2018-11-16', '13:00:00', '', '', 1),
(830, 2, 1, 1, 46, 24, '2018-11-16', '13:00:00', '', '', 1),
(831, 2, 1, 1, 47, 24, '2018-11-16', '13:00:00', '', '', 1),
(832, 2, 1, 1, 48, 25, '2018-11-16', '13:00:00', '', '', 1),
(833, 2, 1, 1, 49, 24, '2018-11-16', '13:00:00', '', '', 1);
INSERT INTO `seguimientos` (`idSeguimiento`, `idUsuario`, `idMotivo`, `idSubmotivo`, `idAlumnxcurso`, `idCurso`, `fecha`, `hora`, `justificado`, `observaciones`, `estado`) VALUES
(834, 2, 1, 1, 50, 24, '2018-11-16', '13:00:00', '', '', 1),
(835, 2, 1, 1, 51, 24, '2018-11-16', '13:00:00', '', '', 1),
(836, 2, 1, 1, 52, 24, '2018-11-16', '13:00:00', '', '', 1),
(837, 2, 1, 1, 53, 24, '2018-11-16', '13:00:00', '', '', 1),
(838, 4, 1, 1, 45, 24, '2018-11-17', '13:10:00', '', '', 1),
(839, 4, 2, 1, 46, 24, '2018-11-17', '13:10:00', '', '', 1),
(840, 4, 1, 1, 47, 24, '2018-11-17', '13:10:00', '', '', 1),
(841, 4, 4, 1, 48, 24, '2018-11-17', '13:10:00', '', '', 1),
(842, 4, 1, 1, 49, 24, '2018-11-17', '13:10:00', '', '', 1),
(843, 4, 2, 1, 50, 24, '2018-11-17', '13:10:00', '', '', 1),
(844, 4, 4, 1, 51, 24, '2018-11-17', '13:10:00', '', '', 1),
(845, 4, 3, 1, 52, 24, '2018-11-17', '13:10:00', '', '', 1),
(846, 4, 3, 1, 53, 24, '2018-11-17', '13:10:00', '', '', 1),
(847, 4, 9, 3, 45, 24, '2018-11-18', '13:00:00', '', '', 1),
(848, 4, 9, 3, 46, 24, '2018-11-18', '13:00:00', '', '', 1),
(849, 4, 9, 3, 47, 24, '2018-11-18', '13:00:00', '', '', 1),
(850, 4, 9, 3, 48, 24, '2018-11-18', '13:00:00', '', '', 1),
(851, 4, 9, 3, 49, 24, '2018-11-18', '13:00:00', '', '', 1),
(852, 4, 10, 3, 50, 24, '2018-11-18', '13:00:00', '', '', 1),
(853, 4, 9, 3, 51, 24, '2018-11-18', '13:00:00', '', '', 1),
(854, 4, 9, 3, 52, 24, '2018-11-18', '13:00:00', '', '', 1),
(855, 4, 11, 3, 53, 24, '2018-11-18', '13:00:00', '', '', 1),
(856, 4, 1, 1, 45, 24, '2018-11-18', '13:00:00', '', '', 1),
(857, 4, 1, 1, 46, 24, '2018-11-18', '13:00:00', '', '', 1),
(858, 4, 1, 1, 47, 24, '2018-11-18', '13:00:00', '', '', 1),
(859, 4, 1, 1, 48, 24, '2018-11-18', '13:00:00', '', '', 1),
(860, 4, 1, 1, 49, 24, '2018-11-18', '13:00:00', '', '', 1),
(861, 4, 1, 1, 50, 24, '2018-11-18', '13:00:00', '', '', 1),
(862, 4, 1, 1, 51, 24, '2018-11-18', '13:00:00', '', '', 1),
(863, 4, 1, 1, 52, 24, '2018-11-18', '13:00:00', '', '', 1),
(864, 4, 1, 1, 53, 24, '2018-11-18', '13:00:00', '', '', 1),
(865, 4, 4, 1, 45, 24, '2018-11-19', '13:00:00', '', '', 1),
(866, 4, 2, 1, 46, 24, '2018-11-19', '13:00:00', '', '', 1),
(867, 4, 3, 1, 47, 24, '2018-11-19', '13:00:00', '', '', 1),
(868, 4, 1, 1, 48, 24, '2018-11-19', '13:00:00', '', '', 1),
(869, 4, 2, 1, 49, 24, '2018-11-19', '13:00:00', '', '', 1),
(870, 4, 2, 1, 50, 24, '2018-11-19', '13:00:00', '', '', 1),
(871, 4, 3, 1, 51, 24, '2018-11-19', '13:00:00', '', '', 1),
(872, 4, 1, 1, 52, 24, '2018-11-19', '13:00:00', '', '', 1),
(873, 4, 4, 1, 53, 24, '2018-11-19', '13:00:00', '', '', 1),
(874, 1, 1, 1, 26, 6, '2018-10-01', '17:01:00', '', '', 1),
(875, 1, 4, 1, 20, 23, '2018-10-04', '22:10:00', '', '', 1),
(876, 1, 1, 1, 152, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(877, 1, 1, 1, 153, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(878, 1, 1, 1, 154, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(879, 1, 1, 1, 155, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(880, 1, 1, 1, 156, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(881, 1, 1, 1, 157, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(882, 1, 1, 1, 158, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(883, 1, 1, 1, 159, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(884, 1, 1, 1, 160, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(885, 1, 1, 1, 161, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(886, 1, 1, 1, 162, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(887, 1, 1, 1, 163, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(888, 1, 3, 1, 164, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(889, 1, 1, 1, 165, 26, '2018-03-05', '13:00:00', NULL, NULL, 1),
(890, 1, 1, 1, 152, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(891, 1, 1, 1, 153, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(892, 1, 2, 1, 154, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(893, 1, 1, 1, 155, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(894, 1, 1, 1, 156, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(895, 1, 1, 1, 157, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(896, 1, 1, 1, 158, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(897, 1, 1, 1, 159, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(898, 1, 3, 1, 160, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(899, 1, 1, 1, 161, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(900, 1, 1, 1, 162, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(901, 1, 1, 1, 163, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(902, 1, 1, 1, 164, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(903, 1, 1, 1, 165, 26, '2018-03-06', '13:00:00', NULL, NULL, 1),
(904, 1, 1, 1, 152, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(905, 1, 1, 1, 153, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(906, 1, 1, 1, 154, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(907, 1, 1, 1, 155, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(908, 1, 1, 1, 156, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(909, 1, 1, 1, 157, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(910, 1, 1, 1, 158, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(911, 1, 1, 1, 159, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(912, 1, 3, 1, 160, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(913, 1, 1, 1, 161, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(914, 1, 1, 1, 162, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(915, 1, 1, 1, 163, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(916, 1, 1, 1, 164, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(917, 1, 1, 1, 165, 26, '2018-03-07', '13:00:00', NULL, NULL, 1),
(918, 1, 1, 1, 152, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(919, 1, 1, 1, 153, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(920, 1, 1, 1, 154, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(921, 1, 1, 1, 155, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(922, 1, 1, 1, 156, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(923, 1, 1, 1, 157, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(924, 1, 2, 1, 158, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(925, 1, 1, 1, 159, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(926, 1, 1, 1, 160, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(927, 1, 2, 1, 161, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(928, 1, 1, 1, 162, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(929, 1, 1, 1, 163, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(930, 1, 1, 1, 164, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(931, 1, 1, 1, 165, 26, '2018-03-08', '13:00:00', NULL, NULL, 1),
(932, 1, 1, 1, 152, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(933, 1, 2, 1, 153, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(934, 1, 1, 1, 154, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(935, 1, 1, 1, 155, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(936, 1, 1, 1, 156, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(937, 1, 1, 1, 157, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(938, 1, 1, 1, 158, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(939, 1, 1, 1, 159, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(940, 1, 1, 1, 160, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(941, 1, 1, 1, 161, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(942, 1, 1, 1, 162, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(943, 1, 1, 1, 163, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(944, 1, 1, 1, 164, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(945, 1, 1, 1, 165, 26, '2018-03-09', '13:00:00', NULL, NULL, 1),
(946, 1, 1, 1, 152, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(947, 1, 1, 1, 153, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(948, 1, 1, 1, 154, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(949, 1, 1, 1, 155, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(950, 1, 1, 1, 156, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(951, 1, 1, 1, 157, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(952, 1, 1, 1, 158, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(953, 1, 1, 1, 159, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(954, 1, 1, 1, 160, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(955, 1, 1, 1, 161, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(956, 1, 1, 1, 162, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(957, 1, 1, 1, 163, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(958, 1, 1, 1, 164, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(959, 1, 1, 1, 165, 26, '2018-03-12', '13:00:00', NULL, NULL, 1),
(960, 1, 1, 1, 152, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(961, 1, 1, 1, 153, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(962, 1, 1, 1, 154, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(963, 1, 1, 1, 155, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(964, 1, 1, 1, 156, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(965, 1, 1, 1, 157, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(966, 1, 2, 1, 158, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(967, 1, 1, 1, 159, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(968, 1, 2, 1, 160, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(969, 1, 1, 1, 161, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(970, 1, 1, 1, 162, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(971, 1, 1, 1, 163, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(972, 1, 1, 1, 164, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(973, 1, 1, 1, 165, 26, '2018-03-13', '13:00:00', NULL, NULL, 1),
(974, 1, 1, 1, 152, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(975, 1, 1, 1, 153, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(976, 1, 1, 1, 154, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(977, 1, 2, 1, 155, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(978, 1, 1, 1, 156, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(979, 1, 1, 1, 157, 26, '2018-03-14', '13:00:00', 'Es otaco', NULL, 1),
(980, 1, 1, 1, 158, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(981, 1, 1, 1, 159, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(982, 1, 2, 1, 160, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(983, 1, 1, 1, 161, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(984, 1, 1, 1, 162, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(985, 1, 1, 1, 163, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(986, 1, 1, 1, 164, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(987, 1, 2, 1, 165, 26, '2018-03-14', '13:00:00', NULL, NULL, 1),
(988, 1, 1, 1, 152, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(989, 1, 1, 1, 153, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(990, 1, 1, 1, 154, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(991, 1, 1, 1, 155, 26, '2018-03-15', '13:00:00', 'Otaco culiao', NULL, 1),
(992, 1, 1, 1, 156, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(993, 1, 1, 1, 157, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(994, 1, 2, 1, 158, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(995, 1, 1, 1, 159, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(996, 1, 1, 1, 160, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(997, 1, 1, 1, 161, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(998, 1, 1, 1, 162, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(999, 1, 1, 1, 163, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(1000, 1, 1, 1, 164, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(1001, 1, 2, 1, 165, 26, '2018-03-15', '13:00:00', NULL, NULL, 1),
(1002, 1, 1, 1, 152, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1003, 1, 1, 1, 153, 26, '2018-03-16', '13:00:00', 'ola bb', NULL, 1),
(1004, 1, 1, 1, 154, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1005, 1, 1, 1, 155, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1006, 1, 1, 1, 156, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1007, 1, 1, 1, 157, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1008, 1, 3, 1, 158, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1009, 1, 1, 1, 159, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1010, 1, 4, 1, 160, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1011, 1, 1, 1, 161, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1012, 1, 1, 1, 162, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1013, 1, 1, 1, 163, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1014, 1, 1, 1, 164, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1015, 1, 1, 1, 165, 26, '2018-03-16', '13:00:00', NULL, NULL, 1),
(1016, 1, 1, 1, 152, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1017, 1, 1, 1, 153, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1018, 1, 1, 1, 154, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1019, 1, 1, 1, 155, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1020, 1, 1, 1, 156, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1021, 1, 1, 1, 157, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1022, 1, 2, 1, 158, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1023, 1, 1, 1, 159, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1024, 1, 2, 1, 160, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1025, 1, 1, 1, 161, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1026, 1, 1, 1, 162, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1027, 1, 1, 1, 163, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1028, 1, 1, 1, 164, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1029, 1, 2, 1, 165, 26, '2018-03-19', '13:00:00', NULL, NULL, 1),
(1030, 1, 1, 1, 152, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1031, 1, 2, 1, 153, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1032, 1, 1, 1, 154, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1033, 1, 4, 1, 155, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1034, 1, 2, 1, 156, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1035, 1, 1, 1, 157, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1036, 1, 2, 1, 158, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1037, 1, 1, 1, 159, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1038, 1, 2, 1, 160, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1039, 1, 1, 1, 161, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1040, 1, 1, 1, 162, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1041, 1, 1, 1, 163, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1042, 1, 1, 1, 164, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1043, 1, 3, 1, 165, 26, '2018-03-20', '13:00:00', NULL, NULL, 1),
(1044, 1, 1, 1, 152, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1045, 1, 2, 1, 153, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1046, 1, 1, 1, 154, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1047, 1, 1, 1, 155, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1048, 1, 1, 1, 156, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1049, 1, 1, 1, 157, 26, '2018-03-21', '13:00:00', 'aguante overwatch', NULL, 1),
(1050, 1, 2, 1, 158, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1051, 1, 1, 1, 159, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1052, 1, 1, 1, 160, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1053, 1, 1, 1, 161, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1054, 1, 1, 1, 162, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1055, 1, 1, 1, 163, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1056, 1, 2, 1, 164, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1057, 1, 1, 1, 165, 26, '2018-03-21', '13:00:00', NULL, NULL, 1),
(1058, 1, 1, 1, 152, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1059, 1, 1, 1, 153, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1060, 1, 1, 1, 154, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1061, 1, 1, 1, 155, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1062, 1, 1, 1, 156, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1063, 1, 1, 1, 157, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1064, 1, 1, 1, 158, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1065, 1, 1, 1, 159, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1066, 1, 3, 1, 160, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1067, 1, 1, 1, 161, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1068, 1, 1, 1, 162, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1069, 1, 1, 1, 163, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1070, 1, 1, 1, 164, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1071, 1, 1, 1, 165, 26, '2018-03-22', '13:00:00', NULL, NULL, 1),
(1072, 1, 1, 1, 152, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1073, 1, 2, 1, 153, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1074, 1, 1, 1, 154, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1075, 1, 1, 1, 155, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1076, 1, 2, 1, 156, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1077, 1, 3, 1, 157, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1078, 1, 1, 1, 158, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1079, 1, 3, 1, 159, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1080, 1, 3, 1, 160, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1081, 1, 1, 1, 161, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1082, 1, 1, 1, 162, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1083, 1, 1, 1, 163, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1084, 1, 2, 1, 164, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1085, 1, 1, 1, 165, 26, '2018-03-23', '13:00:00', NULL, NULL, 1),
(1086, 1, 1, 1, 152, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1087, 1, 1, 1, 153, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1088, 1, 1, 1, 154, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1089, 1, 2, 1, 155, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1090, 1, 1, 1, 156, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1091, 1, 1, 1, 157, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1092, 1, 1, 1, 158, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1093, 1, 3, 1, 159, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1094, 1, 1, 1, 160, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1095, 1, 1, 1, 161, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1096, 1, 1, 1, 162, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1097, 1, 1, 1, 163, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1098, 1, 2, 1, 164, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1099, 1, 1, 1, 165, 26, '2018-03-27', '13:00:00', NULL, NULL, 1),
(1100, 1, 1, 1, 152, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1101, 1, 1, 1, 153, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1102, 1, 1, 1, 154, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1103, 1, 1, 1, 155, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1104, 1, 4, 1, 156, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1105, 1, 1, 1, 157, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1106, 1, 1, 1, 158, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1107, 1, 3, 1, 159, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1108, 1, 1, 1, 160, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1109, 1, 1, 1, 161, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1110, 1, 1, 1, 162, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1111, 1, 1, 1, 163, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1112, 1, 1, 1, 164, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1113, 1, 1, 1, 165, 26, '2018-03-28', '13:00:00', NULL, NULL, 1),
(1114, 1, 1, 1, 152, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1115, 1, 1, 1, 153, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1116, 1, 1, 1, 154, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1117, 1, 1, 1, 155, 26, '2018-04-03', '13:00:00', 'asfdas', NULL, 1),
(1118, 1, 3, 1, 156, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1119, 1, 1, 1, 157, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1120, 1, 1, 1, 158, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1121, 1, 3, 1, 159, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1122, 1, 1, 1, 160, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1123, 1, 1, 1, 161, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1124, 1, 1, 1, 162, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1125, 1, 1, 1, 163, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1126, 1, 1, 1, 164, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1127, 1, 3, 1, 165, 26, '2018-04-03', '13:00:00', NULL, NULL, 1),
(1128, 1, 1, 1, 152, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1129, 1, 1, 1, 153, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1130, 1, 1, 1, 154, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1131, 1, 1, 1, 155, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1132, 1, 1, 1, 156, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1133, 1, 1, 1, 157, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1134, 1, 1, 1, 158, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1135, 1, 1, 1, 159, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1136, 1, 1, 1, 160, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1137, 1, 1, 1, 161, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1138, 1, 1, 1, 162, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1139, 1, 1, 1, 163, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1140, 1, 1, 1, 164, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1141, 1, 3, 1, 165, 26, '2018-04-04', '13:00:00', NULL, NULL, 1),
(1142, 1, 1, 1, 152, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1143, 1, 1, 1, 153, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1144, 1, 1, 1, 154, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1145, 1, 1, 1, 155, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1146, 1, 1, 1, 156, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1147, 1, 1, 1, 157, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1148, 1, 4, 1, 158, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1149, 1, 3, 1, 159, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1150, 1, 4, 1, 160, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1151, 1, 1, 1, 161, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1152, 1, 1, 1, 162, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1153, 1, 1, 1, 163, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1154, 1, 1, 1, 164, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1155, 1, 4, 1, 165, 26, '2018-04-05', '13:00:00', NULL, NULL, 1),
(1156, 1, 1, 1, 152, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1157, 1, 1, 1, 153, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1158, 1, 1, 1, 154, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1159, 1, 1, 1, 155, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1160, 1, 1, 1, 156, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1161, 1, 1, 1, 157, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1162, 1, 1, 1, 158, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1163, 1, 1, 1, 159, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1164, 1, 1, 1, 160, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1165, 1, 1, 1, 161, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1166, 1, 1, 1, 162, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1167, 1, 1, 1, 163, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1168, 1, 1, 1, 164, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1169, 1, 1, 1, 165, 26, '2018-04-06', '13:00:00', NULL, NULL, 1),
(1170, 1, 1, 1, 152, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1171, 1, 1, 1, 153, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1172, 1, 1, 1, 154, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1173, 1, 1, 1, 155, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1174, 1, 1, 1, 156, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1175, 1, 1, 1, 157, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1176, 1, 1, 1, 158, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1177, 1, 1, 1, 159, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1178, 1, 3, 1, 160, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1179, 1, 1, 1, 161, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1180, 1, 1, 1, 162, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1181, 1, 1, 1, 163, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1182, 1, 1, 1, 164, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1183, 1, 3, 1, 165, 26, '2018-04-09', '13:00:00', NULL, NULL, 1),
(1184, 1, 1, 1, 152, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1185, 1, 1, 1, 153, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1186, 1, 1, 1, 154, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1187, 1, 2, 1, 155, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1188, 1, 2, 1, 156, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1189, 1, 1, 1, 157, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1190, 1, 1, 1, 158, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1191, 1, 1, 1, 159, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1192, 1, 1, 1, 160, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1193, 1, 1, 1, 161, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1194, 1, 1, 1, 162, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1195, 1, 1, 1, 163, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1196, 1, 2, 1, 164, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1197, 1, 1, 1, 165, 26, '2018-04-10', '13:00:00', NULL, NULL, 1),
(1198, 1, 1, 1, 152, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1199, 1, 1, 1, 153, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1200, 1, 1, 1, 154, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1201, 1, 1, 1, 155, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1202, 1, 1, 1, 156, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1203, 1, 1, 1, 157, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1204, 1, 1, 1, 158, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1205, 1, 1, 1, 159, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1206, 1, 4, 1, 160, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1207, 1, 1, 1, 161, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1208, 1, 1, 1, 162, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1209, 1, 1, 1, 163, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1210, 1, 1, 1, 164, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1211, 1, 1, 1, 165, 26, '2018-04-12', '13:00:00', NULL, NULL, 1),
(1212, 1, 1, 1, 152, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1213, 1, 1, 1, 153, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1214, 1, 1, 1, 154, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1215, 1, 1, 1, 155, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1216, 1, 1, 1, 156, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1217, 1, 1, 1, 157, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1218, 1, 1, 1, 158, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1219, 1, 1, 1, 159, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1220, 1, 1, 1, 160, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1221, 1, 1, 1, 161, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1222, 1, 1, 1, 162, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1223, 1, 1, 1, 163, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1224, 1, 1, 1, 164, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1225, 1, 1, 1, 165, 26, '2018-04-13', '13:00:00', NULL, NULL, 1),
(1226, 1, 1, 1, 152, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1227, 1, 1, 1, 153, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1228, 1, 1, 1, 154, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1229, 1, 1, 1, 155, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1230, 1, 1, 1, 156, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1231, 1, 1, 1, 157, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1232, 1, 4, 1, 158, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1233, 1, 1, 1, 159, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1234, 1, 3, 1, 160, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1235, 1, 2, 1, 161, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1236, 1, 1, 1, 162, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1237, 1, 1, 1, 163, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1238, 1, 1, 1, 164, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1239, 1, 2, 1, 165, 26, '2018-04-16', '13:00:00', NULL, NULL, 1),
(1240, 1, 1, 1, 152, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1241, 1, 1, 1, 153, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1242, 1, 1, 1, 154, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1243, 1, 1, 1, 155, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1244, 1, 1, 1, 156, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1245, 1, 1, 1, 157, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1246, 1, 1, 1, 158, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1247, 1, 4, 1, 159, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1248, 1, 1, 1, 160, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1249, 1, 1, 1, 161, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1250, 1, 1, 1, 162, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1251, 1, 1, 1, 163, 26, '2018-04-17', '13:00:00', NULL, NULL, 1),
(1252, 1, 1, 1, 164, 26, '2018-04-17', '13:00:00', 'Esta leyendo el manga de berserk', NULL, 1),
(1253, 1, 1, 1, 165, 26, '2018-04-17', '13:00:00', 'Holi', NULL, 1),
(1254, 1, 1, 1, 152, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1255, 1, 1, 1, 153, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1256, 1, 1, 1, 154, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1257, 1, 1, 1, 155, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1258, 1, 1, 1, 156, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1259, 1, 1, 1, 157, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1260, 1, 1, 1, 158, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1261, 1, 1, 1, 159, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1262, 1, 1, 1, 160, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1263, 1, 1, 1, 161, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1264, 1, 1, 1, 162, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1265, 1, 1, 1, 163, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1266, 1, 2, 1, 164, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1267, 1, 1, 1, 165, 26, '2018-04-18', '13:00:00', NULL, NULL, 1),
(1268, 1, 1, 1, 152, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1269, 1, 1, 1, 153, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1270, 1, 1, 1, 154, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1271, 1, 1, 1, 155, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1272, 1, 1, 1, 156, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1273, 1, 1, 1, 157, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1274, 1, 1, 1, 158, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1275, 1, 1, 1, 159, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1276, 1, 1, 1, 160, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1277, 1, 1, 1, 161, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1278, 1, 1, 1, 162, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1279, 1, 1, 1, 163, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1280, 1, 1, 1, 164, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1281, 1, 1, 1, 165, 26, '2018-04-19', '13:00:00', NULL, NULL, 1),
(1282, 1, 1, 1, 152, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1283, 1, 1, 1, 153, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1284, 1, 1, 1, 154, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1285, 1, 3, 1, 155, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1286, 1, 1, 1, 156, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1287, 1, 1, 1, 157, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1288, 1, 3, 1, 158, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1289, 1, 1, 1, 159, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1290, 1, 1, 1, 160, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1291, 1, 1, 1, 161, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1292, 1, 1, 1, 162, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1293, 1, 1, 1, 163, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1294, 1, 1, 1, 164, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1295, 1, 2, 1, 165, 26, '2018-04-20', '13:00:00', NULL, NULL, 1),
(1296, 1, 1, 1, 152, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1297, 1, 1, 1, 153, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1298, 1, 1, 1, 154, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1299, 1, 1, 1, 155, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1300, 1, 1, 1, 156, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1301, 1, 1, 1, 157, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1302, 1, 3, 1, 158, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1303, 1, 1, 1, 159, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1304, 1, 3, 1, 160, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1305, 1, 1, 1, 161, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1306, 1, 1, 1, 162, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1307, 1, 1, 1, 163, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1308, 1, 1, 1, 164, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1309, 1, 1, 1, 165, 26, '2018-04-23', '13:00:00', NULL, NULL, 1),
(1310, 1, 1, 1, 152, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1311, 1, 1, 1, 153, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1312, 1, 1, 1, 154, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1313, 1, 1, 1, 155, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1314, 1, 1, 1, 156, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1315, 1, 1, 1, 157, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1316, 1, 2, 1, 158, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1317, 1, 1, 1, 159, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1318, 1, 1, 1, 160, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1319, 1, 1, 1, 161, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1320, 1, 1, 1, 162, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1321, 1, 1, 1, 163, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1322, 1, 1, 1, 164, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1323, 1, 1, 1, 165, 26, '2018-04-24', '13:00:00', NULL, NULL, 1),
(1324, 1, 1, 1, 152, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1325, 1, 1, 1, 153, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1326, 1, 1, 1, 154, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1327, 1, 1, 1, 155, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1328, 1, 1, 1, 156, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1329, 1, 1, 1, 157, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1330, 1, 1, 1, 158, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1331, 1, 1, 1, 159, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1332, 1, 1, 1, 160, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1333, 1, 1, 1, 161, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1334, 1, 1, 1, 162, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1335, 1, 1, 1, 163, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1336, 1, 1, 1, 164, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1337, 1, 1, 1, 165, 26, '2018-04-25', '13:00:00', NULL, NULL, 1),
(1338, 1, 1, 1, 152, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1339, 1, 1, 1, 153, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1340, 1, 1, 1, 154, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1341, 1, 1, 1, 155, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1342, 1, 1, 1, 156, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1343, 1, 1, 1, 157, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1344, 1, 2, 1, 158, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1345, 1, 1, 1, 159, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1346, 1, 1, 1, 160, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1347, 1, 1, 1, 161, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1348, 1, 1, 1, 162, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1349, 1, 1, 1, 163, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1350, 1, 2, 1, 164, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1351, 1, 1, 1, 165, 26, '2018-04-26', '13:00:00', NULL, NULL, 1),
(1352, 1, 1, 1, 152, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1353, 1, 1, 1, 153, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1354, 1, 1, 1, 154, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1355, 1, 1, 1, 155, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1356, 1, 1, 1, 156, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1357, 1, 1, 1, 157, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1358, 1, 1, 1, 158, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1359, 1, 1, 1, 159, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1360, 1, 1, 1, 160, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1361, 1, 1, 1, 161, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1362, 1, 1, 1, 162, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1363, 1, 1, 1, 163, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1364, 1, 1, 1, 164, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1365, 1, 1, 1, 165, 26, '2018-04-27', '13:00:00', NULL, NULL, 1),
(1366, 1, 1, 1, 152, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1367, 1, 1, 1, 153, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1368, 1, 1, 1, 154, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1369, 1, 1, 1, 155, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1370, 1, 1, 1, 156, 26, '2018-05-02', '13:00:00', '', NULL, 1),
(1371, 1, 1, 1, 157, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1372, 1, 1, 1, 158, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1373, 1, 1, 1, 159, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1374, 1, 1, 1, 160, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1375, 1, 1, 1, 161, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1376, 1, 1, 1, 162, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1377, 1, 1, 1, 163, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1378, 1, 1, 1, 164, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1379, 1, 1, 1, 165, 26, '2018-05-02', '13:00:00', NULL, NULL, 1),
(1380, 1, 1, 1, 152, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1381, 1, 1, 1, 153, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1382, 1, 1, 1, 154, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1383, 1, 1, 1, 155, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1384, 1, 1, 1, 156, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1385, 1, 1, 1, 157, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1386, 1, 4, 1, 158, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1387, 1, 1, 1, 159, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1388, 1, 1, 1, 160, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1389, 1, 1, 1, 161, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1390, 1, 1, 1, 162, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1391, 1, 1, 1, 163, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1392, 1, 1, 1, 164, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1393, 1, 1, 1, 165, 26, '2018-05-03', '13:00:00', NULL, NULL, 1),
(1394, 1, 1, 1, 152, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1395, 1, 1, 1, 153, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1396, 1, 1, 1, 154, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1397, 1, 1, 1, 155, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1398, 1, 1, 1, 156, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1399, 1, 1, 1, 157, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1400, 1, 1, 1, 158, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1401, 1, 1, 1, 159, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1402, 1, 1, 1, 160, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1403, 1, 1, 1, 161, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1404, 1, 1, 1, 162, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1405, 1, 1, 1, 163, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1406, 1, 1, 1, 164, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1407, 1, 1, 1, 165, 26, '2018-05-04', '13:00:00', NULL, NULL, 1),
(1408, 1, 1, 1, 152, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1409, 1, 1, 1, 153, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1410, 1, 1, 1, 154, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1411, 1, 1, 1, 155, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1412, 1, 1, 1, 156, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1413, 1, 1, 1, 157, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1414, 1, 2, 1, 158, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1415, 1, 1, 1, 159, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1416, 1, 1, 1, 160, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1417, 1, 1, 1, 161, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1418, 1, 1, 1, 162, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1419, 1, 1, 1, 163, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1420, 1, 1, 1, 164, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1421, 1, 4, 1, 165, 26, '2018-05-07', '13:00:00', NULL, NULL, 1),
(1422, 1, 1, 1, 152, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1423, 1, 1, 1, 153, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1424, 1, 1, 1, 154, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1425, 1, 1, 1, 155, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1426, 1, 1, 1, 156, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1427, 1, 1, 1, 157, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1428, 1, 2, 1, 158, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1429, 1, 1, 1, 159, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1430, 1, 1, 1, 160, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1431, 1, 1, 1, 161, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1432, 1, 1, 1, 162, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1433, 1, 1, 1, 163, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1434, 1, 1, 1, 164, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1435, 1, 1, 1, 165, 26, '2018-05-08', '13:00:00', NULL, NULL, 1),
(1436, 1, 1, 1, 152, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1437, 1, 1, 1, 153, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1438, 1, 1, 1, 154, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1439, 1, 1, 1, 155, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1440, 1, 1, 1, 156, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1441, 1, 1, 1, 157, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1442, 1, 1, 1, 158, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1443, 1, 1, 1, 159, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1444, 1, 1, 1, 160, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1445, 1, 1, 1, 161, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1446, 1, 1, 1, 162, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1447, 1, 1, 1, 163, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1448, 1, 2, 1, 164, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1449, 1, 1, 1, 165, 26, '2018-05-09', '13:00:00', NULL, NULL, 1),
(1450, 1, 1, 1, 152, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1451, 1, 1, 1, 153, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1452, 1, 1, 1, 154, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1453, 1, 1, 1, 155, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1454, 1, 1, 1, 156, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1455, 1, 1, 1, 157, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1456, 1, 1, 1, 158, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1457, 1, 1, 1, 159, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1458, 1, 1, 1, 160, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1459, 1, 1, 1, 161, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1460, 1, 1, 1, 162, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1461, 1, 1, 1, 163, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1462, 1, 1, 1, 164, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1463, 1, 1, 1, 165, 26, '2018-05-10', '13:00:00', NULL, NULL, 1),
(1464, 1, 1, 1, 152, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1465, 1, 1, 1, 153, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1466, 1, 1, 1, 154, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1467, 1, 1, 1, 155, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1468, 1, 1, 1, 156, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1469, 1, 1, 1, 157, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1470, 1, 1, 1, 158, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1471, 1, 1, 1, 159, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1472, 1, 1, 1, 160, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1473, 1, 1, 1, 161, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1474, 1, 1, 1, 162, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1475, 1, 1, 1, 163, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1476, 1, 1, 1, 164, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1477, 1, 1, 1, 165, 26, '2018-05-11', '13:00:00', NULL, NULL, 1),
(1478, 1, 1, 1, 152, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1479, 1, 1, 1, 153, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1480, 1, 1, 1, 154, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1481, 1, 1, 1, 155, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1482, 1, 1, 1, 156, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1483, 1, 1, 1, 157, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1484, 1, 1, 1, 158, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1485, 1, 1, 1, 159, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1486, 1, 1, 1, 160, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1487, 1, 1, 1, 161, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1488, 1, 1, 1, 162, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1489, 1, 1, 1, 163, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1490, 1, 1, 1, 164, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1491, 1, 3, 1, 165, 26, '2018-05-14', '13:00:00', NULL, NULL, 1),
(1492, 1, 1, 1, 152, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1493, 1, 1, 1, 153, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1494, 1, 1, 1, 154, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1495, 1, 1, 1, 155, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1496, 1, 1, 1, 156, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1497, 1, 1, 1, 157, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1498, 1, 1, 1, 158, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1499, 1, 1, 1, 159, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1500, 1, 1, 1, 160, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1501, 1, 1, 1, 161, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1502, 1, 1, 1, 162, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1503, 1, 1, 1, 163, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1504, 1, 1, 1, 164, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1505, 1, 1, 1, 165, 26, '2018-05-15', '13:00:00', NULL, NULL, 1),
(1506, 1, 1, 1, 152, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1507, 1, 1, 1, 153, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1508, 1, 1, 1, 154, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1509, 1, 1, 1, 155, 26, '2018-05-16', '13:00:00', 'Es otaco', NULL, 1),
(1510, 1, 1, 1, 156, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1511, 1, 1, 1, 157, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1512, 1, 1, 1, 158, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1513, 1, 1, 1, 159, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1514, 1, 1, 1, 160, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1515, 1, 1, 1, 161, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1516, 1, 1, 1, 162, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1517, 1, 1, 1, 163, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1518, 1, 1, 1, 164, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1519, 1, 1, 1, 165, 26, '2018-05-16', '13:00:00', NULL, NULL, 1),
(1520, 1, 1, 1, 152, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1521, 1, 1, 1, 153, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1522, 1, 1, 1, 154, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1523, 1, 1, 1, 155, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1524, 1, 1, 1, 156, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1525, 1, 1, 1, 157, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1526, 1, 1, 1, 158, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1527, 1, 1, 1, 159, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1528, 1, 1, 1, 160, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1529, 1, 1, 1, 161, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1530, 1, 1, 1, 162, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1531, 1, 1, 1, 163, 26, '2018-05-17', '13:00:00', NULL, '', 1),
(1532, 1, 1, 1, 164, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1533, 1, 3, 1, 165, 26, '2018-05-17', '13:00:00', NULL, NULL, 1),
(1534, 1, 1, 1, 152, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1535, 1, 1, 1, 153, 26, '2018-05-18', '13:00:00', 'Aviso que se iba temprano', NULL, 1),
(1536, 1, 1, 1, 154, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1537, 1, 1, 1, 155, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1538, 1, 1, 1, 156, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1539, 1, 1, 1, 157, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1540, 1, 1, 1, 158, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1541, 1, 1, 1, 159, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1542, 1, 1, 1, 160, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1543, 1, 1, 1, 161, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1544, 1, 1, 1, 162, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1545, 1, 1, 1, 163, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1546, 1, 1, 1, 164, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1547, 1, 1, 1, 165, 26, '2018-05-18', '13:00:00', NULL, NULL, 1),
(1548, 1, 1, 1, 152, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1549, 1, 1, 1, 153, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1550, 1, 1, 1, 154, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1551, 1, 1, 1, 155, 26, '2018-05-21', '13:00:00', 'Este alumno aviso que iba a llegar tarde', NULL, 1),
(1552, 1, 1, 1, 156, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1553, 1, 1, 1, 157, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1554, 1, 1, 1, 158, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1555, 1, 3, 1, 159, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1556, 1, 3, 1, 160, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1557, 1, 1, 1, 161, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1558, 1, 1, 1, 162, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1559, 1, 1, 1, 163, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1560, 1, 1, 1, 164, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1561, 1, 1, 1, 165, 26, '2018-05-21', '13:00:00', NULL, NULL, 1),
(1562, 1, 1, 1, 152, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1563, 1, 1, 1, 153, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1564, 1, 1, 1, 154, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1565, 1, 1, 1, 155, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1566, 1, 1, 1, 156, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1567, 1, 1, 1, 157, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1568, 1, 2, 1, 158, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1569, 1, 1, 1, 159, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1570, 1, 1, 1, 160, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1571, 1, 1, 1, 161, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1572, 1, 1, 1, 162, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1573, 1, 1, 1, 163, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1574, 1, 1, 1, 164, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1575, 1, 1, 1, 165, 26, '2018-05-22', '13:00:00', NULL, NULL, 1),
(1576, 1, 1, 1, 152, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1577, 1, 1, 1, 153, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1578, 1, 1, 1, 154, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1579, 1, 1, 1, 155, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1580, 1, 1, 1, 156, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1581, 1, 3, 1, 157, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1582, 1, 1, 1, 158, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1583, 1, 1, 1, 159, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1584, 1, 1, 1, 160, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1585, 1, 1, 1, 161, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1586, 1, 1, 1, 162, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1587, 1, 3, 1, 163, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1588, 1, 1, 1, 164, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1589, 1, 1, 1, 165, 26, '2018-05-23', '13:00:00', NULL, NULL, 1),
(1590, 1, 1, 1, 152, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1591, 1, 1, 1, 153, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1592, 1, 1, 1, 154, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1593, 1, 1, 1, 155, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1594, 1, 2, 1, 156, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1595, 1, 1, 1, 157, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1596, 1, 2, 1, 158, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1597, 1, 1, 1, 159, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1598, 1, 1, 1, 160, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1599, 1, 1, 1, 161, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1600, 1, 3, 1, 162, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1601, 1, 1, 1, 163, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1602, 1, 1, 1, 164, 26, '2018-05-24', '13:00:00', NULL, NULL, 1),
(1603, 1, 1, 1, 165, 26, '2018-05-24', '13:00:00', NULL, NULL, 1);
INSERT INTO `seguimientos` (`idSeguimiento`, `idUsuario`, `idMotivo`, `idSubmotivo`, `idAlumnxcurso`, `idCurso`, `fecha`, `hora`, `justificado`, `observaciones`, `estado`) VALUES
(1604, 1, 1, 1, 152, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1605, 1, 1, 1, 153, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1606, 1, 1, 1, 154, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1607, 1, 1, 1, 155, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1608, 1, 1, 1, 156, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1609, 1, 1, 1, 157, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1610, 1, 2, 1, 158, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1611, 1, 1, 1, 159, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1612, 1, 2, 1, 160, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1613, 1, 2, 1, 161, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1614, 1, 1, 1, 162, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1615, 1, 1, 1, 163, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1616, 1, 1, 1, 164, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1617, 1, 2, 1, 165, 26, '2018-05-28', '13:00:00', NULL, NULL, 1),
(1618, 1, 1, 1, 152, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1619, 1, 1, 1, 153, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1620, 1, 1, 1, 154, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1621, 1, 1, 1, 155, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1622, 1, 4, 1, 156, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1623, 1, 1, 1, 157, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1624, 1, 2, 1, 158, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1625, 1, 4, 1, 159, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1626, 1, 1, 1, 160, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1627, 1, 2, 1, 161, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1628, 1, 4, 1, 162, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1629, 1, 4, 1, 163, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1630, 1, 1, 1, 164, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1631, 1, 2, 1, 165, 26, '2018-05-29', '13:00:00', NULL, NULL, 1),
(1632, 1, 1, 1, 152, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1633, 1, 1, 1, 153, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1634, 1, 1, 1, 154, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1635, 1, 1, 1, 155, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1636, 1, 1, 1, 156, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1637, 1, 1, 1, 157, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1638, 1, 1, 1, 158, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1639, 1, 1, 1, 159, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1640, 1, 1, 1, 160, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1641, 1, 1, 1, 161, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1642, 1, 1, 1, 162, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1643, 1, 1, 1, 163, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1644, 1, 1, 1, 164, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1645, 1, 1, 1, 165, 26, '2018-05-30', '13:00:00', NULL, NULL, 1),
(1646, 1, 1, 1, 152, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1647, 1, 1, 1, 153, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1648, 1, 1, 1, 154, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1649, 1, 2, 1, 155, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1650, 1, 1, 1, 156, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1651, 1, 1, 1, 157, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1652, 1, 2, 1, 158, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1653, 1, 3, 1, 159, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1654, 1, 1, 1, 160, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1655, 1, 1, 1, 161, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1656, 1, 1, 1, 162, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1657, 1, 1, 1, 163, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1658, 1, 1, 1, 164, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1659, 1, 1, 1, 165, 26, '2018-05-31', '13:00:00', NULL, NULL, 1),
(1660, 1, 1, 1, 152, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1661, 1, 1, 1, 153, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1662, 1, 1, 1, 154, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1663, 1, 1, 1, 155, 26, '2018-06-01', '13:00:00', 'Dijo que no vio berserk', NULL, 1),
(1664, 1, 1, 1, 156, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1665, 1, 1, 1, 157, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1666, 1, 1, 1, 158, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1667, 1, 1, 1, 159, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1668, 1, 1, 1, 160, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1669, 1, 1, 1, 161, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1670, 1, 1, 1, 162, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1671, 1, 1, 1, 163, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1672, 1, 1, 1, 164, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1673, 1, 1, 1, 165, 26, '2018-06-01', '13:00:00', NULL, NULL, 1),
(1674, 1, 1, 1, 152, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1675, 1, 1, 1, 153, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1676, 1, 1, 1, 154, 26, '2018-06-04', '13:00:00', 'sancion', NULL, 1),
(1677, 1, 1, 1, 155, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1678, 1, 2, 1, 156, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1679, 1, 1, 1, 157, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1680, 1, 1, 1, 158, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1681, 1, 1, 1, 159, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1682, 1, 1, 1, 160, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1683, 1, 1, 1, 161, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1684, 1, 1, 1, 162, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1685, 1, 2, 1, 163, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1686, 1, 1, 1, 164, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1687, 1, 1, 1, 165, 26, '2018-06-04', '13:00:00', NULL, NULL, 1),
(1688, 1, 1, 1, 152, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1689, 1, 1, 1, 153, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1690, 1, 1, 1, 154, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1691, 1, 1, 1, 155, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1692, 1, 1, 1, 156, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1693, 1, 1, 1, 157, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1694, 1, 1, 1, 158, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1695, 1, 1, 1, 159, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1696, 1, 1, 1, 160, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1697, 1, 1, 1, 161, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1698, 1, 1, 1, 162, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1699, 1, 1, 1, 163, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1700, 1, 3, 1, 164, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1701, 1, 1, 1, 165, 26, '2018-06-05', '13:00:00', NULL, NULL, 1),
(1702, 1, 1, 1, 152, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1703, 1, 1, 1, 153, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1704, 1, 1, 1, 154, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1705, 1, 1, 1, 155, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1706, 1, 1, 1, 156, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1707, 1, 1, 1, 157, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1708, 1, 1, 1, 158, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1709, 1, 1, 1, 159, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1710, 1, 1, 1, 160, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1711, 1, 1, 1, 161, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1712, 1, 1, 1, 162, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1713, 1, 1, 1, 163, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1714, 1, 1, 1, 164, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1715, 1, 1, 1, 165, 26, '2018-06-06', '13:00:00', NULL, NULL, 1),
(1716, 1, 1, 1, 152, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1717, 1, 1, 1, 153, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1718, 1, 1, 1, 154, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1719, 1, 1, 1, 155, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1720, 1, 1, 1, 156, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1721, 1, 1, 1, 157, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1722, 1, 1, 1, 158, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1723, 1, 1, 1, 159, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1724, 1, 1, 1, 160, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1725, 1, 1, 1, 161, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1726, 1, 1, 1, 162, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1727, 1, 1, 1, 163, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1728, 1, 1, 1, 164, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1729, 1, 1, 1, 165, 26, '2018-06-07', '13:00:00', NULL, NULL, 1),
(1730, 1, 1, 1, 152, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1731, 1, 1, 1, 153, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1732, 1, 1, 1, 154, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1733, 1, 1, 1, 155, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1734, 1, 1, 1, 156, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1735, 1, 1, 1, 157, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1736, 1, 1, 1, 158, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1737, 1, 1, 1, 159, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1738, 1, 1, 1, 160, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1739, 1, 1, 1, 161, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1740, 1, 1, 1, 162, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1741, 1, 1, 1, 163, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1742, 1, 1, 1, 164, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1743, 1, 1, 1, 165, 26, '2018-06-08', '13:00:00', NULL, NULL, 1),
(1744, 1, 1, 1, 152, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1745, 1, 2, 1, 153, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1746, 1, 1, 1, 154, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1747, 1, 1, 1, 155, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1748, 1, 2, 1, 156, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1749, 1, 1, 1, 157, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1750, 1, 1, 1, 158, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1751, 1, 1, 1, 159, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1752, 1, 1, 1, 160, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1753, 1, 2, 1, 161, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1754, 1, 1, 1, 162, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1755, 1, 1, 1, 163, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1756, 1, 2, 1, 164, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1757, 1, 3, 1, 165, 26, '2018-06-11', '13:00:00', NULL, NULL, 1),
(1758, 1, 1, 1, 152, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1759, 1, 1, 1, 153, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1760, 1, 1, 1, 154, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1761, 1, 1, 1, 155, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1762, 1, 1, 1, 156, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1763, 1, 1, 1, 157, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1764, 1, 1, 1, 158, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1765, 1, 1, 1, 159, 26, '2018-06-13', '13:00:00', 'holix2', NULL, 1),
(1766, 1, 1, 1, 160, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1767, 1, 1, 1, 161, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1768, 1, 1, 1, 162, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1769, 1, 1, 1, 163, 26, '2018-06-13', '13:00:00', 'Solo vio el anime', NULL, 1),
(1770, 1, 2, 1, 164, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1771, 1, 1, 1, 165, 26, '2018-06-13', '13:00:00', NULL, NULL, 1),
(1772, 1, 1, 1, 152, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1773, 1, 1, 1, 153, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1774, 1, 1, 1, 154, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1775, 1, 3, 1, 155, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1776, 1, 1, 1, 156, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1777, 1, 1, 1, 157, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1778, 1, 1, 1, 158, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1779, 1, 1, 1, 159, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1780, 1, 1, 1, 160, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1781, 1, 1, 1, 161, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1782, 1, 1, 1, 162, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1783, 1, 1, 1, 163, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1784, 1, 1, 1, 164, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1785, 1, 1, 1, 165, 26, '2018-06-14', '13:00:00', NULL, NULL, 1),
(1786, 1, 1, 1, 152, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1787, 1, 2, 1, 153, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1788, 1, 1, 1, 154, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1789, 1, 1, 1, 155, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1790, 1, 2, 1, 156, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1791, 1, 1, 1, 157, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1792, 1, 1, 1, 158, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1793, 1, 1, 1, 159, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1794, 1, 1, 1, 160, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1795, 1, 1, 1, 161, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1796, 1, 1, 1, 162, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1797, 1, 1, 1, 163, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1798, 1, 1, 1, 164, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1799, 1, 2, 1, 165, 26, '2018-06-18', '13:00:00', NULL, NULL, 1),
(1800, 1, 2, 1, 152, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1801, 1, 1, 1, 153, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1802, 1, 3, 1, 154, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1803, 1, 1, 1, 155, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1804, 1, 1, 1, 156, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1805, 1, 1, 1, 157, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1806, 1, 2, 1, 158, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1807, 1, 1, 1, 159, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1808, 1, 2, 1, 160, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1809, 1, 1, 1, 161, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1810, 1, 1, 1, 162, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1811, 1, 1, 1, 163, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1812, 1, 1, 1, 164, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1813, 1, 3, 1, 165, 26, '2018-06-19', '13:00:00', NULL, NULL, 1),
(1814, 1, 1, 1, 152, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1815, 1, 1, 1, 153, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1816, 1, 2, 1, 154, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1817, 1, 1, 1, 155, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1818, 1, 1, 1, 156, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1819, 1, 1, 1, 157, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1820, 1, 2, 1, 158, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1821, 1, 1, 1, 159, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1822, 1, 2, 1, 160, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1823, 1, 1, 1, 161, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1824, 1, 2, 1, 162, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1825, 1, 1, 1, 163, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1826, 1, 1, 1, 164, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1827, 1, 1, 1, 165, 26, '2018-06-21', '13:00:00', NULL, NULL, 1),
(1828, 1, 1, 1, 152, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1829, 1, 1, 1, 153, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1830, 1, 1, 1, 154, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1831, 1, 1, 1, 155, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1832, 1, 1, 1, 156, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1833, 1, 1, 1, 157, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1834, 1, 1, 1, 158, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1835, 1, 1, 1, 159, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1836, 1, 1, 1, 160, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1837, 1, 1, 1, 161, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1838, 1, 1, 1, 162, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1839, 1, 1, 1, 163, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1840, 1, 1, 1, 164, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1841, 1, 1, 1, 165, 26, '2018-06-22', '13:00:00', NULL, NULL, 1),
(1842, 1, 3, 1, 152, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1843, 1, 3, 1, 153, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1844, 1, 3, 1, 154, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1845, 1, 3, 1, 155, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1846, 1, 3, 1, 156, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1847, 1, 3, 1, 157, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1848, 1, 3, 1, 158, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1849, 1, 3, 1, 159, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1850, 1, 3, 1, 160, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1851, 1, 3, 1, 161, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1852, 1, 3, 1, 162, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1853, 1, 3, 1, 163, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1854, 1, 3, 1, 164, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1855, 1, 3, 1, 165, 26, '2018-06-25', '13:00:00', NULL, NULL, 1),
(1856, 1, 1, 1, 152, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1857, 1, 2, 1, 153, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1858, 1, 2, 1, 154, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1859, 1, 1, 1, 155, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1860, 1, 1, 1, 156, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1861, 1, 1, 1, 157, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1862, 1, 2, 1, 158, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1863, 1, 1, 1, 159, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1864, 1, 1, 1, 160, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1865, 1, 1, 1, 161, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1866, 1, 1, 1, 162, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1867, 1, 1, 1, 163, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1868, 1, 1, 1, 164, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1869, 1, 1, 1, 165, 26, '2018-06-26', '13:00:00', NULL, NULL, 1),
(1870, 1, 1, 1, 152, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1871, 1, 1, 1, 153, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1872, 1, 1, 1, 154, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1873, 1, 1, 1, 155, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1874, 1, 1, 1, 156, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1875, 1, 1, 1, 157, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1876, 1, 1, 1, 158, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1877, 1, 1, 1, 159, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1878, 1, 1, 1, 160, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1879, 1, 1, 1, 161, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1880, 1, 1, 1, 162, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1881, 1, 1, 1, 163, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1882, 1, 1, 1, 164, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1883, 1, 1, 1, 165, 26, '2018-06-27', '13:00:00', NULL, NULL, 1),
(1884, 1, 1, 1, 152, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1885, 1, 1, 1, 153, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1886, 1, 1, 1, 154, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1887, 1, 1, 1, 155, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1888, 1, 1, 1, 156, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1889, 1, 1, 1, 157, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1890, 1, 2, 1, 158, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1891, 1, 1, 1, 159, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1892, 1, 1, 1, 160, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1893, 1, 1, 1, 161, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1894, 1, 1, 1, 162, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1895, 1, 1, 1, 163, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1896, 1, 1, 1, 164, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1897, 1, 2, 1, 165, 26, '2018-06-28', '13:00:00', NULL, NULL, 1),
(1898, 1, 1, 1, 152, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1899, 1, 1, 1, 153, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1900, 1, 1, 1, 154, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1901, 1, 1, 1, 155, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1902, 1, 1, 1, 156, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1903, 1, 1, 1, 157, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1904, 1, 1, 1, 158, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1905, 1, 1, 1, 159, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1906, 1, 1, 1, 160, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1907, 1, 1, 1, 161, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1908, 1, 1, 1, 162, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1909, 1, 1, 1, 163, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1910, 1, 1, 1, 164, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1911, 1, 1, 1, 165, 26, '2018-06-29', '13:00:00', NULL, NULL, 1),
(1912, 1, 2, 1, 152, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1913, 1, 1, 1, 153, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1914, 1, 1, 1, 154, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1915, 1, 1, 1, 155, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1916, 1, 1, 1, 156, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1917, 1, 1, 1, 157, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1918, 1, 2, 1, 158, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1919, 1, 1, 1, 159, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1920, 1, 1, 1, 160, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1921, 1, 1, 1, 161, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1922, 1, 1, 1, 162, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1923, 1, 1, 1, 163, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1924, 1, 2, 1, 164, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1925, 1, 3, 1, 165, 26, '2018-07-02', '13:00:00', NULL, NULL, 1),
(1926, 1, 1, 1, 152, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1927, 1, 1, 1, 153, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1928, 1, 1, 1, 154, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1929, 1, 1, 1, 155, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1930, 1, 1, 1, 156, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1931, 1, 1, 1, 157, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1932, 1, 1, 1, 158, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1933, 1, 1, 1, 159, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1934, 1, 1, 1, 160, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1935, 1, 1, 1, 161, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1936, 1, 1, 1, 162, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1937, 1, 1, 1, 163, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1938, 1, 1, 1, 164, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1939, 1, 1, 1, 165, 26, '2018-07-03', '13:00:00', NULL, NULL, 1),
(1940, 1, 1, 1, 152, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1941, 1, 1, 1, 153, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1942, 1, 1, 1, 154, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1943, 1, 1, 1, 155, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1944, 1, 1, 1, 156, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1945, 1, 1, 1, 157, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1946, 1, 1, 1, 158, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1947, 1, 1, 1, 159, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1948, 1, 1, 1, 160, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1949, 1, 1, 1, 161, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1950, 1, 1, 1, 162, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1951, 1, 3, 1, 163, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1952, 1, 1, 1, 164, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1953, 1, 1, 1, 165, 26, '2018-07-04', '13:00:00', NULL, NULL, 1),
(1954, 1, 1, 1, 152, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1955, 1, 1, 1, 153, 26, '2018-07-05', '13:00:00', 'Este alumno es otaco', NULL, 1),
(1956, 1, 1, 1, 154, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1957, 1, 1, 1, 155, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1958, 1, 1, 1, 156, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1959, 1, 1, 1, 157, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1960, 1, 1, 1, 158, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1961, 1, 1, 1, 159, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1962, 1, 1, 1, 160, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1963, 1, 1, 1, 161, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1964, 1, 1, 1, 162, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1965, 1, 1, 1, 163, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1966, 1, 1, 1, 164, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1967, 1, 1, 1, 165, 26, '2018-07-05', '13:00:00', NULL, NULL, 1),
(1968, 1, 1, 1, 152, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1969, 1, 1, 1, 153, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1970, 1, 1, 1, 154, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1971, 1, 1, 1, 155, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1972, 1, 1, 1, 156, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1973, 1, 1, 1, 157, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1974, 1, 1, 1, 158, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1975, 1, 1, 1, 159, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1976, 1, 1, 1, 160, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1977, 1, 1, 1, 161, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1978, 1, 1, 1, 162, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1979, 1, 1, 1, 163, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1980, 1, 1, 1, 164, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1981, 1, 1, 1, 165, 26, '2018-07-06', '13:00:00', NULL, NULL, 1),
(1982, 1, 1, 1, 152, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1983, 1, 1, 1, 153, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1984, 1, 3, 1, 154, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1985, 1, 3, 1, 155, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1986, 1, 3, 1, 156, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1987, 1, 1, 1, 157, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1988, 1, 1, 1, 158, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1989, 1, 3, 1, 159, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1990, 1, 1, 1, 160, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1991, 1, 1, 1, 161, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1992, 1, 1, 1, 162, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1993, 1, 3, 1, 163, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1994, 1, 1, 1, 164, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1995, 1, 3, 1, 165, 26, '2018-07-10', '13:00:00', NULL, NULL, 1),
(1996, 1, 1, 1, 152, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(1997, 1, 1, 1, 153, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(1998, 1, 1, 1, 154, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(1999, 1, 1, 1, 155, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2000, 1, 1, 1, 156, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2001, 1, 1, 1, 157, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2002, 1, 1, 1, 158, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2003, 1, 1, 1, 159, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2004, 1, 1, 1, 160, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2005, 1, 1, 1, 161, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2006, 1, 1, 1, 162, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2007, 1, 1, 1, 163, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2008, 1, 1, 1, 164, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2009, 1, 1, 1, 165, 26, '2018-07-11', '13:00:00', NULL, NULL, 1),
(2010, 1, 1, 1, 152, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2011, 1, 1, 1, 153, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2012, 1, 1, 1, 154, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2013, 1, 1, 1, 155, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2014, 1, 1, 1, 156, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2015, 1, 1, 1, 157, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2016, 1, 1, 1, 158, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2017, 1, 1, 1, 159, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2018, 1, 1, 1, 160, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2019, 1, 1, 1, 161, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2020, 1, 1, 1, 162, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2021, 1, 1, 1, 163, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2022, 1, 1, 1, 164, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2023, 1, 1, 1, 165, 26, '2018-07-30', '13:00:00', NULL, NULL, 1),
(2024, 1, 1, 1, 152, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2025, 1, 1, 1, 153, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2026, 1, 2, 1, 154, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2027, 1, 3, 1, 155, 26, '2018-07-31', '13:00:00', 'No lee berserk', NULL, 1),
(2028, 1, 2, 1, 156, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2029, 1, 1, 1, 157, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2030, 1, 1, 1, 158, 26, '2018-07-31', '13:00:00', 'El alumno no leyo berserk', NULL, 1),
(2031, 1, 1, 1, 159, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2032, 1, 1, 1, 160, 26, '2018-07-31', '13:00:00', 'Este alumno aviso que llegaba tarde', NULL, 1),
(2033, 1, 1, 1, 161, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2034, 1, 1, 1, 162, 26, '2018-07-31', '13:00:00', 'De donde son los mayas?', NULL, 1),
(2035, 1, 3, 1, 163, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2036, 1, 1, 1, 164, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2037, 1, 1, 1, 165, 26, '2018-07-31', '13:00:00', NULL, NULL, 1),
(2038, 1, 1, 1, 152, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2039, 1, 1, 1, 153, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2040, 1, 1, 1, 154, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2041, 1, 1, 1, 155, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2042, 1, 1, 1, 156, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2043, 1, 1, 1, 157, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2044, 1, 1, 1, 158, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2045, 1, 1, 1, 159, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2046, 1, 1, 1, 160, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2047, 1, 1, 1, 161, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2048, 1, 1, 1, 162, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2049, 1, 1, 1, 163, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2050, 1, 1, 1, 164, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2051, 1, 1, 1, 165, 26, '2018-08-01', '13:00:00', NULL, NULL, 1),
(2052, 1, 1, 1, 152, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2053, 1, 1, 1, 153, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2054, 1, 1, 1, 154, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2055, 1, 1, 1, 155, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2056, 1, 2, 1, 156, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2057, 1, 1, 1, 157, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2058, 1, 2, 1, 158, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2059, 1, 1, 1, 159, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2060, 1, 1, 1, 160, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2061, 1, 2, 1, 161, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2062, 1, 1, 1, 162, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2063, 1, 1, 1, 163, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2064, 1, 2, 1, 164, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2065, 1, 2, 1, 165, 26, '2018-08-02', '13:00:00', NULL, NULL, 1),
(2066, 1, 1, 1, 152, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2067, 1, 1, 1, 153, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2068, 1, 1, 1, 154, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2069, 1, 1, 1, 155, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2070, 1, 1, 1, 156, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2071, 1, 1, 1, 157, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2072, 1, 1, 1, 158, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2073, 1, 1, 1, 159, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2074, 1, 1, 1, 160, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2075, 1, 1, 1, 161, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2076, 1, 1, 1, 162, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2077, 1, 1, 1, 163, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2078, 1, 1, 1, 164, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2079, 1, 1, 1, 165, 26, '2018-08-03', '13:00:00', NULL, NULL, 1),
(2080, 1, 1, 1, 152, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2081, 1, 1, 1, 153, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2082, 1, 1, 1, 154, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2083, 1, 1, 1, 155, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2084, 1, 1, 1, 156, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2085, 1, 1, 1, 157, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2086, 1, 1, 1, 158, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2087, 1, 1, 1, 159, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2088, 1, 1, 1, 160, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2089, 1, 1, 1, 161, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2090, 1, 1, 1, 162, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2091, 1, 1, 1, 163, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2092, 1, 1, 1, 164, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2093, 1, 1, 1, 165, 26, '2018-08-06', '13:00:00', NULL, NULL, 1),
(2094, 1, 1, 1, 152, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2095, 1, 2, 1, 153, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2096, 1, 1, 1, 154, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2097, 1, 1, 1, 155, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2098, 1, 2, 1, 156, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2099, 1, 1, 1, 157, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2100, 1, 1, 1, 158, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2101, 1, 1, 1, 159, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2102, 1, 3, 1, 160, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2103, 1, 1, 1, 161, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2104, 1, 1, 1, 162, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2105, 1, 1, 1, 163, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2106, 1, 1, 1, 164, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2107, 1, 1, 1, 165, 26, '2018-08-07', '13:00:00', NULL, NULL, 1),
(2108, 1, 1, 1, 152, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2109, 1, 1, 1, 153, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2110, 1, 1, 1, 154, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2111, 1, 1, 1, 155, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2112, 1, 1, 1, 156, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2113, 1, 1, 1, 157, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2114, 1, 1, 1, 158, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2115, 1, 1, 1, 159, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2116, 1, 1, 1, 160, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2117, 1, 1, 1, 161, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2118, 1, 1, 1, 162, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2119, 1, 1, 1, 163, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2120, 1, 1, 1, 164, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2121, 1, 1, 1, 165, 26, '2018-08-08', '13:00:00', NULL, NULL, 1),
(2122, 1, 1, 1, 152, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2123, 1, 1, 1, 153, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2124, 1, 1, 1, 154, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2125, 1, 1, 1, 155, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2126, 1, 1, 1, 156, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2127, 1, 1, 1, 157, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2128, 1, 1, 1, 158, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2129, 1, 1, 1, 159, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2130, 1, 1, 1, 160, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2131, 1, 1, 1, 161, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2132, 1, 1, 1, 162, 26, '2018-08-09', '13:00:00', 'adskasda', NULL, 1),
(2133, 1, 1, 1, 163, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2134, 1, 1, 1, 164, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2135, 1, 1, 1, 165, 26, '2018-08-09', '13:00:00', NULL, NULL, 1),
(2136, 1, 1, 1, 152, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2137, 1, 1, 1, 153, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2138, 1, 1, 1, 154, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2139, 1, 1, 1, 155, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2140, 1, 1, 1, 156, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2141, 1, 1, 1, 157, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2142, 1, 1, 1, 158, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2143, 1, 1, 1, 159, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2144, 1, 1, 1, 160, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2145, 1, 1, 1, 161, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2146, 1, 1, 1, 162, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2147, 1, 1, 1, 163, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2148, 1, 1, 1, 164, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2149, 1, 1, 1, 165, 26, '2018-08-10', '13:00:00', NULL, NULL, 1),
(2150, 1, 1, 1, 152, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2151, 1, 2, 1, 153, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2152, 1, 3, 1, 154, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2153, 1, 1, 1, 155, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2154, 1, 2, 1, 156, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2155, 1, 2, 1, 157, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2156, 1, 2, 1, 158, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2157, 1, 1, 1, 159, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2158, 1, 3, 1, 160, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2159, 1, 2, 1, 161, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2160, 1, 1, 1, 162, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2161, 1, 1, 1, 163, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2162, 1, 1, 1, 164, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2163, 1, 2, 1, 165, 26, '2018-08-13', '13:00:00', NULL, NULL, 1),
(2164, 1, 1, 1, 152, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2165, 1, 1, 1, 153, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2166, 1, 1, 1, 154, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2167, 1, 1, 1, 155, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2168, 1, 1, 1, 156, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2169, 1, 1, 1, 157, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2170, 1, 1, 1, 158, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2171, 1, 1, 1, 159, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2172, 1, 1, 1, 160, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2173, 1, 1, 1, 161, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2174, 1, 1, 1, 162, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2175, 1, 1, 1, 163, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2176, 1, 1, 1, 164, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2177, 1, 1, 1, 165, 26, '2018-08-14', '13:00:00', NULL, NULL, 1),
(2178, 1, 1, 1, 152, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2179, 1, 1, 1, 153, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2180, 1, 1, 1, 154, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2181, 1, 1, 1, 155, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2182, 1, 1, 1, 156, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2183, 1, 1, 1, 157, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2184, 1, 1, 1, 158, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2185, 1, 1, 1, 159, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2186, 1, 1, 1, 160, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2187, 1, 1, 1, 161, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2188, 1, 1, 1, 162, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2189, 1, 1, 1, 163, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2190, 1, 1, 1, 164, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2191, 1, 1, 1, 165, 26, '2018-08-15', '13:00:00', NULL, NULL, 1),
(2192, 1, 1, 1, 152, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2193, 1, 1, 1, 153, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2194, 1, 4, 1, 154, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2195, 1, 1, 1, 155, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2196, 1, 1, 1, 156, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2197, 1, 1, 1, 157, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2198, 1, 2, 1, 158, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2199, 1, 1, 1, 159, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2200, 1, 1, 1, 160, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2201, 1, 2, 1, 161, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2202, 1, 1, 1, 162, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2203, 1, 1, 1, 163, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2204, 1, 1, 1, 164, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2205, 1, 4, 1, 165, 26, '2018-08-16', '13:00:00', NULL, NULL, 1),
(2206, 1, 1, 1, 152, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2207, 1, 1, 1, 153, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2208, 1, 1, 1, 154, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2209, 1, 1, 1, 155, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2210, 1, 1, 1, 156, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2211, 1, 1, 1, 157, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2212, 1, 1, 1, 158, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2213, 1, 1, 1, 159, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2214, 1, 1, 1, 160, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2215, 1, 1, 1, 161, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2216, 1, 1, 1, 162, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2217, 1, 1, 1, 163, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2218, 1, 1, 1, 164, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2219, 1, 1, 1, 165, 26, '2018-08-17', '13:00:00', NULL, NULL, 1),
(2220, 1, 1, 1, 152, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2221, 1, 1, 1, 153, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2222, 1, 1, 1, 154, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2223, 1, 1, 1, 155, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2224, 1, 1, 1, 156, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2225, 1, 1, 1, 157, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2226, 1, 1, 1, 158, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2227, 1, 1, 1, 159, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2228, 1, 1, 1, 160, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2229, 1, 1, 1, 161, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2230, 1, 1, 1, 162, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2231, 1, 1, 1, 163, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2232, 1, 1, 1, 164, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2233, 1, 1, 1, 165, 26, '2018-08-21', '13:00:00', NULL, NULL, 1),
(2234, 1, 1, 1, 152, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2235, 1, 1, 1, 153, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2236, 1, 1, 1, 154, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2237, 1, 1, 1, 155, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2238, 1, 1, 1, 156, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2239, 1, 1, 1, 157, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2240, 1, 1, 1, 158, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2241, 1, 1, 1, 159, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2242, 1, 1, 1, 160, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2243, 1, 1, 1, 161, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2244, 1, 1, 1, 162, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2245, 1, 2, 1, 163, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2246, 1, 1, 1, 164, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2247, 1, 1, 1, 165, 26, '2018-08-22', '13:00:00', NULL, NULL, 1),
(2248, 1, 1, 1, 152, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2249, 1, 1, 1, 153, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2250, 1, 1, 1, 154, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2251, 1, 1, 1, 155, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2252, 1, 1, 1, 156, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2253, 1, 1, 1, 157, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2254, 1, 1, 1, 158, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2255, 1, 1, 1, 159, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2256, 1, 1, 1, 160, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2257, 1, 1, 1, 161, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2258, 1, 1, 1, 162, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2259, 1, 1, 1, 163, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2260, 1, 1, 1, 164, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2261, 1, 1, 1, 165, 26, '2018-08-24', '13:00:00', NULL, NULL, 1),
(2262, 1, 3, 1, 152, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2263, 1, 3, 1, 153, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2264, 1, 3, 1, 154, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2265, 1, 3, 1, 155, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2266, 1, 3, 1, 156, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2267, 1, 3, 1, 157, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2268, 1, 3, 1, 158, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2269, 1, 3, 1, 159, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2270, 1, 3, 1, 160, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2271, 1, 3, 1, 161, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2272, 1, 3, 1, 162, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2273, 1, 3, 1, 163, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2274, 1, 3, 1, 164, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2275, 1, 3, 1, 165, 26, '2018-08-27', '13:00:00', NULL, NULL, 1),
(2276, 1, 1, 1, 152, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2277, 1, 1, 1, 153, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2278, 1, 1, 1, 154, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2279, 1, 1, 1, 155, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2280, 1, 1, 1, 156, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2281, 1, 1, 1, 157, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2282, 1, 1, 1, 158, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2283, 1, 1, 1, 159, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2284, 1, 1, 1, 160, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2285, 1, 1, 1, 161, 26, '2018-08-28', '13:00:00', 'Tampoco lee berserk', NULL, 1),
(2286, 1, 1, 1, 162, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2287, 1, 1, 1, 163, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2288, 1, 1, 1, 164, 26, '2018-08-28', '13:00:00', NULL, NULL, 1),
(2289, 1, 1, 1, 165, 26, '2018-08-28', '13:00:00', 'No leyo berserk', NULL, 1),
(2290, 1, 1, 1, 152, 26, '2018-08-29', '13:00:00', 'De maya mi', NULL, 1),
(2291, 1, 1, 1, 153, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2292, 1, 1, 1, 154, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2293, 1, 1, 1, 155, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2294, 1, 1, 1, 156, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2295, 1, 1, 1, 157, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2296, 1, 1, 1, 158, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2297, 1, 1, 1, 159, 26, '2018-08-29', '13:00:00', NULL, 'Holi', 1),
(2298, 1, 1, 1, 160, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2299, 1, 1, 1, 161, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2300, 1, 1, 1, 162, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2301, 1, 1, 1, 163, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2302, 1, 1, 1, 164, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2303, 1, 1, 1, 165, 26, '2018-08-29', '13:00:00', NULL, NULL, 1),
(2304, 1, 1, 1, 152, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2305, 1, 1, 1, 153, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2306, 1, 2, 1, 154, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2307, 1, 1, 1, 155, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2308, 1, 1, 1, 156, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2309, 1, 1, 1, 157, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2310, 1, 1, 1, 158, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2311, 1, 1, 1, 159, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2312, 1, 2, 1, 160, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2313, 1, 1, 1, 161, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2314, 1, 1, 1, 162, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2315, 1, 1, 1, 163, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2316, 1, 1, 1, 164, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2317, 1, 1, 1, 165, 26, '2018-08-30', '13:00:00', NULL, NULL, 1),
(2318, 1, 1, 1, 152, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2319, 1, 1, 1, 153, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2320, 1, 1, 1, 154, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2321, 1, 1, 1, 155, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2322, 1, 1, 1, 156, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2323, 1, 1, 1, 157, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2324, 1, 1, 1, 158, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2325, 1, 1, 1, 159, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2326, 1, 1, 1, 160, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2327, 1, 1, 1, 161, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2328, 1, 1, 1, 162, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2329, 1, 1, 1, 163, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2330, 1, 1, 1, 164, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2331, 1, 1, 1, 165, 26, '2018-08-31', '13:00:00', NULL, NULL, 1),
(2332, 1, 1, 1, 152, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2333, 1, 1, 1, 153, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2334, 1, 1, 1, 154, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2335, 1, 1, 1, 155, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2336, 1, 2, 1, 156, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2337, 1, 1, 1, 157, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2338, 1, 1, 1, 158, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2339, 1, 1, 1, 159, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2340, 1, 1, 1, 160, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2341, 1, 1, 1, 161, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2342, 1, 1, 1, 162, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2343, 1, 1, 1, 163, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2344, 1, 1, 1, 164, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2345, 1, 1, 1, 165, 26, '2018-09-03', '13:00:00', NULL, NULL, 1),
(2346, 1, 1, 1, 152, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2347, 1, 1, 1, 153, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2348, 1, 4, 1, 154, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2349, 1, 1, 1, 155, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2350, 1, 1, 1, 156, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2351, 1, 1, 1, 157, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2352, 1, 1, 1, 158, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2353, 1, 1, 1, 159, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2354, 1, 1, 1, 160, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2355, 1, 1, 1, 161, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2356, 1, 1, 1, 162, 26, '2018-09-04', '13:00:00', 'uwu', NULL, 1),
(2357, 1, 4, 1, 163, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2358, 1, 1, 1, 164, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2359, 1, 1, 1, 165, 26, '2018-09-04', '13:00:00', NULL, NULL, 1),
(2360, 1, 1, 1, 152, 26, '2018-09-05', '13:00:00', 'owo', NULL, 1),
(2361, 1, 1, 1, 153, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2362, 1, 1, 1, 154, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2363, 1, 1, 1, 155, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2364, 1, 1, 1, 156, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2365, 1, 1, 1, 157, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2366, 1, 1, 1, 158, 26, '2018-09-05', '13:00:00', NULL, NULL, 1);
INSERT INTO `seguimientos` (`idSeguimiento`, `idUsuario`, `idMotivo`, `idSubmotivo`, `idAlumnxcurso`, `idCurso`, `fecha`, `hora`, `justificado`, `observaciones`, `estado`) VALUES
(2367, 1, 1, 1, 159, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2368, 1, 1, 1, 160, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2369, 1, 1, 1, 161, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2370, 1, 1, 1, 162, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2371, 1, 1, 1, 163, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2372, 1, 1, 1, 164, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2373, 1, 1, 1, 165, 26, '2018-09-05', '13:00:00', NULL, NULL, 1),
(2374, 1, 1, 1, 152, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2375, 1, 1, 1, 153, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2376, 1, 1, 1, 154, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2377, 1, 1, 1, 155, 26, '2018-09-06', '13:00:00', 'ewe', NULL, 1),
(2378, 1, 1, 1, 156, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2379, 1, 1, 1, 157, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2380, 1, 3, 1, 158, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2381, 1, 1, 1, 159, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2382, 1, 1, 1, 160, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2383, 1, 1, 1, 161, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2384, 1, 1, 1, 162, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2385, 1, 1, 1, 163, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2386, 1, 1, 1, 164, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2387, 1, 1, 1, 165, 26, '2018-09-06', '13:00:00', NULL, NULL, 1),
(2388, 1, 1, 1, 152, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2389, 1, 1, 1, 153, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2390, 1, 1, 1, 154, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2391, 1, 1, 1, 155, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2392, 1, 1, 1, 156, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2393, 1, 1, 1, 157, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2394, 1, 1, 1, 158, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2395, 1, 1, 1, 159, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2396, 1, 1, 1, 160, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2397, 1, 1, 1, 161, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2398, 1, 1, 1, 162, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2399, 1, 1, 1, 163, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2400, 1, 1, 1, 164, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2401, 1, 1, 1, 165, 26, '2018-09-07', '13:00:00', NULL, NULL, 1),
(2402, 1, 1, 1, 152, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2403, 1, 1, 1, 153, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2404, 1, 2, 1, 154, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2405, 1, 1, 1, 155, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2406, 1, 3, 1, 156, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2407, 1, 1, 1, 157, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2408, 1, 2, 1, 158, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2409, 1, 1, 1, 159, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2410, 1, 1, 1, 160, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2411, 1, 1, 1, 161, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2412, 1, 1, 1, 162, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2413, 1, 3, 1, 163, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2414, 1, 1, 1, 164, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2415, 1, 1, 1, 165, 26, '2018-09-10', '13:00:00', NULL, NULL, 1),
(2416, 1, 1, 1, 152, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2417, 1, 1, 1, 153, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2418, 1, 1, 1, 154, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2419, 1, 1, 1, 155, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2420, 1, 1, 1, 156, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2421, 1, 1, 1, 157, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2422, 1, 1, 1, 158, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2423, 1, 1, 1, 159, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2424, 1, 1, 1, 160, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2425, 1, 1, 1, 161, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2426, 1, 1, 1, 162, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2427, 1, 1, 1, 163, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2428, 1, 1, 1, 164, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2429, 1, 1, 1, 165, 26, '2018-09-12', '13:00:00', NULL, NULL, 1),
(2430, 1, 1, 1, 152, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2431, 1, 3, 1, 153, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2432, 1, 3, 1, 154, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2433, 1, 1, 1, 155, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2434, 1, 1, 1, 156, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2435, 1, 1, 1, 157, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2436, 1, 1, 1, 158, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2437, 1, 1, 1, 159, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2438, 1, 1, 1, 160, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2439, 1, 1, 1, 161, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2440, 1, 1, 1, 162, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2441, 1, 1, 1, 163, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2442, 1, 1, 1, 164, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2443, 1, 1, 1, 165, 26, '2018-09-13', '13:00:00', NULL, NULL, 1),
(2444, 1, 1, 1, 152, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2445, 1, 1, 1, 153, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2446, 1, 1, 1, 154, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2447, 1, 1, 1, 155, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2448, 1, 1, 1, 156, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2449, 1, 1, 1, 157, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2450, 1, 1, 1, 158, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2451, 1, 1, 1, 159, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2452, 1, 1, 1, 160, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2453, 1, 1, 1, 161, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2454, 1, 1, 1, 162, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2455, 1, 1, 1, 163, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2456, 1, 1, 1, 164, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2457, 1, 1, 1, 165, 26, '2018-09-14', '13:00:00', NULL, NULL, 1),
(2458, 1, 1, 1, 152, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2459, 1, 3, 1, 153, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2460, 1, 1, 1, 154, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2461, 1, 1, 1, 155, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2462, 1, 4, 1, 156, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2463, 1, 1, 1, 157, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2464, 1, 4, 1, 158, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2465, 1, 2, 1, 159, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2466, 1, 1, 1, 160, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2467, 1, 1, 1, 161, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2468, 1, 1, 1, 162, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2469, 1, 1, 1, 163, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2470, 1, 1, 1, 164, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2471, 1, 1, 1, 165, 26, '2018-09-17', '13:00:00', NULL, NULL, 1),
(2472, 1, 1, 1, 152, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2473, 1, 1, 1, 153, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2474, 1, 1, 1, 154, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2475, 1, 1, 1, 155, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2476, 1, 3, 1, 156, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2477, 1, 1, 1, 157, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2478, 1, 1, 1, 158, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2479, 1, 1, 1, 159, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2480, 1, 1, 1, 160, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2481, 1, 1, 1, 161, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2482, 1, 1, 1, 162, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2483, 1, 1, 1, 163, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2484, 1, 1, 1, 164, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2485, 1, 1, 1, 165, 26, '2018-09-18', '13:00:00', NULL, NULL, 1),
(2486, 1, 1, 1, 152, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2487, 1, 1, 1, 153, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2488, 1, 1, 1, 154, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2489, 1, 1, 1, 155, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2490, 1, 1, 1, 156, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2491, 1, 1, 1, 157, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2492, 1, 1, 1, 158, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2493, 1, 1, 1, 159, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2494, 1, 1, 1, 160, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2495, 1, 1, 1, 161, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2496, 1, 1, 1, 162, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2497, 1, 1, 1, 163, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2498, 1, 2, 1, 164, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2499, 1, 1, 1, 165, 26, '2018-09-19', '13:00:00', NULL, NULL, 1),
(2500, 1, 1, 1, 152, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2501, 1, 1, 1, 153, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2502, 1, 1, 1, 154, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2503, 1, 1, 1, 155, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2504, 1, 1, 1, 156, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2505, 1, 1, 1, 157, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2506, 1, 1, 1, 158, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2507, 1, 1, 1, 159, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2508, 1, 1, 1, 160, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2509, 1, 1, 1, 161, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2510, 1, 1, 1, 162, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2511, 1, 1, 1, 163, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2512, 1, 1, 1, 164, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2513, 1, 1, 1, 165, 26, '2018-09-20', '13:00:00', NULL, NULL, 1),
(2514, 1, 1, 1, 152, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2515, 1, 3, 1, 153, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2516, 1, 1, 1, 154, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2517, 1, 3, 1, 155, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2518, 1, 1, 1, 156, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2519, 1, 3, 1, 157, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2520, 1, 4, 1, 158, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2521, 1, 1, 1, 159, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2522, 1, 1, 1, 160, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2523, 1, 1, 1, 161, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2524, 1, 1, 1, 162, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2525, 1, 1, 1, 163, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2526, 1, 3, 1, 164, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2527, 1, 3, 1, 165, 26, '2018-09-24', '13:00:00', NULL, NULL, 1),
(2528, 1, 3, 1, 152, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2529, 1, 3, 1, 153, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2530, 1, 3, 1, 154, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2531, 1, 3, 1, 155, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2532, 1, 3, 1, 156, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2533, 1, 3, 1, 157, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2534, 1, 3, 1, 158, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2535, 1, 3, 1, 159, 26, '2018-09-25', '13:00:00', 'Tampoco leyo berserk', NULL, 1),
(2536, 1, 3, 1, 160, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2537, 1, 3, 1, 161, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2538, 1, 3, 1, 162, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2539, 1, 3, 1, 163, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2540, 1, 3, 1, 164, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2541, 1, 3, 1, 165, 26, '2018-09-25', '13:00:00', NULL, NULL, 1),
(2542, 1, 1, 1, 152, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2543, 1, 1, 1, 153, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2544, 1, 1, 1, 154, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2545, 1, 1, 1, 155, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2546, 1, 1, 1, 156, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2547, 1, 1, 1, 157, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2548, 1, 1, 1, 158, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2549, 1, 1, 1, 159, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2550, 1, 1, 1, 160, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2551, 1, 1, 1, 161, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2552, 1, 1, 1, 162, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2553, 1, 1, 1, 163, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2554, 1, 1, 1, 164, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2555, 1, 1, 1, 165, 26, '2018-09-26', '13:00:00', NULL, NULL, 1),
(2556, 1, 1, 1, 152, 26, '2018-09-27', '13:00:00', 'Aviso que se iba antes}', NULL, 1),
(2557, 1, 1, 1, 153, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2558, 1, 1, 1, 154, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2559, 1, 1, 1, 155, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2560, 1, 4, 1, 156, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2561, 1, 1, 1, 157, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2562, 1, 1, 1, 158, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2563, 1, 1, 1, 159, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2564, 1, 1, 1, 160, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2565, 1, 1, 1, 161, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2566, 1, 1, 1, 162, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2567, 1, 2, 1, 163, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2568, 1, 1, 1, 164, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2569, 1, 1, 1, 165, 26, '2018-09-27', '13:00:00', NULL, NULL, 1),
(2570, 1, 1, 1, 152, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2571, 1, 1, 1, 153, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2572, 1, 1, 1, 154, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2573, 1, 1, 1, 155, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2574, 1, 1, 1, 156, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2575, 1, 1, 1, 157, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2576, 1, 1, 1, 158, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2577, 1, 1, 1, 159, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2578, 1, 1, 1, 160, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2579, 1, 1, 1, 161, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2580, 1, 1, 1, 162, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2581, 1, 1, 1, 163, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2582, 1, 1, 1, 164, 26, '2018-09-28', '13:00:00', 'owo', NULL, 1),
(2583, 1, 1, 1, 165, 26, '2018-09-28', '13:00:00', NULL, NULL, 1),
(2584, 1, 1, 1, 152, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2585, 1, 4, 1, 153, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2586, 1, 3, 1, 154, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2587, 1, 1, 1, 155, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2588, 1, 1, 1, 156, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2589, 1, 1, 1, 157, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2590, 1, 1, 1, 158, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2591, 1, 2, 1, 159, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2592, 1, 3, 1, 160, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2593, 1, 1, 1, 161, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2594, 1, 2, 1, 162, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2595, 1, 1, 1, 163, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2596, 1, 1, 1, 164, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2597, 1, 1, 1, 165, 26, '2018-10-01', '13:00:00', NULL, NULL, 1),
(2598, 1, 1, 1, 152, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2599, 1, 1, 1, 153, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2600, 1, 3, 1, 154, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2601, 1, 1, 1, 155, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2602, 1, 2, 1, 156, 26, '2018-10-02', '13:00:00', 'uwu', NULL, 1),
(2603, 1, 1, 1, 157, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2604, 1, 1, 1, 158, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2605, 1, 2, 1, 159, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2606, 1, 3, 1, 160, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2607, 1, 1, 1, 161, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2608, 1, 1, 1, 162, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2609, 1, 1, 1, 163, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2610, 1, 1, 1, 164, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2611, 1, 1, 1, 165, 26, '2018-10-02', '13:00:00', NULL, NULL, 1),
(2612, 1, 1, 1, 152, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2613, 1, 1, 1, 153, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2614, 1, 1, 1, 154, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2615, 1, 1, 1, 155, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2616, 1, 1, 1, 156, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2617, 1, 1, 1, 157, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2618, 1, 1, 1, 158, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2619, 1, 1, 1, 159, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2620, 1, 1, 1, 160, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2621, 1, 1, 1, 161, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2622, 1, 1, 1, 162, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2623, 1, 1, 1, 163, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2624, 1, 1, 1, 164, 26, '2018-10-03', '13:00:00', 'karinaaaaaa', NULL, 1),
(2625, 1, 1, 1, 165, 26, '2018-10-03', '13:00:00', NULL, NULL, 1),
(2627, 1, 3, 1, 152, 26, '2018-10-8', '13:00:00', '', '', 1),
(2628, 1, 3, 1, 152, 26, '2018-10-8', '13:00:00', '', '', 1),
(2629, 1, 2, 1, 153, 26, '2018-10-8', '13:00:00', '', '', 1),
(2630, 1, 1, 1, 154, 26, '2018-10-8', '00:00:00', '', '', 1),
(2631, 1, 1, 1, 155, 26, '2018-10-8', '00:00:00', '', '', 1),
(2632, 1, 1, 1, 156, 26, '2018-10-8', '13:00:00', '', '', 1),
(2633, 1, 1, 1, 157, 26, '2018-10-8', '13:00:00', '', '', 1),
(2634, 1, 1, 1, 158, 26, '2018-10-8', '13:00:00', '', '', 1),
(2635, 1, 1, 1, 159, 26, '2018-10-8', '13:00:00', '', '', 1),
(2636, 1, 1, 1, 160, 26, '2018-10-8', '13:00:00', '', '', 1),
(2637, 1, 1, 1, 161, 26, '2018-10-8', '13:00:00', '', '', 1),
(2638, 1, 1, 1, 162, 26, '2018-10-8', '13:00:00', '', '', 1),
(2639, 1, 1, 1, 163, 26, '2018-10-8', '13:00:00', '', '', 1),
(2640, 1, 1, 1, 164, 26, '2018-10-8', '13:00:00', '', '', 1),
(2641, 1, 1, 1, 165, 26, '2018-10-8', '13:00:00', '', '', 1),
(2642, 1, 1, 1, 2, 25, '2018-10-8', '00:00:00', '', '', 1),
(2643, 1, 1, 1, 3, 25, '2018-10-8', '00:00:00', '', '', 1),
(2644, 1, 1, 1, 4, 25, '2018-10-8', '00:00:00', '', '', 1),
(2645, 1, 1, 1, 5, 25, '2018-10-8', '00:00:00', '', '', 1),
(2646, 1, 1, 1, 6, 25, '2018-10-8', '00:00:00', '', '', 1),
(2647, 1, 1, 1, 7, 25, '2018-10-8', '00:00:00', '', '', 1),
(2648, 1, 1, 1, 8, 25, '2018-10-8', '00:00:00', '', '', 1),
(2649, 1, 1, 1, 9, 25, '2018-10-8', '00:00:00', '', '', 1),
(2650, 4, 1, 1, 114, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2651, 4, 2, 1, 115, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2652, 4, 3, 1, 116, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2653, 4, 3, 1, 117, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2654, 4, 1, 1, 118, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2655, 4, 2, 1, 119, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2656, 4, 1, 1, 120, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2657, 4, 1, 1, 121, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2658, 4, 1, 1, 122, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2659, 4, 1, 1, 123, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2660, 2, 9, 3, 45, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2661, 2, 10, 3, 46, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2662, 2, 9, 3, 47, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2663, 2, 11, 3, 48, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2664, 2, 9, 3, 49, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2665, 2, 9, 3, 50, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2666, 2, 9, 3, 51, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2667, 2, 11, 3, 52, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2668, 2, 12, 3, 53, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2669, 4, 1, 1, 122, 15, '2018-09-24', '12:40:00', '', '', NULL),
(2670, 4, 1, 1, 45, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2671, 4, 1, 1, 46, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2672, 4, 11, 1, 47, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2673, 4, 1, 1, 48, 15, '2018-09-25', '13:00:00', '', '', NULL),
(2674, 4, 1, 1, 49, 24, '2018-09-25', '13:00:00', '', '', NULL),
(2675, 4, 1, 1, 50, 24, '2018-09-25', '13:00:00', '', '', NULL),
(2676, 4, 1, 1, 51, 24, '2018-09-25', '13:00:00', '', '', NULL),
(2677, 4, 1, 1, 52, 24, '2018-09-25', '13:00:00', '', '', NULL),
(2678, 4, 1, 1, 53, 24, '2018-09-25', '13:00:00', '', '', NULL),
(2679, 6, 3, 1, 45, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2680, 6, 2, 1, 46, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2681, 6, 4, 1, 47, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2682, 6, 1, 1, 48, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2683, 6, 1, 1, 49, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2684, 6, 2, 1, 50, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2685, 6, 2, 1, 51, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2686, 6, 3, 1, 52, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2687, 6, 1, 1, 53, 24, '2018-09-26', '13:10:00', '', '', NULL),
(2688, 4, 9, 3, 45, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2689, 4, 10, 3, 46, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2690, 4, 9, 3, 47, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2691, 4, 9, 3, 48, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2692, 4, 11, 3, 49, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2693, 4, 10, 3, 50, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2694, 4, 9, 3, 51, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2695, 4, 1, 3, 52, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2696, 4, 1, 3, 53, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2697, 4, 1, 1, 45, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2698, 4, 1, 1, 46, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2699, 4, 1, 1, 47, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2700, 4, 1, 1, 48, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2701, 4, 1, 1, 49, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2702, 4, 1, 1, 50, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2703, 4, 1, 1, 21, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2704, 4, 1, 1, 52, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2705, 4, 1, 1, 53, 24, '2018-09-27', '13:00:00', '', '', NULL),
(2706, 4, 4, 1, 45, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2707, 4, 2, 1, 46, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2708, 4, 3, 1, 47, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2709, 4, 3, 1, 48, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2710, 4, 1, 1, 49, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2711, 4, 1, 1, 50, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2712, 4, 1, 1, 51, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2713, 4, 1, 1, 52, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2714, 4, 2, 1, 53, 24, '2018-09-28', '13:00:00', '', '', NULL),
(2715, 4, 1, 1, 45, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2716, 4, 3, 1, 46, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2717, 4, 3, 1, 47, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2718, 4, 1, 1, 48, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2719, 4, 1, 1, 49, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2720, 4, 2, 1, 50, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2721, 4, 1, 1, 51, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2722, 4, 1, 1, 52, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2723, 4, 2, 1, 53, 24, '2018-09-29', '13:00:00', '', '', NULL),
(2724, 4, 1, 1, 45, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2725, 4, 4, 1, 46, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2726, 4, 2, 1, 47, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2727, 4, 2, 1, 48, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2728, 4, 1, 1, 49, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2729, 4, 2, 1, 50, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2730, 4, 4, 1, 51, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2731, 4, 3, 1, 52, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2732, 4, 4, 1, 53, 24, '2018-10-01', '12:40:00', '', '', NULL),
(2733, 2, 10, 3, 45, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2734, 2, 11, 3, 46, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2735, 2, 9, 3, 47, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2736, 2, 9, 3, 48, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2737, 2, 9, 3, 49, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2738, 2, 10, 3, 50, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2739, 2, 11, 3, 51, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2740, 2, 12, 3, 52, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2741, 2, 11, 3, 53, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2742, 2, 1, 1, 45, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2743, 2, 1, 1, 46, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2744, 2, 1, 1, 47, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2745, 2, 1, 1, 48, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2746, 2, 1, 1, 49, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2747, 2, 1, 1, 50, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2748, 2, 1, 1, 51, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2749, 2, 1, 1, 52, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2750, 2, 1, 1, 53, 24, '2018-10-02', '13:00:00', '', '', NULL),
(2751, 4, 1, 1, 45, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2752, 4, 2, 1, 46, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2753, 4, 1, 1, 47, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2754, 4, 1, 1, 48, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2755, 4, 1, 1, 49, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2756, 4, 2, 1, 50, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2757, 4, 4, 1, 51, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2758, 4, 3, 1, 52, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2759, 4, 3, 1, 53, 24, '2018-10-03', '13:10:00', '', '', NULL),
(2760, 4, 11, 3, 45, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2761, 4, 10, 3, 46, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2762, 4, 9, 3, 47, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2763, 4, 9, 3, 48, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2764, 4, 11, 3, 49, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2765, 4, 11, 3, 50, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2766, 4, 10, 3, 51, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2767, 4, 10, 3, 52, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2768, 4, 12, 3, 53, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2769, 4, 1, 1, 45, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2770, 4, 1, 1, 46, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2771, 4, 1, 1, 47, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2772, 4, 1, 1, 48, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2773, 4, 1, 1, 49, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2774, 4, 1, 1, 50, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2775, 4, 1, 1, 51, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2776, 4, 1, 1, 52, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2777, 4, 1, 1, 53, 24, '2018-10-04', '13:00:00', '', '', NULL),
(2778, 4, 1, 1, 45, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2779, 4, 2, 1, 46, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2780, 4, 3, 1, 47, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2781, 4, 3, 1, 48, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2782, 4, 1, 1, 49, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2783, 4, 3, 1, 50, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2784, 4, 1, 1, 51, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2785, 4, 1, 1, 52, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2786, 4, 4, 1, 53, 24, '2018-10-05', '13:00:00', '', '', NULL),
(2787, 4, 2, 1, 45, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2788, 4, 1, 1, 46, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2789, 4, 2, 1, 47, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2790, 4, 2, 1, 48, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2791, 4, 1, 1, 49, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2792, 4, 2, 1, 50, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2793, 4, 4, 1, 51, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2794, 4, 3, 1, 52, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2795, 4, 3, 1, 53, 24, '2018-10-08', '12:40:00', '', '', NULL),
(2796, 2, 10, 3, 45, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2797, 2, 9, 3, 46, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2798, 2, 9, 3, 47, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2799, 2, 10, 3, 48, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2800, 2, 9, 3, 49, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2801, 2, 11, 3, 50, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2802, 2, 9, 3, 51, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2803, 2, 12, 3, 52, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2804, 2, 12, 3, 53, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2805, 2, 1, 1, 45, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2806, 2, 1, 1, 46, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2807, 2, 1, 1, 47, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2808, 2, 1, 1, 48, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2809, 2, 1, 1, 49, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2810, 2, 1, 1, 50, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2811, 2, 1, 1, 51, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2812, 2, 1, 1, 52, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2813, 2, 1, 1, 53, 24, '2018-10-09', '13:00:00', '', '', NULL),
(2814, 4, 1, 1, 45, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2815, 4, 2, 1, 46, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2816, 4, 1, 1, 47, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2817, 4, 1, 1, 48, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2818, 4, 1, 1, 49, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2819, 4, 2, 1, 50, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2820, 4, 4, 1, 51, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2821, 4, 3, 1, 52, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2822, 4, 3, 1, 53, 24, '2018-10-10', '13:10:00', '', '', NULL),
(2823, 4, 9, 3, 45, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2824, 4, 10, 3, 46, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2825, 4, 9, 3, 47, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2826, 4, 9, 3, 48, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2827, 4, 9, 3, 49, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2828, 4, 10, 3, 50, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2829, 4, 9, 3, 51, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2830, 4, 9, 3, 52, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2831, 4, 11, 3, 53, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2832, 4, 1, 1, 45, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2833, 4, 1, 1, 46, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2834, 4, 1, 1, 47, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2835, 4, 1, 1, 48, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2836, 4, 1, 1, 49, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2837, 4, 1, 1, 50, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2838, 4, 1, 1, 51, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2839, 4, 1, 1, 52, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2840, 4, 1, 1, 53, 24, '2018-10-11', '13:00:00', '', '', NULL),
(2841, 4, 4, 1, 45, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2842, 4, 2, 1, 46, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2843, 4, 3, 1, 47, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2844, 4, 1, 1, 48, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2845, 4, 2, 1, 49, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2846, 4, 2, 1, 50, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2847, 4, 3, 1, 51, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2848, 4, 1, 1, 52, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2849, 4, 4, 1, 53, 24, '2018-10-12', '13:00:00', '', '', NULL),
(2850, 4, 2, 1, 45, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2851, 4, 2, 1, 46, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2852, 4, 3, 1, 47, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2853, 4, 2, 1, 48, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2854, 4, 1, 1, 49, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2855, 4, 2, 1, 50, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2856, 4, 4, 1, 51, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2857, 4, 3, 1, 52, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2858, 4, 3, 1, 53, 24, '2018-10-15', '12:40:00', '', '', NULL),
(2859, 2, 12, 3, 45, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2860, 2, 9, 3, 46, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2861, 2, 10, 3, 47, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2862, 2, 10, 3, 48, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2863, 2, 9, 3, 49, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2864, 2, 11, 3, 50, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2865, 2, 9, 3, 51, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2866, 2, 9, 3, 52, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2867, 2, 12, 3, 53, 24, '2018-10-06', '13:00:00', '', '', NULL),
(2868, 2, 1, 1, 45, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2869, 2, 1, 1, 46, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2870, 2, 1, 1, 47, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2871, 2, 1, 1, 48, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2872, 2, 1, 1, 49, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2873, 2, 1, 1, 50, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2874, 2, 1, 1, 51, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2875, 2, 1, 1, 52, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2876, 2, 1, 1, 53, 24, '2018-10-16', '13:00:00', '', '', NULL),
(2877, 4, 1, 1, 45, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2878, 4, 2, 1, 46, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2879, 4, 1, 1, 47, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2880, 4, 4, 1, 48, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2881, 4, 1, 1, 49, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2882, 4, 2, 1, 50, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2883, 4, 4, 1, 51, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2884, 4, 3, 1, 52, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2885, 4, 3, 1, 53, 24, '2018-10-17', '13:10:00', '', '', NULL),
(2886, 4, 9, 3, 45, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2887, 4, 9, 3, 46, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2888, 4, 9, 3, 47, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2889, 4, 9, 3, 48, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2890, 4, 9, 3, 49, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2891, 4, 10, 3, 50, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2892, 4, 9, 3, 51, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2893, 4, 9, 3, 52, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2894, 4, 11, 3, 53, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2895, 4, 1, 1, 45, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2896, 4, 1, 1, 46, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2897, 4, 1, 1, 47, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2898, 4, 1, 1, 48, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2899, 4, 1, 1, 49, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2900, 4, 1, 1, 50, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2901, 4, 1, 1, 51, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2902, 4, 1, 1, 52, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2903, 4, 1, 1, 53, 24, '2018-10-18', '13:00:00', '', '', NULL),
(2904, 4, 4, 1, 45, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2905, 4, 2, 1, 46, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2906, 4, 3, 1, 47, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2907, 4, 1, 1, 48, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2908, 4, 2, 1, 49, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2909, 4, 2, 1, 50, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2910, 4, 3, 1, 51, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2911, 4, 1, 1, 52, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2912, 4, 4, 1, 53, 24, '2018-10-19', '13:00:00', '', '', NULL),
(2913, 4, 1, 1, 45, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2914, 4, 2, 1, 46, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2915, 4, 3, 1, 47, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2916, 4, 2, 1, 48, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2917, 4, 1, 1, 49, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2918, 4, 2, 1, 50, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2919, 4, 4, 1, 51, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2920, 4, 3, 1, 52, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2921, 4, 3, 1, 53, 24, '2018-10-22', '12:40:00', '', '', NULL),
(2922, 2, 12, 3, 45, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2923, 2, 9, 3, 46, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2924, 2, 9, 3, 47, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2925, 2, 10, 3, 48, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2926, 2, 9, 3, 49, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2927, 2, 11, 3, 50, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2928, 2, 9, 3, 51, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2929, 2, 9, 3, 52, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2930, 2, 12, 3, 53, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2931, 2, 1, 1, 45, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2932, 2, 1, 1, 46, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2933, 2, 1, 1, 47, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2934, 2, 1, 1, 48, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2935, 2, 1, 1, 49, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2936, 2, 1, 1, 50, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2937, 2, 1, 1, 51, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2938, 2, 1, 1, 52, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2939, 2, 1, 1, 53, 24, '2018-10-23', '13:00:00', '', '', NULL),
(2940, 4, 1, 1, 45, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2941, 4, 2, 1, 46, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2942, 4, 1, 1, 47, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2943, 4, 4, 1, 48, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2944, 4, 1, 1, 49, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2945, 4, 2, 1, 50, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2946, 4, 4, 1, 51, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2947, 4, 3, 1, 52, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2948, 4, 3, 1, 53, 24, '2018-10-24', '13:10:00', '', '', NULL),
(2949, 4, 9, 3, 45, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2950, 4, 9, 3, 46, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2951, 4, 9, 3, 47, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2952, 4, 9, 3, 48, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2953, 4, 9, 3, 49, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2954, 4, 10, 3, 50, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2955, 4, 9, 3, 51, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2956, 4, 9, 3, 52, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2957, 4, 11, 3, 53, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2958, 4, 1, 1, 45, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2959, 4, 1, 1, 46, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2960, 4, 1, 1, 47, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2961, 4, 1, 1, 48, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2962, 4, 1, 1, 49, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2963, 4, 1, 1, 50, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2964, 4, 1, 1, 51, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2965, 4, 1, 1, 52, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2966, 4, 1, 1, 53, 24, '2018-10-25', '13:00:00', '', '', NULL),
(2967, 4, 4, 1, 45, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2968, 4, 2, 1, 46, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2969, 4, 3, 1, 47, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2970, 4, 1, 1, 48, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2971, 4, 2, 1, 49, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2972, 4, 2, 1, 50, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2973, 4, 3, 1, 51, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2974, 4, 1, 1, 52, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2975, 4, 4, 1, 53, 24, '2018-10-26', '13:00:00', '', '', NULL),
(2976, 4, 1, 1, 45, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2977, 4, 2, 1, 46, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2978, 4, 3, 1, 47, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2979, 4, 2, 1, 48, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2980, 4, 1, 1, 49, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2981, 4, 2, 1, 50, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2982, 4, 4, 1, 51, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2983, 4, 3, 1, 52, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2984, 4, 3, 1, 53, 24, '2018-11-01', '12:40:00', '', '', NULL),
(2985, 2, 12, 3, 45, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2986, 2, 9, 3, 46, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2987, 2, 9, 3, 47, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2988, 2, 10, 3, 48, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2989, 2, 9, 3, 49, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2990, 2, 11, 3, 50, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2991, 2, 9, 3, 51, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2992, 2, 9, 3, 52, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2993, 2, 12, 3, 53, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2994, 2, 1, 1, 45, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2995, 2, 1, 1, 46, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2996, 2, 1, 1, 47, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2997, 2, 1, 1, 48, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2998, 2, 1, 1, 49, 24, '2018-11-02', '13:00:00', '', '', NULL),
(2999, 2, 1, 1, 50, 24, '2018-11-02', '13:00:00', '', '', NULL),
(3000, 2, 1, 1, 51, 24, '2018-11-02', '13:00:00', '', '', NULL),
(3001, 2, 1, 1, 52, 24, '2018-11-02', '13:00:00', '', '', NULL),
(3002, 2, 1, 1, 53, 24, '2018-11-02', '13:00:00', '', '', NULL),
(3003, 4, 1, 1, 45, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3004, 4, 2, 1, 46, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3005, 4, 1, 1, 47, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3006, 4, 4, 1, 48, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3007, 4, 1, 1, 49, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3008, 4, 2, 1, 50, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3009, 4, 4, 1, 51, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3010, 4, 3, 1, 52, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3011, 4, 3, 1, 53, 24, '2018-11-03', '13:10:00', '', '', NULL),
(3012, 4, 9, 3, 45, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3013, 4, 9, 3, 46, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3014, 4, 9, 3, 47, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3015, 4, 9, 3, 48, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3016, 4, 9, 3, 49, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3017, 4, 10, 3, 50, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3018, 4, 9, 3, 51, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3019, 4, 9, 3, 52, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3020, 4, 11, 3, 53, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3021, 4, 1, 1, 45, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3022, 4, 1, 1, 46, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3023, 4, 1, 1, 47, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3024, 4, 1, 1, 48, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3025, 4, 1, 1, 49, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3026, 4, 1, 1, 50, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3027, 4, 1, 1, 51, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3028, 4, 1, 1, 52, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3029, 4, 1, 1, 53, 24, '2018-11-04', '13:00:00', '', '', NULL),
(3030, 4, 4, 1, 45, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3031, 4, 2, 1, 46, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3032, 4, 3, 1, 47, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3033, 4, 1, 1, 48, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3034, 4, 2, 1, 49, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3035, 4, 2, 1, 50, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3036, 4, 3, 1, 51, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3037, 4, 1, 1, 52, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3038, 4, 4, 1, 53, 24, '2018-11-05', '13:00:00', '', '', NULL),
(3039, 4, 1, 1, 45, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3040, 4, 2, 1, 46, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3041, 4, 3, 1, 47, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3042, 4, 2, 1, 48, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3043, 4, 1, 1, 49, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3044, 4, 2, 1, 50, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3045, 4, 4, 1, 51, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3046, 4, 3, 1, 52, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3047, 4, 3, 1, 53, 24, '2018-11-08', '12:40:00', '', '', NULL),
(3048, 2, 12, 3, 45, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3049, 2, 9, 3, 46, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3050, 2, 9, 3, 47, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3051, 2, 10, 3, 48, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3052, 2, 9, 3, 49, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3053, 2, 11, 3, 50, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3054, 2, 9, 3, 51, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3055, 2, 9, 3, 52, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3056, 2, 12, 3, 53, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3057, 2, 1, 1, 45, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3058, 2, 1, 1, 46, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3059, 2, 1, 1, 47, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3060, 2, 1, 1, 48, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3061, 2, 1, 1, 49, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3062, 2, 1, 1, 50, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3063, 2, 1, 1, 51, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3064, 2, 1, 1, 52, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3065, 2, 1, 1, 53, 24, '2018-11-09', '13:00:00', '', '', NULL),
(3066, 4, 1, 1, 45, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3067, 4, 2, 1, 46, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3068, 4, 1, 1, 47, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3069, 4, 4, 1, 48, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3070, 4, 1, 1, 49, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3071, 4, 2, 1, 50, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3072, 4, 4, 1, 51, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3073, 4, 3, 1, 52, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3074, 4, 3, 1, 53, 24, '2018-11-10', '13:10:00', '', '', NULL),
(3075, 4, 9, 3, 45, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3076, 4, 9, 3, 46, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3077, 4, 9, 3, 47, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3078, 4, 9, 3, 48, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3079, 4, 9, 3, 49, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3080, 4, 10, 3, 50, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3081, 4, 9, 3, 51, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3082, 4, 9, 3, 52, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3083, 4, 11, 3, 53, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3084, 4, 1, 1, 45, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3085, 4, 1, 1, 46, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3086, 4, 1, 1, 47, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3087, 4, 1, 1, 48, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3088, 4, 1, 1, 49, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3089, 4, 1, 1, 50, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3090, 4, 1, 1, 51, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3091, 4, 1, 1, 52, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3092, 4, 12, 1, 53, 24, '2018-11-11', '13:00:00', '', '', NULL),
(3093, 4, 4, 1, 45, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3094, 4, 2, 1, 46, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3095, 4, 3, 1, 47, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3096, 4, 1, 1, 48, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3097, 4, 2, 1, 49, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3098, 4, 2, 1, 50, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3099, 4, 3, 1, 51, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3100, 4, 1, 1, 52, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3101, 4, 4, 1, 53, 24, '2018-11-12', '13:00:00', '', '', NULL),
(3102, 4, 1, 1, 45, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3103, 4, 2, 1, 46, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3104, 4, 3, 1, 47, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3105, 4, 2, 1, 48, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3106, 4, 1, 1, 49, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3107, 4, 2, 1, 50, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3108, 4, 4, 1, 51, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3109, 4, 3, 1, 52, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3110, 4, 3, 1, 53, 24, '2018-11-15', '12:40:00', '', '', NULL),
(3111, 2, 12, 3, 45, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3112, 2, 9, 3, 46, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3113, 2, 9, 3, 47, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3114, 2, 10, 3, 48, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3115, 2, 9, 3, 49, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3116, 2, 11, 3, 50, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3117, 2, 9, 3, 51, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3118, 2, 9, 3, 52, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3119, 2, 12, 3, 53, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3120, 2, 1, 1, 45, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3121, 2, 1, 1, 46, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3122, 2, 1, 1, 47, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3123, 2, 1, 1, 48, 25, '2018-11-16', '13:00:00', '', '', NULL),
(3124, 2, 1, 1, 49, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3125, 2, 1, 1, 50, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3126, 2, 1, 1, 51, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3127, 2, 1, 1, 52, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3128, 2, 1, 1, 53, 24, '2018-11-16', '13:00:00', '', '', NULL),
(3129, 4, 1, 1, 45, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3130, 4, 2, 1, 46, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3131, 4, 1, 1, 47, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3132, 4, 4, 1, 48, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3133, 4, 1, 1, 49, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3134, 4, 2, 1, 50, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3135, 4, 4, 1, 51, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3136, 4, 3, 1, 52, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3137, 4, 3, 1, 53, 24, '2018-11-17', '13:10:00', '', '', NULL),
(3138, 4, 9, 3, 45, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3139, 4, 9, 3, 46, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3140, 4, 9, 3, 47, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3141, 4, 9, 3, 48, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3142, 4, 9, 3, 49, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3143, 4, 10, 3, 50, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3144, 4, 9, 3, 51, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3145, 4, 9, 3, 52, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3146, 4, 11, 3, 53, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3147, 4, 1, 1, 45, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3148, 4, 1, 1, 46, 24, '2018-11-18', '13:00:00', '', '', NULL);
INSERT INTO `seguimientos` (`idSeguimiento`, `idUsuario`, `idMotivo`, `idSubmotivo`, `idAlumnxcurso`, `idCurso`, `fecha`, `hora`, `justificado`, `observaciones`, `estado`) VALUES
(3149, 4, 1, 1, 47, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3150, 4, 1, 1, 48, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3151, 4, 1, 1, 49, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3152, 4, 1, 1, 50, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3153, 4, 1, 1, 51, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3154, 4, 1, 1, 52, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3155, 4, 1, 1, 53, 24, '2018-11-18', '13:00:00', '', '', NULL),
(3156, 4, 4, 1, 45, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3157, 4, 2, 1, 46, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3158, 4, 3, 1, 47, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3159, 4, 1, 1, 48, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3160, 4, 2, 1, 49, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3161, 4, 2, 1, 50, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3162, 4, 3, 1, 51, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3163, 4, 1, 1, 52, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3164, 4, 4, 1, 53, 24, '2018-11-19', '13:00:00', '', '', NULL),
(3165, 3, 9, 3, 153, 26, '2018-09-05', '13:00:00', '', '', 1),
(3166, 3, 10, 3, 154, 26, '2018-09-05', '13:00:00', '', '', 1),
(3167, 3, 9, 3, 155, 26, '2018-09-05', '13:00:00', '', '', 1),
(3168, 3, 9, 3, 156, 26, '2018-09-05', '13:00:00', '', '', 1),
(3169, 3, 9, 3, 157, 26, '2018-09-05', '13:00:00', '', '', 1),
(3170, 3, 9, 3, 158, 26, '2018-09-05', '13:00:00', '', '', 1),
(3171, 3, 9, 3, 159, 26, '2018-09-05', '13:00:00', '', '', 1),
(3172, 3, 9, 3, 160, 26, '2018-09-05', '13:00:00', '', '', 1),
(3173, 3, 9, 3, 161, 26, '2018-09-05', '13:00:00', '', '', 1),
(3174, 3, 9, 3, 162, 26, '2018-09-05', '13:00:00', '', '', 1),
(3175, 3, 11, 3, 165, 26, '2018-09-05', '13:00:00', '', '', 1),
(3176, 3, 9, 3, 152, 26, '2018-09-07', '13:00:00', '', '', 1),
(3177, 3, 9, 3, 153, 26, '2018-09-07', '13:00:00', '', '', 1),
(3178, 3, 10, 3, 154, 26, '2018-09-07', '13:00:00', '', '', 1),
(3179, 3, 9, 3, 155, 26, '2018-09-07', '13:00:00', '', '', 1),
(3180, 3, 9, 3, 156, 26, '2018-09-07', '13:00:00', '', '', 1),
(3181, 3, 9, 3, 157, 26, '2018-09-07', '13:00:00', '', '', 1),
(3182, 3, 9, 3, 158, 26, '2018-09-07', '13:00:00', '', '', 1),
(3183, 3, 9, 3, 159, 26, '2018-09-07', '13:00:00', '', '', 1),
(3184, 3, 9, 3, 160, 26, '2018-09-07', '13:00:00', '', '', 1),
(3185, 3, 9, 3, 161, 26, '2018-09-07', '13:00:00', '', '', 1),
(3186, 3, 10, 3, 162, 26, '2018-09-07', '13:00:00', '', '', 1),
(3187, 3, 10, 3, 163, 26, '2018-09-07', '13:00:00', '', '', 1),
(3188, 3, 9, 3, 164, 26, '2018-09-07', '13:00:00', '', '', 1),
(3189, 3, 11, 3, 165, 26, '2018-09-07', '13:00:00', '', '', 1),
(3190, 3, 9, 3, 153, 26, '2018-09-12', '13:00:00', '', '', 1),
(3191, 3, 10, 3, 154, 26, '2018-09-12', '13:00:00', '', '', 1),
(3192, 3, 9, 3, 155, 26, '2018-09-12', '13:00:00', '', '', 1),
(3193, 3, 9, 3, 156, 26, '2018-09-12', '13:00:00', '', '', 1),
(3194, 3, 9, 3, 157, 26, '2018-09-12', '13:00:00', '', '', 1),
(3195, 3, 9, 3, 158, 26, '2018-09-12', '13:00:00', '', '', 1),
(3196, 3, 9, 3, 159, 26, '2018-09-12', '13:00:00', '', '', 1),
(3197, 3, 9, 3, 160, 26, '2018-09-12', '13:00:00', '', '', 1),
(3198, 3, 9, 3, 161, 26, '2018-09-12', '13:00:00', '', '', 1),
(3199, 3, 9, 3, 162, 26, '2018-09-12', '13:00:00', '', '', 1),
(3200, 3, 11, 3, 165, 26, '2018-09-12', '13:00:00', '', '', 1),
(3201, 3, 9, 3, 152, 26, '2018-09-14', '13:00:00', '', '', 1),
(3202, 3, 9, 3, 153, 26, '2018-09-14', '13:00:00', '', '', 1),
(3203, 3, 10, 3, 154, 26, '2018-09-14', '13:00:00', '', '', 1),
(3204, 3, 9, 3, 155, 26, '2018-09-14', '13:00:00', '', '', 1),
(3205, 3, 9, 3, 156, 26, '2018-09-14', '13:00:00', '', '', 1),
(3206, 3, 9, 3, 157, 26, '2018-09-14', '13:00:00', '', '', 1),
(3207, 3, 9, 3, 158, 26, '2018-09-14', '13:00:00', '', '', 1),
(3208, 3, 9, 3, 159, 26, '2018-09-14', '13:00:00', '', '', 1),
(3209, 3, 9, 3, 160, 26, '2018-09-14', '13:00:00', '', '', 1),
(3210, 3, 9, 3, 161, 26, '2018-09-14', '13:00:00', '', '', 1),
(3211, 3, 10, 3, 162, 26, '2018-09-14', '13:00:00', '', '', 1),
(3212, 3, 10, 3, 163, 26, '2018-09-14', '13:00:00', '', '', 1),
(3213, 3, 9, 3, 164, 26, '2018-09-14', '13:00:00', '', '', 1),
(3214, 3, 11, 3, 165, 26, '2018-09-14', '13:00:00', '', '', 1),
(3215, 3, 9, 3, 153, 26, '2018-09-19', '13:00:00', '', '', 1),
(3216, 3, 10, 3, 154, 26, '2018-09-19', '13:00:00', '', '', 1),
(3217, 3, 9, 3, 155, 26, '2018-09-19', '13:00:00', '', '', 1),
(3218, 3, 9, 3, 156, 26, '2018-09-19', '13:00:00', '', '', 1),
(3219, 3, 9, 3, 157, 26, '2018-09-19', '13:00:00', '', '', 1),
(3220, 3, 9, 3, 158, 26, '2018-09-19', '13:00:00', '', '', 1),
(3221, 3, 9, 3, 159, 26, '2018-09-19', '13:00:00', '', '', 1),
(3222, 3, 9, 3, 160, 26, '2018-09-19', '13:00:00', '', '', 1),
(3223, 3, 9, 3, 161, 26, '2018-09-19', '13:00:00', '', '', 1),
(3224, 3, 9, 3, 162, 26, '2018-09-19', '13:00:00', '', '', 1),
(3225, 3, 11, 3, 165, 26, '2018-09-19', '13:00:00', '', '', 1),
(3226, 3, 9, 3, 153, 26, '2018-09-26', '13:00:00', '', '', 1),
(3227, 3, 10, 3, 154, 26, '2018-09-26', '13:00:00', '', '', 1),
(3228, 3, 9, 3, 155, 26, '2018-09-26', '13:00:00', '', '', 1),
(3229, 3, 9, 3, 156, 26, '2018-09-26', '13:00:00', '', '', 1),
(3230, 3, 9, 3, 157, 26, '2018-09-26', '13:00:00', '', '', 1),
(3231, 3, 9, 3, 158, 26, '2018-09-26', '13:00:00', '', '', 1),
(3232, 3, 9, 3, 159, 26, '2018-09-26', '13:00:00', '', '', 1),
(3233, 3, 9, 3, 160, 26, '2018-09-26', '13:00:00', '', '', 1),
(3234, 3, 9, 3, 161, 26, '2018-09-26', '13:00:00', '', '', 1),
(3235, 3, 9, 3, 162, 26, '2018-09-26', '13:00:00', '', '', 1),
(3236, 3, 11, 3, 165, 26, '2018-09-26', '13:00:00', '', '', 1),
(3237, 3, 9, 3, 152, 26, '2018-09-28', '13:00:00', '', '', 1),
(3238, 3, 9, 3, 153, 26, '2018-09-28', '13:00:00', '', '', 1),
(3239, 3, 10, 3, 154, 26, '2018-09-28', '13:00:00', '', '', 1),
(3240, 3, 9, 3, 155, 26, '2018-09-28', '13:00:00', '', '', 1),
(3241, 3, 9, 3, 156, 26, '2018-09-28', '13:00:00', '', '', 1),
(3242, 3, 12, 3, 157, 26, '2018-09-28', '13:00:00', '', '', 1),
(3243, 3, 9, 3, 158, 26, '2018-09-28', '13:00:00', '', '', 1),
(3244, 3, 10, 3, 159, 26, '2018-09-28', '13:00:00', '', '', 1),
(3245, 3, 10, 3, 160, 26, '2018-09-28', '13:00:00', '', '', 1),
(3246, 3, 9, 3, 161, 26, '2018-09-28', '13:00:00', '', '', 1),
(3247, 3, 9, 3, 162, 26, '2018-09-28', '13:00:00', '', '', 1),
(3248, 3, 11, 3, 163, 26, '2018-09-28', '13:00:00', '', '', 1),
(3249, 3, 9, 3, 164, 26, '2018-09-28', '13:00:00', '', '', 1),
(3250, 3, 11, 3, 165, 26, '2018-09-28', '13:00:00', '', '', 1),
(3251, 1, 6, 1, 20, 23, '2018-09-20', '13:09:00', 'puto el que lee', 'xdxdxd', 7),
(3252, 1, 6, 2, 20, 23, '2018-09-20', '13:09:00', 'puto el que lee', 'xdxdxd', 1),
(3253, 1, 6, 2, 20, 23, '2018-09-20', '13:00:00', 'aaa', 'aaa', 1),
(3255, 1, 1, 1, 26, 26, '2018-11-02', '19:20:00', 'ola k ase?', '', 1),
(3256, 8, 2, 1, 20, 23, '2018/09/20', '12:40:00', 'tons k mami?', '', 1),
(3257, 1, 1, 1, 160, 26, '2018-11-05', '17:25:00', '', '', 1),
(3258, 4, 1, 1, 30, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3259, 4, 1, 1, 31, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3260, 4, 1, 1, 32, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3261, 4, 1, 1, 33, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3262, 4, 2, 1, 34, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3263, 4, 1, 1, 35, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3264, 4, 1, 1, 36, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3265, 4, 1, 1, 37, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3266, 4, 3, 1, 38, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3267, 4, 1, 1, 39, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3268, 4, 1, 1, 40, 22, '2018-9-1', '00:00:00', NULL, NULL, NULL),
(3269, 4, 1, 1, 41, 22, '2018-9-1', '00:00:00', NULL, NULL, NULL),
(3270, 4, 1, 1, 42, 22, '2018-9-1', '00:00:00', NULL, NULL, NULL),
(3271, 4, 1, 1, 43, 22, '2018-9-1', '00:00:00', NULL, NULL, NULL),
(3272, 4, 1, 1, 30, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3273, 4, 1, 1, 31, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3274, 4, 1, 1, 32, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3275, 4, 1, 1, 33, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3276, 4, 2, 1, 34, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3277, 4, 1, 1, 35, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3278, 4, 1, 1, 36, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3279, 4, 1, 1, 37, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3280, 4, 3, 1, 38, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3281, 4, 1, 1, 39, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3282, 4, 1, 1, 40, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3283, 4, 1, 1, 41, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3284, 4, 1, 1, 42, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3285, 4, 1, 1, 43, 22, '2018-9-2', '00:00:00', NULL, NULL, NULL),
(3286, 4, 1, 1, 30, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3287, 4, 1, 1, 31, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3288, 4, 1, 1, 32, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3289, 4, 1, 1, 33, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3290, 4, 2, 1, 34, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3291, 4, 1, 1, 35, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3292, 4, 1, 1, 36, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3293, 4, 1, 1, 37, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3294, 4, 3, 1, 38, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3295, 4, 1, 1, 39, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3296, 4, 1, 1, 40, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3297, 4, 1, 1, 41, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3298, 4, 1, 1, 42, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3299, 4, 1, 1, 43, 22, '2018-9-3', '00:00:00', NULL, NULL, NULL),
(3300, 4, 1, 1, 30, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3301, 4, 1, 1, 31, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3302, 4, 1, 1, 32, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3303, 4, 1, 1, 33, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3304, 4, 2, 1, 34, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3305, 4, 1, 1, 35, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3306, 4, 1, 1, 36, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3307, 4, 1, 1, 37, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3308, 4, 3, 1, 38, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3309, 4, 1, 1, 39, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3310, 4, 1, 1, 40, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3311, 4, 1, 1, 41, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3312, 4, 1, 1, 42, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3313, 4, 1, 1, 43, 22, '2018-9-4', '00:00:00', NULL, NULL, NULL),
(3314, 4, 1, 1, 30, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3315, 4, 1, 1, 31, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3316, 4, 1, 1, 32, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3317, 4, 1, 1, 33, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3318, 4, 2, 1, 34, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3319, 4, 1, 1, 35, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3320, 4, 1, 1, 36, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3321, 4, 1, 1, 37, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3322, 4, 3, 1, 38, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3323, 4, 1, 1, 39, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3324, 4, 1, 1, 40, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3325, 4, 1, 1, 41, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3326, 4, 1, 1, 42, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3327, 4, 1, 1, 43, 22, '2018-8-1', '00:00:00', NULL, NULL, NULL),
(3328, 4, 1, 1, 30, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3329, 4, 1, 1, 31, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3330, 4, 1, 1, 32, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3331, 4, 1, 1, 33, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3332, 4, 2, 1, 34, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3333, 4, 1, 1, 35, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3334, 4, 1, 1, 36, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3335, 4, 1, 1, 37, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3336, 4, 3, 1, 38, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3337, 4, 1, 1, 39, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3338, 4, 1, 1, 40, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3339, 4, 1, 1, 41, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3340, 4, 1, 1, 42, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3341, 4, 1, 1, 43, 22, '2018-8-2', '00:00:00', NULL, NULL, NULL),
(3342, 4, 1, 1, 30, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3343, 4, 1, 1, 31, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3344, 4, 1, 1, 32, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3345, 4, 1, 1, 33, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3346, 4, 2, 1, 34, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3347, 4, 1, 1, 35, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3348, 4, 1, 1, 36, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3349, 4, 1, 1, 37, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3350, 4, 3, 1, 38, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3351, 4, 1, 1, 39, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3352, 4, 1, 1, 40, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3353, 4, 1, 1, 41, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3354, 4, 1, 1, 42, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3355, 4, 1, 1, 43, 22, '2018-8-3', '00:00:00', NULL, NULL, NULL),
(3356, 4, 1, 1, 30, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3357, 4, 1, 1, 31, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3358, 4, 1, 1, 32, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3359, 4, 1, 1, 33, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3360, 4, 2, 1, 34, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3361, 4, 1, 1, 35, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3362, 4, 1, 1, 36, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3363, 4, 1, 1, 37, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3364, 4, 3, 1, 38, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3365, 4, 1, 1, 39, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3366, 4, 1, 1, 40, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3367, 4, 1, 1, 41, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3368, 4, 1, 1, 42, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3369, 4, 1, 1, 43, 22, '2018-8-4', '00:00:00', NULL, NULL, NULL),
(3370, 4, 1, 1, 30, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3371, 4, 1, 1, 31, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3372, 4, 1, 1, 32, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3373, 4, 1, 1, 33, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3374, 4, 2, 1, 34, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3375, 4, 1, 1, 35, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3376, 4, 1, 1, 36, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3377, 4, 1, 1, 37, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3378, 4, 3, 1, 38, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3379, 4, 1, 1, 39, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3380, 4, 1, 1, 40, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3381, 4, 1, 1, 41, 22, '2018-7-1', '13:00:00', NULL, NULL, NULL),
(3382, 4, 1, 1, 42, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3383, 4, 1, 1, 43, 22, '2018-9-1', '13:00:00', NULL, NULL, NULL),
(3384, 4, 1, 1, 30, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3385, 4, 1, 1, 31, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3386, 4, 1, 1, 32, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3387, 4, 1, 1, 33, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3388, 4, 2, 1, 34, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3389, 4, 1, 1, 35, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3390, 4, 1, 1, 36, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3391, 4, 1, 1, 37, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3392, 4, 3, 1, 38, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3393, 4, 1, 1, 39, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3394, 4, 1, 1, 40, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3395, 4, 1, 1, 41, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3396, 4, 1, 1, 42, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3397, 4, 1, 1, 43, 22, '2018-9-2', '13:00:00', NULL, NULL, NULL),
(3398, 4, 1, 1, 30, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3399, 4, 1, 1, 31, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3400, 4, 1, 1, 32, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3401, 4, 1, 1, 33, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3402, 4, 2, 1, 34, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3403, 4, 1, 1, 35, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3404, 4, 1, 1, 36, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3405, 4, 1, 1, 37, 22, '2018-7-3', '13:00:00', NULL, NULL, NULL),
(3406, 4, 3, 1, 38, 22, '2018-7-3', '13:00:00', NULL, NULL, NULL),
(3407, 4, 1, 1, 39, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3408, 4, 1, 1, 40, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3409, 4, 1, 1, 41, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3410, 4, 1, 1, 42, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3411, 4, 1, 1, 43, 22, '2018-9-3', '13:00:00', NULL, NULL, NULL),
(3412, 4, 1, 1, 30, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3413, 4, 1, 1, 31, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3414, 4, 1, 1, 32, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3415, 4, 1, 1, 33, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3416, 4, 2, 1, 34, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3417, 4, 1, 1, 35, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3418, 4, 1, 1, 36, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3419, 4, 1, 1, 37, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3420, 4, 3, 1, 38, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3421, 4, 1, 1, 39, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3422, 4, 1, 1, 40, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3423, 4, 1, 1, 41, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3424, 4, 1, 1, 42, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3425, 4, 1, 1, 43, 22, '2018-9-4', '13:00:00', NULL, NULL, NULL),
(3426, 4, 1, 1, 30, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3427, 4, 1, 1, 31, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3428, 4, 1, 1, 32, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3429, 4, 1, 1, 33, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3430, 4, 2, 1, 34, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3431, 4, 1, 1, 35, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3432, 4, 1, 1, 36, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3433, 4, 1, 1, 37, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3434, 4, 3, 1, 38, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3435, 4, 1, 1, 39, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3436, 4, 1, 1, 40, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3437, 4, 1, 1, 41, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3438, 4, 1, 1, 42, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3439, 4, 1, 1, 43, 22, '2018-8-1', '13:00:00', NULL, NULL, NULL),
(3440, 4, 1, 1, 30, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3441, 4, 1, 1, 31, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3442, 4, 1, 1, 32, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3443, 4, 1, 1, 33, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3444, 4, 2, 1, 34, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3445, 4, 1, 1, 35, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3446, 4, 1, 1, 36, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3447, 4, 1, 1, 37, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3448, 4, 3, 1, 38, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3449, 4, 1, 1, 39, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3450, 4, 1, 1, 40, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3451, 4, 1, 1, 41, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3452, 4, 1, 1, 42, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3453, 4, 1, 1, 43, 22, '2018-8-2', '13:00:00', NULL, NULL, NULL),
(3454, 4, 1, 1, 30, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3455, 4, 1, 1, 31, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3456, 4, 1, 1, 32, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3457, 4, 1, 1, 33, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3458, 4, 2, 1, 34, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3459, 4, 1, 1, 35, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3460, 4, 1, 1, 36, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3461, 4, 1, 1, 37, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3462, 4, 3, 1, 38, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3463, 4, 1, 1, 39, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3464, 4, 1, 1, 40, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3465, 4, 1, 1, 41, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3466, 4, 1, 1, 42, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3467, 4, 1, 1, 43, 22, '2018-8-3', '13:00:00', NULL, NULL, NULL),
(3468, 4, 1, 1, 30, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3469, 4, 1, 1, 31, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3470, 4, 1, 1, 32, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3471, 4, 1, 1, 33, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3472, 4, 2, 1, 34, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3473, 4, 1, 1, 35, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3474, 4, 1, 1, 36, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3475, 4, 1, 1, 37, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3476, 4, 3, 1, 38, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3477, 4, 1, 1, 39, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3478, 4, 1, 1, 40, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3479, 4, 1, 1, 41, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3480, 4, 1, 1, 42, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3481, 4, 1, 1, 43, 22, '2018-8-4', '13:00:00', NULL, NULL, NULL),
(3482, 10, 1, 1, 10, 26, '2018-12-3', '12:00:00', 'dsadsad', '', 1),
(3483, 10, 1, 1, 11, 26, '2018-12-3', '12:00:00', '', '', 1),
(3484, 10, 1, 1, 12, 26, '2018-12-3', '12:00:00', '', '', 1),
(3485, 10, 1, 1, 13, 26, '2018-12-3', '12:00:00', '', '', 1),
(3486, 10, 1, 1, 14, 26, '2018-12-3', '12:00:00', '', '', 1),
(3487, 10, 1, 1, 15, 26, '2018-12-3', '12:00:00', '', '', 1),
(3488, 10, 1, 1, 16, 26, '2018-12-3', '12:00:00', '', '', 1),
(3489, 10, 1, 1, 17, 26, '2018-12-3', '12:00:00', '', '', 1),
(3490, 10, 1, 1, 18, 26, '2018-12-3', '12:00:00', '', '', 1),
(3491, 10, 1, 1, 19, 26, '2018-12-3', '12:00:00', '', '', 1),
(3492, 10, 1, 1, 152, 26, '2018-12-3', '12:00:00', '', '', 1),
(3493, 10, 2, 1, 153, 26, '2018-12-3', '12:00:00', '', '', 1),
(3494, 10, 2, 1, 154, 26, '2018-12-3', '12:00:00', '', '', 1),
(3495, 10, 3, 1, 155, 26, '2018-12-3', '12:00:00', '', '', 1),
(3496, 10, 4, 1, 156, 26, '2018-12-3', '12:00:00', '', '', 1),
(3497, 10, 1, 1, 157, 26, '2018-12-3', '12:00:00', '', '', 1),
(3498, 10, 3, 1, 158, 26, '2018-12-3', '12:00:00', '', '', 1),
(3499, 10, 4, 1, 159, 26, '2018-12-3', '12:00:00', '', '', 1),
(3500, 10, 2, 1, 160, 26, '2018-12-3', '12:00:00', '', '', 1),
(3501, 10, 4, 1, 161, 26, '2018-12-3', '12:00:00', '', '', 1),
(3502, 10, 3, 1, 162, 26, '2018-12-3', '12:00:00', '', '', 1),
(3503, 10, 4, 1, 163, 26, '2018-12-3', '12:00:00', '', '', 1),
(3504, 10, 2, 1, 164, 26, '2018-12-3', '12:00:00', '', '', 1),
(3505, 10, 3, 1, 169, 26, '2018-12-3', '12:00:00', '', '', 1),
(3506, 10, 1, 1, 169, 26, '2018-12-3', '12:00:00', '', '', 1),
(3507, 10, 5, 2, 154, 26, '2018-12-3', '12:00:00', '', '', 1),
(3508, 10, 5, 2, 10, 26, '2018-12-3', '12:00:00', '', '', 1),
(3509, 10, 5, 2, 11, 26, '2018-12-3', '12:00:00', '', '', 1),
(3510, 10, 5, 2, 12, 26, '2018-12-3', '12:00:00', '', '', 1),
(3511, 10, 5, 2, 153, 26, '2018-12-3', '12:00:00', '', '', 1),
(3512, 10, 5, 2, 157, 26, '2018-12-3', '12:00:00', '', '', 1),
(3513, 10, 5, 2, 159, 26, '2018-12-3', '12:00:00', '', '', 1),
(3514, 10, 1, 1, 10, 26, '2018-12-4', '12:00:00', '', '', 1),
(3515, 10, 1, 1, 11, 26, '2018-12-4', '12:00:00', '', '', 1),
(3516, 10, 1, 1, 12, 26, '2018-12-4', '12:00:00', '', '', 1),
(3517, 10, 1, 1, 13, 26, '2018-12-4', '12:00:00', '', '', 1),
(3518, 10, 1, 1, 14, 26, '2018-12-4', '12:00:00', '', '', 1),
(3519, 10, 1, 1, 15, 26, '2018-12-4', '12:00:00', '', '', 1),
(3520, 10, 1, 1, 16, 26, '2018-12-4', '12:00:00', '', '', 1),
(3521, 10, 1, 1, 17, 26, '2018-12-4', '12:00:00', '', '', 1),
(3522, 10, 1, 1, 18, 26, '2018-12-4', '12:00:00', '', '', 1),
(3523, 10, 1, 1, 19, 26, '2018-12-4', '12:00:00', '', '', 1),
(3524, 10, 1, 1, 152, 26, '2018-12-4', '12:00:00', '', '', 1),
(3525, 10, 1, 1, 153, 26, '2018-12-4', '12:00:00', '', '', 1),
(3526, 10, 1, 1, 154, 26, '2018-12-4', '12:00:00', '', '', 1),
(3527, 10, 6, 2, 153, 26, '2018-12-4', '13:00:00', 'asdsadas', 'adadsa', 1),
(3528, 10, 5, 2, 17, 26, '2018-12-4', '13:00:00', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submotivos`
--

CREATE TABLE `submotivos` (
  `idSubmotivo` int(11) NOT NULL,
  `tiposubmotivo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `submotivos`
--

INSERT INTO `submotivos` (`idSubmotivo`, `tiposubmotivo`) VALUES
(0, '0'),
(1, 'Teorico'),
(2, 'Taller'),
(3, 'Ed Fisica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp`
--

CREATE TABLE `temp` (
  `fila` int(11) NOT NULL,
  `idAlumnxcurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `idTipodocumento` int(11) NOT NULL,
  `tipodocumento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposdocumentos`
--

INSERT INTO `tiposdocumentos` (`idTipodocumento`, `tipodocumento`) VALUES
(0, '0'),
(1, 'DNI'),
(2, 'DNI Extranjero'),
(3, 'Cedula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trimestres`
--

CREATE TABLE `trimestres` (
  `idtrimestre` int(11) NOT NULL,
  `inicio del 1º trimestre` varchar(10) NOT NULL,
  `final del 1º trimestre` varchar(10) NOT NULL,
  `inicio del 2º trimestre` varchar(10) NOT NULL,
  `final del 2º trimestre` varchar(10) NOT NULL,
  `inicio del 3º trimestre` varchar(10) NOT NULL,
  `final del 3º trimestre` varchar(10) NOT NULL,
  `ciclo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trimestres`
--

INSERT INTO `trimestres` (`idtrimestre`, `inicio del 1º trimestre`, `final del 1º trimestre`, `inicio del 2º trimestre`, `final del 2º trimestre`, `inicio del 3º trimestre`, `final del 3º trimestre`, `ciclo`) VALUES
(1, '2018-03-06', '2018-06-07', '2018-06-08', '2018-08-07', '2018-08-08', '2018-12-07', 2018);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trimestresnota`
--

CREATE TABLE `trimestresnota` (
  `id_trimestrenota` int(11) NOT NULL,
  `Trimestre` varchar(30) DEFAULT NULL,
  `id_estado` int(40) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trimestresnota`
--

INSERT INTO `trimestresnota` (`id_trimestrenota`, `Trimestre`, `id_estado`, `id_usuario`) VALUES
(1, 'Primer Trimestre', 0, 0),
(2, 'Segundo Trimestre', 0, 0),
(3, 'Tercer Trimestre', 0, 0),
(4, 'Diciembre', 0, 0),
(5, 'Febrero', 0, 0);

--
-- Disparadores `trimestresnota`
--
DELIMITER $$
CREATE TRIGGER `Actualiza_TrimestreNota_BU` BEFORE UPDATE ON `trimestresnota` FOR EACH ROW INSERT INTO trimestresnota_actualizadas (Anterior_Trimestre,Anterior_idEstado,Anterior_idUsuario,Nuevo_Trimestre,Nuevo_idEstado,Nuevo_idUsuario, F_Modificacion) VALUES
(OLD.Trimestre, OLD.id_estado, OLD.id_usuario, NEW.Trimestre,NEW.id_estado,NEW.id_usuario, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trimestresnota_actualizadas`
--

CREATE TABLE `trimestresnota_actualizadas` (
  `Anterior_Trimestre` varchar(30) DEFAULT NULL,
  `Anterior_idEstado` int(11) DEFAULT NULL,
  `Anterior_idUsuario` int(11) DEFAULT NULL,
  `Nuevo_Trimestre` varchar(30) DEFAULT NULL,
  `Nuevo_idEstado` int(11) DEFAULT NULL,
  `Nuevo_idUsuario` int(11) DEFAULT NULL,
  `F_Modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `contrasenia` varchar(30) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `apellido`, `contrasenia`, `idCargo`, `estado`) VALUES
(0, '0', '0', '0', 0, 0),
(1, 'nombre', 'macri', 'nombre', 4, 1),
(2, 'iosef', 'stalin', 'proletariado', 2, 1),
(3, 'Benito', 'mus', 'camela', 3, 8),
(4, 'jorge', 'videla', 'falcom', 4, 1),
(5, 'vladimir', 'putin', 'rasputin', 5, 1),
(6, 'Adolf', 'Hitler', 'nain', 1, 1),
(7, 'vladimir', 'lenin', 'Kremlin', 1, 1),
(8, 'admin', 'set tum', 'chinardo', 4, 1),
(9, 'fidel', 'castro', 'cuba', 4, 1),
(10, 'admin', 'administrador', 'admin', 4, 1),
(11, 'nicolas', 'maduro', 'petroleo', 2, 1),
(12, 'sandro', 'armesto', 'burbujas', 4, 1),
(13, 'kim', 'hum um', 'bombita', 3, 1),
(14, 'francisco', 'bergoglio', 'chiquitos', 5, 1),
(15, 'Juan', 'Peron', 'Choripan', 4, 1),
(20, 'admin1', 'admin1', '12345', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`idAlerta`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumno`),
  ADD KEY `fk_Alumnos_Estados1_idx` (`idEstado`),
  ADD KEY `fk_Alumnos_Tiposdocumentos1_idx` (`idTipodocumento`);

--
-- Indices de la tabla `alumnxcurso`
--
ALTER TABLE `alumnxcurso`
  ADD PRIMARY KEY (`idAlumnxcurso`),
  ADD KEY `fk_Alumnxcurso_Cursos1_idx` (`idCurso`),
  ADD KEY `fk_Alumnxcurso_Alumnos1_idx` (`idAlumno`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `FK_idEstaMaterias` (`id_estado`),
  ADD KEY `FK_UsuarioMater` (`id_usuario`);

--
-- Indices de la tabla `materiasxcursos`
--
ALTER TABLE `materiasxcursos`
  ADD PRIMARY KEY (`idMateriaxCurso`),
  ADD KEY `id_Curso` (`id_Curso`),
  ADD KEY `id_Materia` (`id_Materia`),
  ADD KEY `FK_idEstaMateriasxCursos` (`id_estado`),
  ADD KEY `FK_UsuarioMaterxCurso` (`id_usuario`);

--
-- Indices de la tabla `modificaciones`
--
ALTER TABLE `modificaciones`
  ADD PRIMARY KEY (`idModificacion`),
  ADD KEY `fk_Modificaciones_Usuarios1_idx` (`idUsuario`),
  ADD KEY `fk_Modificaciones_Seguimientos1_idx` (`idSeguimiento`),
  ADD KEY `fk_Modificaciones_Motivos1_idx` (`idMotivo`),
  ADD KEY `fk_Modificaciones_Submotivos1_idx` (`idSubmotivo`);

--
-- Indices de la tabla `motivos`
--
ALTER TABLE `motivos`
  ADD PRIMARY KEY (`idMotivo`),
  ADD KEY `fk_Motivos_Submotivos1_idx` (`idSubmotivo`),
  ADD KEY `fk_Motivos_Eventos1_idx` (`idEvento`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_notas`),
  ADD KEY `FK_idcurso` (`id_curso`),
  ADD KEY `FK_idalumnxcurso` (`id_alumnxcurso`),
  ADD KEY `FK_materiaxcurso` (`id_materiaxcurso`),
  ADD KEY `FK_idtrimestrenota` (`id_trimestrenota`),
  ADD KEY `FK_profxmatexcurso` (`id_profxmatexcurso`),
  ADD KEY `FK_idusuario` (`id_usuario`),
  ADD KEY `FK_idEstaNotas` (`id_estado`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`idProfesor`),
  ADD KEY `Fk_Tipodocumento` (`id_tipodocumento`),
  ADD KEY `FK_Estado` (`id_estado`),
  ADD KEY `FK_UsuarioProfesores` (`id_usuario`);

--
-- Indices de la tabla `profesoresxmateriasxcursos`
--
ALTER TABLE `profesoresxmateriasxcursos`
  ADD PRIMARY KEY (`idProfxMateriaxCurso`),
  ADD KEY `idMateriaxCursoFK` (`id_MateriaxCurso`),
  ADD KEY `idProfesorFK` (`id_profesor`),
  ADD KEY `FK_UsuarioProfexMateriaxCurso` (`id_usuario`);

--
-- Indices de la tabla `reincorporaciones`
--
ALTER TABLE `reincorporaciones`
  ADD PRIMARY KEY (`idReincorporacion`),
  ADD KEY `fk_Reincorporaciones_Alumnxcurso1_idx` (`idAlumnxcurso`),
  ADD KEY `fk_Reincorporaciones_Alumnos1_idx` (`idAlumno`);

--
-- Indices de la tabla `retirosantisipados`
--
ALTER TABLE `retirosantisipados`
  ADD PRIMARY KEY (`idRetiroantisipado`),
  ADD KEY `fk_Retirosantisipados_Seguimientos1_idx` (`idSeguimientos`),
  ADD KEY `fk_Retirosantisipados_Alumnos1_idx` (`idAlumno`),
  ADD KEY `fk_Retirosantisipados_Usuarios1_idx` (`idUsuario`),
  ADD KEY `fk_retant_idmotivos` (`idmotivo`);

--
-- Indices de la tabla `seguimientos`
--
ALTER TABLE `seguimientos`
  ADD PRIMARY KEY (`idSeguimiento`),
  ADD KEY `fk_Seguimientos_Cursos1_idx` (`idCurso`),
  ADD KEY `fk_Seguimientos_Alumnxcurso1_idx` (`idAlumnxcurso`),
  ADD KEY `fk_Seguimientos_Usuarios1_idx` (`idUsuario`),
  ADD KEY `fk_Seguimientos_Motivos1_idx` (`idMotivo`),
  ADD KEY `fk_Seguimientos_Submotivos1_idx` (`idSubmotivo`);

--
-- Indices de la tabla `submotivos`
--
ALTER TABLE `submotivos`
  ADD PRIMARY KEY (`idSubmotivo`);

--
-- Indices de la tabla `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`fila`),
  ADD KEY `idAlumnxcurso` (`idAlumnxcurso`);

--
-- Indices de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  ADD PRIMARY KEY (`idTipodocumento`);

--
-- Indices de la tabla `trimestres`
--
ALTER TABLE `trimestres`
  ADD PRIMARY KEY (`idtrimestre`);

--
-- Indices de la tabla `trimestresnota`
--
ALTER TABLE `trimestresnota`
  ADD PRIMARY KEY (`id_trimestrenota`),
  ADD KEY `FK_EstaTriNota` (`id_estado`),
  ADD KEY `FK_UsuarioTrimestreNota` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuarios_Cargos1_idx` (`idCargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas`
--
ALTER TABLE `alertas`
  MODIFY `idAlerta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de la tabla `alumnxcurso`
--
ALTER TABLE `alumnxcurso`
  MODIFY `idAlumnxcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `materiasxcursos`
--
ALTER TABLE `materiasxcursos`
  MODIFY `idMateriaxCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de la tabla `modificaciones`
--
ALTER TABLE `modificaciones`
  MODIFY `idModificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de la tabla `motivos`
--
ALTER TABLE `motivos`
  MODIFY `idMotivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1278;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `idProfesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `profesoresxmateriasxcursos`
--
ALTER TABLE `profesoresxmateriasxcursos`
  MODIFY `idProfxMateriaxCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT de la tabla `reincorporaciones`
--
ALTER TABLE `reincorporaciones`
  MODIFY `idReincorporacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `retirosantisipados`
--
ALTER TABLE `retirosantisipados`
  MODIFY `idRetiroantisipado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `seguimientos`
--
ALTER TABLE `seguimientos`
  MODIFY `idSeguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3529;

--
-- AUTO_INCREMENT de la tabla `submotivos`
--
ALTER TABLE `submotivos`
  MODIFY `idSubmotivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `temp`
--
ALTER TABLE `temp`
  MODIFY `fila` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  MODIFY `idTipodocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `trimestres`
--
ALTER TABLE `trimestres`
  MODIFY `idtrimestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trimestresnota`
--
ALTER TABLE `trimestresnota`
  MODIFY `id_trimestrenota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `fk_Alumnos_Estados1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumnos_Tiposdocumentos1` FOREIGN KEY (`idTipodocumento`) REFERENCES `tiposdocumentos` (`idTipodocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumnxcurso`
--
ALTER TABLE `alumnxcurso`
  ADD CONSTRAINT `fk_Alumnxcurso_Alumnos1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumnxcurso_Cursos1` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `FK_UsuarioMater` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `FK_idEstaMaterias` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`idEspecialidad`);

--
-- Filtros para la tabla `materiasxcursos`
--
ALTER TABLE `materiasxcursos`
  ADD CONSTRAINT `FK_UsuarioMaterxCurso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `FK_idEstaMateriasxCursos` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `materiasxcursos_ibfk_1` FOREIGN KEY (`id_Curso`) REFERENCES `cursos` (`idCurso`),
  ADD CONSTRAINT `materiasxcursos_ibfk_2` FOREIGN KEY (`id_Materia`) REFERENCES `materias` (`idMateria`);

--
-- Filtros para la tabla `modificaciones`
--
ALTER TABLE `modificaciones`
  ADD CONSTRAINT `fk_Modificaciones_Motivos1` FOREIGN KEY (`idMotivo`) REFERENCES `motivos` (`idMotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Modificaciones_Seguimientos1` FOREIGN KEY (`idSeguimiento`) REFERENCES `seguimientos` (`idSeguimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Modificaciones_Submotivos1` FOREIGN KEY (`idSubmotivo`) REFERENCES `submotivos` (`idSubmotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Modificaciones_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `motivos`
--
ALTER TABLE `motivos`
  ADD CONSTRAINT `fk_Motivos_Eventos1` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Motivos_Submotivos1` FOREIGN KEY (`idSubmotivo`) REFERENCES `submotivos` (`idSubmotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `FK_idEstaNotas` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `FK_idalumnxcurso` FOREIGN KEY (`id_alumnxcurso`) REFERENCES `alumnxcurso` (`idAlumnxcurso`),
  ADD CONSTRAINT `FK_idcurso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`idCurso`),
  ADD CONSTRAINT `FK_idtrimestrenota` FOREIGN KEY (`id_trimestrenota`) REFERENCES `trimestresnota` (`id_trimestrenota`),
  ADD CONSTRAINT `FK_idusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `FK_materiaxcurso` FOREIGN KEY (`id_materiaxcurso`) REFERENCES `materiasxcursos` (`idMateriaxCurso`),
  ADD CONSTRAINT `FK_profxmatexcurso` FOREIGN KEY (`id_profxmatexcurso`) REFERENCES `profesoresxmateriasxcursos` (`idProfxMateriaxCurso`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `FK_UsuarioProfesores` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `profesoresxmateriasxcursos`
--
ALTER TABLE `profesoresxmateriasxcursos`
  ADD CONSTRAINT `FK_UsuarioProfexMateriaxCurso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `idMateriaxCursoFK` FOREIGN KEY (`id_MateriaxCurso`) REFERENCES `materiasxcursos` (`idMateriaxCurso`),
  ADD CONSTRAINT `idProfesorFK` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`idProfesor`);

--
-- Filtros para la tabla `reincorporaciones`
--
ALTER TABLE `reincorporaciones`
  ADD CONSTRAINT `fk_Reincorporaciones_Alumnos1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reincorporaciones_Alumnxcurso1` FOREIGN KEY (`idAlumnxcurso`) REFERENCES `alumnxcurso` (`idAlumnxcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `retirosantisipados`
--
ALTER TABLE `retirosantisipados`
  ADD CONSTRAINT `fk_Retirosantisipados_Alumnos1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Retirosantisipados_Seguimientos1` FOREIGN KEY (`idSeguimientos`) REFERENCES `seguimientos` (`idSeguimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Retirosantisipados_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retant_idmotivos` FOREIGN KEY (`idmotivo`) REFERENCES `motivos` (`idMotivo`);

--
-- Filtros para la tabla `seguimientos`
--
ALTER TABLE `seguimientos`
  ADD CONSTRAINT `fk_Seguimientos_Alumnxcurso1` FOREIGN KEY (`idAlumnxcurso`) REFERENCES `alumnxcurso` (`idAlumnxcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Seguimientos_Cursos1` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Seguimientos_Motivos1` FOREIGN KEY (`idMotivo`) REFERENCES `motivos` (`idMotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Seguimientos_Submotivos1` FOREIGN KEY (`idSubmotivo`) REFERENCES `submotivos` (`idSubmotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Seguimientos_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trimestresnota`
--
ALTER TABLE `trimestresnota`
  ADD CONSTRAINT `FK_EstaTriNota` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`idEstado`),
  ADD CONSTRAINT `FK_UsuarioTrimestreNota` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_Usuarios_Cargos1` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
