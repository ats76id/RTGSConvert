USE [DBSIK]
GO
/****** Object:  Table [dbo].[RTGS2SKNHistory]    Script Date: 11/14/2015 04:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTGS2SKNHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateProcess] [date] NOT NULL,
	[HRecordType] [varchar](1) NULL,
	[HMemberCode] [varchar](17) NULL,
	[HCreationDate] [varchar](8) NULL,
	[HSDD] [varchar](3) NULL,
	[HMM] [varchar](2) NULL,
	[HCCCC] [varchar](5) NULL,
	[HMessageType] [varchar](1) NULL,
	[HBatchType] [varchar](1) NULL,
	[HSessionNumber] [int] NULL,
	[RecordType] [varchar](1) NULL,
	[TransactionCode] [varchar](3) NULL,
	[FromMember] [varchar](17) NULL,
	[ToMember] [varchar](17) NULL,
	[ReceivingBank] [varchar](6) NULL,
	[TRN] [varchar](8) NULL,
	[relref] [varchar](16) NULL,
	[Amount] [varchar](17) NULL,
	[ValueDate] [varchar](8) NULL,
	[SenderRefNo] [varchar](16) NULL,
	[ReceiverRefNo] [varchar](16) NULL,
	[DealCode] [varchar](16) NULL,
	[ToAccountNumber] [varchar](24) NULL,
	[ToAccountName] [varchar](140) NULL,
	[FromAccountNumber] [varchar](24) NULL,
	[FromAccountName] [varchar](140) NULL,
	[PaymentDetails] [varchar](96) NULL,
	[MemberInfo] [varchar](96) NULL,
	[OriginatingName] [varchar](140) NULL,
	[UltimateBeneAccount] [varchar](24) NULL,
	[UltimateBeneName] [varchar](140) NULL,
	[Currency] [varchar](3) NULL,
	[ExchangeRate] [varchar](7) NULL,
	[Interest] [varchar](7) NULL,
	[Period] [varchar](2) NULL,
	[SAKTINumber] [varchar](20) NULL,
	[SeqNumber] [int] NULL,
	[MT] [varchar](3) NULL,
	[Status] [int] NULL,
	[Keterangan] [varchar](35) NULL,
	[FileName] [varchar](150) NULL,
	[CAmount] [money] NULL,
	[SandiKotaAsal] [varchar](4) NULL,
	[SandiCabang] [varchar](5) NULL,
	[ConvertType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REF_KONVERSI_TC]    Script Date: 11/14/2015 04:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF_KONVERSI_TC](
	[TC_LAMA] [varchar](10) NOT NULL,
	[TC_BARU] [varchar](10) NOT NULL,
 CONSTRAINT [PK_REF_KONVERSI_TC] PRIMARY KEY CLUSTERED 
(
	[TC_LAMA] ASC,
	[TC_BARU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
