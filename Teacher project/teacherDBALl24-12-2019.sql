USE [master]
GO
/****** Object:  Database [TeacherDB]    Script Date: 12/24/2019 2:08:19 PM ******/
CREATE DATABASE [TeacherDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeacherDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MME\MSSQL\DATA\TeacherDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeacherDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MME\MSSQL\DATA\TeacherDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TeacherDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeacherDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeacherDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeacherDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeacherDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeacherDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeacherDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeacherDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeacherDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeacherDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeacherDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeacherDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeacherDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeacherDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeacherDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeacherDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeacherDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeacherDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeacherDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeacherDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeacherDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeacherDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeacherDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeacherDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeacherDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeacherDB] SET  MULTI_USER 
GO
ALTER DATABASE [TeacherDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeacherDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeacherDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeacherDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeacherDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeacherDB] SET QUERY_STORE = OFF
GO
USE [TeacherDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TeacherDB]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 12/24/2019 2:08:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceDate] [date] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 12/24/2019 2:08:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](200) NOT NULL,
	[GroupLocation] [nvarchar](200) NOT NULL,
	[GroupDate] [date] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 12/24/2019 2:08:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentAmount] [decimal](9, 2) NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[StudentId] [int] NOT NULL,
	[PaymentRemainder] [decimal](9, 2) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/24/2019 2:08:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](100) NOT NULL,
	[StudentMobile] [nvarchar](14) NULL,
	[ParentMobile] [nvarchar](14) NULL,
	[StudentAddress] [nvarchar](200) NULL,
	[Notes] [nvarchar](300) NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTests]    Script Date: 12/24/2019 2:08:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTests](
	[StudentTestID] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[StudentGrade] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_StudentTests] PRIMARY KEY CLUSTERED 
(
	[StudentTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 12/24/2019 2:08:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](100) NOT NULL,
	[TestDate] [date] NOT NULL,
	[TestGrade] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPassword] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attendances] ON 

INSERT [dbo].[Attendances] ([AttendanceID], [AttendanceDate], [StudentID]) VALUES (10, CAST(N'2019-12-23' AS Date), 7)
SET IDENTITY_INSERT [dbo].[Attendances] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([GroupId], [GroupName], [GroupLocation], [GroupDate]) VALUES (9, N'd', N'ALEX', CAST(N'2019-12-23' AS Date))
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentId], [PaymentAmount], [PaymentDate], [StudentId], [PaymentRemainder]) VALUES (8, CAST(2.00 AS Decimal(9, 2)), CAST(N'2019-12-23' AS Date), 7, CAST(2.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[Payments] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentMobile], [ParentMobile], [StudentAddress], [Notes], [GroupId]) VALUES (7, N'mohamed', N'12', N'23', N'sa', N'assd', 9)
INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentMobile], [ParentMobile], [StudentAddress], [Notes], [GroupId]) VALUES (8, N'ahmed', N'12', N'23', N'sa', N'assd', 9)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[StudentTests] ON 

INSERT [dbo].[StudentTests] ([StudentTestID], [StudentId], [TestId], [StudentGrade]) VALUES (12, 7, 5, CAST(2.00 AS Decimal(9, 2)))
INSERT [dbo].[StudentTests] ([StudentTestID], [StudentId], [TestId], [StudentGrade]) VALUES (13, 7, 5, CAST(2.00 AS Decimal(9, 2)))
INSERT [dbo].[StudentTests] ([StudentTestID], [StudentId], [TestId], [StudentGrade]) VALUES (14, 7, 5, CAST(4.00 AS Decimal(9, 2)))
INSERT [dbo].[StudentTests] ([StudentTestID], [StudentId], [TestId], [StudentGrade]) VALUES (15, 8, 6, CAST(3.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[StudentTests] OFF
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestId], [TestName], [TestDate], [TestGrade]) VALUES (5, N'ds', CAST(N'2019-12-23' AS Date), CAST(12.00 AS Decimal(9, 2)))
INSERT [dbo].[Tests] ([TestId], [TestName], [TestDate], [TestGrade]) VALUES (6, N'cs', CAST(N'2019-12-23' AS Date), CAST(12.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[Tests] OFF
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Students]
GO
ALTER TABLE [dbo].[Payments]  WITH NOCHECK ADD  CONSTRAINT [FK_Payments_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments] NOCHECK CONSTRAINT [FK_Payments_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups]
GO
ALTER TABLE [dbo].[StudentTests]  WITH CHECK ADD  CONSTRAINT [FK_StudentTests_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentTests] CHECK CONSTRAINT [FK_StudentTests_Students]
GO
ALTER TABLE [dbo].[StudentTests]  WITH CHECK ADD  CONSTRAINT [FK_StudentTests_Tests] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([TestId])
GO
ALTER TABLE [dbo].[StudentTests] CHECK CONSTRAINT [FK_StudentTests_Tests]
GO
/****** Object:  StoredProcedure [dbo].[sp_AttendanceDelete]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AttendanceDelete]
@AttendanceID int
as
begin
delete from Attendances where AttendanceID = @AttendanceID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AttendanceInsert]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_AttendanceInsert]
@AttendanceDate date,
@StudentID int
as
begin
insert into Attendances values(@AttendanceDate ,@StudentID )
end

GO
/****** Object:  StoredProcedure [dbo].[sp_AttendanceReadAll]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_AttendanceReadAll]
@AttendanceDate date
as
begin
select a.AttendanceID, a.AttendanceDate, s.StudentName,g.GroupName  from Attendances as a inner join Students as s  
							on a.StudentID = s.StudentId
							inner join Groups as g
							on s.GroupId = g.GroupId
						 where AttendanceDate = @AttendanceDate
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AttendanceReadbyID]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_AttendanceReadbyID]
@AttendanceID int
as
begin
select * from Attendances where AttendanceID = @AttendanceID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AttendanceUpdate]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AttendanceUpdate]
(
@AttendanceID int,
@AttendanceDate date,
@StudentID int
)
as
begin
update Attendances set AttendanceDate = @AttendanceDate, StudentID= @StudentID
 where AttendanceID = @AttendanceID 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GroupDelete]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_GroupDelete]
@GroupId int
as
begin
delete from Attendances where StudentID in(select StudentID from Students where Students.GroupId = @GroupId );

delete from Payments where StudentID in(select StudentID from Students where Students.GroupId = @GroupId );

delete from StudentTests where StudentID in(select StudentID from Students where Students.GroupId = @GroupId );

delete from Students where  Students.GroupId = @GroupId ;

delete from Groups where GroupId=@GroupId;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GroupInsert]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GroupInsert]
@GroupName nvarchar(200),
@GroupLocation nvarchar(200),
@GroupDate date
as
begin
insert into Groups values(@GroupName,@GroupLocation ,@GroupDate )
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GroupsReadAll]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_GroupsReadAll]
as
begin
select * from Groups
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GroupsReadbyID]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GroupsReadbyID]
@GroupId  int
as
begin
select * from Groups where GroupId  = @GroupId 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GroupsUpdate]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_GroupsUpdate]
@GroupId  int,
@GroupName nvarchar(200),
@GroupLocation nvarchar(200),
@GroupDate date
as
begin
update Groups set GroupName = @GroupName , GroupLocation = @GroupLocation, GroupDate = @GroupDate 
 where GroupId = @GroupId 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_PaymentDelete]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaymentDelete]
@PaymentId int
as
begin
delete from Payments where PaymentId = @PaymentId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaymentInsert]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaymentInsert]
@PaymentAmount decimal(9,2),
@PaymentDate date,
@StudentId int,
@PaymentRemainder decimal(9,2)
as
begin
insert into Payments values(@PaymentAmount,@PaymentDate ,@StudentId,@PaymentRemainder)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaymentReadAll]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaymentReadAll]
as
begin
select p.PaymentId, s.StudentName,g.GroupName, p.PaymentAmount,p.PaymentRemainder, p.PaymentDate from Payments as p 
inner join Students as s 
on p.StudentId = s.StudentId 
inner join Groups as g
on s.GroupId = g.GroupId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaymentReadbyID]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaymentReadbyID]
@PaymentId int
as
begin
select * from Payments where PaymentId = @PaymentId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaymentUpdate]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_PaymentUpdate]
(
@PaymentId int,
@PaymentAmount decimal(9,2),
@PaymentDate date,
@StudentId int,
@PaymentRemainder decimal(9,2)
)
as
begin
update Payments set PaymentDate = @PaymentDate, PaymentAmount = @PaymentAmount, StudentID= @StudentID, PaymentRemainder = @PaymentRemainder 
 where PaymentId = @PaymentId 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadSearchByName]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReadSearchByName]
@StudentName nvarchar(100)
as
begin
select * from Students where StudentName like '%' + @StudentName + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sp_ReadSearchByGroup]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_sp_ReadSearchByGroup]
@Group nvarchar(14)
as
begin
select * from Students as s join Groups as g on s.GroupId = g.GroupId where g.GroupName like '%' + @Group +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_sp_ReadSearchByMobile]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_sp_ReadSearchByMobile]
@StudentMobile  nvarchar(14)
as
begin
select * from Students where StudentMobile  = @StudentMobile
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentDelete]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentDelete]
@StudentId int
as
begin
delete from Students where StudentId = @StudentId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentInsert]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentInsert]
@StudentName nvarchar(100),
@StudentMobile nvarchar(14),
@ParentMobile nvarchar(14),
@StudentAddress nvarchar(200),
@Notes nvarchar(300),
@GroupId int
as
begin
insert into Students values(@StudentName,@StudentMobile,@ParentMobile,@StudentAddress,@Notes,@GroupId)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentsReadAll]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_StudentsReadAll]
as
begin
select * from Students
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentsReadAllByGroup]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentsReadAllByGroup]
@GroupId  int
as
begin
select * from Students where GroupId  = @GroupId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentsReadAllDGV]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_StudentsReadAllDGV]
as
begin
select s.StudentId, s.StudentName, s.StudentMobile, s.ParentMobile , s.StudentAddress, s.Notes ,g.GroupName  from Students as s inner join Groups as g
		on s.GroupId = g.GroupId 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentsReadbyGroupId]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentsReadbyGroupId]
@GroupId int
as
begin
select * from Students where GroupId = @GroupId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentsReadbyID]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_StudentsReadbyID]
@StudentId int
as
begin
select * from Students where StudentId = @StudentId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentsUpdate]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentsUpdate]
(
@StudentId int,
@StudentName nvarchar(100),
@StudentMobile nvarchar(14),
@ParentMobile nvarchar(14),
@StudentAddress nvarchar(200),
@Notes nvarchar(300),
@GroupId int
)
as
begin
update Students set StudentName = @StudentName, StudentMobile = @StudentMobile,ParentMobile = @ParentMobile, StudentAddress = @StudentAddress, Notes = @Notes ,GroupId = @GroupId 
 where StudentId = @StudentId 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentTestDelete]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentTestDelete]
@StudentTestID int
as
begin
delete from StudentTests where StudentTestID = @StudentTestID
end

GO
/****** Object:  StoredProcedure [dbo].[sp_StudentTestInsert]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentTestInsert]
@StudentId int,
@TestId int,
@StudentGrade decimal(9,2)
as
begin
insert into StudentTests values(@StudentId,@TestId ,@StudentGrade )
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentTestsReadAll]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_StudentTestsReadAll]
as
begin
select st.StudentTestID, s.StudentName, g.GroupName, st.StudentGrade,t.TestGrade,t.TestName  from StudentTests as st inner join Students as s
				on st.StudentId = s.StudentId
				inner join Groups as g
				on s.GroupId = g.GroupId
				inner join Tests as t
				on t.TestId = st.TestId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentTestsReadbyID]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StudentTestsReadbyID]
@StudentTestID  int
as
begin
select * from StudentTests where StudentTestID  = @StudentTestID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentTestsUpdate]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_StudentTestsUpdate]
@StudentTestID int,
@StudentId int,
@TestId int,
@StudentGrade decimal(9, 2)
as
begin
update StudentTests set StudentId = @StudentId , TestId = @TestId, StudentGrade= @StudentGrade 
 where StudentTestID = @StudentTestID 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TestDelete]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TestDelete]
@TestId int
as
begin
delete from Tests where TestId = @TestId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TestInsert]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TestInsert]
@TestName nvarchar(100),
@TestDate date,
@TestGrade decimal(9,2)
as
begin
insert into Tests values(@TestName,@TestDate ,@TestGrade )
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TestsReadAll]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TestsReadAll]
as
begin
select * from Tests
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TestsReadAllDGV]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TestsReadAllDGV]
as
begin
select t.TestId, t.TestName , t.TestGrade, t.TestDate from Tests as t
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TestsReadbyID]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TestsReadbyID]
@TestId  int
as
begin
select * from Tests where TestId  = @TestId 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TestsUpdate]    Script Date: 12/24/2019 2:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TestsUpdate]
@TestId  int,
@TestName nvarchar(100),
@TestDate date,
@TestGrade decimal(9, 2)
as
begin
update Tests set TestName = @TestName , TestDate = @TestDate, TestGrade= @TestGrade 
 where TestId = @TestId 
END
GO
USE [master]
GO
ALTER DATABASE [TeacherDB] SET  READ_WRITE 
GO
