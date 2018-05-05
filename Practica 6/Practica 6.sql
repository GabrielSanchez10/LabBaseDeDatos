CREATE VIEW Clases_Info AS (
SELECT m.Clave,m.Nombre AS Materia,
Grado,e.Nombre AS Profesor,a.Nombre AS Area 
FROM Materia m
JOIN Area AS a ON a.ID = m.Area_ID
JOIN Clases AS c ON c.Materia_Clave = m.Clave
JOIN Curso AS cu ON cu.Clave = c.Curso_Clave
JOIN Profesor AS p ON p.Empleado_No_empleado = cu.Profesor_Empleado_No_empleado
JOIN Empleado AS e ON e.No_empleado = p.Empleado_No_empleado);

CREATE VIEW Estudiantes_Info AS(
SELECT e.Matricula,e.Nombre,t.Numero,es.Nombre AS Estatus
FROM Estudiante e
JOIN Telefono_estudiante AS t ON t.Estudiante_Matricula = e.Matricula
JOIN Estatus AS es ON es.Nombre = e.Estatus);

CREATE VIEW Estado_Candidato AS(
SELECT e.Nombre,COUNT(*) AS NoCandidatos
FROM Candidato AS c
JOIN Estatus AS e ON c.Estatus = e.Nombre
GROUP BY e.Nombre);

CREATE VIEW Empleados_Sin_Telefono AS(
SELECT e.Nombre,t.Numero
FROM Empleado AS e
JOIN Telefono_empleado AS t ON t.Empleado_No_empleado = e.No_empleado
WHERE t.Numero IS NOT NULL);

CREATE VIEW Estudiantes_Con_Telefono AS(
SELECT e.Matricula,t.Numero
FROM Estudiante AS e
JOIN Telefono_Estudiante AS t ON t.Estudiante_Matricula = e.Matricula
WHERE t.Numero IS NOT NULL);

SELECT * FROM Curso
WHERE Aula_Numero IN (
  SELECT Numero FROM Aula WHERE Capacidad > 10);

WITH Cursos_Baratos AS (  
  SELECT Aula_Numero,Costo,Profesor_Empleado_No_empleado FROM Curso
     WHERE Costo < 5000)
SELECT SUM(Costo) AS Costo_Total_Cursos FROM Cursos_Baratos
  WHERE Aula_Numero > Profesor_Empleado_No_empleado * 5;
  
SELECT * INTO Cientificos
FROM Profesor AS p
JOIN Area AS a ON p.Area_ID = a.ID
WHERE a.Nombre = 'Ciencias Naturales';

UPDATE Cientificos SET Cuenta_ID = 1
WHERE Empleado_No_empleado = 2;