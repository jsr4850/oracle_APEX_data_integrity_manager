CREATE OR REPLACE TRIGGER DIMGR.TRG_INCREASE_OUTPUT_LINENO
-- create a trigger to maintain the line numbers in the OUTPUT table
   BEFORE INSERT
   ON dimgr.output
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   l_lineno   NUMBER;
BEGIN
   SELECT SEQ_OUTPUT_LINENO.NEXTVAL INTO l_lineno FROM DUAL;
   :NEW.lineno := l_lineno;
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END;