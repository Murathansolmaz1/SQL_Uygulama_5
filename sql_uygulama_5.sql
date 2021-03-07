Select 
	
DATEPART(YEAR,O.DATE_) AS YIL,
DATEPART(MONTH,O.DATE_) AS AY,

CASE 
	WHEN DATEPART(MONTH,O.DATE_)=1 THEN 'OCAK'
	WHEN DATEPART(MONTH,O.DATE_)=2 THEN 'ŞUBAT'
	WHEN DATEPART(MONTH,O.DATE_)=3 THEN 'MART'
	WHEN DATEPART(MONTH,O.DATE_)=4 THEN 'NİSAN'
	WHEN DATEPART(MONTH,O.DATE_)=5 THEN 'MAYIS'
	WHEN DATEPART(MONTH,O.DATE_)=6 THEN 'HAZİRAN'
	WHEN DATEPART(MONTH,O.DATE_)=7 THEN 'TEMMUZ'
	WHEN DATEPART(MONTH,O.DATE_)=8 THEN 'AĞUSTOS'
	WHEN DATEPART(MONTH,O.DATE_)=9 THEN 'EYLÜL'
	WHEN DATEPART(MONTH,O.DATE_)=10 THEN 'EKİM'
	WHEN DATEPART(MONTH,O.DATE_)=11 THEN 'KASIM'
	WHEN DATEPART(MONTH,O.DATE_)=12 THEN 'ARALIK'
END AS AY_ADI,

SUM(OD.LINETOTAL) AS TOPLAM_SİPARİŞ_TUTARI,
SUM(OD.AMOUNT) AS TOPLAM_SİPARİŞ_ADEDİ,
COUNT(OD.ID) AS TOPLAM_SİPARİŞ_SAYISI

from ORDERS AS O

	INNER JOIN USERS AS U ON U.ID = O.USERID
	INNER JOIN ADDRESS AS A ON A.ID = O.ADDRESSID
	INNER JOIN CITIES AS C ON C.ID = A.CITYID
	INNER JOIN TOWNS AS T ON T.ID = A.TOWNID
	INNER JOIN DISTRICTS AS D ON D.ID = A.DISTRICTID
	INNER JOIN PAYMENTS AS P ON P.ORDERID = O.ID
	INNER JOIN INVOICES AS I ON I.ORDERID = O.ID 
	INNER JOIN ORDERDETAILS AS OD ON OD.ORDERID = O.ID 
	INNER JOIN ITEMS AS ITM ON ITM.ID = OD.ITEMID



GROUP BY DATEPART(YEAR,O.DATE_), DATEPART(MONTH,O.DATE_)
ORDER BY DATEPART(YEAR,O.DATE_), DATEPART(MONTH,O.DATE_) 
