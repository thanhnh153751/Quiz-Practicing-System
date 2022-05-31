USE [master]
GO
/****** Object:  Database [Online_Quiz]    Script Date: 31-May-22 1:20:10 PM ******/
CREATE DATABASE [Online_Quiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_Quiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_Quiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_Quiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_Quiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Online_Quiz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Quiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Quiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Quiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Quiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Quiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Quiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Quiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_Quiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Quiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Quiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Quiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Quiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Quiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Quiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Quiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Quiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Online_Quiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Quiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Quiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Quiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Quiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Quiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Quiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Quiz] SET RECOVERY FULL 
GO
ALTER DATABASE [Online_Quiz] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Quiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Quiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Quiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Quiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_Quiz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_Quiz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Online_Quiz', N'ON'
GO
ALTER DATABASE [Online_Quiz] SET QUERY_STORE = OFF
GO
USE [Online_Quiz]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[gender] [bit] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_name] [nvarchar](255) NULL,
	[action_code] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NOT NULL,
	[ques_id] [int] NOT NULL,
	[answer] [nvarchar](255) NULL,
	[correct] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[description] [ntext] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[per_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission_Action]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Action](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[permission_id] [int] NOT NULL,
	[action_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC,
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[post_title] [nvarchar](255) NULL,
	[biref] [nvarchar](255) NULL,
	[details] [ntext] NULL,
	[author] [nvarchar](255) NULL,
	[update_date] [datetime] NULL,
	[contact] [nvarchar](255) NULL,
	[thumbnail] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Category]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NULL,
	[question_content] [nvarchar](255) NULL,
	[score] [int] NULL,
	[explantion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lid] [int] NULL,
	[quiz_name] [nvarchar](255) NULL,
	[total_score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_take]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_take](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NULL,
	[quiz_id] [int] NULL,
	[status] [int] NULL,
	[score] [int] NULL,
	[create_time] [datetime] NULL,
	[update_time] [datetime] NULL,
	[start_time] [datetime] NULL,
	[finish_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_take_details]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_take_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[take_id] [int] NULL,
	[ques_id] [int] NULL,
	[answer_id] [int] NULL,
	[create_time] [datetime] NULL,
	[update_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[thumbnail] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[tagline] [nvarchar](255) NULL,
	[origin_price] [money] NULL,
	[sale_price] [money] NULL,
	[contact] [nvarchar](255) NULL,
	[description] [ntext] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject_Category]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token_Management]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token_Management](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](32) NOT NULL,
	[status] [bit] NOT NULL,
	[create_time] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC,
	[token] ASC,
	[status] ASC,
	[create_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Permission]    Script Date: 31-May-22 1:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
	[license] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([ques_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Quiz]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Subject] FOREIGN KEY([sid])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Subject]
GO
ALTER TABLE [dbo].[Permission_Action]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Action_Action] FOREIGN KEY([action_id])
REFERENCES [dbo].[Action] ([id])
GO
ALTER TABLE [dbo].[Permission_Action] CHECK CONSTRAINT [FK_Permission_Action_Action]
GO
ALTER TABLE [dbo].[Permission_Action]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Action_Permission] FOREIGN KEY([permission_id])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[Permission_Action] CHECK CONSTRAINT [FK_Permission_Action_Permission]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Post_Category] FOREIGN KEY([cid])
REFERENCES [dbo].[Post_Category] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Post_Category]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Quiz]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Lesson] FOREIGN KEY([lid])
REFERENCES [dbo].[Lesson] ([id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Lesson]
GO
ALTER TABLE [dbo].[quiz_take]  WITH CHECK ADD  CONSTRAINT [FK_quiz_take_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[quiz_take] CHECK CONSTRAINT [FK_quiz_take_Account]
GO
ALTER TABLE [dbo].[quiz_take]  WITH CHECK ADD  CONSTRAINT [FK_quiz_take_Quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([id])
GO
ALTER TABLE [dbo].[quiz_take] CHECK CONSTRAINT [FK_quiz_take_Quiz]
GO
ALTER TABLE [dbo].[quiz_take_details]  WITH CHECK ADD  CONSTRAINT [FK_quiz_take_details_Answer] FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answer] ([id])
GO
ALTER TABLE [dbo].[quiz_take_details] CHECK CONSTRAINT [FK_quiz_take_details_Answer]
GO
ALTER TABLE [dbo].[quiz_take_details]  WITH CHECK ADD  CONSTRAINT [FK_quiz_take_details_quiz_take] FOREIGN KEY([take_id])
REFERENCES [dbo].[quiz_take] ([id])
GO
ALTER TABLE [dbo].[quiz_take_details] CHECK CONSTRAINT [FK_quiz_take_details_quiz_take]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Subject_Category] FOREIGN KEY([cid])
REFERENCES [dbo].[Subject_Category] ([id])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Subject_Category]
GO
ALTER TABLE [dbo].[User_Permission]  WITH CHECK ADD  CONSTRAINT [FK_User_Permission_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[User_Permission] CHECK CONSTRAINT [FK_User_Permission_Account]
GO
ALTER TABLE [dbo].[User_Permission]  WITH CHECK ADD  CONSTRAINT [FK_User_Permission_Permission] FOREIGN KEY([permission_id])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[User_Permission] CHECK CONSTRAINT [FK_User_Permission_Permission]
GO
USE [master]
GO
ALTER DATABASE [Online_Quiz] SET  READ_WRITE 
GO
