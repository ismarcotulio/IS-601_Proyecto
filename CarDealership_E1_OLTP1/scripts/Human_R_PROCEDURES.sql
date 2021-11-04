CREATE PROCEDURE HUMAN_R.SalaryCalculate 
AS  
	DECLARE @Acumuladora MONEY,@salaryE INT
	SET @salaryE = 1
	WHILE @salaryE<=(SELECT COUNT(*) FROM HUMAN_R.SALARY)
	BEGIN
		--SE TRAE EL SALARIO NETO QUE ESTA EN EL CONTRATO DEL EMPLEADO
		SET @Acumuladora = (SELECT mon_salary FROM HUMAN_R.SALARY_EMP SE 
			INNER JOIN HUMAN_R.EMPLOYEES E ON
			E.int_employee_id_PK=SE.int_employee_id_FK
			INNER JOIN HUMAN_R.CONTRACTS C ON
			C.int_contract_id_PK=E.int_contract_id_FK
			WHERE SE.int_salary_id_FK=@salaryE)
		
		--SE ACTUALIZA EL VALOR POR HORA EN UNA CANTIDAD DE HORA LABORAL POR MES DE 160
		UPDATE HUMAN_R.SALARY SET mon_hourSalary = @Acumuladora/160 WHERE SALARY.int_salary_id_PK=@salaryE

		--CALCULA UNA SUMATORIA DE LAS HORAS EXTRAS
		SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(EX.tin_amount*SA.mon_hourSalary*(TY.flo_porcent/100)) 
			FROM HUMAN_R.EXTRA_HOURS EX,HUMAN_R.SALARY SA,HUMAN_R.TYPE_HOURS TY 
			WHERE EX.bit_payFactor=1 AND SA.int_salary_id_PK=@salaryE AND EX.int_salary_id_FK=@salaryE
			AND EX.tin_hourType_id_FK=TY.tin_hourType_id_PK AND EX.int_salary_id_FK=SA.int_salary_id_PK),0)

		--CALCULA UNA SUMATORIA DE MOVIMIENTOS DE PAGO
		SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(MO.int_factor*MO.mon_amount) 
		FROM HUMAN_R.SALARY SA,HUMAN_R.PAYMENT_MOVEMENT PM,HUMAN_R.MOVEMENT MO
		WHERE PM.int_salary_id_PK_FK=SA.int_salary_id_PK AND PM.int_movement_id_PK_FK = MO.int_movement_id_PK
		AND PM.bit_motionFactor=1 AND SA.int_salary_id_PK=@salaryE AND PM.int_salary_id_PK_FK=@salaryE),0)

		--ACTUALIZA EL VALOR DEL SALARIO
		UPDATE HUMAN_R.SALARY SET mon_netSalary = @Acumuladora WHERE SALARY.int_salary_id_PK=@salaryE
		print @Acumuladora
		SET @salaryE = @salaryE + 1--AUMENTA AL SIGUIENTE SALARIO
	END
GO

CREATE PROCEDURE HUMAN_R.SalaryCalculateWithMounthYears @mount int, @year int 
AS  
	DECLARE @Acumuladora MONEY,@salaryE INT
	SET @salaryE = 1
	WHILE @salaryE<=(SELECT COUNT(*) FROM HUMAN_R.SALARY)
	BEGIN
		if (SELECT COUNT(*) FROM HUMAN_R.SALARY SA WHERE MONTH(SA.dat_date) = @mount AND YEAR(SA.dat_date) = @year AND SA.int_salary_id_PK=@salaryE) != 0
			BEGIN
			--SE TRAE EL SALARIO NETO QUE ESTA EN EL CONTRATO DEL EMPLEADO
			SET @Acumuladora = (SELECT mon_salary FROM HUMAN_R.SALARY_EMP SE 
				INNER JOIN HUMAN_R.EMPLOYEES E ON
				E.int_employee_id_PK=SE.int_employee_id_FK
				INNER JOIN HUMAN_R.CONTRACTS C ON
				C.int_contract_id_PK=E.int_contract_id_FK
				WHERE SE.int_salary_id_FK=@salaryE)
		
			--SE ACTUALIZA EL VALOR POR HORA EN UNA CANTIDAD DE HORA LABORAL POR MES DE 160
			UPDATE HUMAN_R.SALARY SET mon_hourSalary = @Acumuladora/160 WHERE SALARY.int_salary_id_PK=@salaryE

			--CALCULA UNA SUMATORIA DE LAS HORAS EXTRAS
			SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(EX.tin_amount*SA.mon_hourSalary*(TY.flo_porcent/100)) 
				FROM HUMAN_R.EXTRA_HOURS EX,HUMAN_R.SALARY SA,HUMAN_R.TYPE_HOURS TY 
				WHERE EX.bit_payFactor=1 AND SA.int_salary_id_PK=@salaryE AND EX.int_salary_id_FK=@salaryE
				AND EX.tin_hourType_id_FK=TY.tin_hourType_id_PK AND EX.int_salary_id_FK=SA.int_salary_id_PK),0)

			--CALCULA UNA SUMATORIA DE MOVIMIENTOS DE PAGO
			SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(MO.int_factor*MO.mon_amount) 
			FROM HUMAN_R.SALARY SA,HUMAN_R.PAYMENT_MOVEMENT PM,HUMAN_R.MOVEMENT MO
			WHERE PM.int_salary_id_PK_FK=SA.int_salary_id_PK AND PM.int_movement_id_PK_FK = MO.int_movement_id_PK
			AND PM.bit_motionFactor=1 AND SA.int_salary_id_PK=@salaryE AND PM.int_salary_id_PK_FK=@salaryE),0)

			--ACTUALIZA EL VALOR DEL SALARIO
			UPDATE HUMAN_R.SALARY SET mon_netSalary = @Acumuladora WHERE SALARY.int_salary_id_PK=@salaryE
			print @Acumuladora
			SET @salaryE = @salaryE + 1--AUMENTA AL SIGUIENTE SALARIO
			END
		ELSE
			print 'no es un salario que entre en la fecha'
	END
GO

CREATE PROCEDURE HUMAN_R.SalaryCalculateWithOnly @salaryE int 
AS  
	DECLARE @Acumuladora MONEY
	
	--SE TRAE EL SALARIO NETO QUE ESTA EN EL CONTRATO DEL EMPLEADO
	SET @Acumuladora = (SELECT mon_salary FROM HUMAN_R.SALARY_EMP SE 
		INNER JOIN HUMAN_R.EMPLOYEES E ON
		E.int_employee_id_PK=SE.int_employee_id_FK
		INNER JOIN HUMAN_R.CONTRACTS C ON
		C.int_contract_id_PK=E.int_contract_id_FK
		WHERE SE.int_salary_id_FK=@salaryE)
		
	--SE ACTUALIZA EL VALOR POR HORA EN UNA CANTIDAD DE HORA LABORAL POR MES DE 160
	UPDATE HUMAN_R.SALARY SET mon_hourSalary = @Acumuladora/160 WHERE SALARY.int_salary_id_PK=@salaryE

	--CALCULA UNA SUMATORIA DE LAS HORAS EXTRAS
	SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(EX.tin_amount*SA.mon_hourSalary*(TY.flo_porcent/100)) 
		FROM HUMAN_R.EXTRA_HOURS EX,HUMAN_R.SALARY SA,HUMAN_R.TYPE_HOURS TY 
		WHERE EX.bit_payFactor=1 AND SA.int_salary_id_PK=@salaryE AND EX.int_salary_id_FK=@salaryE
		AND EX.tin_hourType_id_FK=TY.tin_hourType_id_PK AND EX.int_salary_id_FK=SA.int_salary_id_PK),0)

	--CALCULA UNA SUMATORIA DE MOVIMIENTOS DE PAGO
	SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(MO.int_factor*MO.mon_amount) 
	FROM HUMAN_R.SALARY SA,HUMAN_R.PAYMENT_MOVEMENT PM,HUMAN_R.MOVEMENT MO
	WHERE PM.int_salary_id_PK_FK=SA.int_salary_id_PK AND PM.int_movement_id_PK_FK = MO.int_movement_id_PK
	AND PM.bit_motionFactor=1 AND SA.int_salary_id_PK=@salaryE AND PM.int_salary_id_PK_FK=@salaryE),0)

	--ACTUALIZA EL VALOR DEL SALARIO
	UPDATE HUMAN_R.SALARY SET mon_netSalary = @Acumuladora WHERE SALARY.int_salary_id_PK=@salaryE
	print @Acumuladora
	SET @salaryE = @salaryE + 1--AUMENTA AL SIGUIENTE SALARIO
	
GO

EXEC HUMAN_R.SalaryCalculate
GO

EXEC HUMAN_R.SalaryCalculateWithMounthYears 1,2021
GO

EXEC HUMAN_R.SalaryCalculateWithOnly 5
GO

SELECT * FROM HUMAN_R.SALARY