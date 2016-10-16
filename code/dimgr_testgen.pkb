CREATE OR REPLACE PACKAGE BODY DIMGR.DIMGR_TESTGEN 
AS

    PROCEDURE tupcons_notnull_for_pkuk_cols (
        owner_i              IN  VARCHAR2 DEFAULT NULL,
        table_type_i        IN   VARCHAR2 DEFAULT NULL,
        user_i                 IN   VARCHAR2    DEFAULT 'ADMIN'        
        )
        IS
        
        /* 
        columns participating in U,P, or generic unique (GU) constraints according to DI MGR repository
        */
      /* CURSOR l_cols_in_pkuk_cur IS 
                    -- columns participating in U,P, or generic unique (GU) constraints according to DI MGR repository 
            SELECT t1.owner, t1.table_name, t1.column_name
            FROM     DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS t1 
                            JOIN
                         DIMGR.TABLE_CONSTRAINTS t2 
                            ON (t1.owner = t2.owner and t1.table_name = t2.table_name and t1.constraint_name = t2.constraint_name)
                            JOIN
                         DIMGR.TABLES  t3
                            ON (t1.owner = t3.owner and t1.table_name = t3.table_name)       
            WHERE  
                t2.type in ('U','P','GU')
                and t1.owner = nvl(owner_i, t1.owner)
                and nvl(t3.table_type, 'lala') = nvl(table_type_i, nvl(t3.table_type, 'lala'));
         */              
        BEGIN
            --  MERGE into TUPLE_CONSTRAINTS
            MERGE INTO DIMGR.TUPLE_CONSTRAINTS trg
            using  (
                SELECT owner,
                         table_name,
                         tupcon_cons_name(owner, table_name, column_name) con_name,
                         'Not null or 0 surrogate key for column participating in UK or PK' con_desc,
                         tupcon_cons_chkcond_notnull(owner, table_name, column_name) chk_cond,
                         tupcon_cons_valq_notnull(owner, table_name, column_name) valq,
                         upper(user_i) appuser,
                         SYSDATE updt_date
                FROM (                                     
                                /* columns participating in U,P, or generic unique (GU) constraints according to DI MGR repository */
                    SELECT DISTINCT t1.owner, t1.table_name, t1.column_name
                    FROM     DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS t1 
                                    JOIN
                                 DIMGR.TABLE_CONSTRAINTS t2 
                                    ON (t1.owner = t2.owner and t1.table_name = t2.table_name and t1.constraint_name = t2.constraint_name)
                                    JOIN
                                 DIMGR.TABLES  t3
                                    ON (t1.owner = t3.owner and t1.table_name = t3.table_name)       
                    WHERE  
                        t2.type in ('U','P','GU')
                        and t1.owner = nvl(owner_i, t1.owner)
                        and nvl(t3.table_type, 'lala') = nvl(table_type_i, nvl(t3.table_type, 'lala'))
                    ORDER BY   t1.owner, t1.table_name, t1.column_name
                )            
            ) src
            ON (trg.owner = src.owner AND trg.table_name = src.table_name and trg.constraint_name = src. con_name )
            WHEN MATCHED THEN
                UPDATE 
                    SET     trg.constraint_desc = src.con_desc,
                               trg.constraint_check_condition = src.chk_cond,
                               trg.constraint_validation_qry = src.valq,
                               trg.last_updated_by = appuser,
                               trg.last_updated = src.updt_date      
            WHEN NOT MATCHED THEN
                INSERT   (
                   OWNER, TABLE_NAME, CONSTRAINT_NAME,
                   CONSTRAINT_DESC, CONSTRAINT_CHECK_CONDITION, CONSTRAINT_VALIDATION_QRY,
                   LAST_UPDATED_BY, LAST_UPDATED)
                VALUES (
                    src.owner,
                    src.table_name,
                    src.con_name,
                    src.con_desc,
                    src.chk_cond,
                    src.valq,
                    src.appuser,
                    src.updt_date
                    );                    
                                        
                    -- MERGE INTO TUPLE_CONSTRAINTS_REF_COLUMNS
            MERGE INTO  DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS trg
            USING (
                SELECT owner,
                         table_name,
                         tupcon_cons_name(owner, table_name, column_name) con_name,
                         column_name
                FROM (                                     
                                /* columns participating in U,P, or generic unique (GU) constraints according to DI MGR repository */
                    SELECT DISTINCT t1.owner, t1.table_name, t1.column_name
                    FROM     DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS t1 
                                    JOIN
                                 DIMGR.TABLE_CONSTRAINTS t2 
                                    ON (t1.owner = t2.owner and t1.table_name = t2.table_name and t1.constraint_name = t2.constraint_name)
                                    JOIN
                                 DIMGR.TABLES  t3
                                    ON (t1.owner = t3.owner and t1.table_name = t3.table_name)       
                    WHERE  
                        t2.type in ('U','P','GU')
                        and t1.owner = nvl(owner_i, t1.owner)
                        and nvl(t3.table_type, 'lala') = nvl(table_type_i, nvl(t3.table_type, 'lala'))
                    ORDER BY   t1.owner, t1.table_name, t1.column_name
                )                        
            ) src
            ON (trg.owner = src.owner AND trg.table_name = src.table_name and trg.constraint_name = src. con_name AND trg.column_name = src.column_name )
            WHEN NOT MATCHED THEN
                INSERT(
                   OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME
                )
                VALUES (
                    src.owner,
                    src.table_name,
                    src.con_name,
                    src.column_name                
                );
                
            COMMIT;                
        END tupcons_notnull_for_pkuk_cols;
        
    /* Formatted on 7/3/2011 2:00:37 μμ (QP5 v5.149.1003.31008) */
    FUNCTION tupcon_cons_name (
        owner_i         IN VARCHAR2,
        table_name_i    IN VARCHAR2,
        column_name_i   IN VARCHAR2
    ) RETURN VARCHAR2 
    IS
        l_cons_name      DIMGR.TUPLE_CONSTRAINTS.CONSTRAINT_NAME%TYPE;
    BEGIN
        l_cons_name :=  'tup_'
                        --||substr(owner_i,1,3)
                        --||'_'        
                        ||substr(table_name_i,1,3)||substr(table_name_i,-3)
                        ||'_'
                        ||column_name_i; --substr(column_name_i,1,5);
        RETURN upper(l_cons_name);
    END tupcon_cons_name;
    
    FUNCTION tupcon_cons_chkcond_notnull ( 
        owner_i              IN VARCHAR2,
        table_name_i      IN VARCHAR2,
        column_name_i   IN VARCHAR2
        )   RETURN CLOB
     IS
        l_chkcond   CLOB;
     BEGIN
     
        if (instr(upper(column_name_i), 'DATE') > 0) then -- this is a DATE field 
            l_chkcond :=  column_name_i || ' IS NOT NULL'
                            ||' OR '
                            ||column_name_i||'  <> to_date( ''1/1/2200'', ''dd/mm/yyyy'')';        
        ELSE
            l_chkcond :=  column_name_i || ' IS NOT NULL'
                            ||' OR '
                            ||column_name_i||'  > 0';
        END IF;                        
/*                        select *
                        from all_tab_columns
                        where owner = 'PRESENT_PERIF'
                        and  instr(upper(column_name), 'DATE') > 0
                        and data_type <> 'DATE'
*/                        
        RETURN l_chkcond;                        
     END  tupcon_cons_chkcond_notnull;
     
    FUNCTION tupcon_cons_valq_notnull (
        owner_i         IN VARCHAR2,
        table_name_i    IN VARCHAR2,
        column_name_i   IN VARCHAR2
      )   RETURN CLOB
      IS
        l_valq  CLOB;
      BEGIN
        l_valq :=   'SELECT COUNT(*) '
                    ||'FROM '
                    ||owner_i||'.'||table_name_i
                    ||' WHERE '
                    ||'         NOT( ' 
                    ||tupcon_cons_chkcond_notnull(owner_i, table_name_i, column_name_i) 
                    ||' )';
                    
        RETURN l_valq;                   
      END  tupcon_cons_valq_notnull;   
END DIMGR_TESTGEN;
/
