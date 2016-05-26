-- Delete column

alter table HIS_SERVICE_MAJORSURGERY  drop (HIS_Machine_User1_ID, HIS_Machine_User2_ID,HIS_Outside_User_ID,HIS_Tool_User_ID);

delete ad_field af  where af.ad_column_id = 1100561;
delete AD_PRINTFORMATITEM ap where ap.ad_column_id = 1100561;
delete ad_column ac where ac.ad_column_id = 1100561;


 select ac.* from ad_field af
 inner join ad_column ac on ac.ad_column_id = af.ad_column_id
 inner join AD_ELEMENT ae on ae.AD_ELEMENT_ID = ac.AD_ELEMENT_ID
 where ae.AD_Element_ID=1100043
 ;


delete AD_TAB_CUSTOMIZATION where AD_Tab_ID=1100298;

select * from all_constraints where CONSTRAINT_NAME like 'HISMEDICINEGROUPPARENT_HISMEDI';
