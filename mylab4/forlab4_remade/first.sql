use EducCenter;
----SELECT id, time, 
----    (SELECT MIN(time) FROM idtimes sub 
----        WHERE sub.id = main.id AND sub.time > main.time) as nxttime
----  FROM idtimes AS main 
--select Id,KursNazvanie, VremyaNachala,
--	( SELECT MIN(VremyaNachala) FROM RaspisanieZanyatij sub
--		WHERE sub.Id=main.Id AND sub.VremyaNachala>main.VremyaNachala) as nxttime FROM RaspisanieZanyatij AS main ;--order by main.VremyaNachala ASC;

----CONVERT(TIME, @OpeningTime)

----SELECT
----    i1.id,
----    i1.VremyaNachala AS time1,
----    i2.VremyaNachala AS next_time
----	--i3.VremyaNachala AS intrudor_time

----FROM
----    RaspisanieZanyatij AS i1
----    LEFT JOIN RaspisanieZanyatij AS i2 ON i1.id = i2.id AND CONVERT(TIME,i2.VremyaNachala) > CONVERT(TIME,i1.VremyaNachala)

--�����
--SELECT l.id, l.VremyaNachala, min(r.VremyaNachala) 
--FROM RaspisanieZanyatij l 
--LEFT JOIN RaspisanieZanyatij r on (r.VremyaNachala > l.VremyaNachala)
--GROUP BY l.id, l.VremyaNachala;
-----------------------------------------------------------------------------------------------------------------------------------------------------

--Select id,KursNazvanie,VremyaNachala FROM RaspisanieZanyatij ORDER BY Id ASC;

--!!!!!!!!!!!!!!!!!!
--SELECT DISTINCT
--    --i1.id,
--    i1.VremyaNachala AS time,
--    min(i2.VremyaNachala) AS greater_time
--FROM
--    RaspisanieZanyatij AS i1
--    LEFT JOIN  RaspisanieZanyatij AS i2 ON   i2.VremyaNachala > i1.VremyaNachala
--	GROUP BY i1.VremyaNachala;
	--!!!!!!!!!!!!!!!!




--SELECT DISTINCT
--    --i1.id,
--    i1.VremyaNachala AS time,
--    i2.VremyaNachala AS greater_time
--FROM RaspisanieZanyatij  i1
--    LEFT JOIN  RaspisanieZanyatij  i2 ON   i2.VremyaNachala > i1.VremyaNachala




--SELECT 
--    --i1.id,
--    i1.VremyaNachala AS time,
--    i2.VremyaNachala AS greater_time
--FROM RaspisanieZanyatij  i1
--    LEFT JOIN  (
--		SELECT VremyaNachala, min(VremyaNachala)  AS VremNach
--		FROM RaspisanieZanyatij
--		GROUP BY VremyaNachala
--	) i2 ON   i2.VremyaNachala > i1.VremyaNachala;


--SELECT DISTINCT
--    i1.id,
--    i1.VremyaNachala AS time,
--    i2.VremyaNachala AS greater_time,
--	i3.VremyaNachala AS intrudor_time

--FROM
--    RaspisanieZanyatij AS i1
--    LEFT JOIN  RaspisanieZanyatij AS i2 ON   i2.VremyaNachala > i1.VremyaNachala
--	LEFT JOIN RaspisanieZanyatij AS i3 ON  i3.VremyaNachala > i1.VremyaNachala --AND i3.VremyaNachala < i2.VremyaNachala



--SELECT DISTINCT
--    --i1.id,
--    i1.VremyaNachala AS time,
--    i2.VremyaNachala AS greater_time,
--	i3.VremyaNachala AS intrudor_time

--FROM RaspisanieZanyatij  i1
--    LEFT JOIN  (
--		SELECT VremyaNachala, min(VremyaNachala)  AS VremNach
--		FROM RaspisanieZanyatij
--		GROUP BY VremyaNachala
--	) i2 ON   i2.VremyaNachala > i1.VremyaNachala
--	LEFT JOIN 
--	(
--	SELECT VremyaNachala, min(VremyaNachala)  AS VremNach2
--		FROM RaspisanieZanyatij
--		GROUP BY VremyaNachala
--	) i3 ON  i3.VremyaNachala > i1.VremyaNachala AND i3.VremyaNachala < i2.VremyaNachala
	
--SELECT KursNazvanie, VremyaNachala, (SELECT NumerPassporta FROM Prepodavatel WHERE Prepodavatel.RaspisanieKursNazvanie=KursNazvanie ) FROM RaspisanieZanyatij ORDER BY VremyaNachala ASC;


--1)--��������
--SELECT KursNazvanie, VremyaNachala, (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = (SELECT NumerPassporta FROM Prepodavatel WHERE Prepodavatel.RaspisanieKursNazvanie=KursNazvanie))  FROM RaspisanieZanyatij ORDER BY VremyaNachala ASC;

--1, �� lead

--SELECT  KursNazvanie, 
--LEAD(KursNazvanie) OVER(ORDER BY KursNazvanie) next_code
--FROM RaspisanieZanyatij;



--1
--SELECT t1.KursNazvanie, MIN(t2.KursNazvanie) VremyaNachala1
--FROM RaspisanieZanyatij t1
--LEFT JOIN RaspisanieZanyatij t2 ON t1.KursNazvanie < t2.KursNazvanie
--GROUP BY t1.KursNazvanie



-------------------------------------------------------------------------------------------------------
--1
--SELECT --DISTINCT
--    --i1.id,
--    i1.KursNazvanie AS time,
--    min(i2.KursNazvanie) AS greater_time
--FROM
--    RaspisanieZanyatij AS i1
--    LEFT JOIN  RaspisanieZanyatij AS i2 ON   i2.KursNazvanie > i1.KursNazvanie
--	GROUP BY i1.KursNazvanie;


------------------------------------------------------------------------------------------------------------------------2

--2   ������� ��� ���� ��������������, ������� ����� ������� �� ������. ��������� ������������� �� ��������.

--SELECT Chelovek.FIO FROM Chelovek 
--JOIN 
--(SELECT NumerPassporta FROM Prepodavatel INTERSECT (SELECT NumerPassporta FROM Obuchayushchijsya)) AS Pass ON Chelovek.NumerPassporta=Pass.NumerPassporta
--ORDER BY Chelovek.FIO ASC;


--3 ������� ���� ����������� � ������� ������ �� ����� ����������� ��� ����, ��� ��� �������� � �������: ���, ������


--SELECT ObuchayushchijsyaNumerPassporta FROM Ocenka

 
--SELECT Chelovek.FIO FROM Chelovek 
--JOIN
--(SELECT ObuchayushchijsyaNumerPassporta,ItogovayaOcenka FROM Ocenka) AS PASS ON  Chelovek.NumerPassporta=PASS.ObuchayushchijsyaNumerPassporta  --�����

 --3) �� �����
-- SELECT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO ,ItogovayaOcenka FROM Ocenka WHERE ZHurnal_OcenokKursNazvanie='����������'
 --SELECT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO ,ZHurnal_OcenokKursNazvanie,ItogovayaOcenka FROM Ocenka WHERE ZHurnal_OcenokKursNazvanie='����������'

 --3) ��� ���

-- SELECT T1.FIO, T2.ItogovayaOcenka FROM

--(SELECT DISTINCT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO  FROM Ocenka) T1
--LEFT JOIN 
  
--(SELECT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO ,ItogovayaOcenka FROM Ocenka WHERE ZHurnal_OcenokKursNazvanie='����������') T2
--ON T2.FIO=T1.FIO; 





--SELECT DISTINCT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO  FROM Ocenka
--������� ���� �������
--SELECT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO ,ItogovayaOcenka FROM Ocenka WHERE ZHurnal_OcenokKursNazvanie='����������'
--������� � ������ ������ ���, ��� �������� ����















 --4--------------������� ������ ��� ��������������, ������� ������� �� ���������� �� ����� ������ ���� 3
 


--SELECT Chelovek.FIO FROM Chelovek 
--JOIN
--(SELECT P.NumerPassporta FROM Prepodavatel AS P
-- JOIN --��� �� �������� ������ ������ �����������

--(SELECT  b.ZHurnal_OcenokKursNazvanie FROM Ocenka b -- ��� �����
--EXCEPT  -- �����
--SELECT a.ZHurnal_OcenokKursNazvanie FROM Ocenka a WHERE a.PromezhutochnyeOcenka1<=3 OR a.PromezhutochnyeOcenka2<=3 OR a.PromezhutochnyeOcenka3<=3 OR 
-- a.ItogovayaOcenka<=3) Raznost  -- �������, ��� ���� �� 1 ������

-- ON P.RaspisanieKursNazvanie=Raznost.ZHurnal_OcenokKursNazvanie) Pass
-- ON Pass.NumerPassporta=Chelovek.NumerPassporta;



 














 -------5 ���������� ������� ���� ��� ������� �������� �� ����������� ������ (�� ������� ���� �������� ������).
 --------�������� ��������� � ���� ��� � ������� ������ ������������ �� ������ �� ������������ � �����������


-- SELECT ObuchayushchijsyaNumerPassporta,AVG(ItogovayaOcenka) as Average FROM Ocenka GROUP BY ObuchayushchijsyaNumerPassporta;

Declare @Time1 datetime2(7)
Declare @Time2 datetime2(7)
Declare @cnt int


set @cnt=0
set @Time1=SYSDATETIME()
While @cnt<100
Begin
 SELECT (SELECT Chelovek.FIO FROM Chelovek WHERE Chelovek.NumerPassporta = ObuchayushchijsyaNumerPassporta) FIO,AVG(ItogovayaOcenka) as Average FROM Ocenka GROUP BY ObuchayushchijsyaNumerPassporta ORDER BY Average DESC;
set @cnt=@cnt+1
END
set @Time2=SYSDATETIME()



print ' Time elapsed for query from 2 lab: '+convert(varchar(36),DATEDIFF(microsecond,@Time1,@Time2)/100,14)

