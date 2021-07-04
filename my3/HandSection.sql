USE POTATO;
--DROP TABLE IF EXISTS [dbo].[T_Log1]
--DROP TABLE IF EXISTS [dbo].[T_Log2]

--CREATE TABLE [dbo].[T_Log1](
--	[Date_Time] [datetime2](7) NOT NULL,
--	[Employer] [nvarchar](255)  NOT NULL,
--	[Action] [nvarchar](1024) NOT NULL,
--	--PRIMARY KEY([Date_Time], [Employer])
--) --ON [PRIMARY]
--GO

--CREATE TABLE [dbo].[T_Log2](
--	[Date_Time] [datetime2](7) NOT NULL,
--	[Employer] [nvarchar](255)  NOT NULL,
--	[Action] [nvarchar](1024) NOT NULL,
--	--PRIMARY KEY([Date_Time], [Employer])
--) --ON [PRIMARY]
--GO


--DROP PROC  IF EXISTS  my_insert; 
--GO




--CREATE PROC my_insert @DT datetime2(7), @Emp nvarchar(255), @Act nvarchar(1024)
--AS    
--if(@DT < '2023-03-08 18:53:20.000001')
--	INSERT INTO T_Log1 (Date_Time, Employer, Action) VALUES (@DT, @Emp, @Act);
--else 
--	INSERT INTO T_Log2 (Date_Time, Employer, Action) VALUES (@DT, @Emp, @Act);


--	go


---- ���������� - ��������� ����
--Declare @date [datetime2](7)
--Set @date = '2023-03-03 00:00:00'  

---- ���������� ������� ��� ���������� ������ �������
--Declare @cnt int
--Set @cnt = 0

--While @cnt < 1000000
--Begin
--   -- ��������� ���� �� 1 �������
--   Set @date = DATEADD(second,1,@date)

--   -- ��������� ��������
--   Set @cnt = @cnt + 1

--   -- ������� ����� ���������� ������
--   --Insert Into T_Log values (@date,'������� ������� �����������', '������')
--   exec my_insert @date,'������� ������� �����������', '������'

--End
-- GO



--select Date_Time from T_Log1;
--select Date_Time from T_Log2;

GO

DROP View IF EXISTS T_Log_view
 
 GO

CREATE VIEW T_Log_view
AS  
select * from T_Log1 UNION select * from T_Log2


GO




 --������ ������
 --set statistics time on
 --select Date_Time from T_Log_view where Date_Time = '2023-03-08 15:52:00.000001'
 --set statistics time off

 --������� ������ 
-- set statistics time on
-- select Date_Time from T_Log_view where Date_Time = '2023-03-08 19:30:04.000001'
-- set statistics time off

 --������ ������
 --set statistics time on
 --select Date_Time from T_Log_view where Date_Time = '2023-03-08 20:53:30.000001'
 --set statistics time off