--Fix time go out
select TimeGoIn, RegDate, HIS_PatientHistory_ID from HIS_PatientHistory where HIS_MedicalRecordNo = '1600449';
update HIS_PatientHistory set TimeGoIn = RegDate where IsInpatient = 'Y' and HIS_MedicalRecordNo = '1600593';

-- Update Department
select * from HIS_Department;
update HIS_PatientHistory set HIS_Department_ID = 1000223  where HIS_PatientHistory_ID = 2048780;

-- Fix Surgery
update HIS_Service_MajorSurgery hsm set 
hsm.HIS_SURGERYFORM_ID = (select hs.HIS_SURGERYFORM_ID from HIS_Surgery hs where hs.HIS_Service_ID = hsm.HIS_Service_ID),
hsm.HIS_SURGERYTYPE_ID = (select hs.HIS_surgerytype_ID from HIS_Surgery hs where hs.HIS_Service_ID = hsm.HIS_Service_ID);

--

select HIS_PatientHistory_ID from HIS_PatientHistory where HIS_MedicalRecordNo = '1601231';--kc2010502400513
select HIS_PatientHistory_ID from HIS_PatientHistory where Value = '1607000362';--kc2010502400513
select HIS_PatientHistory_ID, HIS_MedicalRecordNo, InpatientState from HIS_PatientHistory where Assurance_ID = 'HT3010500118070';--2045600
select HIS_PatientHistory_ID, HIS_MedicalRecordNo from HIS_PatientHistory where Remove_Sign(Name) = Remove_Sign('Nghiem Thị Thân');--2045600
select * from HIS_PatientHistory where Remove_Sign(Name) = Remove_Sign('Nguyễn Thị Thân');--2045600

select * from HIS_Service_Union where (IsPaidA = 'N' or IsPaidS = 'N' or IsPaid = 'N') and HIS_PatientHistory_ID = 2089702;

update HIS_Service_Bed set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_MedicalTest set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_DiagnosticImage set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_MajorSurgery set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_CheckUp set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;

update HIS_Service_Medicine set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_Accessory set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_Chemical set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_Blood set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;

--
update HIS_PatientHistory set InpatientState = 'PaidOut', TimeGoOut = Sysdate -1 where HIS_PatientHistory_ID = 2045577;
update HIS_IP_Invoice_Total set IsPaid = 'Y', PayTime = Sysdate -1 where HIS_PatientHistory_ID = 2045577;
update HIS_IP_InvoiceLine set IsPaid = 'Y', PayTime = Sysdate -1 where HIS_PatientHistory_ID = 2045577;
update HIS_InPatient_Invoice set IsPaid = 'Y', PayTime = Sysdate -1 where HIS_PatientHistory_ID = 2045577;


-- Update service Name
update HIS_Service_Medicine hsm set 
hsm.ServiceName = (select hs.Name from HIS_Service hs where hs.HIS_Service_ID = hsm.HIS_Service_ID) 
where HIS_PATIENTHISTORY_ID = 2046819;

-- Update Actdate 

update HIS_Service_Bed set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_Service_MedicalTest set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_Service_DiagnosticImage set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_Service_MajorSurgery set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_CheckUp set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');

update HIS_Service_Medicine set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_Service_Accessory set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_Service_Chemical set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');
update HIS_Service_Blood set ActDate = to_date('23/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2047526 and From_Department_ID = 1000218 and Trunc(ActDate) = to_date('23/06/2016', 'DD/MM/YYYY');