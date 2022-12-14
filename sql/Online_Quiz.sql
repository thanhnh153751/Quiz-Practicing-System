CREATE DATABASE [Online_Quiz]
GO
USE [Online_Quiz]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17-May-22 3:27:27 PM ******/
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
	[status] [int] NOT NULL default 0,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NULL,
	[ques_id] [int] NULL,
	[answer] [nvarchar](1) NULL,
	[correct] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NULL,
	[description] [ntext] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[post_title] [nvarchar](1) NULL,
	[biref] [nvarchar](1) NULL,
	[details] [ntext] NULL,
	[author] [nvarchar](1) NULL,
	[update_date] [datetime] NULL,
	[contact] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Category]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NULL,
	[question_content] [nvarchar](1) NULL,
	[score] [int] NULL,
	[explantion] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lid] [int] NULL,
	[quiz_name] [nvarchar](1) NULL,
	[total_score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_take]    Script Date: 17-May-22 3:27:27 PM ******/
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
/****** Object:  Table [dbo].[quiz_take_details]    Script Date: 17-May-22 3:27:27 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Details]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Details](
	[aid] [int] NOT NULL,
	[rid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[aid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[thumbnail] [nvarchar](255) NULL,
	[title] [nvarchar](1) NULL,
	[tagline] [nvarchar](1) NULL,
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
/****** Object:  Table [dbo].[Subject_Category]    Script Date: 17-May-22 3:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Role_Details]  WITH CHECK ADD  CONSTRAINT [FK_Role_Details_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Role_Details] CHECK CONSTRAINT [FK_Role_Details_Account]
GO
ALTER TABLE [dbo].[Role_Details]  WITH CHECK ADD  CONSTRAINT [FK_Role_Details_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Role_Details] CHECK CONSTRAINT [FK_Role_Details_Role]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Subject_Category] FOREIGN KEY([cid])
REFERENCES [dbo].[Subject_Category] ([id])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Subject_Category]
GO

CREATE TABLE User_Permission(
	id int NOT NULL IDENTITY(1,1),
	account_id int,
	permission_id int,
	license nvarchar(255),
	PRIMARY KEY(account_id, permission_id)
)
GO
CREATE TABLE Permission(
	id int NOT NULL IDENTITY(1,1), 
	per_name nvarchar(255),
	PRIMARY KEY(id)
)
GO
CREATE TABLE [Action](
	id int NOT NULL IDENTITY(1,1), 
	action_name nvarchar(255),
	action_code nvarchar(255),
	PRIMARY KEY(id)
)
GO
CREATE TABLE Permission_Action(
	id int NOT NULL IDENTITY(1,1),
	permission_id int,
	action_id int,
	PRIMARY KEY(permission_id, action_id)
)
GO
CREATE TABLE Forgot_Password(
	id int NOT NULL IDENTITY(1,1),
	email nvarchar(255),
	token nvarchar(32),
	[status] bit,
	PRIMARY KEY(email, token)
)

CREATE TABLE Token_Management(
	id int NOT NULL IDENTITY(1,1),
	email nvarchar(255),
	token nvarchar(32),
	[status] bit,
	create_time bigint
	PRIMARY KEY(email,token, [status], create_time)
)