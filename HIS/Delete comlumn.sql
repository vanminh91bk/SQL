-- Delete column
delete ad_field af  where af.ad_column_id = 1109353;
delete AD_PRINTFORMATITEM ap where ap.ad_column_id = 1109353;
delete ad_column ac where ac.ad_column_id = 1109353;


-- Delete Field
Delete Ad_Field_Trl where Ad_Field_ID in (select Ad_Field_ID from Ad_Field where AD_Tab_ID = 1100299);
Delete Ad_Field where AD_Tab_ID = 1100299; 
-- Clean field no visible
delete from Ad_Field where AD_Tab_ID = 1100668 and ISDISPLAYED = 'N' and 
AD_Column_ID not in (select AD_Column_ID from AD_Column where AD_Element_ID in (102, 113)) and
AD_Column_ID not in (select AD_Column_ID from AD_Column where AD_Reference_ID = 13) and 
AD_Column_ID not in (select AD_Column_ID from AD_Column where ColumnName like '%_UU');

-- Update 
update Ad_Field set ColumnSpan = 2 where AD_Tab_ID = 1100405; 

-- Update Grid view
update Ad_Field set ISDISPLAYEDGRID = 'N' where AD_Tab_ID = 1100401;
update Ad_Field set ISDISPLAYEDGRID = 'Y' where ISDISPLAYED = 'Y' and AD_Tab_ID = 1100622;
update Ad_Field set SEQNOGRID = SEQNO where AD_FIELD_ID in (select Ad_Field_ID from Ad_Field where AD_Tab_ID = 1100622);


-- Update Column 
update AD_Column set IsUpdateable = 'Y' where AD_Reference_ID = 28;


select * from all_constraints where CONSTRAINT_NAME = 'HISCONSUMPTIONGRP_HISSERVICEB';
alter table HIS_SERVICE_BLOOD drop constraint HISCONSUMPTIONGRP_HISSERVICEB;

--
delete AD_TAB_CUSTOMIZATION where  AD_Tab_ID=1100401;

-- Drop Column in Oracle
select * from HIS_Service_MedicTestGroup;
alter table HIS_Service_MedicTestGroup drop column C50Name;