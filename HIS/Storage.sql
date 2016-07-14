-- Update Storage

update HIS_Service_Accessory hsa set 
hsa.UNITPRICE_SERVICE = ( select hs.PRICESERVICE from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID),
hsa.UNITPRICE_ASSURANCE = ( select hs.PRICEASSURANCE from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID),
hsa.UNITPRICE_DIFFERENCE = ( select hs.PRICEDIFF from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID)
where hsa.HIS_Service_ID in 
(select HIS_Service_ID from HIS_Accessory ha 
where ha.HIS_Service_ID = hsa.HIS_Service_ID 
and ha.HIS_SERVICEGROUPLEVEL2_ID = 1000043 
and ha.Created > to_date('05072016', 'DDMMYYYY'));

update HIS_PRODUCT_IMPORT hsa set 
hsa.PRICE = ( select hs.PRICESERVICE from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID),
hsa.PRICEASSURANCE = ( select hs.PRICEASSURANCE from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID),
hsa.PRICEDIFF = ( select hs.PRICEDIFF from HIS_Service hs where hs.HIS_Service_ID = hsa.HIS_Service_ID)
where hsa.HIS_Service_ID in 
(select HIS_Service_ID from HIS_Accessory ha 
where ha.HIS_Service_ID = hsa.HIS_Service_ID 
and ha.HIS_SERVICEGROUPLEVEL2_ID = 1000043 
and ha.Created > to_date('05072016', 'DDMMYYYY'));