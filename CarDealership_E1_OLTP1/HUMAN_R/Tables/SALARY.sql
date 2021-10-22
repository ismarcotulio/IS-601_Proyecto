CREATE TABLE [HUMAN_R].[SALARY] (
    [int_salary_id_PK]   INT     NOT NULL,
    [mon_netSalary]      MONEY   NOT NULL,
    [mon_hourSalary]     MONEY   NOT NULL,
    [tin_position_id_FK] TINYINT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_salary_id_PK] ASC),
    CHECK ([mon_netSalary]>(0)),
    FOREIGN KEY ([tin_position_id_FK]) REFERENCES [HUMAN_R].[POSITION] ([tin_position_id_PK])
);

