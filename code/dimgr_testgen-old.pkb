CREATE OR REPLACE PACKAGE BODY DIMGR.DIMGR_TESTGEN 
AS

    PROCEDURE tupcons_notnull_for_pkuk_cols (
        owner_i              IN  VARCHAR2 DEFAULT NULL,
        table_type_i        IN   VARCHAR2 DEFAULT NULL,
        allow_missing_tabs_i    IN  VARCHAR2    DEFAULT 'Y',
        allow_missing_cols_i    IN  VARCHAR2    DEFAULT 'Y'
        )
        IS
        
        /* superset of :
        columns participating in U,P, or generic unique (GU) constraints according to DI MGR repository
        union
        columns participating in U,P constraints according to Data Dictionary */
       CURSOR l_cols_in_pkuk_cur IS 
                    /* columns participating in U,P, or generic unique (GU) constraints according to DI MGR repository */
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
                and nvl(t3.table_type, 'lala') = nvl(table_type_i, nvl(t3.table_type, 'lala'))
            UNION
            /* columns participating in U,P constraints according to Data Dictionary */
            select t1.owner, t1.table_name, t1.column_name
            from all_cons_columns t1
                    JOIN
                    all_constraints t2
                         ON (t1.owner = t2.owner and t1.table_name = t2.table_name and t1.constraint_name = t2.constraint_name)    
            where
                t2.constraint_type in ('U', 'P')             
                and t1.owner = nvl(owner_i, t1.owner)
                and nvl(table_type_i, 'lala') = 'lala'; -- if table_type_i is not NULL then the 2nd part of the union must not return any results
                
        BEGIN
            null;
        END tupcons_notnull_for_pkuk_cols;
        


END DIMGR_TESTGEN;
/
