CREATE TABLE [LOGISTIC].[MOVEMENT] (
    [tin_id_PK]            TINYINT  IDENTITY (1, 1) NOT NULL,
    [dat_dueDateTime]      DATETIME NOT NULL,
    [tin_type_movement_FK] TINYINT  NULL,
    [tin_branch_FK]        TINYINT  NULL,
    [big_vehicle_FK]       BIGINT   NULL,
    PRIMARY KEY CLUSTERED ([tin_id_PK] ASC),
    FOREIGN KEY ([big_vehicle_FK]) REFERENCES [LOGISTIC].[VEHICLE] ([big_id_PK]),
    FOREIGN KEY ([tin_branch_FK]) REFERENCES [HUMAN_R].[BRANCH_OFFICES] ([tin_id_branch_PK]),
    FOREIGN KEY ([tin_type_movement_FK]) REFERENCES [LOGISTIC].[TYPE_MOVEMENT] ([tin_id_PK])
);



