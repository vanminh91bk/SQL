select TimeGoIn, RegDate from HIS_PatientHistory where HIS_MedicalRecordNo = '1600593';
update HIS_PatientHistory set TimeGoIn = RegDate where IsInpatient = 'Y' and HIS_MedicalRecordNo = '1600593';

-- Fix Surgery
update HIS_Service_MajorSurgery hsm set 
hsm.HIS_SURGERYFORM_ID = (select hs.HIS_SURGERYFORM_ID from HIS_Surgery hs where hs.HIS_Service_ID = hsm.HIS_Service_ID),
hsm.HIS_SURGERYTYPE_ID = (select hs.HIS_surgerytype_ID from HIS_Surgery hs where hs.HIS_Service_ID = hsm.HIS_Service_ID);

select * from HIS_Service_MajorSurgery where PatientValue = '1602018343';