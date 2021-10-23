CREATE TABLE [HUMAN_R].[CONTRACTS] (
    [int_contract_id_PK] INT     IDENTITY (1, 1) NOT NULL,
    [dat_hiringDate]     DATE    NOT NULL,
    [bit_active]         BIT     NOT NULL,
    [mon_salary]         MONEY   NOT NULL,
    [tin_position_id_FK] TINYINT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_contract_id_PK] ASC),
    FOREIGN KEY ([tin_position_id_FK]) REFERENCES [HUMAN_R].[POSITION] ([tin_position_id_PK])
);





