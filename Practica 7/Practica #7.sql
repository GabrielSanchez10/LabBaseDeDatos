---Procedures--------------------------------------------------------------
CREATE PROCEDURE Obtener_Por_Area
( @Area varchar(50)) AS 
begin
	SELECT Materia,Profesor,Grado FROM dbo.Clases_Info
	WHERE Area = @Area
end;

CREATE PROCEDURE Contar_Telefonos_Empleado
(@Maestro varchar(50)) AS
BEGIN
	SELECT COUNT(*) FROM Empleados_Sin_Telefono
	WHERE Nombre = @Maestro;
END;

CREATE PROCEDURE LimpiarEstatusCandidato
(@Nombre varchar(50)) AS
BEGIN
	if (SELECT Count(*) FROM Estatus WHERE Descripcion = 'candidato' AND Nombre = @Nombre
	 AND Nombre NOT IN(
			SELECT Nombre FROM Estado_Candidato
		)) > 0
			DELETE FROM Estatus WHERE Nombre = @Nombre;
	else
		PRINT 'No existe ese estatus';	
END;

CREATE PROCEDURE Cambiar_Telefono
(@OldTel char(10), @NewTel char(10),@Matricula int) AS
BEGIN
	if (SELECT COUNT(*) FROM Estudiantes_Con_Telefono WHERE Matricula = @Matricula AND Numero = @OldTel) > 0
			UPDATE Telefono_estudiante SET Numero = @NewTel
			WHERE Estudiante_Matricula = @Matricula AND Numero = @OldTel;
	else
		PRINT 'No existe un estudiante con ese número';
		
END;

CREATE PROCEDURE Seleccionar_Estudiante
(@Matricula int) AS 
BEGIN
	SELECT TOP(1) a.Matricula, a.Numero AS Numero1, b.Numero AS Numero2, a.Estatus
	FROM Estudiantes_Info AS a,Estudiantes_Info AS b
	WHERE a.Matricula = b.Matricula AND a.Matricula = @Matricula;
END;

---Exec--------------------------------------------------------------------
exec Obtener_Por_Area 'Ciencias Naturales';
exec Contar_Telefonos_Empleado 'Carlos Farid';
exec Cambiar_Telefono '8111111111','822222222',1;
exec LimpiarEstatusCandidato 'pagado';
exec Seleccionar_Estudiante 4;

---Funcion----------------------------------------------------------------
CREATE FUNCTION Candidatos_Por_Estatus
	(@EstatusCandidato varchar(50))
	RETURNS TABLE 
		RETURN (
			SELECT * FROM Candidato
			WHERE Estatus = @EstatusCandidato
		)
;

SELECT * FROM Candidatos_Por_Estatus('en_proceso');


