USE [master]
GO
/****** Object:  Database [FakeJudge]    Script Date: 6/2/2018 9:28:57 PM ******/
CREATE DATABASE [FakeJudge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FakeJudge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FakeJudge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FakeJudge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FakeJudge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FakeJudge] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FakeJudge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FakeJudge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FakeJudge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FakeJudge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FakeJudge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FakeJudge] SET ARITHABORT OFF 
GO
ALTER DATABASE [FakeJudge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FakeJudge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FakeJudge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FakeJudge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FakeJudge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FakeJudge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FakeJudge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FakeJudge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FakeJudge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FakeJudge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FakeJudge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FakeJudge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FakeJudge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FakeJudge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FakeJudge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FakeJudge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FakeJudge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FakeJudge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FakeJudge] SET  MULTI_USER 
GO
ALTER DATABASE [FakeJudge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FakeJudge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FakeJudge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FakeJudge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FakeJudge] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FakeJudge] SET QUERY_STORE = OFF
GO
USE [FakeJudge]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FakeJudge]
GO
/****** Object:  Table [dbo].[EventJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventJudges](
	[EventID] [int] NOT NULL,
	[JudgeID] [int] NOT NULL,
	[EventJudgesID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EventJudges] PRIMARY KEY CLUSTERED 
(
	[EventJudgesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Judge]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judge](
	[JudgeID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[judgeUname] [varchar](50) NOT NULL,
	[judgePword] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Judge] PRIMARY KEY CLUSTERED 
(
	[JudgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwdgallaccounts]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE view  [dbo].[vwdgallaccounts]
as
  Select P.FirstName,P.LastName,J.judgeUname,j.judgePword from Person as P
  inner join Judge as J
	on J.PersonID = P.PersonID
  Inner join EventJudges as EJ
   on EJ.JudgeID = J.JudgeID






GO
/****** Object:  Table [dbo].[Contestant]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contestant](
	[ContestantID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ContestantNumber] [int] NULL,
	[TotalScore] [float] NULL,
 CONSTRAINT [PK_Contestant] PRIMARY KEY CLUSTERED 
(
	[ContestantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[CriteriaID] [int] IDENTITY(1,1) NOT NULL,
	[CriteriaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[CriteriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventName] [varchar](50) NOT NULL,
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[IsFinalize] [bit] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCriteria](
	[EventID] [int] NOT NULL,
	[CriteriaID] [int] NOT NULL,
	[EventCriteriaID] [int] IDENTITY(1,1) NOT NULL,
	[Weight] [float] NOT NULL,
 CONSTRAINT [PK_EventCriteria] PRIMARY KEY CLUSTERED 
(
	[EventCriteriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventOrganizer]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventOrganizer](
	[PersonID] [int] NOT NULL,
	[adminUname] [varchar](50) NOT NULL,
	[adminPword] [varchar](50) NOT NULL,
	[EventID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Score]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[EventCriteriaID] [int] NOT NULL,
	[ContestantID] [int] NOT NULL,
	[EventJudgesID] [int] NOT NULL,
	[Score] [float] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Contestant] ON 

INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1, 1, 2, 1, 71.125)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2, 1, 6, 2, 73.5)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (3, 1, 7, 3, 74.125)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (4, 1, 8, 4, 71.25)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (5, 1, 9, 5, 73.25)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1001, 1001, 2, 1, 50)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1002, 1001, 6, 2, 70)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1003, 1001, 1003, 3, 60)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1004, 1002, 6, 1, 0)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1005, 1002, 2, 2, 0)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1007, 1003, 1001, 1, 61.5)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1010, 1003, 2, 2, 56.5)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1012, 1003, 1003, 3, 59)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1013, 1004, 8, 1, 100)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (1015, 1005, 7, 1, 0)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2021, 1, 2019, NULL, 78.5)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2025, 1010, 2023, NULL, NULL)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2026, 1010, 9, NULL, NULL)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2027, 1010, 1004, NULL, NULL)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2030, 1013, 8, NULL, NULL)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2032, 1015, 9, NULL, NULL)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (2035, 1015, 2013, NULL, NULL)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (3032, 2030, 1005, NULL, 0)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (3033, 2030, 3063, NULL, 0)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (3034, 2032, 2, 1, 50)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (3035, 2032, 7, 2, 70)
INSERT [dbo].[Contestant] ([ContestantID], [EventID], [PersonID], [ContestantNumber], [TotalScore]) VALUES (3036, 2032, 8, 3, 60)
SET IDENTITY_INSERT [dbo].[Contestant] OFF
SET IDENTITY_INSERT [dbo].[Criteria] ON 

INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1, N'Criteria 1')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (2, N'Criteria 2')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (3, N'Criteria 3')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (4, N'Criteria 4')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (5, N'Criteria 5')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (6, N'Criteria 6')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1001, N'Criteria 7')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1002, N'Kapogian')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1003, N'Kasexyhana')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1004, N'whiteness')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1005, N'asdasd')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1006, N'testb')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1007, N'Eee')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1008, N'Ppp')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1009, N'Cleanlinesd')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1010, N'Last crit')
INSERT [dbo].[Criteria] ([CriteriaID], [CriteriaName]) VALUES (1011, N'Last last crit')
SET IDENTITY_INSERT [dbo].[Criteria] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Real Judging System', 1, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Barn Drinking Contest', 2, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'final test', 1001, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'try event', 1002, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'hello', 1003, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'kantutan fest 2017', 1004, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'fsdfsd', 1005, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'test', 1006, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'popo', 1007, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'popopo', 1008, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'popopo1', 1009, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'lolo123''s event', 1010, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Test event 2', 1013, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Something', 1014, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Help Lord', 1015, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Qaz', 1016, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'qwers', 2018, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'123456', 2027, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'asdasd', 2028, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Dotnet4 test', 2030, 1)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'', 2031, 0)
INSERT [dbo].[Event] ([EventName], [EventID], [IsFinalize]) VALUES (N'Hehehe', 2032, 1)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[EventCriteria] ON 

INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1, 1, 1, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1, 2, 2, 15)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1, 3, 3, 30)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1, 4, 4, 15)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1, 5, 5, 15)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1001, 1, 1001, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1001, 2, 1002, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1001, 3, 1003, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1002, 1, 1004, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1002, 2, 1005, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1003, 1, 1006, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1003, 2, 1007, 40)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1003, 1001, 1009, 10)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1004, 1002, 1010, 20)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1004, 1003, 1011, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1004, 1001, 1012, 55)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1005, 2, 1013, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1005, 1004, 1014, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1010, 2, 1032, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1013, 1, 1034, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1013, 1002, 1035, 75)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (1016, 2, 1036, 100)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2028, 2, 2039, 20)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2028, 1, 2040, 20)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2028, 6, 2041, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2030, 1002, 2042, 49)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2030, 1009, 2043, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2, 1, 2044, 50)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2030, 1010, 2045, 1)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2030, 1011, 2046, 1)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2032, 1, 2047, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2032, 2, 2048, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2032, 3, 2049, 25)
INSERT [dbo].[EventCriteria] ([EventID], [CriteriaID], [EventCriteriaID], [Weight]) VALUES (2032, 4, 2050, 25)
SET IDENTITY_INSERT [dbo].[EventCriteria] OFF
SET IDENTITY_INSERT [dbo].[EventJudges] ON 

INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1, 1, 1)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1, 2, 2)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1, 3, 3)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1001, 1, 1001)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1001, 1001, 1002)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1002, 1, 1003)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1002, 2, 1004)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1003, 1, 1005)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1003, 1002, 1006)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1003, 2, 1007)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1003, 3, 1008)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1004, 4, 1009)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1005, 2, 1010)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1, 4, 1011)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1010, 1, 1015)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1010, 1003, 1016)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1010, 1002, 1017)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1010, 1001, 1018)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1013, 3, 1020)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1013, 1003, 1021)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1013, 1002, 1022)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1013, 1004, 1023)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1016, 3, 1024)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2028, 1005, 2024)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2030, 1, 2026)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2030, 2012, 2027)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2, 1002, 2029)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2, 2013, 2030)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2032, 1, 2031)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (2032, 2, 2032)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1006, 2012, 3028)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1006, 1, 3038)
INSERT [dbo].[EventJudges] ([EventID], [JudgeID], [EventJudgesID]) VALUES (1006, 3009, 3039)
SET IDENTITY_INSERT [dbo].[EventJudges] OFF
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (6, N'eoaccount', N'1234', 1)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (7, N'eoaccount2', N'1234', 2)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (1001, N'testing', N'testing', 1001)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (1004, N'try', N'try', 1002)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (1005, N'hello', N'hello', 1003)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (1007, N'tang', N'tang', 1004)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (1008, N'ratrat', N'tang1', 1005)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2014, N'test', N'test', 1006)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2015, N'popo', N'popo', 1007)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2016, N'popopo', N'popopo', 1008)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2017, N'popopo1', N'popopo1', 1009)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2023, N'lolo123', N'lolo123', 1010)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2027, N'Qwer', N'Qwer', 1013)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2028, N'judge2', N'1234', 1014)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2029, N'Admin', N'Admin', 1015)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (2030, N'Qaz', N'Qaz', 1016)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (3042, N'qwers', N'qwers', 2018)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (3065, N'', N'', 2031)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (3066, N'abcd', N'1234', 2032)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (3051, N'123456', N'123456', 2027)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (3052, N'asdasd', N'asdasd', 2028)
INSERT [dbo].[EventOrganizer] ([PersonID], [adminUname], [adminPword], [EventID]) VALUES (3061, N'D4', N'123', 2030)
SET IDENTITY_INSERT [dbo].[Judge] ON 

INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (1, 1, N'macoycorpuz', N'1234')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (2, 3, N'judge1', N'1234')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (3, 4, N'judge2', N'1234')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (4, 5, N'judge3', N'1234')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (1001, 1002, N'grasyeng', N'1234')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (1002, 1006, N'samples', N'sample')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (1003, 2021, N'Parappa', N'Parappa')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (1004, 2025, N'Tet', N'Tet')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (1005, 2031, N'Jsjsjdi', N'jsjsjsk')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (2010, 3058, N'q', N'q')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (2012, 3062, N'Toff', N'toff')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (2013, 3064, N'Pizza', N'1234')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (3008, 4054, N'a', N'a')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (3009, 4055, N'da', N'd')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (3010, 4056, N'', N'')
INSERT [dbo].[Judge] ([JudgeID], [PersonID], [judgeUname], [judgePword]) VALUES (3011, 4057, N'e', N'r')
SET IDENTITY_INSERT [dbo].[Judge] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1, N'Marcuz', N'Corpuz')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2, N'Kyle', N'Floresta')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3, N'Marvin', N'Lee')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (4, N'Jimmy', N'Ilejay')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (5, N'Gabriel', N'Abel')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (6, N'Mark', N'Abalos')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (7, N'Jemuelt', N'Sandoval')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (8, N'Jaycee', N'Galo')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (9, N'Keanu', N'Orilla')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1001, N'Burger', N'Burger')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1002, N'Grace', N'Reyes')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1003, N'Sasha', N'Grey')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1004, N'try', N'try')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1005, N'hello', N'hello')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1006, N'Sampler', N'Sampler')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1007, N'kyle pogi', N'titi')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (1008, N'fsdfsd', N'fdsfds')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2013, N'pepelord', N'pepeking')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2014, N'test', N'test')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2015, N'popo', N'popo')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2016, N'popopo', N'popopo')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2017, N'popopo1', N'popopo1')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2018, N'lol', N'tylers')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2019, N'asda21', N'eyeshield21')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2020, N'lol', N'tyler')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2021, N'Parappa', N'The')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2023, N'lolo', N'momo')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2025, N'Tet', N'Tet')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2026, N'9080', N'Oo')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2027, N'Asd', N'Asd')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2028, N'Marcus', N'Corpuz')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2029, N'Hello', N'Hi')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2030, N'Toff', N'Mabaggu')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (2031, N'Paoap', N'Lskspwks')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3042, N'qwers', N'qwers')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3051, N'123456', N'123456')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3052, N'asdasd', N'asdasd')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3058, N'q', N'qq')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3061, N'aa', N'aa')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3062, N'Toffa', N'Toff')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3063, N'Bb', N'Bb')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3064, N'Kyle', N'')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3065, N'Mountain', N'Dew')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (3066, N'Mounatin', N'Dew')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (4054, N's', N'a')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (4055, N'd', N'd')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (4056, N'', N'')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName]) VALUES (4057, N'w', N'q')
SET IDENTITY_INSERT [dbo].[Person] OFF
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 1, 1, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 1, 1, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 1, 1, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 1, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 1, 1, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 2, 1, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 2, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 2, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 2, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 2, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 3, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 3, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 3, 1, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 3, 1, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 3, 1, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 4, 1, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 4, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 4, 1, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 4, 1, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 4, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 5, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 5, 1, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 5, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 5, 1, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 5, 1, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 1, 2, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 1, 2, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 1, 2, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 1, 2, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 1, 2, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 2, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 2, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 2, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 2, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 2, 2, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 3, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 3, 2, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 3, 2, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 3, 2, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 3, 2, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 4, 2, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 4, 2, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 4, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 4, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 4, 2, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 5, 2, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 5, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 5, 2, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 5, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 5, 2, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 1, 3, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 1, 3, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 1, 3, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 1, 3, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 1, 3, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 2, 3, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 2, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 2, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 2, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 2, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 3, 3, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 3, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 3, 3, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 3, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 3, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 4, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 4, 3, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 4, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 4, 3, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 4, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1, 5, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2, 5, 3, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (3, 5, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (4, 5, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (5, 5, 3, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1001, 1001, 1001, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1002, 1001, 1001, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1003, 1001, 1001, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1001, 1002, 1001, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1002, 1002, 1001, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1003, 1002, 1001, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1001, 1003, 1001, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1002, 1003, 1001, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1003, 1003, 1001, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1001, 1001, 1002, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1002, 1001, 1002, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1003, 1001, 1002, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1001, 1002, 1002, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1002, 1002, 1002, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1003, 1002, 1002, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1001, 1003, 1002, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1002, 1003, 1002, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1003, 1003, 1002, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1004, 1004, 1003, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1005, 1004, 1003, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1004, 1005, 1003, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1005, 1005, 1003, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1004, 1004, 1004, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1005, 1004, 1004, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1004, 1005, 1004, 0)
GO
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1005, 1005, 1004, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1007, 1005, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1007, 1005, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1010, 1005, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1010, 1005, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1010, 1005, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1012, 1005, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1012, 1005, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1012, 1005, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1007, 1006, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1007, 1006, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1007, 1006, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1010, 1006, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1010, 1006, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1010, 1006, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1012, 1006, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1012, 1006, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1012, 1006, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1007, 1007, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1007, 1007, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1007, 1007, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1010, 1007, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1010, 1007, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1010, 1007, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1012, 1007, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1012, 1007, 2)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1012, 1007, 3)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1007, 1008, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1007, 1008, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1007, 1008, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1010, 1008, 4)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1010, 1008, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1010, 1008, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1006, 1012, 1008, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1007, 1012, 1008, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1012, 1008, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1010, 1013, 1009, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1011, 1013, 1009, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1012, 1013, 1009, 10)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1013, 1015, 1010, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1014, 1015, 1010, 0)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (1009, 1007, 1005, 6)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2047, 3034, 2031, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2048, 3034, 2031, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2049, 3034, 2031, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2050, 3034, 2031, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2047, 3035, 2031, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2048, 3035, 2031, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2049, 3035, 2031, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2050, 3035, 2031, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2047, 3036, 2031, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2048, 3036, 2031, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2049, 3036, 2031, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2050, 3036, 2031, 7)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2047, 3034, 2032, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2048, 3034, 2032, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2049, 3034, 2032, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2050, 3034, 2032, 5)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2047, 3035, 2032, 4)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2048, 3035, 2032, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2049, 3035, 2032, 4)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2050, 3035, 2032, 8)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2047, 3036, 2032, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2048, 3036, 2032, 9)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2049, 3036, 2032, 1)
INSERT [dbo].[Score] ([EventCriteriaID], [ContestantID], [EventJudgesID], [Score]) VALUES (2050, 3036, 2032, 9)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_AdminUname]    Script Date: 6/2/2018 9:28:58 PM ******/
ALTER TABLE [dbo].[EventOrganizer] ADD  CONSTRAINT [UK_AdminUname] UNIQUE NONCLUSTERED 
(
	[adminUname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_JudgeUname]    Script Date: 6/2/2018 9:28:58 PM ******/
ALTER TABLE [dbo].[Judge] ADD  CONSTRAINT [UK_JudgeUname] UNIQUE NONCLUSTERED 
(
	[judgeUname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contestant]  WITH CHECK ADD  CONSTRAINT [FK_Contestant_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Contestant] CHECK CONSTRAINT [FK_Contestant_Event]
GO
ALTER TABLE [dbo].[Contestant]  WITH CHECK ADD  CONSTRAINT [FK_Contestant_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Contestant] CHECK CONSTRAINT [FK_Contestant_Person]
GO
ALTER TABLE [dbo].[EventCriteria]  WITH CHECK ADD  CONSTRAINT [FK_EventCriteria_Criteria] FOREIGN KEY([CriteriaID])
REFERENCES [dbo].[Criteria] ([CriteriaID])
GO
ALTER TABLE [dbo].[EventCriteria] CHECK CONSTRAINT [FK_EventCriteria_Criteria]
GO
ALTER TABLE [dbo].[EventCriteria]  WITH CHECK ADD  CONSTRAINT [FK_EventCriteria_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventCriteria] CHECK CONSTRAINT [FK_EventCriteria_Event]
GO
ALTER TABLE [dbo].[EventJudges]  WITH CHECK ADD  CONSTRAINT [FK_EventJudges_Even] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventJudges] CHECK CONSTRAINT [FK_EventJudges_Even]
GO
ALTER TABLE [dbo].[EventJudges]  WITH CHECK ADD  CONSTRAINT [FK_EventJudges_Judge] FOREIGN KEY([JudgeID])
REFERENCES [dbo].[Judge] ([JudgeID])
GO
ALTER TABLE [dbo].[EventJudges] CHECK CONSTRAINT [FK_EventJudges_Judge]
GO
ALTER TABLE [dbo].[EventOrganizer]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventOrganizer] CHECK CONSTRAINT [FK_Admin_Event]
GO
ALTER TABLE [dbo].[EventOrganizer]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[EventOrganizer] CHECK CONSTRAINT [FK_Admin_Person]
GO
ALTER TABLE [dbo].[Judge]  WITH CHECK ADD  CONSTRAINT [FK_Judge_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Judge] CHECK CONSTRAINT [FK_Judge_Person]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Contestant] FOREIGN KEY([ContestantID])
REFERENCES [dbo].[Contestant] ([ContestantID])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Contestant]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_EvenCriteria] FOREIGN KEY([EventCriteriaID])
REFERENCES [dbo].[EventCriteria] ([EventCriteriaID])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_EvenCriteria]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_EventJudges] FOREIGN KEY([EventJudgesID])
REFERENCES [dbo].[EventJudges] ([EventJudgesID])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_EventJudges]
GO
/****** Object:  StoredProcedure [dbo].[KFspAddConNum]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[KFspAddConNum]
(
	@fname						VarChar(50),
	@lname						varchar(50),
	@_eventid					int,
	@connum					int
)
as
Begin
	Begin TRY
		Begin Transaction

			update Contestant
			set ContestantNumber = @connum
			where Contestant.PersonID = (
			select p.personid from person as p
			where p.FirstName = @fname and p.LastName=@lname)
			and Contestant.EventID = @_eventid


		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[KFspAddExistingPersontoContestant]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[KFspAddExistingPersontoContestant]
(
	@fname						VarChar(50),
	@lname						varchar(50),
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction
		
			insert  Contestant (PersonID,EventID)
			values ((Select PersonID from Person as P
					where P.FirstName like @fname
					and P.LastName like @lname)
					,@_eventid)

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End







GO
/****** Object:  StoredProcedure [dbo].[KFspAddPersonToContestant]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[KFspAddPersonToContestant]
(
	@fname							Varchar(50),
	@lname							Varchar(50),
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

		insert into [Person] (FirstName,LastName)
		values(@fname,@lname)
	
		Insert into Contestant(EventID,PersonID)
		values((@_eventid),(select p.PersonID from Person as p
			where p.FirstName = @fname AND p.LastName = @lname ))

		

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[KFspCheckConExistance]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspCheckConExistance]
(
	@fname						VarChar(50),
	@lname						varchar(50),
	@_eventid					int

)
as
Begin
	Begin TRY
		Begin Transaction
		 
		Select P.PersonID from Person as P
		inner join  Contestant as C
		on C.PersonID = P.PersonID
		where P.FirstName = @fname
		and P.LastName = @lname
		and C.EventID = @_eventid


		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[KFspCheckconnameavailability]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspCheckconnameavailability]
(
	@fname						VarChar(50),
	@lname						varchar(50)
)
as
Begin
	Begin TRY
		Begin Transaction
		
		Select * from Person as P
		where P.FirstName like @fname
		and P.LastName like @lname

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[KFspCheckEventAccount]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspCheckEventAccount]
(

	@epname					varchar(50),
	@euname					varchar(50)
)
as
Begin
	Begin TRY
		Begin Transaction


			select * from EventOrganizer as eo
			where eo.adminPword = @epname COLLATE SQL_Latin1_General_CP1_CS_AS and
					eo.adminUname = @euname COLLATE SQL_Latin1_General_CP1_CS_AS

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End


GO
/****** Object:  StoredProcedure [dbo].[KFspCheckEventName]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[KFspCheckEventName]
(


	@ename					varchar(50)
)
as
Begin
	Begin TRY
		Begin Transaction


			select * from event as e
			where e.EventName = @ename COLLATE SQL_Latin1_General_CP1_CS_AS 

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End


GO
/****** Object:  StoredProcedure [dbo].[KFspCheckEventPerson]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspCheckEventPerson]
(

	@efname					varchar(50),
	@elname					varchar(50)

)
as
Begin
	Begin TRY
		Begin Transaction


			select * from dbo.Person as p
			where p.FirstName = @efname COLLATE SQL_Latin1_General_CP1_CS_AS and
			p.LastName = @elname COLLATE SQL_Latin1_General_CP1_CS_AS 

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[KFspCreateEvent]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspCreateEvent]
(

	@efname					varchar(50),
	@elname					varchar(50),
	@epname					varchar(50),
	@ename					varchar(50),
	@euname					varchar(50)
)
as
Begin
	Begin TRY
		Begin Transaction

			insert Person (FirstName,LastName)
			values(@efname,@elname)

			insert Event (EventName,IsFinalize)
			values(@ename,0)

			Insert EventOrganizer (adminPword,adminUname,PersonID,EventID)
			values (
			(@epname),
			(@euname),
			(select p.PersonID from Person as p
			where p.FirstName = @efname
			and p.LastName = @elname),
			(select e.EventID from Event as e
			where e.EventName=@ename)
			
			)

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End


GO
/****** Object:  StoredProcedure [dbo].[KFspFinalizeEvent]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[KFspFinalizeEvent]
(

	@eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction


				update e
				set e.IsFinalize = 1
				from [event] as e
				where e.eventid=@eventid


		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[KFspPopulateScores]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspPopulateScores]
(
	@confname						Varchar(50),
	@conlname						Varchar(50),	
	@judgefname						Varchar(50),
	@judgelname						Varchar(50),
	@judgeuname						VarChar(50),
	@judgepass						varchar(50),
	@eventid					int,
	@critname					varchar(50)
)
as
Begin
	Begin TRY
		Begin Transaction

		
		Insert into Score (EventCriteriaID, ContestantID,EventJudgesID,Score )
		values(
		(Select ec.EventCriteriaID from EventCriteria as ec
				where ec.EventID=@eventid 
					and	  ec.CriteriaID= (select C.CriteriaID from Criteria as C 
												where C.CriteriaName=@critname))
			,(Select c.ContestantID from Contestant as C
			where C.PersonID=(select p.personid from person as p where p.FirstName=@confname and p.LastName=@conlname)
			and c.EventID =@eventid
				)
				,(
				select ej.EventJudgesID from EventJudges as ej
					where ej.JudgeID= (select j.judgeid from judge as j 
					inner join person as p on p.PersonID = j.PersonID
					 where p.FirstName=@judgefname 
					 and p.LastName=@judgelname	 
					 and j.judgeUname=@judgeuname	 
					 and j.judgePword=@judgepass)
					 and ej.EventID=@eventid
					)
				,('0')
				)
					update e
				set e.IsFinalize = 1
				from [event] as e
				where e.eventid=@eventid


		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[KFspRemoveContsestantFromEvent]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspRemoveContsestantFromEvent]
(
	@fname							Varchar(50),
	@lname							Varchar(50),
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

			delete Contestant 
			where Contestant.PersonID= ((Select p.PersonID from Person as p
			wHERE P.FirstName =@fname
			and P.LastName = @lname
			
			))
			And Contestant.EventID = @_eventid

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[KFspUpdateContestant]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[KFspUpdateContestant]
(
	@fname						VarChar(50),
	@lname						varchar(50),
	@perid					int
)
as
Begin
	Begin TRY
		Begin Transaction

			Update P
			set P.FirstName = @fname,
			 P.LastName = @lname
			FROM person as p
			where p.PersonID = @perid


		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[KFspViewEventContestants]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspViewEventContestants]
(
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction
						 SELECT P.FirstName, P.LastName from 
					Person as P
				 full join Contestant as C
					on p.PersonID = C.PersonID
				WHERE 
				P.PersonID NOT IN
					(
					 select J.PersonID from 
						 EventJudges as EJ
					 full join Judge as j on
						j.JudgeID = ej.JudgeID
					 )	
				 and C.EventID = @_eventid

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End


GO
/****** Object:  StoredProcedure [dbo].[KFspViewNotEventContestants]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KFspViewNotEventContestants]
(
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction
		SELECT distinct p.FirstName,p.LastName,P.PersonID from 
					Person as P
				 full join Contestant as C --full join para kasama din yung wala pang contestant id
					on p.PersonID = C.PersonID
				WHERE 
				P.PersonID NOT IN
					(
					 select J.PersonID from 
						 EventJudges as EJ
					 full join Judge as j on
						j.JudgeID = ej.JudgeID
					 )	
				and P.PersonID not in
				(
				 SELECT P.PersonID from 
					Person as P
				 full join Contestant as C
					on p.PersonID = C.PersonID
					where c.EventID = @_eventid
				)
				-- SELECT  dISTINCT P.FirstName, P.LastName from 
				--	Person as P
				-- left join Contestant as C
				--	on P.PersonID = C.PersonID
				--WHERE 
				--	 P.PersonID Not in
				--		(
				--		--all judges account
				--		select DISTINCT j.PersonID from 
				--			 EventJudges as EJ
				--		 full join Judge as j on
				--			j.JudgeID = ej.JudgeID
				--		) 
				--	AND
				--		P.PersonID in
				--		(	--all Contestant Accounts
				--		SELECT DISTINCT P.PersonID 
				--			from Person as P
				--		full join Contestant as C on 
				--			p.PersonID = C.PersonID
				--		WHERE P.PersonID NOT IN(  
				--			select J.PersonID from 
				--				 EventJudges as EJ
				--			full join Judge as j on
				--				 j.JudgeID = ej.JudgeID)	
				--		)
				--	and 
				--		(EventID!=@_eventid or EventID is null)

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End


GO
/****** Object:  StoredProcedure [dbo].[MCspGetEventCriteriaID]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspGetEventCriteriaID]
	@Name			VARCHAR(50),
	@EventJudgeID		INT
AS
BEGIN

	SELECT EC.EventCriteriaID
	FROM EventCriteria AS EC
	INNER JOIN Criteria AS C
		ON EC.CriteriaID = C.CriteriaID
	INNER JOIN EventJudges AS EJ
		ON EJ.EventID = EC.EventID
	WHERE C.CriteriaName = @Name
		AND EJ.EventJudgesID = @EventJudgeID
END



GO
/****** Object:  StoredProcedure [dbo].[MCspUpdateScore]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspUpdateScore]
	@EventJudgeID			INT,
	@ContestantID			INT,
    @EventCriteriaID		INT,
	@Score					FLOAT
AS
BEGIN
	UPDATE Score
	SET Score = @Score
	WHERE ContestantID = @ContestantID AND EventCriteriaID = @EventCriteriaID AND EventJudgesID = @EventJudgeID
END



GO
/****** Object:  StoredProcedure [dbo].[MCspViewContestant]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewContestant]
	@ContestantID			INT
AS
BEGIN
	SELECT C.ContestantNumber, P.FirstName, P.LastName, P.PersonID
	FROM Contestant AS C
	INNER JOIN Person AS P
		ON P.PersonID = C.PersonID
	WHERE C.ContestantID = @ContestantID
END



GO
/****** Object:  StoredProcedure [dbo].[MCspViewContestants]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewContestants]
	@EventID			VARCHAR(50)
AS
BEGIN
	SELECT C.ContestantNumber, P.FirstName, P.LastName, P.PersonID, C.ContestantID
	FROM Contestant AS C
	INNER JOIN Person AS P
		ON P.PersonID = C.PersonID
	INNER JOIN [Event] AS E
		ON E.EventID = C.EventID
	WHERE E.EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[MCspViewContestantsEvent]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewContestantsEvent]
	@EventID		INT
AS
BEGIN
	SELECT 
		C.ContestantID, 
		P.FirstName + ' ' + P.LastName AS 'name',
		C.PersonID
	FROM Contestant AS C
	INNER JOIN Person AS P
		ON P.PersonID = C.PersonID
	WHERE C.EventID = @EventID
END


GO
/****** Object:  StoredProcedure [dbo].[MCspViewCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewCriteria]
	@EventJudgeID			INT
AS
BEGIN

	SELECT C.CriteriaName, EC.Weight, EC.EventCriteriaID
	FROM Criteria AS C
	INNER JOIN EventCriteria AS EC
		ON EC.CriteriaID = C.CriteriaID
	INNER JOIN EventJudges AS EJ
		ON EC.EventID = EJ.EventID
	WHERE EJ.EventJudgesID = @EventJudgeID
END



GO
/****** Object:  StoredProcedure [dbo].[MCspViewJudgeEvent]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewJudgeEvent]
(
	@EventName				VARCHAR(50),
	@JID					INT
)
AS
BEGIN
	SELECT EJ.EventJudgesID 
	FROM EventJudges AS EJ
		INNER JOIN [Event] AS E
			ON E.EventID = EJ.EventID
		INNER JOIN Judge AS J
			ON J.JudgeID = EJ.JudgeID
	WHERE E.EventName = @EventName
		AND J.JudgeID = @JID
END


GO
/****** Object:  StoredProcedure [dbo].[MCspViewJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATe PROCEDURE [dbo].[MCspViewJudges]
	@JudgeID			INT
AS
BEGIN
	SELECT P.FirstName, P.LastName
	FROM Judge AS J
	INNER JOIN Person AS P
		ON P.PersonID = J.PersonID
	WHERE J.JudgeID = @JudgeID
END



GO
/****** Object:  StoredProcedure [dbo].[MCspViewOfficialResults]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewOfficialResults]
	@EventID		INT
AS
BEGIN
	SELECT S.Score
	FROM Score AS S
	INNER JOIN EventJudges AS EJ
		ON S.EventJudgesID = EJ.EventJudgesID
	WHERE EJ.EventID = @EventID
END


GO
/****** Object:  StoredProcedure [dbo].[MCspViewScore]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewScore]
	@EventJudgeID			INT,
	@ContestantID			INT,
    @EventCriteriaID		INT
AS
BEGIN

	SELECT S.Score
	FROM Score AS S
	INNER JOIN EventJudges AS EJ
		ON S.EventJudgesID = EJ.EventJudgesID
	INNER JOIN Contestant AS C
		ON S.ContestantID = C.ContestantID
	INNER JOIN EventCriteria AS EC
		ON S.EventCriteriaID = EC.EventCriteriaID
	WHERE EJ.EventJudgesID = @EventJudgeID 
		AND C.ContestantID = @ContestantID
		AND EC.EventCriteriaID = @EventCriteriaID
END



GO
/****** Object:  StoredProcedure [dbo].[MCspViewScoreWeight]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewScoreWeight]
	@ContestantID		INT,
	@EventJudgesID			INT
AS
BEGIN
	SELECT 
		S.Score, 
		EC.[Weight]
	FROM Score AS S
	INNER JOIN EventCriteria AS EC
		ON S.EventCriteriaID = EC.EventCriteriaID
	WHERE S.ContestantID = @ContestantID
		AND S.EventJudgesID = @EventJudgesID
END


GO
/****** Object:  StoredProcedure [dbo].[MCspViewStatus]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MCspViewStatus]
	@EventName			VARCHAR(50),
	@JudgeID			INT,
	@ContestantID		INT
AS
BEGIN
	SELECT S.Score
	FROM Score AS S
	INNER JOIN EventJudges AS EJ
		ON S.EventJudgesID = EJ.EventJudgesID
	INNER JOIN [Event] AS E
		ON E.EventID = EJ.EventID
	INNER JOIN Judge AS J
		ON J.JudgeID = EJ.JudgeID
	WHERE S.ContestantID = @ContestantID
		AND J.JudgeID = @JudgeID
		AND E.EventName = @EventName
END



GO
/****** Object:  StoredProcedure [dbo].[spAddCriteriaToEventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spAddCriteriaToEventCriteria]
(
	@cname					Varchar(50),
	@weight					int,
	@_eventid				int
)
as
Begin
	Begin TRY
		Begin Transaction

		insert into [Criteria] (CriteriaName)
		values(@cname)

		insert into [EventCriteria](CriteriaID,EventID,[Weight])
		values
		(
		(select c.criteriaID from criteria as c where c.CriteriaName =@cname),
			@_eventid,
			@weight)


		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[spAddJudgeToEventJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spAddJudgeToEventJudges]
(
	@fname						Varchar(50),
	@lname						Varchar(50),
	@uname						VarChar(50),
	@pass						varchar(50),
	@eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

		
		Insert into [EventJudges] (EventID, JudgeID )
		values(@eventid,  (Select JudgeId from Judge as J
			INNER Join Person as P on
			P.PersonID = J.PersonID
			wHERE P.FirstName =@fname
			and P.LastName = @lname
			and J.judgeUname= @uname 
			and j.judgePword =@pass))

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[spAddOldCriteriaToEventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[spAddOldCriteriaToEventCriteria]
(
	@cname					Varchar(50),
	@weight					int,
	@_eventid				int
)
as
Begin
	Begin TRY
		Begin Transaction


		insert into [EventCriteria](CriteriaID,EventID,[Weight])
		values
		(
		(select c.criteriaID from criteria as c
		where c.CriteriaName =@cname),@_eventid,@weight
		)


		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[spAddPersonToEventJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[spAddPersonToEventJudges]
(
	@fname							Varchar(50),
	@lname							Varchar(50),
	@uname						VarChar(50),
	@pass						varchar(50),
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

		insert into [Person] (FirstName,LastName)
		values(@fname,@lname)
	

		Insert into [Judge] (judgeUname, judgePword, PersonID)
		values(@uname, @pass, (select p.PersonID from Person as p
			where p.FirstName = @fname AND p.LastName = @lname ))
		
		Insert into [EventJudges] (EventID, JudgeID )
		values(@_eventid,  (select j.JudgeID from Judge as j
					where j.judgeUname = @uname ))

		

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[spCheckCExistance]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[spCheckCExistance]
(
	@cname						VarChar(50),
	@_eventid					int

)
as
Begin
	Begin TRY
		Begin Transaction
		 
		Select c.CriteriaID from Criteria as c
		inner join EventCriteria as EC
		on EC.CriteriaID = C.CriteriaID
		where c.CriteriaName = @cname
				and ec.EventID = @_eventid


		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[spCheckcnameavailability]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spCheckcnameavailability]
(
	@cname						VarChar(50)

)
as
Begin
	Begin TRY
		Begin Transaction
		
		Select CriteriaID from Criteria
		where CriteriaName = @cname

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[spCheckPersonExistanceinEvent]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spCheckPersonExistanceinEvent]
(
	@fname							Varchar(50),
	@lname							Varchar(50),
	@uname						VarChar(50),
	@pass						varchar(50),
	@eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction
				select P.PersonID from Judge as J
				inner join EventJudges as Ej
				on ej.JudgeID = j.JudgeID
				inner join person as p
				on p.PersonID = j.PersonID
				where judgeUname = @uname
				and judgePword = @pass
				and ej.EventID = @eventid
				and p.FirstName = @fname
				and p.LastName = @lname
		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End




GO
/****** Object:  StoredProcedure [dbo].[spCheckUnameavailability]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spCheckUnameavailability]
(
	@judgechars						VarChar(50)

)
as
Begin
	Begin TRY
		Begin Transaction
		
		Select judgeUname from Judge
		where judgeUname = @judgechars

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End




GO
/****** Object:  StoredProcedure [dbo].[spgetEventjudgeID]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spgetEventjudgeID]
	@EventID			VARCHAR(50),
	@judgeid			VARCHAR(50)
AS
BEGIN
		select ej.EventJudgesID from EventJudges as ej
		inner join judge as j on j.JudgeID=ej.JudgeID
		inner join [event] as e on e.EventID = ej.EventID
		where e.EventID = @EventID and j.JudgeID=@judgeid
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveCriteriaFromEventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spRemoveCriteriaFromEventCriteria]
(
	@cname					Varchar(50),
	@_eventid				int
)
as
Begin
	Begin TRY
		Begin Transaction


		Delete from EventCriteria
		where 
			EventCriteria.CriteriaID = 	((select c.CriteriaID from criteria as c where c.CriteriaName =@cname)) 
		AND
			EventCriteria.EventID = @_eventid


		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End



GO
/****** Object:  StoredProcedure [dbo].[spRemoveJudgefromEventJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spRemoveJudgefromEventJudges]
(
	@fname						Varchar(50),
	@lname						Varchar(50),
	@uname						VarChar(50),
	@pass						varchar(50),
	@eventid					varchar(50)
)
as
Begin
	Begin TRY
		Begin Transaction


				delete Eventjudges 
			where JudgeID= ((Select JudgeId from Judge as J
			INNER Join Person as P on
			P.PersonID = J.PersonID
			wHERE P.FirstName =@fname
			and P.LastName = @lname
			and J.judgeUname= @uname 
			and j.judgePword =@pass))
			and EventID = @eventID

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spUpdateEventCriteria]
(
	@cname					Varchar(50),
	@weight					int,
	@_eventid				int,
	@critid					int
)
as
Begin
	Begin TRY
		Begin Transaction

			Update EC
			set EC.Weight = @weight
			from EventCriteria as EC
			where ec.EventID = @_eventid
			and ec.CriteriaID = @critid

			Update C
			set C.CriteriaName = @cname
			FROM Criteria as C
			where c.CriteriaID = @critid


		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[spUpdatePersonJudgeDetails]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[spUpdatePersonJudgeDetails]
(
	@personid					int,
	@fname						Varchar(50),
	@lname						Varchar(50),
	@uname						VarChar(50),
	@pass						varchar(50),
	@eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

			UPDATE P
			Set P.FirstName = @fname,
				P.LastName = @lname
			From PERSON As p
			WHERE p.PersonID = @personid;

			Update J
			set J.judgeUname = @uname,
				j.judgePword = @pass
			from Judge as J
			where J.PersonID = @personid

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[spViewCriteriaWithScore]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spViewCriteriaWithScore]
	@EventJudgeID			INT,
	@ConID					INT
AS
BEGIN

	
select cri.CriteriaName, EC.Weight, EC.EventCriteriaID ,s.Score from score as s
	inner join EventCriteria as ec on ec.EventCriteriaID = s.EventCriteriaID
	inner join contestant as c on c.ContestantID = s.ContestantID
	inner join EventJudges as ej on ej.EventJudgesID = s.EventJudgesID
	inner join criteria as cri on cri.CriteriaID = ec.CriteriaID
	WHERE EJ.EventJudgesID = @EventJudgeID and C.ContestantID = @ConID
END


GO
/****** Object:  StoredProcedure [dbo].[spViewEventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[spViewEventCriteria]
(
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

			   Select CriteriaName,Weight from [Criteria] as C
			   inner join EventCriteria as EC
			   on EC.CriteriaID = C.CriteriaID
			   where Ec.EventID = @_eventid

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End




GO
/****** Object:  StoredProcedure [dbo].[spViewEventJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spViewEventJudges]
(
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

			  Select P.FirstName,P.LastName,J.judgeUname,j.judgePword from Person as P
			  inner join Judge as J
				on J.PersonID = P.PersonID
			  Inner join EventJudges as EJ
			   on EJ.JudgeID = J.JudgeID
			   where EJ.EventID=@_eventid

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End




GO
/****** Object:  StoredProcedure [dbo].[spViewJudgeUsingJudgeID]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spViewJudgeUsingJudgeID]
(
	@JudgeID						int

)
as
Begin
	Begin TRY
		Begin Transaction
		
		select e.EventID,e.EventName ,p.FirstName, p.LastName,p.PersonID
		from judge as j 
		inner join person as p on p.PersonID = j.PersonID
		left join EventJudges as ej on ej.JudgeID=j.JudgeID 
		left join [Event] as e on e.EventID = ej.EventID
		where J.JudgeID = @JudgeID
		and e.EventID not in (
select eo.EventID from EventOrganizer as eo
inner join [Event] as e on eo.EventID = e.EventID
where e.IsFinalize='0' )

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[spViewNotEventCriteria]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spViewNotEventCriteria]
(
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

				 SELECT DISTINCT CriteriaName  from 
					Criteria as C 
				 full join EventCriteria as EC
					on c.CriteriaID = ec.CriteriaID
				WHERE c.CriteriaID NOT IN
				(
				 SELECT C.CriteriaID  from Criteria as C 
				 full join EventCriteria as EC
					on c.CriteriaID = ec.CriteriaID 
					where EC.EventID= @_eventid  -- <--INSERT HERE @_eventID 
				 ) or EC.EventID is null


		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End





GO
/****** Object:  StoredProcedure [dbo].[spViewNotEventJudges]    Script Date: 6/2/2018 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spViewNotEventJudges]
(
	@_eventid					int
)
as
Begin
	Begin TRY
		Begin Transaction

				 SELECT P.FirstName,P.LastName,J.judgeUname,j.judgePword from 
					Judge as J 
				 full join person as p
					on p.PersonID = j.PersonID
				WHERE 
				P.PersonID NOT IN
					(
					 select Distinct J.PersonID from 
						 EventJudges as EJ
					 full join Judge as j on
						j.JudgeID = ej.JudgeID
						where 
						EJ.EventID = @_eventid -- <--INSERT HERE @_eventID 
					 )	AND

				  p.PersonID in
					(
					select j.PersonID from Judge as j 
					
					)

		Commit Transaction
	End try
	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End


GO
USE [master]
GO
ALTER DATABASE [FakeJudge] SET  READ_WRITE 
GO
