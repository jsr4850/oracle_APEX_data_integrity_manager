update dimgr.table_constraints a
    set     A.LAST_UPDATED_BY = 'UNISYSTEMS',
             A.LAST_UPDATED = to_date('01/02/2011', 'dd/mm/yyyy')
where
    A.LAST_UPDATED_BY is null
    and A.LAST_UPDATED is null;            
    
    
commit ;

update dimgr.inter_table_constraints a
    set     A.LAST_UPDATED_BY = 'UNISYSTEMS',
             A.LAST_UPDATED = to_date('01/02/2011', 'dd/mm/yyyy')
where
    A.LAST_UPDATED_BY is null
    and A.LAST_UPDATED is null;
    
commit;                

update dimgr.tuple_constraints a
    set     A.LAST_UPDATED_BY = 'UNISYSTEMS',
             A.LAST_UPDATED = to_date('01/02/2011', 'dd/mm/yyyy')
where
    A.LAST_UPDATED_BY is null
    and A.LAST_UPDATED is null;
    
commit;                


update dimgr.columns a
    set     A.LAST_UPDATED_BY = 'UNISYSTEMS',
             A.LAST_UPDATED = to_date('01/02/2011', 'dd/mm/yyyy')
where
    A.LAST_UPDATED_BY is null
    and A.LAST_UPDATED is null;
    
commit;

update dimgr.tables a
    set     A.IMPORTED_BY = 'UNISYSTEMS',
             A.IMPORT_DATE = to_date('01/02/2011', 'dd/mm/yyyy')
where
    A.IMPORTED_BY is null
    and A.IMPORT_DATE is null;
    
commit;                
                
    