------------------------------------------------------------------
Select Tipo,COUNT(Numero) as Cantidad_aulas 
FROM Aula GROUP BY Tipo;

------------------------------------------------------------------
SELECT Estatus,COUNT(Empleado_No_empleado) AS Profesores,
COUNT(Cuenta_ID) AS ConCuenta, COUNT(Area_ID) AS Areas
FROM Profesor
GROUP BY Estatus;

SELECT Fecha_ingreso,COUNT(Matricula) AS Estudiantes,
COUNT(Cuenta_ID) AS ConCuenta, COUNT(Estatus) AS Estatus
FROM Estudiante
GROUP BY Fecha_ingreso;

------------------------------------------------------------------
SELECT Curso_Clave,MAX(Calificacion) as MaximaNota,
SUM(Costo) AS Fondo_per_grupo,COUNT(Estudiante_Matricula) AS Estudiantes 
FROM Grupo,Curso
WHERE Grupo.Curso_Clave=Curso.Clave
GROUP BY Curso_Clave
Order By MaximaNota;

SELECT Fecha_nacimiento, COUNT(*) as Nacidos, SUM(Empleado_No_empleado) as Suma,
MAX(Area_ID) AS Ultimo
FROM Empleado AS e,Profesor AS p
WHERE e.No_empleado=p.Empleado_No_empleado AND Cuenta_ID is null
GROUP BY Fecha_nacimiento;

-------------------------------------------------------------------
SELECT Area.Nombre, COUNT(Profesor.Empleado_No_empleado) AS PROFESOR_AREA,
COUNT(Materia.Clave) AS MATERIA_AREA,MAX(Materia.Hora_semanal) AS MAX_HORA_SEMANAL
FROM AREA,Profesor,Materia
WHERE Area.ID = Profesor.Area_ID AND Area.ID = Materia.Area_ID
GROUP BY Area.Nombre
HAVING Area.Nombre LIKE '%a%';

SELECT Aula.Numero,COUNT(Curso.Aula_Numero),SUM(Aula.Capacidad),
Max(Aula.Capacidad) AS Max_Capacidad
FROM Curso,Aula
GROUP BY Aula.Numero
HAVING Aula.Numero > 5;

-------------------------------------------------------------------
SELECT TOP(20) * FROM Horario;

