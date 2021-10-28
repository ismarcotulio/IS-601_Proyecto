CREATE TABLE [HUMAN_R].[SALARY_EMP] (
    [bit_pay]            BIT NOT NULL,
    [int_salary_id_FK]   INT NOT NULL,
    [int_employee_id_FK] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_salary_id_FK] ASC, [int_employee_id_FK] ASC),
    FOREIGN KEY ([int_employee_id_FK]) REFERENCES [HUMAN_R].[EMPLOYEES] ([int_employee_id_PK]),
    FOREIGN KEY ([int_salary_id_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK])
);

