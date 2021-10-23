CREATE TABLE [HUMAN_R].[SALARY] (
    [int_salary_id_PK] INT     IDENTITY (1, 1) NOT NULL,
    [mon_netSalary]    MONEY   NOT NULL,
    [mon_hourSalary]   MONEY   NOT NULL,
    [dat_date]         DATE    NOT NULL,
    [bit_pay]          BIT     NOT NULL,
    [tin_area_id_FK]   TINYINT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_salary_id_PK] ASC),
    CHECK ([mon_netSalary]>(0)),
    FOREIGN KEY ([tin_area_id_FK]) REFERENCES [HUMAN_R].[AREA] ([tin_area_id_PK])
);





