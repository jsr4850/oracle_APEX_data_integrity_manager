
ALTER TABLE "DIMGR"."COLUMNS" ADD
(
   "LAST_UPDATED_BY" Varchar2(50 ),
   "LAST_UPDATED" Date
)
/
COMMENT ON COLUMN "DIMGR"."COLUMNS"."LAST_UPDATED_BY" IS 'The apex user who created or last updated this constraint'
/
COMMENT ON COLUMN "DIMGR"."COLUMNS"."LAST_UPDATED" IS 'the last update date of this constraint. If this is a new constraint then this is the creation date.'
/
ALTER TABLE "DIMGR"."INTER_TABLE_CONSTRAINTS" ADD
(
   "LAST_UPDATED_BY" Varchar2(50 ),
   "LAST_UPDATED" Date
)
/
COMMENT ON COLUMN "DIMGR"."INTER_TABLE_CONSTRAINTS"."LAST_UPDATED_BY" IS 'The apex user who created or last updated this constraint'
/
COMMENT ON COLUMN "DIMGR"."INTER_TABLE_CONSTRAINTS"."LAST_UPDATED" IS 'the last update date of this constraint. If this is a new constraint then this is the creation date.'
/
ALTER TABLE "DIMGR"."TABLES" ADD
(
   "IMPORTED_BY" Varchar2(50 ),
   "IMPORT_DATE" Date
)
/
COMMENT ON COLUMN "DIMGR"."TABLES"."IMPORTED_BY" IS 'The apex user who initiated the import of this table.'
/
COMMENT ON COLUMN "DIMGR"."TABLES"."IMPORT_DATE" IS 'This is the date that the import of the table took place.'
/
ALTER TABLE "DIMGR"."TABLE_CONSTRAINTS" ADD
(
   "LAST_UPDATED_BY" Varchar2(50 ),
   "LAST_UPDATED" Date
)
/
COMMENT ON COLUMN "DIMGR"."TABLE_CONSTRAINTS"."LAST_UPDATED_BY" IS 'The apex user who created or last updated this constraint'
/
COMMENT ON COLUMN "DIMGR"."TABLE_CONSTRAINTS"."LAST_UPDATED" IS 'the last update date of this constraint. If this is a new constraint then this is the creation date.'
/
ALTER TABLE "DIMGR"."TUPLE_CONSTRAINTS" ADD
(
   "LAST_UPDATED_BY" Varchar2(50 ),
   "LAST_UPDATED" Date
)
/
COMMENT ON COLUMN "DIMGR"."TUPLE_CONSTRAINTS"."LAST_UPDATED_BY" IS 'The apex user who created or last updated this constraint'
/
COMMENT ON COLUMN "DIMGR"."TUPLE_CONSTRAINTS"."LAST_UPDATED" IS 'the last update date of this constraint. If this is a new constraint then this is the creation date.'
/
