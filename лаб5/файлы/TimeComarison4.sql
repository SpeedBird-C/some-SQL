use EducCenter;

 --4--------------������� ������ ��� ��������������, ������� ������� �� ���������� �� ����� ������ ���� 3

--Declare @Time1 datetime2(7)
--Declare @Time2 datetime2(7)
--Declare @cnt int


--set @cnt=0
--set @Time1=SYSDATETIME()
--While @cnt<100
--Begin
--SET STATISTICS TIME ON;  


--SELECT Chelovek.FIO FROM Chelovek 
--JOIN
--(SELECT P.NumerPassporta FROM Prepod AS P
-- JOIN --��� �� �������� ������ ������ �����������

--(SELECT  b.ZHurnal_OcenokKursNazvanie FROM Ocenka b -- ��� �����
--EXCEPT  -- �����
--SELECT a.ZHurnal_OcenokKursNazvanie FROM Ocenka a WHERE a.PromezhutochnyeOcenka1<=3 OR a.PromezhutochnyeOcenka2<=3 OR a.PromezhutochnyeOcenka3<=3 OR 
-- a.ItogovayaOcenka<=3) Raznost  -- �������, ��� ���� �� 1 ������

-- ON P.RaspisanieKursNazvanie=Raznost.ZHurnal_OcenokKursNazvanie) Pass 
-- ON Pass.NumerPassporta=Chelovek.NumerPassporta 

--SET STATISTICS TIME OFF;  

--set @cnt=@cnt+1
--END
--set @Time2=SYSDATETIME()

--print ' Time elapsed for query from 2 lab: '+convert(varchar(36),DATEDIFF(MILLISECOND,@Time1,@Time2)/10,14)




--(SELECT  b.ZHurnal_OcenokKursNazvanie FROM Ocenka b -- ��� �����
--EXCEPT  -- �����
--SELECT a.ZHurnal_OcenokKursNazvanie FROM Ocenka a WHERE a.PromezhutochnyeOcenka1<=3 OR a.PromezhutochnyeOcenka2<=3 OR a.PromezhutochnyeOcenka3<=3 OR 
-- a.ItogovayaOcenka<=3)
-- -- ��� �������� �������� ��� �����





-- (SELECT P.NumerPassporta FROM Prepodavatel AS P
-- JOIN --��� �� �������� ������ ������ �����������

---- ��� �������� �������� ��� �����
--(SELECT  b.ZHurnal_OcenokKursNazvanie FROM Ocenka b -- ��� �����
--EXCEPT  -- �����
--SELECT a.ZHurnal_OcenokKursNazvanie FROM Ocenka a WHERE a.PromezhutochnyeOcenka1<=3 OR a.PromezhutochnyeOcenka2<=3 OR a.PromezhutochnyeOcenka3<=3 OR 
-- a.ItogovayaOcenka<=3) Raznost  
-- -- ��� �������� �������� ��� �����


-- ON P.RaspisanieKursNazvanie=Raznost.ZHurnal_OcenokKursNazvanie) 
-- -- ����� ����� �������� ������ ���, �������� ������� ������� � "������������" ����������
--SET STATISTICS TIME ON;  

--SELECT Chelovek.FIO FROM Chelovek 
--JOIN
--(SELECT P.NumerPassporta FROM Prepod AS P
-- JOIN --��� �� �������� ������ ������ �����������

--(SELECT  b.ZHurnal_OcenokKursNazvanie FROM Ocenka b 
--WHERE b.PromezhutochnyeOcenka1<=3 
--OR b.PromezhutochnyeOcenka2<=3 
--OR b.PromezhutochnyeOcenka3<=3 
--OR b.ItogovayaOcenka<=3) Raznost  

--ON P.RaspisanieKursNazvanie=Raznost.ZHurnal_OcenokKursNazvanie) Pass
-- ON Pass.NumerPassporta=Chelovek.NumerPassporta;

--SET STATISTICS TIME OFF;  






SET STATISTICS TIME ON;  



SELECT Chelovek.FIO FROM Chelovek 
JOIN
(SELECT P.NumerPassporta FROM Prepod AS P
 JOIN --��� �� �������� ������ ������ �����������

--(SELECT  b.ZHurnal_OcenokKursNazvanie FROM Ocenka b -- ��� �����
--EXCEPT  -- �����
(SELECT a.ZHurnal_OcenokKursNazvanie FROM Ocenka a 
GROUP BY a.ZHurnal_OcenokKursNazvanie 
HAVING MIN(a.PromezhutochnyeOcenka1)>3 AND MIN(a.PromezhutochnyeOcenka2)>3 AND MIN(a.PromezhutochnyeOcenka3)>3 AND MIN(a.ItogovayaOcenka)>3) Raznost

 ON P.RaspisanieKursNazvanie=Raznost.ZHurnal_OcenokKursNazvanie) Pass
 ON Pass.NumerPassporta=Chelovek.NumerPassporta;


 SET STATISTICS TIME OFF;  
