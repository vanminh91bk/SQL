Update HIS_STORAGE_DOCUMENTLINE set IsActive = 'N'
WHERE HIS_ServiceType = 'Medicine' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_Medicine_ID FROM HIS_SERVICE_MEDICINE
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294))
        ) ;

Update HIS_Service_Medicine set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_STORAGE_DOCUMENTLINE set IsActive = 'N'
WHERE HIS_ServiceType = 'Chemical' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_Chemical_ID FROM HIS_SERVICE_CHEMICAL
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294))
        ) ;

Update HIS_Service_Chemical set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_STORAGE_DOCUMENTLINE set IsActive = 'N'
WHERE HIS_ServiceType = 'Accessory' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_ACCESSORY_ID FROM HIS_SERVICE_ACCESSORY
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294))
        ) ;

Update HIS_SERVICE_ACCESSORY set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_SERVICE_ACCESSORY set IsActive = 'N'
WHERE HIS_CONSUMPTIONGROUP_ID IN (SELECT HIS_CONSUMPTIONGROUP_ID FROM HIS_CONSUMPTIONGROUP cg WHERE cg.HIS_PATIENTHISTORY_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)));

Update HIS_CONSUMPTIONGROUP set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_STORAGE_DOCUMENTLINE set IsActive = 'N'
WHERE HIS_ServiceType = 'BloodProduct' AND
        HIS_Service_Record_ID IN (
            SELECT HIS_Service_Blood_ID FROM HIS_SERVICE_BLOOD
            WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294))
        ) ;

Update HIS_Service_Blood set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_Service_DiagnosticImage set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_Service_MedicTestGroup set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_Service_MedicTestLine set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_Service_MedicalTest set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_SERVICERECORD_HISTORY set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_CheckUp set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_InvoiceLine set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_IP_Consumption set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_CHANGEPATIENTTYPE set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_IP_InvoiceLine set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_AdvancePayment set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_Invoice set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_Inpatient_Invoice set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_PATIENT_BED set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_Inpatient_CreditLine set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_PH_ChangeLog set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_SERVICEPACKAGE_HISTORY set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_INPATIENT_CREDITLINE set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_INVOICETOTAL  set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_INPATIENT_DEBITLINE set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_SERVICE_BEDGROUP set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_Service_MajorSurgery set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294)) ;

Update HIS_SERVICE_SURGERYGROUP set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_Service_Bed set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_SERVICE_HTGROUP set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_IP_Invoice_Total  set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

Update HIS_PatientHistory set IsActive = 'N'
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE HIS_PatientHistory_ID in (2046294));

--select * from all_constraints where constraint_name like 'HISPATIENTBED_HISSERVICEBEDGRO';
