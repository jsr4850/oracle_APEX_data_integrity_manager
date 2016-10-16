/**
    This package will containt code that automatically generates DIMGR constraints and validation queries
    
    @author nkarag
*/
CREATE OR REPLACE PACKAGE DIMGR.DIMGR_TESTGEN 
AS

    /**
        @procedure tupcons_notnull_for_pkuk_cols    
        Generates the following tuple-level constraints for each column in the DIMGR partipcating in a PK, UK constraints: 
                "Not null or 0 surrogate key for column participating in UK or PK"
        These constraints are MERGE(ED) into DIMGR.TUPLE_CONSTRAINTS
        It includes also "general unique constraints" as these are defined in DI Manager, that is UKs that apply only to a subset of rows of the table.
        This routine applies to all tables  that are stored in DIMGR.TABLES table and NOT in the tables in the  DB catalog. Caution must be taken in
        the case that are tables that have not been imported in the DIMGR (use the corresponding views for this).          
        
        @param  owner_i               the schema of the tables where these constraints will  be applied. If NULL, the procedue will run for all available schemas in the DIMGR.
                                                 Default is NULL.
        @param  table_type_i        the constraint will be applied only to these type of tables (e.g. Facts, Dims, etc). Default value is NULL, meaning that it will be applied to all types
        @param user_i                   The user that will brcome the last_updater of the tuplr constraint. Default is ''ADMIN'
        
        @author nkarag
            
    */
    PROCEDURE tupcons_notnull_for_pkuk_cols (
        owner_i              IN  VARCHAR2 DEFAULT NULL,
        table_type_i        IN   VARCHAR2 DEFAULT NULL,
        user_i                 IN   VARCHAR2    DEFAULT 'ADMIN'
        );
        
        /**
        @function   tupcon_cons_name
        Returns a constraint name for a tuple constraint
            
        @param  owner_i               the schema of the table where the constraint is applied. Must not be null.
        @param  table_name_i       The table where this constraint will be applied. Must not be null
        @param user_i                   he user that will become the last_updater of the tuplr constraint. Must not be NULL
        
        @author nkarag
        */
        function tupcon_cons_name(
            owner_i IN  VARCHAR2, 
            table_name_i IN  VARCHAR2, 
            column_name_i IN  VARCHAR2
            ) RETURN VARCHAR2;

        /**
        @function   tupcon_cons_chkcond_notnull
        Returns a constraint name for a tuple constraint
            
        @param  owner_i               the schema of the table where the constraint is applied. Must not be null.
        @param  table_name_i       The table where this constraint will be applied. Must not be null
        @param user_i                   he user that will become the last_updater of the tuplr constraint. Must not be NULL
        
        @author nkarag
        */
        function tupcon_cons_chkcond_notnull(
            owner_i IN  VARCHAR2, 
            table_name_i IN  VARCHAR2, 
            column_name_i IN  VARCHAR2
            ) RETURN CLOB;


        /**
        @function   tupcon_cons_valq_notnull
        Returns a constraint name for a tuple constraint
            
        @param  owner_i               the schema of the table where the constraint is applied. Must not be null.
        @param  table_name_i       The table where this constraint will be applied. Must not be null
        @param user_i                   he user that will become the last_updater of the tuplr constraint. Must not be NULL
        
        @author nkarag
        */
        function tupcon_cons_valq_notnull(
            owner_i IN  VARCHAR2, 
            table_name_i IN  VARCHAR2, 
            column_name_i IN  VARCHAR2
            ) RETURN CLOB;
    
END DIMGR_TESTGEN;
/
