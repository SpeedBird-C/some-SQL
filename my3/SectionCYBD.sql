USE POTATO;
--7 ����� ----------������������ ���������� ����
--DROP TABLE IF EXISTS [dbo].[T_Log] --������� ������� ����� ������� 7


----���������� ��������� ���������� ��������
--CREATE TABLE [dbo].[T_Log](
--	[Date_Time] [datetime2](7) NOT NULL,
--	[Employer] [nvarchar](255)  NOT NULL,
--	[Action] [nvarchar](1024) NOT NULL,
--	--PRIMARY KEY([Date_Time], [Employer]) ������� �������� ��� ��� ����,����� ��������� ����
--)-- ON [PRIMARY]
--GO

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
--   Insert Into T_Log values (@date,'������� ������� �����������', '������')
--End

-- --�� ��������

-- select Date_Time from T_Log
 
  --����� �� ������ ������ � ���� ��� ������� ��� ��� ������������
 --set statistics time on
 --select Date_Time from T_Log where Date_Time = '2023-03-08 19:31:09.000001'
 --set statistics time off



 --������ ������
 --set statistics time on
 --select Date_Time from T_Log where Date_Time = '2023-03-08 15:52:00.000001'
 --set statistics time off



 --������� ������ 
 --set statistics time on
 --select Date_Time from T_Log where Date_Time = '2023-03-08 19:30:04.000001'
 --set statistics time off


 --������ ������
 --set statistics time on
 --select Date_Time from T_Log where Date_Time = '2023-03-08 20:53:30.000001'
 --set statistics time off


 



