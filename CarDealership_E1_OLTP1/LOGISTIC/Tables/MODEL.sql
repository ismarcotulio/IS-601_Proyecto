CREATE TABLE [LOGISTIC].[MODEL] (
    [int_id_PK]         INT          IDENTITY (1, 100) NOT NULL,
    [var_name]          VARCHAR (50) NULL,
    [tex_description]   TEXT         NULL,
    [big_manufacter_FK] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC),
    FOREIGN KEY ([big_manufacter_FK]) REFERENCES [LOGISTIC].[MANUFACTER] ([big_id_PK])
);

