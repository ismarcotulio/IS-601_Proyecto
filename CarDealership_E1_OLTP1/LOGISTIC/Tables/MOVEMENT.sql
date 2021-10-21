CREATE TABLE [LOGISTIC].[MOVEMENT] (
    [tin_id_PK]            TINYINT  NULL,
    [dat_dueDateTime]      DATETIME NULL,
    [tin_type_movement_FK] TINYINT  NULL,
    [tin_branch_FK]        TINYINT  NULL,
    [big_vehicle_FK]       BIGINT   NULL,
    FOREIGN KEY ([big_vehicle_FK]) REFERENCES [LOGISTIC].[VEHICLE] ([big_id_PK]),
    FOREIGN KEY ([tin_branch_FK]) REFERENCES [HUMAN_R].[BRANCH_OFFICES] ([tin_id_branch_PK]),
    FOREIGN KEY ([tin_type_movement_FK]) REFERENCES [LOGISTIC].[TYPE_MOVEMENT] ([tin_id_PK])
);

