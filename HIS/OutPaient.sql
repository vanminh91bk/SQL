select * from HIS_PatientHistory where HIS_PatientHistory_ID = 2092659;
select HIS_PatientHistory_ID, Name from HIS_PatientHistory where Value = '1607002766';

select hsd.HIS_Service_ID, hsd.HIS_Room_ID, hs.HIS_Room_ID, hs.Name, hr.Name from HIS_Service_DiagnosticImage  hsd
inner join HIS_Room hr on hr.HIS_Room_ID = hsd.HIS_Room_ID
inner join HIS_Service hs on hs.HIS_Service_ID = hsd.HIS_Service_ID
where HIS_PatientHistory_ID = 2045615;

select * from HIS_Service_Union where HIS_PatientHistory_ID = 2049029 and IsPaid = 'Y';

update HIS_CheckUp set IsPaidA = 'N' where HIS_PatientHistory_ID = 2049029;
update HIS_Service_DiagnosticImage set IsPaidA = 'N' where HIS_PatientHistory_ID = 2049029;


-- Fix error HIS_InvoiceS in Service_Union and HIS_Invoice in Service_Union not match
select (select hil.HIS_Invoice_ID from HIS_InvoiceLine hil where hil.HIS_INVOICETYPE = 'S' 
and HIS_ServiceType = 'ImgDiag' and HIS_Service_Record_ID = hsm.HIS_SERVICE_DIAGNOSTICIMAGE_ID
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID) HIS_INVOICE_ID , hsm.HIS_INVOICES_ID from HIS_SERVICE_DIAGNOSTICIMAGE hsm
where hsm.Created < to_date('01052016', 'DDMMYYYY');

update HIS_SERVICE_DIAGNOSTICIMAGE hsm set hsm.HIS_INVOICES_ID = 
(
select hil.HIS_Invoice_ID from HIS_InvoiceLine hil 
inner join HIS_Invoice hi on hi.HIS_Invoice_ID = hil.HIS_Invoice_ID
where hil.HIS_INVOICETYPE = 'S' 
and HIS_ServiceType = 'ImgDiag' and HIS_Service_Record_ID = hsm.HIS_SERVICE_DIAGNOSTICIMAGE_ID
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID  and NVL(hi.ISSETTLED, 'N') = 'N' and rownum <= 1
)
where NVL((
select hil.HIS_Invoice_ID from HIS_InvoiceLine hil 
inner join HIS_Invoice hi on hi.HIS_Invoice_ID = hil.HIS_Invoice_ID
where hil.HIS_INVOICETYPE = 'S' 
and HIS_ServiceType = 'ImgDiag' and HIS_Service_Record_ID = hsm.HIS_SERVICE_DIAGNOSTICIMAGE_ID
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID  and NVL(hi.ISSETTLED, 'N') = 'N' and rownum <= 1
), 0) > 0 and hsm.Created < to_date('01072016', 'DDMMYYYY') and hsm.ISINPATIENT = 'N';

select * from HIS_Invoice;

-- Update HIS_InvoiceA_ID
update HIS_Service_Medicaltest hsm set hsm.HIS_INVOICEA_ID = 
(
select hil.HIS_Invoice_ID from HIS_InvoiceLine hil 
inner join HIS_Invoice hi on hi.HIS_Invoice_ID = hil.HIS_Invoice_ID
where hil.HIS_INVOICETYPE = 'A' 
and HIS_ServiceType = 'MedicalTest' and HIS_Service_Record_ID = hsm.HIS_Service_Medicaltest_ID
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID  and NVL(hi.ISSETTLED, 'N') = 'N' and rownum <= 1
)
where NVL((
select hil.HIS_Invoice_ID from HIS_InvoiceLine hil 
inner join HIS_Invoice hi on hi.HIS_Invoice_ID = hil.HIS_Invoice_ID
where hil.HIS_INVOICETYPE = 'A' 
and HIS_ServiceType = 'MedicalTest' and HIS_Service_Record_ID = hsm.HIS_Service_Medicaltest_ID
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID  and NVL(hi.ISSETTLED, 'N') = 'N' and rownum <= 1
), 0) > 0 and hsm.Created < to_date('01072016', 'DDMMYYYY') and hsm.ISINPATIENT = 'N';

-- Update Service In Hospital
update HIS_Service_MedicalTest hsm set hsm.ISSERVICEINHOSPITAL = 
(
select hil.ISSERVICEINHOSPITAL from HIS_InvoiceLine hil where hil.HIS_INVOICETYPE = 'A' 
and HIS_ServiceType = 'MedicalTest' and HIS_Service_Record_ID = hsm.HIS_Service_MedicalTest_ID
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID and hil.ISSERVICEINHOSPITAL = 'N' and rownum <=1
)
where hsm.Created < to_date('01072016', 'DDMMYYYY')  and NVL((
select hil.HIS_Invoice_ID from HIS_InvoiceLine hil where hil.HIS_INVOICETYPE = 'A' 
and HIS_ServiceType = 'MedicalTest' and HIS_Service_Record_ID = hsm.HIS_Service_MedicalTest_ID  
and hsm.HIS_PatientHistory_ID = hil.HIS_PatientHistory_ID and hil.ISSERVICEINHOSPITAL = 'N' and rownum <=1
), 0) > 0;


-- Fix Error AmountS and TotalPrice_Service not match
update HIS_SERVICE_DIAGNOSTICIMAGE set TOTALPRICE_SERVICE = AMOUNTS where ISNOTCOUNTED = 'N' and HIS_INVOICES_ID = 1067973; 
update HIS_Service_Medicaltest set TOTALPRICE_SERVICE = AMOUNTS where ISNOTCOUNTED = 'N' and HIS_INVOICES_ID = 1067973; 

select TOTALPRICE_SERVICE, AMOUNTS from HIS_SERVICE_DIAGNOSTICIMAGE where HIS_INVOICES_ID = 1067973; 
select TOTALPRICE_SERVICE, AMOUNTS from HIS_Service_Medicaltest where HIS_INVOICES_ID = 1067973; 