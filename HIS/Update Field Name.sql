update AD_Field_Trl set Name = 'Mã' where AD_Field_ID in (
select af.AD_Field_ID from AD_Field af 
  inner join AD_Column ac on ac.AD_Column_ID = af.AD_Column_ID
  inner join AD_Tab at on at.AD_Tab_ID = af.AD_Tab_ID
  inner join AD_Window aw on aw.AD_Window_ID = at.AD_Window_ID
where aw.AD_Window_ID = 1100660 and ac.ColumnName = 'Value');

select Name from AD_Field_Trl where AD_Field_ID in (
select af.AD_Field_ID from AD_Field af 
  inner join AD_Column ac on ac.AD_Column_ID = af.AD_Column_ID
  inner join AD_Tab at on at.AD_Tab_ID = af.AD_Tab_ID
  inner join AD_Window aw on aw.AD_Window_ID = at.AD_Window_ID
where aw.AD_Window_ID = 1100660 and ac.ColumnName = 'Value');