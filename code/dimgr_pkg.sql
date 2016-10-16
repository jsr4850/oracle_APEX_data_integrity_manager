CREATE OR REPLACE PACKAGE BODY DIMGR.DIMGR_PKG
AS
   PROCEDURE import_table_from_db (tblowner    IN VARCHAR2,
                                   name        IN VARCHAR2,
                                   overwrite   IN VARCHAR2)
   IS
   BEGIN
      -- 1. merge into tables
      MERGE INTO DIMGR.TABLES trg
           USING (SELECT t.owner,
                         t.table_name,
                         s.comments,
                         V ('APP_USER') appuser,
                         SYSDATE imp_date
                    FROM    all_tables t
                         LEFT OUTER JOIN
                            all_tab_comments s
                         ON (t.owner = s.owner
                             AND t.table_name = s.table_name)
                   WHERE t.OWNER = tblowner AND t.TABLE_NAME = name) src
              ON (trg.owner = src.owner AND trg.table_name = src.table_name)
      WHEN MATCHED
      THEN
         UPDATE -- overwrite table comments, only if it is checked on the corresponding checkbox
         SET
            trg.table_comment =
               CASE
                  WHEN INSTR (overwrite, '0') > 0 THEN src.comments
                  ELSE trg.table_comment
               END,
            TRG.IMPORTED_BY = src.appuser,
            TRG.IMPORT_DATE = src.imp_date
      WHEN NOT MATCHED
      THEN
         INSERT     (trg.OWNER,
                     trg.TABLE_NAME,
                     trg.TABLE_COMMENT,
                     TRG.IMPORTED_BY,
                     TRG.IMPORT_DATE)
             VALUES (SRC.owner,
                     src.table_name,
                     src.comments,
                     src.appuser,
                     src.imp_date);

      -- 2. merge into columns

      -- first save locally check constraints (this is done in order to be able to convert
      -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
      -- are not allowed in wHERE clauses) - since we want to filter out not null check constraints

      /*execute immediate 'create table dimgr.srch_cond(
                                  owner varchar2(30)
                                  , table_name varchar2(30)
                                  , column_name varchar2(30)
                                  , search_condition clob)';*/

      EXECUTE IMMEDIATE 'truncate table dimgr.srch_cond';

      EXECUTE IMMEDIATE--dbms_output.put_line(
                       'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
        select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
        from all_constraints a, all_cons_columns b
        where  
            a.OWNER = b.OWNER and a.table_name = b.table_name and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
            and a.OWNER = '''
                       || tblowner
                       || ''''
                       || ' and CONSTRAINT_TYPE = ''C''';

      --);
      --COMMIT;

      -- note: since COLUMNS is at a column level in the using query we need to aggregate data to the column-level
      -- from the individual constraint level which is the level stored in Oracle catalog.
      MERGE INTO DIMGR.COLUMNS trg
           USING (  SELECT t.owner,
                           t.table_name,
                           t.COLUMN_NAME,
                           t.COLUMN_ID,
                           t.DATA_TYPE,
                           t.DATA_LENGTH,
                           t.DATA_PRECISION,
                           t.DATA_SCALE,
                           t.NULLABLE,
                           s.comments,
                           REPLACE (wmsys.wm_concat (c.search_condition),
                                    ',',
                                    ' AND ')
                              AS search_condition -- string aggregation via undocumented  wm_concat, see: http://www.oracle-base.com/articles/misc/StringAggregationTechniques.php
                                                 ,
                           REPLACE (wmsys.wm_concat (c.constraint_name),
                                    ',',
                                    '_')
                              AS constraint_name,
                           V ('APP_USER') appuser,
                           SYSDATE imp_date
                      FROM all_tab_columns t
                           JOIN all_col_comments s
                              ON (    t.owner = s.owner
                                  AND t.table_name = s.table_name
                                  AND t.column_name = s.column_name)
                           LEFT OUTER JOIN (SELECT *
                                              FROM dimgr.srch_cond
                                             WHERE search_condition NOT LIKE
                                                      '%IS NOT NULL%') c -- filter out not null constraints
                              ON (    c.owner = t.owner
                                  AND c.TABLE_NAME = t.table_name
                                  AND c.column_name = t.column_name)
                     WHERE t.OWNER = tblowner AND t.TABLE_NAME = name
                  GROUP BY t.owner,
                           t.table_name,
                           t.COLUMN_NAME,
                           t.COLUMN_ID,
                           t.DATA_TYPE,
                           t.DATA_LENGTH,
                           t.DATA_PRECISION,
                           t.DATA_SCALE,
                           t.NULLABLE,
                           s.comments,
                           V ('APP_USER'),
                           SYSDATE/*
                                      select t.owner, t.table_name, t.COLUMN_NAME, t.COLUMN_ID, t.DATA_TYPE, t.DATA_LENGTH, t.DATA_PRECISION, t.DATA_SCALE, t.NULLABLE, s.comments, c.search_condition, c.constraint_name
                                      from all_tab_columns t
                                              join all_col_comments s on(t.owner = s.owner and t.table_name = s.table_name and t.column_name = s.column_name)
                                                  left outer join (select * from dimgr.srch_cond where search_condition not like '%IS NOT NULL%') c -- filter out not null constraints
                                                      on( c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name)
                                                  --join all_cons_columns c on (c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name)
                                                  --    join all_constraints d on (d.OWNER = c.OWNER and d.CONSTRAINT_NAME = c.CONSTRAINT_NAME)
                                                  --,(select * from dimgr.srch_cond where search_condition not like '%IS NOT NULL%') c
                                      where   t.OWNER = tblowner and t.TABLE_NAME = name
                                      --and c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name
                                  */
                 ) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.column_name = src.column_name)
      WHEN MATCHED
      THEN
         UPDATE SET
            COLUMN_ID = src.COLUMN_ID,
            DATA_TYPE = src.DATA_TYPE,
            DATA_LENGTH = src.DATA_LENGTH,
            DATA_PRECISION = src.DATA_PRECISION,
            DATA_SCALE = src.DATA_SCALE,
            --COLUMN_DESC                = src.COLUMN_DESC,
            COLUMN_COMMENT =
               CASE
                  WHEN INSTR (overwrite, '1') > 0 THEN src.comments
                  ELSE trg.COLUMN_COMMENT
               END,
            NULLABLE = src.NULLABLE,
            --CONSTRAINT_DESC            = src.CONSTRAINT_DESC,
            CONSTRAINT_CHECK_CONDITION =
               CASE
                  WHEN INSTR (overwrite, '2') > 0
                  THEN
                     TO_CLOB (src.search_condition)
                  ELSE
                     TO_CLOB (trg.CONSTRAINT_CHECK_CONDITION)
               END,
            --case when instr(overwrite, '2') > 0 then src.search_condition ELSE trg.CONSTRAINT_CHECK_CONDITION END,
            --CONSTRAINT_VALIDATION_QRY  = src.CONSTRAINT_VALIDATION_QRY,
            CONSTRAINT_NAME = src.CONSTRAINT_NAME,
            LAST_UPDATED_BY = src.appuser,
            LAST_UPDATED = src.imp_date
      WHEN NOT MATCHED
      THEN
         INSERT     (OWNER,
                     TABLE_NAME,
                     COLUMN_ID,
                     COLUMN_NAME,
                     DATA_TYPE,
                     DATA_LENGTH,
                     DATA_PRECISION,
                     DATA_SCALE,
                     COLUMN_COMMENT,
                     NULLABLE,
                     CONSTRAINT_CHECK_CONDITION,
                     CONSTRAINT_NAME,
                     LAST_UPDATED_BY,
                     LAST_UPDATED)
             VALUES (src.owner,
                     src.table_name,
                     src.COLUMN_ID,
                     src.COLUMN_NAME,
                     src.DATA_TYPE,
                     src.DATA_LENGTH,
                     src.DATA_PRECISION,
                     src.DATA_SCALE,
                     src.comments,
                     src.NULLABLE,
                     src.search_condition,
                     src.constraint_name,
                     src.appuser,
                     src.imp_date);

      /*-- clean out table
      execute immediate 'drop table dimgr.srch_cond purge';*/

      -- 3. merge into tuples
      MERGE INTO DIMGR.TUPLES trg
           USING (SELECT t.owner, t.table_name
                    FROM all_tables t
                   WHERE t.OWNER = tblowner AND t.TABLE_NAME = name) src
              ON (trg.owner = src.owner AND trg.table_name = src.table_name)
      WHEN NOT MATCHED
      THEN
         INSERT     (OWNER, TABLE_NAME)
             VALUES (src.owner, src.table_name);

      -- merge into tuple_constraints
      MERGE INTO dimgr.tuple_constraints trg
           USING (-- I use the row_number in order to get only the first row for each constraint, in the case that
                  -- the same constraint appears multiple times for each column participating in the constraint.
                  -- Note that a group by is not possible in this case, because search_condition is a clob and you cannot
                  -- group by on a clob field.
                  SELECT owner,
                         table_name,
                         constraint_name,
                         search_condition,
                         V ('APP_USER') appuser,
                         SYSDATE imp_date
                    FROM (SELECT owner,
                                 table_name,
                                 constraint_name,
                                 search_condition,
                                 ROW_NUMBER ()
                                 OVER (PARTITION BY constraint_name
                                       ORDER BY column_name)
                                    r
                            FROM dimgr.srch_cond
                           WHERE search_condition NOT LIKE '%IS NOT NULL%'
                                 AND table_name = name)
                   WHERE r = 1) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.constraint_name = src.constraint_name)
      WHEN MATCHED
      THEN
         UPDATE SET
            CONSTRAINT_CHECK_CONDITION = src.search_condition,
            TRG.LAST_UPDATED_BY = src.appuser,
            TRG.LAST_UPDATED = src.imp_date
      WHEN NOT MATCHED
      THEN
         INSERT     (OWNER,
                     TABLE_NAME,
                     CONSTRAINT_NAME,
                     CONSTRAINT_DESC,
                     CONSTRAINT_CHECK_CONDITION,
                     CONSTRAINT_VALIDATION_QRY,
                     TRG.LAST_UPDATED_BY,
                     TRG.LAST_UPDATED)
             VALUES (src.owner,
                     src.table_name,
                     src.constraint_name,
                     NULL,
                     src.search_condition,
                     NULL,
                     src.appuser,
                     src.imp_date);

      -- merge into tuple_constraints_ref_columns
      MERGE INTO dimgr.tuple_constraints_ref_columns trg
           USING (SELECT owner,
                         table_name,
                         constraint_name,
                         column_name,
                         search_condition
                    FROM dimgr.srch_cond
                   WHERE search_condition NOT LIKE '%IS NOT NULL%'
                         AND table_name = name) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.constraint_name = src.constraint_name
                  AND trg.column_name = src.column_name)
      WHEN NOT MATCHED
      THEN
         INSERT     (OWNER,
                     TABLE_NAME,
                     CONSTRAINT_NAME,
                     COLUMN_NAME)
             VALUES (src.owner,
                     src.table_name,
                     src.constraint_name,
                     src.column_name);

      -- merge into table_constraints
      MERGE INTO DIMGR.TABLE_CONSTRAINTS trg
           USING (SELECT owner,
                         table_name,
                         constraint_name,
                         constraint_type AS TYPE,
                         V ('APP_USER') appuser,
                         SYSDATE imp_date
                    FROM all_constraints a
                   WHERE     a.OWNER = tblowner
                         AND table_name = name
                         AND CONSTRAINT_TYPE IN ('P', 'U')) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.constraint_name = src.constraint_name)
      WHEN MATCHED
      THEN
         UPDATE SET
            TRG.TYPE = src.TYPE,
            TRG.LAST_UPDATED_BY = src.appuser,
            TRG.LAST_UPDATED = src.imp_date
      WHEN NOT MATCHED
      THEN
         INSERT     (trg.OWNER,
                     trg.TABLE_NAME,
                     trg.CONSTRAINT_NAME,
                     trg.TYPE,
                     TRG.LAST_UPDATED_BY,
                     TRG.LAST_UPDATED)
             VALUES (src.owner,
                     src.table_name,
                     src.constraint_name,
                     src.TYPE,
                     src.appuser,
                     src.imp_date);

      -- merge into table_constraints_ref_column
      MERGE INTO DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS trg
           USING (SELECT a.owner,
                         a.table_name,
                         a.constraint_name,
                         a.constraint_type,
                         B.COLUMN_NAME,
                         position
                    FROM all_constraints a, all_cons_columns b
                   WHERE     a.OWNER = b.OWNER
                         AND a.table_name = b.table_name
                         AND a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
                         AND a.OWNER = tblowner
                         AND a.table_name = name
                         AND a.CONSTRAINT_TYPE IN ('P', 'U')) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.constraint_name = src.constraint_name
                  AND trg.column_name = src.column_name)
      WHEN MATCHED
      THEN
         UPDATE SET trg.position = src.position
      WHEN NOT MATCHED
      THEN
         INSERT     (trg.OWNER,
                     trg.TABLE_NAME,
                     trg.CONSTRAINT_NAME,
                     trg.COLUMN_NAME,
                     trg.position)
             VALUES (src.OWNER,
                     src.TABLE_NAME,
                     src.CONSTRAINT_NAME,
                     src.COLUMN_NAME,
                     src.position);

      --update PK UK validation queries for the current table
      update_PKUK_valq_TabCons (tblowner, name);

      -- merge into inter_table_constraints
      MERGE INTO dimgr.inter_table_constraints trg
           USING (SELECT a.owner,
                         a.table_name,
                         a.constraint_name,
                         A.CONSTRAINT_TYPE AS TYPE,
                         a.R_OWNER AS refowner,
                         (SELECT table_name
                            FROM all_constraints b
                           WHERE b.constraint_name = a.r_constraint_name
                                 AND b.owner = a.r_owner)
                            AS reftable,
                         a.R_CONSTRAINT_NAME AS refconname,
                         V ('APP_USER') appuser,
                         SYSDATE imp_date
                    FROM all_constraints a
                   WHERE     a.OWNER = tblowner
                         AND a.table_name = name
                         AND a.constraint_type IN ('R')) src
              ON (    TRG.OWNER = src.owner
                  AND TRG.TABLE_NAME = src.table_name
                  AND TRG.CONSTRAINT_NAME = src.constraint_name)
      WHEN MATCHED
      THEN
         UPDATE SET TRG.TYPE = src.TYPE,
                    TRG.REF_PKOWNER = src.refowner,
                    TRG.REF_PKTABLE_NAME = src.reftable,
                    TRG.REF_PKCONSTRAINT_NAME = src.refconname,
                    TRG.LAST_UPDATED_BY = src.appuser,
                    TRG.LAST_UPDATED = src.imp_date
      WHEN NOT MATCHED
      THEN
         INSERT     (trg.OWNER,
                     trg.TABLE_NAME,
                     trg.CONSTRAINT_NAME,
                     TRG.TYPE,
                     TRG.REF_PKOWNER,
                     TRG.REF_PKTABLE_NAME,
                     TRG.REF_PKCONSTRAINT_NAME,
                     TRG.LAST_UPDATED_BY,
                     TRG.LAST_UPDATED)
             VALUES (src.owner,
                     src.table_name,
                     src.constraint_name,
                     src.TYPE,
                     src.refowner,
                     src.reftable,
                     src.refconname,
                     src.appuser,
                     src.imp_date);

      -- merge into itable_constraints_ref_columns
      MERGE INTO dimgr.itable_constraints_ref_columns trg
           USING (SELECT a.owner,
                         a.table_name,
                         a.constraint_name,
                         B.COLUMN_NAME,
                         position
                    FROM all_constraints a, all_cons_columns b
                   WHERE     a.OWNER = b.OWNER
                         AND a.table_name = b.table_name
                         AND a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
                         AND a.OWNER = tblowner
                         AND a.table_name = name
                         AND a.CONSTRAINT_TYPE IN ('R')) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.constraint_name = src.constraint_name
                  AND trg.column_name = src.column_name)
      WHEN MATCHED
      THEN
         UPDATE SET trg.position = src.position
      WHEN NOT MATCHED
      THEN
         INSERT     (OWNER,
                     TABLE_NAME,
                     CONSTRAINT_NAME,
                     COLUMN_NAME,
                     trg.position)
             VALUES (src.owner,
                     src.table_name,
                     src.constraint_name,
                     src.column_name,
                     src.position);

      -- merge into inter_table_cons_ref_tables
      MERGE INTO dimgr.inter_table_cons_ref_tables trg
           USING (SELECT a.owner,
                         a.table_name,
                         a.constraint_name,
                         A.CONSTRAINT_TYPE AS TYPE,
                         a.R_OWNER AS refowner,
                         (SELECT table_name
                            FROM all_constraints b
                           WHERE b.constraint_name = a.r_constraint_name
                                 AND b.owner = a.r_owner)
                            AS reftable
                    --, a.R_CONSTRAINT_NAME  as refconname
                    FROM all_constraints a
                   WHERE     a.OWNER = tblowner
                         AND a.table_name = name
                         AND a.constraint_type IN ('R')) src
              ON (    trg.owner = src.owner
                  AND trg.table_name = src.table_name
                  AND trg.constraint_name = src.constraint_name
                  AND TRG.REF_OWNER = src.refowner
                  AND TRG.REF_TABLE_NAME = src.reftable)
      WHEN NOT MATCHED
      THEN
         INSERT     (trg.OWNER,
                     trg.TABLE_NAME,
                     trg.CONSTRAINT_NAME,
                     TRG.REF_OWNER,
                     TRG.REF_TABLE_NAME)
             VALUES (src.OWNER,
                     src.TABLE_NAME,
                     src.CONSTRAINT_NAME,
                     src.refowner,
                     src.reftable);

      --update FK validation queries for the current table
      update_FK_valq_ITabCons (tblowner, name);

      COMMIT;
   END import_table_from_db;

   PROCEDURE purge_table_from_repository (tblowner   IN VARCHAR2,
                                          name       IN VARCHAR2)
   IS
   BEGIN
      DELETE FROM DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.COLUMNS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.TUPLE_CONSTRAINTS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.TUPLES
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.TABLE_CONSTRAINTS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.INTER_TABLE_CONS_REF_TABLES
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.INTER_TABLE_CONSTRAINTS
            WHERE owner = tblowner AND table_name = name;

      DELETE FROM DIMGR.TABLES
            WHERE owner = tblowner AND table_name = name;

      COMMIT;
   END purge_table_from_repository;

   PROCEDURE update_tab_columns (OWNER                         VARCHAR2,
                                 TABLE_NAME                    VARCHAR2,
                                 COLUMN_NAME                   VARCHAR2,
                                 COLUMN_ID                     NUMBER,
                                 DATA_TYPE                     VARCHAR2,
                                 DATA_LENGTH                   NUMBER,
                                 DATA_PRECISION                NUMBER,
                                 DATA_SCALE                    NUMBER,
                                 COLUMN_DESC                   VARCHAR2,
                                 COLUMN_COMMENT                VARCHAR2,
                                 NULLABLE                      VARCHAR2,
                                 CONSTRAINT_DESC               VARCHAR2,
                                 CONSTRAINT_CHECK_CONDITION    CLOB,
                                 CONSTRAINT_VALIDATION_QRY     CLOB,
                                 CONSTRAINT_NAME               VARCHAR2)
   IS
   BEGIN
      UPDATE dimgr.columns t
         SET                         --COLUMN_ID                  = COLUMN_ID,
                                     --DATA_TYPE                  = DATA_TYPE,
                                   --DATA_LENGTH                = DATA_LENGTH,
                                --DATA_PRECISION             = DATA_PRECISION,
                                    --DATA_SCALE                 = DATA_SCALE,
             t.COLUMN_DESC = COLUMN_DESC,
             t.COLUMN_COMMENT = COLUMN_COMMENT,
             t.NULLABLE = UPPER (SUBSTR (TRIM (NULLABLE), 1, 1)),
             t.CONSTRAINT_DESC = CONSTRAINT_DESC,
             t.CONSTRAINT_CHECK_CONDITION = CONSTRAINT_CHECK_CONDITION,
             t.CONSTRAINT_VALIDATION_QRY = CONSTRAINT_VALIDATION_QRY,
             t.CONSTRAINT_NAME = UPPER (CONSTRAINT_NAME)
       WHERE     t.owner = owner
             AND t.table_name = table_name
             AND t.column_name = column_name;

      COMMIT;
   END update_tab_columns;

   PROCEDURE testhtml
   IS
   BEGIN
      HTP.p ('lalallalalalalalla ');
   END testhtml;


   PROCEDURE genHTMLupdDBscriptFromColumns (tblowner   IN VARCHAR2,
                                            tblname    IN VARCHAR2)
   IS
   --v_cols COLUMNS%ROWTYPE;

   /*
   cursor col_cur is
       select *
       from dimgr.columns
       where owner = tblowner and table_name = tblname;

   v_cols col_cur%ROWTYPE;

   */
   BEGIN
      /*open col_cur;
      LOOP
          FETCH col_cur INTO v_cols;

          htp.p (
              'COMMENT ON COLUMN '||col_cur.owner||'.'||col_cur.table_name||'.'||col_cur.column_name||'  IS '''||col_cur.COLUMN_COMMENT||''';'
          );

          EXIT WHEN col_cur%NOTFOUND;
      END LOOP;
      close col_cur;
      */

      FOR col_cur IN (SELECT *
                        FROM dimgr.columns
                       WHERE owner = tblowner AND table_name = tblname)
      LOOP
         HTP.
          p (
               'COMMENT ON COLUMN '
            || col_cur.owner
            || '.'
            || col_cur.table_name
            || '.'
            || col_cur.column_name
            || '  IS '''
            || col_cur.COLUMN_COMMENT
            || ''';');
      END LOOP;
   END genHTMLupdDBscriptFromColumns;

   PROCEDURE genupdDBscriptFromColumns (tblowner           IN VARCHAR2,
                                        tblname            IN VARCHAR2,
                                        null_con_status    IN NUMBER,
                                        check_con_status   IN NUMBER)
   IS
      current_nullable   VARCHAR2 (1); -- current status of nullable attribute for a columm
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- ddl for column comments
      INSERT INTO dimgr.output (text)
           VALUES ('--------------- DDL for Column Comments');

      FOR col_cur IN (SELECT *
                        FROM dimgr.columns
                       WHERE owner = tblowner AND table_name = tblname)
      LOOP
         IF (col_cur.COLUMN_COMMENT IS NOT NULL)
         THEN
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'COMMENT ON COLUMN '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || '.'
                           || col_cur.column_name
                           || '  IS '''
                           || col_cur.COLUMN_COMMENT
                           || ''';');
         END IF;
      END LOOP;

      -- ddl for nulls
      INSERT INTO dimgr.output (text)
           VALUES ('--------------- DDL for NULLS');

      FOR col_cur IN (SELECT *
                        FROM dimgr.columns
                       WHERE owner = tblowner AND table_name = tblname)
      LOOP
         -- check if current null constraint in DB differs from the one recorded in COLUMNS.nullable field
         current_nullable :=
            get_nullable_status (col_cur.owner,
                                 col_cur.table_name,
                                 col_cur.column_name);

         /*
         select nullable into current_nullable
         from all_tab_columns
         where owner = col_cur.owner and table_name = col_cur.table_name and column_name =  col_cur.column_name;
         */
         -- produce DDL only if the null status changes
         IF (current_nullable <> col_cur.nullable)
         THEN
            IF (null_con_status = 0)
            THEN                                           --validate not null
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' modify '
                              || col_cur.column_name
                              || DECODE (col_cur.nullable,
                                         'Y', ' NULL;',
                                         'N', ' NOT NULL;'));
            ELSIF (null_con_status = 1)
            THEN                           -- not validate not null constraint
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' modify '
                              || col_cur.column_name
                              || DECODE (col_cur.nullable,
                                         'Y', ' NULL;',
                                         'N', ' NOT NULL enable novalidate;'));
            ELSE                                           -- disable not null
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' modify '
                              || col_cur.column_name
                              || DECODE (col_cur.nullable,
                                         'Y', ' NULL;',
                                         'N', ' NOT NULL disable;'));
            END IF;
         END IF;
      END LOOP;

      -- ddl for check constraints
      INSERT INTO dimgr.output (text)
           VALUES ('--------------- DDL for COLUMN CHECK CONSTRAINTS');

      FOR col_cur
         IN (SELECT *
               FROM dimgr.columns
              WHERE     owner = tblowner
                    AND table_name = tblname
                    AND CONSTRAINT_CHECK_CONDITION IS NOT NULL)
      LOOP
         -- ddl for dropping any existing check constraints and replace with new one
         INSERT INTO dimgr.output(text)
            SELECT *
              FROM TABLE (
                      drop_existing_check_cons_tfunc (col_cur.owner,
                                                      col_cur.table_name,
                                                      col_cur.column_name));

         -- drop any existing check constraints and replace with new one
         --drop_existing_check_cons(col_cur.owner, col_cur.table_name, col_cur.column_name );

         IF (check_con_status = 0)
         THEN                                                       --validate
            -- if there is a constraint_name, then include it in the ddl command
            IF (col_cur.constraint_name IS NOT NULL)
            THEN
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' add constraint '
                              || col_cur.constraint_name
                              || ' CHECK('
                              || col_cur.CONSTRAINT_CHECK_CONDITION
                              || ');');
            ELSE                               --else omit the constraint name
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' modify '
                              || col_cur.column_name
                              || ' CHECK('
                              || col_cur.CONSTRAINT_CHECK_CONDITION
                              || ');');
            END IF;
         ELSIF (check_con_status = 1)
         THEN                                             -- enable novalidate
            -- if there is a constraint_name, then include it in the ddl command
            IF (col_cur.constraint_name IS NOT NULL)
            THEN
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' add constraint '
                              || col_cur.constraint_name
                              || ' CHECK('
                              || col_cur.CONSTRAINT_CHECK_CONDITION
                              || ') enable novalidate;');
            ELSE                              -- else omit the constraint name
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' modify '
                              || col_cur.column_name
                              || ' CHECK('
                              || col_cur.CONSTRAINT_CHECK_CONDITION
                              || ') enable novalidate;');
            END IF;
         ELSE                                                       -- disable
            -- if there is a constraint_name, then include it in the ddl command
            IF (col_cur.constraint_name IS NOT NULL)
            THEN
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' add constraint '
                              || col_cur.constraint_name
                              || ' CHECK('
                              || col_cur.CONSTRAINT_CHECK_CONDITION
                              || ')  disable;');
            ELSE                              -- else omit the constraint name
               INSERT INTO dimgr.output (text)
                    VALUES (
                                 'alter table '
                              || col_cur.owner
                              || '.'
                              || col_cur.table_name
                              || ' modify '
                              || col_cur.column_name
                              || ' CHECK('
                              || col_cur.CONSTRAINT_CHECK_CONDITION
                              || ') disable;');
            END IF;
         END IF;
      END LOOP;

      COMMIT;
   END genupdDBscriptFromColumns;

   PROCEDURE genupdDBscriptFromTupCons (tblowner           IN VARCHAR2,
                                        tblname            IN VARCHAR2,
                                        check_con_status   IN NUMBER)
   IS
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';


      -- ddl for check constraints
      INSERT INTO dimgr.output (text)
           VALUES ('--------------- DDL for TUPLE CHECK CONSTRAINTS');

      -- ddl for dropping any existing check constraints and replace with new one
      INSERT INTO dimgr.output(text)
         SELECT *
           FROM TABLE (drop_existing_check_cons_tfunc (tblowner, tblname));

      -- ddl for new constraints
      FOR col_cur
         IN (SELECT *
               FROM dimgr.tuple_constraints
              WHERE owner = DECODE (tblowner, '%null%', owner, tblowner)
                    AND table_name =
                           DECODE (tblname, '%null%', table_name, tblname)
                    AND CONSTRAINT_CHECK_CONDITION IS NOT NULL)
      LOOP
         IF (check_con_status = 0)
         THEN                                                       --validate
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'alter table '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || ' add constraint '
                           || col_cur.constraint_name
                           || ' CHECK('
                           || col_cur.CONSTRAINT_CHECK_CONDITION
                           || ');');
         ELSIF (check_con_status = 1)
         THEN                                             -- enable novalidate
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'alter table '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || ' add constraint '
                           || col_cur.constraint_name
                           || ' CHECK('
                           || col_cur.CONSTRAINT_CHECK_CONDITION
                           || ') enable novalidate;');
         ELSE                                                       -- disable
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'alter table '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || ' add constraint '
                           || col_cur.constraint_name
                           || ' CHECK('
                           || col_cur.CONSTRAINT_CHECK_CONDITION
                           || ')  disable;');
         END IF;
      END LOOP;

      COMMIT;
   END genupdDBscriptFromTupCons;

   PROCEDURE genupdDBscriptFromTabCons (tblowner         IN VARCHAR2,
                                        tblname          IN VARCHAR2,
                                        tab_con_status   IN NUMBER)
   IS
   --is_found   integer;
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- ddl for PK/UK constraints
      INSERT INTO dimgr.output (text)
           VALUES ('--------------- DDL for PK/UK CONSTRAINTS');

      -- ddl for dropping any existing check constraints and replace with new one
      INSERT INTO dimgr.output(text)
         SELECT *
           FROM TABLE (drop_existing_pkuk_cons_tfunc (tblowner, tblname));

      -- ddl for new constraints
      FOR col_cur
         IN (SELECT *
               FROM dimgr.table_constraints
              WHERE owner = DECODE (tblowner, '%null%', owner, tblowner)
                    AND table_name =
                           DECODE (tblname, '%null%', table_name, tblname)
                    AND TYPE IN ('P', 'U'))
      LOOP
         /*-- check if constraint already exists
         select count(*) into is_found
         from all_constraints
         where  owner = tblowner and table_name = tblname AND CONSTRAINT_NAME = col_cur.CONSTRAINT_NAME;
         */
         -- if validate
         IF (tab_con_status = 0)
         THEN                                                       --validate
            /*  -- if constraint exists then just modify
              if (is_found > 0) then

                  insert into dimgr.output(text)
                      values (
                          'alter table '||tblowner||'.'||tblname||' modify constraint '||col_cur.constraint_name ||' enable validate;'
                      );
              -- if constraint does not exist then create
              else
             */
            --alter table lala add constraint lalapk primary key(y)
            --alter table lala add constraint lalaluk unique (xxx)
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'alter table '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || ' add constraint '
                           || col_cur.constraint_name
                           || DECODE (col_cur.TYPE,
                                      'P', ' primary key',
                                      ' unique')
                           || '('
                           || (SELECT wmsys.wm_concat (column_name)
                                 FROM (  SELECT *
                                           FROM table_constraints_ref_columns
                                          WHERE owner = col_cur.owner
                                                AND TABLE_NAME =
                                                       col_cur.table_name
                                                AND constraint_name =
                                                       col_cur.constraint_name
                                       ORDER BY owner,
                                                table_name,
                                                constraint_name,
                                                position ASC))
                           || ');');
         --end if;
         -- if enable novalidate
         ELSIF (tab_con_status = 1)
         THEN                                             -- enable novalidate
            /* -- if constraint exists then just modify
             if (is_found > 0) then
                         insert into dimgr.output(text)
                             values (
                                 'alter table '||tblowner||'.'||tblname||' modify constraint '||col_cur.constraint_name ||' enable novalidate;'
                             );
             -- if constraint does not exist then create
             else
             */
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'alter table '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || ' add constraint '
                           || col_cur.constraint_name
                           || DECODE (col_cur.TYPE,
                                      'P', ' primary key',
                                      ' unique')
                           || '('
                           || (SELECT wmsys.wm_concat (column_name)
                                 FROM (  SELECT *
                                           FROM table_constraints_ref_columns
                                          WHERE owner = col_cur.owner
                                                AND TABLE_NAME =
                                                       col_cur.table_name
                                                AND constraint_name =
                                                       col_cur.constraint_name
                                       ORDER BY owner,
                                                table_name,
                                                constraint_name,
                                                position ASC))
                           || ') ENABLE NOVALIDATE;');
         --end if;
         -- if disable
         ELSE                                                       -- disable
            /*-- if constraint exists then just modify
            if (is_found > 0) then
                        insert into dimgr.output(text)
                            values (
                                'alter table '||tblowner||'.'||tblname||' modify constraint '||col_cur.constraint_name ||' disable;'
                            );
            -- if constraint does not exist then create
            else
            */
            INSERT INTO dimgr.output (text)
                 VALUES (
                              'alter table '
                           || col_cur.owner
                           || '.'
                           || col_cur.table_name
                           || ' add constraint '
                           || col_cur.constraint_name
                           || DECODE (col_cur.TYPE,
                                      'P', ' primary key',
                                      ' unique')
                           || '('
                           || (SELECT wmsys.wm_concat (column_name)
                                 FROM (  SELECT *
                                           FROM table_constraints_ref_columns
                                          WHERE owner = col_cur.owner
                                                AND TABLE_NAME =
                                                       col_cur.table_name
                                                AND constraint_name =
                                                       col_cur.constraint_name
                                       ORDER BY owner,
                                                table_name,
                                                constraint_name,
                                                position ASC))
                           || ') DISABLE;');
         --end if;
         END IF;
      /*
      select *
      from dba_constraints
      where table_name = 'LALA'

      desc lala

      alter table lala add constraint lalapk primary key(y)

      alter table lala add constraint lalapk2 primary key(y)

      alter table lala add constraint lalaluk unique (xxx)

      alter table lala add constraint lalaluk2 unique (y, xxx)
      */
      END LOOP;

      COMMIT;
   END genupdDBscriptFromTabCons;


   PROCEDURE genupdDBscriptFromInterTabCons (tblowner         IN VARCHAR2,
                                             tblname          IN VARCHAR2,
                                             tab_con_status   IN NUMBER)
   IS
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- ddl for PK/UK constraints
      INSERT INTO dimgr.output (text)
           VALUES ('--------------- DDL for FK CONSTRAINTS');

      -- ddl for dropping any existing check constraints and replace with new one
      INSERT INTO dimgr.output(text)
         SELECT *
           FROM TABLE (drop_existing_fk_cons_tfunc (tblowner, tblname));

      -- ddl for new constraints
      FOR col_cur
         IN (SELECT *
               FROM dimgr.inter_table_constraints
              WHERE owner = DECODE (tblowner, '%null%', owner, tblowner)
                    AND table_name =
                           DECODE (tblname, '%null%', table_name, tblname)
                    AND TYPE IN ('R'))
      LOOP
         -- if validate
         IF (tab_con_status = 0)
         THEN                                                       --validate
            -- alter table dimgr.lala add constraint lalafk foreign key(Z) references dimgr.lala2(x) enable novalidate
            INSERT INTO dimgr.output (text)
                 VALUES (   'alter table '
                         || tblowner
                         || '.'
                         || tblname
                         || ' add constraint '
                         || col_cur.constraint_name
                         || ' foreign key'
                         || '('
                         || (SELECT wmsys.wm_concat (column_name)
                               FROM (  SELECT *
                                         FROM itable_constraints_ref_columns
                                        WHERE owner = col_cur.owner
                                              AND TABLE_NAME =
                                                     col_cur.table_name
                                              AND constraint_name =
                                                     col_cur.constraint_name
                                     ORDER BY owner,
                                              table_name,
                                              constraint_name,
                                              position ASC))
                         || ')'
                         || 'references '
                         || col_cur.ref_pkowner
                         || '.'
                         || col_cur.ref_pktable_name
                         || '('
                         || (SELECT wmsys.wm_concat (column_name)
                               FROM (  SELECT *
                                         FROM table_constraints_ref_columns
                                        WHERE owner = col_cur.ref_pkowner
                                              AND TABLE_NAME =
                                                     col_cur.ref_pktable_name
                                              AND constraint_name =
                                                     col_cur.
                                                      ref_pkconstraint_name
                                     ORDER BY owner,
                                              table_name,
                                              constraint_name,
                                              position ASC))
                         || ')'
                         || ';');
         -- if enable novalidate
         ELSIF (tab_con_status = 1)
         THEN                                             -- enable novalidate
            INSERT INTO dimgr.output (text)
                 VALUES (   'alter table '
                         || col_cur.owner
                         || '.'
                         || col_cur.table_name
                         || ' add constraint '
                         || col_cur.constraint_name
                         || ' foreign key'
                         || '('
                         || (SELECT wmsys.wm_concat (column_name)
                               FROM (  SELECT *
                                         FROM itable_constraints_ref_columns
                                        WHERE owner = col_cur.owner
                                              AND TABLE_NAME =
                                                     col_cur.table_name
                                              AND constraint_name =
                                                     col_cur.constraint_name
                                     ORDER BY owner,
                                              table_name,
                                              constraint_name,
                                              position ASC))
                         || ')'
                         || 'references '
                         || col_cur.ref_pkowner
                         || '.'
                         || col_cur.ref_pktable_name
                         || '('
                         || (SELECT wmsys.wm_concat (column_name)
                               FROM (  SELECT *
                                         FROM table_constraints_ref_columns
                                        WHERE owner = col_cur.ref_pkowner
                                              AND TABLE_NAME =
                                                     col_cur.ref_pktable_name
                                              AND constraint_name =
                                                     col_cur.
                                                      ref_pkconstraint_name
                                     ORDER BY owner,
                                              table_name,
                                              constraint_name,
                                              position ASC))
                         || ')'
                         || ' ENABLE NOVALIDATE;');
         -- if disable
         ELSE                                                       -- disable
            INSERT INTO dimgr.output (text)
                 VALUES (   'alter table '
                         || col_cur.owner
                         || '.'
                         || col_cur.table_name
                         || ' add constraint '
                         || col_cur.constraint_name
                         || ' foreign key'
                         || '('
                         || (SELECT wmsys.wm_concat (column_name)
                               FROM (  SELECT *
                                         FROM itable_constraints_ref_columns
                                        WHERE owner = col_cur.owner
                                              AND TABLE_NAME =
                                                     col_cur.table_name
                                              AND constraint_name =
                                                     col_cur.constraint_name
                                     ORDER BY owner,
                                              table_name,
                                              constraint_name,
                                              position ASC))
                         || ')'
                         || 'references '
                         || col_cur.ref_pkowner
                         || '.'
                         || col_cur.ref_pktable_name
                         || '('
                         || (SELECT wmsys.wm_concat (column_name)
                               FROM (  SELECT *
                                         FROM table_constraints_ref_columns
                                        WHERE owner = col_cur.ref_pkowner
                                              AND TABLE_NAME =
                                                     col_cur.ref_pktable_name
                                              AND constraint_name =
                                                     col_cur.
                                                      ref_pkconstraint_name
                                     ORDER BY owner,
                                              table_name,
                                              constraint_name,
                                              position ASC))
                         || ')'
                         || '  DISABLE;');
         END IF;
      END LOOP;

      COMMIT;
   END genupdDBscriptFromInterTabCons;


   PROCEDURE genDIvalscriptFromColumns (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      resowner   IN VARCHAR2 DEFAULT 'DIMGR',
      restable   IN VARCHAR2 DEFAULT 'DIRESULTS')
   IS
      testid           NUMBER;
      found_restable   NUMBER;
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- header
      INSERT INTO dimgr.output (text)
           VALUES ('--- Data Integrity Validation Scripts ---');

      -- check for result table
      SELECT COUNT (*)
        INTO found_restable
        FROM all_tables
       WHERE owner = resowner AND table_name = restable;

      IF (found_restable = 0)
      THEN
         -- create  result table
         create_result_table (resowner, restable);
      -- create result table ddl
      /*
      insert into dimgr.output(text) values (
          create_result_table_stmnt(resowner, restable)
      );*/
      END IF;

      -- loop for all validation queries
      testid := 1;

     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('DECLARE');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_code NUMBER;');                        
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg   VARCHAR2(512);');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('BEGIN');          

      FOR rec
         IN (SELECT a.*
               FROM dimgr.columns  a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b 
                        on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)
              WHERE     a.owner =  decode(tblowner,'%null%',a.owner,tblowner) 
                    AND a.table_name = decode(tblname,'%null%',a.table_name,tblname)
                    AND a.CONSTRAINT_VALIDATION_QRY IS NOT NULL
                    and b.owner IS NULL)
      LOOP
      
        INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' BEGIN ');
                      
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 '''N/A''')
                        || ', '                        
                        || ''''                        
                        || rec.column_name
                        || ''', '
                        ||'''column constraint'','
                        || '('
                        || rec.CONSTRAINT_VALIDATION_QRY
                        || '), '
                        || 'sysdate'
                        || ', '
                        || 'NULL'
                        || ', '
                        || 'NULL'                                                                                                                        
                        || ');');

    --     INSERT INTO dimgr.output (text)
     --         VALUES ('commit;');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' EXCEPTION ');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' WHEN OTHERS THEN ');         
         -- log error code and message
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' l_err_code := SQLCODE;');         
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg := SQLERRM;');
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 '''N/A''')
                        || ', '
                        || ''''                        
                        || rec.column_name
                        || ''', '                                                
                        --|| 'null, '
                        ||'''column constraint'','                        
                        || 'NULL'
                        || ', '
                        || 'sysdate'
                        || ', '
                        || ' l_err_code'
                        || ', '
                        || 'l_err_msg'                                                                        
                        || ');');
                           
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');         
         INSERT INTO dimgr.output (text)  VALUES ('COMMIT;');
     

         testid := testid + 1;
      END LOOP;
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');    
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('/');       
      COMMIT;
   END genDIvalscriptFromColumns;

   PROCEDURE genDIvalscriptFromTupCons (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      resowner   IN VARCHAR2 DEFAULT 'DIMGR',
      restable   IN VARCHAR2 DEFAULT 'DIRESULTS',
      p_user                IN  VARCHAR2 DEFAULT NULL,
      p_updated_from  IN VARCHAR2 DEFAULT NULL,
      p_updated_to  IN VARCHAR2 DEFAULT NULL,
      p_include_only_failed_flg  IN integer DEFAULT 0      
      )
   IS
      testid           NUMBER;
      found_restable   NUMBER;
      TYPE  t_cons_curtype  is REF CURSOR;
      rc_t_constraints  t_cons_curtype;     -- ref cursor to return tha available constraints to be included in the validation scripts  
      rec dimgr.tuple_constraints%rowtype;
      v_query   varchar2(4000);      
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- header      
      INSERT INTO dimgr.output (text)
           VALUES ( '--- Data Integrity Validation Scripts ---');
-- DEBUG
--COMMIT;
--raise_application_error(-20020, 'after insert');
      -- check for result table
      SELECT COUNT (*)
        INTO found_restable
        FROM all_tables
       WHERE owner = resowner AND table_name = restable;

      IF (found_restable = 0)
      THEN
         -- create  result table
         create_result_table (resowner, restable);
      -- create result table ddl
      /*
      insert into dimgr.output(text) values (
          create_result_table_stmnt(resowner, restable)
      );*/
      END IF;
      
    -- create query for constraints to be included in the validation scripts
    if  (p_include_only_failed_flg  =  0) then  -- include all queries
        open rc_t_constraints FOR
            select a.* 
            from dimgr.tuple_constraints a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b 
                        on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)
            where 
                a.owner = decode(tblowner,'%null%',a.owner,tblowner) 
                and a.table_name = decode(tblname,'%null%',a.table_name,tblname) 
                and a.CONSTRAINT_VALIDATION_QRY is not null     
                and b.owner IS NULL
                and    a.LAST_UPDATED_BY = decode(nvl(p_user,'%null%'), '%null%', a.LAST_UPDATED_BY, p_user)
                and a.LAST_UPDATED between decode(nvl(p_updated_from,'01/01/1900'), '01/01/1900', to_date('01/01/1900', 'dd/mm/yyyy'), to_date(p_updated_from, 'dd/mm/yyyy') )
                                                and decode(nvl(p_updated_to,'01/01/2900') ,'01/01/2900', to_date('01/01/2900', 'dd/mm/yyyy'),to_date( p_updated_to, 'dd/mm/yyyy'));               
    else -- include only failed scripts as well as the ones that never run or failed with an exception
    
        -- dynamic query because the results table comes as input from the user        
        v_query := 
            ' select a.*' 
            ||' from dimgr.tuple_constraints a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b '
            ||'            on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)'
            ||'         LEFT OUTER JOIN '
            ||'('
            ||'         /* get only the latest unsuccessful results */'
            ||'         select' 
            ||'             owner'
            ||'            ,table_name'
            ||'            ,constraint_name'
            ||'            ,result'            
            ||'         from ('    
            ||'             select'
            ||'                 test_id'
            ||'                 ,owner'
            ||'                 ,table_name'
            ||'                 ,column_name'
            ||'                 ,constraint_name'
            ||'                 ,result'
            ||'                 ,population_date'
            ||'                 ,row_number() over(partition by owner, table_name, column_name, constraint_name  order by population_date desc)  r'              
            ||'             from  '||resowner||'.'||restable
            ||'         ) t'
            ||'         where'
            ||'             t.r =   1'                                        
            ||' ) c'
            ||'            on (a.owner = c.owner and a.table_name = c.table_name and a.constraint_name = c.constraint_name)'                        
            ||' where' 
            ||'           nvl(c.result, 1) not in (0, -99999)' -- get only failed tests as well as the ones that never run or failed with an exception            
            ||'     and a.owner = decode('''||tblowner||''',''%null%'',a.owner,'''||tblowner||''')' 
            ||'     and a.table_name = decode('''||tblname||''',''%null%'',a.table_name,'''||tblname||''')'             
            ||'     and a.CONSTRAINT_VALIDATION_QRY is not null'
            ||'     and b.owner IS NULL'     
            ||'     and    a.LAST_UPDATED_BY = decode(nvl('''||p_user||''',''%null%''), ''%null%'', a.LAST_UPDATED_BY, '''||p_user||''')'
            ||'     and a.LAST_UPDATED between decode(nvl('''||p_updated_from||''',''01/01/1900''),''01/01/1900'', to_date(''01/01/1900'', ''dd/mm/yyyy''),to_date( '''||p_updated_from||''', ''dd/mm/yyyy'') )'
            ||'                                     and decode(nvl('''||p_updated_to||''',''01/01/2900'') ,''01/01/2900'', to_date(''01/01/2900'', ''dd/mm/yyyy''),to_date('''|| p_updated_to||''', ''dd/mm/yyyy''))';                       
        
        
            
        --DEBUG
       -- raise_application_error(-20102, v_query);
        
        open rc_t_constraints FOR v_query;
        
    end if;
      

      -- loop for all validation queries
      testid := 1;
/*
      FOR rec
         IN (SELECT *
               FROM dimgr.tuple_constraints
              WHERE owner = DECODE (tblowner, '%null%', owner, tblowner)
                    AND table_name =
                           DECODE (tblname, '%null%', table_name, tblname)
                    AND CONSTRAINT_VALIDATION_QRY IS NOT NULL)                    
*/            
             
     INSERT INTO DIMGR.OUTPUT( TEXT) VALUES('DECLARE');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES( '  l_err_code NUMBER;');                        
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg   VARCHAR2(512);');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('BEGIN');          
     
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('EXECUTE IMMEDIATE ''ALTER SESSION ENABLE PARALLEL DML'';');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('EXECUTE IMMEDIATE ''ALTER SESSION  FORCE PARALLEL QUERY PARALLEL 16'';');
     
--COMMIT;
      LOOP
        FETCH rc_t_constraints into rec;
        EXIT WHEN rc_t_constraints%NOTFOUND;
        
        INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' BEGIN ');        
      
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')');
                        
          INSERT INTO dimgr.output (text)
              VALUES (                        
                         ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 'NULL')
                        || ', '                        
                        || '''N/A'', '
                        ||'''tuple constraint'','                        
                        || '('
                        || rec.CONSTRAINT_VALIDATION_QRY
                        || '), '
                        || 'sysdate'
                        || ', '
                        || 'NULL'
                        || ', '
                        || 'NULL'                                                                                                
                        || ');');

      --   INSERT INTO dimgr.output (text)
       --       VALUES ('commit;');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' EXCEPTION ');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' WHEN OTHERS THEN ');         
         -- log error code and message
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' l_err_code := SQLCODE;');         
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg := SQLERRM;');
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 'NULL')
                        || ', '                        
                        || '''N/A'', '--|| 'null, '
                        ||'''tuple constraint'','                        
                        || 'NULL'
                        || ', '
                        || 'sysdate'
                        || ', '
                        || ' l_err_code'
                        || ', '
                        || 'l_err_msg'                                                                        
                        || ');');
                           
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');         
         INSERT INTO dimgr.output (text)  VALUES ('COMMIT;');

         testid := testid + 1;
      END LOOP;
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');    
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('/');       
     COMMIT;
     CLOSE rc_t_constraints;

   END genDIvalscriptFromTupCons;


   PROCEDURE genDIvalscriptFromTablCons (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      resowner   IN VARCHAR2 DEFAULT 'DIMGR',
      restable   IN VARCHAR2 DEFAULT 'DIRESULTS',
      p_user                IN  VARCHAR2 DEFAULT NULL,
      p_updated_from  IN VARCHAR2 DEFAULT NULL,
      p_updated_to  IN VARCHAR2 DEFAULT NULL,
      p_include_only_failed_flg  IN integer DEFAULT 0,
      p_constraint_type IN  VARCHAR2    DEFAULT NULL 
      )     
   IS
      testid                NUMBER;
      found_restable   NUMBER;
      TYPE  t_cons_curtype  is REF CURSOR;
      rc_t_constraints  t_cons_curtype;     -- ref cursor to return tha available constraints to be included in the validation scripts  
      rec dimgr.table_constraints%rowtype;
      v_query   varchar2(4000);
   BEGIN
   
   -- DEBUG
  /*raise_application_error(-20101, 
        ' tblowner --> '||tblowner||CHR(13)||
        ' tblname --> '||tblname||CHR(13)||
        ' resowner --> '||resowner||CHR(13)||
        ' restable --> '||restable||CHR(13)||
        ' p_user -->'||p_user||CHR(13)||
        ' p_updated_from --> '||p_updated_from||CHR(13)||
        ' p_updated_to --> '||p_updated_to||CHR(13)||
        ' p_include_only_failed_flg --> '|| p_include_only_failed_flg||CHR(13)
   
   );*/

      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- header
      INSERT INTO dimgr.output (text)
           VALUES ('--- Data Integrity Validation Scripts ---');

      -- check for result table
      SELECT COUNT (*)
        INTO found_restable
        FROM all_tables
       WHERE owner = resowner AND table_name = restable;

      IF (found_restable = 0)
      THEN
         -- create  result table
         create_result_table (resowner, restable);
      -- create result table ddl
      /*
      insert into dimgr.output(text) values (
          create_result_table_stmnt(resowner, restable)
      );*/
      END IF;

    -- create query for constraints to be included in the validation scripts
    if  (p_include_only_failed_flg  =  0) then  -- include all queries
        open rc_t_constraints FOR
            select a.* 
            from dimgr.table_constraints a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b 
                        on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)
            where 
                a.owner = decode(tblowner,'%null%',a.owner,tblowner) 
                and a.table_name = decode(tblname,'%null%',a.table_name,tblname) 
                and a.type = decode(p_constraint_type,'%null%',a.type,p_constraint_type)                
                and a.CONSTRAINT_VALIDATION_QRY is not null
                and b.owner IS NULL     
                and    a.LAST_UPDATED_BY = decode(nvl(p_user,'%null%'), '%null%', a.LAST_UPDATED_BY, p_user)
                and a.LAST_UPDATED between decode(nvl(p_updated_from,'01/01/1900'), '01/01/1900', to_date('01/01/1900', 'dd/mm/yyyy'), to_date(p_updated_from, 'dd/mm/yyyy') )
                                                and decode(nvl(p_updated_to,'01/01/2900') ,'01/01/2900', to_date('01/01/2900', 'dd/mm/yyyy'),to_date( p_updated_to, 'dd/mm/yyyy'));               
    else -- include only failed scripts
    
        -- dynamic query because the results table comes as input from the user        
        v_query := 
            ' select a.*' 
            ||' from dimgr.table_constraints a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b '
            ||'            on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)'
            ||'         LEFT OUTER JOIN '
            ||'('
            ||'         /* get only the latest unsuccessful results */'
            ||'         select' 
            ||'             owner'
            ||'            ,table_name'
            ||'            ,constraint_name'
            ||'            ,result'            
            ||'         from ('    
            ||'             select'
            ||'                 test_id'
            ||'                 ,owner'
            ||'                 ,table_name'
            ||'                 ,column_name'
            ||'                 ,constraint_name'
            ||'                 ,result'
            ||'                 ,population_date'
            ||'                 ,row_number() over(partition by owner, table_name, column_name, constraint_name  order by population_date desc)  r'              
            ||'             from  '||resowner||'.'||restable
            ||'         ) t'
            ||'         where'
            ||'             t.r =   1'                                        
            ||' ) c'
            ||'            on (a.owner = c.owner and a.table_name = c.table_name and a.constraint_name = c.constraint_name)'                        
            ||' where' 
            ||'           nvl(c.result, 1) not in (0, -99999)' -- get only failed tests as well as the ones that never run or failed with an exception            
            ||'     and a.owner = decode('''||tblowner||''',''%null%'',a.owner,'''||tblowner||''')' 
            ||'     and a.table_name = decode('''||tblname||''',''%null%'',a.table_name,'''||tblname||''')' 
            ||'     and a.type = decode('''||p_constraint_type||''',''%null%'',a.type,'''||p_constraint_type||''')'            
            ||'     and a.CONSTRAINT_VALIDATION_QRY is not null'
            ||'     and b.owner IS NULL'     
            ||'     and    a.LAST_UPDATED_BY = decode(nvl('''||p_user||''',''%null%''), ''%null%'', a.LAST_UPDATED_BY, '''||p_user||''')'
            ||'     and a.LAST_UPDATED between decode(nvl('''||p_updated_from||''',''01/01/1900''),''01/01/1900'', to_date(''01/01/1900'', ''dd/mm/yyyy''),to_date( '''||p_updated_from||''', ''dd/mm/yyyy'') )'
            ||'                                     and decode(nvl('''||p_updated_to||''',''01/01/2900'') ,''01/01/2900'', to_date(''01/01/2900'', ''dd/mm/yyyy''),to_date('''|| p_updated_to||''', ''dd/mm/yyyy''))';                       
            
        --DEBUG        
       --raise_application_error(-20102, v_query);
        
        open rc_t_constraints FOR v_query;
        
    end if;
    
      -- loop for all validation queries
      testid := 1;
/*
      FOR rec
         IN (SELECT *
               FROM dimgr.table_constraints
              WHERE owner = DECODE (tblowner, '%null%', owner, tblowner)
                    AND table_name =
                           DECODE (tblname, '%null%', table_name, tblname)
                    AND CONSTRAINT_VALIDATION_QRY IS NOT NULL)
*/
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('DECLARE');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_code NUMBER;');                        
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg   VARCHAR2(512);');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('BEGIN');  

     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('EXECUTE IMMEDIATE ''ALTER SESSION ENABLE PARALLEL DML'';');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('EXECUTE IMMEDIATE ''ALTER SESSION  FORCE PARALLEL QUERY PARALLEL 16'';');             

      LOOP
        FETCH rc_t_constraints into rec;
        EXIT WHEN rc_t_constraints%NOTFOUND;

        INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' BEGIN ');
                
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 'NULL')
                        || ', '                        
                        ||'''N/A'','--|| 'null, '
                        ||''''||constraint_type_desc(rec.type)||''''||','
                        || '('
                        || rec.CONSTRAINT_VALIDATION_QRY
                        || '), '
                        || 'sysdate'
                       || ', '
                        || 'NULL'
                       || ', '
                        || 'NULL'                                                                        
                        || ');');

        -- INSERT INTO dimgr.output (text)
         --     VALUES ('commit;');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' EXCEPTION ');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' WHEN OTHERS THEN ');         
         -- log error code and message
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' l_err_code := SQLCODE;');         
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg := SQLERRM;');
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 'NULL')
                        || ', '                        
                        ||'''N/A'','--|| 'null, '
                        ||''''||constraint_type_desc(rec.type)||''''||','                        --||''||rec.type||''||','                        
                        || 'NULL'
                        || ', '
                        || 'sysdate'
                        || ', '
                        || ' l_err_code'
                        || ', '
                        || 'l_err_msg'                                                                        
                        || ');');
                           
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');         
         INSERT INTO dimgr.output (text)  VALUES ('COMMIT;');
         testid := testid + 1;
      END LOOP;     
      INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');
      INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('/');      
     
     CLOSE rc_t_constraints;     
     COMMIT;
   END genDIvalscriptFromTablCons;

   PROCEDURE genDIvalscriptFromIntTablCons (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      resowner   IN VARCHAR2 DEFAULT 'DIMGR',
      restable   IN VARCHAR2 DEFAULT 'DIRESULTS',
      p_user                IN  VARCHAR2 DEFAULT NULL,
      p_updated_from  IN VARCHAR2 DEFAULT NULL,
      p_updated_to  IN VARCHAR2 DEFAULT NULL,
      p_include_only_failed_flg  IN integer DEFAULT 0,
      p_constraint_type IN  VARCHAR2    DEFAULT NULL      
      )
   IS
      testid           NUMBER;
      found_restable   NUMBER;
      TYPE  t_cons_curtype  is REF CURSOR;
      rc_t_constraints  t_cons_curtype;     -- ref cursor to return tha available constraints to be included in the validation scripts  
      rec dimgr.inter_table_constraints%rowtype;
      v_query   varchar2(4000);
      
   BEGIN
      -- truncate output table
      EXECUTE IMMEDIATE 'truncate table dimgr.output';

      -- header
      INSERT INTO dimgr.output (text)
           VALUES ('--- Data Integrity Validation Scripts ---');

      -- check for result table
      SELECT COUNT (*)
        INTO found_restable
        FROM all_tables
       WHERE owner = resowner AND table_name = restable;

      IF (found_restable = 0)
      THEN
         -- create  result table
         create_result_table (resowner, restable);
      END IF;

    -- create query for constraints to be included in the validation scripts
    if  (p_include_only_failed_flg  =  0) then  -- include all queries
        open rc_t_constraints FOR
            select a.* 
            from dimgr.inter_table_constraints a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b 
                        on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)
            where 
                a.owner = decode(tblowner,'%null%',a.owner,tblowner) 
                and a.table_name = decode(tblname,'%null%',a.table_name,tblname) 
                and a.type = decode(p_constraint_type,'%null%',a.type,p_constraint_type)
                and a.CONSTRAINT_VALIDATION_QRY is not null
                and b.owner IS NULL     
                and    a.LAST_UPDATED_BY = decode(nvl(p_user,'%null%'), '%null%', a.LAST_UPDATED_BY, p_user)
                and a.LAST_UPDATED between decode(nvl(p_updated_from,'01/01/1900'), '01/01/1900', to_date('01/01/1900', 'dd/mm/yyyy'), to_date(p_updated_from, 'dd/mm/yyyy') )
                                                and decode(nvl(p_updated_to,'01/01/2900') ,'01/01/2900', to_date('01/01/2900', 'dd/mm/yyyy'),to_date( p_updated_to, 'dd/mm/yyyy'));               
    else -- include only failed scripts
    
        -- dynamic query because the results table comes as input from the user        
        v_query := 
            ' select a.*' 
            ||' from dimgr.inter_table_constraints a LEFT OUTER JOIN DIMGR.V_BAD_QUERIES b '
            ||'            on (a.owner = b.owner and a.table_name = b.table_name and a.constraint_name = b.constraint_name)'
            ||'         LEFT OUTER JOIN '
            ||'('
            ||'         /* get only the latest unsuccessful results */'
            ||'         select' 
            ||'             owner'
            ||'            ,table_name'
            ||'            ,constraint_name'
            ||'            ,result'            
            ||'         from ('    
            ||'             select'
            ||'                 test_id'
            ||'                 ,owner'
            ||'                 ,table_name'
            ||'                 ,column_name'
            ||'                 ,constraint_name'
            ||'                 ,result'
            ||'                 ,population_date'
            ||'                 ,row_number() over(partition by owner, table_name, column_name, constraint_name  order by population_date desc)  r'              
            ||'             from  '||resowner||'.'||restable
            ||'         ) t'
            ||'         where'
            ||'             t.r =   1'                                        
            ||' ) c'
            ||'            on (a.owner = c.owner and a.table_name = c.table_name and a.constraint_name = c.constraint_name)'                        
            ||' where' 
            ||'           nvl(c.result, 1) not in (0, -99999)' -- get only failed tests as well as the ones that never run or failed with an exception            
            ||'     and a.owner = decode('''||tblowner||''',''%null%'',a.owner,'''||tblowner||''')' 
            ||'     and a.table_name = decode('''||tblname||''',''%null%'',a.table_name,'''||tblname||''')' 
            ||'     and a.type = decode('''||p_constraint_type||''',''%null%'',a.type,'''||p_constraint_type||''')'            
            ||'     and a.CONSTRAINT_VALIDATION_QRY is not null'
            ||'     and b.owner IS NULL'     
            ||'     and    a.LAST_UPDATED_BY = decode(nvl('''||p_user||''',''%null%''), ''%null%'', a.LAST_UPDATED_BY, '''||p_user||''')'
            ||'     and a.LAST_UPDATED between decode(nvl('''||p_updated_from||''',''01/01/1900''),''01/01/1900'', to_date(''01/01/1900'', ''dd/mm/yyyy''),to_date( '''||p_updated_from||''', ''dd/mm/yyyy'') )'
            ||'                                     and decode(nvl('''||p_updated_to||''',''01/01/2900'') ,''01/01/2900'', to_date(''01/01/2900'', ''dd/mm/yyyy''),to_date('''|| p_updated_to||''', ''dd/mm/yyyy''))';                       
                    
        --DEBUG
       -- raise_application_error(-20102, v_query);
        
        open rc_t_constraints FOR v_query;
        
    end if;


      -- loop for all validation queries
      testid := 1;

     /* FOR rec
         IN (SELECT *
               FROM dimgr.inter_table_constraints
              WHERE owner = DECODE (tblowner, '%null%', owner, tblowner)
                    AND table_name =
                           DECODE (tblname, '%null%', table_name, tblname)
                    AND CONSTRAINT_VALIDATION_QRY IS NOT NULL)
    */     
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('DECLARE');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_code NUMBER;');                        
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg   VARCHAR2(512);');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('BEGIN');          
     
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('EXECUTE IMMEDIATE ''ALTER SESSION ENABLE PARALLEL DML'';');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('EXECUTE IMMEDIATE ''ALTER SESSION  FORCE PARALLEL QUERY PARALLEL 16'';');
     
      LOOP
        FETCH rc_t_constraints into rec;
        EXIT WHEN rc_t_constraints%NOTFOUND;
        
        INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' BEGIN ');
        
        INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 'NULL')
                        || ', '                        
                        ||'''N/A'','--|| 'null, '
                        ||''''||constraint_type_desc(rec.type)||''''||',' --||''||rec.type||''||','                        
                        || '('
                        || rec.CONSTRAINT_VALIDATION_QRY
                        || '), '
                        || 'sysdate'
                       || ', '
                        || 'NULL'
                       || ', '
                        || 'NULL'                                                
                        || ');');

--         INSERT INTO dimgr.output (text)
 --             VALUES ('commit;');
        
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' EXCEPTION ');
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' WHEN OTHERS THEN ');         
         -- log error code and message
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' l_err_code := SQLCODE;');         
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('  l_err_msg := SQLERRM;');
         INSERT INTO dimgr.output (text)
              VALUES (
                           'insert into '
                        || resowner
                        || '.'
                        || restable
                        || '('
                        || get_result_table_columns (resowner, restable)
                        || ')'
                        || ' values ('
                        || testid
                        || ', '
                        || ''''
                        || rec.owner
                        || ''','
                        || ''''
                        || rec.table_name
                        || ''', '
                        || NVL2 (rec.constraint_name,
                                 '''' || rec.constraint_name || '''',
                                 'NULL')
                        || ', '                        
                        ||'''N/A'','--|| 'null, '
                        ||''''||constraint_type_desc(rec.type)||''''||',' --||''||rec.type||''||','                        
                        || 'NULL'
                        || ', '
                        || 'sysdate'
                        || ', '
                        || ' l_err_code'
                        || ', '
                        || 'l_err_msg'                                                                        
                        || ');');
                           
         INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');         
         INSERT INTO dimgr.output (text)  VALUES ('COMMIT;');
                           
         testid := testid + 1;
      END LOOP;
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES(' END; ');
     INSERT INTO DIMGR.OUTPUT(TEXT) VALUES('/');     
     CLOSE rc_t_constraints;
     COMMIT;
   END genDIvalscriptFromIntTablCons;


   FUNCTION create_result_table_stmnt (tblowner   IN VARCHAR2,
                                       tblname    IN VARCHAR2)
      RETURN VARCHAR2
   IS
      ret   VARCHAR2 (4000);
   BEGIN
      ret :=
            'create table '
         || tblowner
         || '.'
         || tblname
         || '(
            test_id  number(10),
            owner varchar2(30),
            table_name varchar2(30),
            constraint_name varchar2(500),            
            column_name varchar2(30),
            type    varchar2(200),            
            result  number(12),            
            population_date date,
            error_code  number,
            error_msg   varchar2(512));';

      RETURN ret;
   END create_result_table_stmnt;

   PROCEDURE create_result_table (tblowner IN VARCHAR2, tblname IN VARCHAR2)
   IS
   BEGIN
      EXECUTE IMMEDIATE   'create table '
                       || tblowner
                       || '.'
                       || tblname
                       || '(
            test_id  number(10),
            owner varchar2(30),
            table_name varchar2(30),
            constraint_name varchar2(500),            
            column_name varchar2(30),
            type    varchar2(200),            
            result  number(12),            
            population_date date,
            error_code  number,
            error_msg   varchar2(512))';
   END create_result_table;

   FUNCTION get_result_table_columns (tblowner   IN VARCHAR2,
                                      tblname    IN VARCHAR2)
      RETURN VARCHAR2
   IS
      res   VARCHAR2 (4000);
   BEGIN
        SELECT wmsys.wm_concat (column_name)
          INTO res
          FROM all_tab_columns
         WHERE owner = tblowner AND table_name = tblname
      ORDER BY column_id;

      RETURN res;
   END get_result_table_columns;

   FUNCTION get_nullable_status (tblowner   IN VARCHAR2,
                                 tblname    IN VARCHAR2,
                                 colname    IN VARCHAR2)
      RETURN VARCHAR2
   IS
      numresult   NUMBER;
   BEGIN
      -- first save locally check constraints (this is done in order to be able to convert
      -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
      -- are not allowed in wHERE clauses) - since we want to filter on not null check constraints
      EXECUTE IMMEDIATE 'truncate table dimgr.srch_cond';

      EXECUTE IMMEDIATE--dbms_output.put_line(
                       'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
        select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
        from all_constraints a, all_cons_columns b
        where  
            a.OWNER = b.OWNER and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
            and a.OWNER = '''
                       || tblowner
                       || ''''
                       || ' and CONSTRAINT_TYPE = ''C''';

      --);
      COMMIT;

      SELECT COUNT (*)
        INTO numresult
        FROM dimgr.srch_cond
       WHERE     owner = tblowner
             AND table_name = tblname
             AND column_name = colname
             AND search_condition LIKE '%NOT NULL%';

      IF (numresult = 1)
      THEN
         RETURN 'N';
      ELSE
         RETURN 'Y';
      END IF;
   END get_nullable_status;

   PROCEDURE drop_existing_check_cons (tblowner   IN VARCHAR2,
                                       tblname    IN VARCHAR2,
                                       colname    IN VARCHAR2)
   IS
   BEGIN
      -- first save locally check constraints (this is done in order to be able to convert
      -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
      -- are not allowed in wHERE clauses) - since we want to filter on check constraints
      EXECUTE IMMEDIATE 'truncate table dimgr.srch_cond';

      EXECUTE IMMEDIATE--dbms_output.put_line(
                       'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
        select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
        from all_constraints a, all_cons_columns b
        where  
            a.OWNER = b.OWNER and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
            and a.OWNER = '''
                       || tblowner
                       || ''''
                       || ' and CONSTRAINT_TYPE = ''C''';

      --);
      COMMIT;

      FOR rec
         IN (SELECT *
               FROM dimgr.srch_cond
              WHERE     owner = tblowner
                    AND table_name = tblname
                    AND column_name = colname
                    AND search_condition NOT LIKE '%NOT NULL%')
      LOOP
         EXECUTE IMMEDIATE   'alter table '
                          || rec.owner
                          || '.'
                          || rec.table_name
                          || ' drop constraint '
                          || rec.constraint_name;
      END LOOP;
   END drop_existing_check_cons;

   FUNCTION drop_existing_fk_cons_tfunc (tblowner   IN VARCHAR2,
                                         tblname    IN VARCHAR2)
      RETURN output_table_typ
      PIPELINED
   IS
      txt   output_typ := output_typ (NULL);
   BEGIN
      FOR rec
         IN (SELECT *
               FROM all_constraints
              WHERE     owner = tblowner
                    AND table_name = tblname
                    AND constraint_type IN ('R'))
      LOOP
         --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
         txt.text :=
               'alter table '
            || rec.owner
            || '.'
            || rec.table_name
            || ' drop constraint '
            || rec.constraint_name
            || ';';
         PIPE ROW (txt);
      END LOOP;

      RETURN;
   END drop_existing_fk_cons_tfunc;


   FUNCTION drop_existing_pkuk_cons_tfunc (tblowner   IN VARCHAR2,
                                           tblname    IN VARCHAR2)
      RETURN output_table_typ
      PIPELINED
   IS
      txt   output_typ := output_typ (NULL);
   BEGIN
      FOR rec
         IN (SELECT *
               FROM all_constraints
              WHERE     owner = tblowner
                    AND table_name = tblname
                    AND constraint_type IN ('P', 'U'))
      LOOP
         --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
         txt.text :=
               'alter table '
            || rec.owner
            || '.'
            || rec.table_name
            || ' drop constraint '
            || rec.constraint_name
            || ';';
         PIPE ROW (txt);
      END LOOP;

      RETURN;
   END drop_existing_pkuk_cons_tfunc;

   FUNCTION drop_existing_check_cons_tfunc (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      colname    IN VARCHAR2 DEFAULT NULL)
      RETURN output_table_typ
      PIPELINED
   IS
      txt   output_typ := output_typ (NULL);
      PRAGMA AUTONOMOUS_TRANSACTION; -- to avoid ORA-14552: cannot perform a DDL, commit or rollback inside a query or DML
 -- since this function will be called in the from clause of a query enclosed in a table function
                                        -- and below we perform DDL (truncate)
   BEGIN
      -- first save locally check constraints (this is done in order to be able to convert
      -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
      -- are not allowed in wHERE clauses) - since we want to filter on check constraints
      EXECUTE IMMEDIATE 'truncate table dimgr.srch_cond';

      IF (colname IS NOT NULL)
      THEN
         EXECUTE IMMEDIATE--dbms_output.put_line(
                          'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
            select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
            from all_constraints a, all_cons_columns b
            where  
                a.OWNER = b.OWNER and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
                and a.OWNER = '''
                          || tblowner
                          || ''''
                          || ' and CONSTRAINT_TYPE = ''C''';

         --);
         COMMIT;

         FOR rec
            IN (SELECT *
                  FROM dimgr.srch_cond
                 WHERE     owner = tblowner
                       AND table_name = tblname
                       AND column_name = colname
                       AND search_condition NOT LIKE '%NOT NULL%')
         LOOP
            --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
            txt.text :=
                  'alter table '
               || rec.owner
               || '.'
               || rec.table_name
               || ' drop constraint '
               || rec.constraint_name
               || ';';
            PIPE ROW (txt);
         END LOOP;
      ELSE       -- colname is null so get the constraints for the whole table
         EXECUTE IMMEDIATE--dbms_output.put_line(
                          'insert into dimgr.srch_cond(owner, table_name, search_condition, constraint_name)
            select a.owner, a.table_name, TO_LOB(search_condition), a.constraint_name
            from all_constraints a
            where  
                a.OWNER = '''
                          || tblowner
                          || ''''
                          || ' and CONSTRAINT_TYPE = ''C''';

         --);
         COMMIT;

         FOR rec IN (SELECT *
                       FROM dimgr.srch_cond
                      WHERE owner = tblowner AND table_name = tblname --and column_name = colname
                            AND search_condition NOT LIKE '%NOT NULL%')
         LOOP
            --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
            txt.text :=
                  'alter table '
               || rec.owner
               || '.'
               || rec.table_name
               || ' drop constraint '
               || rec.constraint_name
               || ';';
            PIPE ROW (txt);
         END LOOP;
      END IF;

      RETURN;
   END drop_existing_check_cons_tfunc;

   PROCEDURE update_PKUK_valq_TabCons (tblowner   IN VARCHAR2,
                                       tblname    IN VARCHAR2,
                                       docommit      INTEGER DEFAULT 0)
   IS
      CURSOR c_tcon
      IS
             SELECT *
               FROM DIMGR.TABLE_CONSTRAINTS t
              WHERE     t.OWNER = tblowner
                    AND t.table_name = tblname
                    AND t.TYPE IN ('P', 'U')
                    AND t.CONSTRAINT_VALIDATION_QRY IS NULL
         FOR UPDATE OF t.CONSTRAINT_VALIDATION_QRY;
   BEGIN
      -- loop table constraints of this table to update validation query
      FOR r IN c_tcon
      LOOP
         UPDATE DIMGR.TABLE_CONSTRAINTS tt
            SET tt.CONSTRAINT_VALIDATION_QRY =
                   (SELECT    'select count(*) from (SELECT '
                           || t2.pkcolumns
                           || ', COUNT(*) FROM '
                           || t2.pkowner
                           || '.'
                           || t2.pktable_name
                           || ' group by '
                           || t2.pkcolumns
                           || ' having count(*) > 1'
                           || ')'
                      FROM (  SELECT A.OWNER pkowner,
                                     A.TABLE_NAME pktable_name,
                                     A.CONSTRAINT_NAME pkconstraint_name,
                                     wmsys.wm_concat (B.COLUMN_NAME)
                                        AS pkcolumns
                                FROM    DIMGR.TABLE_CONSTRAINTS a
                                     JOIN
                                        DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b
                                     ON (A.OWNER = B.OWNER
                                         AND A.TABLE_NAME = B.TABLE_NAME
                                         AND A.CONSTRAINT_NAME =
                                                B.CONSTRAINT_NAME)
                               WHERE     a.owner = r.owner
                                     AND a.table_name = r.table_name
                                     AND a.constraint_name = r.constraint_name
                            GROUP BY A.OWNER, A.TABLE_NAME, A.CONSTRAINT_NAME) t2)
          WHERE CURRENT OF c_tcon;
      END LOOP;

      -- update PK/UK validation queries for a single table
      /*    for r in (select * from DIMGR.TABLE_CONSTRAINTS t where t.OWNER = tblowner  and t.table_name = tblname and t.TYPE in ('P','U')
                  and t.CONSTRAINT_VALIDATION_QRY is null)
          loop
          update DIMGR.TABLE_CONSTRAINTS tt
              set T.CONSTRAINT_VALIDATION_QRY =
              (
                  select 'select count(*) from (SELECT '||t2.pkcolumns||', COUNT(*) FROM '|| t2.pkowner||'.'||t2.pktable_name||' group by '||t2.pkcolumns||' having count(*) > 1'||')'
                  from
                  (
                  select  A.OWNER pkowner, A.TABLE_NAME pktable_name,  A.CONSTRAINT_NAME pkconstraint_name, wmsys.wm_concat(B.COLUMN_NAME) as pkcolumns
                  from DIMGR.TABLE_CONSTRAINTS a join DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b on (A.OWNER = B.OWNER and A.TABLE_NAME = B.TABLE_NAME and  A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)
                  where
                  a.owner = r.owner  and a.table_name = r.table_name and a.constraint_name = r.constraint_name
                  group by A.OWNER, A.TABLE_NAME,  A.CONSTRAINT_NAME
                  ) t2
               )
               where
                       tt.OWNER = tblowner  and tt.table_name = tblname
          end loop;
      */
      IF (docommit = 1)
      THEN
         COMMIT;
      ELSE
         RETURN;
      END IF;
   END update_PKUK_valq_TabCons;

   PROCEDURE update_FK_valq_ITabCons (tblowner   IN VARCHAR2,
                                      tblname    IN VARCHAR2,
                                      docommit      INTEGER DEFAULT 0)
   IS
      CURSOR c_itcon
      IS
             SELECT *
               FROM DIMGR.INTER_TABLE_CONSTRAINTS t
              WHERE     t.OWNER = tblowner
                    AND t.table_name = tblname
                    AND t.TYPE IN ('R')
                    AND (
                                t.CONSTRAINT_VALIDATION_QRY IS NULL 
                                OR 
                                T.LAST_UPDATED = to_date('01/02/2011','dd/mm/yyyy')
                            )
         FOR UPDATE OF t.CONSTRAINT_VALIDATION_QRY;
   BEGIN
      -- loop table constraints of this table to update validation query
      FOR r IN c_itcon
      LOOP
         UPDATE DIMGR.INTER_TABLE_CONSTRAINTS tt
            SET tt.CONSTRAINT_VALIDATION_QRY =
                   (SELECT    'SELECT COUNT(*) FROM '
                           || t1.OWNER
                           || '.'
                           || t1.TABLE_NAME ||' a'
                           ||' LEFT OUTER JOIN '
                           || t2.pkowner
                           ||'.'
                           ||t2.pktable_name||' b'
                           ||' ON (a.'|| t1.columns||' =  b.'||t2.pkcolumns||')'
                           ||' WHERE '
                           ||'b.'||t2.pkcolumns||' IS NULL'
                      FROM (  SELECT A.OWNER,
                                     A.TABLE_NAME,
                                     A.CONSTRAINT_NAME,
                                     a.REF_PKOWNER,
                                     a.REF_PKTABLE_NAME,
                                     a.REF_PKCONSTRAINT_NAME,
                                     wmsys.wm_concat (B.COLUMN_NAME) AS columns
                                FROM    DIMGR.INTER_TABLE_CONSTRAINTS a
                                     JOIN
                                        DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS b
                                     ON (A.OWNER = B.OWNER
                                         AND A.TABLE_NAME = B.TABLE_NAME
                                         AND A.CONSTRAINT_NAME =
                                                B.CONSTRAINT_NAME)
                               WHERE     a.owner = r.owner
                                     AND a.table_name = r.table_name
                                     AND a.constraint_name = r.constraint_name
                            GROUP BY A.OWNER,
                                     A.TABLE_NAME,
                                     A.CONSTRAINT_NAME,
                                     a.REF_PKOWNER,
                                     a.REF_PKTABLE_NAME,
                                     a.REF_PKCONSTRAINT_NAME) t1,
                           (  SELECT A.OWNER pkowner,
                                     A.TABLE_NAME pktable_name,
                                     A.CONSTRAINT_NAME pkconstraint_name,
                                     wmsys.wm_concat (B.COLUMN_NAME)
                                        AS pkcolumns
                                FROM    DIMGR.TABLE_CONSTRAINTS a
                                     JOIN
                                        DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b
                                     ON (A.OWNER = B.OWNER
                                         AND A.TABLE_NAME = B.TABLE_NAME
                                         AND A.CONSTRAINT_NAME =
                                                B.CONSTRAINT_NAME)
                               WHERE A.TYPE IN ('P', 'U')
                            GROUP BY A.OWNER, A.TABLE_NAME, A.CONSTRAINT_NAME) t2
                     WHERE t1.ref_pkowner = t2.pkowner
                           AND t1.ref_pktable_name = t2.pktable_name
                           AND t1.ref_pkconstraint_name =
                                  t2.pkconstraint_name)
          WHERE CURRENT OF c_itcon;      
/*         UPDATE DIMGR.INTER_TABLE_CONSTRAINTS tt
            SET tt.CONSTRAINT_VALIDATION_QRY =
                   (SELECT    'SELECT COUNT(*) FROM '
                           || t1.OWNER
                           || '.'
                           || t1.TABLE_NAME
                           || ' where ('
                           || t1.columns
                           || ') not in (select '
                           || t2.pkcolumns
                           || ' from '
                           || t2.pkowner
                           || '.'
                           || t2.pktable_name
                           || ')'
                      FROM (  SELECT A.OWNER,
                                     A.TABLE_NAME,
                                     A.CONSTRAINT_NAME,
                                     a.REF_PKOWNER,
                                     a.REF_PKTABLE_NAME,
                                     a.REF_PKCONSTRAINT_NAME,
                                     wmsys.wm_concat (B.COLUMN_NAME) AS columns
                                FROM    DIMGR.INTER_TABLE_CONSTRAINTS a
                                     JOIN
                                        DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS b
                                     ON (A.OWNER = B.OWNER
                                         AND A.TABLE_NAME = B.TABLE_NAME
                                         AND A.CONSTRAINT_NAME =
                                                B.CONSTRAINT_NAME)
                               WHERE     a.owner = r.owner
                                     AND a.table_name = r.table_name
                                     AND a.constraint_name = r.constraint_name
                            GROUP BY A.OWNER,
                                     A.TABLE_NAME,
                                     A.CONSTRAINT_NAME,
                                     a.REF_PKOWNER,
                                     a.REF_PKTABLE_NAME,
                                     a.REF_PKCONSTRAINT_NAME) t1,
                           (  SELECT A.OWNER pkowner,
                                     A.TABLE_NAME pktable_name,
                                     A.CONSTRAINT_NAME pkconstraint_name,
                                     wmsys.wm_concat (B.COLUMN_NAME)
                                        AS pkcolumns
                                FROM    DIMGR.TABLE_CONSTRAINTS a
                                     JOIN
                                        DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b
                                     ON (A.OWNER = B.OWNER
                                         AND A.TABLE_NAME = B.TABLE_NAME
                                         AND A.CONSTRAINT_NAME =
                                                B.CONSTRAINT_NAME)
                               WHERE A.TYPE IN ('P', 'U')
                            GROUP BY A.OWNER, A.TABLE_NAME, A.CONSTRAINT_NAME) t2
                     WHERE t1.ref_pkowner = t2.pkowner
                           AND t1.ref_pktable_name = t2.pktable_name
                           AND t1.ref_pkconstraint_name =
                                  t2.pkconstraint_name)
          WHERE CURRENT OF c_itcon;
*/          
      END LOOP;

      IF (docommit = 1)
      THEN
         COMMIT;
      ELSE
         RETURN;
      END IF;
   END update_FK_valq_ITabCons;

   PROCEDURE update_null_valq_for_PKUKFK
   IS
   BEGIN
      -- first for PKs UKs
      FOR c1
         IN (SELECT *
               FROM DIMGR.TABLE_CONSTRAINTS t
              WHERE t.TYPE IN ('P', 'U')
                    AND t.CONSTRAINT_VALIDATION_QRY IS NULL)
      LOOP
         update_PKUK_valq_TabCons (c1.owner, c1.table_name);
      END LOOP;

      -- then for FKs
      FOR c2
         IN (SELECT *
               FROM DIMGR.INTER_TABLE_CONSTRAINTS t
              WHERE t.TYPE IN ('R') 
                                  AND (
                                t.CONSTRAINT_VALIDATION_QRY IS NULL 
                                OR 
                                T.LAST_UPDATED = to_date('01/02/2011','dd/mm/yyyy')
                                )
                )                                
      LOOP
         update_FK_valq_ITabCons (c2.owner, c2.table_name);
      END LOOP;

      COMMIT;
   END update_null_valq_for_PKUKFK;
   
    function is_valid_sql(
            sql_i IN  CLOB
      ) RETURN varchar2      
    IS
        l_c PLS_integer;
        l_sql varchar2(4000);
    BEGIN
        l_sql :=  dbms_lob.substr( sql_i, 4000, 1 );
        l_sql := replace(l_sql,';'); -- replace tralling ';'        
        l_c := dbms_sql.open_cursor; 
        DBMS_SQL.PARSE (
            c                      => l_c,
            statement         => l_sql,
            language_flag   => 1);
            
        DBMS_SQL.CLOSE_CURSOR(l_c);            
        RETURN 'OK';            
        EXCEPTION
            WHEN OTHERS THEN
                    DBMS_SQL.CLOSE_CURSOR(l_c);            
                    RETURN SQLERRM;           
    END is_valid_sql;            

    function is_valid_sql(
            sql_i IN  VARCHAR2
      ) RETURN varchar2      
    IS
        l_c PLS_integer;
        l_sql varchar2(4000);
    BEGIN
        l_sql :=  sql_i;
        l_sql := replace(l_sql,';'); -- replace tralling ';'
        l_c := dbms_sql.open_cursor; 
        DBMS_SQL.PARSE (
            c                      => l_c,
            statement         => l_sql,
            language_flag   => 1);
        DBMS_SQL.CLOSE_CURSOR(l_c);            
        RETURN 'OK';            
        EXCEPTION
            WHEN OTHERS THEN
                    DBMS_SQL.CLOSE_CURSOR(l_c);            
                    RETURN SQLERRM;           
    END is_valid_sql;            

    function constraint_type_desc (
            type_in VARCHAR2
            ) RETURN VARCHAR2
    IS
        l_desc dimgr.constraint_types.TYPE_DESC%TYPE;
    BEGIN
        select TYPE_DESC into l_desc from DIMGR.CONSTRAINT_TYPES where type =  type_in;
        return l_desc;
    END  constraint_type_desc;
        
               
END DIMGR_PKG;
/
