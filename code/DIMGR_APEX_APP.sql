set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
 
--application/set_environment
prompt  APPLICATION 112 - DI_MGR
--
-- Application Export:
--   Application:     112
--   Name:            DI_MGR
--   Date and Time:   12:16 Thursday March 10, 2011
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Application Export
--   Version: 3.0.1.00.08
 
-- Import:
--   Using application builder
--   or
--   Using SQL*Plus as the Oracle user FLOWS_030000 or as the owner (parsing schema) of the application.
 
-- Application Statistics:
--   Pages:                11
--     Items:              95
--     Computations:       34
--     Validations:        30
--     Processes:          50
--     Regions:            23
--     Buttons:            37
--   Shared Components
--     Breadcrumbs:         1
--        Entries           1
--     Items:               1
--     Computations:        0
--     Processes:           0
--     Parent Tabs:         0
--     Tab Sets:            1
--        Tabs:             5
--     NavBars:             1
--     Lists:               0
--     Shortcuts:           2
--     Themes:              1
--     Templates:
--        Page:             9
--        List:            14
--        Report:           7
--        Label:            5
--        Region:          21
--     Messages:            0
--     Build Options:       0
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user FLOWS_030000 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>3662311264026106);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en-gb'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2007.01.08');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := 112;
   wwv_flow_api.g_id_offset := 0;
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(112);
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(112);
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => 112,
  p_display_id=> 112,
  p_owner => 'DIMGR',
  p_name  => 'DI_MGR',
  p_alias => 'F112',
  p_page_view_logging => 'YES',
  p_default_page_template=> 5772012640395541 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=> 5772212785395542 + wwv_flow_api.g_id_offset,
  p_default_region_template=> 5774016796395557 + wwv_flow_api.g_id_offset,
  p_error_template    => 5772012640395541 + wwv_flow_api.g_id_offset,
  p_page_protection_enabled_y_n=> 'N',
  p_checksum_salt_last_reset => '20110310121131',
  p_home_link         => 'f?p=&APP_ID.:import_table:&SESSION.',
  p_box_width         => '98%',
  p_flow_language     => 'en-us',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_flow_image_prefix => '/i/',
  p_documentation_banner=> '',
  p_authentication    => 'CUSTOM2',
  p_login_url         => '',
  p_logout_url        => 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_application_tab_set=> 1,
  p_public_url_prefix => '',
  p_public_user       => 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server      => '',
  p_cust_authentication_process=> '.'||to_char(5778518972395617 + wwv_flow_api.g_id_offset)||'.',
  p_cust_authentication_page=> '',
  p_custom_auth_login_url=> '',
  p_flow_version      => 'release 1.0',
  p_flow_status       => 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> '',
  p_build_status      => 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_vpd               => '',
  p_theme_id => 16,
  p_default_label_template => 5777312003395583 + wwv_flow_api.g_id_offset,
  p_default_report_template => 5776906238395575 + wwv_flow_api.g_id_offset,
  p_default_list_template => 5775706564395567 + wwv_flow_api.g_id_offset,
  p_default_menu_template => 5777512517395583 + wwv_flow_api.g_id_offset,
  p_default_button_template => 5772529788395549 + wwv_flow_api.g_id_offset,
  p_default_chart_template => 5773101257395556 + wwv_flow_api.g_id_offset,
  p_default_form_template => 5773519023395556 + wwv_flow_api.g_id_offset,
  p_default_wizard_template => 5774603403395557 + wwv_flow_api.g_id_offset,
  p_default_tabform_template => 5774016796395557 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>5774016796395557 + wwv_flow_api.g_id_offset,
  p_default_menur_template => 5772927293395556 + wwv_flow_api.g_id_offset,
  p_default_listr_template => 5774016796395557 + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss=> '20110310121131',
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id             => 5778805242395624 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_icon_sequence  => 200,
  p_icon_image     => '',
  p_icon_subtext   => 'Logout',
  p_icon_target    => 'f?p=&APP_ID.:LOGIN:&SESSION.::&DEBUG.::::',
  p_icon_image_alt => 'Logout',
  p_icon_height    => 32,
  p_icon_width     => 32,
  p_icon_height2   => 24,
  p_icon_width2    => 24,
  p_icon_bar_disp_cond      => '',
  p_icon_bar_disp_cond_type => 'CURRENT_LOOK_IS_1',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
--application/shared_components/logic/application_items/fsp_after_login_url
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 5785325028396130 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FSP_AFTER_LOGIN_URL',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_item_comment=> '');
 
null;
 
end;
/

prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/standard/t_import_table
wwv_flow_api.create_tab (
  p_id=> 5791114284934360 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 20,
  p_tab_name=> 'T_IMPORT TABLE',
  p_tab_text => 'Import Table from DB',
  p_tab_step => 3,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_column_level_constraints
wwv_flow_api.create_tab (
  p_id=> 5830217987245357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 30,
  p_tab_name=> 'T_COLUMN-LEVEL CONSTRAINTS',
  p_tab_text => 'Column-level Constraints',
  p_tab_step => 2,
  p_tab_also_current_for_pages => '12,14',
  p_tab_parent_tabset=>'',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_tuple_level_constraints
wwv_flow_api.create_tab (
  p_id=> 5832908006259421 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 40,
  p_tab_name=> 'T_TUPLE-LEVEL CONSTRAINTS',
  p_tab_text => 'Tuple-level Constraints',
  p_tab_step => 7,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_table_level_constraints
wwv_flow_api.create_tab (
  p_id=> 5835828880276238 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 50,
  p_tab_name=> 'T_TABLE-LEVEL CONSTRAINTS',
  p_tab_text => 'Table-level Constraints',
  p_tab_step => 4,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_inter_table_constraints
wwv_flow_api.create_tab (
  p_id=> 6934801102529933 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 70,
  p_tab_name=> 'T_INTER-TABLE CONSTRAINTS',
  p_tab_text => 'Inter-Table Constraints',
  p_tab_step => 8,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/constraint_status_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 6063802555448194 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CONSTRAINT_STATUS_LOV',
  p_lov_query=> '.'||to_char(6063802555448194 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6064113545448200 + wwv_flow_api.g_id_offset,
  p_lov_id=>6063802555448194 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'ENABLE VALIDATE',
  p_lov_return_value=>'0',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6064311127448224 + wwv_flow_api.g_id_offset,
  p_lov_id=>6063802555448194 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'ENABLE NOVALIDATE',
  p_lov_return_value=>'1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6064530248448224 + wwv_flow_api.g_id_offset,
  p_lov_id=>6063802555448194 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'DISABLE',
  p_lov_return_value=>'2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/constraint_types_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 6348329262022764 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CONSTRAINT_TYPES_LOV',
  p_lov_query=> 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/dblinks_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 12536922553034056 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'DBLINKS_LOV',
  p_lov_query=> 'select db_link d, db_link r'||chr(10)||
'from   all_db_links'||chr(10)||
'where owner in (''PUBLIC'', ''DIMGR'') and db_link like ''%TEST%'''||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/dimgr_users_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 12932313336085399 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'DIMGR_USERS_LOV',
  p_lov_query=> 'select user_name d, user_name r'||chr(10)||
'from APEX_WORKSPACE_APEX_USERS a'||chr(10)||
'where'||chr(10)||
'    A.WORKSPACE_NAME = ''OTE_TEAM_WS'''||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/inter_table_constraint_types_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 12258331915335586 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'INTER_TABLE_CONSTRAINT_TYPES_LOV',
  p_lov_query=> 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'where type in (''R'', ''ITC'')'||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/local_owners_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 5918022459190081 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOCAL_OWNERS_LOV',
  p_lov_query=> 'select distinct owner d, owner r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/owner_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 5803026580058987 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'OWNER_LOV',
  p_lov_query=> 'select distinct owner d,  owner r'||chr(10)||
'from   all_tables'||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/report_row_per_page
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 5780020629395694 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'Report Row Per Page',
  p_lov_query=> '.'||to_char(5780020629395694 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780115411395701 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'10',
  p_lov_return_value=>'10',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780209841395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'15',
  p_lov_return_value=>'15',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780318046395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>30,
  p_lov_disp_value=>'20',
  p_lov_return_value=>'20',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780403933395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>40,
  p_lov_disp_value=>'30',
  p_lov_return_value=>'30',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780513932395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>50,
  p_lov_disp_value=>'50',
  p_lov_return_value=>'50',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780619185395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>60,
  p_lov_disp_value=>'100',
  p_lov_return_value=>'100',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780717702395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>70,
  p_lov_disp_value=>'200',
  p_lov_return_value=>'200',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780806273395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>80,
  p_lov_disp_value=>'500',
  p_lov_return_value=>'500',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5780916915395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>90,
  p_lov_disp_value=>'1000',
  p_lov_return_value=>'1000',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>5781006914395709 + wwv_flow_api.g_id_offset,
  p_lov_id=>5780020629395694 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>100,
  p_lov_disp_value=>'5000',
  p_lov_return_value=>'5000',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/tables_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 5800613028026612 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'TABLES_LOV',
  p_lov_query=> 'select table_name d, table_name r'||chr(10)||
'from   all_tables'||chr(10)||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/table_constraint_types_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 12256809680326320 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'TABLE_CONSTRAINT_TYPES_LOV',
  p_lov_query=> 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'where type in (''U'', ''P'', ''TC'', ''GU'')'||chr(10)||
'order by 1');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00002
prompt  ...PAGE 2: COL_CONSTRAINTS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 2,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'COL_CONSTRAINTS',
  p_alias  => 'COL_CONSTRAINTS',
  p_step_title=> 'COLUMN LEVEL CONSTRAINTS',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'NO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110303134644',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5875002276414828 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'select a table',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''edit'', "OWNER" as TBLOWNER, '||chr(10)||
'"TABLE_NAME",'||chr(10)||
'"COLUMN_ID",'||chr(10)||
'"COLUMN_NAME",'||chr(10)||
'"DATA_TYPE",'||chr(10)||
'"DATA_LENGTH",'||chr(10)||
'"DATA_PRECISION",'||chr(10)||
'"DATA_SCALE",'||chr(10)||
'"COLUMN_DESC",'||chr(10)||
'"COLUMN_COMMENT",'||chr(10)||
'"NULLABLE",'||chr(10)||
'"CONSTRAINT_DESC",'||chr(10)||
'"CONSTRAINT_CHECK_CONDITION",'||chr(10)||
'"CONSTRAINT_VALIDATION_QRY",'||chr(10)||
'"CONSTRAINT_NAME",'||chr(10)||
'LAST_UPDATED_BY,'||chr(10)||
'LAST_UPDATED'||chr(10)||
'from "#OWNER#"."COLUMNS" a'||chr(10)||
'where '||chr(10)||
'--owner = :P2_OWNERS AND table_name ';

s:=s||'= :P2_SELECT_TABLE '||chr(10)||
'   a.owner = decode(:P2_OWNERS, ''%null%'',a.owner,:P2_OWNERS) '||chr(10)||
'   and a.table_name = decode(:P2_SELECT_TABLE, ''%null%'', a.table_name, :P2_SELECT_TABLE)'||chr(10)||
'   and nvl(constraint_desc, ''lala'') =  '||chr(10)||
'    case when :P2_SHOW_ONLY_CON_COLUMNS = ''Y'' '||chr(10)||
'        then nvl(constraint_desc, ''lolo'')'||chr(10)||
'        else nvl(constraint_desc, ''lala'')'||chr(10)||
'    end'||chr(10)||
'order by 2,3,5'||chr(10)||
'  '||chr(10)||
'';

wwv_flow_api.create_report_region (
  p_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_name=> 'Available Column Constraints',
  p_region_name=>'',
  p_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 11,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_query_row_template=> 5776906238395575+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'Y',
  p_csv_output_link_text=> 'Save as CSV',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_exp_filename=> 'column_constraints.csv',
  p_plug_query_exp_separator=> ';',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5934314147537774 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> '''EDIT''',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Edit',
  p_column_link=>'f?p=&APP_ID.:FORM_ON_COLUMNS:&SESSION.::&DEBUG.::P14_OWNER,P14_TABLE_NAME,P14_COLUMN_NAME:#TBLOWNER#,#TABLE_NAME#,#COLUMN_NAME#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="Edit">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6106328129046550 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'TBLOWNER',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tblowner',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887305564475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Table Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'TABLE_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887401749475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COLUMN_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Column Id',
  p_column_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'COLUMN_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887519601475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COLUMN_NAME',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Column Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'COLUMN_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887613333475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'DATA_TYPE',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Data Type',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'DATA_TYPE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887704734475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'DATA_LENGTH',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Data Length',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'DATA_LENGTH',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887809094475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DATA_PRECISION',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Data Precision',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'DATA_PRECISION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5887909206475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'DATA_SCALE',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Data Scale',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'DATA_SCALE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5888017284475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COLUMN_DESC',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Column Desc',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'COLUMN_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5888124629475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COLUMN_COMMENT',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Column Comment',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'COLUMN_COMMENT',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5909630539881844 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'NULLABLE',
  p_column_display_sequence=> 16,
  p_column_heading=> 'Nullable',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5888312590475836 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_DESC',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Constraint Desc',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'CONSTRAINT_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5888422812475837 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_CHECK_CONDITION',
  p_column_display_sequence=> 13,
  p_column_heading=> 'Constraint Check Condition',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'CONSTRAINT_CHECK_CONDITION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5888513988475837 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_display_sequence=> 14,
  p_column_heading=> 'Constraint Validation Qry',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5888601303475837 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_NAME',
  p_column_display_sequence=> 15,
  p_column_heading=> 'Constraint Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'COLUMNS',
  p_ref_column_name=> 'CONSTRAINT_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12303205695979165 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED_BY',
  p_column_display_sequence=> 17,
  p_column_heading=> 'Last Updated By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12303310376979166 + wwv_flow_api.g_id_offset,
  p_region_id=> 5886900823475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED',
  p_column_display_sequence=> 18,
  p_column_heading=> 'Last Updated',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
''||chr(10)||
'if :P2_GEN_DB_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P2_OWNERS, :P2_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 5924929104371781 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Generate DB Update Script  for Column Comments, NOT NULL Constraints and Column Check Constraints',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
''||chr(10)||
'if :P2_GEN_DI_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P2_OWNERS, :P2_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 5925819885378591 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Generate DI Validation Scripts',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 31,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6036517449634084 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 10,
  p_button_plug_id => 5924929104371781+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DB_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DB Update Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6094519565750747 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 20,
  p_button_plug_id => 5925819885378591+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DI_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DI Validation Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>5877630457432396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ID.:COL_CONSTRAINTS:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST in (''P2_OWNERS'', ''P2_SELECT_TABLE'')',
  p_branch_comment=> 'Created 04-AUG-2010 16:18 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>6036806346634085 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&FLOW_ID.:COL_CONSTRAINTS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6036517449634084+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6094828422750749 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&FLOW_ID.:COL_CONSTRAINTS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6094519565750747+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>12513825260804737 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ID.:2:&SESSION.:P2_SHOW_ONLY_CON_COLUMNS:&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST in (''P2_SHOW_ONLY_CON_COLUMNS'')',
  p_branch_comment=> 'Created 25-FEB-2011 15:41 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5875309988414832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_OWNERS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 21,
  p_item_plug_id => 5875002276414828+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owners',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'LOCAL_OWNERS_LOV',
  p_lov => 'select distinct owner d, owner r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Select a table Owner',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5875529065414833 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_SELECT_TABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 22,
  p_item_plug_id => 5875002276414828+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select Table',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select table_name d, table_name r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'where owner = :P2_OWNERS'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select a table',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6047115296078203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_GEN_DB_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 53,
  p_item_plug_id => 5924929104371781+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6065329913456064 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_NOT_NULL_STATUS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 54,
  p_item_plug_id => 5924929104371781+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '1',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Not Null Status',
  p_source_type=> 'STATIC',
  p_display_as=> 'RADIOGROUP',
  p_named_lov=> 'CONSTRAINT_STATUS_LOV',
  p_lov => '.'||to_char(6063802555448194 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6081430256974887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CHECK_CON_STATUS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 5924929104371781+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '1',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Check Constraint Status',
  p_source_type=> 'STATIC',
  p_display_as=> 'RADIOGROUP',
  p_named_lov=> 'CONSTRAINT_STATUS_LOV',
  p_lov => '.'||to_char(6063802555448194 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6092228307734258 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_GEN_DI_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 65,
  p_item_plug_id => 5925819885378591+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '0',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6098403682774471 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_RESTABLE_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 75,
  p_item_plug_id => 5925819885378591+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIMGR',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Owner',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6099523075780128 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_RESTABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 85,
  p_item_plug_id => 5925819885378591+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIRESULTS',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12511813223782284 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_SHOW_ONLY_CON_COLUMNS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 5875002276414828+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'N',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Show Only Constrained Columns',
  p_source_type=> 'STATIC',
  p_display_as=> 'RADIOGROUP_WITH_SUBMIT',
  p_lov => 'STATIC:No;N,Yes;Y',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6052321492127273 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 20,
  p_computation_item=> 'P2_GEN_DB_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6093317703740664 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 20,
  p_computation_item=> 'P2_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6048014388087359 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 10,
  p_computation_item=> 'P2_GEN_DB_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6096218311759783 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 20,
  p_computation_item=> 'P2_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DI_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13215511564950632 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 60,
  p_computation_item=> 'P2_RESTABLE_OWNER',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P2_RESTABLE_OWNER)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13216900613956877 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 70,
  p_computation_item=> 'P2_RESTABLE_NAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P2_RESTABLE_NAME)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'dimgr.DIMGR_PKG.genupdDBscriptFromColumns('||chr(10)||
':P2_OWNERS, :P2_SELECT_TABLE, :P2_NOT_NULL_STATUS, :P2_CHECK_CON_STATUS);'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6061915781931565 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'genarate_update_db_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in generating update DB script',
  p_process_when=>':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'update DB script generated successfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'dimgr.DIMGR_PKG.genDIvalscriptFromColumns('||chr(10)||
':P2_OWNERS, :P2_SELECT_TABLE, :P2_RESTABLE_OWNER, :P2_RESTABLE_NAME);'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6100813294796231 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Gen_DI_validation_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in generating DI validation script!',
  p_process_when=>':REQUEST in (''GENERATE_DI_SCRIPT'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'DI validation script generated successfully!',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00003
prompt  ...PAGE 3: import_table
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''Do you really want to purge this table from the repository?'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>';

wwv_flow_api.create_page(
  p_id     => 3,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'import_table',
  p_alias  => 'IMPORT_TABLE',
  p_step_title=> 'import table',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'NO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110225195554',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>3,p_text=>ph);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5801202077032982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'select a table to import',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select *'||chr(10)||
'from dimgr.tables'||chr(10)||
'order by owner, table_name';

wwv_flow_api.create_report_region (
  p_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_name=> 'Available Tables on DIMGR Repository',
  p_region_name=>'',
  p_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_query_row_template=> 5776329886395568+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'QUERY_COLUMNS',
  p_query_num_rows=> '50',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5838619995303842 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'OWNER',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Owner',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5838709341303843 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_NAME',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Table Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5838827401303843 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_DESC',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Table Desc',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5838920602303843 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_COMMENT',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Table Comment',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 5839019876303843 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_TYPE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Table Type',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12298625585795664 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'IMPORTED_BY',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Imported By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12298712897795673 + wwv_flow_api.g_id_offset,
  p_region_id=> 5838311093303816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'IMPORT_DATE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Import Date',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 5813801582685163 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3,
  p_button_sequence=> 10,
  p_button_plug_id => 5801202077032982+wwv_flow_api.g_id_offset,
  p_button_name    => 'IMPORT_TABLE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Import Table from DB Catalog',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P3_SELECT_TABLE',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7486719100755487 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3,
  p_button_sequence=> 20,
  p_button_plug_id => 5801202077032982+wwv_flow_api.g_id_offset,
  p_button_name    => 'PURGE_TABLE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Purge Table From Repository',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''PURGE_TABLE'');',
  p_button_condition=> 'P3_SELECT_TABLE',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>5808126805125281 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_action=> 'f?p=&APP_ID.:import_table:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST in (''P3_OWNERS'', ''P3_SELECT_TABLE'', ''P3_DB_LINK'', ''IMPORT_TABLE'')',
  p_branch_comment=> 'Created 13-JUL-2010 15:41 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>7487006810755490 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_action=> 'f?p=&FLOW_ID.:3:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7486719100755487+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5802205671043415 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_SELECT_TABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 44,
  p_item_plug_id => 5801202077032982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select Table',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select table_name d, table_name r'||chr(10)||
'from   all_tables'||chr(10)||
'where owner = :P3_OWNERS'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select a table',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5803908357063182 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_OWNERS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 43,
  p_item_plug_id => 5801202077032982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owners',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'OWNER_LOV',
  p_lov => 'select distinct owner d,  owner r'||chr(10)||
'from   all_tables'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Select a table Owner',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5891823503553481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_OVERWRITE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 46,
  p_item_plug_id => 5801202077032982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Overwrite with import ',
  p_source=>'0',
  p_source_type=> 'STATIC',
  p_display_as=> 'CHECKBOX',
  p_lov => 'STATIC2:Table Comments;0,Column Comments;1,Column Check Constraints;2',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_display_when=>'P3_SELECT_TABLE',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12539220176061789 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_DB_LINK',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 45,
  p_item_plug_id => 5801202077032982+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'@DBLINK',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select db_link d, db_link r'||chr(10)||
'from   all_db_links'||chr(10)||
'where owner in (''PUBLIC'', ''DIMGR'') and db_link like ''%TEST%'' and :P3_OWNERS <> '''''||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Select a DB Link --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_display_when_type=>'NEVER',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 12548803263160927 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_computation_sequence => 10,
  p_computation_item=> 'P3_SELECT_TABLE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'FUNCTION_BODY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'begin'||chr(10)||
'if (:P3_DB_LINK IS NULL) then'||chr(10)||
'   return :P3_SELECT_TABLE||''@''||:P3_DB_LINK;'||chr(10)||
'else'||chr(10)||
'   return :P3_SELECT_TABLE;'||chr(10)||
'end if;'||chr(10)||
'end;',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''IMPORT_TABLE'', ''PURGE_TABLE'');',
  p_compute_when_type=>'NEVER');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 12543930265093055 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_validation_name => 'P3_OWNERS_NOT_NULL',
  p_validation_sequence=> 10,
  p_validation => 'P3_OWNERS',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'You have not selected a table owner.',
  p_validation_condition=> ':REQUEST in (''IMPORT_TABLE'', ''PURGE_TABLE'');',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_associated_item=> 5803908357063182 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 12545413558107209 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_validation_name => 'P3_SELECT_TABLE_NOT_NULL',
  p_validation_sequence=> 20,
  p_validation => 'P3_SELECT_TABLE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'You have not selected a table.',
  p_validation_condition=> ':REQUEST in (''IMPORT_TABLE'', ''PURGE_TABLE'');',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_associated_item=> 5802205671043415 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'dimgr.dimgr_pkg.import_table_from_db('||chr(10)||
' :P3_OWNERS, :P3_SELECT_TABLE, :P3_OVERWRITE'||chr(10)||
');';

wwv_flow_api.create_page_process(
  p_id     => 5908418831708165 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'import_table_from_db',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in importing table from DB',
  p_process_when=>':REQUEST in (''IMPORT_TABLE'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'Table has been imported succesfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'dimgr.dimgr_pkg.purge_table_from_repository('||chr(10)||
' :P3_OWNERS, :P3_SELECT_TABLE'||chr(10)||
');';

wwv_flow_api.create_page_process(
  p_id     => 7488622825775491 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'purge_table_from_rep',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in Purging table from Repository',
  p_process_when=>':REQUEST IN (''PURGE_TABLE'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'Table Purged succesfully from Repository',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00004
prompt  ...PAGE 4: TABLE_CONSTRAINTS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 4,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'TABLE_CONSTRAINTS',
  p_alias  => 'TABLE_CONSTRAINTS',
  p_step_title=> 'Table Constraints',
  p_step_sub_title => 'Table Constraints',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'NO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110303182133',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6311402184492102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'select a table',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
''||chr(10)||
'if :P4_GEN_DI_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'    -- DEBUG'||chr(10)||
'    /* htp.p(:P4_DIMGR_USER); */'||chr(10)||
''||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P4_OWNERS, :P4_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 6311816346492116 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Generate DI Validation Scripts',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 31,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''EDIT'', "OWNER" tblowner, '||chr(10)||
'"TABLE_NAME",'||chr(10)||
'"CONSTRAINT_NAME",'||chr(10)||
'"CONSTRAINT_DESC",'||chr(10)||
'dbms_lob.substr("CONSTRAINT_VALIDATION_QRY",4000,1) "CONSTRAINT_VALIDATION_QRY",'||chr(10)||
'a.TYPE, b.TYPE_DESC'||chr(10)||
',LAST_UPDATED_BY'||chr(10)||
',LAST_UPDATED'||chr(10)||
'from "#OWNER#"."TABLE_CONSTRAINTS"  a left outer join "#OWNER#".CONSTRAINT_TYPES b on (a.TYPE = b.TYPE)'||chr(10)||
'where '||chr(10)||
'  a.owner = decode(:P4_OWNERS, ''%null%'',a.owner,:P4_OWNERS) ';

s:=s||''||chr(10)||
'  and '||chr(10)||
'  a.table_name = decode(:P4_SELECT_TABLE, ''%null%'', a.table_name, :P4_SELECT_TABLE)'||chr(10)||
'  and'||chr(10)||
'  a.type = decode(:P4_CONS_TYPE, ''%null%'', a.type, :P4_CONS_TYPE)'||chr(10)||
'order by tblowner,TABLE_NAME,CONSTRAINT_NAME'||chr(10)||
'';

wwv_flow_api.create_report_region (
  p_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_name=> 'Available Table Constraints',
  p_region_name=>'',
  p_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 11,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_query_row_template=> 5776906238395575+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'Y',
  p_csv_output_link_text=> 'Save as CSV',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_exp_filename=> 'Table_Constraints',
  p_plug_query_exp_separator=> ';',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6335932520758701 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> '''EDIT''',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Edit',
  p_column_link=>'f?p=&APP_ID.:5:&SESSION.:EDIT_T_CONS:&DEBUG.::P5_OWNER,P5_TABLE_NAME,P5_CONSTRAINT_NAME:#TBLOWNER#,#TABLE_NAME#,#CONSTRAINT_NAME#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="Edit">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6871818925893486 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'TBLOWNER',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tblowner',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6330424075684123 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Table Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TABLE_CONSTRAINTS',
  p_ref_column_name=> 'TABLE_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6330514899684123 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_NAME',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Constraint Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TABLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6330606214684123 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_DESC',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Constraint Desc',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TABLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6330724478684123 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Constraint Validation Qry',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TABLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6330813205684123 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TYPE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Type',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TABLE_CONSTRAINTS',
  p_ref_column_name=> 'TYPE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6335116244754023 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'TYPE_DESC',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Type Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12305502017987584 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED_BY',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Last Updated By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12305625029987584 + wwv_flow_api.g_id_offset,
  p_region_id=> 6330014548684117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Last Updated',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
'--htp.p(''<H1>UNDER CONSTRUCTION</H1>'');'||chr(10)||
'if :P4_GEN_DB_SCIPT_PRESSED2 = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P4_OWNERS, :P4_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 6374924320664698 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Generate DB Update Script  for Table Constraints (PK & Unique)',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6331018095684123 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 30,
  p_button_plug_id => 6330014548684117+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE_TABL_CONS',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'ABOVE_BOX',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:5:&SESSION.:CREATE_TABL_CONS:&DEBUG.:5:P5_OWNER,P5_TABLE_NAME:&P4_OWNERS.,&P4_SELECT_TABLE.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6313109425492123 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 10,
  p_button_plug_id => 6311623719492113+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DB_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DB Update Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6375631696664701 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 10,
  p_button_plug_id => 6374924320664698+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DB_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DB Update Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6313305906492123 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 20,
  p_button_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DI_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DI Validation Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6313531022492123 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 30,
  p_button_plug_id => 6312016264492116+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE_TUP_CONS',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:9:&SESSION.:CREATE_TUP_CONS:&DEBUG.:9:P9_OWNER,P9_TABLE_NAME:&P4_OWNERS.,&P4_SELECT_TABLE.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6316405434492135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&FLOW_ID.:FORM_ON_TABLCONS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6312905140492121+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6316628182492137 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&FLOW_ID.:TABLE_CONSTRAINTS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6313305906492123+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6316817241492137 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&FLOW_ID.:TABLE_CONSTRAINTS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6313109425492123+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6317004724492137 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&APP_ID.:TABLE_CONSTRAINTS:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST in (''P4_OWNERS'', ''P4_SELECT_TABLE'', ''P4_CONS_TYPE'')',
  p_branch_comment=> 'Created 04-AUG-2010 16:18 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6313717182492124 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_OWNERS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 96,
  p_item_plug_id => 6311402184492102+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owners',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'LOCAL_OWNERS_LOV',
  p_lov => 'select distinct owner d, owner r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Select a table Owner',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6313930442492127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_SELECT_TABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 97,
  p_item_plug_id => 6311402184492102+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select Table',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select table_name d, table_name r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'where owner = :P4_OWNERS'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select a table',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6314130683492127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_GEN_DI_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 173,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '0',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6314310164492127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_RESTABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 171,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIRESULTS',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6314506359492127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_RESTABLE_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 169,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIMGR',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Owner',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6375230090664700 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_GEN_DB_SCIPT_PRESSED2',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 53,
  p_item_plug_id => 6374924320664698+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6375413105664701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_TABLE_CON_STATUS2',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 6374924320664698+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '1',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Table Constraint Status',
  p_source_type=> 'STATIC',
  p_display_as=> 'RADIOGROUP',
  p_named_lov=> 'CONSTRAINT_STATUS_LOV',
  p_lov => '.'||to_char(6063802555448194 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10196011979197494 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_CONS_TYPE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 98,
  p_item_plug_id => 6311402184492102+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Type',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'TABLE_CONSTRAINT_TYPES_LOV',
  p_lov => 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'where type in (''U'', ''P'', ''TC'', ''GU'')'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select type of constraint',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12934025587098376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_DIMGR_USER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 170,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select only Constraints Created By',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'DIMGR_USERS_LOV',
  p_lov => 'select user_name d, user_name r'||chr(10)||
'from APEX_WORKSPACE_APEX_USERS a'||chr(10)||
'where'||chr(10)||
'    A.WORKSPACE_NAME = ''OTE_TEAM_WS'''||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Select a User --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12937304856120726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_UPDATED_FROM',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 172,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select only constraints Updated From',
  p_source_type=> 'STATIC',
  p_display_as=> 'PICK_DATE_DD_MM_YYYY',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12940511566132214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_UPDATED_TO',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 174,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'To',
  p_source_type=> 'STATIC',
  p_display_as=> 'PICK_DATE_DD_MM_YYYY',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>12955425428211873 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_INCLUDE_ONLY_FAILED_CONS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 168,
  p_item_plug_id => 6311816346492116+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Include only constraints whose validation results (most recent)  have failed',
  p_source_type=> 'STATIC',
  p_display_as=> 'CHECKBOX',
  p_lov => 'STATIC:Yes;1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6315622126492133 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 20,
  p_computation_item=> 'P4_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7324405085707448 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 40,
  p_computation_item=> 'P4_GEN_DB_SCIPT_PRESSED2',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6315829394492133 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 20,
  p_computation_item=> 'P4_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DI_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7322902183697214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 30,
  p_computation_item=> 'P4_GEN_DB_SCIPT_PRESSED2',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13202124396755571 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 40,
  p_computation_item=> 'P4_RESTABLE_OWNER',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P4_RESTABLE_OWNER)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13202902364758696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 50,
  p_computation_item=> 'P4_RESTABLE_NAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P4_RESTABLE_NAME)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
''||chr(10)||
'dimgr.DIMGR_PKG.genDIvalscriptFromTablCons('||chr(10)||
'   :P4_OWNERS, '||chr(10)||
'   :P4_SELECT_TABLE, '||chr(10)||
'   :P4_RESTABLE_OWNER, '||chr(10)||
'   :P4_RESTABLE_NAME,'||chr(10)||
'   :P4_DIMGR_USER,'||chr(10)||
'   :P4_UPDATED_FROM,'||chr(10)||
'   :P4_UPDATED_TO,'||chr(10)||
'   to_number(nvl(:P4_INCLUDE_ONLY_FAILED_CONS, ''0'')),'||chr(10)||
'   :P4_CONS_TYPE'||chr(10)||
');'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6316129500492134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Gen_DI_validation_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in generating DI validation script!',
  p_process_when=>':REQUEST in (''GENERATE_DI_SCRIPT'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'DI validation script generated successfully!',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'dimgr.DIMGR_PKG.genupdDBscriptFromTabCons('||chr(10)||
':P4_OWNERS, :P4_SELECT_TABLE, :P4_TABLE_CON_STATUS2);'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 7318506030650982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Generate_DBUPdate_SCript',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in generating update DB script',
  p_process_when=>':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'update DB script generated successfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00005
prompt  ...PAGE 5: FORM_ON_TABLCONS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript"> '||chr(10)||
'	function set_validation_query() {		'||chr(10)||
'        //alert(document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'        //alert($v("P5_CONSTRAINT_VALIDATION_QRY"));'||chr(10)||
'		//if 	:P5_CONSTRAINT_VALIDATION_QRY is null'||chr(10)||
'		if (docume';

ph:=ph||'nt.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value == "") {'||chr(10)||
'			//then suggest a validation query'||chr(10)||
'			var valQuery = "SELECT COUNT(*)\n" +'||chr(10)||
'				"FROM (\n" + '||chr(10)||
'				"   SELECT ...\n" +'||chr(10)||
'				"   FROM " + document.getElementById("P5_OWNER").value + "." + document.getElementById("P5_TABLE_NAME").value + "\n" +'||chr(10)||
'				"   WHERE ...\n" +'||chr(10)||
'				"   )\n";'||chr(10)||
'			document.getElementById("P5_CONSTRAINT_VALIDA';

ph:=ph||'TION_QRY").value = valQuery.toUpperCase();'||chr(10)||
'			//alert(document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'		}		'||chr(10)||
'	}   '||chr(10)||
'</script> ';

wwv_flow_api.create_page(
  p_id     => 5,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'FORM_ON_TABLCONS',
  p_step_title=> 'FORM_ON_TABLCONS',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110310120942',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>5,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>5,p_text=>ph);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6326630100684101 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_plug_name=> 'Form on TABLE_CONSTRAINTS',
  p_region_name=>'',
  p_plug_template=> 5773519023395556+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6326919300684101 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 5,
  p_button_sequence=> 30,
  p_button_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> ':P5_COME_FROM_CREATE <> ''1'' OR :REQUEST = ''EDIT_T_CONS'''||chr(10)||
'/*:REQUEST NOT IN (''CREATE_TABL_CONS'');*/',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6327208629684102 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 5,
  p_button_sequence=> 10,
  p_button_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::P5_COME_FROM_CREATE:0',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6326804218684101 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 5,
  p_button_sequence=> 40,
  p_button_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> ':P5_COME_FROM_CREATE = ''1'''||chr(10)||
'/*:REQUEST IN (''CREATE_TABL_CONS'');*/',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6327017579684101 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 5,
  p_button_sequence=> 20,
  p_button_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> ':P5_COME_FROM_CREATE <> ''1'' OR :REQUEST = ''EDIT_T_CONS'''||chr(10)||
'/*:REQUEST NOT IN (''CREATE_TABL_CONS'');*/',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6327800357684103 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_branch_action=> 'f?p=&APP_ID.:4:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6328011792684103 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owner',
  p_source=>'OWNER',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6328218062684106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_TABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Table Name',
  p_source=>'TABLE_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6328624464684112 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_CONSTRAINT_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Name',
  p_source=>'CONSTRAINT_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when=>'NVL(:REQUEST, ''lala'') IN (''EDIT_T_CONS'');'||chr(10)||
'',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6329016612684113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_CONSTRAINT_DESC',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Desc</br>(business rule behind this constraint, expressed in English)',
  p_source=>'CONSTRAINT_DESC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_tag_attributes  => 'onChange="set_validation_query();"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6329207040684113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_CONSTRAINT_VALIDATION_QRY',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Validation Qry</br>(query which returns number of times the constraint was violated) ',
  p_source=>'CONSTRAINT_VALIDATION_QRY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 10,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6350028748060447 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_TYPE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Type',
  p_source=>'TYPE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'COMBOBOX',
  p_lov => 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'where type not in (''R'', ''ITC'')'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- select a constraint type --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6874203575031002 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_TCON_COLUMNS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Columns',
  p_source=>'COLUMN_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'SHUTTLE',
  p_lov => 'select COLUMN_NAME display_value, COLUMN_NAME return_value '||chr(10)||
'from COLUMNS'||chr(10)||
'where owner = :P5_OWNER and table_name = :P5_TABLE_NAME'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- select columns --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 30,
  p_cAttributes=> 'nowrap',
  p_tag_attributes  => 'style="width:300px"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7353131096831058 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_COME_FROM_CREATE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 6326630100684101+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7242425367457677 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_computation_sequence => 30,
  p_computation_item=> 'P5_CONSTRAINT_VALIDATION_QRY',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select replace(:P5_CONSTRAINT_VALIDATION_QRY,'';'')||CHR(13)'||chr(10)||
'from dual',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_computation_comment=> 'remove trailing '';'' and add a new line at the end, in case the user adds a comment following the last line of the query e.g.,'||chr(10)||
'select ...'||chr(10)||
'from ...'||chr(10)||
'where 1=1 -- this is a comment',
  p_compute_when => ':P5_CONSTRAINT_VALIDATION_QRY is not null',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7353710795834643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_computation_sequence => 40,
  p_computation_item=> 'P5_COME_FROM_CREATE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select case when :REQUEST = ''CREATE'' then ''1'' else ''0'' end'||chr(10)||
'from dual',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7354716467845776 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_computation_sequence => 40,
  p_computation_item=> 'P5_COME_FROM_CREATE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST IN (''CREATE_TABL_CONS'');',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6328926296684113 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_CONSTRAINT_NAME not null',
  p_validation_sequence=> 30,
  p_validation => 'P5_CONSTRAINT_NAME',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Constraint Name must have some value.',
  p_associated_item=> 6328624464684112 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6881324418216835 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_TCON_COLUMNS_not_null',
  p_validation_sequence=> 40,
  p_validation => 'P5_TCON_COLUMNS',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Select the constraint''s columns',
  p_associated_item=> 6874203575031002 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7283326151632847 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_CONSTRAINT_DESC_NOTNULL',
  p_validation_sequence=> 50,
  p_validation => 'P5_CONSTRAINT_DESC',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'You must provide a cosntraint description',
  p_associated_item=> 6329016612684113 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7284216932639652 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_CONSTRAINT_VALIDATION_QRY_NOTNULL',
  p_validation_sequence=> 60,
  p_validation => 'P5_CONSTRAINT_VALIDATION_QRY',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'You must provide a constraint validation query',
  p_validation_condition_type=> 'NEVER',
  p_associated_item=> 6329207040684113 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7285130092643450 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_TYPE_NOTNULL',
  p_validation_sequence=> 70,
  p_validation => 'P5_TYPE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'You must provide a constraint type',
  p_associated_item=> 6350028748060447 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 12078730804329252 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_CONSTRAINT_NOTEXISTS_WHEN_CREATE',
  p_validation_sequence=> 80,
  p_validation => 'select 1 from table_constraints'||chr(10)||
'where owner = :P5_OWNER'||chr(10)||
'and table_name = :P5_TABLE_NAME'||chr(10)||
'and constraint_name = upper(:P5_CONSTRAINT_NAME)',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'The constraint you try to create already exists. Change the constraint name, or cancel and edit the existing constraint',
  p_validation_condition=> ':REQUEST IN (''CREATE'');',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 13550207458835556 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_validation_name => 'P5_VALID_QUERY',
  p_validation_sequence=> 110,
  p_validation => 'dimgr_pkg.is_valid_sql(:P5_CONSTRAINT_VALIDATION_QRY) = ''OK''',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'ERROR in SQL statement!',
  p_validation_condition=> ':REQUEST IN (''CREATE'', ''SAVE'')',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:TABLE_CONSTRAINTS:P5_OWNER:OWNER';

wwv_flow_api.create_page_process(
  p_id     => 6329512369684113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from TABLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
''||chr(10)||
'select CONSTRAINT_DESC'||chr(10)||
'    ,dbms_lob.substr(CONSTRAINT_VALIDATION_QRY,4000,1) CONSTRAINT_VALIDATION_QRY'||chr(10)||
', type'||chr(10)||
'into '||chr(10)||
'    :P5_CONSTRAINT_DESC	'||chr(10)||
'    ,:P5_CONSTRAINT_VALIDATION_QRY		'||chr(10)||
'    ,:P5_TYPE'||chr(10)||
'from dimgr.table_constraints'||chr(10)||
'where owner = :P5_OWNER'||chr(10)||
'and table_name = :P5_TABLE_NAME'||chr(10)||
'and constraint_name = :P5_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'select replace(wmsys.wm_concat(column_name), '','', '':'')  i';

p:=p||'nto :P5_TCON_COLUMNS'||chr(10)||
'from('||chr(10)||
'select *'||chr(10)||
'from dimgr.table_constraints_ref_columns'||chr(10)||
'where owner = :P5_OWNER'||chr(10)||
'and table_name = :P5_TABLE_NAME'||chr(10)||
'and constraint_name = :P5_CONSTRAINT_NAME'||chr(10)||
'order by owner, table_name, constraint_name, position);'||chr(10)||
''||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6354501520412183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'fill_in_items',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when=>'nvl(:REQUEST, ''lala'') NOT IN (''CREATE_TABL_CONS'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if (:P5_CONSTRAINT_VALIDATION_QRY is null and :P5_CONSTRAINT_NAME is not null) then'||chr(10)||
'   :P5_CONSTRAINT_VALIDATION_QRY := '||chr(10)||
'       ''SELECT COUNT(*)''||'||chr(10)||
'       CHR(10)||''FROM (''||'||chr(10)||
'       CHR(10)||''   SELECT ...''||'||chr(10)||
'       CHR(10)||''   FROM ''||upper(:P5_OWNER)||''.''||upper(:P5_TABLE_NAME)||'||chr(10)||
'       CHR(10)||''   WHERE ...''||'||chr(10)||
'       CHR(10)||'')'';'||chr(10)||
'       '||chr(10)||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 7129115398715658 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set_P5_CONSTRAINT_VALIDATION_QRY',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:TABLE_CONSTRAINTS:P5_OWNER:OWNER|IUD';

wwv_flow_api.create_page_process(
  p_id     => 6329711568684113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of TABLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table TABLE_CONSTRAINTS.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||chr(10)||
'    sel_list_arr    APEX_APPLICATION_GLOBAL.VC_ARR2; -- column constraints select list'||chr(10)||
'    pos             integer; --column position'||chr(10)||
'BEGIN'||chr(10)||
'merge into dimgr.table_constraints trg'||chr(10)||
'using ('||chr(10)||
'select '||chr(10)||
':P5_OWNER owner, '||chr(10)||
':P5_TABLE_NAME table_name,'||chr(10)||
':P5_CONSTRAINT_NAME constraint_name,'||chr(10)||
':P5_CONSTRAINT_DESC CONSTRAINT_DESC, '||chr(10)||
':P5_CONSTRAINT_VALIDATION_QRY CONSTRAINT_VALIDATION_QRY,'||chr(10)||
':P5_TYPE';

p:=p||' type'||chr(10)||
',:APP_USER appuser , sysdate updt_date'||chr(10)||
'from dual'||chr(10)||
') src'||chr(10)||
'ON (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = upper(src.constraint_name))'||chr(10)||
'WHEN MATCHED THEN '||chr(10)||
'    UPDATE SET'||chr(10)||
'     trg.CONSTRAINT_DESC =  src.CONSTRAINT_DESC,'||chr(10)||
'     trg.CONSTRAINT_VALIDATION_QRY =  src.CONSTRAINT_VALIDATION_QRY,'||chr(10)||
'     trg.TYPE = src.type'||chr(10)||
'     ,trg.LAST_UPDATED_BY = src.appu';

p:=p||'ser'||chr(10)||
'     ,trg.LAST_UPDATED = src.updt_date'||chr(10)||
'WHEN NOT MATCHED THEN'||chr(10)||
' insert ('||chr(10)||
' trg.owner'||chr(10)||
',trg.table_name'||chr(10)||
',trg.constraint_name'||chr(10)||
',trg.CONSTRAINT_DESC'||chr(10)||
',trg.CONSTRAINT_VALIDATION_QRY'||chr(10)||
',trg.TYPE'||chr(10)||
',trg.LAST_UPDATED_BY'||chr(10)||
',trg.LAST_UPDATED'||chr(10)||
')'||chr(10)||
'values ('||chr(10)||
' src.owner'||chr(10)||
',src.table_name'||chr(10)||
',upper(src.constraint_name)'||chr(10)||
',src.CONSTRAINT_DESC'||chr(10)||
',src.CONSTRAINT_VALIDATION_QRY'||chr(10)||
',src.TYPE'||chr(10)||
',src.appuser'||chr(10)||
',src.updt_date';

p:=p||''||chr(10)||
');'||chr(10)||
''||chr(10)||
'-- clear old rows from table_constraints_ref_columns'||chr(10)||
'delete from dimgr.table_constraints_ref_columns trg'||chr(10)||
'where trg.owner = :P5_OWNER  and'||chr(10)||
'trg.table_name = :P5_TABLE_NAME and'||chr(10)||
'trg.constraint_name = upper(:P5_CONSTRAINT_NAME);'||chr(10)||
''||chr(10)||
'-- merge into table_constraints_ref_columns'||chr(10)||
'sel_list_arr := APEX_UTIL.STRING_TO_TABLE(:P5_TCON_COLUMNS);'||chr(10)||
'pos := 1;'||chr(10)||
'FOR z IN 1..sel_list_arr.count LOOP'||chr(10)||
''||chr(10)||
'   m';

p:=p||'erge into dimgr.table_constraints_ref_columns trg'||chr(10)||
'   using ('||chr(10)||
'      select '||chr(10)||
'       :P5_OWNER owner, '||chr(10)||
'       :P5_TABLE_NAME table_name,'||chr(10)||
'       :P5_CONSTRAINT_NAME constraint_name,'||chr(10)||
'       sel_list_arr(z) col_name,'||chr(10)||
'       pos position'||chr(10)||
'     from dual'||chr(10)||
'   ) src'||chr(10)||
'   ON (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and trg.column_name = sr';

p:=p||'c.col_name )'||chr(10)||
'WHEN NOT MATCHED THEN'||chr(10)||
' insert ('||chr(10)||
' trg.owner'||chr(10)||
',trg.table_name'||chr(10)||
',trg.constraint_name'||chr(10)||
',trg.column_name'||chr(10)||
',position'||chr(10)||
')'||chr(10)||
'values ('||chr(10)||
' src.owner'||chr(10)||
',src.table_name'||chr(10)||
',upper(src.constraint_name)'||chr(10)||
',src.col_name'||chr(10)||
',src.position'||chr(10)||
'); '||chr(10)||
'pos := pos + 1;'||chr(10)||
'END LOOP;'||chr(10)||
'commit;'||chr(10)||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 6350932735099433 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'MERGE_INTO_TABLE_CONS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error while merging into TABLE_CONSTRAINTS',
  p_process_when=>':REQUEST in (''SAVE'', ''CREATE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'TABLE_CONSTRAINTS merged succesfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'delete from dimgr.table_constraints_ref_columns'||chr(10)||
'where'||chr(10)||
'owner = :P5_OWNER'||chr(10)||
'and table_name = :P5_TABLE_NAME'||chr(10)||
'and constraint_name = :P5_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'delete from dimgr.table_constraints'||chr(10)||
'where '||chr(10)||
'owner = :P5_OWNER'||chr(10)||
'and table_name = :P5_TABLE_NAME'||chr(10)||
'and constraint_name = :P5_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'commit;';

wwv_flow_api.create_page_process(
  p_id     => 6363732697496792 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DELETE_FROM_TABLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in deleting row from table_constraints',
  p_process_when=>':REQUEST in (''DELETE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'row deleted from table_constraints',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'5';

wwv_flow_api.create_page_process(
  p_id     => 6329902388684113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when_button_id=>6327017579684101 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 5
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00006
prompt  ...PAGE 6: FORM_ON_INTERTABLCONS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript"> '||chr(10)||
'	function set_validation_query() {		'||chr(10)||
'        //alert(document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'        //alert($v("P5_CONSTRAINT_VALIDATION_QRY"));'||chr(10)||
'		//if 	:P5_CONSTRAINT_VALIDATION_QRY is null'||chr(10)||
'		if (documen';

ph:=ph||'t.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value == "") {'||chr(10)||
'			//then suggest a validation query'||chr(10)||
'			var valQuery = "SELECT COUNT(*)\n" +'||chr(10)||
'				"FROM (\n" + '||chr(10)||
'				"   SELECT ...\n" +'||chr(10)||
'				"   FROM " + document.getElementById("P5_OWNER").value + "." + document.getElementById("P5_TABLE_NAME").value + "\n" +'||chr(10)||
'				"   WHERE ...\n" +'||chr(10)||
'				"   )\n";'||chr(10)||
'			document.getElementById("P5_CONSTRAINT_VALIDAT';

ph:=ph||'ION_QRY").value = valQuery.toUpperCase();'||chr(10)||
'			//alert(document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'		}		'||chr(10)||
'	}   '||chr(10)||
'</script> '||chr(10)||
''||chr(10)||
'<script type="text/javascript"> '||chr(10)||
'	function set_validation_query() {		'||chr(10)||
'		// loop to construct the tables in the P6_ITREF_TABLE select list'||chr(10)||
'		var p6_itreftables = document.getElementById("P6_ITREF_TABLE");'||chr(10)||
'		var reftables = "";'||chr(10)||
'		var i;'||chr(10)||
'		for(i=0; i';

ph:=ph||' < p6_itreftables.length; i++) { '||chr(10)||
'			//alert("hello");'||chr(10)||
'			// if table is selected'||chr(10)||
'			if(p6_itreftables.options[i].selected == true) {'||chr(10)||
'				//alert (p6_itreftables.options[i].value);'||chr(10)||
'				reftables = reftables + " ," + document.getElementById("P6_OWNER").value + "." + p6_itreftables.options[i].value;'||chr(10)||
'			}'||chr(10)||
'		}	'||chr(10)||
'		'||chr(10)||
'		if (document.getElementById("P6_CONSTRAINT_VALIDATION_QRY").value == "") {'||chr(10)||
'	';

ph:=ph||'		//then suggest a validation query'||chr(10)||
'			var valQuery = "SELECT COUNT(*)\n" +'||chr(10)||
'				"FROM (\n" + '||chr(10)||
'				"   SELECT ...\n" +'||chr(10)||
'				"   FROM " + '||chr(10)||
'					document.getElementById("P6_OWNER").value + "." + '||chr(10)||
'					document.getElementById("P6_TABLE_NAME").value '||chr(10)||
'					+ //" , " + '||chr(10)||
'					/*'||chr(10)||
'					document.getElementById("P6_ITREF_OWNER").value + '||chr(10)||
'					"." + '||chr(10)||
'					document.getElementById("P6_ITREF_TABLE").val';

ph:=ph||'ue +'||chr(10)||
'					*/'||chr(10)||
'					reftables +'||chr(10)||
'					"\n" +'||chr(10)||
'				"   WHERE ...\n" +'||chr(10)||
'				"   )\n";'||chr(10)||
'			document.getElementById("P6_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();'||chr(10)||
'			//alert(document.getElementById("P6_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'		}		'||chr(10)||
'/*		'||chr(10)||
'		var p6_itreftables = document.getElementById("P6_ITREF_TABLE");'||chr(10)||
'		alert(p6_itreftables.options[p6_itreftables.selectedIndex].select';

ph:=ph||'ed );'||chr(10)||
'		alert(p6_itreftables.length); '||chr(10)||
'		var i;'||chr(10)||
'		for(i=0; i < p6_itreftables.length; i++) {'||chr(10)||
'			//alert("hello");'||chr(10)||
'			if(p6_itreftables.options[i].selected == true ) {'||chr(10)||
'				alert (p6_itreftables.options[i].value);'||chr(10)||
'			}'||chr(10)||
'		}'||chr(10)||
'*/		'||chr(10)||
'	}   '||chr(10)||
'</script> ';

wwv_flow_api.create_page(
  p_id     => 6,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'FORM_ON_INTERTABLCONS',
  p_alias  => 'FORM_ON_INTERTABLCONS',
  p_step_title=> 'Form On Intertablcons',
  p_step_sub_title => 'Form On Intertablcons',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110310120745',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>6,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>6,p_text=>ph);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6951716606788720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 6,
  p_plug_name=> 'Form on INTER-TABLE_CONSTRAINTS',
  p_region_name=>'',
  p_plug_template=> 5773519023395556+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6952317798788721 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 6,
  p_button_sequence=> 30,
  p_button_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> ':P6_CREATE_MODE_IS_ON <> ''1'' OR :REQUEST = ''EDIT_IT_CONS''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6951918686788721 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 6,
  p_button_sequence=> 10,
  p_button_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::P6_CREATE_MODE_IS_ON	:0',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6952515398788721 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 6,
  p_button_sequence=> 40,
  p_button_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> ':P6_CREATE_MODE_IS_ON = ''1'';',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6952105917788721 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 6,
  p_button_sequence=> 20,
  p_button_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> ':P6_CREATE_MODE_IS_ON <> ''1'' OR :REQUEST = ''EDIT_IT_CONS''',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6955830175788732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_branch_action=> 'f?p=&APP_ID.:INTER_TABLE_CONS:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST NOT IN (''P6_TYPE'', ''P6_ITREF_OWNER'')',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6977821197160025 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_branch_action=> 'f?p=&APP_ID.:FORM_ON_INTERTABLCONS:&SESSION.:P6_TYPE:&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 11,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST IN (''P6_TYPE'', ''P6_ITREF_OWNER'')',
  p_branch_comment=> 'Created 22-OCT-2010 16:44 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6952704313788721 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_TYPE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 153,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Type',
  p_source=>'TYPE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'where type not in (''U'', ''P'', ''TC'')'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- select a constraint type --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6952929388788721 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_ITCON_COLUMNS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 149,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Columns',
  p_source=>'COLUMN_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'SHUTTLE',
  p_lov => 'select COLUMN_NAME display_value, COLUMN_NAME return_value '||chr(10)||
'from COLUMNS'||chr(10)||
'where owner = :P6_OWNER and table_name = :P6_TABLE_NAME'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- select columns --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 30,
  p_cAttributes=> 'nowrap',
  p_tag_attributes  => 'style="width:300px"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6953120865788722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 145,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owner',
  p_source=>'OWNER',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6953322322788722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_TABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 146,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Table Name',
  p_source=>'TABLE_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6953517157788722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_CONSTRAINT_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 147,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Name',
  p_source=>'CONSTRAINT_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when=>':P6_CREATE_MODE_IS_ON <> ''1'';'||chr(10)||
'',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6953715520788723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_CONSTRAINT_DESC',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 148,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Desc</br>(business rule behind this constraint, expressed in English)',
  p_source=>'CONSTRAINT_DESC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6953928937788723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_CONSTRAINT_VALIDATION_QRY',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 152,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Validation Qry</br>(query which returns number of times the constraint was violated) ',
  p_source=>'CONSTRAINT_VALIDATION_QRY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 10,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6966605147171322 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_ITREF_TABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 151,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Referenced Table(s)',
  p_source_type=> 'STATIC',
  p_display_as=> 'MULTIPLESELECT',
  p_lov => 'select TABLE_NAME display_value, TABLE_NAME return_value '||chr(10)||
'from TABLES'||chr(10)||
'where owner = :P6_ITREF_OWNER '||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- select referenced tables in the constraint --',
  p_lov_null_value=> '999',
  p_cSize=> 20,
  p_cMaxlength=> 20,
  p_cHeight=> 10,
  p_cAttributes=> 'nowrap',
  p_cattributes_element=>'width="10%"',
  p_tag_attributes  => 'onBlur="set_validation_query();"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6981126335407579 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_REF_PK_CONSTRAINT',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 154,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Referenced PK/UK Constraint',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'COMBOBOX',
  p_lov => 'select CONSTRAINT_NAME display_value, CONSTRAINT_NAME return_value '||chr(10)||
'from TABLE_CONSTRAINTS'||chr(10)||
'where OWNER = :P6_ITREF_OWNER and TABLE_NAME = :P6_ITREF_TABLE'||chr(10)||
'and TYPE in (''P'',''U'')'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Select Referenced PK Constraint --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_display_when=>':P6_TYPE = ''R''',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6988619765481336 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_ITREF_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Referenced Owner',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select distinct owner as d, owner as r'||chr(10)||
'from dimgr.tables'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Select Referenced Owner --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7007709085932501 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_CREATE_MODE_IS_ON',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 164,
  p_item_plug_id => 6951716606788720+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7244417664474328 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_computation_sequence => 40,
  p_computation_item=> 'P6_CONSTRAINT_VALIDATION_QRY',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select replace(:P6_CONSTRAINT_VALIDATION_QRY,'';'')||CHR(13)'||chr(10)||
'from dual',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_computation_comment=> 'remove trailing '';'' and add a new line at the end, in case the user adds a comment following the last line of the query e.g.,'||chr(10)||
'select ...'||chr(10)||
'from ...'||chr(10)||
'where 1=1 -- this is a comment'||chr(10)||
'and 1=1 -- this is another comment',
  p_compute_when => ':P6_CONSTRAINT_VALIDATION_QRY is not null',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7008716488944044 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_computation_sequence => 10,
  p_computation_item=> 'P6_CREATE_MODE_IS_ON',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select case when :REQUEST = ''CREATE_ITABL_CONS'' then ''1'' '||chr(10)||
'WHEN :REQUEST = ''EDIT_IT_CONS'' then ''0'''||chr(10)||
'WHEN :P6_CREATE_MODE_IS_ON = ''1'' then ''1'''||chr(10)||
'ELSE ''0'' END'||chr(10)||
'from dual;'||chr(10)||
'',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_computation_comment=> 'This field indicates that we have entered this form by pressing a CREATE button from page INTER_TABLE_CONSTRAINTS',
  p_computation_error_message => '   ',
  p_compute_when => ':REQUEST IN (''CREATE_ITABL_CONS'');',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6954207642788724 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_CONSTRAINT_NAME not null',
  p_validation_sequence=> 30,
  p_validation => 'P6_CONSTRAINT_NAME',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Constraint Name must have some value.',
  p_associated_item=> 6953517157788722 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6954405406788728 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_ITCON_COLUMNS_not_null',
  p_validation_sequence=> 40,
  p_validation => 'P6_ITCON_COLUMNS',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Select the constraint''s columns',
  p_associated_item=> 6952929388788721 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7027303310720338 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_CONSTRAINT_DESC_NOTNULL',
  p_validation_sequence=> 50,
  p_validation => 'P6_CONSTRAINT_DESC',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Contraint Description must not be null',
  p_associated_item=> 6953715520788723 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7028223049726089 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_ITREF_OWNER_notnull',
  p_validation_sequence=> 60,
  p_validation => 'P6_ITREF_OWNER',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Referenced Owner must not be null',
  p_associated_item=> 6988619765481336 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7029103094729754 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_ITREF_TABLE_notnull',
  p_validation_sequence=> 70,
  p_validation => 'P6_ITREF_TABLE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Referenced Table must not be null',
  p_associated_item=> 6966605147171322 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7030016254733574 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_CONSTRAINT_VALIDATION_QRY_notnull',
  p_validation_sequence=> 80,
  p_validation => 'P6_CONSTRAINT_VALIDATION_QRY',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Contraint Validation Query must not be null',
  p_associated_item=> 6953928937788723 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7030928375737068 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_TYPE_notnull',
  p_validation_sequence=> 90,
  p_validation => 'P6_TYPE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Contraint Type must not be null',
  p_associated_item=> 6952704313788721 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 12188905943627882 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_CONSTRAINT_NOTEXISTS_WHEN_CREATE',
  p_validation_sequence=> 90,
  p_validation => 'select 1 from inter_table_constraints'||chr(10)||
'where owner = :P6_OWNER'||chr(10)||
'and table_name = :P6_TABLE_NAME'||chr(10)||
'and constraint_name = upper(:P6_CONSTRAINT_NAME)',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'The constraint you try to create already exists. Change the constraint name, or cancel and edit the existing constraint',
  p_validation_condition=> ':REQUEST IN (''CREATE'');',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 13546303770768296 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_validation_name => 'P6_VALID_QUERY',
  p_validation_sequence=> 100,
  p_validation => 'dimgr_pkg.is_valid_sql(:P6_CONSTRAINT_VALIDATION_QRY) = ''OK''',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'ERROR in SQL statement!',
  p_validation_condition=> ':REQUEST IN (''SAVE'', ''CREATE'')',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_associated_item=> 6953928937788723 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:TABLE_CONSTRAINTS:P6_OWNER:OWNER';

wwv_flow_api.create_page_process(
  p_id     => 6954525319788729 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from TABLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
''||chr(10)||
'select CONSTRAINT_DESC'||chr(10)||
'    ,dbms_lob.substr(CONSTRAINT_VALIDATION_QRY,4000,1) CONSTRAINT_VALIDATION_QRY'||chr(10)||
', type'||chr(10)||
', ref_pkowner'||chr(10)||
', ref_pktable_name'||chr(10)||
', ref_pkconstraint_name'||chr(10)||
'into '||chr(10)||
'    :P6_CONSTRAINT_DESC	'||chr(10)||
'    ,:P6_CONSTRAINT_VALIDATION_QRY		'||chr(10)||
'    ,:P6_TYPE'||chr(10)||
'    ,:P6_ITREF_OWNER'||chr(10)||
'    ,:P6_ITREF_TABLE'||chr(10)||
'    ,:P6_REF_PK_CONSTRAINT'||chr(10)||
'from dimgr.inter_table_constraints'||chr(10)||
'where owner = :P6_OWNER';

p:=p||''||chr(10)||
'and table_name = :P6_TABLE_NAME'||chr(10)||
'and constraint_name = :P6_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'/*'||chr(10)||
'select replace(wmsys.wm_concat(column_name), '','', '':'') into :P6_ITCON_COLUMNS'||chr(10)||
'from dimgr.itable_constraints_ref_columns'||chr(10)||
'where owner = :P6_OWNER'||chr(10)||
'and table_name = :P6_TABLE_NAME'||chr(10)||
'and constraint_name = :P6_CONSTRAINT_NAME;'||chr(10)||
'*/'||chr(10)||
''||chr(10)||
'select replace(wmsys.wm_concat(column_name), '','', '':'') into :P6_ITCON_COLUMNS'||chr(10)||
'from (';

p:=p||''||chr(10)||
'select *'||chr(10)||
'from dimgr.itable_constraints_ref_columns'||chr(10)||
'where owner = :P6_OWNER'||chr(10)||
'and table_name = :P6_TABLE_NAME'||chr(10)||
'and constraint_name = :P6_CONSTRAINT_NAME'||chr(10)||
'order by owner, table_name, constraint_name, position'||chr(10)||
');'||chr(10)||
''||chr(10)||
'if (:P6_TYPE <> ''R'') then'||chr(10)||
'   -- then fill in referenced table from INTER_TABLE_CONS_REF_TABLES'||chr(10)||
'      select ref_owner, replace(wmsys.wm_concat(ref_table_name), '','', '':'')  into :P6_I';

p:=p||'TREF_OWNER,:P6_ITREF_TABLE'||chr(10)||
'   from dimgr.inter_table_cons_ref_tables'||chr(10)||
'   where owner = :P6_OWNER'||chr(10)||
'   and table_name = :P6_TABLE_NAME'||chr(10)||
'   and constraint_name = :P6_CONSTRAINT_NAME'||chr(10)||
'  group by ref_owner;'||chr(10)||
''||chr(10)||
'end if;'||chr(10)||
''||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6955106465788732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'fill_in_items',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when=>'nvl(:REQUEST, ''lala'') NOT IN (''CREATE_ITABL_CONS'', ''P6_ITREF_OWNER'', ''P6_TYPE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P6_ITREF_OWNER := :P6_OWNER;';

wwv_flow_api.create_page_process(
  p_id     => 6991116910499493 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'fill_in_P6_ITREF_OWNER',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when=>':REQUEST NOT IN (''P6_ITREF_OWNER'', ''P6_TYPE'', ''EDIT_IT_CONS'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if (:P6_CONSTRAINT_VALIDATION_QRY is null and :P6_CONSTRAINT_NAME is not null) then'||chr(10)||
'   :P6_CONSTRAINT_VALIDATION_QRY := '||chr(10)||
'       ''SELECT COUNT(*)''||'||chr(10)||
'       CHR(10)||''FROM (''||'||chr(10)||
'       CHR(10)||''   SELECT ...''||'||chr(10)||
'       CHR(10)||''   FROM ''||upper(:P6_OWNER)||''.''||upper(:P6_TABLE_NAME)||'', ''||upper(:P6_ITREF_OWNER)||''.''||upper(:P6_ITREF_TABLE)||'' ...''||'||chr(10)||
'       CHR(10)||''   WHERE ...''||'||chr(10)||
'       CH';

p:=p||'R(10)||'')'';       '||chr(10)||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 7136018655801694 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 90,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set_P6_CONSTRAINT_VALIDATION_QRY',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:TABLE_CONSTRAINTS:P6_OWNER:OWNER|IUD';

wwv_flow_api.create_page_process(
  p_id     => 6954701185788729 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of TABLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table TABLE_CONSTRAINTS.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||chr(10)||
'    sel_list_arr    APEX_APPLICATION_GLOBAL.VC_ARR2; -- column constraints select list'||chr(10)||
'    pos             integer; --column position'||chr(10)||
'BEGIN'||chr(10)||
''||chr(10)||
'merge into dimgr.inter_table_constraints trg'||chr(10)||
'using ('||chr(10)||
'    select '||chr(10)||
'    :P6_OWNER owner, '||chr(10)||
'    :P6_TABLE_NAME table_name,'||chr(10)||
'    upper(:P6_CONSTRAINT_NAME) constraint_name,'||chr(10)||
'    :P6_CONSTRAINT_DESC CONSTRAINT_DESC, '||chr(10)||
'    :P6_CONSTRAINT_VALIDATION_Q';

p:=p||'RY CONSTRAINT_VALIDATION_QRY,'||chr(10)||
'    :P6_TYPE type,'||chr(10)||
'    :P6_ITREF_OWNER refowner,'||chr(10)||
'    :P6_ITREF_TABLE reftable,'||chr(10)||
'    :P6_REF_PK_CONSTRAINT refpkcon'||chr(10)||
'    ,:APP_USER appuser , sysdate updt_date'||chr(10)||
'    from dual'||chr(10)||
') src'||chr(10)||
'ON (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name)'||chr(10)||
'WHEN MATCHED THEN '||chr(10)||
'    UPDATE SET'||chr(10)||
'     trg.CONSTRAINT_DESC =  src.CONSTRA';

p:=p||'INT_DESC,'||chr(10)||
'     trg.CONSTRAINT_VALIDATION_QRY =  src.CONSTRAINT_VALIDATION_QRY,'||chr(10)||
'     trg.TYPE = src.type,'||chr(10)||
'     trg.REF_PKOWNER = decode(src.TYPE, ''R'', src.refowner, null),'||chr(10)||
'     trg.REF_PKTABLE_NAME = decode(src.TYPE, ''R'', src.reftable, null),'||chr(10)||
'     trg.REF_PKCONSTRAINT_NAME = decode(src.TYPE, ''R'', src.refpkcon, null)'||chr(10)||
'     ,trg.LAST_UPDATED_BY = src.appuser'||chr(10)||
'     ,trg.LAST_UPDATED = src.updt_da';

p:=p||'te'||chr(10)||
'WHEN NOT MATCHED THEN'||chr(10)||
' insert ('||chr(10)||
'     trg.owner'||chr(10)||
'    ,trg.table_name'||chr(10)||
'    ,trg.constraint_name'||chr(10)||
'    ,trg.CONSTRAINT_DESC'||chr(10)||
'    ,trg.CONSTRAINT_VALIDATION_QRY'||chr(10)||
'    ,trg.TYPE'||chr(10)||
'    ,trg.REF_PKOWNER'||chr(10)||
'    ,trg.REF_PKTABLE_NAME'||chr(10)||
'    ,trg.REF_PKCONSTRAINT_NAME'||chr(10)||
'    ,trg.LAST_UPDATED_BY'||chr(10)||
'    ,trg.LAST_UPDATED'||chr(10)||
')'||chr(10)||
'values ('||chr(10)||
'     src.owner'||chr(10)||
'    ,src.table_name'||chr(10)||
'    ,src.constraint_name'||chr(10)||
'    ,src.CONSTRA';

p:=p||'INT_DESC'||chr(10)||
'    ,src.CONSTRAINT_VALIDATION_QRY'||chr(10)||
'    ,src.TYPE'||chr(10)||
'    ,decode(src.TYPE, ''R'', src.refowner, null)'||chr(10)||
'    ,decode(src.TYPE, ''R'', src.reftable, null)'||chr(10)||
'    ,decode(src.TYPE, ''R'', src.refpkcon, null)'||chr(10)||
'    ,src.appuser'||chr(10)||
'    ,src.updt_date'||chr(10)||
');'||chr(10)||
''||chr(10)||
'-- clear old rows from itable_constraints_ref_columns'||chr(10)||
'delete from dimgr.itable_constraints_ref_columns trg'||chr(10)||
'where trg.owner = :P6_OWNER  and'||chr(10)||
'trg.tabl';

p:=p||'e_name = :P6_TABLE_NAME and'||chr(10)||
'trg.constraint_name = upper(:P6_CONSTRAINT_NAME);'||chr(10)||
''||chr(10)||
'-- merge into itable_constraints_ref_columns'||chr(10)||
'sel_list_arr := APEX_UTIL.STRING_TO_TABLE(:P6_ITCON_COLUMNS);'||chr(10)||
'pos := 1;'||chr(10)||
'FOR z IN 1..sel_list_arr.count LOOP'||chr(10)||
''||chr(10)||
'   merge into dimgr.itable_constraints_ref_columns trg'||chr(10)||
'   using ('||chr(10)||
'      select '||chr(10)||
'       :P6_OWNER owner, '||chr(10)||
'       :P6_TABLE_NAME table_name,'||chr(10)||
'       upper(:P';

p:=p||'6_CONSTRAINT_NAME) constraint_name,'||chr(10)||
'       sel_list_arr(z) col_name,'||chr(10)||
'       pos position'||chr(10)||
'     from dual'||chr(10)||
'   ) src'||chr(10)||
'   ON (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and trg.column_name = src.col_name )'||chr(10)||
'WHEN NOT MATCHED THEN'||chr(10)||
' insert ('||chr(10)||
'     trg.owner'||chr(10)||
'    ,trg.table_name'||chr(10)||
'    ,trg.constraint_name'||chr(10)||
'    ,trg.column_name'||chr(10)||
'    ,trg.posit';

p:=p||'ion    '||chr(10)||
')'||chr(10)||
'values ('||chr(10)||
'     src.owner'||chr(10)||
'    ,src.table_name'||chr(10)||
'    ,src.constraint_name'||chr(10)||
'    ,src.col_name'||chr(10)||
'    ,src.position'||chr(10)||
'); '||chr(10)||
'pos := pos + 1;'||chr(10)||
'END LOOP;'||chr(10)||
''||chr(10)||
'-- clear old rows from inter_table_cons_ref_tables'||chr(10)||
'delete from dimgr.inter_table_cons_ref_tables trg'||chr(10)||
'where trg.owner = :P6_OWNER  and'||chr(10)||
'trg.table_name = :P6_TABLE_NAME and'||chr(10)||
'trg.constraint_name = upper(:P6_CONSTRAINT_NAME);'||chr(10)||
''||chr(10)||
'-- merge into i';

p:=p||'nter_table_cons_ref_tables'||chr(10)||
'sel_list_arr := APEX_UTIL.STRING_TO_TABLE(:P6_ITREF_TABLE);'||chr(10)||
'--pos := 1;'||chr(10)||
'FOR z IN 1..sel_list_arr.count LOOP'||chr(10)||
'     merge into dimgr.inter_table_cons_ref_tables trg'||chr(10)||
'       using ('||chr(10)||
'          select '||chr(10)||
'           :P6_OWNER owner, '||chr(10)||
'           :P6_TABLE_NAME table_name,'||chr(10)||
'           upper(:P6_CONSTRAINT_NAME) constraint_name,'||chr(10)||
'           :P6_ITREF_OWNER refowner,'||chr(10)||
'        ';

p:=p||'   sel_list_arr(z) reftable    '||chr(10)||
'         from dual'||chr(10)||
'       ) src'||chr(10)||
'       ON (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and trg.ref_owner = src.refowner and trg.ref_table_name = src.reftable )'||chr(10)||
'    WHEN NOT MATCHED THEN'||chr(10)||
'     insert ('||chr(10)||
'         trg.owner'||chr(10)||
'        ,trg.table_name'||chr(10)||
'        ,trg.constraint_name'||chr(10)||
'        ,trg.ref_owner'||chr(10)||
'   ';

p:=p||'     ,trg.ref_table_name'||chr(10)||
'    )'||chr(10)||
'    values ('||chr(10)||
'         src.owner'||chr(10)||
'        ,src.table_name'||chr(10)||
'        ,src.constraint_name'||chr(10)||
'        ,src.refowner'||chr(10)||
'        ,src.reftable'||chr(10)||
'    ); '||chr(10)||
'END LOOP;'||chr(10)||
''||chr(10)||
'commit;'||chr(10)||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 6955520992788732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'MERGE_INTO_ITABLE_CONS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error while merging into INTER_TABLE_CONSTRAINTS',
  p_process_when=>':REQUEST in (''SAVE'', ''CREATE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'INTER_TABLE_CONSTRAINTS merged succesfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'delete from dimgr.itable_constraints_ref_columns'||chr(10)||
'where'||chr(10)||
'owner = :P6_OWNER'||chr(10)||
'and table_name = :P6_TABLE_NAME'||chr(10)||
'and constraint_name = :P6_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'delete from dimgr.inter_table_cons_ref_tables'||chr(10)||
'where'||chr(10)||
'owner = :P6_OWNER'||chr(10)||
'and table_name = :P6_TABLE_NAME'||chr(10)||
'and constraint_name = :P6_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'delete from dimgr.inter_table_constraints'||chr(10)||
'where '||chr(10)||
'owner = :P6_OWNER'||chr(10)||
'and table_name = :P6_TA';

p:=p||'BLE_NAME'||chr(10)||
'and constraint_name = :P6_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'commit;';

wwv_flow_api.create_page_process(
  p_id     => 6955323600788732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DELETE_FROM_ITABLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in deleting row from inter_table_constraints',
  p_process_when=>':REQUEST in (''DELETE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'row deleted from inter_table_constraints',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'5';

wwv_flow_api.create_page_process(
  p_id     => 6954928570788729 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when=>':REQUEST in (''DELETE'', ''CREATE'', ''SAVE'', ''CANCEL'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P6_CREATE_MODE_IS_ON := ''0'';';

wwv_flow_api.create_page_process(
  p_id     => 7097929373603150 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'unset_P6_CREATE_MODE_IS_ON',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when=>':REQUEST in (''DELETE'', ''CREATE'', ''SAVE'', ''CANCEL'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 6
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00007
prompt  ...PAGE 7: TUPL_CONSTRAINTS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 7,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'TUPL_CONSTRAINTS',
  p_alias  => 'TUPL_CONSTRAINTS',
  p_step_title=> 'Tupl Constraints',
  p_step_sub_title => 'Tupl Constraints',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'NO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110303174120',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6135510248953694 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'select a table',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
''||chr(10)||
'if :P7_GEN_DB_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P7_OWNERS, :P7_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 6135715352953702 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Generate DB Update Script  for Tuple Check Constraints',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
''||chr(10)||
'if :P7_GEN_DI_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P7_OWNERS, :P7_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 6135911803953704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Generate DI Validation Scripts',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 31,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||chr(10)||
'''edit'', '||chr(10)||
'"OWNER" tblowner, '||chr(10)||
'"TABLE_NAME",'||chr(10)||
'"CONSTRAINT_NAME",'||chr(10)||
'"CONSTRAINT_DESC",'||chr(10)||
'dbms_lob.substr("CONSTRAINT_CHECK_CONDITION",4000,1) "CONSTRAINT_CHECK_CONDITION",'||chr(10)||
'dbms_lob.substr("CONSTRAINT_VALIDATION_QRY",4000,1) "CONSTRAINT_VALIDATION_QRY"'||chr(10)||
',LAST_UPDATED_BY'||chr(10)||
',LAST_UPDATED'||chr(10)||
'from "#OWNER#"."TUPLE_CONSTRAINTS" a'||chr(10)||
'where '||chr(10)||
'--owner = :P7_OWNERS AND table_name = :P7_SELECT_TABLE '||chr(10)||
'a.own';

s:=s||'er = decode(:P7_OWNERS, ''%null%'',a.owner,:P7_OWNERS) '||chr(10)||
'  and '||chr(10)||
'  a.table_name = decode(:P7_SELECT_TABLE, ''%null%'', a.table_name, :P7_SELECT_TABLE)'||chr(10)||
'order by 2,3'||chr(10)||
'  '||chr(10)||
''||chr(10)||
'  '||chr(10)||
'';

wwv_flow_api.create_report_region (
  p_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_name=> 'Available Tuple Constraints',
  p_region_name=>'',
  p_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_query_row_template=> 5776906238395575+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'Y',
  p_csv_output_link_text=> 'Save as CSV',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_exp_filename=> 'Tuple_Constraints.csv',
  p_plug_query_exp_separator=> ';',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6189815377820816 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> '''EDIT''',
  p_column_display_sequence=> 1,
  p_column_heading=> '''Edit''',
  p_column_link=>'f?p=&APP_ID.:FORM_ON_TUPLE_CONSTRAINTS:&SESSION.:EDIT_TUPL_CONS:&DEBUG.::P9_OWNER,P9_TABLE_NAME,P9_CONSTRAINT_NAME:#TBLOWNER#,#TABLE_NAME#,#CONSTRAINT_NAME#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="Edit">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6910416857713371 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'TBLOWNER',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tblowner',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6185802411794040 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Table_Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'TABLE_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6185932308794040 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_NAME',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Constraint Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6186017305794040 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_DESC',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Constraint Desc',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6186109991794040 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_CHECK_CONDITION',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Constraint Check Condition',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_CHECK_CONDITION',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6186206796794040 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Constraint Validation Qry',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12304526473985151 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED_BY',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Last Updated By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12304630205985151 + wwv_flow_api.g_id_offset,
  p_region_id=> 6185408208794036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Last Updated',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6186400730794041 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 7,
  p_button_sequence=> 30,
  p_button_plug_id => 6185408208794036+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE_TUP_CONS',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'ABOVE_BOX',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:9:&SESSION.:CREATE_TUP_CONS:&DEBUG.:9:P9_OWNER,P9_TABLE_NAME:&P7_OWNERS.,&P7_SELECT_TABLE.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6137917295953713 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 7,
  p_button_sequence=> 10,
  p_button_plug_id => 6135715352953702+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DB_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DB Update Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6138122155953715 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 7,
  p_button_sequence=> 20,
  p_button_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DI_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DI Validation Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6178507441695514 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 7,
  p_button_sequence=> 30,
  p_button_plug_id => 6136104549953704+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE_TUPL_CONSTRAINT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6141211871953734 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_branch_action=> 'f?p=&FLOW_ID.:TUPL_CONSTRAINTS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6138122155953715+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6141416868953740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_branch_action=> 'f?p=&FLOW_ID.:TUPL_CONSTRAINTS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6137917295953713+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6141604791953740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_branch_action=> 'f?p=&APP_ID.:TUPL_CONSTRAINTS:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST in (''P7_OWNERS'', ''P7_SELECT_TABLE'')',
  p_branch_comment=> 'Created 04-AUG-2010 16:18 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>6178828637695514 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_branch_action=> 'f?p=&FLOW_ID.:FORM_ON_TUPLCONS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6178507441695514+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6138302606953715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_OWNERS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 21,
  p_item_plug_id => 6135510248953694+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owners',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'LOCAL_OWNERS_LOV',
  p_lov => 'select distinct owner d, owner r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Select a table Owner',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6138505752953718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_SELECT_TABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 22,
  p_item_plug_id => 6135510248953694+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select Table',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select table_name d, table_name r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'where owner = :P7_OWNERS'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select a table',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6138718482953718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_GEN_DI_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 131,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '0',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6138925472953718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_RESTABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 129,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIRESULTS',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6139128238953718 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_RESTABLE_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 127,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIMGR',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Owner',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6139317768953719 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_GEN_DB_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 53,
  p_item_plug_id => 6135715352953702+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6139505228953719 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_CHECK_CON_STATUS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 6135715352953702+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '1',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Check Constraint Status',
  p_source_type=> 'STATIC',
  p_display_as=> 'RADIOGROUP',
  p_named_lov=> 'CONSTRAINT_STATUS_LOV',
  p_lov => '.'||to_char(6063802555448194 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13288905835535673 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_INCLUDE_ONLY_FAILED_CONS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 126,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Include only constraints whose validation results (most recent)  have failed',
  p_source_type=> 'STATIC',
  p_display_as=> 'CHECKBOX',
  p_lov => 'STATIC:Yes;1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13289722111540290 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_DIMGR_USER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 128,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select only Constraints Created By',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'DIMGR_USERS_LOV',
  p_lov => 'select user_name d, user_name r'||chr(10)||
'from APEX_WORKSPACE_APEX_USERS a'||chr(10)||
'where'||chr(10)||
'    A.WORKSPACE_NAME = ''OTE_TEAM_WS'''||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Select a User --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13290331462543010 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_UPDATED_FROM',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select only constraints Updated From',
  p_source_type=> 'STATIC',
  p_display_as=> 'PICK_DATE_DD_MM_YYYY',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13317419649936994 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_UPDATED_TO',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 132,
  p_item_plug_id => 6135911803953704+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'To',
  p_source_type=> 'STATIC',
  p_display_as=> 'PICK_DATE_DD_MM_YYYY',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6140227873953723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_computation_sequence => 20,
  p_computation_item=> 'P7_GEN_DB_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6140407216953723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_computation_sequence => 20,
  p_computation_item=> 'P7_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6140027846953720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_computation_sequence => 10,
  p_computation_item=> 'P7_GEN_DB_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6140612374953724 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_computation_sequence => 20,
  p_computation_item=> 'P7_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DI_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13218017928961900 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_computation_sequence => 30,
  p_computation_item=> 'P7_RESTABLE_OWNER',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P7_RESTABLE_OWNER)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13218726240964302 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_computation_sequence => 40,
  p_computation_item=> 'P7_RESTABLE_NAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P7_RESTABLE_NAME)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'dimgr.DIMGR_PKG.genupdDBscriptFromTupCons('||chr(10)||
':P7_OWNERS, :P7_SELECT_TABLE, :P7_CHECK_CON_STATUS);'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6140715684953724 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 7,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'genarate_update_db_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in generating update DB script',
  p_process_when=>':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'update DB script generated successfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'dimgr.DIMGR_PKG.genDIvalscriptFromTupCons('||chr(10)||
'   :P7_OWNERS, '||chr(10)||
'   :P7_SELECT_TABLE, '||chr(10)||
'   :P7_RESTABLE_OWNER, '||chr(10)||
'   :P7_RESTABLE_NAME,'||chr(10)||
'   :P7_DIMGR_USER,'||chr(10)||
'   :P7_UPDATED_FROM,'||chr(10)||
'   :P7_UPDATED_TO,'||chr(10)||
'   to_number(nvl(:P7_INCLUDE_ONLY_FAILED_CONS, ''0''))'||chr(10)||
');'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6140919792953733 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 7,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Gen_DI_validation_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in generating DI validation script!',
  p_process_when=>':REQUEST in (''GENERATE_DI_SCRIPT'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'DI validation script generated successfully!',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 7
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00008
prompt  ...PAGE 8: INTER_TABLE_CONS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 8,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'INTER_TABLE_CONS',
  p_alias  => 'INTER_TABLE_CONS',
  p_step_title=> 'Inter Table Cons',
  p_step_sub_title => 'Inter Table Cons',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'NO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110303180000',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6935007833529938 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_plug_name=> 'select a table',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
'--htp.p(''<h1>UNDER CONSTRUCTION</h1>'');'||chr(10)||
''||chr(10)||
'if :P8_GEN_DB_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P8_OWNERS, :P8_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 6935219438529941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_plug_name=> 'Generate DB Update Script  for FK Constraints',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||chr(10)||
'--htp.p(''<h1>UNDER CONSTRUCTION</h1>'');'||chr(10)||
''||chr(10)||
'if :P8_GEN_DI_SCIPT_PRESSED = ''1'' then'||chr(10)||
'    htp.p(''Output inserted in DIMGR.OUTPUT'');'||chr(10)||
'   --dimgr.DIMGR_PKG.testhtml;'||chr(10)||
'   /*dimgr.DIMGR_PKG.genHTMLupdDBscriptFromColumns('||chr(10)||
'    :P8_OWNERS, :P8_SELECT_TABLE'||chr(10)||
'   );*/'||chr(10)||
'else'||chr(10)||
'    htp.p('''');'||chr(10)||
'end if;'||chr(10)||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 6935403406529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_plug_name=> 'Generate DI Validation Scripts',
  p_region_name=>'',
  p_plug_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 31,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||chr(10)||
'''edit'', '||chr(10)||
'"OWNER" tblowner, '||chr(10)||
'"TABLE_NAME",'||chr(10)||
'"CONSTRAINT_NAME",'||chr(10)||
'"CONSTRAINT_DESC",'||chr(10)||
'dbms_lob.substr("CONSTRAINT_VALIDATION_QRY",4000,1) "CONSTRAINT_VALIDATION_QRY",'||chr(10)||
'b.type_desc,'||chr(10)||
'ref_pkowner,'||chr(10)||
'ref_pktable_name,'||chr(10)||
'ref_pkconstraint_name'||chr(10)||
',LAST_UPDATED_BY'||chr(10)||
',LAST_UPDATED'||chr(10)||
'from "DIMGR"."INTER_TABLE_CONSTRAINTS" a left outer join "#OWNER#".CONSTRAINT_TYPES b on(a.type = b.type) --using (TYPE)';

s:=s||''||chr(10)||
'where '||chr(10)||
'--owner = :P8_OWNERS AND table_name = :P8_SELECT_TABLE '||chr(10)||
'a.owner = decode(:P8_OWNERS, ''%null%'',a.owner,:P8_OWNERS) '||chr(10)||
'  and '||chr(10)||
'  a.table_name = decode(:P8_SELECT_TABLE, ''%null%'', a.table_name, :P8_SELECT_TABLE)'||chr(10)||
'  and'||chr(10)||
'  a.type = decode(:P8_CONS_TYPE, ''%null%'', a.type, :P8_CONS_TYPE)'||chr(10)||
'order by tblowner,TABLE_NAME,CONSTRAINT_NAME'||chr(10)||
'  '||chr(10)||
''||chr(10)||
'  '||chr(10)||
'';

wwv_flow_api.create_report_region (
  p_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_name=> 'Available Inter-Table Constraints',
  p_region_name=>'',
  p_template=> 5774016796395557+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_query_row_template=> 5776906238395575+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'Y',
  p_csv_output_link_text=> 'Save as CSV',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_exp_filename=> 'Inter_Table_Constraints.csv',
  p_plug_query_exp_separator=> ';',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6936300421529944 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> '''EDIT''',
  p_column_display_sequence=> 1,
  p_column_heading=> '''Edit''',
  p_column_link=>'f?p=&APP_ID.:FORM_ON_INTERTABLCONS:&SESSION.:EDIT_IT_CONS:&DEBUG.::P6_OWNER,P6_TABLE_NAME,P6_CONSTRAINT_NAME:#TBLOWNER#,#TABLE_NAME#,#CONSTRAINT_NAME#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="Edit">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6936401907529945 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'TBLOWNER',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Tblowner',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6935824063529944 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TABLE_NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Table_Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'TABLE_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6935900052529944 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_NAME',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Constraint Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6936014107529944 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_DESC',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Constraint Desc',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_DESC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6936232451529944 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Constraint Validation Qry',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_ref_schema=> 'DIMGR',
  p_ref_table_name=> 'TUPLE_CONSTRAINTS',
  p_ref_column_name=> 'CONSTRAINT_VALIDATION_QRY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7048820053359203 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'TYPE_DESC',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Type Desc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7047422563347692 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'REF_PKOWNER',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Ref PK Owner',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7047524955347692 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'REF_PKTABLE_NAME',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Ref PK Table Name',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7047632434347692 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'REF_PKCONSTRAINT_NAME',
  p_column_display_sequence=> 10,
  p_column_heading=> 'Ref PK/UK Constraint Name',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12306612060990504 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED_BY',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Last Updated By',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 12306718775990504 + wwv_flow_api.g_id_offset,
  p_region_id=> 6935620799529942 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_UPDATED',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Last Updated',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6937129171529947 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 30,
  p_button_plug_id => 6935620799529942+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE_ITABL_CONS',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'ABOVE_BOX',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:6:&SESSION.:CREATE_ITABL_CONS:&DEBUG.:6:P6_OWNER,P6_TABLE_NAME:&P8_OWNERS.,&P8_SELECT_TABLE.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6936727005529947 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 10,
  p_button_plug_id => 6935219438529941+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DB_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DB Update Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6936913149529947 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 20,
  p_button_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_button_name    => 'GENERATE_DI_SCRIPT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Generate DI Validation Script',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6940013244529961 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&APP_ID.:FORM_ON_INTERTABLCONS:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6937129171529947+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6940209984529970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&FLOW_ID.:INTER_TABLE_CONS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6936913149529947+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6940426452529970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&FLOW_ID.:INTER_TABLE_CONS:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>6936727005529947+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>6940613460529970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&APP_ID.:INTER_TABLE_CONS:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'PLSQL_EXPRESSION',
  p_branch_condition=> ':REQUEST in (''P8_OWNERS'', ''P8_SELECT_TABLE'', ''P8_CONS_TYPE'')',
  p_branch_comment=> 'Created 04-AUG-2010 16:18 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6937314029529947 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_OWNERS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 21,
  p_item_plug_id => 6935007833529938+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owners',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'LOCAL_OWNERS_LOV',
  p_lov => 'select distinct owner d, owner r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Select a table Owner',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6937521022529948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_SELECT_TABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 22,
  p_item_plug_id => 6935007833529938+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select Table',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_lov => 'select table_name d, table_name r'||chr(10)||
'from   dimgr.tables'||chr(10)||
'where owner = :P8_OWNERS'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select a table',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6937722736529948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_GEN_DI_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 141,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '0',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6937910905529948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_RESTABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 139,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIRESULTS',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6938115360529948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_RESTABLE_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 137,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'DIMGR',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Result Table Owner',
  p_source_type=> 'STATIC',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6938315257529948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_GEN_DB_SCIPT_PRESSED',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 53,
  p_item_plug_id => 6935219438529941+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6938516489529948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_CHECK_CON_STATUS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 55,
  p_item_plug_id => 6935219438529941+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '1',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Check Constraint Status',
  p_source_type=> 'STATIC',
  p_display_as=> 'RADIOGROUP',
  p_named_lov=> 'CONSTRAINT_STATUS_LOV',
  p_lov => '.'||to_char(6063802555448194 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10216317211501793 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_CONS_TYPE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 95,
  p_item_plug_id => 6935007833529938+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Type',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX_WITH_SUBMIT',
  p_named_lov=> 'INTER_TABLE_CONSTRAINT_TYPES_LOV',
  p_lov => 'select type_desc d, type r'||chr(10)||
'from   dimgr.constraint_types'||chr(10)||
'where type in (''R'', ''ITC'')'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'select type of constraint',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13222620100019351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_INCLUDE_ONLY_FAILED_CONS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 136,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Include only constraints whose validation results (most recent)  have failed',
  p_source_type=> 'STATIC',
  p_display_as=> 'CHECKBOX',
  p_lov => 'STATIC:Yes;1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13223812958026727 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_DIMGR_USER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 138,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select only Constraints Created By',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'DIMGR_USERS_LOV',
  p_lov => 'select user_name d, user_name r'||chr(10)||
'from APEX_WORKSPACE_APEX_USERS a'||chr(10)||
'where'||chr(10)||
'    A.WORKSPACE_NAME = ''OTE_TEAM_WS'''||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Select a User --',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13224426811030697 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_UPDATED_FROM',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Select only constraints Updated From',
  p_source_type=> 'STATIC',
  p_display_as=> 'PICK_DATE_DD_MM_YYYY',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>13225029497050467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_UPDATED_TO',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 142,
  p_item_plug_id => 6935403406529942+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'To',
  p_source_type=> 'STATIC',
  p_display_as=> 'PICK_DATE_DD_MM_YYYY',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 5,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6939022330529956 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 20,
  p_computation_item=> 'P8_GEN_DB_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6939221455529956 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 20,
  p_computation_item=> 'P8_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_BOX_BODY',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6938800023529949 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 10,
  p_computation_item=> 'P8_GEN_DB_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 6939413162529956 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 20,
  p_computation_item=> 'P8_GEN_DI_SCIPT_PRESSED',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST in (''GENERATE_DI_SCRIPT'')',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13220421869972546 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 30,
  p_computation_item=> 'P8_RESTABLE_OWNER',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P8_RESTABLE_OWNER)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 13221504039005221 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 40,
  p_computation_item=> 'P8_RESTABLE_NAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'upper(:P8_RESTABLE_NAME)',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'dimgr.DIMGR_PKG.genupdDBscriptFromInterTabCons('||chr(10)||
':P8_OWNERS, :P8_SELECT_TABLE, :P8_CHECK_CON_STATUS);'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6939503161529957 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'genarate_update_db_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in generating update DB script',
  p_process_when=>':REQUEST in (''GENERATE_DB_SCRIPT'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'update DB script generated successfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
''||chr(10)||
'dimgr.DIMGR_PKG.genDIvalscriptFromIntTablCons('||chr(10)||
'   :P8_OWNERS, '||chr(10)||
'   :P8_SELECT_TABLE, '||chr(10)||
'   :P8_RESTABLE_OWNER, '||chr(10)||
'   :P8_RESTABLE_NAME,'||chr(10)||
'   :P8_DIMGR_USER,'||chr(10)||
'   :P8_UPDATED_FROM,'||chr(10)||
'   :P8_UPDATED_TO,'||chr(10)||
'   to_number(nvl(:P8_INCLUDE_ONLY_FAILED_CONS, ''0'')),'||chr(10)||
'   :P8_CONS_TYPE'||chr(10)||
');'||chr(10)||
''||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6939731458529961 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Gen_DI_validation_script',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in generating DI validation script!',
  p_process_when=>':REQUEST in (''GENERATE_DI_SCRIPT'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'DI validation script generated successfully!',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 8
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00009
prompt  ...PAGE 9: Form on TUPLE_CONSTRAINTS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript"> '||chr(10)||
'	function set_validation_query() {		'||chr(10)||
'        //alert(document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'        //alert($v("P9_CONSTRAINT_VALIDATION_QRY"));'||chr(10)||
'		//if 	:P9_CONSTRAINT_VALIDATION_QRY is null'||chr(10)||
'		if (docume';

ph:=ph||'nt.getElementById("P9_CONSTRAINT_VALIDATION_QRY").value == "") {'||chr(10)||
'			//then suggest a validation query'||chr(10)||
'			var valQuery = "SELECT COUNT(*)\n" +'||chr(10)||
'				"FROM " + document.getElementById("P9_OWNER").value + "." + document.getElementById("P9_TABLE_NAME").value + "\n" +'||chr(10)||
'				"WHERE\n" +'||chr(10)||
'				"   NOT( \n" +'||chr(10)||
'				"   " + document.getElementById("P9_CONSTRAINT_CHECK_CONDITION").value + "\n" +'||chr(10)||
'				"   )\n"';

ph:=ph||';'||chr(10)||
'			document.getElementById("P9_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();'||chr(10)||
'			//alert(document.getElementById("P9_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'		}		'||chr(10)||
'	}   '||chr(10)||
'</script> ';

wwv_flow_api.create_page(
  p_id     => 9,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Form on TUPLE_CONSTRAINTS',
  p_alias  => 'FORM_ON_TUPLE_CONSTRAINTS',
  p_step_title=> 'Form on TUPLE_CONSTRAINTS',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110310121028',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>9,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>9,p_text=>ph);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6182005195794025 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Form on TUPLE_CONSTRAINTS',
  p_region_name=>'',
  p_plug_template=> 5773519023395556+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6182327752794025 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 9,
  p_button_sequence=> 30,
  p_button_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> ':P9_COME_FROM_CREATE <> ''1'' OR :REQUEST = ''EDIT_TUPL_CONS'''||chr(10)||
'/*:REQUEST NOT IN (''CREATE_TUP_CONS'');*/',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6182616899794025 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 9,
  p_button_sequence=> 10,
  p_button_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P9_COME_FROM_CREATE:0',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6182227333794025 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 9,
  p_button_sequence=> 40,
  p_button_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> ':P9_COME_FROM_CREATE = ''1'''||chr(10)||
'/*:REQUEST IN (''CREATE_TUP_CONS'');*/',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6182404879794025 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 9,
  p_button_sequence=> 20,
  p_button_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> ':P9_COME_FROM_CREATE <> ''1'' OR :REQUEST = ''EDIT_TUPL_CONS'''||chr(10)||
'/*:REQUEST NOT IN (''CREATE_TUP_CONS'');*/',
  p_button_condition_type=> 'PLSQL_EXPRESSION',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6183200363794026 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_action=> 'f?p=&APP_ID.:7:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6183406515794026 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 71,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owner',
  p_source=>'OWNER',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6183619872794027 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_TABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 72,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Table Name',
  p_source=>'TABLE_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6183820619794029 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_CONSTRAINT_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 73,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Name',
  p_source=>'CONSTRAINT_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when=>'NVL(:REQUEST, ''lala'') IN (''EDIT_TUPL_CONS'');'||chr(10)||
'',
  p_read_only_when_type=>'PLSQL_EXPRESSION',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6184211863794031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_CONSTRAINT_DESC',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 74,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Desc</br>(business rule behind this constraint, expressed in English)',
  p_source=>'CONSTRAINT_DESC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6184427017794031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_CONSTRAINT_CHECK_CONDITION',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 76,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Check Condition<br />(insert condition without CHECK keyword)',
  p_source=>'CONSTRAINT_CHECK_CONDITION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_tag_attributes  => 'onChange="set_validation_query();"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Count(*) query which returns the number of rows violating the constraint. DONT append a '';'' at the end.';

wwv_flow_api.create_page_item(
  p_id=>6184611382794031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_CONSTRAINT_VALIDATION_QRY',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 77,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Validation Qry</br>(query which returns number of rows violating the constraint)',
  p_source=>'CONSTRAINT_VALIDATION_QRY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 10,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6381228462390513 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_CONSTRAINT_COLUMNS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 75,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Columns',
  p_source=>'COLUMN_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'MULTIPLESELECT',
  p_lov => 'select COLUMN_NAME display_value, COLUMN_NAME return_value '||chr(10)||
'from COLUMNS'||chr(10)||
'where owner = :P9_OWNER and table_name = :P9_TABLE_NAME'||chr(10)||
'order by 1',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- select columns for constraint --',
  p_lov_null_value=> '',
  p_cSize=> 500,
  p_cMaxlength=> 2000,
  p_cHeight=> 30,
  p_cAttributes=> 'nowrap',
  p_tag_attributes  => 'style="width:300px"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7342319003704560 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_COME_FROM_CREATE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 87,
  p_item_plug_id => 6182005195794025+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7238825320429236 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 20,
  p_computation_item=> 'P9_CONSTRAINT_VALIDATION_QRY',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select replace(:P9_CONSTRAINT_VALIDATION_QRY,'';'')||CHR(13)'||chr(10)||
'from dual',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_computation_comment=> 'remove trailing '';'' and add a new line at the end, in case the user adds a comment following the last line of the query e.g.,'||chr(10)||
'select ...'||chr(10)||
'from ...'||chr(10)||
'where 1=1 -- this is a comment',
  p_compute_when => ':P9_CONSTRAINT_VALIDATION_QRY is not null',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7348931611793308 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 30,
  p_computation_item=> 'P9_COME_FROM_CREATE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select case when :REQUEST = ''CREATE'' then ''1'' else ''0'' end'||chr(10)||
'from dual',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => '',
  p_compute_when_type=>'%null%');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7343622728724483 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 30,
  p_computation_item=> 'P9_COME_FROM_CREATE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '1',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':REQUEST IN (''CREATE_TUP_CONS'');',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6184105419794030 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_CONSTRAINT_NAME not null',
  p_validation_sequence=> 30,
  p_validation => 'P9_CONSTRAINT_NAME',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Constraint Name must have some value.',
  p_associated_item=> 6183820619794029 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6385218250425369 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_CONSTRAINT_COLUMNS_not_null',
  p_validation_sequence=> 40,
  p_validation => 'P9_CONSTRAINT_COLUMNS',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'You must select specific columns for the constraint!',
  p_associated_item=> 6381228462390513 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7289831093691035 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_CONSTRAINT_DESC_NOTNULL',
  p_validation_sequence=> 50,
  p_validation => 'P9_CONSTRAINT_DESC',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Provide a constraint description.',
  p_associated_item=> 6184211863794031 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7290714601695789 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_CONSTRAINT_CHECK_CONDITION_NOTNULL',
  p_validation_sequence=> 60,
  p_validation => 'P9_CONSTRAINT_CHECK_CONDITION',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Provide a check condition',
  p_associated_item=> 6184427017794031 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 7291623390707769 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_CONSTRAINT_VALIDATION_QRY_NOTNULL',
  p_validation_sequence=> 70,
  p_validation => 'P9_CONSTRAINT_VALIDATION_QRY',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Provide a constraint validation query',
  p_validation_condition_type=> 'NEVER',
  p_associated_item=> 6184611382794031 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 12208405147845315 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_CONSTRAINT_NOTEXISTS_WHEN_CREATE',
  p_validation_sequence=> 90,
  p_validation => 'select 1 from tuple_constraints'||chr(10)||
'where owner = :P9_OWNER'||chr(10)||
'and table_name = :P9_TABLE_NAME'||chr(10)||
'and constraint_name = upper(:P9_CONSTRAINT_NAME)',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'The constraint you try to create already exists. Change the constraint name, or cancel and edit the existing constraint',
  p_validation_condition=> ':REQUEST IN (''CREATE'');',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 13552308759854858 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_validation_name => 'P9_VALID_QUERY',
  p_validation_sequence=> 120,
  p_validation => 'dimgr_pkg.is_valid_sql(:P9_CONSTRAINT_VALIDATION_QRY) = ''OK''',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'ERROR in SQL statement!',
  p_validation_condition=> ':REQUEST IN (''CREATE'', ''SAVE'')',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:TUPLE_CONSTRAINTS:P9_OWNER, P9_TABLE_NAME, P9_CONSTRAINT_NAME:OWNER, TABLE_NAME, CONSTRAINT_NAME';

wwv_flow_api.create_page_process(
  p_id     => 6184904186794032 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from TUPLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_when=>':REQUEST NOT IN (''CREATE_TUP_CONS'');',
  p_process_when_type=>'NEVER',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'select --OWNER'||chr(10)||
'    --,TABLE_NAME'||chr(10)||
'    --,COLUMN_NAME'||chr(10)||
'    CONSTRAINT_DESC'||chr(10)||
'    ,dbms_lob.substr(CONSTRAINT_CHECK_CONDITION,4000,1) CONSTRAINT_CHECK_CONDITION'||chr(10)||
'    ,dbms_lob.substr(CONSTRAINT_VALIDATION_QRY,4000,1) CONSTRAINT_VALIDATION_QRY'||chr(10)||
'into '||chr(10)||
'    --:P9_OWNER        '||chr(10)||
'    --,:P9_TABLE_NAME  '||chr(10)||
'    --,:P9_COLUMN_NAME '||chr(10)||
'    :P9_CONSTRAINT_DESC	'||chr(10)||
'    ,:P9_CONSTRAINT_CHECK_CONDITION	'||chr(10)||
'    ,';

p:=p||':P9_CONSTRAINT_VALIDATION_QRY		'||chr(10)||
'from dimgr.tuple_constraints'||chr(10)||
'where owner = :P9_OWNER'||chr(10)||
'and table_name = :P9_TABLE_NAME'||chr(10)||
'and constraint_name = :P9_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'select replace(wmsys.wm_concat(column_name), '','', '':'') into :P9_CONSTRAINT_COLUMNS'||chr(10)||
'from dimgr.tuple_constraints_ref_columns'||chr(10)||
'where owner = :P9_OWNER'||chr(10)||
'and table_name = :P9_TABLE_NAME'||chr(10)||
'and constraint_name = :P9_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
''||chr(10)||
'e';

p:=p||'nd;';

wwv_flow_api.create_page_process(
  p_id     => 6201511553081181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'fill_in_items',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when=>'nvl(:REQUEST, ''lala'') NOT IN (''CREATE_TUP_CONS'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if (:P9_CONSTRAINT_VALIDATION_QRY is null and :P9_CONSTRAINT_CHECK_CONDITION is not null) then'||chr(10)||
'   :P9_CONSTRAINT_VALIDATION_QRY := '||chr(10)||
'       ''SELECT COUNT(*)''||'||chr(10)||
'       CHR(10)||''FROM ''||upper(:P9_OWNER)||''.''||upper(:P9_TABLE_NAME)||'||chr(10)||
'       CHR(10)||''WHERE''||'||chr(10)||
'       CHR(10)||''   NOT( ''||'||chr(10)||
'       CHR(10)||''   ''||:P9_CONSTRAINT_CHECK_CONDITION||'||chr(10)||
'       CHR(10)||''   )'';'||chr(10)||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 7103324010989514 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set_P9_CONSTRAINT_VALIDATION_QRY',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:TUPLE_CONSTRAINTS:P9_OWNER:OWNER:P9_TABLE_NAME:TABLE_NAME|IUD';

wwv_flow_api.create_page_process(
  p_id     => 6185120569794033 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of TUPLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table TUPLE_CONSTRAINTS.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||chr(10)||
'    sel_list_arr    APEX_APPLICATION_GLOBAL.VC_ARR2; -- column constraints select list'||chr(10)||
'--xxx varchar2(50);'||chr(10)||
'BEGIN'||chr(10)||
'merge into dimgr.tuple_constraints trg'||chr(10)||
'using ('||chr(10)||
'select '||chr(10)||
':P9_OWNER owner, '||chr(10)||
':P9_TABLE_NAME table_name,'||chr(10)||
'upper(:P9_CONSTRAINT_NAME) constraint_name,'||chr(10)||
':P9_CONSTRAINT_DESC CONSTRAINT_DESC, '||chr(10)||
':P9_CONSTRAINT_CHECK_CONDITION CONSTRAINT_CHECK_CONDITION, '||chr(10)||
':P9_CONSTRAINT_VALIDATION';

p:=p||'_QRY CONSTRAINT_VALIDATION_QRY'||chr(10)||
',:APP_USER appuser , sysdate updt_date'||chr(10)||
'from dual'||chr(10)||
') src'||chr(10)||
'ON (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name)'||chr(10)||
'WHEN MATCHED THEN '||chr(10)||
'    UPDATE SET'||chr(10)||
'     trg.CONSTRAINT_DESC =  src.CONSTRAINT_DESC,'||chr(10)||
'     trg.CONSTRAINT_CHECK_CONDITION = src.CONSTRAINT_CHECK_CONDITION,'||chr(10)||
'     trg.CONSTRAINT_VALIDATION_QRY =  src.C';

p:=p||'ONSTRAINT_VALIDATION_QRY'||chr(10)||
'     ,trg.LAST_UPDATED_BY  = src.appuser'||chr(10)||
'     ,trg.LAST_UPDATED = src.updt_date'||chr(10)||
'WHEN NOT MATCHED THEN'||chr(10)||
' insert ('||chr(10)||
' trg.owner'||chr(10)||
',trg.table_name'||chr(10)||
',trg.constraint_name'||chr(10)||
',trg.CONSTRAINT_DESC'||chr(10)||
',trg.CONSTRAINT_CHECK_CONDITION'||chr(10)||
',trg.CONSTRAINT_VALIDATION_QRY'||chr(10)||
',trg.LAST_UPDATED_BY '||chr(10)||
',trg.LAST_UPDATED'||chr(10)||
')'||chr(10)||
'values ('||chr(10)||
' src.owner'||chr(10)||
',src.table_name'||chr(10)||
',src.constraint_name'||chr(10)||
',src.CONSTRAIN';

p:=p||'T_DESC'||chr(10)||
',src.CONSTRAINT_CHECK_CONDITION'||chr(10)||
',src.CONSTRAINT_VALIDATION_QRY'||chr(10)||
',src.appuser'||chr(10)||
',src.updt_date'||chr(10)||
');'||chr(10)||
''||chr(10)||
''||chr(10)||
'-- clear old rows from tuple_constraints_ref_columns'||chr(10)||
'delete from dimgr.tuple_constraints_ref_columns trg'||chr(10)||
'where trg.owner = :P9_OWNER  and'||chr(10)||
'trg.table_name = :P9_TABLE_NAME and'||chr(10)||
'trg.constraint_name = upper(:P9_CONSTRAINT_NAME);'||chr(10)||
''||chr(10)||
'-- merge into tuple_constraints_ref_columns'||chr(10)||
'sel_list_arr ';

p:=p||':= APEX_UTIL.STRING_TO_TABLE(:P9_CONSTRAINT_COLUMNS);'||chr(10)||
'FOR z IN 1..sel_list_arr.count LOOP'||chr(10)||
''||chr(10)||
'   merge into dimgr.tuple_constraints_ref_columns trg'||chr(10)||
'   using ('||chr(10)||
'      select '||chr(10)||
'       :P9_OWNER owner, '||chr(10)||
'       :P9_TABLE_NAME table_name,'||chr(10)||
'       upper(:P9_CONSTRAINT_NAME) constraint_name,'||chr(10)||
'       sel_list_arr(z) col_name '||chr(10)||
'     from dual'||chr(10)||
'   ) src'||chr(10)||
'   ON (trg.owner = src.owner and trg.table_name = s';

p:=p||'rc.table_name and trg.constraint_name = src.constraint_name and trg.column_name = src.col_name )'||chr(10)||
'WHEN NOT MATCHED THEN'||chr(10)||
' insert ('||chr(10)||
' trg.owner'||chr(10)||
',trg.table_name'||chr(10)||
',trg.constraint_name'||chr(10)||
',trg.column_name'||chr(10)||
')'||chr(10)||
'values ('||chr(10)||
' src.owner'||chr(10)||
',src.table_name'||chr(10)||
',src.constraint_name'||chr(10)||
',src.col_name'||chr(10)||
'); '||chr(10)||
''||chr(10)||
'--select sel_list_arr(z) into xxx from dual;'||chr(10)||
''||chr(10)||
'END LOOP;'||chr(10)||
''||chr(10)||
'commit;'||chr(10)||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 6273514760820891 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 35,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'MERGE_INTO_TUPLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error while merging into TUPLE_CONSTRAINTS',
  p_process_when=>':REQUEST in (''SAVE'', ''CREATE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'TUPLE_CONSTRAINTS merged succesfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'delete from dimgr.tuple_constraints_ref_columns'||chr(10)||
'where'||chr(10)||
'owner = :P9_OWNER'||chr(10)||
'and table_name = :P9_TABLE_NAME'||chr(10)||
'and constraint_name = :P9_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'delete from dimgr.tuple_constraints'||chr(10)||
'where '||chr(10)||
'owner = :P9_OWNER'||chr(10)||
'and table_name = :P9_TABLE_NAME'||chr(10)||
'and constraint_name = :P9_CONSTRAINT_NAME;'||chr(10)||
''||chr(10)||
'commit;';

wwv_flow_api.create_page_process(
  p_id     => 6283723108126039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DELETE_FROM_TUPLE_CONSTRAINTS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'error in deleting row from tuple_constraints',
  p_process_when=>':REQUEST in (''DELETE'');',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'row deleted from tuple_constraints',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'9';

wwv_flow_api.create_page_process(
  p_id     => 6185317805794033 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 9
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00012
prompt  ...PAGE 12: Master Detail
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>';

wwv_flow_api.create_page(
  p_id     => 12,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'Master Detail',
  p_step_title=> 'Master Detail',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20100804161341',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>12,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>12,p_text=>ph);
end;
 
end;
/

 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 5870826764396745 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 40,
  p_button_plug_id => 5868707613396743+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Add Row',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5866610131396741 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 30,
  p_button_plug_id => 5866331220396741+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P12_OWNER',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5870627020396745 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 30,
  p_button_plug_id => 5868707613396743+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'select 1 '||chr(10)||
'from "#OWNER#"."COLUMNS"'||chr(10)||
'where "OWNER" = :P12_OWNER',
  p_button_condition_type=> 'EXISTS',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5866930574396742 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 10,
  p_button_plug_id => 5866331220396741+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5866529928396741 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 40,
  p_button_plug_id => 5866331220396741+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P12_OWNER',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5866715812396741 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 20,
  p_button_plug_id => 5866331220396741+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> 'P12_OWNER',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5870730781396745 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 20,
  p_button_plug_id => 5868707613396743+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>5868624354396743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_branch_action=> 'f?p=&APP_ID.:2:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>5866610131396741+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>5872304634396747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_branch_action=> 'f?p=&APP_ID.:12:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5867532570396742 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Owner',
  p_source=>'OWNER',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5867724229396742 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_TABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Table Name',
  p_source=>'TABLE_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:TABLES:P12_OWNER:OWNER:P12_TABLE_NAME:TABLE_NAME';

wwv_flow_api.create_page_process(
  p_id     => 5868012041396743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from TABLES',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:COLUMNS:OWNER:TABLE_NAME';

wwv_flow_api.create_page_process(
  p_id     => 5871406841396746 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process update.',
  p_process_when_button_id=>5870627020396745 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:COLUMNS:OWNER:TABLE_NAME';

wwv_flow_api.create_page_process(
  p_id     => 5871600703396746 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process delete.',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:TABLES:P12_OWNER:OWNER:P12_TABLE_NAME:TABLE_NAME|IUD';

wwv_flow_api.create_page_process(
  p_id     => 5868222058396743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of TABLES',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table TABLES.',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:COLUMNS:OWNER:TABLE_NAME';

wwv_flow_api.create_page_process(
  p_id     => 5871931093396746 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process update.',
  p_process_when_button_id=>5870826764396745 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'12';

wwv_flow_api.create_page_process(
  p_id     => 5868432652396743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_when_button_id=>5866715812396741 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'1';

wwv_flow_api.create_page_process(
  p_id     => 5872113133396746 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'ADD_ROWS_TO_TABULAR_FORM',
  p_process_name=> 'AddRows',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to add rows.',
  p_process_when_button_id=>5870826764396745 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 12
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00014
prompt  ...PAGE 14: Form on COLUMNS
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script type="text/javascript"> '||chr(10)||
'	function set_validation_query() {		'||chr(10)||
'        //alert(document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'        //alert($v("P14_CONSTRAINT_VALIDATION_QRY"));'||chr(10)||
'		//if 	:P14_CONSTRAINT_VALIDATION_QRY is null'||chr(10)||
'		if (document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value == "") {'||chr(10)||
'			//then suggest a validation query'||chr(10)||
'			var valQuery = "SELECT ';

ph:=ph||'COUNT(*)\n" +'||chr(10)||
'				"FROM " + document.getElementById("P14_OWNER").value + "." + document.getElementById("P14_TABLE_NAME").value + "\n" +'||chr(10)||
'				"WHERE\n" +'||chr(10)||
'				"   NOT( \n" +'||chr(10)||
'				"   " + document.getElementById("P14_CONSTRAINT_CHECK_CONDITION").value + "\n" +'||chr(10)||
'				"   )\n";'||chr(10)||
'			document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();'||chr(10)||
'			//alert(document.getElementB';

ph:=ph||'yId("P14_CONSTRAINT_VALIDATION_QRY").value);'||chr(10)||
'		}		'||chr(10)||
'	}   '||chr(10)||
'</script> ';

wwv_flow_api.create_page(
  p_id     => 14,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'Form on COLUMNS',
  p_alias  => 'FORM_ON_COLUMNS',
  p_step_title=> 'Form on COLUMNS',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20110310121131',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>14,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>14,p_text=>ph);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5881429571475806 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 14,
  p_plug_name=> 'Edit Column Constraints',
  p_region_name=>'',
  p_plug_template=> 5773519023395556+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 5881620171475806 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 14,
  p_button_sequence=> 30,
  p_button_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P14_OWNER',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 5881807547475806 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 14,
  p_button_sequence=> 10,
  p_button_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(5772529788395549+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:COL_CONSTRAINTS:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>5882011497475806 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_branch_action=> 'f?p=&APP_ID.:COL_CONSTRAINTS:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5882222463475806 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_OWNER',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Owner',
  p_source=>'OWNER',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5882414420475806 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_TABLE_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Table Name',
  p_source=>'TABLE_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5882602608475807 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_COLUMN_ID',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Column Id',
  p_source=>'COLUMN_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 22,
  p_cMaxlength=> 22,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5883030995475818 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_COLUMN_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Column Name',
  p_source=>'COLUMN_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 21,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5883402604475819 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_DATA_TYPE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Data Type',
  p_source=>'DATA_TYPE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 19,
  p_cMaxlength=> 18,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Length of the column (in bytes)';

wwv_flow_api.create_page_item(
  p_id=>5883800800475819 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_DATA_LENGTH',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Data Length',
  p_source=>'DATA_LENGTH',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 19,
  p_cMaxlength=> 18,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5884317887475829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_DATA_PRECISION',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 7,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Data Precision',
  p_source=>'DATA_PRECISION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 19,
  p_cMaxlength=> 18,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5884524361475829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_DATA_SCALE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 8,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Data Scale',
  p_source=>'DATA_SCALE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 19,
  p_cMaxlength=> 18,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5884729181475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_COLUMN_DESC',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 9,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Column Desc',
  p_source=>'COLUMN_DESC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5884912165475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_COLUMN_COMMENT',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Column Comment',
  p_source=>'COLUMN_COMMENT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5885125153475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_NULLABLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 11,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nullable',
  p_source=>'NULLABLE_DEFAULT_',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 1,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777228781395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5885519425475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_CONSTRAINT_DESC',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 12,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Desc</br>(business rule behind this constraint, expressed in English)',
  p_source=>'CONSTRAINT_DESC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5885712578475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_CONSTRAINT_CHECK_CONDITION',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 13,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Check Condition <br />(insert condition without CHECK keyword)',
  p_source=>'CONSTRAINT_CHECK_CONDITION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 4,
  p_tag_attributes  => 'onChange="set_validation_query();"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Count(*) query which returns the number of rows violating the constraint. DONT append a '';'' at the end.';

wwv_flow_api.create_page_item(
  p_id=>5885924855475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_CONSTRAINT_VALIDATION_QRY',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 14,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Validation Qry</br>(query which returns number of rows violating the constraint)',
  p_source=>'CONSTRAINT_VALIDATION_QRY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXTAREA',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 120,
  p_cMaxlength=> 500,
  p_cHeight=> 10,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5886121036475830 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_CONSTRAINT_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 5881429571475806+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Constraint Name',
  p_source=>'CONSTRAINT_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 7236511898406445 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_computation_sequence => 10,
  p_computation_item=> 'P14_CONSTRAINT_VALIDATION_QRY',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'select replace(:P14_CONSTRAINT_VALIDATION_QRY,'';'')'||chr(10)||
'from dual',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_compute_when => ':P14_CONSTRAINT_VALIDATION_QRY is not null',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5882926635475807 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_validation_name => 'P14_COLUMN_ID not null',
  p_validation_sequence=> 3,
  p_validation => 'P14_COLUMN_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Column Id must have some value.',
  p_associated_item=> 5882602608475807 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5883332445475819 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_validation_name => 'P14_COLUMN_NAME not null',
  p_validation_sequence=> 4,
  p_validation => 'P14_COLUMN_NAME',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Column Name must have some value.',
  p_associated_item=> 5883030995475818 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5883718849475819 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_validation_name => 'P14_DATA_TYPE not null',
  p_validation_sequence=> 5,
  p_validation => 'P14_DATA_TYPE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Data Type must have some value.',
  p_associated_item=> 5883402604475819 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 5885418692475830 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_validation_name => 'P14_NULLABLE_ not null',
  p_validation_sequence=> 11,
  p_validation => 'P14_NULLABLE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Nullable Default  must have some value.',
  p_associated_item=> 5885125153475830 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 13555207505863920 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_validation_name => 'P14_VALID_QUERY',
  p_validation_sequence=> 130,
  p_validation => 'dimgr_pkg.is_valid_sql(:P14_CONSTRAINT_VALIDATION_QRY) = ''OK''',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'ERROR in SQL statement!',
  p_validation_condition=> ':REQUEST IN ( ''SAVE'')',
  p_validation_condition_type=> 'PLSQL_EXPRESSION',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:COLUMNS:P14_OWNER, P14_TABLE_NAME, P14_COLUMN_NAME:OWNER, TABLE_NAME, COLUMN_NAME';

wwv_flow_api.create_page_process(
  p_id     => 5886421269475831 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from COLUMNS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if (:P14_CONSTRAINT_VALIDATION_QRY is null and :P14_CONSTRAINT_CHECK_CONDITION is not null) then'||chr(10)||
'   :P14_CONSTRAINT_VALIDATION_QRY := '||chr(10)||
'       ''SELECT COUNT(*)''||'||chr(10)||
'       CHR(10)||''FROM ''||upper(:P14_OWNER)||''.''||upper(:P14_TABLE_NAME)||'||chr(10)||
'       CHR(10)||''WHERE''||'||chr(10)||
'       CHR(10)||''   NOT( ''||'||chr(10)||
'       CHR(10)||''   ''||:P14_CONSTRAINT_CHECK_CONDITION||'||chr(10)||
'       CHR(10)||''   )'';'||chr(10)||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 7123127931548877 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set_P14_CONSTRAINT_VALIDATION_QRY',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:COLUMNS:P14_OWNER, P14_TABLE_NAME, P14_COLUMN_NAME:OWNER, TABLE_NAME, COLUMN_NAME|U';

wwv_flow_api.create_page_process(
  p_id     => 5886621648475831 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of COLUMNS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table COLUMNS.',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'update dimgr.columns t'||chr(10)||
'            SET    --COLUMN_ID                  = :P14_COLUMN_ID,'||chr(10)||
'                   --DATA_TYPE                  = :P14_DATA_TYPE,'||chr(10)||
'                   --DATA_LENGTH                = :P14_DATA_LENGTH,'||chr(10)||
'                   --DATA_PRECISION             = :P14_DATA_PRECISION,'||chr(10)||
'                   --DATA_SCALE                 = :P14_DATA_SCALE,'||chr(10)||
'                   t.COLUMN_DESC ';

p:=p||'               = :P14_COLUMN_DESC,'||chr(10)||
'                   t.COLUMN_COMMENT             = :P14_COLUMN_COMMENT,'||chr(10)||
'                   t.NULLABLE                   = upper(substr(trim(:P14_NULLABLE),1,1)),'||chr(10)||
'                   t.CONSTRAINT_DESC            = :P14_CONSTRAINT_DESC,'||chr(10)||
'                   t.CONSTRAINT_CHECK_CONDITION = :P14_CONSTRAINT_CHECK_CONDITION,'||chr(10)||
'                   t.CONSTRAINT_VALIDATION_Q';

p:=p||'RY  = :P14_CONSTRAINT_VALIDATION_QRY,'||chr(10)||
'                   t.CONSTRAINT_NAME            = upper(:P14_CONSTRAINT_NAME)'||chr(10)||
'                   ,t.LAST_UPDATED_BY           = :APP_USER'||chr(10)||
'                   ,t.LAST_UPDATED              = sysdate  '||chr(10)||
'        where'||chr(10)||
'            t.owner = :P14_OWNER'||chr(10)||
'            and t.table_name = :P14_TABLE_NAME'||chr(10)||
'            and t.column_name = :P14_COLUMN_NAME;'||chr(10)||
'         '||chr(10)||
' ';

p:=p||'       commit;';

wwv_flow_api.create_page_process(
  p_id     => 5959817206835004 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Update_table_Columns',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Error in updating Column constraints',
  p_process_when=>':REQUEST in (''SAVE'')',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> 'Column constraints updated successfully',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'14';

wwv_flow_api.create_page_process(
  p_id     => 5886830597475831 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'select --OWNER'||chr(10)||
'    --,TABLE_NAME'||chr(10)||
'    --,COLUMN_NAME'||chr(10)||
'    COLUMN_ID'||chr(10)||
'    ,DATA_TYPE'||chr(10)||
'    ,DATA_LENGTH'||chr(10)||
'    ,DATA_PRECISION'||chr(10)||
'    ,DATA_SCALE'||chr(10)||
'    ,COLUMN_DESC'||chr(10)||
'    ,COLUMN_COMMENT'||chr(10)||
'    ,NULLABLE'||chr(10)||
'    ,CONSTRAINT_DESC'||chr(10)||
'    ,dbms_lob.substr(CONSTRAINT_CHECK_CONDITION,4000,1) CONSTRAINT_CHECK_CONDITION'||chr(10)||
'    ,dbms_lob.substr(CONSTRAINT_VALIDATION_QRY,4000,1) CONSTRAINT_VALIDATION_QRY'||chr(10)||
'    ,CONS';

p:=p||'TRAINT_NAME'||chr(10)||
'into '||chr(10)||
'    --:P14_OWNER        '||chr(10)||
'    --,:P14_TABLE_NAME  '||chr(10)||
'    --,:P14_COLUMN_NAME '||chr(10)||
'    :P14_COLUMN_ID   '||chr(10)||
'    ,:P14_DATA_TYPE	'||chr(10)||
'    ,:P14_DATA_LENGTH	'||chr(10)||
'    ,:P14_DATA_PRECISION	'||chr(10)||
'    ,:P14_DATA_SCALE		'||chr(10)||
'    ,:P14_COLUMN_DESC	'||chr(10)||
'    ,:P14_COLUMN_COMMENT	'||chr(10)||
'    ,:P14_NULLABLE		'||chr(10)||
'    ,:P14_CONSTRAINT_DESC	'||chr(10)||
'    ,:P14_CONSTRAINT_CHECK_CONDITION	'||chr(10)||
'    ,:P14_CONSTRAINT_VALIDATION_QRY	'||chr(10)||
'    ';

p:=p||',:P14_CONSTRAINT_NAME	'||chr(10)||
'from dimgr.columns'||chr(10)||
'where owner = :P14_OWNER'||chr(10)||
'and table_name = :P14_TABLE_NAME'||chr(10)||
'and column_name = :P14_COLUMN_NAME;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6010814904999344 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'myfetch row from columns',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 14
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Login
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 101,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Login',
  p_alias  => 'LOGIN',
  p_step_title=> 'Login',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => 5771927570395541+ wwv_flow_api.g_id_offset,
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss => '20100713151540',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5779132639395643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login',
  p_region_name=>'',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5779200444395656 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 5779132639395643+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'User Name',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 2,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5779300600395670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 5779132639395643+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'PASSWORD_WITH_ENTER_SUBMIT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 5777312003395583+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>5779424150395671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 5779132639395643+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default => 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(5772529788395549 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'owa_util.mime_header(''text/html'', FALSE);'||chr(10)||
'owa_cookie.send('||chr(10)||
'    name=>''LOGIN_USERNAME_COOKIE'','||chr(10)||
'    value=>lower(:P101_USERNAME));'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 5779627954395683 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'wwv_flow_custom_auth_std.login('||chr(10)||
'    P_UNAME       => :P101_USERNAME,'||chr(10)||
'    P_PASSWORD    => :P101_PASSWORD,'||chr(10)||
'    P_SESSION_ID  => v(''APP_SESSION''),'||chr(10)||
'    P_FLOW_PAGE   => :APP_ID||'':import_table'''||chr(10)||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 5779521931395671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 5779807417395684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||chr(10)||
'    v varchar2(255) := null;'||chr(10)||
'    c owa_cookie.cookie;'||chr(10)||
'begin'||chr(10)||
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');'||chr(10)||
'   :P101_USERNAME := c.vals(1);'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 5779729280395683 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 5779900093395684 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
wwv_flow_api.create_menu_option (
  p_id=>5865505835396738 + wwv_flow_api.g_id_offset,
  p_menu_id=>5779900093395684 + wwv_flow_api.g_id_offset,
  p_parent_id=>5865412998396738 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Master Detail',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:12:&SESSION.',
  p_page_id=>12,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

prompt  ...page templates for application: 112
--
--application/shared_components/user_interface/templates/page/no_tabs_with_sidebar
prompt  ......Page template 5771526552395528
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16UserPrompt"><br /></td>'||chr(10)||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<br class="t16Break"/>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary=""  width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16SideBarTitle" align="right"><img src="#IMAGE_PREFIX#themes/theme_16/left_sidebar_cap.png" alt="" /></td>'||chr(10)||
'<td class="t16NavBodySpace"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="1" alt="" /></td>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src';

c3:=c3||'="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16SideBar" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td class="t16NavBodySpace"><br /></td>'||chr(10)||
'<td valign="top" height="100%';

c3:=c3||'">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table';

c3:=c3||'>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td style="width:15px;"><br /></td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</';

c3:=c3||'table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16BottomRight"><br /></td>'||chr(10)||
'<td class="t16NavBodySpace"><br /></td>'||chr(10)||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" class="pageBottom">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table';

c3:=c3||'></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5771526552395528 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 17,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_sidebar
prompt  ......Page template 5771610195395540
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16UserPrompt"><br /></td>'||chr(10)||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<br class="t16Break"/>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="TabHolder">#PARE';

c3:=c3||'NT_TAB_CELLS#</div>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" height="70%">'||chr(10)||
''||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3">'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" class="t16SubTab">'||chr(10)||
'<tr>'||chr(10)||
'#TAB_CELLS#<td width="100%"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
''||chr(10)||
'<tr>'||chr(10)||
'<td class="t16SideBarTitle" align="right"><img src="#IMAGE_PREFIX#themes/theme_16/left_sidebar_c';

c3:=c3||'ap.png" alt="" /></td>'||chr(10)||
'<td class="t16NavBodySpace"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="1" alt="" /></td>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||chr(10)||
'<td><img';

c3:=c3||' src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16SideBar" valign="top"><div class="t16Tabs">#REGION_POSITION_02#</td>'||chr(10)||
'<td class="t16NavBodySpace"><br /></td>'||chr(10)||
'<td valign="top" height="100%">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme';

c3:=c3||'_16/t16PageTopCapLeft.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top';

c3:=c3||'" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td style="width:15px;"><br /></td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16BottomRight"><br /></td>'||chr(10)||
'<td class="t16NavBodySpace"><br /></td>'||chr(10)||
'<td><table summary="" width="100%" cel';

c3:=c3||'lpadding="0" cellspacing="0" class="pageBottom">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5771610195395540 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td class="M" valign="middle"><span>#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 18,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 5771721468395541
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD# class="popup">#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t16messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5771721468395541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t16NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_with_sidebar
prompt  ......Page template 5771826877395541
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16UserPrompt"><br /></td>'||chr(10)||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<br class="t16Break"/>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary="" width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3">'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td><div class="TabHolder">#TAB_CELLS#</div></td>'||chr(10)||
'<td style="width:5px;"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16SideBarTitle" align="right"><img src="#IMAGE_PREFIX#themes/theme_16/left_sidebar_cap.png" alt=';

c3:=c3||'"" /></td>'||chr(10)||
'<td class="t16NavBodySpace"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="1" alt="" /></td>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||chr(10)||
'<td><img src="#IMAGE';

c3:=c3||'_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16SideBar" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td class="t16NavBodySpace"><br /></td>'||chr(10)||
'<td valign="top" height="100%">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt=""';

c3:=c3||' /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" height="100%"><div class="t16me';

c3:=c3||'ssages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td style="width:15px;"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="400" width="1" alt="" /><br /></td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16BottomRight"><br /></td>'||chr(10)||
'<td class="t16NavBodySpace"><br /></td>'||chr(10)||
'<td><ta';

c3:=c3||'ble summary="" width="100%" cellpadding="0" cellspacing="0" border="0" class="pageBottom">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="400" alt="" />'||chr(10)||
'</td>'||chr(10)||
'</t';

c3:=c3||'r>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5771826877395541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '| <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 16,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 5771927570395541
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="50%" align="center">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t15ContentB';

c3:=c3||'ody" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0" align="center">'||chr(10)||
'<tr>'||chr(10)||
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMid';

c3:=c3||'dle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table></td></tr>'||chr(10)||
'<td width="100%" valign="top" height="100%" id="t16PageBody" style="padding:4px;"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_03##REGION_POSITION_04#</td>'||chr(10)||
'';

c3:=c3||'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="pageBottom"><table summary="" width="100%" cellpadding="0" cellspacing="0">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5771927570395541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t16NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 5772012640395541
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<br class="t16Break"/>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary="" width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td><div class="TabHolder">#TAB_CELLS#</div></td>'||chr(10)||
'<td style="width:5px;"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>	'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" height="8">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/t';

c3:=c3||'heme_16/breadcrumb_cap.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" height="100%">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#IMAGE_PREF';

c3:=c3||'IX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||chr(10)||
'<tr>'||chr(10)||
'<td width="10';

c3:=c3||'0%" valign="top" height="100%"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" border="0" class="pageBottom">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#the';

c3:=c3||'mes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5772012640395541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '| <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '12');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 5772113559395541
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16UserPrompt"><br /></td>'||chr(10)||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<br class="t16Break"/>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary=""  width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16BreadCrumbRegion">#REGION_POSITION_01#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table><';

c3:=c3||'/td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" height="100%">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Page';

c3:=c3||'TopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td style="width:15px;"><br /';

c3:=c3||'></td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" border="0" class="pageBottom">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5772113559395541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 5772212785395542
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t16messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5772212785395542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t16NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 5772304142395542
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V3.css" type="text/css" />'||chr(10)||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16UserPrompt"><br /></td>'||chr(10)||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<br class="t16Break"/>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="TabHolder">#PARE';

c3:=c3||'NT_TAB_CELLS#</div>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" class="t16SubTab">'||chr(10)||
'<tr>'||chr(10)||
'#TAB_CELLS#<td width="100%"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFI';

c3:=c3||'X#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" height="100%">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||chr(10)||
'<tr><td><img src="#';

c3:=c3||'IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||chr(10)||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||chr(10)||
'<tr>'||chr(10)||
'<td';

c3:=c3||' width="100%" valign="top" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td style="width:15px;"><br /></td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" class';

c3:=c3||'="pageBottom">'||chr(10)||
'<tr>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 5772304142395542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#TAB_INLINE_EDIT#',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '8');
end;
 
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 5772424665395542
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button2">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button2Left.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button2Right.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>5772424665395542 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_template_comment       => 'Standard Button');
end;
/
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 5772529788395549
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Left.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Right.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>5772529788395549 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_template_comment       => 'Standard Button');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 5772603051395549
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button1">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Left.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Right.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>5772603051395549 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_template_comment       => 'XP Square FFFFFF');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 5772700489395549
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button3">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button3Left.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button3Right.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>5772700489395549 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_template_comment       => 'Standard Button');
end;
/
---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 5772802677395549
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" style="width:600px;">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader">#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" h';

t:=t||'eight="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#';

t:=t||'themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5772802677395549 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5772802677395549 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 5772927293395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5772927293395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5772927293395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 5773008505395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16NavigationRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" width="210" style="table-layout:fixed;">'||chr(10)||
'<col width="25" /><col width="185" />'||chr(10)||
'<tr>'||chr(10)||
'<th align="center" style="border-top:2px solid #839fcd;border-bottom:1px solid #275096;background-color:#4167a7;" colspan="2"><img src="#IMAGE_PREFIX#themes/theme_16/navbar_top.gif" onclick="htmldb_ToggleWithIm';

t:=t||'age(''t#REGION_ID#'',''body#REGION_ID#'')"" class="pb" /></th>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td style="background-color:#4167A7;"><img src="#IMAGE_PREFIX#themes/theme_16/sidebar_tab_minus.png" onclick="htmldb_ToggleWithImage(this,''body#REGION_ID#'')" id="t#REGION_ID#" class="pb" /></td>'||chr(10)||
'<th width="100%" style="background-color:#4167A7;">#TITLE#</th>'||chr(10)||
'</tr>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td><br /></td>'||chr(10)||
'<td class="t16R';

t:=t||'egionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773008505395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773008505395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 5773101257395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_';

t:=t||'ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16ChartIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</';

t:=t||'td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="">#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>';

t:=t||''||chr(10)||
'</tfoot>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773101257395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773101257395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 5773205041395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader">#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /><';

t:=t||'/td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Re';

t:=t||'gionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773205041395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773205041395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 5773314074395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_';

t:=t||'ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16ChartIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</';

t:=t||'td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16RegionBody">#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""';

t:=t||'/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773314074395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773314074395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 5773407400395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<th align="left" style="text-align:left;">#TITLE#</th>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16Borderless">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="t1';

t:=t||'6RegionBody">#BODY#</td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773407400395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 16,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773407400395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 5773519023395556
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" width="7" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''bo';

t:=t||'dy#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" width="7" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</t';

t:=t||'d>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'';

t:=t||'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773519023395556 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 16,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773519023395556 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 5773622929395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16NavigationRegionAlternative1" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" width="210" style="table-layout:fixed;">'||chr(10)||
'<col width="25" /><col width="185" />'||chr(10)||
'<tr><td><br /></td><th class="t16RegionHeader">#TITLE#</th></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><br /></td><td class="t16RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773622929395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773622929395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 5773715047395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16ButtonRegionWithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773715047395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773715047395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 5773808227395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_';

t:=t||'ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16ReportIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#<';

t:=t||'/td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16RegionBody">#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt="';

t:=t||'"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773808227395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773808227395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 5773917503395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" style="width:200px;">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader">#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" h';

t:=t||'eight="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16ChartIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="">#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#theme';

t:=t||'s/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5773917503395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5773917503395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 5774016796395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" width="7"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''bo';

t:=t||'dy#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top" width="7"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</t';

t:=t||'d>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'';

t:=t||'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774016796395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774016796395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 5774124859395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16SideBarRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr class="t16RegionHeader"><th>#TITLE#</th></tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774124859395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774124859395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 5774200200395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" style="border:#a2a2a2 1px solid;border-top:none;">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<th class="t16RegionHeader" style="padding-left:12px;"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_ID#'')" class="pb" />#TITLE#</th>'||chr(10)||
'</tr>'||chr(10)||
'</thead';

t:=t||'>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16Alt1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774200200395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774200200395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 5774309421395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16RegionWithoutTitle" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<td class="t16ButtonHolder"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND';

t:=t||'##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774309421395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774309421395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_title
prompt  ......region template 5774401810395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16RegionWithoutButtonsAndTitle" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tbody id="body#REGION_ID#" class="">'||chr(10)||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774401810395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774401810395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 5774532442395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ButtonRegionWithTitle" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<th class="t16RegionHeader">#TITLE#</th>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>'||chr(10)||
'#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774532442395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774532442395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 5774603403395557
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" style="width:600px;">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader">#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" h';

t:=t||'eight="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#';

t:=t||'themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774603403395557 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 16,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774603403395557 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 5774729002395559
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_plus.gif" alt="Toggle" align="middle" onclick="htmldb_ToggleTableBody(this,''body#RE';

t:=t||'GION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" style="display:none;">'||chr(10)||
'<tr>'||chr(10)||
'<td class="RL"><br /></td>'||chr(10)||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##H';

t:=t||'ELP#</td>'||chr(10)||
'<td class="RR"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="RL"><br /></td><td class="t16RegionBody">#BODY#</td><td class="RR"><br /></td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=';

t:=t||'""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774729002395559 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774729002395559 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 5774809200395559
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t16ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<thead>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="Toggle" align="middle" onclick="htmldb_ToggleTableBody(this,''body#R';

t:=t||'EGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</thead>'||chr(10)||
'<tbody id="body#REGION_ID#" class="t16Bracketed">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16ButtonHolder" colspan="3">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>';

t:=t||''||chr(10)||
'<tr><td class="t16RegionBody" colspan="3">#BODY#</td></tr>'||chr(10)||
'</tbody>'||chr(10)||
'<tfoot>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionBCapLeft.png" border="0" height="27" alt="" /></td>'||chr(10)||
'<th class="t16RegionHeaderB"><br /></th>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionBCapRight.png" border="0" height="27" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tfoot>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 5774809200395559 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 16,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 5774809200395559 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 5774922085395559
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t16current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5774922085395559 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t16VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 5775020944395566
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t16current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775020944395566 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t16HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tree_list
prompt  ......list template 5775123119395566
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>5775123119395566 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 16,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="htmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 5775228967395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t16current"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775228967395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t16VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 5775303232395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td valign="bottom" class="t16SepL"><img src="#IMAGE_PREFIX#themes/theme_16/tab_list_left_cap.gif" alt="" /></td>'||chr(10)||
'<td class="t16CurrentListTab"><a class="t16CurrentListTab" href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td valign="bottom" class="t16SepR"><img src="#IMAGE_PREFIX#themes/theme_16/tab_list_right_cap.gif" alt="" /></td>';

t2:=t2||'<td><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775303232395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 16,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0"  summary="" width="100%" class="t16TabbedNavigationList"><tbody><tr><td class="t16LeftTabList">&nbsp;&nbsp;&nbsp;&nbsp;</td>',
  p_list_template_after_rows=>'<td class="t14EndCap" width="100%">&nbsp;</td></tr></tbody></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_links_without_bullets
prompt  ......list template 5775406788395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t16current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775406788395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered Links without Bullets',
  p_theme_id  => 16,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t16VerticalUnorderedLinkswithoutBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 5775516425395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="t16current">#TEXT#</div>';

t2:=t2||'<div>#TEXT#</div>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775516425395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 16,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="t16WizardProgressList">',
  p_list_template_after_rows=>'<center>&DONE.</center>'||chr(10)||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 5775623064395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t16ItemC">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t16Item">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775623064395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 16,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t16VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 5775706564395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t16current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775706564395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t16VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 5775812093395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t16current"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775812093395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table class="t16HorizontalImageswithLabelList" cellpadding="0" border="0" cellspacing="0" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 5775904678395567
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Left.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'<td class="MC" valign="middle"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Right.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2:=t2||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Left.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'<td class="M" valign="middle"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Right.gif" width="3" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5775904678395567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t16ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_menu_with_sublist
prompt  ......list template 5776016211395568
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_16/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_16/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t16MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>5776016211395568 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 16,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_tree
prompt  ......list template 5776100263395568
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>5776100263395568 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 16,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_list_image_with_sublist
prompt  ......list template 5776201106395568
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li class="dhtmlSubMenuN"><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)"><span style="float:left;">#TEXT#</span></a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t16MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t16MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>5776201106395568 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML List (Image) with Sublist',
  p_theme_id  => 16,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 5776329886395568
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16data">#COLUMN_VALUE#</td>';

c2:=c2||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16dataalt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776329886395568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t16StandardAlternatingRowColors" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t16ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776329886395568 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_ppr
prompt  ......report template 5776425745395575
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776425745395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t16Standard" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t16ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776425745395575 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 5776524456395575
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776524456395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table class="t16Borderless" cellpadding="0" border="0" cellspacing="1" summary="" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'||chr(10)||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t16ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776524456395575 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 5776623740395575
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr>'||chr(10)||
'<th class="t16ReportHeader">#COLUMN_HEADER#</th>'||chr(10)||
'<td class="t16data">#COLUMN_VALUE#</td>'||chr(10)||
'</tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776623740395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t16ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776623740395575 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'',
  p_row_template_after_last =>'<tr><td colspan="2" class="t16seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 5776722565395575
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776722565395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table class="t16HorizontalBorder" border="0" cellpadding="0" cellspacing="0" summary="" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t16ReportHeader"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776722565395575 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 5776801519395575
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'#COLUMN_VALUE#';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776801519395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#<tr><td><ul class="t16OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776801519395575 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<li>',
  p_row_template_after_last =>'</li>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 5776906238395575
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 5776906238395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t16Standard" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t16ReportHeader" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 5776906238395575 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 5777006509395575
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 5777006509395575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t16NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 5777128560395583
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 5777128560395583 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t16OptionalLabel">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 5777228781395583
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 5777228781395583 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t16RequiredLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 5777312003395583
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 5777312003395583 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t16OptionalLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 5777412784395583
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 5777412784395583 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t16RequiredLabel">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 5777512517395583
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 5777512517395583 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'',
  p_current_page_option=>'<a href="#LINK#" class="t16current">#NAME#</a>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'<img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_sep.gif" align="middle" alt="" />',
  p_after_last=>'',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 5777614759395589
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 5777614759395589 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t16HierarchicalMenu">',
  p_current_page_option=>'<li class="t16current"><a href="#LINK#">#NAME#</a></li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 5778316515395604
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 5778316515395604 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_V2.css" type="text/css" />',
  p_page_body_attr=>'onload="first_field()" class="popuplov"',
  p_before_field_text=>'<div class="t16PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'<div class="t16PopupBody">',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 5777706269395589
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 5777706269395589 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t16DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t16MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t16DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t16Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t16Today">',
  p_weekend_title_format=> '<div class="t16WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t16WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t16NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t16NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16WeekCalendarAlternative1Holder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t16DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t16Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t16Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t16NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t16Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t16DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16DayCalendarAlternative1Holder"> <tr><td class="t16MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t16DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t16Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t16Today">',
  p_daily_time_open_format => '<th class="t16Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 5777919304395603
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 5777919304395603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t16DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t16MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t16Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t16DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t16Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t16Today">',
  p_weekend_title_format=> '<div class="t16WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t16WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t16NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t16NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16WeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t16DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t16Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t16Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t16NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t16Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t16DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16DayCalendarHolder"> <tr> <td class="t16MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t16DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t16Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t16Today">',
  p_daily_time_open_format => '<th class="t16Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 5778104813395603
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 5778104813395603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16SmallCalenderHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t16MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16SmallCalender">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t16DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t16Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t16Today">',
  p_weekend_title_format=> '<div class="t16WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t16WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t16NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t16NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16SmallWeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t16MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t16DayOfWeek">#IDAY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t16Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t16Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t16NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t16Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t16DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16SmallDayCalendarHolder"> <tr> <td class="t16MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t16SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t16Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t16Today">',
  p_daily_time_open_format => '<th class="t16Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
prompt  ......theme 5778429434395611
--application/shared_components/user_interface/themes/dark_blue
begin
wwv_flow_api.create_theme (
  p_id =>5778429434395611 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 16,
  p_theme_name=>'Dark Blue',
  p_default_page_template=>5772012640395541 + wwv_flow_api.g_id_offset,
  p_error_template=>5772012640395541 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>5772212785395542 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>5771927570395541 + wwv_flow_api.g_id_offset,
  p_default_button_template=>5772529788395549 + wwv_flow_api.g_id_offset,
  p_default_region_template=>5774016796395557 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>5773101257395556 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>5773519023395556 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>5774016796395557 + wwv_flow_api.g_id_offset,
  p_default_tabform_template  =>5774016796395557 + wwv_flow_api.g_id_offset,
  p_default_wizard_template   =>5774603403395557 + wwv_flow_api.g_id_offset,
  p_default_menur_template    =>5772927293395556 + wwv_flow_api.g_id_offset,
  p_default_listr_template    =>5774016796395557 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>5776906238395575 + wwv_flow_api.g_id_offset,
  p_default_label_template    =>5777312003395583 + wwv_flow_api.g_id_offset,
  p_default_menu_template     =>5777512517395583 + wwv_flow_api.g_id_offset,
  p_default_calendar_template =>5777919304395603 + wwv_flow_api.g_id_offset,
  p_default_list_template     =>5775706564395567 + wwv_flow_api.g_id_offset,
  p_default_option_label      =>5777312003395583 + wwv_flow_api.g_id_offset,
  p_default_required_label    =>5777228781395583 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...build options used by application 112
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...messages used by application: 112
--
--application/shared_components/globalization/language
prompt  ...Language Maps for Application 112
--
 
begin
 
null;
 
end;
/

prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/delete_confirm_msg
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 5783627748395785 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/ok_to_get_next_prev_pk_value
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Are you sure you want to leave this page without saving?';

wwv_flow_api.create_shortcut (
 p_id=> 5849409834369020 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'OK_TO_GET_NEXT_PREV_PK_VALUE',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/html_db
prompt  ......scheme 5778518972395617
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'-BUILTIN-';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 5778518972395617 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'HTML DB',
  p_description=>'Use internal Application Express account credentials and login page in this application.',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

--application/shared_components/security/authentication/database
prompt  ......scheme 5778614452395624
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1:=s1||'-DATABASE-';

s2 := null;
s3 := null;
s4 := null;
s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 5778614452395624 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DATABASE',
  p_description=>'Use database authentication (user identified by DAD).',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

--application/shared_components/security/authentication/database_account
prompt  ......scheme 5778702774395624
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'return false; end;--';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 5778702774395624 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DATABASE ACCOUNT',
  p_description=>'Use database account credentials.',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

--application/end_environment
commit;
commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
