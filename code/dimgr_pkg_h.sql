CREATE OR REPLACE PACKAGE DIMGR.DIMGR_PKG
AS
   /**
   scope: import a table from the db catalog into the dimgr schema.

   @params
       tblowner   owner of the table
       name    name of the table
       overwrite   string conatining the output of a checkbox indicating if some filed will be overwrited. In particular, the string is of the from:
                       '0:1:2', '0:2', etc. depending on which boxes have been checked. Table Comments --> 0,Column Comments --> 1,Column Check Constraints-->2
   @author nkarag
   */
   PROCEDURE import_table_from_db (tblowner    IN VARCHAR2,
                                   name        IN VARCHAR2,
                                   overwrite   IN VARCHAR2);

   /**
   scope: purge a table from the DIMGR repository

   @params
       tblowner   owner of the table
       name    name of the table
   @author nkarag
   */
   PROCEDURE purge_table_from_repository (tblowner   IN VARCHAR2,
                                          name       IN VARCHAR2);

   /**
   scope: update table COLUMNS from the corresponding apex from
   @params     column values of the row to be updated

   begin
   dimgr.DIMGR_PKG.update_tab_columns(
   OWNER => :P14_OWNER
   ,TABLE_NAME => :P14_TABLE_NAME
   ,COLUMN_NAME => :P14_COLUMN_NAME
   ,COLUMN_ID => :P14_COLUMN_ID
   ,DATA_TYPE => :P14_DATA_TYPE
   ,DATA_LENGTH => :P14_DATA_LENGTH
   ,DATA_PRECISION => :P14_DATA_PRECISION
   ,DATA_SCALE => :P14_DATA_SCALE
   ,COLUMN_DESC => :P14_COLUMN_DESC
   ,COLUMN_COMMENT => :P14_COLUMN_COMMENT
   ,NULLABLE => :P14_NULLABLE
   ,CONSTRAINT_DESC => :P14_CONSTRAINT_DESC
   ,CONSTRAINT_CHECK_CONDITION => :P14_CONSTRAINT_CHECK_CONDITION
   ,CONSTRAINT_VALIDATION_QRY => :P14_CONSTRAINT_VALIDATION_QRY
   ,CONSTRAINT_NAME => :P14_CONSTRAINT_NAME
   );
   end;

   */
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
                                 CONSTRAINT_NAME               VARCHAR2);

   PROCEDURE testhtml;

   /**
   scope: generate script (in html format) with DDL commands in order to update DB
   based on the rows of the DIMGR.COLUMNS table


   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
   */
   PROCEDURE genHTMLupdDBscriptFromColumns (tblowner   IN VARCHAR2,
                                            tblname    IN VARCHAR2);


   /**
   scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
   based on the rows of the DIMGR.COLUMNS table. The items updated are:
       1. column comments
       2. column not null constraints --> ONLY if the current constraint in all_tab_columns is different than the one recorded in
          DIMGR.COLUMNS.nullable
       3. Columns Check constraint

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           null_con_status     specifies the requested status of the NOT NULL constraint that will be created through the DDL.
                               0 --> NOT NULL will be enabled and validated
                               1 --> NOT NULL will be enabled but novalidate
                               2 --> NOT NULL will be disabled
           check_con_status    specifies the requested status of the CHECK constraint that will be created through the DDL.
                               0 --> NOT NULL will be enabled and validated
                               1 --> NOT NULL will be enabled but novalidate
                               2 --> NOT NULL will be disabled

   */
   PROCEDURE genupdDBscriptFromColumns (tblowner           IN VARCHAR2,
                                        tblname            IN VARCHAR2,
                                        null_con_status    IN NUMBER,
                                        check_con_status   IN NUMBER);

   /**
   scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
   based on the rows of the DIMGR.TUPLE_CONSTRAINTS table. The items updated are:
           1. Columns Check constraint

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           check_con_status    specifies the requested status of the CHECK constraint that will be created through the DDL.
                               0 --> check con will be enabled and validated
                               1 --> check con will be enabled but novalidate
                               2 --> check con will be disabled

   */
   PROCEDURE genupdDBscriptFromTupCons (tblowner           IN VARCHAR2,
                                        tblname            IN VARCHAR2,
                                        check_con_status   IN NUMBER);

   /**
   scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
   based on the rows of the DIMGR.TABLE_CONSTRAINTS table. The items updated are:
           1. PK and UK constraints

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           tab_con_status    specifies the requested status of the PK or UK  constraint that will be created through the DDL.
                               0 --> check con will be enabled and validated
                               1 --> check con will be enabled but novalidate
                               2 --> check con will be disabled

   */
   PROCEDURE genupdDBscriptFromTabCons (tblowner         IN VARCHAR2,
                                        tblname          IN VARCHAR2,
                                        tab_con_status   IN NUMBER);

   /**
   scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
   based on the rows of the DIMGR.INTER_TABLE_CONSTRAINTS table. The items updated are:
           1. FK constraints

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           tab_con_status    specifies the requested status of the PK or UK  constraint that will be created through the DDL.
                               0 --> check con will be enabled and validated
                               1 --> check con will be enabled but novalidate
                               2 --> check con will be disabled
   */
   PROCEDURE genupdDBscriptFromInterTabCons (tblowner         IN VARCHAR2,
                                             tblname          IN VARCHAR2,
                                             tab_con_status   IN NUMBER);


   /**
   scope: generate script (insert as separate lines in output table) with DI validation test queries
   based on the rows of the DIMGR.COLUMNS table.

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           resowner    schema of the table that will record the results
           restable    name of the table that will record the resutls.

   */
   PROCEDURE genDIvalscriptFromColumns (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      resowner   IN VARCHAR2 DEFAULT 'DIMGR',
      restable   IN VARCHAR2 DEFAULT 'DIRESULTS');

   /**
   scope: generate script (insert as separate lines in output table) with DI validation test queries
   based on the rows of the DIMGR.TUPLE_CONSTRAINTS table.

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           resowner    schema of the table that will record the results
           restable    name of the table that will record the resutls.
           p_user       name of the appl user who created the constraint. It can be used as a filter for constraints. Default value NULL
           p_updated_from   string in dd/mm/yyyy fromat representing the constraint last update date. It can be used as a filter for constraints. Default value NULL
           p_updated_to   sttring in dd/mm/yyyy fromat representing constraint last update date. It can be used as a filter for constraints. Default value NULL
           p_include_only_failed_flg    flag to denote if we need ot generate only those scripts corresponding to validation scripts that have failed. Values (0, 1) (include all, include only failed)
                                                    Default is 0. any value <> 0 will result in filtering the generated scirpts           
   */
   PROCEDURE genDIvalscriptFromTupCons (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      resowner   IN VARCHAR2 DEFAULT 'DIMGR',
      restable   IN VARCHAR2 DEFAULT 'DIRESULTS',
      p_user                IN  VARCHAR2 DEFAULT NULL,
      p_updated_from  IN VARCHAR2 DEFAULT NULL,
      p_updated_to  IN VARCHAR2 DEFAULT NULL,
      p_include_only_failed_flg  IN integer DEFAULT 0      
      );

   /**
   scope: generate script (insert as separate lines in output table) with DI validation test queries
   based on the rows of the DIMGR.TABLE_CONSTRAINTS table.

   @param  owner in  owner of the table for which validation scripts will be generated
           table_name  name of the table for which validation scripts will be generated
           resowner    schema of the table that will record the results
           restable    name of the table that will record the resutls.
           p_user       name of the appl user who created the constraint. It can be used as a filter for constraints. Default value NULL
           p_updated_from   string in dd/mm/yyyy fromat representing the constraint last update date. It can be used as a filter for constraints. Default value NULL
           p_updated_to   sttring in dd/mm/yyyy fromat representing constraint last update date. It can be used as a filter for constraints. Default value NULL
           p_include_only_failed_flg    flag to denote if we need ot generate only those scripts corresponding to validation scripts that have failed. Values (0, 1) (include all, include only failed)
                                                    Default is 0. any value <> 0 will result in filtering the generated scirpts
           p_constraint_type    filters the type of i constraint. Default value is null                                                    

   */
   PROCEDURE genDIvalscriptFromTablCons (
      tblowner             IN VARCHAR2,
      tblname              IN VARCHAR2,
      resowner            IN VARCHAR2 DEFAULT 'DIMGR',
      restable              IN VARCHAR2 DEFAULT 'DIRESULTS',
      p_user                IN  VARCHAR2 DEFAULT NULL,
      p_updated_from  IN VARCHAR2 DEFAULT NULL,
      p_updated_to  IN VARCHAR2 DEFAULT NULL,
      p_include_only_failed_flg  IN integer DEFAULT 0,
      p_constraint_type IN  VARCHAR2    DEFAULT NULL      
      );

   /**
   scope: generate script (insert as separate lines in output table) with DI validation test queries
   based on the rows of the DIMGR.INTER_TABLE_CONSTRAINTS table.

   @param  owner in  owner of the table to be updated
           table_name  name of the table to be updated
           resowner    schema of the table that will record the results
           restable    name of the table that will record the resutls.
           p_user       name of the appl user who created the constraint. It can be used as a filter for constraints. Default value NULL
           p_updated_from   string in dd/mm/yyyy fromat representing the constraint last update date. It can be used as a filter for constraints. Default value NULL
           p_updated_to   sttring in dd/mm/yyyy fromat representing constraint last update date. It can be used as a filter for constraints. Default value NULL
           p_include_only_failed_flg    flag to denote if we need ot generate only those scripts corresponding to validation scripts that have failed. Values (0, 1) (include all, include only failed)
                                                    Default is 0. any value <> 0 will result in filtering the generated scirpts
           p_constraint_type    filters the type of i constraint. Default value is null                                                    
           
   */
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
      );


   /**
       Scope: gets the current status for the null constraint for a specific column

       return: 'Y' if columns is nullable, 'N' if it is not
   */
   FUNCTION get_nullable_status (tblowner   IN VARCHAR2,
                                 tblname    IN VARCHAR2,
                                 colname    IN VARCHAR2)
      RETURN VARCHAR2;

   /**
       Scope: drop existing check constraints fro the specified column

   */
   PROCEDURE drop_existing_check_cons (tblowner   IN VARCHAR2,
                                       tblname    IN VARCHAR2,
                                       colname    IN VARCHAR2 DEFAULT NULL);


   /**
       Scope: drop existing check constraints fro the specified column
       It does NOT perform the drop, instead it returns the result through
       a table function in the from of DDL commands with the drop constraint commands

       if colname is null then drop all check constraints of the specified table
   */
   FUNCTION drop_existing_check_cons_tfunc (
      tblowner   IN VARCHAR2,
      tblname    IN VARCHAR2,
      colname    IN VARCHAR2 DEFAULT NULL)
      RETURN output_table_typ
      PIPELINED;


   /**
       Scope: drop existing PK/UK constraints for the specified table
       It does NOT perform the drop, instead it returns the result through
       a table function in the from of DDL commands with the drop constraint commands

   */
   FUNCTION drop_existing_pkuk_cons_tfunc (tblowner   IN VARCHAR2,
                                           tblname    IN VARCHAR2)
      RETURN output_table_typ
      PIPELINED;

   /**
       Scope: drop existing FK constraints for the specified table
       It does NOT perform the drop, instead it returns the result through
       a table function in the from of DDL commands with the drop constraint commands

   */
   FUNCTION drop_existing_fk_cons_tfunc (tblowner   IN VARCHAR2,
                                         tblname    IN VARCHAR2)
      RETURN output_table_typ
      PIPELINED;


   /**
       scope return the ddl to create the result table for DI validation scripts
   */
   FUNCTION create_result_table_stmnt (tblowner   IN VARCHAR2,
                                       tblname    IN VARCHAR2)
      RETURN VARCHAR2;

   /**
       scope  create the result table for DI validation scripts
   */
   PROCEDURE create_result_table (tblowner IN VARCHAR2, tblname IN VARCHAR2);



   /**
       scope: return in a string the columns of the DI validation result tables. Columns are ordered bu column_id
   */
   FUNCTION get_result_table_columns (tblowner   IN VARCHAR2,
                                      tblname    IN VARCHAR2)
      RETURN VARCHAR2;

   /**
    update PK/UK validation query for a specific table in table_constraints
    by default it does not commit (docommit = 0) in order to commit you must pass docommit = 1
   */
   PROCEDURE update_PKUK_valq_TabCons (tblowner   IN VARCHAR2,
                                       tblname    IN VARCHAR2,
                                       docommit      INTEGER DEFAULT 0);

   /**
    update FK validation query for a specific table in inter_table_constraints
    by default it does not commit (docommit = 0) in order to commit you must pass docommit = 1
   */
   PROCEDURE update_FK_valq_ITabCons (tblowner   IN VARCHAR2,
                                      tblname    IN VARCHAR2,
                                      docommit      INTEGER DEFAULT 0);

   /**
    update null validation queries for PK UK and FK constraints
   */
   PROCEDURE update_null_valq_for_PKUKFK;
   
        /**
        @function    is_valid_sql
        Returns if an SQL statement is valid or not
            
        @sql_i               the SQL statement

        Accepts up to 4000 bytes SQL statements.
        Returns 'OK'  if the SQL is OK. OK means that it was parsed successfully by DBMS_SQL.parse. Else it return  an ORacle
        error message.                
        @author nkarag
        */
        function is_valid_sql(
            sql_i IN  CLOB 
            ) RETURN varchar2;

        /**
        @function    is_valid_sql (overloaded to work with VARCHAR2)
        Returns if an SQL statement is valid or not
            
        @sql_i               the SQL statement

        Accepts up to 4000 bytes SQL statements.
        Returns 'OK'  if the SQL is OK. OK means that it was parsed successfully by DBMS_SQL.parse. Else it return  an ORacle
        error message.                
        @author nkarag
        */
        function is_valid_sql(
            sql_i IN  VARCHAR2 
            ) RETURN varchar2;

        /**
          Returns the constraint type description from the CONSTRAINT_TYPES table.
        */
        function constraint_type_desc (
            type_in VARCHAR2
            ) RETURN VARCHAR2; 
  
END DIMGR_PKG;
/
