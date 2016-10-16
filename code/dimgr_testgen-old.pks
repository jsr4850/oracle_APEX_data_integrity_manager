CREATE OR REPLACE PACKAGE DIMGR.DIMGR_TESTGEN 
AS

    /**
        @procedure tupcons_notnull_for_pkuk_cols    
        Generates the following tuple-level constraints: Not null or 0 surrogate key for columns participating in UK or PK.
        It includes also "general unique constraints" as these are defined in DI Manager, that is UKs that apply only to a subset of rows of the table.
        This routine applies to all tables of the specified schema (owner_i parameter) that are stored in DIMGR.TABLES table and not in the tables in the
        DB catalog.          
        
        @param  owner_i               the schema of the tables where these constraints will  be applied. If NULL, the procedue will run for all available schemas in the DB.
                                                 Default is NULL.
        @param  table_type_i        the constraint will be applied only to these type of tables (e.g. Facts, Dims, etc). Default value is NULL, meaning that it will be applied to all types
        @allow_missing_tabs_i       If 'Y' it allows tables to be missing in the DIMGR.TABLES compared to ALL_TABLES for the specific OWNER. If 'N', it throws an exception. Default is 'Y'.
        @allow_missing_cols_i       If 'Y' it allows columns to be missing in the DIMGR.COLUMNS compared to ALL_TAB_COLUMNS for the imported tables (i.e., in DIMGR.TABLES) 
                                                of the specific OWNER. If 'N', it throws an exception. Default is 'Y'.
        
        @author nkarag
            
    */
    PROCEDURE tupcons_notnull_for_pkuk_cols (
        owner_i              IN  VARCHAR2 DEFAULT NULL,
        table_type_i        IN   VARCHAR2 DEFAULT NULL,
        allow_missing_tabs_i    IN  VARCHAR2    DEFAULT 'Y',
        allow_missing_cols_i    IN  VARCHAR2   DEFAULT 'Y'
        );
    
END DIMGR_TESTGEN;
/
