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


CREATE PROCEDURE HUMAN_R.CreateSalaryEmployees 
AS 
	DECLARE @dateEmployee DATE, @employee INT,@dateYear DATE, @ACUM INT,@ACUMM INT;
	SET NOCOUNT OFF;
	SET @ACUM = 1;
	SET @employee = 1;
	SET @ACUMM = (SELECT COUNT(*) FROM HUMAN_R.CONTRACTS);
	WHILE(@ACUMM>=@employee)
	BEGIN
		SET @dateEmployee = (SELECT dat_hiringDate FROM HUMAN_R.CONTRACTS WHERE int_contract_id_PK=@employee);
		SET @dateYear = DATEADD(DAY,30,@dateEmployee);
		WHILE(@dateYear<='2021-12-31')
		BEGIN
			INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,@dateYear,(SELECT tin_area_id_FK FROM HUMAN_R.EMPLOYEES WHERE int_employee_id_PK=@employee));
			INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) VALUES (1,@ACUM,@employee);
			SET @dateYear = DATEADD(DAY,30,@dateYear);
			SET @ACUM = @ACUM+1;
		END
		print @dateEmployee;
		SET @employee = @employee+1;
	END
GO

CREATE PROCEDURE HUMAN_R.ModifyAddress
AS
	DECLARE @ADDREES BIGINT,@SUBURN INT, @CITIES INT, @DEPARTAMENT INT, @COUNTRY INT,@CONT BIGINT;
	SET @ADDREES =10;
	SET @CONT = (SELECT COUNT(*) FROM HUMAN_R.LIST_ADDRESS);
	WHILE(@ADDREES<=@CONT)
	BEGIN
		SET @SUBURN = (SELECT big_suburn_id_FK FROM HUMAN_R.LIST_ADDRESS WHERE big_address_id_PK=@ADDREES);
		SET @CITIES = (SELECT big_city_id_FK FROM HUMAN_R.SUBURN WHERE big_suburn_id_PK=@SUBURN);
		SET @DEPARTAMENT = (SELECT big_departament_id_FK FROM HUMAN_R.CITIES WHERE big_city_id_PK=@CITIES);
		SET @COUNTRY = (SELECT int_country_id_FK FROM HUMAN_R.DEPARTAMENT WHERE big_departament_id_PK=@DEPARTAMENT);
		UPDATE HUMAN_R.LIST_ADDRESS SET int_country_id_FK=@COUNTRY,big_departament_id_FK=@DEPARTAMENT,big_city_id_FK=@CITIES WHERE big_address_id_PK=@ADDREES;
		SET @ADDREES = @ADDREES + 1;
	END
GO

CREATE PROCEDURE MOVEMENT_PAY
AS
	DECLARE @salary int, @Hours bit, @dateS DATE,@cant int;
	SET @salary = 1;
	SET @cant = (SELECT COUNT(*) FROM SALARY)
	WHILE (@salary<=@cant)
	BEGIN
		SET @dateS = (SELECT dat_date FROM SALARY WHERE int_salary_id_PK=@salary)
		INSERT INTO PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES (1,FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),@salary);
		INSERT INTO PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES (1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-5)+5),@salary);
		INSERT INTO PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES (1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-10)+10),@salary);
		IF (FLOOR(( SELECT rnd FROM vwRandom ) *(10-1)+1)<=5)
		BEGIN
			INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary);
			INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary);
			INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary);
		END
		ELSE IF (FLOOR(( SELECT rnd FROM vwRandom ) *(10-1)+1)<=5)
			INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary);
		SET @salary= @salary + 1;
	END
GO

EXEC HUMAN_R.SalaryCalculate
GO

EXEC HUMAN_R.SalaryCalculateWithMounthYears 1,2021
GO

EXEC HUMAN_R.SalaryCalculateWithOnly 5
GO

EXEC CreateSalaryEmployees
GO

EXEC HUMAN_R.ModifyAddress
GO

EXEC MOVEMENT_PAY
GO

SELECT * FROM HUMAN_R.SALARY