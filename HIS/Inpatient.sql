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
update HIS_PatientHistory set InpatientState = 'InHospital' where HIS_PatientHistory_ID = 2050496;
select ISPAID, HIS_INVOICETYPE from HIS_IP_INVOICE_TOTAL where HIS_PATIENTHISTORY_ID = 2051673;
select ISPAID, HIS_INVOICETYPE, HIS_INPATIENT_INVOICE_ID from HIS_INPATIENT_INVOICE where HIS_PATIENTHISTORY_ID = 2050496;
update HIS_INPATIENT_INVOICE set ISACTIVE = 'N' where HIS_INPATIENT_INVOICE_ID = 2019508;
--

select HIS_PatientHistory_ID, INPATIENTSTATE, Name from HIS_PatientHistory where HIS_MedicalRecordNo = '1602022';--kc2010502400513
select HIS_PatientHistory_ID from HIS_PatientHistory where Value = '1607000362';--kc2010502400513
select TIMEGOIN, TIMEGOOUT, HIS_PatientHistory_ID, HIS_MedicalRecordNo, InpatientState from HIS_PatientHistory where Assurance_ID = upper('te1370702201535');--2045600
select TIMEGOIN, TIMEGOOUT, HIS_PatientHistory_ID, HIS_MedicalRecordNo, InPatientState, Updated, HIS_Department_ID from HIS_PatientHistory where Remove_Sign(Name) = Remove_Sign('test_ngochieu_02');--2045600
select * from HIS_PatientHistory where Remove_Sign(Name) = Remove_Sign('Nguyễn Thị Thân');--2045600
select HIS_PatientHistory_ID, INPATIENTSTATE, Name from HIS_PatientHistory where HIS_PATIENTHISTORY_ID = 2051673;


select * from HIS_Service_Union where (IsPaidA = 'N' or IsPaidS = 'N' or IsPaid = 'N') and HIS_PatientHistory_ID = 2089702;

update HIS_Service_Bed set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;
update HIS_Service_MedicalTest set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;
update HIS_Service_DiagnosticImage set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;
update HIS_Service_MajorSurgery set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;
update HIS_CheckUp set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;

update HIS_Service_Medicine set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;
update HIS_Service_Accessory set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2163135;
update HIS_Service_Chemical set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;
update HIS_Service_Blood set IsPaidA = 'Y' , IsPaidS = 'Y' , IsPaid = 'Y' where HIS_PatientHistory_ID = 2127322;

--
update HIS_PatientHistory set InpatientState = 'PaidOut', TimeGoOut = Sysdate -14 where HIS_PatientHistory_ID = 2049905;
update HIS_IP_Invoice_Total set IsPaid = 'Y', PayTime = Sysdate -1 where HIS_PatientHistory_ID = 2045670;
update HIS_IP_InvoiceLine set IsPaid = 'Y', PayTime = Sysdate -1 where HIS_PatientHistory_ID = 2045670;
update HIS_InPatient_Invoice set IsPaid = 'Y', PayTime = Sysdate -1 where HIS_PatientHistory_ID = 2045670;

--

select IsPaid from HIS_IP_Invoice_Total where INPATIENTRECORDNO = '1600585';
update HIS_PatientHistory set IsActive = 'N' where HIS_MedicalRecordNo in ('1601161', '1600951', '1600585');

update HIS_PATIENTHISTORY hp set hp.TIMEGOOUT = (
select hi.PAYTIME from HIS_IP_INVOICE_TOTAL hi where hi.HIS_PATIENTHISTORY_ID = hp.HIS_PATIENTHISTORY_ID and rownum <=1) where hp.ISINPATIENT = 'Y' and hp.INPATIENTSTATE = 'PaidOut';

-- Update service Name
update HIS_Service_Medicine hsm set 
hsm.ServiceName = (select hs.Name from HIS_Service hs where hs.HIS_Service_ID = hsm.HIS_Service_ID) 
where HIS_PATIENTHISTORY_ID = 2046819;

-- Update Price 
update HIS_Service_Accessory hsa set 
hsa.UNITPRICE_ASSURANCE = (select hs.PriceAssurance from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID),
hsa.UNITPRICE_SERVICE = (select hs.PriceService from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID),
hsa.UNITPRICE_DIFFERENCE = (select hs.PRICEDIFF from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID)
where hsa.HIS_PATIENTHISTORY_ID = 2049402 and hsa.HIS_Service_ID = 202693312;

-- Update Actdate 
update HIS_Service_Bed set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
update HIS_Service_MedicalTest set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
update HIS_Service_DiagnosticImage set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
--update HIS_Service_MajorSurgery set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
update HIS_CheckUp set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;

update HIS_Service_Medicine set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
update HIS_Service_Accessory set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
update HIS_Service_Chemical set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;
update HIS_Service_Blood set ActDate = to_date('25/06/2016 23:00:00', 'DD/MM/YYYY HH24:MI:SS') where HIS_PatientHistory_ID = 2046731 and From_Department_ID = 1000219;


select * from HIS_DEPARTMENT where HIS_DEPARTMENT_ID = 1000233;

select * from AD_CHANGELOG_V2 where RECORD_ID = 2051673 and TABLENAME = 'HIS_PatientHistory';