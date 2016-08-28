
  CREATE OR REPLACE FORCE VIEW "HIS"."HIS_RV_HOADON_DIENTU_CHITIET" ("MA_HANG", "TEN_HANG", "SO_LUONG", "DON_VI_TINH", "DON_GIA", "THANH_TIEN", "VAT", "VAT_TIEN", "HIS_SERVICE_UNION_ID", "HIS_PATIENTHISTORY_ID", "HIS_INVOICE_ID", "ISINPATIENT") AS 
  select 
  NVL(hs.Value, ' ') MA_HANG, 
  NVL(hs.Name, ' ') TEN_HANG, 
  NVL(hsu.Quantity, 1) SO_LUONG, 
  NVL(cu.Name, ' ') DON_VI_TINH,
  NVL(hsu.UnitPrice_Service, 0) DON_GIA,
  NVL(hsu.AmountS, 0) THANH_TIEN,
  0 VAT,
  0 VAT_TIEN,
  hsu.HIS_Service_Union_ID,
  hsu.HIS_PatientHistory_ID,
  hi.HIS_Invoice_ID,
  'N' IsInPatient
  from HIS_Service_Union hsu 
  left join HIS_Service hs on hs.HIS_Service_ID = hsu.HIS_Service_ID
  inner join HIS_Invoice hi on hi.HIS_Invoice_ID = hsu.HIS_InvoiceS_ID
  left join C_UOM cu on cu.C_UOM_ID = hsu.C_UOM_ID
where hsu.AmountS > 0
Union All
select 
  ' ' MA_HANG, 
  'Thanh toán chi phí khám chữa bệnh ngoại trú BHYT (' || hp.ASSURANCEPERCENT || '%). Có bảng kê chi phí kèm theo'    TEN_HANG, 
  0 SO_LUONG, 
  ' ' DON_VI_TINH,
  0 DON_GIA,
  sum(NVL(hsu.AmountA, 0)) THANH_TIEN,
  0 VAT,
  0 VAT_TIEN,
  0 HIS_Service_Union_ID,
  hsu.HIS_PatientHistory_ID,
  hsu.HIS_InvoiceA_ID HIS_Invoice_ID,
  hp.IsInPatient
  from HIS_Service_Union hsu 
  inner join HIS_PatientHistory hp on hp.HIS_PatientHistory_ID = hsu.HIS_PatientHistory_ID
where hsu.AmountA > 0 and hp.IsInPatient = 'N'
  group by hsu.HIS_PatientHistory_ID,
           hsu.HIS_InvoiceA_ID,
           hp.ASSURANCEPERCENT,
           hp.IsInPatient
Union All
select 
  ' ' MA_HANG, 
  case 
   
  when hp.HIS_PatientType_ID = 'A' and NVL(hsu.HIS_Donors_ID, 0) = 0 then 'Thanh toán chi phí khám chữa bệnh nội trú BHYT(' || hp.ASSURANCEPERCENT || '%). Mã BA: ' || hp.HIS_MedicalRecordNo
  || '. Khoa ra viện: ' || hd.Name || '. Bảng kê chi phí kèm theo.'
  when NVL(hsu.HIS_Donors_ID, 0) = 0 then 'Thanh toán chi phí khám chữa bệnh nội trú. Mã BA: ' || hp.HIS_MedicalRecordNo
  || '. Khoa ra viện: ' || hd.Name || '. Bảng kê chi phí kèm theo.'
  else hsu.Note
  end TEN_HANG, 
  0 SO_LUONG, 
  ' ' DON_VI_TINH,
  0 DON_GIA,
  Trunc(NVL(hsu.TotalInvoice,0)) THANH_TIEN,
  0 VAT,
  0 VAT_TIEN,
  0 HIS_Service_Union_ID,
  hsu.HIS_PatientHistory_ID,
  hsu.HIS_IP_Invoice_Total_ID HIS_Invoice_ID,
  hp.IsInPatient
  from HIS_IP_Invoice_Total hsu 
  inner join HIS_PatientHistory hp on hp.HIS_PatientHistory_ID = hsu.HIS_PatientHistory_ID
  left join HIS_Department hd on hd.HIS_Department_ID = hp.HIS_Department_ID
  where hp.IsInPatient = 'Y';
