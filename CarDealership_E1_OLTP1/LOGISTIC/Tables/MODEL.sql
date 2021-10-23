CREATE TABLE [LOGISTIC].[MODEL] (
    [int_id_PK]         INT          IDENTITY (1, 1) NOT NULL,
    [var_name]          VARCHAR (50) NOT NULL,
    [tex_description]   TEXT         DEFAULT ('') NULL,
    [big_manufacter_FK] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC),
    FOREIGN KEY ([big_manufacter_FK]) REFERENCES [LOGISTIC].[MANUFACTER] ([big_id_PK])
);



