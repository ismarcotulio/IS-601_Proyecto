CREATE TABLE [HUMAN_R].[PAYMENT_MOVEMENT] (
    [bit_motionFactor]      BIT NOT NULL,
    [int_movement_id_PK_FK] INT NOT NULL,
    [int_salary_id_PK_FK]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_movement_id_PK_FK] ASC, [int_salary_id_PK_FK] ASC),
    FOREIGN KEY ([int_movement_id_PK_FK]) REFERENCES [HUMAN_R].[MOVEMENT] ([int_movement_id_PK]),
    FOREIGN KEY ([int_salary_id_PK_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK])
);

