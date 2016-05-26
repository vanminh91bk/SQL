DELETE FROM HIS_STORAGE_DOCUMENTLINE
WHERE HIS_ServiceType = 'Medicine' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_Medicine_ID FROM HIS_SERVICE_MEDICINE
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560)
        ) ;

DELETE FROM HIS_Service_Medicine
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_STORAGE_DOCUMENTLINE
WHERE HIS_ServiceType = 'Chemical' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_Chemical_ID FROM HIS_SERVICE_CHEMICAL
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560)
        ) ;

DELETE FROM HIS_Service_Chemical
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_STORAGE_DOCUMENTLINE
WHERE HIS_ServiceType = 'Accessory' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_ACCESSORY_ID FROM HIS_SERVICE_ACCESSORY
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560)
        ) ;

DELETE FROM HIS_SERVICE_ACCESSORY
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_SERVICE_ACCESSORY
WHERE HIS_CONSUMPTIONGROUP_ID IN (SELECT HIS_CONSUMPTIONGROUP_ID FROM HIS_CONSUMPTIONGROUP cg WHERE cg.HIS_PATIENTHISTORY_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560));

DELETE FROM HIS_CONSUMPTIONGROUP
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_STORAGE_DOCUMENTLINE
WHERE HIS_ServiceType = 'BloodProduct' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_Blood_ID FROM HIS_SERVICE_BLOOD
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560)
        ) ;

DELETE FROM HIS_Service_Blood
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_Service_DiagnosticImage
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_Service_MedicTestGroup
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_Service_MedicTestLine
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_Service_MedicalTest
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_SERVICERECORD_HISTORY
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_CheckUp
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_InvoiceLine
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_IP_Consumption
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_CHANGEPATIENTTYPE
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_IP_InvoiceLine
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_AdvancePayment
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_Invoice
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_Inpatient_Invoice
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_PATIENT_BED
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_Inpatient_CreditLine
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_PH_ChangeLog
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_SERVICEPACKAGE_HISTORY
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_INPATIENT_CREDITLINE
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_INVOICETOTAL 
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_INPATIENT_DEBITLINE
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_SERVICE_BEDGROUP
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_Service_MajorSurgery
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560) ;

DELETE FROM HIS_SERVICE_SURGERYGROUP
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_Service_Bed
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_SERVICE_HTGROUP
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_IP_Invoice_Total 
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

DELETE FROM HIS_PatientHistory 
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID = 2044560);

--select * from all_constraints where constraint_name like 'HISPATIENTBED_HISSERVICEBEDGRO';
