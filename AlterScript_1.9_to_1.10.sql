
ALTER TABLE "DIMGR"."DIRESULTS" ADD
(
   "ERROR_CODE" Number,
   "ERROR_MSG" Varchar2(512 )
)
/
COMMENT ON COLUMN "DIMGR"."DIRESULTS"."ERROR_CODE" IS 'Oracle Error Code, in case of an exception'
/
COMMENT ON COLUMN "DIMGR"."DIRESULTS"."ERROR_MSG" IS 'Oracle Error Message, in case of an exception'
/


CREATE TABLE "DIMGR"."SCHEMA_CONSTRAINTS"(
  "SCHEMA" Varchar2(30 ) CONSTRAINT "SCHEMA_NOTNULL" NOT NULL,
  "CONSTRAINT_NAME" Varchar2(50 ) CONSTRAINT "CONNAME_NOT_NULL" NOT NULL,
  "CONSTRAINT_DESC" Varchar2(500 ),
  "CONSTRAINT_VALIDATION_QRY" Clob,
  "LAST_UPDATED" Date,
  "LAST_UPDATED_BY" Varchar2(50 )
)
/

CREATE UNIQUE INDEX "DIMGR"."SCHEMA_CONS_PK" ON "DIMGR"."SCHEMA_CONSTRAINTS" ("SCHEMA","CONSTRAINT_NAME")
/

ALTER TABLE "DIMGR"."SCHEMA_CONSTRAINTS" ADD CONSTRAINT "SCHEMA_CONS_PK" PRIMARY KEY ("SCHEMA","CONSTRAINT_NAME")
/

COMMENT ON TABLE "DIMGR"."SCHEMA_CONSTRAINTS" IS 'A schema constraint is a condition that must apply to all tables or to a subset of tables of a spedific schema. Examples are "all SK columns of the tables of the schema PRESENT_PERIF must have a foreign key", or "all fact tables of the schema PRESENT_PERIF must be range partitioned". This table  was initially created in order to store physical design tests.'
/

COMMENT ON COLUMN "DIMGR"."SCHEMA_CONSTRAINTS"."SCHEMA" IS 'This is the schema name (taken from the OWNER column in the DB catalog)'
/

COMMENT ON COLUMN "DIMGR"."SCHEMA_CONSTRAINTS"."LAST_UPDATED" IS 'the last update date of this constraint. If this is a new constraint then this is the creation date.'
/

COMMENT ON COLUMN "DIMGR"."SCHEMA_CONSTRAINTS"."LAST_UPDATED_BY" IS 'The apex user who created or last updated this constraint'
/
