CREATE TABLE [HUMAN_R].[EXTRA_HOURS] (
    [big_extra_id_PK]    BIGINT  IDENTITY (1, 1) NOT NULL,
    [dat_date]           DATE    NOT NULL,
    [tin_amount]         TINYINT NOT NULL,
    [bit_payFactor]      BIT     NOT NULL,
    [tin_hourType_id_FK] TINYINT NOT NULL,
    [int_salary_id_FK]   INT     NOT NULL,
    PRIMARY KEY CLUSTERED ([big_extra_id_PK] ASC),
    CHECK ([tin_amount]>(0)),
    FOREIGN KEY ([int_salary_id_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK]),
    FOREIGN KEY ([tin_hourType_id_FK]) REFERENCES [HUMAN_R].[TYPE_HOURS] ([tin_hourType_id_PK]) ON DELETE CASCADE ON UPDATE CASCADE
);





