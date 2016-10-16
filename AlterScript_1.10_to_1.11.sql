
ALTER TABLE "DIMGR"."OUTPUT" ADD
(
   "LINENO" Number
)
/
COMMENT ON COLUMN "DIMGR"."OUTPUT"."LINENO" IS 'line number maintained by a trigger BEFORE INSERT, which increases a sequence. It is necessary in order to get the generated script  lines in the order with which they were inserted in the first place.'
/
