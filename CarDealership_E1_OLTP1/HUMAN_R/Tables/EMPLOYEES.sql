CREATE TABLE [HUMAN_R].[EMPLOYEES] (
    [int_employee_id_PK] INT          IDENTITY (1, 1) NOT NULL,
    [var_code]           VARCHAR (10) NOT NULL,
    [tin_branch_id_FK]   TINYINT      NULL,
    [big_person_id_FK]   BIGINT       NOT NULL,
    [int_contract_id_FK] INT          NOT NULL,
    [int_salary_id_FK]   INT          NOT NULL,
    [tin_area_id_FK]     TINYINT      NOT NULL,
    PRIMARY KEY CLUSTERED ([int_employee_id_PK] ASC),
    FOREIGN KEY ([big_person_id_FK]) REFERENCES [HUMAN_R].[PERSON] ([big_person_id_PK]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([int_contract_id_FK]) REFERENCES [HUMAN_R].[CONTRACTS] ([int_contract_id_PK]),
    FOREIGN KEY ([int_salary_id_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK]),
    FOREIGN KEY ([tin_area_id_FK]) REFERENCES [HUMAN_R].[AREA] ([tin_area_id_PK]),
    FOREIGN KEY ([tin_branch_id_FK]) REFERENCES [HUMAN_R].[BRANCH_OFFICES] ([tin_id_branch_PK])
);





