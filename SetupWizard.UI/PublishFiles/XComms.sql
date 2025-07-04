USE [master]
GO
/****** Object:  Database [XComms]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE DATABASE [XComms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XComms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\XComms.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XComms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\XComms_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [XComms] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XComms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XComms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XComms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XComms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XComms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XComms] SET ARITHABORT OFF 
GO
ALTER DATABASE [XComms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XComms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XComms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XComms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XComms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XComms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XComms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XComms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XComms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XComms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XComms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XComms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XComms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XComms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XComms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XComms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XComms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XComms] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XComms] SET  MULTI_USER 
GO
ALTER DATABASE [XComms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XComms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XComms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XComms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XComms] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XComms] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'XComms', N'ON'
GO
ALTER DATABASE [XComms] SET QUERY_STORE = ON
GO
ALTER DATABASE [XComms] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [XComms]
GO
/****** Object:  User [Viral]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [Viral] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Sarita]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [Sarita] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Nitin]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [Nitin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Jitesh]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [Jitesh] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ChiragR]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [ChiragR] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ChiragP]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [ChiragP] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Ashok]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE USER [Ashok] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Viral]
GO
ALTER ROLE [db_owner] ADD MEMBER [Sarita]
GO
ALTER ROLE [db_owner] ADD MEMBER [Nitin]
GO
ALTER ROLE [db_owner] ADD MEMBER [Jitesh]
GO
ALTER ROLE [db_owner] ADD MEMBER [ChiragR]
GO
ALTER ROLE [db_owner] ADD MEMBER [ChiragP]
GO
ALTER ROLE [db_owner] ADD MEMBER [Ashok]
GO
/****** Object:  UserDefinedTableType [dbo].[ADGroupTableType]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE TYPE [dbo].[ADGroupTableType] AS TABLE(
	[Name] [nvarchar](250) NULL,
	[CustomerId] [int] NULL,
	[Id] [nvarchar](255) NULL,
	[Domain] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[GroupTableType]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE TYPE [dbo].[GroupTableType] AS TABLE(
	[Name] [nvarchar](250) NULL,
	[CustomerId] [int] NULL,
	[Id] [nvarchar](255) NULL,
	[Domain] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UserTableType]    Script Date: 6/3/2025 12:17:30 AM ******/
CREATE TYPE [dbo].[UserTableType] AS TABLE(
	[UserId] [int] NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[FName] [nvarchar](100) NULL,
	[SName] [nvarchar](100) NULL,
	[LoginName] [nvarchar](100) NULL,
	[Department] [nvarchar](100) NULL,
	[Domain] [nvarchar](100) NULL,
	[IsAdUser] [bit] NULL,
	[AdGuid] [nvarchar](255) NULL,
	[ParentCustID] [int] NULL,
	[GroupMemberIds] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[DaysInMonth]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DaysInMonth](@MonthsList varchar(500),@Year varchar(4))    
RETURNS @Results TABLE (Item DateTime)    
AS    
BEGIN    
    
  
  
INSERT INTO @Results  
  select * from (
SELECT Items=COnvert(Datetime,b.Items+'/'+S.Items+'/'+@Year)  
From dbo.Split('1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31',',') S ,  
 dbo.Split(@MonthsList,',') b  
WHERE Convert(int,S.Items) <= DATEDIFF(DD, Convert(datetime,b.Items+'/01/'+@Year), DATEADD(MM, 1, Convert(datetime,b.Items+'/01/'+@Year)))   
)a --where  Items=getdate() 
    
RETURN    
END    
  
  
GO
/****** Object:  UserDefinedFunction [dbo].[DistinctCommaSeperatedList]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DistinctCommaSeperatedList]
(
	@List VARCHAR(MAX),
	@Delim CHAR
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @ParsedList TABLE( Item VARCHAR(MAX));
	DECLARE @list1 VARCHAR(MAX), @Pos INT, @rList VARCHAR(MAX);
	SET @list = LTRIM(RTRIM(@list)) + @Delim;
	SET @pos = CHARINDEX(@delim, @list, 1);
	WHILE @pos > 0
	BEGIN
		SET @list1 = LTRIM(RTRIM(LEFT(@list, @pos - 1)))
		IF @list1 <> ''
			INSERT INTO @ParsedList VALUES (CAST(@list1 AS VARCHAR(MAX)))
		SET @list = SUBSTRING(@list, @pos+1, LEN(@list))
		SET @pos = CHARINDEX(@delim, @list, 1)
	END
	SELECT @rlist = COALESCE(@rlist+',','') + item
	FROM (SELECT DISTINCT Item FROM @ParsedList) t;
	RETURN @rList;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FileExists]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_FileExists](@path varchar(512))   
RETURNS BIT AS BEGIN        
DECLARE @result INT        
EXEC master.dbo.xp_fileexist @path, @result OUTPUT        
RETURN cast(@result as bit) END;  
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetUserIdByDeskbarId]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetUserIdByDeskbarId] 
(
	@deskbarId VARCHAR(MAX)
)
RETURNS INT
AS
BEGIN
	
	DECLARE @UserId int
	
		set @UserId=(Select id from Tbl_Users where deskbar_id=@deskbarId)

	RETURN @UserId

END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetUserNameFromId]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetUserNameFromId]
(
	@UserId int
)
RETURNS varchar(200)
AS
BEGIN
	
	DECLARE @username varchar(200);
	
	set @username=(select [name] from Tbl_Users where id=@UserId)

	RETURN @username

END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_LoadUnloadCharges_Ver1]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from dbo.[SplitWithSrNo]('yagnik,desai',',')
select * from [dbo].[GET_LoadUnloadCharges_Ver1] ('3','M','AMCHR','P','U','')
*/
CREATE FUNCTION [dbo].[GET_LoadUnloadCharges_Ver1]
(
@RateType varchar(20),
@LoadingBy varchar(200),
@BRCD varchar(50),
@contracttype varchar(10),
@Type varchar(10),
@vendorCode varchar(100)
)

RETURNS @Results TABLE (RateCharge decimal(18,3), MaxLimitCharge decimal(18,2),IsMonthly bit)
AS

    BEGIN
    
	DECLARE @Rate decimal(18,3)    	
	DECLARE @MaxLimit decimal(18,2)
	DECLARE @CNT INT
	DECLARE @IsMonthly BIT
	SET @IsMonthly=0
IF(@LoadingBy ='A' OR @LoadingBy = 'XX5')
BEGIN
	SET @LoadingBy = 'XX5'
END
IF(@LoadingBy ='B')
	BEGIN
		SET @Rate=0 SET @MaxLimit=0

	END

ELSE IF(@LoadingBy ='BP')
	BEGIN
		SET @Rate=0 SET @MaxLimit=0
	END	
ELSE IF(@LoadingBy = 'XX5' OR @LoadingBy = 'XX8')
	BEGIN
		SET	@CNT =(SELECT COUNT(*) FROM CYGNUS_HandlingCharge_Branch WITH(NOLOCK) WHERE VendorCode=@vendorCode AND IsMonthlyFixed=1 AND
			 LoadingBy =@LoadingBy AND RateType=@RateType AND Type=@Type AND BranchCode=@BRCD AND CheckCharge=0)	
		IF(@CNT > 0)
			BEGIN
					 SELECT @IsMonthly=IsMonthlyFixed,@Rate=0,@MaxLimit=ISNULL(MonthlyAmount,0) FROM CYGNUS_HandlingCharge_Branch WITH(NOLOCK)
				   	 WHERE LoadingBy =@LoadingBy AND RateType=@RateType AND Type=@Type AND VendorCode=@vendorCode AND
					 BranchCode=@BRCD AND CheckCharge=0
			END
		ELSE
			BEGIN
					--select @Rate=ISNULL(Rate,0),@MaxLimit=ISNULL(MaxAmount,0) from  CYGNUS_HandlingCharge_Branch
					SELECT @Rate=ISNULL((CASE WHEN ISNULL(ContractType,'')='' THEN MonthlyAmount ELSE Rate END),0)
					,@MaxLimit=ISNULL((CASE WHEN ISNULL(IsMonthlyFixed,0)=0 THEN NULL ELSE (CASE WHEN ISNULL(ContractType,'')='' THEN MonthlyAmount ELSE MaxAmount END) END),0)
					FROM  CYGNUS_HandlingCharge_Branch WITH(NOLOCK)
					WHERE LoadingBy =@LoadingBy AND RateType=@RateType AND  Type=@Type AND BranchCode=@BRCD AND CheckCharge=0 AND VendorCode=@vendorCode--and ContractType=@contracttype
			END
	END
ELSE
	BEGIN
		SELECT @Rate=ISNULL(Rate,0),@MaxLimit=ISNULL(MaxAmount,0) FROM CYGNUS_HandlingCharge_Branch WITH(NOLOCK)
		--where LoadingBy =@LoadingBy AND RateType=@RateType and left(ContractType,1)=@contracttype AND Type=@Type 
		WHERE LoadingBy =@LoadingBy AND RateType=@RateType AND ContractType=@contracttype AND Type=@Type 
		AND BranchCode=@BRCD AND CheckCharge=1

	END
				
	INSERT INTO @Results(RateCharge,MaxLimitCharge,IsMonthly) VALUES(@Rate,@MaxLimit,@IsMonthly)
			
    RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GETEBDOfDOcketForAutoBill]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
SELECT * FROM dbo.GETEBDOfDOcketForAutoBill('2017-09-29 17:00:24.117','2')
*/
CREATE FUNCTION [dbo].[GETEBDOfDOcketForAutoBill](@CurrentDate DATETIME,@DaysGap INT)    
RETURNS @Results TABLE (Item DATETIME)
AS
BEGIN
	DECLARE @nDays INT = 0
	SELECT @nDays = ISNULL(defaultvalue,0) FROM CYGNUS_rules_docket WHERE code='EDD_NDAYS'
	SELECT @DaysGap = @DaysGap+@nDays
	SELECT @CurrentDate = DATEADD(DAY,@DaysGap,@CurrentDate)
	DECLARE @holidayCount INT = 0
	SELECT @holidayCount = COUNT(*) FROM dbo.CYGNUS_master_holiday_datewise WITH(NOLOCK) WHERE MONTH(hday_date)=MONTH(@CurrentDate) AND DAY(hday_date)=DAY(@CurrentDate) AND YEAR(hday_date)=YEAR(@CurrentDate)

	IF(ISNULL(@holidayCount,0) = 0)
		BEGIN
			SELECT @holidayCount = COUNT(*) FROM dbo.CYGNUS_master_holiday_daywise WITH(NOLOCK)  WHERE UPPER(day_name)=UPPER(DATENAME(dw,@CurrentDate))		
		END
	IF(ISNULL(@holidayCount,0) > 0)
		BEGIN
			SELECT @CurrentDate = DATEADD(DAY,@holidayCount,@CurrentDate)
		END
	INSERT INTO @Results  
	SELECT * FROM (
	SELECT Items=@CurrentDate)A
RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[ListDaysInMonth]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ListDaysInMonth](@Date DateTime)
RETURNS @Results TABLE (Item DateTime)
AS
BEGIN

INSERT INTO @Results
SELECT COnvert(Datetime,Convert(Varchar,DatePart(Month,@Date))+'/'+Items+'/'+Convert(Varchar,DatePart(year,@Date)))
From dbo.Split('1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31',',') S
WHERE Convert(int,Items) <= DATEDIFF(DD, @Date, DATEADD(MM, 1, @Date))

RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[MySplit]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MySplit](@String varchar(8000), @Delimiter char(1))       
returns @temptable TABLE (items varchar(8000))       
as       
begin       
    declare @idx int       
    declare @slice varchar(8000)       
      
    select @idx = 1       
        if len(@String)<1 or @String is null  return       
      
    while @idx!= 0       
    begin       
        set @idx = charindex(@Delimiter,@String)       
        if @idx!=0       
            set @slice = left(@String,@idx - 1)       
        else       
            set @slice = @String       
          
        if(len(@slice)>0)  
            insert into @temptable(Items) values(@slice)       
  
        set @String = right(@String,len(@String) - @idx)       
        if len(@String) = 0 break       
    end   
return       
end

GO
/****** Object:  UserDefinedFunction [dbo].[MyTrim]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  User Defined Function dbo.MyTrim    Script Date: 6/20/2008 7:19:56 PM ******/
/****** Object:  User Defined Function dbo.MyTrim    Script Date: 2/14/2008 12:18:47 PM ******/

/****** Object:  User Defined Function dbo.MyTrim    Script Date: 11/28/2007 4:46:42 PM ******/


/****** Object:  User Defined Function dbo.MyTrim    Script Date: 3/3/2007 4:22:40 PM ******/

CREATE FUNCTION [dbo].[MyTrim] (@str varchar(1000))  
RETURNS varchar(1000) AS  
BEGIN 
  return ltrim(rtrim(@str))
END

GO
/****** Object:  UserDefinedFunction [dbo].[Split2]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split2](@String varchar(8000), @Delimiter char(1))
RETURNS @Results TABLE (Items varchar(8000))
AS


BEGIN
DECLARE @INDEX INT
DECLARE @SLICE varchar(8000)
-- HAVE TO SET TO 1 SO IT DOESNT EQUAL Z
-- ERO FIRST TIME IN LOOP
SELECT @INDEX = 1
-- following line added 10/06/04 as null
-- values cause issues
IF @String IS NULL RETURN
WHILE @INDEX !=0


BEGIN
-- GET THE INDEX OF THE FIRST OCCURENCE OF THE SPLIT CHARACTER
SELECT @INDEX = CHARINDEX(@Delimiter,@STRING)
-- NOW PUSH EVERYTHING TO THE LEFT OF IT INTO THE SLICE VARIABLE
IF @INDEX !=0
SELECT @SLICE = LEFT(@STRING,@INDEX - 1)
ELSE
SELECT @SLICE = @STRING
-- PUT THE ITEM INTO THE RESULTS SET
INSERT INTO @Results(Items) VALUES(@SLICE)
-- CHOP THE ITEM REMOVED OFF THE MAIN STRING
SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)
-- BREAK OUT IF WE ARE DONE
IF LEN(@STRING) = 0 BREAK
END
RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
 /****** Object:  User Defined Function dbo.Split    Script Date: 6/20/2008 7:19:56 PM ******/      
/****** Object:  User Defined Function dbo.Split    Script Date: 2/14/2008 12:18:47 PM ******/      
      
/****** Object:  User Defined Function dbo.Split    Script Date: 11/28/2007 4:46:42 PM ******/      
      
create FUNCTION [dbo].[SplitString](@String varchar(8000), @Delimiter varchar(50))      
RETURNS @Results  TABLE (Items varchar(8000))      
AS      
      

    BEGIN      
    DECLARE @INDEX INT      
    DECLARE @SLICE varchar(8000)      
    -- HAVE TO SET TO 1 SO IT DOESNT EQUAL Z      
    --     ERO FIRST TIME IN LOOP      
    SELECT @INDEX = 1      
    -- following line added 10/06/04 as null      
    --      values cause issues      
    IF @String IS NULL RETURN      
    WHILE @INDEX !=0      
        BEGIN       
         -- GET THE INDEX OF THE FIRST OCCURENCE OF THE SPLIT CHARACTER      
         SELECT @INDEX = CHARINDEX(@Delimiter,@STRING)      
         -- NOW PUSH EVERYTHING TO THE LEFT OF IT INTO THE SLICE VARIABLE      
         IF @INDEX !=0      
          SELECT @SLICE = LEFT(@STRING,@INDEX - 1)      
         ELSE      
          SELECT @SLICE = @STRING      
         -- PUT THE ITEM INTO THE RESULTS SET      
         INSERT INTO @Results(Items) VALUES(@SLICE)      
         -- CHOP THE ITEM REMOVED OFF THE MAIN STRING      
         SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)      
         -- BREAK OUT IF WE ARE DONE   
	   
		IF LEN(@STRING) = 0 BREAK      
    END      
	
    RETURN      
END 

--Replace(@Results,Right(@Delimiter,(len(@Delimiter) - 1)),'') 
GO
/****** Object:  UserDefinedFunction [dbo].[splitVer2]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION  [dbo].[splitVer2] 
(    
      @Input NVARCHAR(MAX),
      @Character CHAR(1)
)
RETURNS @Output TABLE (
      Item NVARCHAR(1000)
)
AS
BEGIN
      DECLARE @StartIndex INT, @EndIndex INT
 
      SET @StartIndex = 1
      IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
      BEGIN
            SET @Input = @Input + @Character
      END
 
      WHILE CHARINDEX(@Character, @Input) > 0
      BEGIN
            SET @EndIndex = CHARINDEX(@Character, @Input)
           
            INSERT INTO @Output(Item)
            SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
           
            SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
      END
 
      RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitWithSearch]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitWithSearch](@String varchar(8000), @Delimiter char(1), @SearchCond varchar(50))
RETURNS bit
AS


    BEGIN
    DECLARE @INDEX INT
	DECLARE @Result bit
    DECLARE @SLICE varchar(8000)
	SET @Result = 0
    -- HAVE TO SET TO 1 SO IT DOESNT EQUAL Z
    --     ERO FIRST TIME IN LOOP
    SELECT @INDEX = 1
    -- following line added 10/06/04 as null
    --      values cause issues
    IF @String IS NULL RETURN 0

    WHILE @INDEX !=0


        BEGIN	
        	-- GET THE INDEX OF THE FIRST OCCURENCE OF THE SPLIT CHARACTER
        	SELECT @INDEX = CHARINDEX(@Delimiter,@STRING)
        	-- NOW PUSH EVERYTHING TO THE LEFT OF IT INTO THE SLICE VARIABLE
        	IF @INDEX !=0
        		SELECT @SLICE = LEFT(@STRING,@INDEX - 1)
        	ELSE
        		SELECT @SLICE = @STRING
		
		IF Ltrim(Rtrim(@SLICE)) = Ltrim(Rtrim(@SearchCond))
			RETURN 1
		
        	-- PUT THE ITEM INTO THE RESULTS SET
        	--INSERT INTO @Results(Items) VALUES(@SLICE)
        	-- CHOP THE ITEM REMOVED OFF THE MAIN STRING
        	SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)
        	-- BREAK OUT IF WE ARE DONE
        	IF LEN(@STRING) = 0 BREAK
	END

	RETURN 0

END

GO
/****** Object:  UserDefinedFunction [dbo].[SplitWithSrNo]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitWithSrNo](@String varchar(8000), @Delimiter char(1))
RETURNS @Results TABLE (Srno int, Items varchar(8000))
AS


    BEGIN
    DECLARE @INDEX INT
    DECLARE @KOUNTER INT
    DECLARE @SLICE varchar(8000)
    -- HAVE TO SET TO 1 SO IT DOESNT EQUAL Z
    --     ERO FIRST TIME IN LOOP
    SELECT @INDEX = 1
    SELECT @KOUNTER = 0
    -- following line added 10/06/04 as null
    --      values cause issues
    IF @String IS NULL RETURN
    WHILE @INDEX !=0


        BEGIN	
		Set @KOUNTER = @KOUNTER + 1
        	-- GET THE INDEX OF THE FIRST OCCURENCE OF THE SPLIT CHARACTER
        	SELECT @INDEX = CHARINDEX(@Delimiter,@STRING)
        	-- NOW PUSH EVERYTHING TO THE LEFT OF IT INTO THE SLICE VARIABLE
        	IF @INDEX !=0
        		SELECT @SLICE = LEFT(@STRING,@INDEX - 1)
        	ELSE
        		SELECT @SLICE = @STRING
        	-- PUT THE ITEM INTO THE RESULTS SET
        	INSERT INTO @Results(SrNo,Items) VALUES(@KOUNTER,@SLICE)
        	-- CHOP THE ITEM REMOVED OFF THE MAIN STRING
        	SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)
        	-- BREAK OUT IF WE ARE DONE
        	IF LEN(@STRING) = 0 BREAK
    END
    RETURN
END

/****** Object:  UserDefinedFunction [dbo].[GetApplicableForChargeName]    Script Date: 05/28/2008 18:36:08 ******/
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON

GO
/****** Object:  UserDefinedFunction [dbo].[SplitWithXML]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitWithXML](@String varchar(8000), @Delimiter varchar(10))  
RETURNS @Results TABLE (Items varchar(MAX))  
AS  
BEGIN  
Declare @xml as xml  
SET @xml = cast(('<X>'+replace(@String,@Delimiter ,'</X><X>')+'</X>') as xml)  
  
INSERT INTO @Results SELECT N.value('.', 'varchar(MAX)') as Items FROM @xml.nodes('X') as T(N)  
RETURN  
END
GO
/****** Object:  UserDefinedFunction [dbo].[UFN_Get_Active_UsersFromGroup_SubGroup]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	SELECT DBO.UFN_Get_Active_UsersFromGroup_SubGroup('49')
*/
CREATE FUNCTION [dbo].[UFN_Get_Active_UsersFromGroup_SubGroup]
(
	@GroupId INT
) RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @ResultString VARCHAR(MAX) = '', @SubGroupID INT;

	/*----- Start : Get UserId From GroupId -----*/
	SELECT @ResultString = STRING_AGG(TUG.UserId, ',')
	FROM Tbl_Users_Group TUG WITH(NOLOCK) WHERE TUG.Group_HDR_Id = @GroupId AND TUG.IsActive = 1;
	/*----- End : Get UserId From GroupId -----*/


	/*----- Start : Get SubGroup ID From GroupId -----*/
	DECLARE db_cursor CURSOR FOR
		SELECT TUG.GroupId
		FROM Tbl_Users_Group TUG WITH(NOLOCK)
		WHERE TUG.Group_HDR_Id = @GroupID AND TUG.GroupId IS NOT NULL AND TUG.IsActive = 1;
	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @SubGroupID
	/*----- End : Get SubGroup ID From GroupId -----*/

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT DISTINCT @ResultString = @ResultString + ',' + dbo.UFN_Get_Active_UsersFromGroup_SubGroup(@SubGroupID);
		FETCH NEXT FROM db_cursor INTO @SubGroupID 
	END

	CLOSE db_cursor;
	DEALLOCATE db_cursor;

	RETURN @ResultString;
END
GO
/****** Object:  UserDefinedFunction [dbo].[UFN_GET_USERS_FROM_GROUP_SUBGROUP]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	SELECT DBO.UFN_GET_USERS_FROM_GROUP_SUBGROUP('46')
	SELECT DBO.UFN_GET_USERS_FROM_GROUP_SUBGROUP('49')
*/
CREATE FUNCTION [dbo].[UFN_GET_USERS_FROM_GROUP_SUBGROUP]
(
	@GroupId	int
) RETURNS VARCHAR(MAX)
AS
BEGIN
/*
	DECLARE @ResultString VARCHAR(MAX)='';
	DECLARE @SubGroupID INT;

	SELECT @ResultString = STRING_AGG(tug.UserId, ',')
	FROM Tbl_Users_Group tug WITH(NOLOCK)
	WHERE tug.Group_HDR_Id=@GroupID AND IsActive = 1;

	DECLARE db_cursor CURSOR FOR 
		SELECT tug.GroupId FROM Tbl_Users_Group tug WITH(NOLOCK)
		WHERE tug.Group_HDR_Id=@GroupID AND tug.GroupId IS NOT NULL and IsActive = 1
	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @SubGroupID  
	
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
			/* --SELECT @ResultString = @ResultString +',' + STRING_AGG(tug.UserId, ',')FROM Tbl_Users_Group tug
			--WHERE tug.Group_HDR_Id=@SubGroupID; */
	    SELECT @ResultString=@ResultString + ','+ dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(@SubGroupID);
		FETCH NEXT FROM db_cursor INTO @SubGroupID 
	END 

	CLOSE db_cursor  
	DEALLOCATE db_cursor 
	*/

	DECLARE @ResultString VARCHAR(MAX)='';
;With CTE 
AS
(   SELECT * 
	FROM Tbl_Users_Group tug WITH(NOLOCK)
	WHERE tug.Group_HDR_Id=@GroupId AND IsActive = 1 
    UNION ALL
    SELECT tug.* 
 FROM Tbl_Users_Group tug WITH(NOLOCK)
	 
    INNER JOIN 
        CTE c 
        ON c.GroupId=tug.Group_HDR_Id AND tug.IsActive = 1  --AND tug.UserId IS NULL--where o.ac_no=2 and o.grp_of=1
 )

select @ResultString = STRING_AGG(UserId, ',')
from 
(SELECT dISTINCT UserId FROM CTE WHERE GroupId IS NULL)a
 --SELECT @ResultString


 

	RETURN @ResultString;
END 

GO
/****** Object:  UserDefinedFunction [dbo].[ValidateURL]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ValidateURL](@URL VARCHAR(300))  
RETURNS BIT  
AS  
BEGIN   
 DECLARE @Object INT DECLARE @Return TINYINT   
 DECLARE @Valid BIT SET @Valid = 0   
 --default to false    
 --create the XMLHTTP object   
EXEC @Return = sp_oacreate 'MSXML2.ServerXMLHTTP.3.0', @Object OUTPUT   
IF @Return = 0   
BEGIN    
DECLARE @Method VARCHAR(350)    
--define setTimeouts method    
--Resolve, Connect, Send, Receive    
SET @Method = 'setTimeouts(45000, 45000, 45000, 45000)'    
--set the timeouts    
EXEC @Return = sp_oamethod @Object, @Method    
IF @Return = 0    
 BEGIN     
  --define open method     
  SET @Method = 'open("GET", "' + @URL + '", false)'      
  --Open the connection     
  EXEC @Return = sp_oamethod @Object, @Method    
 END     
   
IF @Return = 0   
 BEGIN     
  --SEND the request     
  EXEC @Return = sp_oamethod @Object, 'send()'    
 END     
   
IF @Return = 0    
BEGIN     
DECLARE @Output INT     
EXEC @Return = sp_oamethod @Object, 'status', @Output OUTPUT      
 IF @Output = 200     
  BEGIN      
  SET @Valid = 1     
  END    
 END   
END    
--destroy the object   
EXEC sp_oadestroy @Object   
RETURN (@Valid)  
END
GO
/****** Object:  Table [dbo].[tbl_Alert_popUp]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Alert_popUp](
	[AlertId] [int] IDENTITY(1,1) NOT NULL,
	[AlertTital] [varchar](max) NULL,
	[AlertBody] [varchar](max) NULL,
	[CriticalAlert] [bit] NULL,
	[AutoCloseIn] [bit] NULL,
	[AutoCloseInMin] [int] NULL,
	[ExpiresIn] [bit] NULL,
	[ExpiresTimeValue] [int] NULL,
	[ExpiresTimeType] [varchar](100) NULL,
	[TrayNotification] [bit] NULL,
	[AcknoledgrButton] [bit] NULL,
	[FullScreenAlert] [bit] NULL,
	[DesktopSizeWidth] [int] NULL,
	[DesktopSizeHeight] [int] NULL,
	[AlertPosition] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](100) NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[Iscancel] [bit] NULL,
	[Cancelby] [varchar](100) NULL,
	[CancelDate] [datetime] NULL,
	[ThemeId] [varchar](50) NULL,
	[AlertType] [varchar](20) NULL,
	[SRUsertpy] [bit] NULL,
	[SRGrouptyp] [bit] NULL,
	[JobName] [varchar](500) NULL,
	[isResize] [bit] NOT NULL,
	[Type] [varchar](20) NULL,
	[TickerSpeed] [varchar](20) NULL,
	[TickerPosition] [varchar](100) NULL,
	[AlertParentId] [int] NULL,
	[MessagingType] [nvarchar](100) NULL,
	[CustomerId] [int] NULL,
	[ScreenWaitMinutes] [int] NOT NULL,
	[DESCRIPTION] [varchar](max) NULL,
	[IsAlertStop] [bit] NOT NULL,
	[TotalRecepient] [int] NULL,
	[PendingRecepient] [int] NULL,
	[IsOnResumeDisplay] [bit] NOT NULL,
	[ShowQuizFinalScore] [bit] NOT NULL,
	[ShowQuizAnswerResult] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [varchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[ShortcutCreated] [bit] NULL,
	[ShortcutUpdatedTime] [datetime] NULL,
	[ShortcutCreatedUser] [varchar](255) NULL,
	[EmailSent] [bit] NULL,
	[TimeInterval] [int] NULL,
	[AcknowledgeButtonText] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Alert_Schedule_Setting]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Alert_Schedule_Setting](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[AlertId] [int] NULL,
	[SchedulePatternType] [varchar](50) NULL,
	[OnceStartDateTime] [datetime] NULL,
	[OnceEndDateTime] [datetime] NULL,
	[IsOnceReminder] [bit] NULL,
	[OnceReminderVal] [int] NULL,
	[DailyPatternVal] [varchar](50) NULL,
	[WeeklyVal] [varchar](50) NULL,
	[WeeklydaySunday] [bit] NULL,
	[WeeklydayMonday] [bit] NULL,
	[WeeklydayTuesday] [bit] NULL,
	[WeeklydayWednesday] [bit] NULL,
	[WeeklydayThursday] [bit] NULL,
	[WeeklydayFriday] [bit] NULL,
	[WeeklydaySaturday] [bit] NULL,
	[MonthDay] [varchar](50) NULL,
	[MonthVal] [varchar](50) NULL,
	[MonthlyType] [varchar](50) NULL,
	[WeekinMontly] [varchar](50) NULL,
	[DayinWeek] [varchar](50) NULL,
	[WeeklyMonthVal] [varchar](50) NULL,
	[YearlyType] [varchar](50) NULL,
	[YearlMonth] [varchar](50) NULL,
	[DayinWeekYearly] [varchar](20) NULL,
	[WeekinMontYearly] [varchar](20) NULL,
	[MonthsYearl] [varchar](20) NULL,
	[StartDateComman] [datetime] NULL,
	[CommanDateType] [varchar](20) NULL,
	[CommanOccurences] [int] NULL,
	[CommanEndBy] [varchar](200) NULL,
	[EntryBy] [varchar](100) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[IsProcessed] [bit] NULL,
	[ProcessedDay] [nvarchar](50) NULL,
	[EndCommanBy] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Send_Alert_User]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Send_Alert_User](
	[SAUseId] [int] IDENTITY(1,1) NOT NULL,
	[Alertid] [int] NULL,
	[UserId] [int] NULL,
	[GroupId] [int] NULL,
	[GroupName] [varchar](200) NULL,
	[UserName] [varchar](200) NULL,
	[UserType] [varchar](50) NULL,
	[IsAcknowledge] [bit] NOT NULL,
	[AcknowledgeDate] [datetime] NULL,
	[SentDate] [datetime] NULL,
	[IsReceived] [bit] NOT NULL,
	[ReceivedDate] [datetime] NULL,
	[IsCleared] [bit] NOT NULL,
	[ClearDate] [datetime] NULL,
	[Status] [varchar](100) NULL,
	[EntryBy] [varchar](100) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[ScheduleTime] [datetime] NULL,
	[ScheduleEndTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAlerts]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAlerts]
AS
SELECT        tap.AlertId, tap.AlertTital, tap.AlertBody, tap.AlertPosition, tap.EntryDate, tap.AlertType, tap.Type, tap.ScreenWaitMinutes, tss.SchedulePatternType, tss.OnceEndDateTime, tss.OnceStartDateTime, tsa.UserType, tsa.UserId, 
                         tsa.GroupId, tsa.GroupName, tap.IsOnResumeDisplay, tap.TimeInterval
FROM            dbo.tbl_Alert_popUp AS tap INNER JOIN
                         dbo.tbl_Send_Alert_User AS tsa ON tsa.Alertid = tap.AlertId INNER JOIN
                         dbo.tbl_Alert_Schedule_Setting AS tss ON tss.AlertId = tap.AlertId
WHERE        (ISNULL(tss.SchedulePatternType, '0') = '0') AND (tsa.EntryDate > DATEADD(MONTH, - 3, GETDATE())) OR
                         (tss.SchedulePatternType = '1')
GO
/****** Object:  Table [dbo].[Tbl_location]    Script Date: 6/3/2025 12:17:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_location](
	[Loc_Level] [numeric](3, 0) NULL,
	[Report_Level] [numeric](3, 0) NULL,
	[LocCode] [varchar](25) NOT NULL,
	[LocName] [varchar](100) NOT NULL,
	[Report_Loc] [varchar](25) NULL,
	[LocAddr] [varchar](500) NULL,
	[LocState] [varchar](50) NULL,
	[LocCity] [varchar](50) NULL,
	[LocPincode] [varchar](6) NULL,
	[LocSTDCode] [varchar](10) NULL,
	[LocTelno] [varchar](50) NULL,
	[LocFaxno] [varchar](50) NULL,
	[Locmobile] [varchar](15) NULL,
	[LocEmail] [varchar](50) NULL,
	[Loc_Account] [varchar](25) NULL,
	[ActiveFlag] [varchar](2) NULL,
	[Op_Bkg] [varchar](1) NULL,
	[Op_Dly] [varchar](1) NULL,
	[Op_Tranship] [varchar](1) NULL,
	[OutSource_Own] [varchar](1) NULL,
	[Octroi_IO] [varchar](1) NULL,
	[AirService] [varchar](1) NULL,
	[RailService] [varchar](1) NULL,
	[Default_NextLoc] [varchar](500) NULL,
	[Nearest_PrevLoc] [varchar](500) NULL,
	[CutOff_YN] [varchar](1) NULL,
	[Bkg_CutOffTime] [datetime] NULL,
	[DocketGen_Auto] [varchar](1) NULL,
	[LocAbbrev] [varchar](20) NULL,
	[LocRegion] [varchar](2) NULL,
	[OP_startdt] [datetime] NULL,
	[OP_enddt] [datetime] NULL,
	[Computerised] [varchar](1) NULL,
	[Dataentry] [varchar](500) NULL,
	[loc_startdt] [datetime] NULL,
	[loc_enddt] [datetime] NULL,
	[payment_type] [varchar](50) NULL,
	[delivery_type] [varchar](50) NULL,
	[UPDTBY] [varchar](100) NULL,
	[UPDTON] [datetime] NULL,
	[DKT_PFX] [varchar](25) NULL,
	[Mode_Surface] [varchar](1) NULL,
	[Mode_Sea] [varchar](1) NULL,
	[Pickup_Door] [varchar](1) NULL,
	[Pickup_Godown] [varchar](1) NULL,
	[BilledAt] [varchar](10) NULL,
	[Vol] [varchar](1) NULL,
	[COD_DOD] [varchar](1) NULL,
	[ODA] [varchar](1) NULL,
	[Octroi_Area] [varchar](10) NULL,
	[Dly_StartDt] [datetime] NULL,
	[Dly_EndDt] [datetime] NULL,
	[Transshipment_StartDt] [datetime] NULL,
	[Transshipment_EndDt] [datetime] NULL,
	[CPC] [varchar](5) NULL,
	[cn_prefixcode] [varchar](10) NULL,
	[OP_UGD] [varchar](1) NULL,
	[locid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Delivery_Control_Loc] [varchar](10) NULL,
	[BarcodeScanAllowed] [varchar](1) NOT NULL,
	[IsPeritNoReq] [bit] NOT NULL,
	[IsKeyNoReq] [bit] NOT NULL,
	[DRSMaxLimit] [decimal](18, 2) NULL,
	[DRSMinLimit] [decimal](18, 2) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[Comments] [varchar](2000) NULL,
	[CompanyCode] [varchar](max) NULL,
	[Category] [varchar](max) NULL,
	[BasedCurrency] [varchar](max) NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_Tbl_location] PRIMARY KEY CLUSTERED 
(
	[LocCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Locations]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vw_Locations]
As
/*
Select WMG.CodeDesc,WMLD.*
From
CYGNUS_Master_Location_Details WMLD
Inner Join
CYGNUS_Master_General WMG
On WMLD.LocCode = WMG.CodeID
Where WMG.StatusCode='Y'
*/
Select LocCode,CodeDesc = LocName,DataEntry From Tbl_Location Where ActiveFlag='Y'


GO
/****** Object:  View [dbo].[VW_Location]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VW_Location]  
as  
select distinct loccode,lcd='['+loccode+']'
,locname,Report_loc=(case when report_level='1' then loccode else Report_loc end)
,loc_level 
from Tbl_Location with(NOLOCK) 
where isnull(activeflag,'N')='Y' 
GO
/****** Object:  UserDefinedFunction [dbo].[ExplodeDates]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ExplodeDates](@startdate datetime, @enddate datetime)
returns table as
return (
with 
 N0 as (SELECT 1 as n UNION ALL SELECT 1)
,N1 as (SELECT 1 as n FROM N0 t1, N0 t2)
,N2 as (SELECT 1 as n FROM N1 t1, N1 t2)
,N3 as (SELECT 1 as n FROM N2 t1, N2 t2)
,N4 as (SELECT 1 as n FROM N3 t1, N3 t2)
,N5 as (SELECT 1 as n FROM N4 t1, N4 t2)
,N6 as (SELECT 1 as n FROM N5 t1, N5 t2)
,nums as (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as num FROM N6)
SELECT DATEADD(day,num-1,@startdate) as thedate
FROM nums
WHERE num <= DATEDIFF(day,@startdate,@enddate) + 1
)
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Split](@String varchar(8000), @Delimiter varchar(10))  
RETURNS TABLE WITH SCHEMABINDING 
AS
RETURN
  WITH E1(N)        AS ( SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),
       E2(N)        AS (SELECT 1 FROM E1 a, E1 b),
       E4(N)        AS (SELECT 1 FROM E2 a, E2 b),
       E42(N)       AS (SELECT 1 FROM E4 a, E2 b),
       cteTally(N)  AS (SELECT 0 UNION ALL SELECT TOP (DATALENGTH(ISNULL(@String,1))) 
                         ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM E42),
       cteStart(N1) AS (SELECT t.N+1 FROM cteTally t
                         WHERE (SUBSTRING(@String,t.N,1) = @Delimiter OR t.N = 0))
  SELECT Items = SUBSTRING(@String, s.N1, ISNULL(NULLIF(CHARINDEX(@Delimiter,@String,s.N1),0)-s.N1,8000))
  FROM cteStart s;
--RETURNS @Results TABLE (Items varchar(8000))  
--AS  
--BEGIN  
--Declare @xml as xml  
--SET @xml = cast(('<X>'+replace(@String,@Delimiter ,'</X><X>')+'</X>') as xml)  
  
--INSERT INTO @Results SELECT N.value('.', 'varchar(8000)') as Items FROM @xml.nodes('X') as T(N)  
--RETURN  
--END

GO
/****** Object:  UserDefinedFunction [dbo].[Split_V2]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Split_V2](@String varchar(8000), @Delimiter varchar(10))  
RETURNS TABLE WITH SCHEMABINDING 
AS
RETURN
  WITH E1(N)        AS ( SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),
       E2(N)        AS (SELECT 1 FROM E1 a, E1 b),
       E4(N)        AS (SELECT 1 FROM E2 a, E2 b),
       E42(N)       AS (SELECT 1 FROM E4 a, E2 b),
       cteTally(N)  AS (SELECT 0 UNION ALL SELECT TOP (DATALENGTH(ISNULL(@String,1))) 
                         ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM E42),
       cteStart(N1) AS (SELECT t.N+1 FROM cteTally t
                         WHERE (SUBSTRING(@String,t.N,1) = @Delimiter OR t.N = 0))
  SELECT Items = SUBSTRING(@String, s.N1, ISNULL(NULLIF(CHARINDEX(@Delimiter,@String,s.N1),0)-s.N1,8000))
  FROM cteStart s;
--RETURNS @Results TABLE (Items varchar(8000))  
--AS  
--BEGIN  
--Declare @xml as xml  
--SET @xml = cast(('<X>'+replace(@String,@Delimiter ,'</X><X>')+'</X>') as xml)  
  
--INSERT INTO @Results SELECT N.value('.', 'varchar(8000)') as Items FROM @xml.nodes('X') as T(N)  
--RETURN  
--END

GO
/****** Object:  UserDefinedFunction [dbo].[SplitXML]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitXML](@xml as xml)  
RETURNS TABLE  
AS  
RETURN
(
  SELECT N.value('.', 'varchar(8000)') as Items FROM @xml.nodes('X') as T(N)  
)

GO
/****** Object:  View [dbo].[vw_Get_Finacial_Years]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vw_Get_Finacial_Years]
As
Select U.* From
(
	Select (Case When Month(getdate())<4
            Then rtrim(ltrim(Cast(Year(getdate())-1 As Varchar))) + '-' +  rtrim(ltrim(Cast(Year(getdate()) As Varchar)))
            Else rtrim(ltrim(Cast(Year(getdate()) As Varchar))) + '-' +  rtrim(ltrim(Cast(Year(getdate()) + 1 As Varchar)))
       End 
       ) As FinYear , 'T' As CurrentFinYear, 
 (Case When Month(getdate())<4
            Then right(rtrim(ltrim(Cast(Year(getdate())-1 As Varchar))),2) + '_' + right(rtrim(ltrim(Cast(Year(getdate()) As Varchar))),2)
            Else right(rtrim(ltrim(Cast(Year(getdate()) As Varchar))),2) + '_' + right(rtrim(ltrim(Cast(Year(getdate()) + 1 As Varchar))),2)
       End 
       ) As YearVal

	   ,(Case When Month(getdate())<4 
            Then rtrim(ltrim(Cast(Year(getdate())-1 As Varchar)))
            Else rtrim(ltrim(Cast(Year(getdate()) As Varchar)))
       End 
       ) As FinYearFirst
     --YearVal=right(rtrim(ltrim(Cast(Year(getdate()-1) As Varchar))),2) + '_' + right(rtrim(ltrim(Cast(Year(getdate()) As Varchar))),2)
Union
Select (Case When Month(getdate())<4
            Then rtrim(ltrim(Cast(Year(getdate())-2 As Varchar))) + '-' +  rtrim(ltrim(Cast(Year(getdate())-1 As Varchar)))
            Else rtrim(ltrim(Cast(Year(getdate())-1 As Varchar))) + '-' +  rtrim(ltrim(Cast(Year(getdate()) As Varchar)))
       End 
       ) As FinYear , 'F' As CurrentFinYear, 
 (Case When Month(getdate())<4
            Then right(rtrim(ltrim(Cast(Year(getdate())-2 As Varchar))),2) + '_' + right(rtrim(ltrim(Cast(Year(getdate())-1 As Varchar))),2)
            Else right(rtrim(ltrim(Cast(Year(getdate())-1 As Varchar))),2) + '_' + right(rtrim(ltrim(Cast(Year(getdate()) As Varchar))),2)
       End 
       ) As YearVal

	   ,(Case When Month(getdate())<4
            Then rtrim(ltrim(Cast(Year(getdate())-2 As Varchar)))
            Else rtrim(ltrim(Cast(Year(getdate())-1 As Varchar)))
       End 
       ) As FinYearFirst
       --YearVal=right(rtrim(ltrim(Cast(Year(getdate())-2 As Varchar))),2) + '_' + right(rtrim(ltrim(Cast(Year(getdate()-1) As Varchar))),2)
)U

GO
/****** Object:  View [dbo].[VW_Hierarchy]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[VW_Hierarchy]
as 

select CodeId=1,CodeDesc='Head Office'
Union
select CodeId=2,CodeDesc='Zone'
Union
select CodeId=3,CodeDesc='Sub Zone'
Union
select CodeId=4,CodeDesc='Branch'


GO
/****** Object:  Table [dbo].[adsyncinfo]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adsyncinfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SysId] [nvarchar](50) NOT NULL,
	[SysTId] [nvarchar](50) NOT NULL,
	[STenant] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_adsyncinfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CYGNUS_Called_GCServices]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CYGNUS_Called_GCServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[String] [text] NULL,
	[ModuleName] [varchar](1000) NULL,
	[Succes] [bit] NOT NULL,
	[ErrorMessage] [varchar](max) NULL,
	[EntryDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CYGNUS_Master_General]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CYGNUS_Master_General](
	[CodeType] [varchar](50) NOT NULL,
	[CodeId] [varchar](60) NOT NULL,
	[CodeDesc] [varchar](1000) NULL,
	[CodeAccess] [char](1) NOT NULL,
	[StatusCode] [varchar](6) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[EntryBy] [varchar](50) NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[noofdigits] [numeric](18, 0) NULL,
	[noofchar] [numeric](18, 0) NULL,
	[codefor] [varchar](1000) NULL,
 CONSTRAINT [PK_CYGNUS_master_general] PRIMARY KEY CLUSTERED 
(
	[CodeType] ASC,
	[CodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CYGNUX_Master_Company]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CYGNUX_Master_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[CompanyCode] [nvarchar](5) NOT NULL,
	[CompanyName] [nvarchar](70) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Address] [varchar](250) NULL,
	[Contact_Person] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[BasedCountry] [varchar](50) NULL,
	[BasedCurrency] [varchar](50) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[Category] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcedureChanges]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureChanges](
	[EventDate] [datetime] NOT NULL,
	[EventType] [nvarchar](100) NULL,
	[EventDDL] [nvarchar](max) NULL,
	[DatabaseName] [nvarchar](255) NULL,
	[SchemaName] [nvarchar](255) NULL,
	[ObjectName] [nvarchar](255) NULL,
	[HostName] [nvarchar](255) NULL,
	[IPAddress] [varchar](32) NULL,
	[ProgramName] [nvarchar](255) NULL,
	[LoginName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AD_Sync_Detail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AD_Sync_Detail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AD_Header_Id] [int] NOT NULL,
	[UserName] [varchar](500) NOT NULL,
	[AD_GUID] [varchar](max) NULL,
	[Is_AD_User] [bit] NOT NULL,
	[Is_Sync] [bit] NOT NULL,
	[AD_ParentUser] [varchar](500) NULL,
	[EntryBy] [varchar](100) NULL,
	[EntryDate] [datetime] NOT NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[ParentOUGUID] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AD_Sync_Header]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AD_Sync_Header](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Domain] [varchar](max) NULL,
	[UserId] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[CustomerId] [int] NULL,
	[ADSyncName] [varchar](100) NULL,
	[IsAutoSync] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[EntryBy] [varchar](100) NULL,
	[EntryDate] [datetime] NOT NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[SaveDraftSyncDate] [datetime] NULL,
	[SubmitSyncDate] [datetime] NULL,
	[StopSyncDate] [datetime] NULL,
	[StopSyncBy] [varchar](50) NULL,
	[ADDeleteDate] [datetime] NULL,
	[ADDeleteBy] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AD_Sync_Schedule_Setting]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[AD_Header_Id] [int] NOT NULL,
	[ScheduleType] [varchar](100) NULL,
	[SyncStartDate] [datetime] NULL,
	[WeeklydaySunday] [bit] NOT NULL,
	[WeeklydayMonday] [bit] NOT NULL,
	[WeeklydayTuesday] [bit] NOT NULL,
	[WeeklydayWednesday] [bit] NOT NULL,
	[WeeklydayThursday] [bit] NOT NULL,
	[WeeklydayFriday] [bit] NOT NULL,
	[WeeklydaySaturday] [bit] NOT NULL,
	[CustomerId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NOT NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AD_SyncSave_Draft]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AD_SyncSave_Draft](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AD_Header_Id] [int] NOT NULL,
	[OUJsonString] [nvarchar](max) NULL,
	[GroupJsonString] [nvarchar](max) NULL,
	[SchedulerXML] [xml] NULL,
	[SchedulerJobName] [nvarchar](100) NULL,
	[JobCreateDate] [datetime] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Alert_Ticker_Default_Setting]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Alert_Ticker_Default_Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlertPosition] [varchar](50) NULL,
	[FullScreenAlert] [bit] NULL,
	[isResize] [bit] NOT NULL,
	[DesktopSizeWidth] [int] NULL,
	[DesktopSizeHeight] [int] NULL,
	[TickerPosition] [varchar](200) NULL,
	[TickerSpeed] [varchar](200) NULL,
	[CriticalAlert] [bit] NULL,
	[ExpiresIn] [bit] NULL,
	[ExpiresTimeValue] [int] NULL,
	[ExpiresTimeType] [varchar](100) NULL,
	[AutoCloseIn] [bit] NULL,
	[AutoCloseInMin] [int] NULL,
	[TrayNotification] [bit] NULL,
	[AcknoledgrButton] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](100) NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[ThemeId] [varchar](100) NULL,
	[ThemeIdTic] [varchar](100) NULL,
	[CoustomerId] [int] NULL,
	[Timeinterval] [int] NOT NULL,
	[ScreenWaitMinutes] [int] NOT NULL,
	[IsOnResumeDisplay] [bit] NOT NULL,
	[CompanyLogo] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Alerts]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Alerts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[alert_text] [nvarchar](max) NULL,
	[title] [nvarchar](255) NULL,
	[type] [varchar](1) NULL,
	[group_type] [varchar](1) NULL,
	[create_date] [datetime] NULL,
	[sent_date] [datetime] NULL,
	[type2] [varchar](1) NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[schedule] [varchar](1) NULL,
	[schedule_type] [varchar](1) NULL,
	[recurrence] [varchar](1) NULL,
	[urgent] [varchar](1) NULL,
	[toolbarmode] [varchar](1) NULL,
	[deskalertsmode] [varchar](1) NULL,
	[sender_id] [bigint] NULL,
	[template_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[aknown] [varchar](1) NULL,
	[ticker] [varchar](1) NULL,
	[ticker_speed] [varchar](1) NULL,
	[fullscreen] [varchar](1) NULL,
	[alert_width] [int] NULL,
	[alert_height] [int] NULL,
	[email_sender] [nvarchar](255) NULL,
	[email] [varchar](1) NULL,
	[sms] [varchar](1) NULL,
	[desktop] [varchar](1) NULL,
	[escalate] [varchar](1) NULL,
	[escalate_hours] [int] NULL,
	[escalate_count] [int] NULL,
	[escalate_step] [int] NULL,
	[escalate_hours_initial] [int] NULL,
	[autoclose] [bigint] NULL,
	[param_temp_id] [uniqueidentifier] NULL,
	[caption_id] [uniqueidentifier] NULL,
	[class] [bigint] NOT NULL,
	[parent_id] [bigint] NULL,
	[resizable] [bit] NULL,
	[post_to_blog] [bit] NULL,
	[social_media] [bit] NULL,
	[self_deletable] [bit] NULL,
	[text_to_call] [varchar](1) NULL,
	[campaign_id] [bigint] NOT NULL,
	[video] [bit] NOT NULL,
	[approve_status] [int] NULL,
	[reject_reason] [nvarchar](1000) NULL,
	[lifetime] [int] NULL,
	[terminated] [int] NULL,
	[color_code] [uniqueidentifier] NULL,
	[rss_allow_content] [int] NULL,
	[device] [int] NULL,
 CONSTRAINT [PK_alerts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Called_GCServices]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Called_GCServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[String] [text] NULL,
	[ModuleName] [varchar](1000) NULL,
	[Succes] [bit] NOT NULL,
	[ErrorMessage] [varchar](max) NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CYGNUS_Called_GCServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ContactSupport]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ContactSupport](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[CompanyEmail] [varchar](50) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[SupportType] [varchar](50) NOT NULL,
	[Remark] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerRegistration]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerRegistration](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[FullName] [varchar](50) NULL,
	[CompanyEmail] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[StartDate] [datetime] NULL,
	[ExpiresDate] [datetime] NULL,
	[Module] [varchar](500) NULL,
	[LicenseCount] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](50) NULL,
	[PurchasedTrial] [varchar](50) NULL,
	[AccessLevel] [int] NULL,
 CONSTRAINT [PK__tbl_Cust__A4AE64D86429133C] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EMPLOYEE_COMPANY_MAPPING]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EMPLOYEE_COMPANY_MAPPING](
	[SRNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[EMP_CODE] [varchar](50) NOT NULL,
	[COMPANY_LIST] [varchar](500) NOT NULL,
	[DEFAULT_COMPANY] [varchar](50) NOT NULL,
	[ACTIVEFLAG] [varchar](1) NOT NULL,
	[ENTRYBY] [varchar](50) NOT NULL,
	[ENTRYDT] [datetime] NOT NULL,
 CONSTRAINT [PK_Tbl_EMPLOYEE_COMPANY_MAPPING] PRIMARY KEY CLUSTERED 
(
	[EMP_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Groups]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[GroupType] [varchar](10) NULL,
	[CustomerId] [int] NULL,
	[Is_AD_Group] [bit] NOT NULL,
	[AD_GuId] [varchar](255) NULL,
	[AD_DomainName] [varchar](255) NULL,
	[IsADGroupSync] [bit] NOT NULL,
	[AD_Header_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Company]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[CompanyCode] [nvarchar](5) NOT NULL,
	[CompanyName] [nvarchar](70) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Address] [varchar](250) NULL,
	[Contact_Person] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[BasedCountry] [varchar](50) NULL,
	[BasedCurrency] [varchar](50) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[Category] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_General]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_General](
	[CodeType] [varchar](50) NOT NULL,
	[CodeId] [varchar](60) NOT NULL,
	[CodeDesc] [varchar](1000) NULL,
	[CodeAccess] [char](1) NOT NULL,
	[StatusCode] [varchar](6) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[EntryBy] [varchar](50) NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[noofdigits] [numeric](18, 0) NULL,
	[noofchar] [numeric](18, 0) NULL,
	[codefor] [varchar](1000) NULL,
	[CompanyCode] [varchar](50) NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_Tbl_Master_General] PRIMARY KEY CLUSTERED 
(
	[CodeType] ASC,
	[CodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Menu]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[ParentID] [int] NOT NULL,
	[DisplayRank] [int] NOT NULL,
	[NavigationURL] [varchar](500) NULL,
	[Action] [varchar](100) NULL,
	[Controller] [varchar](100) NULL,
	[Action1] [varchar](100) NULL,
	[Action2] [varchar](100) NULL,
	[Action3] [varchar](100) NULL,
	[MenuLevel] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[IsVertical] [bit] NULL,
	[IsUserAccess] [bit] NULL,
	[IsNewPortal] [bit] NOT NULL,
	[DomainId] [int] NULL,
	[MenuIcon] [varchar](100) NULL,
 CONSTRAINT [PK_Tbl_Master_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Menu_Access]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Menu_Access](
	[UserId] [varchar](50) NOT NULL,
	[MenuId] [int] NOT NULL,
	[HasAccess] [bit] NULL,
 CONSTRAINT [PK_CYGNUS_Master_Menu_Access] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Menu_Access_Edit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Menu_Access_Edit](
	[UserId] [varchar](50) NULL,
	[MenuId] [int] NULL,
	[HasAccess] [bit] NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Tenants]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Tenants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantPrefix] [varchar](5) NOT NULL,
	[TenantName] [nvarchar](45) NOT NULL,
	[isActive] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Tbl_Master_Tenants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Users]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](100) NOT NULL,
	[User_Type] [varchar](5) NOT NULL,
	[UserPwd] [varchar](500) NULL,
	[Name] [varchar](50) NOT NULL,
	[PasswordQues] [varchar](150) NULL,
	[PasswordAns] [varchar](150) NULL,
	[EmpId] [varchar](50) NULL,
	[ManagerId] [varchar](20) NULL,
	[EmailId] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](20) NULL,
	[ActiveTillDate] [datetime] NULL,
	[PwdLastChangeOn] [datetime] NULL,
	[LastPwd] [varchar](500) NULL,
	[Status] [varchar](5) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[EntryBy] [varchar](50) NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[mobileno] [varchar](15) NULL,
	[gender] [varchar](1) NULL,
	[resi_addr] [varchar](250) NULL,
	[DOB] [datetime] NOT NULL,
	[DOJ_ORG] [datetime] NULL,
	[ROLEID] [varchar](10) NULL,
	[IsPassEncrypted] [varchar](1) NULL,
	[IsPassReset] [varchar](1) NULL,
	[emptype] [varchar](1) NULL,
	[Name_Of_bank] [varchar](50) NULL,
	[Bank_AC_Number] [varchar](50) NULL,
	[IFSC_Code] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[COMMENTS] [varchar](max) NULL,
	[User_Image] [varchar](500) NULL,
	[FileName] [varchar](500) NULL,
	[Department] [varchar](50) NULL,
	[HOD] [varchar](50) NULL,
	[Grade] [varchar](50) NULL,
	[ConveyanceExpance] [decimal](18, 2) NULL,
	[LastLoginDate] [datetime] NULL,
	[IsPasswordExpired] [bit] NULL,
	[UpdateComments] [varchar](max) NULL,
	[Category] [varchar](50) NULL,
	[Read_Witre] [varchar](10) NULL,
	[PersonalEmail] [varchar](100) NULL,
	[BloodGroup] [varchar](50) NULL,
	[VoterID] [varchar](50) NULL,
	[PANNumber] [varchar](50) NULL,
	[AadharNumber] [varchar](50) NULL,
	[VoterID_Image] [nvarchar](max) NULL,
	[PAN_Image] [nvarchar](max) NULL,
	[Aadhar_Image] [nvarchar](max) NULL,
	[VoterIDContentType] [varchar](50) NULL,
	[PanContentType] [varchar](50) NULL,
	[AadharContentType] [varchar](50) NULL,
	[WeddingDate] [datetime] NULL,
	[Ratings] [int] NULL,
	[EduQualification] [varchar](50) NULL,
	[Edu_Image] [nvarchar](max) NULL,
	[EduContentType] [varchar](50) NULL,
	[ShowTBBCharges] [varchar](1) NOT NULL,
	[IsFOCDateAllow] [varchar](1) NULL,
	[Token] [varchar](max) NULL,
	[DeviceType] [varchar](10) NULL,
	[PasswordChangeRequired] [bit] NULL,
	[CompanyCode] [varchar](50) NULL,
	[TenantId] [int] NULL,
	[Accesslevel] [int] NULL,
	[BranchCode] [varchar](50) NULL,
	[Iscancel] [bit] NULL,
	[Cancelby] [varchar](50) NULL,
	[CancelDate] [datetime] NULL,
	[LastName] [varchar](500) NULL,
	[CustomerId] [int] NULL,
	[IsBlock] [int] NULL,
	[MFAEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_Master_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Master_Users_Edit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Master_Users_Edit](
	[UserId] [varchar](20) NOT NULL,
	[User_Type] [varchar](5) NOT NULL,
	[UserPwd] [varchar](500) NULL,
	[BranchCode] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PasswordQues] [varchar](150) NULL,
	[PasswordAns] [varchar](150) NULL,
	[EmpId] [varchar](25) NULL,
	[ManagerId] [varchar](20) NULL,
	[EmailId] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](20) NULL,
	[ActiveTillDate] [datetime] NULL,
	[PwdLastChangeOn] [datetime] NULL,
	[LastPwd] [varchar](500) NULL,
	[Status] [varchar](5) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[EntryBy] [varchar](50) NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[mobileno] [varchar](15) NULL,
	[gender] [varchar](1) NULL,
	[resi_addr] [varchar](250) NULL,
	[DOB] [datetime] NOT NULL,
	[DOJ_ORG] [datetime] NULL,
	[ROLEID] [varchar](10) NULL,
	[IsPassEncrypted] [varchar](1) NULL,
	[IsPassReset] [varchar](1) NULL,
	[emptype] [varchar](1) NULL,
	[Name_Of_bank] [varchar](50) NULL,
	[Bank_AC_Number] [varchar](50) NULL,
	[IFSC_Code] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[COMMENTS] [varchar](max) NULL,
	[User_Image] [varchar](500) NULL,
	[FileName] [varchar](500) NULL,
	[Department] [varchar](50) NULL,
	[HOD] [varchar](50) NULL,
	[Grade] [varchar](50) NULL,
	[ConveyanceExpance] [decimal](18, 2) NULL,
	[LastLoginDate] [datetime] NULL,
	[IsPasswordExpired] [bit] NULL,
	[UpdateComments] [varchar](max) NULL,
	[Category] [varchar](50) NULL,
	[Read_Witre] [varchar](10) NULL,
	[PersonalEmail] [varchar](100) NULL,
	[BloodGroup] [varchar](50) NULL,
	[VoterID] [varchar](50) NULL,
	[PANNumber] [varchar](50) NULL,
	[AadharNumber] [varchar](50) NULL,
	[VoterID_Image] [nvarchar](max) NULL,
	[PAN_Image] [nvarchar](max) NULL,
	[Aadhar_Image] [nvarchar](max) NULL,
	[VoterIDContentType] [varchar](50) NULL,
	[PanContentType] [varchar](50) NULL,
	[AadharContentType] [varchar](50) NULL,
	[WeddingDate] [datetime] NULL,
	[HistorySrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[HistoryBy] [varchar](50) NULL,
	[HistoryDate] [datetime] NULL,
	[Ratings] [int] NULL,
	[EduQualification] [varchar](50) NULL,
	[Edu_Image] [nvarchar](max) NULL,
	[EduContentType] [varchar](50) NULL,
	[ShowTBBCharges] [varchar](1) NULL,
	[IsFOCDateAllow] [varchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Organization_Details]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Organization_Details](
	[OrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [varchar](500) NULL,
	[Website] [varchar](500) NULL,
	[OrgEmailId] [varchar](200) NULL,
	[OrgContactNo] [varchar](20) NULL,
	[Country] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[PostCode] [varchar](50) NULL,
	[OrgAddress] [varchar](500) NULL,
	[UserName] [varchar](500) NULL,
	[UserMobileNo] [varchar](20) NULL,
	[UserEmailId] [varchar](200) NULL,
	[EntryBy] [varchar](200) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](200) NULL,
	[UpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[UniqueId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Permission]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](500) NOT NULL,
	[Administator] [bit] NULL,
	[ContentManager] [bit] NULL,
	[Custom] [bit] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[Iscancel] [bit] NULL,
	[Cancelby] [varchar](50) NULL,
	[CancelDate] [datetime] NULL,
	[PermissionType] [varchar](50) NULL,
	[CustomerId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PermissionSettings]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PermissionSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionId] [int] NOT NULL,
	[ToolList] [varchar](max) NULL,
	[IsEntireOrganization] [bit] NULL,
	[IsCoustomize] [bit] NULL,
	[UserList] [varchar](max) NULL,
	[Personal] [bit] NULL,
	[FullViewing] [bit] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_QuizAnswer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QuizAnswer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestId] [bigint] NOT NULL,
	[Answer] [varchar](max) NULL,
	[CorrectAnswer] [bit] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__tbl_Quiz__3214EC0778FB8A76] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_QuizQuestion]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QuizQuestion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuizId] [bigint] NOT NULL,
	[Question] [varchar](max) NULL,
	[QuestionType] [varchar](50) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__tbl_Quiz__3214EC079F77009F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Report_Style]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Report_Style](
	[BGCOLOR] [varchar](50) NULL,
	[BORDERCOLOR] [varchar](50) NULL,
	[BORDERSTYLE] [varchar](50) NULL,
	[BORDERWIDTH] [varchar](50) NULL,
	[FNTCOLOR] [varchar](50) NULL,
	[FNTSTYLE] [varchar](50) NULL,
	[FNTFAMILY] [varchar](50) NULL,
	[FNTSIZE] [varchar](50) NULL,
	[FNTWeight] [varchar](50) NULL,
	[FNTCOLOR_HD] [varchar](50) NULL,
	[FNTSTYLE_HD] [varchar](50) NULL,
	[FNTFAMILY_HD] [varchar](50) NULL,
	[FNTSIZE_HD] [varchar](50) NULL,
	[FNTWeight_HD] [varchar](50) NULL,
	[BlackFnt] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Send_Alert_Offline_user]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Send_Alert_Offline_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlertId] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[UserId] [varchar](max) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__tbl_Send__3214EC07268D0455] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Send_Alert_User_History]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Send_Alert_User_History](
	[Srno] [int] IDENTITY(1,1) NOT NULL,
	[SAUseId] [int] NULL,
	[Alertid] [int] NULL,
	[UserId] [int] NULL,
	[GroupId] [int] NULL,
	[GroupName] [varchar](200) NULL,
	[UserName] [varchar](200) NULL,
	[UserType] [varchar](50) NULL,
	[IsAcknowledge] [bit] NOT NULL,
	[AcknowledgeDate] [datetime] NULL,
	[SentDate] [datetime] NULL,
	[IsReceived] [bit] NOT NULL,
	[ReceivedDate] [datetime] NULL,
	[IsCleared] [bit] NOT NULL,
	[ClearDate] [datetime] NULL,
	[Status] [varchar](100) NULL,
	[EntryBy] [varchar](100) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[SavingDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Smtpconfiguratation]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Smtpconfiguratation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SmtpServer] [varchar](50) NULL,
	[SmtpPort] [varchar](50) NULL,
	[SmtpUserName] [varchar](50) NULL,
	[SmtpPassword] [varchar](50) NULL,
	[FromAddress] [varchar](50) NULL,
	[RecepientAddress] [varchar](50) NULL,
	[TLSSL] [bit] NULL,
	[SmtpSetting] [bit] NULL,
	[EmailSupport] [bit] NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK__tbl_Smtp__3214EC0731176208] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Template]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Template](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](max) NULL,
	[TemplateBody] [varchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[EntryBy] [varchar](100) NULL,
	[UpdateBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[Iscancel] [bit] NULL,
	[Cancelby] [varchar](100) NULL,
	[CancelDate] [datetime] NULL,
	[CudtomerId] [int] NULL,
	[TemplateTitle] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserQuizAnswer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserQuizAnswer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuizId] [bigint] NULL,
	[QuestId] [bigint] NULL,
	[CorrectAnswer] [varchar](50) NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [varchar](50) NULL,
	[DeskbarId] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Users]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[display_name] [nvarchar](255) NULL,
	[pass] [varchar](255) NULL,
	[deskbar_id] [varchar](255) NULL,
	[alert_id] [text] NULL,
	[last_date] [datetime] NULL,
	[role] [varchar](1) NULL,
	[group_id] [int] NULL,
	[last_rss] [text] NULL,
	[rss_url] [varchar](255) NULL,
	[last_broad] [text] NULL,
	[reg_date] [datetime] NULL,
	[last_request] [datetime] NULL,
	[next_request] [varchar](255) NULL,
	[last_standby_request] [datetime] NULL,
	[next_standby_request] [varchar](255) NULL,
	[mobile_phone] [varchar](50) NULL,
	[email] [nvarchar](255) NULL,
	[domain_id] [int] NULL,
	[context_id] [int] NULL,
	[standby] [int] NULL,
	[disabled] [int] NULL,
	[was_checked] [int] NULL,
	[rss_modify] [varchar](255) NULL,
	[rss_broad_modify] [varchar](255) NULL,
	[uhash] [varchar](255) NULL,
	[dis] [int] NULL,
	[update_date] [datetime] NULL,
	[expire_date] [datetime] NULL,
	[fname] [varchar](255) NULL,
	[sname] [varchar](255) NULL,
	[only_personal] [int] NULL,
	[only_templates] [int] NULL,
	[only_alerts] [int] NULL,
	[client_version] [varchar](255) NULL,
	[start_page] [varchar](255) NULL,
	[guide] [varchar](5) NULL,
	[dis_guide] [varchar](100) NULL,
	[send_logs] [int] NULL,
	[OrganizationSecretKey] [varchar](255) NULL,
	[PlayAlertSound] [bit] NULL,
	[Iscancel] [bit] NULL,
	[update_By] [varchar](500) NULL,
	[ParentCustID] [int] NULL,
	[Is_AD_User] [bit] NOT NULL,
	[AD_GuId] [varchar](255) NULL,
	[AD_DomainName] [varchar](255) NULL,
	[IsADSync] [bit] NOT NULL,
	[ParentUser] [varchar](max) NULL,
	[AD_Header_Id] [int] NULL,
	[Version] [nvarchar](50) NULL,
	[Department] [nvarchar](100) NULL,
	[offset] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Users_20210813]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Users_20210813](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[display_name] [nvarchar](255) NULL,
	[pass] [varchar](255) NULL,
	[deskbar_id] [varchar](255) NULL,
	[alert_id] [text] NULL,
	[last_date] [datetime] NULL,
	[role] [varchar](1) NULL,
	[group_id] [int] NULL,
	[last_rss] [text] NULL,
	[rss_url] [varchar](255) NULL,
	[last_broad] [text] NULL,
	[reg_date] [datetime] NULL,
	[last_request] [datetime] NULL,
	[next_request] [varchar](255) NULL,
	[last_standby_request] [datetime] NULL,
	[next_standby_request] [varchar](255) NULL,
	[mobile_phone] [varchar](50) NULL,
	[email] [nvarchar](255) NULL,
	[domain_id] [int] NULL,
	[context_id] [int] NULL,
	[standby] [int] NULL,
	[disabled] [int] NULL,
	[was_checked] [int] NULL,
	[rss_modify] [varchar](255) NULL,
	[rss_broad_modify] [varchar](255) NULL,
	[uhash] [varchar](255) NULL,
	[dis] [int] NULL,
	[update_date] [datetime] NULL,
	[expire_date] [datetime] NULL,
	[fname] [varchar](255) NULL,
	[sname] [varchar](255) NULL,
	[only_personal] [int] NULL,
	[only_templates] [int] NULL,
	[only_alerts] [int] NULL,
	[client_version] [varchar](255) NULL,
	[start_page] [varchar](255) NULL,
	[guide] [varchar](5) NULL,
	[dis_guide] [varchar](100) NULL,
	[send_logs] [int] NULL,
	[OrganizationSecretKey] [varchar](255) NULL,
	[PlayAlertSound] [bit] NULL,
	[Iscancel] [bit] NULL,
	[update_By] [varchar](500) NULL,
	[ParentCustID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Users_Group]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Users_Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_HDR_Id] [int] NULL,
	[UserId] [bigint] NULL,
	[GroupId] [int] NULL,
	[Type] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[EntryBy] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[Is_AD_User] [bit] NOT NULL,
	[AD_DomainName] [varchar](255) NULL,
	[IsADSync] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerPreferences]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerPreferences](
	[CustomerId] [int] NOT NULL,
	[UserId] [nchar](100) NOT NULL,
	[WallpaperFeatureEnabled] [bit] NOT NULL,
	[WallpaperLockFeatureEnabled] [bit] NOT NULL,
	[LockScreenFeatureEnabled] [bit] NOT NULL,
	[LockScreenLockFeatureEnabled] [bit] NOT NULL,
	[ScreenSaverFeatureEnabled] [bit] NOT NULL,
	[ScreenSaverLockFeatureEnabled] [bit] NOT NULL,
	[GlobalScreenSaverForAllUser] [bit] NOT NULL,
	[WallpaperSyncInterval] [int] NOT NULL,
	[AlertSyncInterval] [int] NOT NULL,
	[ShortcutSyncInterval] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AvailableVersion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCustomerPreferences] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShortcuts]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShortcuts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlertId] [int] NOT NULL,
	[AlertTitle] [varchar](500) NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_tblShortcuts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_Alert_popUp_AlertId]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Alert_popUp_AlertId] ON [dbo].[tbl_Alert_popUp]
(
	[AlertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Alert_popUp_AlertId_Type]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Alert_popUp_AlertId_Type] ON [dbo].[tbl_Alert_popUp]
(
	[AlertId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Alert_popUp_EntryBy]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Alert_popUp_EntryBy] ON [dbo].[tbl_Alert_popUp]
(
	[EntryBy] ASC
)
INCLUDE([Iscancel],[Type],[CustomerId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Alert_popUp_Type_AlertParentId_CustomerId]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Alert_popUp_Type_AlertParentId_CustomerId] ON [dbo].[tbl_Alert_popUp]
(
	[Type] ASC,
	[AlertParentId] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_Alert_Schedule_Setting_AlertId]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Alert_Schedule_Setting_AlertId] ON [dbo].[tbl_Alert_Schedule_Setting]
(
	[AlertId] ASC
)
INCLUDE([SchedulePatternType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Alert_Schedule_Setting_EntryBy]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Alert_Schedule_Setting_EntryBy] ON [dbo].[tbl_Alert_Schedule_Setting]
(
	[EntryBy] ASC
)
INCLUDE([AlertId],[SchedulePatternType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UID-CUSTID-NonClusteredIndex-20220405-143116]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [UID-CUSTID-NonClusteredIndex-20220405-143116] ON [dbo].[Tbl_Master_Users]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20220405-144054]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220405-144054] ON [dbo].[Tbl_Permission]
(
	[Id] ASC,
	[PermissionName] ASC,
	[Administator] ASC,
	[ContentManager] ASC,
	[PermissionType] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Send_Alert_User_Alertid_UserType]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Send_Alert_User_Alertid_UserType] ON [dbo].[tbl_Send_Alert_User]
(
	[Alertid] ASC,
	[UserType] ASC
)
INCLUDE([UserId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_Send_Alert_User_IsAcknowledge]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Send_Alert_User_IsAcknowledge] ON [dbo].[tbl_Send_Alert_User]
(
	[IsAcknowledge] ASC
)
INCLUDE([Alertid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_Send_Alert_User_IsReceived]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Send_Alert_User_IsReceived] ON [dbo].[tbl_Send_Alert_User]
(
	[IsReceived] ASC
)
INCLUDE([Alertid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Send_Alert_User_IsReceived_Status]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Send_Alert_User_IsReceived_Status] ON [dbo].[tbl_Send_Alert_User]
(
	[IsReceived] ASC,
	[Status] ASC
)
INCLUDE([SAUseId],[Alertid],[UserId],[EntryDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_Send_Alert_User_UserId_IsReceived_Status]    Script Date: 6/3/2025 12:17:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Send_Alert_User_UserId_IsReceived_Status] ON [dbo].[tbl_Send_Alert_User]
(
	[UserId] ASC,
	[IsReceived] ASC,
	[Status] ASC
)
INCLUDE([SAUseId],[Alertid],[EntryDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CYGNUS_Called_GCServices] ADD  CONSTRAINT [DF_CYGNUS_Called_GCServices_Succes]  DEFAULT ((0)) FOR [Succes]
GO
ALTER TABLE [dbo].[ProcedureChanges] ADD  DEFAULT (getdate()) FOR [EventDate]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Detail] ADD  DEFAULT ((0)) FOR [Is_AD_User]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Detail] ADD  DEFAULT ((0)) FOR [Is_Sync]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Detail] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Header] ADD  DEFAULT ((0)) FOR [IsAutoSync]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Header] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Header] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydaySunday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydayMonday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydayTuesday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydayWednesday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydayThursday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydayFriday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [WeeklydaySaturday]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [Iscancel]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [isResize]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [ScreenWaitMinutes]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [IsAlertStop]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [IsOnResumeDisplay]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [ShowQuizFinalScore]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [ShowQuizAnswerResult]
GO
ALTER TABLE [dbo].[tbl_Alert_popUp] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Alert_Ticker_Default_Setting] ADD  DEFAULT ((0)) FOR [Timeinterval]
GO
ALTER TABLE [dbo].[tbl_Alert_Ticker_Default_Setting] ADD  DEFAULT ((0)) FOR [ScreenWaitMinutes]
GO
ALTER TABLE [dbo].[tbl_Alert_Ticker_Default_Setting] ADD  DEFAULT ((0)) FOR [IsOnResumeDisplay]
GO
ALTER TABLE [dbo].[Tbl_Alerts] ADD  DEFAULT ((1)) FOR [class]
GO
ALTER TABLE [dbo].[Tbl_Alerts] ADD  DEFAULT ((-1)) FOR [campaign_id]
GO
ALTER TABLE [dbo].[Tbl_Alerts] ADD  DEFAULT ((0)) FOR [video]
GO
ALTER TABLE [dbo].[Tbl_Called_GCServices] ADD  CONSTRAINT [DF_Tbl_Called_GCServices_Succes]  DEFAULT ((0)) FOR [Succes]
GO
ALTER TABLE [dbo].[Tbl_ContactSupport] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_ContactSupport] ADD  DEFAULT ((0)) FOR [CustomerId]
GO
ALTER TABLE [dbo].[Tbl_ContactSupport] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Tbl_EMPLOYEE_COMPANY_MAPPING] ADD  CONSTRAINT [DF__Tbl_EMPL__ACTIV__5DC1991A]  DEFAULT ('Y') FOR [ACTIVEFLAG]
GO
ALTER TABLE [dbo].[Tbl_Groups] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Groups] ADD  DEFAULT ((0)) FOR [Is_AD_Group]
GO
ALTER TABLE [dbo].[Tbl_Groups] ADD  DEFAULT ((0)) FOR [IsADGroupSync]
GO
ALTER TABLE [dbo].[Tbl_location] ADD  CONSTRAINT [DF_Tbl_location_ActiveFlag]  DEFAULT ('Y') FOR [ActiveFlag]
GO
ALTER TABLE [dbo].[Tbl_location] ADD  CONSTRAINT [DF_Tbl_location_updton]  DEFAULT (getdate()) FOR [UPDTON]
GO
ALTER TABLE [dbo].[Tbl_location] ADD  CONSTRAINT [DF__Tbl_lo__Barco__46C859D2]  DEFAULT ('N') FOR [BarcodeScanAllowed]
GO
ALTER TABLE [dbo].[Tbl_location] ADD  CONSTRAINT [DF__Tbl_lo__IsPer__47BC7E0B]  DEFAULT ((0)) FOR [IsPeritNoReq]
GO
ALTER TABLE [dbo].[Tbl_location] ADD  CONSTRAINT [DF__Tbl_lo__IsKey__48B0A244]  DEFAULT ((0)) FOR [IsKeyNoReq]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF__Tbl_Ma__IsPas__2161CAF9]  DEFAULT ('N') FOR [IsPassReset]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF__Tbl_Ma__IsPas__2255EF32]  DEFAULT ((0)) FOR [IsPasswordExpired]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF__Tbl_Ma__Ratin__234A136B]  DEFAULT ((0)) FOR [Ratings]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF__Tbl_Ma__ShowT__243E37A4]  DEFAULT ('N') FOR [ShowTBBCharges]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF__Tbl_Ma__IsFOC__62121842]  DEFAULT ('N') FOR [IsFOCDateAllow]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF__Tbl_Maste__Iscan__38EE7070]  DEFAULT ((0)) FOR [Iscancel]
GO
ALTER TABLE [dbo].[Tbl_Master_Users] ADD  CONSTRAINT [DF_Tbl_Master_Users_MFAEnabled]  DEFAULT ((0)) FOR [MFAEnabled]
GO
ALTER TABLE [dbo].[Tbl_Master_Users_Edit] ADD  DEFAULT (getdate()) FOR [HistoryDate]
GO
ALTER TABLE [dbo].[Tbl_Permission] ADD  DEFAULT ((0)) FOR [Administator]
GO
ALTER TABLE [dbo].[Tbl_Permission] ADD  DEFAULT ((0)) FOR [ContentManager]
GO
ALTER TABLE [dbo].[Tbl_Permission] ADD  DEFAULT ((0)) FOR [Custom]
GO
ALTER TABLE [dbo].[Tbl_Permission] ADD  DEFAULT ((0)) FOR [Iscancel]
GO
ALTER TABLE [dbo].[Tbl_PermissionSettings] ADD  DEFAULT ((0)) FOR [IsEntireOrganization]
GO
ALTER TABLE [dbo].[Tbl_PermissionSettings] ADD  DEFAULT ((0)) FOR [IsCoustomize]
GO
ALTER TABLE [dbo].[Tbl_PermissionSettings] ADD  DEFAULT ((0)) FOR [Personal]
GO
ALTER TABLE [dbo].[Tbl_PermissionSettings] ADD  DEFAULT ((0)) FOR [FullViewing]
GO
ALTER TABLE [dbo].[tbl_Send_Alert_User] ADD  CONSTRAINT [DF__tbl_Send___IsAck__4C364F0E]  DEFAULT ((1)) FOR [IsAcknowledge]
GO
ALTER TABLE [dbo].[tbl_Send_Alert_User] ADD  CONSTRAINT [DF__tbl_Send___Ackno__4D2A7347]  DEFAULT (getdate()) FOR [AcknowledgeDate]
GO
ALTER TABLE [dbo].[tbl_Send_Alert_User] ADD  CONSTRAINT [DF_tbl_Send_Alert_User_IsReceived]  DEFAULT ((0)) FOR [IsReceived]
GO
ALTER TABLE [dbo].[tbl_Send_Alert_User] ADD  CONSTRAINT [DF_tbl_Send_Alert_User_IsCleared]  DEFAULT ((0)) FOR [IsCleared]
GO
ALTER TABLE [dbo].[tbl_Send_Alert_User_History] ADD  CONSTRAINT [DF_tbl_Send_Alert_User_History_SavingDate]  DEFAULT (getdate()) FOR [SavingDate]
GO
ALTER TABLE [dbo].[Tbl_Template] ADD  DEFAULT ((0)) FOR [Iscancel]
GO
ALTER TABLE [dbo].[Tbl_Users] ADD  DEFAULT ((0)) FOR [PlayAlertSound]
GO
ALTER TABLE [dbo].[Tbl_Users] ADD  DEFAULT ((0)) FOR [Is_AD_User]
GO
ALTER TABLE [dbo].[Tbl_Users] ADD  DEFAULT ((0)) FOR [IsADSync]
GO
ALTER TABLE [dbo].[Tbl_Users_Group] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Users_Group] ADD  DEFAULT ((0)) FOR [Is_AD_User]
GO
ALTER TABLE [dbo].[Tbl_Users_Group] ADD  DEFAULT ((0)) FOR [IsADSync]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_WallpaperFeatureEnabled]  DEFAULT ((1)) FOR [WallpaperFeatureEnabled]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_Table_1_WallpaperFeatureEnabled1]  DEFAULT ((1)) FOR [WallpaperLockFeatureEnabled]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_Table_1_WallpaperFeatureEnabled2]  DEFAULT ((1)) FOR [LockScreenFeatureEnabled]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_Table_1_WallpaperFeatureEnabled3]  DEFAULT ((1)) FOR [LockScreenLockFeatureEnabled]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_Table_1_WallpaperFeatureEnabled4]  DEFAULT ((1)) FOR [ScreenSaverFeatureEnabled]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_Table_1_WallpaperFeatureEnabled5]  DEFAULT ((1)) FOR [ScreenSaverLockFeatureEnabled]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_GlobalScreenSaverForAllUser]  DEFAULT ((0)) FOR [GlobalScreenSaverForAllUser]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_WallpaperSyncInterval]  DEFAULT ((60)) FOR [WallpaperSyncInterval]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_AlertSyncInterval]  DEFAULT ((30)) FOR [AlertSyncInterval]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_ShortcutSyncInterval]  DEFAULT ((300)) FOR [ShortcutSyncInterval]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCustomerPreferences] ADD  CONSTRAINT [DF_tblCustomerPreferences_AvailableVersion]  DEFAULT (N'1.0.0.0') FOR [AvailableVersion]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Detail]  WITH CHECK ADD FOREIGN KEY([AD_Header_Id])
REFERENCES [dbo].[Tbl_AD_Sync_Header] ([Id])
GO
ALTER TABLE [dbo].[Tbl_AD_Sync_Schedule_Setting]  WITH CHECK ADD FOREIGN KEY([AD_Header_Id])
REFERENCES [dbo].[Tbl_AD_Sync_Header] ([Id])
GO
ALTER TABLE [dbo].[Tbl_AD_SyncSave_Draft]  WITH CHECK ADD FOREIGN KEY([AD_Header_Id])
REFERENCES [dbo].[Tbl_AD_Sync_Header] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Groups]  WITH CHECK ADD FOREIGN KEY([AD_Header_Id])
REFERENCES [dbo].[Tbl_AD_Sync_Header] ([Id])
GO
ALTER TABLE [dbo].[tbl_QuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK__tbl_QuizA__Quest__78D3EB5B] FOREIGN KEY([QuestId])
REFERENCES [dbo].[tbl_QuizQuestion] ([Id])
GO
ALTER TABLE [dbo].[tbl_QuizAnswer] CHECK CONSTRAINT [FK__tbl_QuizA__Quest__78D3EB5B]
GO
ALTER TABLE [dbo].[Tbl_Users]  WITH CHECK ADD FOREIGN KEY([AD_Header_Id])
REFERENCES [dbo].[Tbl_AD_Sync_Header] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Users_Group]  WITH CHECK ADD FOREIGN KEY([Group_HDR_Id])
REFERENCES [dbo].[Tbl_Groups] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Users_Group]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Tbl_Groups] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Users_Group]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Users__UserI__17C286CF] FOREIGN KEY([UserId])
REFERENCES [dbo].[Tbl_Users] ([id])
GO
ALTER TABLE [dbo].[Tbl_Users_Group] CHECK CONSTRAINT [FK__Tbl_Users__UserI__17C286CF]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Alert_Auto_Schedule_list]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC Alert_Auto_Schedule_list '9488','3','0','43B7BCAD-7847-411B-B490-CFD75544E53B'
*/
CREATE PROCEDURE [dbo].[Alert_Auto_Schedule_list]
(
	@AlertId VARCHAR(50),
	@Type VARCHAR(10),
	@IsTickerAlert VARCHAR(10) = '',
	@DeskbarId VARCHAR(255) = ''
)
AS
BEGIN
	DECLARE @APIString VARCHAR(1000);	
	SET @APIString='https://tool.xcomms.com/Desktop/AlertautoSchedule?AlertId=' + @AlertId + '&Typ=' + @Type + '&IsTickerAlert=' + @IsTickerAlert + '&DeskbarId=' + @DeskbarId;
	PRINT @APIString;
	IF(ISNULL(@APIString,'') <> '')
	BEGIN
		DECLARE @Object AS INT;
		DECLARE @ResponseText AS VARCHAR(8000);
		EXEC sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
		EXEC sp_OAMethod @Object, 'open', NULL, 'post',@APIString,'false';
		EXEC sp_OAMethod @Object, 'setRequestHeader', NULL, 'Content-Type', 'application/json';
		EXEC sp_OAMethod @Object, 'send';
		EXEC sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT
		PRINT @ResponseText
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAlertUserCounts]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAlertUserCounts] (@AlertIds varchar(max))

AS

BEGIN	
	DECLARE @AlertId AS INT	
	DECLARE @UserIds AS Table(ID INT)
	DECLARE CUR_TEST CURSOR FOR 
    SELECT Value AS AlertId
    FROM STRING_SPLIT(@AlertIds, ',')
	DECLARE @AlertInfo AS Table(AlertId INT, TotalReceipent INT, TotalDelivered INT, DeliverPercentage INT,TotalNotDelivered INT, NotDeliverPercentage INT)
 
OPEN CUR_TEST 
FETCH NEXT FROM CUR_TEST INTO @AlertId 
 
WHILE @@FETCH_STATUS = 0 
BEGIN 
	delete from @UserIds 
	INSERT INTO @UserIds
	exec [dbo].[USP_GetAlertMembers] @AlertId
	
	DECLARE @totalUsers INT = (SELECT COUNT(DISTINCT ID) FROM @UserIds)
	DECLARE @totalDelivered INT = (SELECT COUNT(*) FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = @AlertId AND ISNULL(tsau.IsReceived, 0) = 1)
	DECLARE @notDelivered INT = @totalUsers-@totalDelivered
	
	INSERT INTO @AlertInfo
	SELECT @AlertId AS AlertId,
	@totalUsers AS TotalReceipent,
	@totalDelivered AS TotalDelivered,
	IIF(@totalUsers=0,0,(@totalDelivered *100)/@totalUsers) AS DeliverPercentage,
	@notDelivered AS TotalNotDelivered,
	IIF(@totalUsers=0,0,(@notDelivered*100)/@totalUsers) AS NotDeliveredPercentage

	FETCH NEXT FROM CUR_TEST INTO @AlertId
END;
CLOSE CUR_TEST
DEALLOCATE CUR_TEST
END;	

SELECT * FROM @AlertInfo
GO
/****** Object:  StoredProcedure [dbo].[SP_Z]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Z]
@Text Varchar(100),
@Type Char(2)='P'
As
Begin
	If @Type in ('U','S')
	Begin
		Select 'SELECT * FROM '+ Name,refdate From Sysobjects
		Where Name Like '%'+@Text+'%'
		And xtype = @Type
		Order by refdate DESC
	END
	
	If @Type in ('UA')
	Begin
		Select 'SELECT * FROM '+ Name,refdate From Sysobjects
		Where Name Like '%'+@Text+'%'
		And xtype = 'U'
		Order by refdate DESC,Name
	End

	If @Type in ('P','V','TR','FN','IF')
	Begin
		Select 'SP_HELPTEXT '+ Name,modify_date From Sys.objects
		Where Name Like '%'+@Text+'%'
		And type = @Type
		Order by modify_date DESC,Name
	End
End




GO
/****** Object:  StoredProcedure [dbo].[USP_AD_AutoSync_CreateSchedulerJob]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
=======================================================================
DESCRIPTION : Create New SQLJob for Auto Scheduler Sync Process
=======================================================================
EXEC USP_AD_AutoSync_CreateSchedulerJob '','',''
=======================================================================
*/
CREATE PROCEDURE [dbo].[USP_AD_AutoSync_CreateSchedulerJob]
(
	@AD_Header_Id INT,
	@CustomerId INT,
	@ADSyncScheduleXML XML
)
AS
BEGIN
	DECLARE @ReturnCode NVARCHAR(MAX), @SyncJobId UNIQUEIDENTIFIER, @SyncJobName NVARCHAR(200) = '';
	DECLARE @ScheduleType VARCHAR(100), @SyncStartDate DATETIME, @DeleteLevel INT = 0;
	DECLARE @Sunday BIT = 0, @Monday BIT = 0, @Tuesday BIT = 0, @Wednesday BIT = 0;
	DECLARE @Thursday BIT = 0, @Friday BIT = 0, @Saturday BIT = 0;
	DECLARE @dbname SYSNAME, @StringQuery VARCHAR(MAX) = '', @SchedulePatternType VARCHAR(100);
	DECLARE @Frequently INT, @FrequentlyInterval INT = 0, @FinalInterval INT;

	IF(@AD_Header_Id > 0)
	BEGIN
		SELECT
			@ScheduleType = DXML.ScheduleType,
			@SyncStartDate = DXML.SyncStartDate,
			@Sunday = DXML.WeeklydaySunday,
			@Monday = DXML.WeeklydayMonday,
			@Tuesday = DXML.WeeklydayTuesday,
			@Wednesday = DXML.WeeklydayWednesday,
			@Thursday = DXML.WeeklydayThursday,
			@Friday = DXML.WeeklydayFriday,
			@Saturday = DXML.WeeklydaySaturday
		FROM
		(
			SELECT
				A.H.value('AD_Header_Id[1]', 'INT') AS AD_Header_Id,
				A.H.value('ScheduleType[1]', 'VARCHAR(100)') AS ScheduleType,
				A.H.value('SyncStartDate[1]', 'DATETIME') AS SyncStartDate,
				A.H.value('WeeklydaySunday[1]', 'BIT') AS WeeklydaySunday,
				A.H.value('WeeklydayMonday[1]', 'BIT') AS WeeklydayMonday,
				A.H.value('WeeklydayTuesday[1]', 'BIT') AS WeeklydayTuesday,
				A.H.value('WeeklydayWednesday[1]', 'BIT') AS WeeklydayWednesday,
				A.H.value('WeeklydayThursday[1]', 'BIT') AS WeeklydayThursday,
				A.H.value('WeeklydayFriday[1]', 'BIT') AS WeeklydayFriday,
				A.H.value('WeeklydaySaturday[1]', 'BIT') AS WeeklydaySaturday,
				A.H.value('CustomerId[1]', 'INT') AS CustomerId
			FROM @ADSyncScheduleXML.nodes('/ADScheduleSetting') A (H)
		)DXML

		SET @SyncJobName = 'AD_AutoSchedulerSync_' + CONVERT(VARCHAR,@AD_Header_Id);

		UPDATE Tbl_AD_SyncSave_Draft
		SET
			SchedulerJobName = @SyncJobName,
			JobCreateDate = GETDATE()
		WHERE AD_Header_Id = @AD_Header_Id;

		IF(@ScheduleType = 'Weekly')
		BEGIN
        	SET @SchedulePatternType = 8;
			SET @Frequently = 1;

			IF(@Sunday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 1;
            END
			IF(@Monday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 2;
            END
			IF(@Tuesday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 4;
            END
			IF(@Wednesday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 8;
            END
			IF(@Thursday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 16;
            END
			IF(@Friday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 32;
            END
			IF(@Saturday = 1)
			BEGIN
            	SELECT @FrequentlyInterval = @FrequentlyInterval + 64;
            END

			SELECT @FinalInterval = @FrequentlyInterval;
        END

		DECLARE @StartDateint INT, @StartTimeint INT, @EndTimeint INT;
		SET @StartDateint = CAST(CONVERT(VARCHAR, @SyncStartDate, 112) AS INT);
		SET @StartTimeint = REPLACE(CONVERT(VARCHAR, @SyncStartDate,108),':','');
		SET @EndTimeint = REPLACE(CONVERT(VARCHAR, @SyncStartDate,108),':','');
		
		/*---------- Start : Create/Update Job Step 1 : General ----------*/
		EXEC @ReturnCode = msdb.dbo.sp_add_job
		@job_name = @SyncJobName,
		@enabled = 1,
		@description = N'Auto ActiveDirectory Scheduler For OU and Groups Users Sync Process',
		@category_name = '[Uncategorized (Local)]',
		@owner_login_name = 'sa',
		@notify_level_eventlog = 0,
		@notify_level_email = 2,
		@notify_level_netsend = 0,
		@notify_level_page = 0,
		@notify_email_operator_name = NULL,
		@delete_level = @DeleteLevel,
		@job_id = @SyncJobId OUTPUT

		EXEC @ReturnCode = msdb.dbo.sp_update_job
		@job_id = @SyncJobId,
		@start_step_id = 1
		/*---------- End : Create/Update Job Step 1 : General ----------*/


		/*---------- Start : Create Job Step 2 : Steps ----------*/
		SET @dbname = DB_NAME();
		SET @StringQuery = 'EXEC USP_Get_SyncDraftData_ForScheduler ''' + CAST(@AD_Header_Id AS VARCHAR) + ''',''' + CAST(@CustomerId AS VARCHAR) + ''' ';

		EXEC @ReturnCode = msdb.dbo.sp_add_jobstep
		@job_id = @SyncJobId,
		@step_id = 1,
		@step_name = 'Auto ActiveDirectory Schedule Sync Step',
		@subsystem = N'TSQL',
		@command = @StringQuery,
		@cmdexec_success_code = 0,
		@on_success_action = 1,
		@on_success_step_id = 0,
		@on_fail_action = 2,
		@on_fail_step_id = 0,
		@database_name = @dbname,
		@retry_attempts = 0,
		@retry_interval = 0,
		@os_run_priority = 0,
		@flags = 0
		/*---------- End : Create Job Step 2 : Steps ----------*/


		/*---------- Start : Create Job Step 3 : Schedules ----------*/
		EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule
		@job_id = @SyncJobId,
		@name = 'Auto ActiveDirectory Scheduler',
		@enabled = 1,
		@freq_type = @SchedulePatternType,
		@freq_interval = @FinalInterval,
		@freq_subday_type = 1,
		@freq_subday_interval = @Frequently,
		@freq_recurrence_factor = 1,
		@freq_relative_interval = 16,
		@active_start_date = @StartDateint,
		@active_end_date = 0,
		@active_start_time = @StartTimeint,
		@active_end_time = 0

		EXEC @ReturnCode = msdb.dbo.sp_add_jobserver
		@job_id = @SyncJobId,
		@server_name = N'(local)',
		@automatic_post = 1
		/*---------- End : Create Job Step 3 : Schedules ----------*/
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddEdit_Groups]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
=====================================================  
CREATED BY : CHIRAG RAMOLIYA  
CREATED DATE : 2021-05-18 16:44:14.083  
DESCRIPTION : CREATE NEW GROUP AND STORE DATA  
=====================================================  
ALTERED BY :   ALTERED DATE :   DESCRIPTION :   
=====================================================  
EXEC USP_AddEdit_Groups '','N','CYGNUSTEAM'  
=====================================================  
*/ CREATE PROCEDURE [dbo].[USP_AddEdit_Groups] (
@XmlDoc XML,
@XmlUserList XML,
@XmlNewGroupList XML,
@EditFlag VARCHAR(5),
@BaseUsername VARCHAR(50),
@CustomerId INT)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Status INT = 1
		   ,@Message VARCHAR(MAX) = ''
		   ,@MessageCode INT = 202;
	DECLARE @ID INT = 0
		   ,@GroupId INT
		   ,@Deskbar_Id UNIQUEIDENTIFIER;
	SET @Deskbar_Id = NEWID();
	SELECT
		@ID = X.Id
	FROM (SELECT
			A.H.value('Id[1]', 'INT') AS Id
		FROM @XmlDoc.nodes('/UsersGroupsViewModel/GM') A (H)) X
	BEGIN TRANSACTION
	BEGIN TRY
		IF (@ID > 0)
		BEGIN
			PRINT 'Modify';
			/*----- Start : Modify User Data -----*/
			UPDATE TG
			SET TG.GroupName = DXML.GroupName
			   ,TG.UpdateBy = @BaseUsername
			   ,TG.UpdateDate = GETDATE()
			FROM Tbl_Groups TG
			INNER JOIN (SELECT
					B.Id
				   ,B.GroupName
				   ,B.EditFlag
				FROM (SELECT
						A.H.value('Id[1]', 'INT') AS Id
					   ,A.H.value('GroupName[1]', 'VARCHAR(200)') AS GroupName
					   ,A.H.value('EditFlag[1]', 'BIT') AS [EditFlag]
					FROM @XmlDoc.nodes('/UsersGroupsViewModel/GM') A (H)) B) DXML
				ON DXML.Id = TG.Id
			WHERE TG.Id = DXML.Id;

			SELECT
				@GroupId = @ID;
		/*----- End : Modify User Data -----*/
		END
		ELSE
		BEGIN
			    /*----- Start : Store User Data -----*/
			INSERT INTO Tbl_Groups (GroupName, IsActive, EntryBy, EntryDate,CustomerId)
				SELECT
					DXML.GroupName
				   ,1
				   ,@BaseUsername
				   ,GETDATE()
				   ,@CustomerId
				FROM (SELECT
						A.H.value('Id[1]', 'INT') AS Id
					   ,A.H.value('GroupName[1]', 'VARCHAR(200)') AS GroupName
					   ,A.H.value('EditFlag[1]', 'BIT') AS [EditFlag]
					FROM @XmlDoc.nodes('/UsersGroupsViewModel/GM') A (H)) DXML
			SELECT
				@GroupId = SCOPE_IDENTITY();     /*----- End : Store User Data -----*/
		END  
		
		/*---------- Start : Store Group Users Data ----------*/
		INSERT INTO Tbl_Users_Group (Group_HDR_Id, UserId, Type, IsActive, EntryBy, EntryDate)
			SELECT
				@GroupId
			   ,DXML.UserId
			   ,'User'
			   ,DXML.IsChecked
			   ,@BaseUsername
			   ,GETDATE()
			FROM (SELECT
					B.H.value('ID[1]', 'INT') AS UserId
				   ,B.H.value('Name[1]', 'VARCHAR(200)') AS Name
				   ,B.H.value('DisplayName[1]', 'VARCHAR(200)') AS DisplayName
				   ,B.H.value('Email[1]', 'VARCHAR(200)') AS Email
				   ,B.H.value('IsChecked[1]', 'BIT') AS IsChecked
				FROM @XmlUserList.nodes('/ArrayOfUsersModel/UsersModel') B (H)) DXML
			OUTER APPLY (SELECT
					CNT = COUNT(*)
				FROM Tbl_Users_Group TUG
				WHERE TUG.Group_HDR_Id = @ID
				AND TUG.UserId = DXML.UserId
				AND TUG.Type = 'User') V
			WHERE V.CNT = 0;    /*---------- End : Store Group Users Data ----------*/        /*---------- Start : Store Group Member Data ----------*/

			PRINT 'Store'; 
		INSERT INTO Tbl_Users_Group (Group_HDR_Id, GroupId, Type, IsActive, EntryBy, EntryDate)
			SELECT
				@GroupId
			   ,DXML.GroupId
			   ,'Group'
			   ,DXML.IsChecked
			   ,@BaseUsername
			   ,GETDATE()
			FROM (SELECT
					B.H.value('Id[1]', 'INT') AS GroupId
				   ,B.H.value('GroupName[1]', 'VARCHAR(200)') AS GroupName
				   ,B.H.value('EntryBy[1]', 'VARCHAR(200)') AS EntryBy
				   ,B.H.value('IsChecked[1]', 'BIT') AS IsChecked
				FROM @XmlNewGroupList.nodes('/ArrayOfNewGroupModel/NewGroupModel') B (H)) DXML
			OUTER APPLY (SELECT
					CNT = COUNT(*)
				FROM Tbl_Users_Group TUG
				WHERE TUG.Group_HDR_Id = @ID
				AND TUG.GroupId = DXML.GroupId
				AND TUG.Type = 'Group') V
			WHERE V.CNT = 0;    /*---------- End : Store Group Member Data ----------*/      /*----- Start : Modify User Data -----*/
		UPDATE TUG
		SET TUG.IsActive = DXML.IsChecked
		   ,TUG.UpdateBy = @BaseUsername
		   ,TUG.UpdateDate = GETDATE()
		FROM Tbl_Users_Group TUG
		INNER JOIN (SELECT
				B.UserId
			   ,B.name
			   ,B.DisplayName
			   ,B.email
			   ,B.IsChecked
			FROM (SELECT
					B.H.value('ID[1]', 'INT') AS UserId
				   ,B.H.value('Name[1]', 'VARCHAR(200)') AS Name
				   ,B.H.value('DisplayName[1]', 'VARCHAR(200)') AS DisplayName
				   ,B.H.value('Email[1]', 'VARCHAR(200)') AS Email
				   ,B.H.value('IsChecked[1]', 'BIT') AS IsChecked
				FROM @XmlUserList.nodes('/ArrayOfUsersModel/UsersModel') B (H)) B) DXML
			ON DXML.UserId = TUG.UserId
		WHERE TUG.UserId = DXML.UserId
		AND TUG.Group_HDR_Id = @ID
		AND TUG.Type = 'User';    /*----- End : Modify User Data -----*/      /*----- Start : Modify Group Member Data -----*/
		UPDATE TUG
		SET TUG.IsActive = DXML.IsChecked
		   ,TUG.UpdateBy = @BaseUsername
		   ,TUG.UpdateDate = GETDATE()
		FROM Tbl_Users_Group TUG
		INNER JOIN (SELECT
				B.GroupId
			   ,B.GroupName
			   ,B.EntryBy
			   ,B.IsChecked
			FROM (SELECT
					B.H.value('Id[1]', 'INT') AS GroupId
				   ,B.H.value('GroupName[1]', 'VARCHAR(200)') AS GroupName
				   ,B.H.value('EntryBy[1]', 'VARCHAR(200)') AS EntryBy
				   ,B.H.value('IsChecked[1]', 'BIT') AS IsChecked
				FROM @XmlNewGroupList.nodes('/ArrayOfNewGroupModel/NewGroupModel') B (H)) B) DXML
			ON DXML.GroupId = TUG.GroupId
		WHERE TUG.GroupId = DXML.GroupId
		AND TUG.Group_HDR_Id = @ID
		AND TUG.Type = 'Group';    /*----- End : Modify Group Member Data -----*/
		SELECT
			@Message = 'Done'
		   ,@Status = 1
		   ,@MessageCode = 202;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT
			@Message = 'Not Done'
		   ,@Status = 0
		   ,@MessageCode = 201;
		ROLLBACK TRANSACTION
	END CATCH
	SELECT
		[Message] = @Message
	   ,[Status] = @Status
	   ,[MessageCode] = @MessageCode;
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddEdit_User]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
=====================================================    
CREATED BY : CHIRAG RAMOLIYA    
CREATED DATE : 2021-05-18 11:47:29.100    
DESCRIPTION : CREATE NEW USER AND STORE LOGIN DATA    
=====================================================    
ALTERED BY :     
ALTERED DATE :     
DESCRIPTION :     
=====================================================    
EXEC USP_Add_User '','N','CYGNUSTEAM'    
=====================================================    
*/
CREATE PROCEDURE [dbo].[USP_AddEdit_User] 
(@XmlDoc XML,
@EditFlag VARCHAR(5),
@BaseUsername VARCHAR(50))
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Status INT = 1
		   ,@Message VARCHAR(MAX) = ''
		   ,@MessageCode INT = 202;
	DECLARE @ID INT = 0
		   ,@Deskbar_Id UNIQUEIDENTIFIER;

	SELECT
		@ID = X.id
	   ,@Deskbar_Id = X.DeskbarId
	FROM (SELECT
			A.H.value('ID[1]', 'INT') AS Id
		   ,A.H.value('DeskbarId[1]', 'VARCHAR(200)') AS DeskbarId
		FROM @XmlDoc.nodes('/UsersModel') A (H)) X
	BEGIN TRANSACTION
	BEGIN TRY
		IF (@Deskbar_Id = CAST(0x0 AS UNIQUEIDENTIFIER))
		BEGIN
			SET @Deskbar_Id = NEWID()
		END
		IF (@ID > 0)
		BEGIN
			PRINT 'Modify';
			/*----- Start : Modify User Data -----*/
			UPDATE TU
			SET TU.name = DXML.name
			   ,TU.pass = DXML.password
			   ,TU.display_name = DXML.DisplayName
			   ,TU.email = DXML.email
			   ,TU.update_date = GETDATE()
			   ,TU.OrganizationSecretKey = DXML.OrganizationSecretKey
			   ,TU.PlayAlertSound = DXML.PlayAlertSound
			   ,TU.mobile_phone = DXML.mobile_phone
			   ,TU.ParentCustID = DXML.ParentCustID
			FROM Tbl_Users TU
			INNER JOIN (SELECT
					B.id
				   ,B.[name]
				   ,B.DisplayName
				   ,B.[password]
				   ,B.[email]
				   ,B.EditFlag
				   ,B.OrganizationSecretKey
				   ,B.PlayAlertSound
				   ,B.mobile_phone
				   ,B.ParentCustID
				FROM (SELECT
						A.H.value('ID[1]', 'INT') AS [ID]
					   ,A.H.value('Name[1]', 'VARCHAR(200)') AS [Name]
					   ,A.H.value('DisplayName[1]', 'VARCHAR(200)') AS [DisplayName]
					   ,A.H.value('Password[1]', 'VARCHAR(200)') AS [Password]
					   ,A.H.value('Email[1]', 'VARCHAR(200)') AS [Email]
					   ,A.H.value('EditFlag[1]', 'VARCHAR(10)') AS [EditFlag]
					   ,A.H.value('OrganizationSecretKey[1]', 'UNIQUEIDENTIFIER') AS [OrganizationSecretKey]
					   ,A.H.value('PlayAlertSound[1]', 'BIT') AS [PlayAlertSound]
					   ,A.H.value('mobile_phone[1]', 'VARCHAR(50)') AS [mobile_phone]
					   ,A.H.value('ParentCustID[1]', 'INT') AS [ParentCustID]
					FROM @XmlDoc.nodes('/UsersModel') A (H)) B) DXML
				ON DXML.id = TU.id
			WHERE TU.id = DXML.id;
		/*----- End : Modify User Data -----*/
		END
		ELSE
		BEGIN
			PRINT 'Store';
			/*----- Start : Store User Data -----*/
			INSERT INTO Tbl_Users (name, display_name, pass, deskbar_id, reg_date, email, OrganizationSecretKey, PlayAlertSound, mobile_phone, last_date, Iscancel, ParentCustID)
				SELECT
					DXML.[name]
				   ,DXML.DisplayName
				   ,DXML.[password]
				   ,@Deskbar_Id
				   ,GETDATE()
				   ,DXML.email
				   ,UPPER(DXML.OrganizationSecretKey)
				   ,DXML.PlayAlertSound
				   ,DXML.mobile_phone
				   ,GETDATE()
				   ,0
				   ,DXML.ParentCustID
				FROM (SELECT
						A.H.value('ID[1]', 'INT') AS [ID]
					   ,A.H.value('Name[1]', 'VARCHAR(200)') AS [Name]
					   ,A.H.value('DisplayName[1]', 'VARCHAR(200)') AS [DisplayName]
					   ,A.H.value('Password[1]', 'VARCHAR(200)') AS [Password]
					   ,A.H.value('Email[1]', 'VARCHAR(200)') AS [Email]
					   ,A.H.value('EditFlag[1]', 'VARCHAR(10)') AS [EditFlag]
					   ,A.H.value('OrganizationSecretKey[1]', 'UNIQUEIDENTIFIER') AS [OrganizationSecretKey]
					   ,A.H.value('PlayAlertSound[1]', 'BIT') AS [PlayAlertSound]
					   ,A.H.value('mobile_phone[1]', 'VARCHAR(50)') AS [mobile_phone]
					   ,A.H.value('ParentCustID[1]', 'INT') AS [ParentCustID]
					FROM @XmlDoc.nodes('/UsersModel') A (H)) DXML
		/*----- End : Store User Data -----*/
		END
		/*
		DECLARE @CustomerId VARCHAR(200) = ''
			   ,@NewCustomerId INT;

		SET @NewCustomerId = SCOPE_IDENTITY();

		SELECT
			@CustomerId = id
		FROM Tbl_Master_Users
		WHERE UserId = 'ERP SOLUTION'

		UPDATE Tbl_Users
		SET ParentCustID = @CustomerId
		WHERE id = @NewCustomerId
		*/
		SELECT
			@Message = 'Done'
		   ,@Status = 1
		   ,@MessageCode = 202;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT
			@Message = 'Not Done'
		   ,@Status = 0
		   ,@MessageCode = 201;
		ROLLBACK TRANSACTION
	END CATCH

	SELECT
		[Message] = @Message
	   ,[Status] = @Status
	   ,[MessageCode] = @MessageCode;
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddEdit_User_Bkp]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
=====================================================        
CREATED BY : CHIRAG RAMOLIYA        
CREATED DATE : 2021-05-18 11:47:29.100        
DESCRIPTION : CREATE NEW USER AND STORE LOGIN DATA        
=====================================================        
ALTERED BY :         
ALTERED DATE :         
DESCRIPTION :         
=====================================================        
EXEC USP_Add_User '','N','CYGNUSTEAM'        
=====================================================        
*/
CREATE PROCEDURE [dbo].[USP_AddEdit_User_Bkp] (@XmlDoc XML,
@EditFlag VARCHAR(5),
@BaseUsername VARCHAR(50))
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Status INT = 1
		   ,@Message VARCHAR(MAX) = ''
		   ,@MessageCode INT = 202;
	DECLARE @ID INT = 0
		   ,@Deskbar_Id UNIQUEIDENTIFIER;
	SET @Deskbar_Id = NEWID();

	SELECT
		@ID = X.id
	FROM (SELECT
			A.H.value('ID[1]', 'INT') AS id
		FROM @XmlDoc.nodes('/UsersModel') A (H)) X

	BEGIN TRANSACTION
	BEGIN TRY

		IF (@ID > 0)
		BEGIN
			PRINT 'Modify';
			/*----- Start : Modify User Data -----*/
			UPDATE TU
			SET TU.name = DXML.name
			   ,TU.pass = DXML.password
			   ,TU.display_name = DXML.DisplayName
			   ,TU.email = DXML.email
			   ,TU.update_date = GETDATE()
			   ,TU.OrganizationSecretKey = DXML.OrganizationSecretKey
			   ,TU.PlayAlertSound = DXML.PlayAlertSound
			   ,TU.mobile_phone = DXML.mobile_phone
			FROM Tbl_Users TU
			INNER JOIN (SELECT
					B.id
				   ,B.[name]
				   ,B.DisplayName
				   ,B.[password]
				   ,B.[email]
				   ,B.EditFlag
				   ,B.OrganizationSecretKey
				   ,B.PlayAlertSound
				   ,B.mobile_phone
				FROM (SELECT
						A.H.value('ID[1]', 'INT') AS [id]
					   ,A.H.value('Name[1]', 'VARCHAR(200)') AS [name]
					   ,A.H.value('DisplayName[1]', 'VARCHAR(200)') AS [DisplayName]
					   ,A.H.value('Password[1]', 'VARCHAR(200)') AS [password]
					   ,A.H.value('Email[1]', 'VARCHAR(200)') AS [email]
					   ,A.H.value('EditFlag[1]', 'VARCHAR(10)') AS [EditFlag]
					   ,A.H.value('OrganizationSecretKey[1]', 'UNIQUEIDENTIFIER') AS [OrganizationSecretKey]
					   ,A.H.value('PlayAlertSound[1]', 'BIT') AS [PlayAlertSound]
					   ,A.H.value('mobile_phone[1]', 'VARCHAR(50)') AS [mobile_phone]
					FROM @XmlDoc.nodes('/UsersModel') A (H)) B) DXML
				ON DXML.id = TU.id
			WHERE TU.id = DXML.id;
		/*----- End : Modify User Data -----*/
		END
		ELSE
		BEGIN
			PRINT 'Store';
			/*----- Start : Store User Data -----*/
			INSERT INTO Tbl_Users (name, display_name, pass,
			deskbar_id, reg_date, email, OrganizationSecretKey, PlayAlertSound, mobile_phone)
				SELECT
					DXML.[name]
				   ,DXML.DisplayName
				   ,DXML.[password]
				   ,@Deskbar_Id
				   ,GETDATE()
				   ,DXML.email
				   ,UPPER(DXML.OrganizationSecretKey)
				   ,DXML.PlayAlertSound
				   ,DXML.mobile_phone
				FROM (SELECT
						A.H.value('ID[1]', 'INT') AS [id]
					   ,A.H.value('Name[1]', 'VARCHAR(200)') AS [name]
					   ,A.H.value('DisplayName[1]', 'VARCHAR(200)') AS [DisplayName]
					   ,A.H.value('Password[1]', 'VARCHAR(200)') AS [password]
					   ,A.H.value('Email[1]', 'VARCHAR(200)') AS [email]
					   ,A.H.value('EditFlag[1]', 'VARCHAR(10)') AS [EditFlag]
					   ,A.H.value('OrganizationSecretKey[1]', 'UNIQUEIDENTIFIER') AS [OrganizationSecretKey]
					   ,A.H.value('PlayAlertSound[1]', 'BIT') AS [PlayAlertSound]
					   ,A.H.value('mobile_phone[1]', 'VARCHAR(50)') AS [mobile_phone]
					FROM @XmlDoc.nodes('/UsersModel') A (H)) DXML
		/*----- End : Store User Data -----*/
		END

		--DECLARE @CustomerId  VARCHAR(200) = '',@NewCustomerId INT;        

		--SET @NewCustomerId= SCOPE_IDENTITY();          

		--SELECT @CustomerId=id FROM Tbl_Master_Users WHERE UserId='ERP SOLUTION'      

		--UPDATE Tbl_Users SET ParentCustID=@CustomerId WHERE Id=@NewCustomerId      

		SELECT
			@Message = 'Done'
		   ,@Status = 1
		   ,@MessageCode = 202;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT
			@Message = 'Not Done'
		   ,@Status = 0
		   ,@MessageCode = 201;
		ROLLBACK TRANSACTION
	END CATCH

	SELECT
		[Message] = @Message
	   ,[Status] = @Status
	   ,[MessageCode] = @MessageCode;
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AddEdit_User_For_Customer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*        
=====================================================        
CREATED BY : CHIRAG RAMOLIYA        
CREATED DATE : 2021-05-18 11:47:29.100        
DESCRIPTION : CREATE NEW USER AND STORE LOGIN DATA        
=====================================================        
ALTERED BY :         
ALTERED DATE :         
DESCRIPTION :         
=====================================================        
EXEC USP_Add_User '','N','CYGNUSTEAM'        
=====================================================        
*/        
CREATE PROCEDURE [dbo].[USP_AddEdit_User_For_Customer]        
(        
 @XmlDoc XML,        
 @EditFlag VARCHAR(5),        
 @BaseUsername VARCHAR(50),  
 @BaseCustomerId INT  
)        
AS        
BEGIN        
 SET NOCOUNT ON;        
 DECLARE @Status INT = 1, @Message VARCHAR(MAX) = '', @MessageCode INT = 202;        
 DECLARE @ID INT = 0, @Deskbar_Id UNIQUEIDENTIFIER;        
 SET @Deskbar_Id = NEWID();        
        
 SELECT        
  @ID = X.ID        
 FROM        
 (        
  SELECT        
   A.H.value('ID[1]', 'INT') AS ID        
  FROM @XmlDoc.nodes('/UsersModel') A (H)        
 ) X        
        
 BEGIN TRANSACTION        
 BEGIN TRY        
        
  IF(@ID > 0)        
  BEGIN        
   PRINT 'Modify';        
   /*----- Start : Modify User Data -----*/        
   UPDATE TU        
   SET        
    TU.name = DXML.Name,        
    TU.pass = DXML.Password,        
    TU.display_name = DXML.DisplayName,        
    TU.email = DXML.Email,        
    TU.update_date = GETDATE(),        
    TU.OrganizationSecretKey = DXML.OrganizationSecretKey,        
    TU.PlayAlertSound = DXML.PlayAlertSound,    
 TU.mobile_phone=DXML.mobile_phone    
   FROM Tbl_Users TU        
   INNER JOIN        
   (        
    SELECT        
     B.ID, B.[Name], B.DisplayName,        
     B.[Password], B.[Email], B.EditFlag, B.OrganizationSecretKey,B.PlayAlertSound,    
  B.mobile_phone    
    FROM        
    (        
     SELECT        
      A.H.value('ID[1]', 'INT') AS [ID],        
      A.H.value('Name[1]', 'VARCHAR(200)') AS [Name],        
      A.H.value('DisplayName[1]', 'VARCHAR(200)') AS [DisplayName],        
      A.H.value('Password[1]', 'VARCHAR(200)') AS [Password],        
      A.H.value('Email[1]', 'VARCHAR(200)') AS [Email],        
      A.H.value('EditFlag[1]', 'VARCHAR(10)') AS [EditFlag],        
      A.H.value('OrganizationSecretKey[1]', 'UNIQUEIDENTIFIER') AS [OrganizationSecretKey],        
      A.H.value('PlayAlertSound[1]', 'BIT') AS [PlayAlertSound],    
   A.H.value('mobile_phone[1]','VARCHAR(50)')AS [mobile_phone]    
     FROM @XmlDoc.nodes('/UsersModel') A (H)        
    ) B        
   ) DXML        
   ON DXML.ID = TU.ID        
   WHERE TU.ID = DXML.ID;        
   /*----- End : Modify User Data -----*/        
  END        
  ELSE        
  BEGIN        
   PRINT 'Store';        
   /*----- Start : Store User Data -----*/        
   INSERT INTO Tbl_Users        
   (        
    name, display_name, pass,        
    deskbar_id, reg_date, email, OrganizationSecretKey, PlayAlertSound,mobile_phone        
   )        
   SELECT        
    DXML.[Name], DXML.DisplayName, DXML.[Password],        
    @Deskbar_Id , GETDATE(), DXML.email, UPPER(DXML.OrganizationSecretKey), DXML.PlayAlertSound,    
 DXML.mobile_phone    
   FROM        
   (        
    SELECT        
     A.H.value('ID[1]', 'INT') AS [ID],        
     A.H.value('Name[1]', 'VARCHAR(200)') AS [Name],        
     A.H.value('DisplayName[1]', 'VARCHAR(200)') AS [DisplayName],        
     A.H.value('Password[1]', 'VARCHAR(200)') AS [Password],        
     A.H.value('Email[1]', 'VARCHAR(200)') AS [Email],        
     A.H.value('EditFlag[1]', 'VARCHAR(10)') AS [EditFlag],        
     A.H.value('OrganizationSecretKey[1]', 'UNIQUEIDENTIFIER') AS [OrganizationSecretKey],        
     A.H.value('PlayAlertSound[1]', 'BIT') AS [PlayAlertSound],    
  A.H.value('mobile_phone[1]','VARCHAR(50)')AS [mobile_phone]    
    FROM @XmlDoc.nodes('/UsersModel') A (H)        
   ) DXML        
   /*----- End : Store User Data -----*/       
  END        
        
  DECLARE @CustomerId  VARCHAR(200) = '',@NewCustomerId INT;        
      
  SET @NewCustomerId= SCOPE_IDENTITY();          
      
  --SELECT @CustomerId=id FROM Tbl_Master_Users WHERE UserId='ERP SOLUTION'      
      
  UPDATE Tbl_Users SET ParentCustID=@BaseCustomerId WHERE Id=@NewCustomerId      
        
  SELECT @Message = 'Done', @Status = 1, @MessageCode = 202;        
  COMMIT TRANSACTION        
 END TRY        
 BEGIN CATCH        
  SELECT @Message = 'Not Done', @Status = 0, @MessageCode = 201;        
  ROLLBACK TRANSACTION        
 END CATCH        
        
 SELECT        
  [Message] = @Message, [Status] = @Status, [MessageCode] = @MessageCode;        
 SET NOCOUNT OFF;        
END 
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddScreenSaver]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_AddScreenSaver]
@Name VARCHAR(MAX),                
@ScreenSaverType VARCHAR(20),              
@ThemeId VARCHAR(200),              
@Sound BIT,              
@Timeinterval VARCHAR(20),              
@Description VARCHAR(MAX),                
@Type INT,                
@EntryBy VARCHAR(200),  
@TenantId INT,  
@VolumeSpeed VARCHAR(20),          
@Opacity VARCHAR(10),          
@SchedulePatternType varchar(20),            
@FromDate DATETIME,            
@EndDate DATETIME,
@ScreenWaitMinutes INT,
@IsOnResumeDisplay BIT
AS                
                
BEGIN TRANSACTION                
                       
DECLARE @Status INT, @Message VARCHAR(500) ,@AlertId INT                
SELECT @Message = 'Not Done',@Status = 0 ,@AlertId=0                
                
BEGIN                
	INSERT INTO tbl_Alert_popUp
	(
		AlertTital,ThemeId,AutoCloseInMin,TrayNotification,AlertPosition,
		AlertBody,Type,EntryBy,EntryDate,TickerSpeed,TickerPosition,CustomerId,
		ScreenWaitMinutes,IsOnResumeDisplay
	)
	VALUES
	(
		@Name,@ThemeId,@Timeinterval,@Sound,@ScreenSaverType,@Description,@Type,@EntryBy,
		GETDATE(),@VolumeSpeed,@Opacity,@TenantId, @ScreenWaitMinutes,@IsOnResumeDisplay
	)
                      
	SET @AlertId= SCOPE_IDENTITY();              
            
	IF(@SchedulePatternType ='1')            
	BEGIN            
		INSERT INTO tbl_Alert_Schedule_Setting (AlertId,SchedulePatternType,OnceStartDateTime,OnceEndDateTime,EntryBy,EntryDate)              
		VALUES(@AlertId,@SchedulePatternType,@FromDate,@EndDate,@EntryBy,GETDATE())

		EXEC Usp_Alert_Auto_Schedule  @AlertId,@Type        
	END 
	ELSE
	BEGIN 
	INSERT INTO tbl_Alert_Schedule_Setting (AlertId,EntryBy,EntryDate)              
	VALUES(@AlertId,@EntryBy,GETDATE())        
	      
	END
	SELECT @Status = 1, @Message = 'Done';
END                          
                
SELECT MESSAGE = @Message,STATUS = @Status,AlertId=@AlertId                          
                            
COMMIT TRANSACTION                             
                            
GOTO EndSave                              
QuitWithRollback:                              
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION                              
BEGIN                            
SELECT  MESSAGE = @Message,STATUS = @Status,AlertId=@AlertId                            
END                            
                            
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddWallPaper]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_AddWallPaper]                      
@AlertTital VARCHAR(MAX),                      
@DESCRIPTION VARCHAR(MAX)=NULL,                      
@ThemeId VARCHAR(MAX),                      
@AlertPosition VARCHAR(50),                    
@FromDate DATETIME,                    
@EndDate DATETIME,                    
@Second INT,                    
@Title VARCHAR(MAX),                    
@SchedulePatternType VARCHAR(20),                    
@EntryBy VARCHAR(255),                    
@Type INT,                  
@Opacity VARCHAR(10),          
@CustomerId INT,        
@Function varchar(20),        
@Id int,        
@TimeInterval int,        
@ScheduleId int        
                  
AS                            
BEGIN        
        
 TRANSACTION                        
                       
DECLARE @Status INT, @Message VARCHAR(500) ,@AlertId INT                      
SELECT  @Message = 'Not Done',@Status = 0 ,@AlertId=0                        
                  
BEGIN           
IF(@Function='A' OR @Function='C')        
BEGIN        
 INSERT INTO tbl_Alert_popUp (AlertTital,AlertBody,ThemeId,AlertPosition,Type,AlertType,EntryBy,EntryDate,TickerPosition,CustomerId,DESCRIPTION,TimeInterval)                      
 VALUES(@AlertTital,@Title,@ThemeId,@AlertPosition,@Type,'BC',@EntryBy,GETDATE(),@Opacity,@CustomerId,@DESCRIPTION,@TimeInterval)                      
        
                      
 SET @AlertId= SCOPE_IDENTITY();                      
                    
 IF(@SchedulePatternType ='1')                    
 BEGIN                    
  INSERT INTO tbl_Alert_Schedule_Setting (AlertId,CommanOccurences,OnceStartDateTime,OnceEndDateTime,EntryBy,EntryDate,SchedulePatternType)              
        
                
  VALUES(@AlertId,@Second,@FromDate,@EndDate,@EntryBy,GETDATE(),@SchedulePatternType)                    
                  
  EXEC Usp_Alert_Auto_Schedule  @AlertId,@Type                      
 END                    
 ELSE                    
 BEGIN                    
     INSERT INTO tbl_Alert_Schedule_Setting (AlertId,CommanOccurences,EntryBy,EntryDate,SchedulePatternType,OnceStartDateTime,OnceEndDateTime)                      
  VALUES(@AlertId,@Second,@EntryBy,GETDATE(),@SchedulePatternType,NULL,NULL)                      
 END                    
                    
        
        
         
 SELECT @Status = 1, @Message = 'Done' ,@AlertId=@AlertId                     
  END          
  IF(@Function='E')        
  BEGIN        
        
  print 'edit'        
    UPDATE tbl_Alert_popUp SET        
 AlertTital=@AlertTital,        
 AlertBody=@Title,        
 ThemeId=@ThemeId,        
 AlertPosition=@AlertPosition,        
 Type=@Type,        
 AlertType='BC',        
 UpdateBy=@EntryBy,        
 UpdateDate=GETDATE(),        
 TickerPosition=@Opacity,        
 CustomerId=@CustomerId ,    
 DESCRIPTION=@DESCRIPTION,    
 TimeInterval=@TimeInterval    
 WHERE AlertId=@Id        
        
  IF(@SchedulePatternType ='1')                    
 BEGIN          
 PRINT 'sct1'        
  UPDATE tbl_Alert_Schedule_Setting SET        
  AlertId=@Id,        
  CommanOccurences=@Second,        
  UpdateBy=@EntryBy,        
  UpdateDate=GETDATE(),        
  OnceStartDateTime=@FromDate,        
  OnceEndDateTime=@EndDate,        
  SchedulePatternType=@SchedulePatternType        
  WHERE ScheduleId=@ScheduleId AND AlertId=@Id        
        
 END        
 ELSE                
 BEGIN                    
  UPDATE tbl_Alert_Schedule_Setting SET        
  AlertId=@Id,        
  CommanOccurences=@Second,        
  UpdateBy=@EntryBy,        
  UpdateDate=GETDATE(),        
  OnceStartDateTime=NULL,        
  OnceEndDateTime=NULL,        
  SchedulePatternType=@SchedulePatternType         
  WHERE ScheduleId=@ScheduleId AND AlertId=@Id        
 END         
   print 'edit1'        
    SELECT @Status = 1, @Message = 'Done',@AlertId=@Id                      
        
  END        
END                          
SELECT MESSAGE = @Message,STATUS = @Status,AlertId=@AlertId ,Type=@Type                         
                        
            
COMMIT TRANSACTION                             
              
        
               
GOTO EndSave                              
QuitWithRollback:                              
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION                              
BEGIN                          
SELECT  MESSAGE = @Message,STATUS = @Status,AlertId=@AlertId ,Type=@Type                  
        
        
                 
END                            
                            
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[Usp_Alert_Auto_Schedule]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Alert_Auto_Schedule]
(
	@AlertId INT,
	@Type INT
)
AS
BEGIN   
DECLARE @ReturnCode VARCHAR(MAX),@jobId VARCHAR(MAX),@JOBNAME VARCHAR(1000);        
DECLARE @SchedulePatternType VARCHAR(50),@MonthWeek int,@MonthWeekDay VARCHAR(50),@StartDate DATETIME,@StartDateint INT,    
  @EndDate DATETIME,@StartTime TIME,@StartTimeint INT,@ENDTime TIME,@EndDateint INT,@EndTimeint INT;        
DECLARE @FreQInt INT,@freq_intervalD VARCHAR(50),@freq_interval2 INT,@freq_intervalW INT=0,@freq_intervalM INT=0,    
  @freq_recurrence_factor1 int=1,@freq_recurrence_factorM int =0;        
DECLARE @Sunday INT,@Monday INT,@Tuesday INT,@Wednesday INT,@Thursday INT,@Friday INT,@Saturday INT,@DeleteLevel INT = 0;        
DECLARE @MonthlyType int,@WeekinMontly varchar(50),@freq_recurrence_factorM1 int =0;        
        
IF(@Type=1 OR @Type=6)/*Alert OR Quiz*/    
BEGIN        
 SELECT @SchedulePatternType=SchedulePatternType,@WeekinMontly=WeekinMontly,    
 @StartDate=(CASE WHEN SchedulePatternType='Once' THEN  OnceStartDateTime ELSE StartDateComman END),        
 @StartTime=(CASE WHEN SchedulePatternType='Once' THEN  OnceStartDateTime ELSE  StartDateComman END),    
 @EndDate=(CASE WHEN SchedulePatternType='Once' THEN  OnceEndDateTime END),        
 @ENDTime=(CASE WHEN SchedulePatternType='Once' THEN  OnceEndDateTime END),    
 @freq_intervalD=DailyPatternVal,        
 @Sunday=WeeklydaySunday,@Monday=WeeklydayMonday,@Tuesday=WeeklydayTuesday,@Wednesday=WeeklydayWednesday,@Thursday=WeeklydayThursday,        
 @Friday=WeeklydayFriday,@Saturday=WeeklydaySaturday,@freq_intervalM=MonthDay,@freq_recurrence_factorM=WeeklyMonthVal,@freq_recurrence_factorM1=MonthVal,        
 @MonthlyType=MonthlyType,@MonthWeekDay=DayinWeek        
 FROM tbl_Alert_Schedule_Setting WHERE AlertId=@AlertId        
        
 IF(@Type=1)
 BEGIN 
	SET @JOBNAME='AlertSchedule_'+CONVERT(VARCHAR,@AlertId)+'_'+CONVERT(VARCHAR, GETDATE(),112)+REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')        
 END
 IF(@Type=6)
 BEGIN 
	SET @JOBNAME='QuizSchedule_'+CONVERT(VARCHAR,@AlertId)+'_'+CONVERT(VARCHAR, GETDATE(),112)+REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')        
 END 

 UPDATE tbl_Alert_popUp SET JobName =@JOBNAME WHERE AlertId=@AlertId            
END        
IF(@Type=2)/*Ticker*/        
BEGIN        
 SELECT @SchedulePatternType=SchedulePatternType,@WeekinMontly=WeekinMontly,@StartDate=(CASE WHEN SchedulePatternType='Once' THEN  OnceStartDateTime     
 ELSE StartDateComman END),@StartTime=(CASE WHEN SchedulePatternType='Once' THEN  OnceStartDateTime ELSE  StartDateComman END),    
 @freq_intervalD=DailyPatternVal,@Sunday=WeeklydaySunday,@Monday=WeeklydayMonday,@Tuesday=WeeklydayTuesday,@Wednesday=WeeklydayWednesday,    
 @Thursday=WeeklydayThursday,@Friday=WeeklydayFriday,@Saturday=WeeklydaySaturday,@freq_intervalM=MonthDay,@freq_recurrence_factorM=WeeklyMonthVal,    
 @freq_recurrence_factorM1=MonthVal,@MonthlyType=MonthlyType,@MonthWeekDay=DayinWeek        
 FROM tbl_Alert_Schedule_Setting WHERE AlertId=@AlertId        
        
 SET @JOBNAME='TickerSchedule_'+CONVERT(VARCHAR,@AlertId)+'_'+CONVERT(VARCHAR, GETDATE(),112)+REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')        
        
 UPDATE tbl_Alert_popUp SET JobName =@JOBNAME WHERE AlertId=@AlertId        
END        
    
IF(@Type=3 OR @Type=7) /*Wallpaper OR Lock Screen*/       
BEGIN        
 SELECT @SchedulePatternType=SchedulePatternType,    
 @StartDate=(CASE WHEN SchedulePatternType='1' THEN  OnceStartDateTime END),        
 @StartTime=(CASE WHEN SchedulePatternType='1' THEN  OnceStartDateTime END),    
 @EndDate=(CASE WHEN SchedulePatternType='1' THEN  OnceEndDateTime END),        
 @ENDTime=(CASE WHEN SchedulePatternType='1' THEN  OnceEndDateTime END)    
 FROM tbl_Alert_Schedule_Setting WHERE AlertId=@AlertId        
    
  IF(@Type=3)  
  BEGIN  
 SET @JOBNAME='Wallpaper_'+CONVERT(VARCHAR,@AlertId)+'_'+CONVERT(VARCHAR, GETDATE(),112)+REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')        
  END  
 IF(@Type=7)  
  BEGIN  
 SET @JOBNAME='LockScreen_'+CONVERT(VARCHAR,@AlertId)+'_'+CONVERT(VARCHAR, GETDATE(),112)+REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')        
  END  
    
 UPDATE tbl_Alert_popUp SET JobName =@JOBNAME WHERE AlertId=@AlertId            
END     
    
IF(@Type=4) /*ScreenSaver*/       
BEGIN        
 SELECT @SchedulePatternType=SchedulePatternType,    
 @StartDate=(CASE WHEN SchedulePatternType='1' THEN  OnceStartDateTime END),        
 @StartTime=(CASE WHEN SchedulePatternType='1' THEN  OnceStartDateTime END),    
 @EndDate=(CASE WHEN SchedulePatternType='1' THEN  OnceEndDateTime END),        
 @ENDTime=(CASE WHEN SchedulePatternType='1' THEN  OnceEndDateTime END)    
 FROM tbl_Alert_Schedule_Setting WHERE AlertId=@AlertId        
        
 SET @JOBNAME='ScreenSaver_'+CONVERT(VARCHAR,@AlertId)+'_'+CONVERT(VARCHAR, GETDATE(),112)+REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')        
        
 UPDATE tbl_Alert_popUp SET JobName =@JOBNAME WHERE AlertId=@AlertId            
END     
        
        
IF(@SchedulePatternType='Once')        
BEGIN        
 SET @SchedulePatternType=1        
 SET @FreQInt=0        
 SET @DeleteLevel = 3        
END        
ELSE IF(@SchedulePatternType='Daily')        
BEGIN        
 SET @SchedulePatternType=4        
 SET @FreQInt=1        
          
 IF (@freq_intervalD='EveryDay')        
  SELECT @freq_interval2=1        
 ELSE IF(@freq_intervalD='Every2nd')        
  SELECT @freq_interval2=2        
 ELSE IF(@freq_intervalD='Every3ed')        
  SELECT @freq_interval2=3        
 ELSE IF(@freq_intervalD='Every4th')        
  SELECT @freq_interval2=4        
 ELSE IF(@freq_intervalD='Every5th')        
  SELECT @freq_interval2=5        
 ELSE IF(@freq_intervalD='Every6th')        
  SELECT @freq_interval2=6        
 ELSE IF(@freq_intervalD='Every7th')        
  SELECT @freq_interval2=7        
 ELSE IF(@freq_intervalD='Every8th')        
  SELECT @freq_interval2=8        
 ELSE IF(@freq_intervalD='Every9th')        
  SELECT @freq_interval2=9                  
 ELSE IF(@freq_intervalD='Every10th')        
  SELECT @freq_interval2=10        
END        
ELSE IF(@SchedulePatternType='Weekly')        
BEGIN         
 SET @SchedulePatternType=8        
 SET @FreQInt=1        
 IF(@Sunday=1)        
  SELECT @freq_intervalW=@freq_intervalW + 1        
 IF(@Monday=1)        
  SELECT @freq_intervalW=@freq_intervalW + 2        
 IF(@Tuesday=1)        
  SELECT  @freq_intervalW=@freq_intervalW + 4        
 IF(@Wednesday=1)        
  SELECT @freq_intervalW=@freq_intervalW + 8        
 IF(@Thursday=1)        
  SELECT @freq_intervalW=@freq_intervalW + 16        
 IF(@Friday=1)        
  SELECT  @freq_intervalW=@freq_intervalW + 32        
 IF(@Saturday=1)        
  SELECT  @freq_intervalW=@freq_intervalW + 64        
        
 SELECT @freq_interval2=@freq_intervalW        
END        
ELSE IF(@SchedulePatternType='Monthly')        
BEGIN         
 SET @FreQInt=0        
 IF(@MonthlyType='1')        
 BEGIN        
  SELECT @SchedulePatternType=16        
  SELECT @freq_recurrence_factor1=@freq_recurrence_factorM        
  SELECT @freq_interval2=@freq_intervalM        
 END        
 IF(@MonthlyType='2')        
 BEGIN        
  SELECT @SchedulePatternType=32        
  SELECT @freq_recurrence_factor1=@freq_recurrence_factorM1        
        
  --freq_interval        
  --SELECT @freq_interval2=@freq_intervalM        
        
  IF(@MonthWeekDay='Sunday')        
   SET @freq_interval2=1        
  ELSE IF(@MonthWeekDay='Monday')        
   SET @freq_interval2=2        
  ELSE IF(@MonthWeekDay='Tuesday')        
   SET @freq_interval2=3        
  ELSE IF(@MonthWeekDay='Wednesday')        
   SET @freq_interval2=4        
  ELSE IF(@MonthWeekDay='Thursday')        
   SET @freq_interval2=5        
  ELSE IF(@MonthWeekDay='Friday')        
   SET @freq_interval2=6        
  ELSE IF(@MonthWeekDay='Saturday')        
   SET @freq_interval2=7        
        
  IF(@WeekinMontly='1st')        
   SET @MonthWeek=1        
  ELSE IF(@WeekinMontly='2nd')        
   SET @MonthWeek=2        
  ELSE IF(@WeekinMontly='3ed')        
   SET @MonthWeek=3        
  ELSE IF(@WeekinMontly='4th')        
   SET @MonthWeek=4        
  ELSE IF(@WeekinMontly='Last')        
   SET @MonthWeek=5        
  --SELECT @freq_interval2=@MonthWeek        
             
 END        
          
END       
ELSE IF(@SchedulePatternType='1')        
BEGIN        
 --SET @SchedulePatternType=1        
 --SET @FreQInt=0        
 --SET @DeleteLevel = 3        
    
 SET @SchedulePatternType=4        
 SET @FreQInt=1      
 SET @freq_interval2=1        
END     
        
--ELSE IF(@SchedulePatternType='Yearly')        
-- BEGIN         
--  SELECT @SchedulePatternType=32        
-- END        
        
        
        
SET @StartDateint=CAST(CONVERT(VARCHAR, @StartDate, 112) AS INT)        
SET @EndDateint=CAST(CONVERT(VARCHAR, @EndDate, 112) AS INT)         
SET @StartTimeint=REPLACE(CONVERT(VARCHAR, @StartTime,108),':','')        
SET @EndTimeint=REPLACE(CONVERT(VARCHAR, @ENDTime,108),':','')            
        
        
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=@JOBNAME,                     
 @enabled=1,                     
 @notify_level_eventlog=0,                     
 @notify_level_email=2,                     
 @notify_level_netsend=0,                     
 @notify_level_page=0,                     
 @delete_level=@DeleteLevel,                     
 @description=N'No description available.',                     
 @category_name=N'[Uncategorized (Local)]',                     
 @owner_login_name=N'sa',                     
 @notify_email_operator_name=NULL, @job_id = @jobId OUTPUT                    
                     
 EXEC @ReturnCode =msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1                    
 --IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback                   

/*----------START : GET CURRENT DATABASE NAME - CR ----------*/
DECLARE @dbname sysname;
SET @dbname = DB_NAME();
/*---------- END : GET CURRENT DATABASE NAME - CR ----------*/

 
 DECLARE @SQRY VARCHAR(MAX) = 'exec Alert_Auto_Schedule_list ''' + CAST(@AlertId AS VARCHAR) + ''',''' + CAST(@Type AS VARCHAR) + ''' '        
 PRINT @SQRY        
 EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name='Step1',                     
 @step_id=1,                       
 @cmdexec_success_code=0,                     
 @on_success_action=1,                     
 @on_success_step_id=0,                     
 @on_fail_action=2,                     
 @on_fail_step_id=0,                     
 @retry_attempts=0,                     
 @retry_interval=0,                     
 @os_run_priority=0,         
 @subsystem=N'TSQL',                     
 @command= @SQRY,         
 --@additional_parameters=@AlertId,
 @database_name = @dbname,
 /*@database_name='XCommAlert',*/
 @flags=0           
                
-- IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback                    
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name='SalesDATA',                     
 @enabled=1,                     
 @freq_type=@SchedulePatternType,--@RPTFreQ                     
 @freq_interval=@freq_interval2,--every 3 day                     
 @freq_subday_type=1,                     
 @freq_subday_interval=@FreQInt,        
 @freq_relative_interval=16,        
 @freq_recurrence_factor=@freq_recurrence_factor1,  --month val 32                   
 @active_start_date=@StartDateint,        
 @active_end_date=@EndDateint, --@ENDDate                    
 @active_start_time=@StartTimeint,        
 @active_end_time=NULL        
         
        
-- IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback                    
 EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'                    
 --IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback                    
                    
-- exec @ReturnCode =msdb.dbo.sp_start_job @job_name=@JOBNAME                
 --IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback          
        
 END
GO
/****** Object:  StoredProcedure [dbo].[Usp_AlertPopUp_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_AlertPopUp_Submit '','','','',''
*/
CREATE PROCEDURE [dbo].[Usp_AlertPopUp_Submit]
(
	@XML1 XML,
	@UserName NVARCHAR(50),
	@EditFlag VARCHAR(10),
	@Type INT,
	@CustomerId INT
)
AS
	BEGIN TRANSACTION

	DECLARE @Status INT
		   ,@Message VARCHAR(500)
		   ,@AlertId INT
		   ,@SchedulePatternTypeNow VARCHAR(50)
	SELECT @Message = 'Not Done' ,@Status = 0

	DECLARE @hdoc1 INT
		   ,@hdocName VARCHAR(1000) = 'AlertModel'

	EXEC sp_xml_preparedocument @hdoc1 OUTPUT
							   ,@XML1

	IF (@EditFlag = 'N')
	BEGIN
		IF (@Type = 5)
		BEGIN
			INSERT INTO tbl_Alert_popUp (AlertTital, AlertBody, CriticalAlert, AutoCloseIn, AutoCloseInMin, ExpiresIn, ExpiresTimeValue, ExpiresTimeType,
			TrayNotification, AcknoledgrButton,AcknowledgeButtonText, FullScreenAlert, DesktopSizeWidth, DesktopSizeHeight, AlertPosition, EntryDate, EntryBy, Status, ThemeId, isResize, Type,
			TickerSpeed, TickerPosition, MessagingType, CustomerId)
			
			SELECT
				AlertTital
				,AlertBody
				,CriticalAlert
				,AutoCloseIn
				,AutoCloseInMin
				,ExpiresIn
				,ExpiresTimeValue
				,ExpiresTimeType
				,TrayNotification
				,AcknoledgrButton
				,AcknowledgeButtonText
				,FullScreenAlert
				,DesktopSizeWidth
				,DesktopSizeHeight
				,AlertPosition
				,GETDATE()
				,@UserName
				,'Drafts'
				,'</br>'
				,isResize
				,@Type
				,TickerSpeed
				,TickerPosition
				,MessagingType
				,@CustomerId
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertTital VARCHAR(MAX) 'AlertTital'
				, AlertBody VARCHAR(MAX) 'AlertBody'
				, CriticalAlert BIT 'CriticalAlert'
				, AutoCloseIn BIT 'AutoCloseIn'
				, AutoCloseInMin INT 'AutoCloseInMin'
				, ExpiresIn BIT 'ExpiresIn'
				, ExpiresTimeValue INT 'ExpiresTimeValue'
				, ExpiresTimeType VARCHAR(100) 'ExpiresTimeType'
				, TrayNotification BIT 'TrayNotification'
				, AcknoledgrButton BIT 'AcknoledgrButton'
				,AcknowledgeButtonText VARCHAR(50) 'AcknowledgeButtonText'
				, FullScreenAlert BIT 'FullScreenAlert'
				, DesktopSizeWidth INT 'DesktopSizeWidth'
				, DesktopSizeHeight INT 'DesktopSizeHeight'
				, AlertPosition VARCHAR(50) 'AlertPosition'
				, ThemeId VARCHAR(50) 'ThemeId'
				, isResize BIT 'isResize'
				, TickerSpeed VARCHAR(20) 'TickerSpeed'
				, TickerPosition VARCHAR(100) 'TickerPosition'
				, MessagingType VARCHAR(100) 'MessagingType'
			)
			IF (@@error <> 0) GOTO QuitWithRollback
			
			SET @AlertId = SCOPE_IDENTITY();

			INSERT INTO tbl_Alert_Schedule_Setting (AlertId, EntryBy, EntryDate)
				VALUES (@AlertId, @UserName, GETDATE())
		END
		ELSE
		BEGIN
			INSERT INTO tbl_Alert_popUp (AlertTital, AlertBody, CriticalAlert, AutoCloseIn, AutoCloseInMin, ExpiresIn, ExpiresTimeValue, ExpiresTimeType,
			TrayNotification, AcknoledgrButton,AcknowledgeButtonText, FullScreenAlert, DesktopSizeWidth, DesktopSizeHeight, AlertPosition, EntryDate, EntryBy, Status, ThemeId, isResize,
			Type, TickerSpeed, TickerPosition, CustomerId, MessagingType)
			
			SELECT
				AlertTital
				,AlertBody
				,CriticalAlert
				,AutoCloseIn
				,AutoCloseInMin
				,ExpiresIn
				,ExpiresTimeValue
				,ExpiresTimeType
				,TrayNotification
				,AcknoledgrButton
				,AcknowledgeButtonText
				,FullScreenAlert
				,DesktopSizeWidth
				,DesktopSizeHeight
				,AlertPosition
				,GETDATE()
				,@UserName
				,'Drafts'
				,ThemeId
				,isResize
				,@Type
				,TickerSpeed
				,TickerPosition
				,@CustomerId
				,MessagingType
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertTital VARCHAR(MAX) 'AlertTital'
				, AlertBody VARCHAR(MAX) 'AlertBody'
				, CriticalAlert BIT 'CriticalAlert'
				, AutoCloseIn BIT 'AutoCloseIn'
				, AutoCloseInMin INT 'AutoCloseInMin'
				, ExpiresIn BIT 'ExpiresIn'
				, ExpiresTimeValue INT 'ExpiresTimeValue'
				, ExpiresTimeType VARCHAR(100) 'ExpiresTimeType'
				, TrayNotification BIT 'TrayNotification'
				, AcknoledgrButton BIT 'AcknoledgrButton'
				,AcknowledgeButtonText VARCHAR(50) 'AcknowledgeButtonText'
				, FullScreenAlert BIT 'FullScreenAlert'
				, DesktopSizeWidth INT 'DesktopSizeWidth'
				, DesktopSizeHeight INT 'DesktopSizeHeight'
				, AlertPosition VARCHAR(50) 'AlertPosition'
				, ThemeId VARCHAR(50) 'ThemeId'
				, isResize BIT 'isResize'
				, TickerSpeed VARCHAR(20) 'TickerSpeed'
				, TickerPosition VARCHAR(100) 'TickerPosition'
				, MessagingType VARCHAR(100) 'MessagingType'
			)
			IF (@@error <> 0) GOTO QuitWithRollback

			SET @AlertId = SCOPE_IDENTITY();

			INSERT INTO tbl_Alert_Schedule_Setting (AlertId, SchedulePatternType, OnceStartDateTime, OnceEndDateTime, IsOnceReminder, OnceReminderVal,
			DailyPatternVal, WeeklyVal, WeeklydaySunday, WeeklydayMonday, WeeklydayTuesday, WeeklydayWednesday, WeeklydayThursday, WeeklydayFriday,
			WeeklydaySaturday, MonthDay, MonthVal, MonthlyType, WeekinMontly, DayinWeek, WeeklyMonthVal, YearlyType, YearlMonth, DayinWeekYearly,
			WeekinMontYearly, MonthsYearl, StartDateComman, CommanDateType, CommanOccurences, CommanEndBy, EntryBy, EntryDate)
			
			SELECT
				@AlertId
				,SchedulePatternType
				,OnceStartDateTime
				,OnceEndDateTime
				,IsOnceReminder
				,OnceReminderVal
				,DailyPatternVal
				,WeeklyVal
				,WeeklydaySunday
				,WeeklydayMonday
				,WeeklydayTuesday
				,WeeklydayWednesday
				,WeeklydayThursday
				,WeeklydayFriday
				,WeeklydaySaturday
				,MonthDay
				,MonthVal
				,MonthlyType
				,WeekinMontly
				,DayinWeek
				,WeeklyMonthVal
				,YearlyType
				,YearlMonth
				,DayinWeekYearly
				,WeekinMontYearly
				,MonthsYearl
				,StartDateComman
				,CommanDateType
				,CommanOccurences
				,CommanEndBy
				,@UserName
				,GETDATE()
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				SchedulePatternType VARCHAR(50) 'SchedulePatternType'
				, OnceStartDateTime DATETIME 'OnceStartDateTime'
				, OnceEndDateTime DATETIME 'OnceEndDateTime'
				, IsOnceReminder BIT 'IsOnceReminder'
				, OnceReminderVal INT 'OnceReminderVal'
				, DailyPatternVal VARCHAR(50) 'DailyPatternVal'
				, WeeklyVal VARCHAR(50) 'WeeklyVal'
				, WeeklydaySunday BIT 'WeeklydaySunday'
				, WeeklydayMonday BIT 'WeeklydayMonday'
				, WeeklydayTuesday BIT 'WeeklydayTuesday'
				, WeeklydayWednesday BIT 'WeeklydayWednesday'
				, WeeklydayThursday BIT 'WeeklydayThursday'
				, WeeklydayFriday BIT 'WeeklydayFriday'
				, WeeklydaySaturday BIT 'WeeklydaySaturday'
				, MonthDay VARCHAR(50) 'MonthDay'
				, MonthVal VARCHAR(50) 'MonthVal'
				, MonthlyType VARCHAR(50) 'MonthlyType'
				, WeekinMontly VARCHAR(50) 'WeekinMontly'
				, DayinWeek VARCHAR(50) 'DayinWeek'
				, WeeklyMonthVal VARCHAR(50) 'WeeklyMonthVal'
				, YearlyType VARCHAR(50) 'YearlyType'
				, YearlMonth VARCHAR(50) 'YearlMonth'
				, DayinWeekYearly VARCHAR(50) 'DayinWeekYearly'
				, WeekinMontYearly VARCHAR(50) 'WeekinMontYearly'
				, MonthsYearl VARCHAR(50) 'MonthsYearl'
				, StartDateComman DATETIME 'StartDateComman'
				, CommanDateType VARCHAR(50) 'CommanDateType'
				, CommanOccurences INT 'CommanOccurences'
				, CommanEndBy VARCHAR(200) 'CommanEndBy'
			)
			IF (@@error <> 0) GOTO QuitWithRollback

			SELECT @SchedulePatternTypeNow = ZZ.SchedulePatternType
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				SchedulePatternType VARCHAR(50) 'SchedulePatternType'
			) ZZ

			IF (@SchedulePatternTypeNow != 'Now')
			BEGIN 
				EXEC Usp_Alert_Auto_Schedule @AlertId,@Type
			END
		END
	END

	IF (@EditFlag = 'Y')
		IF (@Type = 5)
		BEGIN

			SELECT @AlertId = AlertId
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertId INT 'AlertId'
			)

			UPDATE tbl_Alert_popUp
			SET AlertTital = X.AlertTital
			   ,AlertBody = X.AlertBody
			   ,CriticalAlert = X.CriticalAlert
			   ,AutoCloseIn = X.AutoCloseIn
			   ,AutoCloseInMin = X.AutoCloseInMin
			   ,ExpiresIn = X.ExpiresIn
			   ,ExpiresTimeValue = X.ExpiresTimeValue
			   ,ExpiresTimeType = X.ExpiresTimeType
			   ,TrayNotification = X.TrayNotification
			   ,AcknoledgrButton = X.AcknoledgrButton
			   ,AcknowledgeButtonText = X.AcknowledgeButtonText
			   ,FullScreenAlert = X.FullScreenAlert
			   ,DesktopSizeWidth = X.DesktopSizeWidth
			   ,DesktopSizeHeight = X.DesktopSizeHeight
			   ,AlertPosition = X.AlertPosition
			   ,UpdateBy = @UserName
			   ,UpdateDate = GETDATE()
			   ,ThemeId = X.ThemeId
			   ,isResize = X.isResize
			   ,TickerSpeed = X.TickerSpeed
			   ,TickerPosition = X.TickerPosition
			   ,MessagingType = X.MessagingType
			   ,CustomerId = @CustomerId
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertId INT 'AlertId'
				, AlertTital VARCHAR(MAX) 'AlertTital'
				, AlertBody VARCHAR(MAX) 'AlertBody'
				, CriticalAlert BIT 'CriticalAlert'
				, AutoCloseIn BIT 'AutoCloseIn'
				, AutoCloseInMin INT 'AutoCloseInMin'
				, ExpiresIn BIT 'ExpiresIn'
				, ExpiresTimeValue INT 'ExpiresTimeValue'
				, ExpiresTimeType VARCHAR(100) 'ExpiresTimeType'
				, TrayNotification BIT 'TrayNotification'
				, AcknoledgrButton BIT 'AcknoledgrButton'
				, AcknowledgeButtonText VARCHAR(50) 'AcknowledgeButtonText'
				, FullScreenAlert BIT 'FullScreenAlert'
				, DesktopSizeWidth INT 'DesktopSizeWidth'
				, DesktopSizeHeight INT 'DesktopSizeHeight'
				, AlertPosition VARCHAR(50) 'AlertPosition'
				, ThemeId VARCHAR(50) 'ThemeId'
				, isResize BIT 'isResize'
				, TickerSpeed VARCHAR(20) 'TickerSpeed'
				, TickerPosition VARCHAR(100) 'TickerPosition'
				, MessagingType VARCHAR(100) 'MessagingType'
			) X
			WHERE tbl_Alert_popUp.AlertId = X.AlertId
		END
		ELSE
		BEGIN
			SELECT @AlertId = AlertId
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertId INT 'AlertId'
			)

			UPDATE tbl_Alert_popUp
			SET AlertTital = X.AlertTital
			   ,AlertBody = X.AlertBody
			   ,CriticalAlert = X.CriticalAlert
			   ,AutoCloseIn = X.AutoCloseIn
			   ,AutoCloseInMin = X.AutoCloseInMin
			   ,ExpiresIn = X.ExpiresIn
			   ,ExpiresTimeValue = X.ExpiresTimeValue
			   ,ExpiresTimeType = X.ExpiresTimeType
			   ,TrayNotification = X.TrayNotification
			   ,AcknoledgrButton = X.AcknoledgrButton
			   ,AcknowledgeButtonText = X.AcknowledgeButtonText
			   ,FullScreenAlert = X.FullScreenAlert
			   ,DesktopSizeWidth = X.DesktopSizeWidth
			   ,DesktopSizeHeight = X.DesktopSizeHeight
			   ,AlertPosition = X.AlertPosition
			   ,UpdateBy = @UserName
			   ,UpdateDate = GETDATE()
			   ,ThemeId = X.ThemeId
			   ,isResize = X.isResize
			   ,TickerSpeed = X.TickerSpeed
			   ,TickerPosition = X.TickerPosition
			   ,MessagingType = X.MessagingType
			   ,CustomerId = @CustomerId
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertId INT 'AlertId'
				, AlertTital VARCHAR(MAX) 'AlertTital'
				, AlertBody VARCHAR(MAX) 'AlertBody'
				, CriticalAlert BIT 'CriticalAlert'
				, AutoCloseIn BIT 'AutoCloseIn'
				, AutoCloseInMin INT 'AutoCloseInMin'
				, ExpiresIn BIT 'ExpiresIn'
				, ExpiresTimeValue INT 'ExpiresTimeValue'
				, ExpiresTimeType VARCHAR(100) 'ExpiresTimeType'
				, TrayNotification BIT 'TrayNotification'
				, AcknoledgrButton BIT 'AcknoledgrButton'
				, AcknowledgeButtonText VARCHAR(50) 'AcknowledgeButtonText'
				, FullScreenAlert BIT 'FullScreenAlert'
				, DesktopSizeWidth INT 'DesktopSizeWidth'
				, DesktopSizeHeight INT 'DesktopSizeHeight'
				, AlertPosition VARCHAR(50) 'AlertPosition'
				, ThemeId VARCHAR(50) 'ThemeId'
				, isResize BIT 'isResize'
				, TickerSpeed VARCHAR(20) 'TickerSpeed'
				, TickerPosition VARCHAR(100) 'TickerPosition'
				, MessagingType VARCHAR(100) 'MessagingType'
			) X
			WHERE tbl_Alert_popUp.AlertId = X.AlertId

			IF (@@error <> 0) GOTO QuitWithRollback

			UPDATE tbl_Alert_Schedule_Setting
			SET SchedulePatternType = Z.SchedulePatternType
			   ,OnceStartDateTime = Z.OnceStartDateTime
			   ,OnceEndDateTime = Z.OnceEndDateTime
			   ,IsOnceReminder = Z.IsOnceReminder
			   ,OnceReminderVal = Z.OnceReminderVal
			   ,DailyPatternVal = Z.DailyPatternVal
			   ,WeeklyVal = Z.WeeklyVal
			   ,WeeklydaySunday = Z.WeeklydaySunday
			   ,WeeklydayMonday = Z.WeeklydayMonday
			   ,WeeklydayTuesday = Z.WeeklydayTuesday
			   ,WeeklydayWednesday = Z.WeeklydayWednesday
			   ,WeeklydayThursday = Z.WeeklydayThursday
			   ,WeeklydayFriday = Z.WeeklydayFriday
			   ,WeeklydaySaturday = Z.WeeklydaySaturday
			   ,MonthDay = Z.MonthDay
			   ,MonthVal = Z.MonthVal
			   ,MonthlyType = Z.MonthlyType
			   ,WeekinMontly = Z.WeekinMontly
			   ,DayinWeek = Z.DayinWeek
			   ,WeeklyMonthVal = Z.WeeklyMonthVal
			   ,YearlyType = Z.YearlyType
			   ,YearlMonth = Z.YearlMonth
			   ,DayinWeekYearly = Z.DayinWeekYearly
			   ,WeekinMontYearly = Z.WeekinMontYearly
			   ,MonthsYearl = Z.MonthsYearl
			   ,StartDateComman = Z.StartDateComman
			   ,CommanDateType = Z.CommanDateType
			   ,CommanOccurences = Z.CommanOccurences
			   ,CommanEndBy = Z.CommanEndBy
			   ,UpdateBy = @UserName
			   ,UpdateDate = GETDATE()

			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				AlertId INT 'AlertId'
				, SchedulePatternType VARCHAR(50) 'SchedulePatternType'
				, OnceStartDateTime DATETIME 'OnceStartDateTime'
				, OnceEndDateTime DATETIME 'OnceEndDateTime'
				, IsOnceReminder BIT 'IsOnceReminder'
				, OnceReminderVal INT 'OnceReminderVal'
				, DailyPatternVal VARCHAR(50) 'DailyPatternVal'
				, WeeklyVal VARCHAR(50) 'WeeklyVal'
				, WeeklydaySunday BIT 'WeeklydaySunday'
				, WeeklydayMonday BIT 'WeeklydayMonday'
				, WeeklydayTuesday BIT 'WeeklydayTuesday'
				, WeeklydayWednesday BIT 'WeeklydayWednesday'
				, WeeklydayThursday BIT 'WeeklydayThursday'
				, WeeklydayFriday BIT 'WeeklydayFriday'
				, WeeklydaySaturday BIT 'WeeklydaySaturday'
				, MonthDay VARCHAR(50) 'MonthDay'
				, MonthVal VARCHAR(50) 'MonthVal'
				, MonthlyType VARCHAR(50) 'MonthlyType'
				, WeekinMontly VARCHAR(50) 'WeekinMontly'
				, DayinWeek VARCHAR(50) 'DayinWeek'
				, WeeklyMonthVal VARCHAR(50) 'WeeklyMonthVal'
				, YearlyType VARCHAR(50) 'YearlyType'
				, YearlMonth VARCHAR(50) 'YearlMonth'
				, DayinWeekYearly VARCHAR(50) 'DayinWeekYearly'
				, WeekinMontYearly VARCHAR(50) 'WeekinMontYearly'
				, MonthsYearl VARCHAR(50) 'MonthsYearl'
				, StartDateComman DATETIME 'StartDateComman'
				, CommanDateType VARCHAR(50) 'CommanDateType'
				, CommanOccurences INT 'CommanOccurences'
				, CommanEndBy VARCHAR(200) 'CommanEndBy'
			) Z
			WHERE tbl_Alert_Schedule_Setting.AlertId = Z.AlertId
			IF (@@error <> 0) GOTO QuitWithRollback

			SELECT @SchedulePatternTypeNow = ZZ.SchedulePatternType
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				SchedulePatternType VARCHAR(50) 'SchedulePatternType'
			) ZZ

			IF (@SchedulePatternTypeNow != 'Now')
			BEGIN
				DECLARE @JobName VARCHAR(500)
				SELECT @JobName = JobName FROM tbl_Alert_popUp WHERE AlertId = @AlertId

				IF (@JobName != '')
				BEGIN
					EXEC msdb.dbo.sp_delete_job @job_name = @JobName;
				END
				EXEC Usp_Alert_Auto_Schedule @AlertId,@Type
			END
		END
	SELECT
		@Status = 1 ,@Message = 'Done'

	SELECT MESSAGE = @Message ,Status = @Status ,AlertId = @AlertId
	COMMIT TRANSACTION
	GOTO EndSave
QuitWithRollback:
	IF (@@trancount > 0)
		ROLLBACK TRANSACTION
	BEGIN
		SELECT MESSAGE = @Message ,Status = @Status ,AlertId = @AlertId
	END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_AlertPopUpStap2_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_AlertPopUpStap2_Submit
*/
CREATE PROCEDURE [dbo].[Usp_AlertPopUpStap2_Submit]
(
	@XML1 VARCHAR(MAX),
	@AlertId INT,
	@AlertType VARCHAR(20),
	@SRUsertpy BIT,
	@SRGrouptyp BIT,
	@UserName NVARCHAR(50),
	@SchedulePatternType VARCHAR(50),
	@Type VARCHAR(50),
	@LicenceCnt INT,
	@TargetCnt INT
)
AS
BEGIN
	BEGIN TRANSACTION

	DECLARE @Status INT, @Message VARCHAR(500), @DeskbarId VARCHAR(MAX);
	DECLARE @MobileNo VARCHAR(MAX), @AcknoledgrButton BIT, @scheduleTime datetime, @scheduleendtime datetime;
	DECLARE @EmailIds VARCHAR(MAX), @ResultString VARCHAR(MAX) = NULL;
	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'root/UserDetail';

	SELECT @Message = 'Not Done', @Status = 0;
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;

	BEGIN
		UPDATE tbl_Alert_popUp SET
			AlertType = @AlertType,
			SRUsertpy = @SRUsertpy,
			SRGrouptyp = @SRGrouptyp,
			[Status] = 'Send'
		WHERE AlertId = @AlertId;
		IF (@@error <> 0) GOTO QuitWithRollback

		SELECT
			@AcknoledgrButton = ISNULL(tau.AcknoledgrButton,0)
		FROM tbl_Alert_popUp tau WITH(NOLOCK)
		WHERE tau.AlertId = @AlertId;
        
		INSERT INTO tbl_Send_Alert_User
		(
			AlertId, UserId, UserName,
			EntryBy, EntryDate, UserType,
			[Status], IsAcknowledge, AcknowledgeDate
		)
		SELECT
			@AlertId, UserId, UserName,
			@UserName, GETDATE(), UserType,
			'Send', 0 ,NULL
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			AlertId INT 'Alertid',
			UserId INT 'UserId',
			UserName VARCHAR(200) 'UserName',
			UserType VARCHAR(50) 'UserType'
		)
		IF (@@error <> 0) GOTO QuitWithRollback
	END
	

	/* --SELECT @ResultString
	--SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE
	tu.id IN (SELECT * FROM dbo.SplitString(@ResultString,',')); */

	/*---------- START : Return LastLoginDate Wise DeskbarId ----------*/
	/*---------- END : Return LastLoginDate Wise DeskbarId ----------*/

	/*---------- START : Get Customer Liecense Count Wise Return MobileNumber ----------*/	
    IF(@SchedulePatternType ='Schedule')	
	BEGIN
	SELECT
		@scheduleTime = OnceStartDateTime, @scheduleendtime=OnceEndDateTime
		FROM tbl_Alert_Schedule_Setting WITH(NOLOCK)
		WHERE AlertId = @AlertId;
		UPDATE tbl_Send_Alert_User SET [Status]='Schedule', ScheduleTime = @scheduleTime, ScheduleEndTime = @scheduleendtime WHERE Alertid = @AlertId;
    END

	IF(@SchedulePatternType ='Once')	
	BEGIN
	SELECT
		@scheduleTime = OnceStartDateTime, @scheduleendtime=OnceEndDateTime
		FROM tbl_Alert_Schedule_Setting WITH(NOLOCK)
		WHERE AlertId = @AlertId;
		UPDATE tbl_Send_Alert_User SET [Status]='Once', ScheduleTime = @scheduleTime, ScheduleEndTime = @scheduleendtime WHERE Alertid = @AlertId;
    END
	SELECT @Status = 1, @Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status, DeskbarId = @DeskbarId, [type] = @Type, MobileNo = @MobileNo, EmailIds = @EmailIds;

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
		IF (@@trancount > 0)
		ROLLBACK TRANSACTION
		BEGIN
			SELECT [MESSAGE] = @Message, [STATUS] = @Status, [type] = @Type, MobileNo = '', EmailIds = '';
		END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_AlertPopUpStap2_Submit_bkp_09_Sep_21]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_AlertPopUpStap2_Submit_bkp_09_Sep_21]     
@XML1 XML,    
@AlertId INT,    
@AlertType VARCHAR(20),    
@SRUsertpy BIT,    
@SRGrouptyp BIT,    
@UserName NVARCHAR(50),    
@SchedulePatternType VARCHAR(50),    
@Type VARCHAR(50),
@LicenceCnt INT,
@TargetCnt INT
AS    
 BEGIN TRANSACTION    
 DECLARE @Status INT ,@Message VARCHAR(500) ,@DeskbarId VARCHAR(MAX),@MobileNo VARCHAR(MAX),@AcknoledgrButton BIT;    
 DECLARE @hdoc1 INT ,@hdocName VARCHAR(1000) = 'root/UserDetail'    
 SELECT @Message = 'Not Done' ,@Status = 0     
 EXEC sp_xml_preparedocument @hdoc1 OUTPUT ,@XML1    
 DECLARE @sql nvarchar(MAX),@sql1 NVARCHAR(MAX),@ParmDefinition NVARCHAR(500),@CountpendingUser  INT,@OnlineUser INT
 
 BEGIN  
 SELECT @OnlineUser=COUNT(*)  FROM (SELECT 
			
			SrNo=X.T.value('SrNo[1]','INT')
						,UserId=X.T.value('UserId[1]','int')
						,UserName=X.T.value('UserName[1]','VARCHAR(100)')
						,UserType=X.T.value('UserType[1]','VARCHAR(100)')							
						,IsOnline=X.T.value('IsOnline[1]','bit')												
			
						FROM @XML1.nodes('root/UserDetail') AS X(T)) AS X 
						where x.IsOnline='true'
--SELECT @OnlineUser
IF (@TargetCnt<@LicenceCnt)
BEGIN 
	SET @CountpendingUser=@TargetCnt-@OnlineUser
END
ELSE IF(@TargetCnt>@LicenceCnt)
BEGIN
	SET @CountpendingUser=@LicenceCnt-@OnlineUser
END
ELSE IF(@TargetCnt=@LicenceCnt)
BEGIN
	SET @CountpendingUser=@LicenceCnt-@OnlineUser
END
  UPDATE tbl_Alert_popUp    
  SET AlertType = @AlertType ,SRUsertpy = @SRUsertpy,SRGrouptyp = @SRGrouptyp, Status = 'Send',TotalRecepient=@LicenceCnt,
  PendingRecepient=@CountpendingUser
  WHERE AlertId = @AlertId    
      
  IF (@@error <> 0) GOTO QuitWithRollback    
  SELECT @AcknoledgrButton = ISNULL(tau.AcknoledgrButton,0) FROM tbl_Alert_popUp tau WHERE tau.AlertId = @AlertId    
 
   
  --INSERT INTO tbl_Send_Alert_User (AlertId, UserId, UserName, EntryBy, EntryDate, UserType,Status,IsAcknowledge,AcknowledgeDate)    
  --SELECT @AlertId ,UserId ,UserName ,@UserName ,GETDATE() ,UserType,'Schedule',0,NULL    
  --FROM OPENXML(@hdoc1, @hdocName, 2)    
  --WITH    
  --(    
  -- AlertId INT 'Alertid',     
  -- UserId INT 'UserId',     
  -- UserName VARCHAR(200) 'UserName',     
  -- UserType VARCHAR(50) 'UserType',
  -- IsOnline BIT 'IsOnline'
  --)x 
  --WHERE x.IsOnline='True'
  
set @sql=' INSERT INTO tbl_Send_Alert_User (  UserId, UserName, EntryBy, EntryDate, UserType,Status,
IsAcknowledge,AcknowledgeDate,AlertId) 
SELECT top '+cast( @LicenceCnt as VARCHAR(50))+' X.UserId,X.UserName,'''+@UserName+''',
GETDATE(),X.UserType,''Schedule'',0,NULL, '+cast( @AlertId as VARCHAR(50))+ 'FROM (SELECT 
                                      UserId=X.T.value(''UserId[1]'',''int'')
                                     ,UserName=X.T.value(''UserName[1]'',''VARCHAR(100)'')
                                     ,UserType=X.T.value(''UserType[1]'',''VARCHAR(100)'')							
                                     ,IsOnline=X.T.value(''IsOnline[1]'',''bit'')															
                           
          FROM @XML1.nodes(''root/UserDetail'') AS X(T)) AS X 
                                     where x.IsOnline=''True'''
set @ParmDefinition= N'@XML1 XML'
EXEC sp_executesql @sql,@ParmDefinition,@XML1;


  IF (@@error <> 0) GOTO QuitWithRollback    


SET @sql1=' INSERT INTO tbl_Send_Alert_Offline_user (
  UserId
, EntryBy
, EntryDate
,Status
,AlertId) SELECT   X.UserId,'''+@UserName+''',
                                     GETDATE(),''Pending'','+cast( @AlertId as VARCHAR(50))+'  FROM (SELECT 

                                     UserId=X.T.value(''UserId[1]'',''int'')						
                                     ,IsOnline=X.T.value(''IsOnline[1]'',''bit'')															
                                     FROM @XML1.nodes(''root/UserDetail'') 
AS X(T)) AS X 
                                     where x.IsOnline=''False'''
set @ParmDefinition= N'@XML1 XML'
EXEC sp_executesql @sql1,@ParmDefinition,@XML1;

  IF (@@error <> 0) GOTO QuitWithRollback    
 END    
    
 DECLARE @ResultString VARCHAR(MAX) = NULL;    
 SELECT @ResultString = STRING_AGG(tsau.UserId, ',')    
 FROM tbl_Send_Alert_User tsau    
 WHERE AlertId = @AlertId AND tsau.UserType = 'User'    
     
 SELECT @ResultString = COALESCE(@ResultString + ',', '') + dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(UserId), ',')    
 FROM tbl_Send_Alert_User tsau    
 WHERE AlertId = @AlertId AND tsau.UserType = 'Group'    
 --SELECT @ResultString     
 --SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE tu.id IN 
(SELECT * FROM dbo.SplitString(@ResultString,','))    
 SELECT @DeskbarId = STRING_AGG(tu.deskbar_id, ',')    
 FROM Tbl_Users tu    
 WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','))    
    
 SELECT @MobileNo = STRING_AGG(tu.mobile_phone, ',')    
 FROM Tbl_Users tu    
 WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','))  
  
 IF(@SchedulePatternType ='Now')    
 BEGIN    
  UPDATE tbl_Send_Alert_User SET Status='Send' WHERE Alertid=@AlertId    
 END    
    
     
 SELECT @Status = 1 ,@Message = 'Done'    
     
 SELECT MESSAGE = @Message ,STATUS = @Status ,DeskbarId = @DeskbarId,Type=@Type ,MobileNo=@MobileNo  
     
 COMMIT TRANSACTION    
 GOTO EndSave    
QuitWithRollback:    
 IF (@@trancount > 0)    
  ROLLBACK TRANSACTION    
 BEGIN    
  SELECT MESSAGE = @Message ,STATUS = @Status,type=@Type    
 END    
EndSave:




GO
/****** Object:  StoredProcedure [dbo].[Usp_AlertPopUpStap2_Submit_BKP_09Feb2022_CR]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_AlertPopUpStap2_Submit_BKP_09Feb2022_CR
*/
CREATE PROCEDURE [dbo].[Usp_AlertPopUpStap2_Submit_BKP_09Feb2022_CR]
(
	@XML1 VARCHAR(MAX),
	@AlertId INT,
	@AlertType VARCHAR(20),
	@SRUsertpy BIT,
	@SRGrouptyp BIT,
	@UserName NVARCHAR(50),
	@SchedulePatternType VARCHAR(50),
	@Type VARCHAR(50),
	@LicenceCnt INT,
	@TargetCnt INT
)
AS
BEGIN TRANSACTION

	DECLARE @Status INT, @Message VARCHAR(500), @DeskbarId VARCHAR(MAX),@MobileNo VARCHAR(MAX),@AcknoledgrButton BIT;
	DECLARE @EmailIds VARCHAR(MAX);
	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'root/UserDetail';
	DECLARE @ResultString VARCHAR(MAX) = NULL; 

	SELECT @Message = 'Not Done', @Status = 0;
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;

	BEGIN
		UPDATE tbl_Alert_popUp
		SET AlertType = @AlertType, SRUsertpy = @SRUsertpy, SRGrouptyp = @SRGrouptyp, [Status] = 'Send'
		WHERE AlertId = @AlertId;

		IF (@@error <> 0) GOTO QuitWithRollback

		SELECT @AcknoledgrButton = ISNULL(tau.AcknoledgrButton,0)
		FROM tbl_Alert_popUp tau WITH(NOLOCK) WHERE tau.AlertId = @AlertId;
        
		INSERT INTO tbl_Send_Alert_User
		(
			AlertId, UserId, UserName, EntryBy, EntryDate,
			UserType, [Status], IsAcknowledge, AcknowledgeDate
		)
		SELECT
			@AlertId, UserId, UserName, @UserName, GETDATE(),
			UserType, 'Schedule' , 0, NULL
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			AlertId INT 'Alertid',
			UserId INT 'UserId',
			UserName VARCHAR(200) 'UserName',
			UserType VARCHAR(50) 'UserType'
		)
		IF (@@error <> 0) GOTO QuitWithRollback
	END
        
	SELECT @ResultString = STRING_AGG(tsau.UserId, ',')	FROM tbl_Send_Alert_User tsau WITH(NOLOCK)
	WHERE AlertId = @AlertId AND tsau.UserType = 'User';
         
	SELECT @ResultString = COALESCE(@ResultString + ',', '') + dbo.DistinctCommaSeperatedList(dbo.UFN_Get_Active_UsersFromGroup_SubGroup(UserId), ',')
	FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE AlertId = @AlertId AND tsau.UserType = 'Group';

	--SELECT @ResultString         
	--SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString,','));

	SELECT @DeskbarId = STRING_AGG(tu.deskbar_id, ',') FROM Tbl_Users tu WITH(NOLOCK)
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','));
        
	SELECT @MobileNo = STRING_AGG('+'+tu.mobile_phone, '') FROM Tbl_Users tu WITH(NOLOCK)
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','));

	SELECT @EmailIds = STRING_AGG(TUS.email, ',') FROM Tbl_Users TUS WITH(NOLOCK)
	WHERE TUS.id IN (SELECT * FROM dbo.SplitString(@ResultString, ',')) AND ISNULL(TUS.email,'') <> '';
      
	IF(@SchedulePatternType ='Now')
	BEGIN
		UPDATE tbl_Send_Alert_User SET Status='Send' WHERE Alertid=@AlertId
	END
         
	SELECT @Status = 1 ,@Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status, DeskbarId = @DeskbarId, [type] = @Type, MobileNo = @MobileNo, EmailIds = @EmailIds;

COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
	IF (@@trancount > 0)
	ROLLBACK TRANSACTION
	BEGIN
		SELECT [MESSAGE] = @Message, [STATUS] = @Status, [type] = @Type, MobileNo = '', EmailIds = '';
	END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_AlertPopUpStap2_Submit_BKP_18Nov21]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_AlertPopUpStap2_Submit_BKP_18Nov21]
(
	@XML1 VARCHAR(MAX),
	@AlertId INT,
	@AlertType VARCHAR(20),
	@SRUsertpy BIT,
	@SRGrouptyp BIT,
	@UserName NVARCHAR(50),
	@SchedulePatternType VARCHAR(50),
	@Type VARCHAR(50),
	@LicenceCnt INT,
	@TargetCnt INT
)
AS        
BEGIN TRANSACTION

DECLARE @Status INT, @Message VARCHAR(500), @DeskbarId VARCHAR(MAX),@MobileNo VARCHAR(MAX),@AcknoledgrButton BIT;
DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'root/UserDetail';

SELECT @Message = 'Not Done' ,@Status = 0;
EXEC sp_xml_preparedocument @hdoc1 OUTPUT ,@XML1;

BEGIN
	UPDATE tbl_Alert_popUp
	SET AlertType = @AlertType ,SRUsertpy = @SRUsertpy,SRGrouptyp = @SRGrouptyp, Status = 'Send'
	WHERE AlertId = @AlertId
          
	IF (@@error <> 0) GOTO QuitWithRollback        
	SELECT @AcknoledgrButton = ISNULL(tau.AcknoledgrButton,0) FROM tbl_Alert_popUp tau WHERE tau.AlertId = @AlertId        
        
	INSERT INTO tbl_Send_Alert_User (AlertId, UserId, UserName, EntryBy, EntryDate, UserType,Status,IsAcknowledge,AcknowledgeDate)        
	SELECT @AlertId ,UserId ,UserName ,@UserName ,GETDATE() ,UserType,'Schedule',0,NULL        
	FROM OPENXML(@hdoc1, @hdocName, 2)        
	WITH        
	(        
		AlertId INT 'Alertid',         
		UserId INT 'UserId',         
		UserName VARCHAR(200) 'UserName',         
		UserType VARCHAR(50) 'UserType'        
	)        
	IF (@@error <> 0) GOTO QuitWithRollback        
END        
        
	DECLARE @ResultString VARCHAR(MAX) = NULL;        
	SELECT @ResultString = STRING_AGG(tsau.UserId, ',')        
	FROM tbl_Send_Alert_User tsau        
	WHERE AlertId = @AlertId AND tsau.UserType = 'User'        
         
	SELECT @ResultString = COALESCE(@ResultString + ',', '') + dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(UserId), ',')        
	FROM tbl_Send_Alert_User tsau        
	WHERE AlertId = @AlertId AND tsau.UserType = 'Group';

	--SELECT @ResultString         
	--SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString,','));

	SELECT @DeskbarId = STRING_AGG(tu.deskbar_id, ',')        
	FROM Tbl_Users tu        
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','))        
        
	SELECT @MobileNo = STRING_AGG('+'+tu.mobile_phone, ',')        
	FROM Tbl_Users tu        
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','))      
      
	IF(@SchedulePatternType ='Now')        
	BEGIN        
	 UPDATE tbl_Send_Alert_User SET Status='Send' WHERE Alertid=@AlertId        
	END        
         
	SELECT @Status = 1 ,@Message = 'Done'        
	SELECT MESSAGE = @Message ,STATUS = @Status ,DeskbarId = @DeskbarId,Type=@Type ,MobileNo=@MobileNo      
	COMMIT TRANSACTION        
	GOTO EndSave        
	QuitWithRollback:        
	IF (@@trancount > 0)        
		ROLLBACK TRANSACTION        
	BEGIN        
		SELECT MESSAGE = @Message ,STATUS = @Status,type=@Type        
	END        
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_AlertPopUpStap2_Submit_Dec2023]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_AlertPopUpStap2_Submit
*/
CREATE PROCEDURE [dbo].[Usp_AlertPopUpStap2_Submit_Dec2023]
(
	@XML1 VARCHAR(MAX),
	@AlertId INT,
	@AlertType VARCHAR(20),
	@SRUsertpy BIT,
	@SRGrouptyp BIT,
	@UserName NVARCHAR(50),
	@SchedulePatternType VARCHAR(50),
	@Type VARCHAR(50),
	@LicenceCnt INT,
	@TargetCnt INT
)
AS
BEGIN
	BEGIN TRANSACTION

	DECLARE @Status INT, @Message VARCHAR(500), @DeskbarId VARCHAR(MAX);
	DECLARE @MobileNo VARCHAR(MAX), @AcknoledgrButton BIT;
	DECLARE @EmailIds VARCHAR(MAX), @ResultString VARCHAR(MAX) = NULL;
	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'root/UserDetail';

	SELECT @Message = 'Not Done', @Status = 0;
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;

	BEGIN
		UPDATE tbl_Alert_popUp SET
			AlertType = @AlertType,
			SRUsertpy = @SRUsertpy,
			SRGrouptyp = @SRGrouptyp,
			[Status] = 'Send'
		WHERE AlertId = @AlertId;
		IF (@@error <> 0) GOTO QuitWithRollback

		SELECT
			@AcknoledgrButton = ISNULL(tau.AcknoledgrButton,0)
		FROM tbl_Alert_popUp tau WITH(NOLOCK)
		WHERE tau.AlertId = @AlertId;
        
		INSERT INTO tbl_Send_Alert_User
		(
			AlertId, UserId, UserName,
			EntryBy, EntryDate, UserType,
			[Status], IsAcknowledge, AcknowledgeDate
		)
		SELECT
			@AlertId, UserId, UserName,
			@UserName, GETDATE(), UserType,
			'Schedule', 0 ,NULL
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			AlertId INT 'Alertid',
			UserId INT 'UserId',
			UserName VARCHAR(200) 'UserName',
			UserType VARCHAR(50) 'UserType'
		)
		IF (@@error <> 0) GOTO QuitWithRollback
	END
	
	SELECT @ResultString = STRING_AGG(tsau.UserId, ',')
	FROM tbl_Send_Alert_User tsau WITH(NOLOCK)
	WHERE AlertId = @AlertId AND tsau.UserType = 'User';
      
	SELECT
		@ResultString = COALESCE(@ResultString + ',', '') + dbo.DistinctCommaSeperatedList
		(
			dbo.UFN_Get_Active_UsersFromGroup_SubGroup(UserId), ','
		)
	FROM tbl_Send_Alert_User tsau WITH(NOLOCK)
	WHERE AlertId = @AlertId AND tsau.UserType = 'Group';

	/* --SELECT @ResultString
	--SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE
	tu.id IN (SELECT * FROM dbo.SplitString(@ResultString,',')); */

	/*---------- START : Return LastLoginDate Wise DeskbarId ----------*/
	SELECT
		@DeskbarId = STRING_AGG(tu.deskbar_id, ',') WITHIN GROUP (ORDER BY ISNULL(tu.last_date,'') DESC)
	FROM Tbl_Users tu WITH(NOLOCK)
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','));
	/*---------- END : Return LastLoginDate Wise DeskbarId ----------*/

	/*---------- START : Get Customer Liecense Count Wise Return MobileNumber ----------*/
	SELECT
		@MobileNo = STRING_AGG('+' + tu.mobile_phone, ',') WITHIN GROUP (ORDER BY ISNULL(tu.last_date,'') DESC)
	FROM Tbl_Users tu WITH(NOLOCK)
	WHERE tu.id IN (SELECT DISTINCT * FROM dbo.SplitString(@ResultString, ','))
	AND ISNULL(tu.mobile_phone,'') <> '' AND tu.mobile_phone IS NOT NULL;

	DECLARE @ListOfMobileNumber TABLE(SrNo INT NOT NULL IDENTITY(1,1), MobileNumber VARCHAR(50));
	INSERT INTO @ListOfMobileNumber
	SELECT DISTINCT * FROM dbo.SplitString(@MobileNo,',');
	
	SELECT TOP(ISNULL(@LicenceCnt,0))
		@MobileNo = STRING_AGG(MobileNumber, ',')
	FROM @ListOfMobileNumber;
	/*---------- END : Get Customer Liecense Count Wise Return MobileNumber ----------*/

	/*---------- START : Return LastLoginDate Wise E-Mail ID ----------*/
	SELECT
		@EmailIds = STRING_AGG(TUS.email, ',') WITHIN GROUP (ORDER BY ISNULL(TUS.last_date,'') DESC)
	FROM Tbl_Users TUS WITH(NOLOCK)
	WHERE TUS.id IN (SELECT DISTINCT * FROM dbo.SplitString(@ResultString, ','))
	AND ISNULL(TUS.email,'') <> '' AND TUS.email IS NOT NULL;
	/*---------- END : Return LastLoginDate Wise E-Mail ID ----------*/

	IF(@SchedulePatternType ='Now')
	BEGIN
		UPDATE tbl_Send_Alert_User SET [Status] = 'Send' WHERE Alertid = @AlertId;
	END
         
	UPDATE tbl_Send_Alert_User SET ScheduleTime = (SELECT OnceStartDateTime FROm tbl_Alert_Schedule_Setting WHERE Alertid = @AlertId) WHERE Alertid = @AlertId;
    UPDATE tbl_Send_Alert_User SET ScheduleEndTime = (SELECT OnceEndDateTime FROm tbl_Alert_Schedule_Setting WHERE Alertid = @AlertId) WHERE Alertid = @AlertId;
      
	SELECT @Status = 1, @Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status, DeskbarId = @DeskbarId, [type] = @Type, MobileNo = @MobileNo, EmailIds = @EmailIds;

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
		IF (@@trancount > 0)
		ROLLBACK TRANSACTION
		BEGIN
			SELECT [MESSAGE] = @Message, [STATUS] = @Status, [type] = @Type, MobileNo = '', EmailIds = '';
		END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AlertStep2Submit_MainTable]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Exec USP_AlertStep2Submit_MainTable '7C79C84C-7833-4978-AB95-8E22D36D3B47','CYGNUSTEAM ' 
*/
CREATE PROC [dbo].[USP_AlertStep2Submit_MainTable] @DeskbarId VARCHAR(MAX),
@BaseUserName VARCHAR(50)
AS
BEGIN

	DECLARE @TEMPALERT TABLE (
		ID [INT] IDENTITY (1, 1) NOT NULL
	   ,Alertid INT
	   ,UserId INT
	   ,UserName VARCHAR(200)
	)

	DECLARE @tblCount INT
		   ,@index INT
	DECLARE @userId1 INT

	SET @userId1 = (SELECT
			dbo.fnGetUserIdByDeskbarId(@DeskbarId))
	INSERT INTO @TEMPALERT (Alertid, UserId, UserName)
		SELECT
			Alertid
		   ,UserId
		   ,dbo.fnGetUserNameFromId(UserId)
		FROM tbl_Send_Alert_Offline_user
		WHERE UserId = @userId1

	SELECT
		*
	FROM @TEMPALERT
	INSERT INTO tbl_Send_Alert_User (Alertid, UserId, UserName, UserType, Status, EntryBy, EntryDate)

		SELECT
			Alertid
		   ,UserId
		   ,dbo.fnGetUserNameFromId(UserId)
		   ,'User'
		   ,'Send'
		   ,EntryBy
		   ,GETDATE()
		FROM tbl_Send_Alert_Offline_user
		WHERE Alertid IN (SELECT
				Alertid
			FROM tbl_Alert_popUp
			WHERE Alertid IN (SELECT
					Alertid
				FROM @TEMPALERT)
			AND PendingRecepient > 0
			AND UserId = @userId1)

	UPDATE tbl_Alert_popUp
	SET PendingRecepient = PendingRecepient - 1
	WHERE Alertid = (SELECT
			Alertid
		FROM tbl_Send_Alert_Offline_user
		WHERE Alertid IN (SELECT
				Alertid
			FROM tbl_Alert_popUp
			WHERE Alertid IN (SELECT
					Alertid
				FROM @TEMPALERT)
			AND PendingRecepient > 0
			AND UserId = @userId1))
	DELETE FROM @TEMPALERT
	WHERE Alertid IN (SELECT
				Alertid
			FROM tbl_Alert_popUp
			WHERE Alertid IN (SELECT
					Alertid
				FROM @TEMPALERT)
			AND PendingRecepient > 0)

	SET @tblCount = (SELECT
			COUNT(*)
		FROM @TEMPALERT)
	SET @index = 0;
	WHILE (@index < @tblCount)

	BEGIN
	INSERT INTO tbl_Send_Alert_User (Alertid, UserId, UserName, UserType, Status, EntryBy, EntryDate)
		SELECT
			Alertid
		   ,UserId
		   ,UserName
		   ,'User'
		   ,'Send'
		   ,@BaseUserName
		   ,GETDATE()
		FROM @TEMPALERT
		WHERE ID = @index
	SET @index = @index + 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Block_Customer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Block_Customer]
@Id varchar(100)
AS
 BEGIN  
	 DECLARE @Status INT ,@Message VARCHAR(500)
	 SELECT @Message = 'Not Done' ,@Status = 0 
	 BEGIN
	      UPDATE Tbl_Master_Users SET IsBlock=1 WHERE UserId=@Id
	 END
		SELECT @Status = 1 ,@Message = 'Done'  
 BEGIN    
  SELECT MESSAGE = @Message ,STATUS = @Status 
 END  
 END
GO
/****** Object:  StoredProcedure [dbo].[USP_BlockUnblock_Customer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
==============================================================
DESCRIPTION : Block/Unblock Customer Wise Users
==============================================================
EXEC USP_BlockUnblock_Customer 'jack@gmail.com','6','B'
EXEC USP_BlockUnblock_Customer 'jack@gmail.com','6','UB'
==============================================================
*/
CREATE PROCEDURE [dbo].[USP_BlockUnblock_Customer]
(
	@CustEmail VARCHAR(200),
	@CustomerId INT,
	@Flag VARCHAR(50)
)
AS
BEGIN
	DECLARE @Status INT, @Message VARCHAR(MAX), @UpdateFlag VARCHAR(50);
	SELECT @Message = 'Not Done', @Status = 0;

	BEGIN TRANSACTION
	BEGIN TRY
		IF(@Flag = 'B')
		BEGIN
			UPDATE Tbl_Master_Users SET IsBlock = 1 WHERE CustomerId = @CustomerId;
			SELECT @Message = 'Done', @Status = 1, @UpdateFlag = 'Block';
		END
		ELSE
		BEGIN
			UPDATE Tbl_Master_Users SET IsBlock = 0 WHERE CustomerId = @CustomerId;
			SELECT @Message = 'Done', @Status = 1, @UpdateFlag = 'Un-Block';
		END
		
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @Message = 'Not Done', @Status = 0, @UpdateFlag = '';
		ROLLBACK TRANSACTION
	END CATCH
	
	SELECT [Message] = @Message, [Status] = @Status, [UpdateFlag] = @UpdateFlag;
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_CalledServices]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_CalledServices]        
@SaveXMLString Text            
,@ModuleName varchar(500)        
,@Succes varchar(500)        
,@ErrorMessage varchar(max)        
  
AS                  
BEGIN          
  
DECLARE @Status VARCHAR(500), @Message VARCHAR(500)                                                                      
  
BEGIN TRANSACTION                                  
  
INSERT INTO  CYGNUS_Called_GCServices (String,ModuleName,Succes,ErrorMessage,EntryDate)        
SELECT @SaveXMLString,@ModuleName,@Succes,@ErrorMessage,GETDATE()        
        
IF (@@ERROR <> 0 ) GOTO QuitWithRollback         
  
  
COMMIT TRANSACTION                  
                  
SELECT @Message='Done',@Status='1'                  
                  
GOTO EndSave                  
                  
QuitWithRollback:                  
                  
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION                  
                  
SELECT @Status ='0',@Message = 'NotDone'                  
                  
EndSave:                  
                  
SELECT Status=@Status,Message=@Message            
                  
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_ChangePassword]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_ChangePassword]
@Password Varchar(MAX),
@UserName Varchar(50)
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@UserName<>'')
	BEGIN
		UPDATE Tbl_Master_Users SET UserPwd=@Password WHERE UserId=@UserName
		
	END
        SELECT @Status = 1, @Message = 'Done'
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[USP_Check_Alert_Ticker_Acknowledgement_Availability]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Check_Alert_Ticker_Acknowledgement_Availability]
@AlertId INT,
@Username VARCHAR(10)
/* Old Params
	@SAUseId INT,
	@Type VARCHAR(10)
*/
AS
BEGIN
	DECLARE @Message VARCHAR(MAX) = 'Available'
	--IF NOT EXISTS(SELECT * FROM tbl_Send_Alert_User tsau WHERE tsau.Alertid = @AlertId AND tsau.UserName = @Username)
	--BEGIN
	--	SET @Message = 'Record not found.'
	--END
	--ELSE IF EXISTS(SELECT * FROM tbl_Send_Alert_User tsau WHERE tsau.Alertid = @AlertId AND tsau.UserName = @Username AND ISNULL(tsau.IsAcknowledge,0) = 1 AND ISNULL(tsau.AcknowledgeDate,'') <> '')
	--BEGIN
	--	SET @Message = 'Acknowledgement already done.'
	--END
	SELECT @Message
	/*
	IF(@Type = 'A')
	BEGIN
		IF NOT EXISTS(SELECT * FROM tbl_Send_Alert_User tsau WHERE tsau.SAUseId = @SAUseId)
		BEGIN
			SET @Message = 'Record not found.'
		END
		ELSE IF EXISTS(SELECT * FROM tbl_Send_Alert_User tsau WHERE tsau.SAUseId = @SAUseId AND ISNULL(tsau.IsAcknowledge,0) = 1 AND ISNULL(tsau.AcknowledgeDate,'') <> '')
		BEGIN
			SET @Message = 'Acknowledgement already done.'
		END
		SELECT @Message
	END
	IF(@Type = 'T')
	BEGIN
		IF NOT EXISTS(SELECT * FROM tbl_Send_Ticker_User tstu WHERE tstu.SAUseId = @SAUseId)
		BEGIN
			SET @Message = 'Record not found.'
		END
		ELSE IF EXISTS(SELECT * FROM tbl_Send_Ticker_User tstu WHERE tstu.SAUseId = @SAUseId AND ISNULL(tstu.IsAcknowledge,0) = 1 AND ISNULL(tstu.AcknowledgeDate,'') <> '')
		BEGIN
			SET @Message = 'Acknowledgement already done.'
		END
		SELECT @Message
	END
	*/
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_CheckDuplicateContentManager]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
EXEC Usp_CheckDuplicateContentManager 'South'
*/  
CREATE PROC [dbo].[Usp_CheckDuplicateContentManager] 
@UserName VARCHAR(50)   
AS      
SET NOCOUNT ON;  
BEGIN      
	SELECT COUNT(*) FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId=LTRIM(RTRIM(@UserName))
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_CheckDuplicatePermissionlevelName]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
EXEC Usp_CheckDuplicateContentManager 'South'
*/  
CREATE PROC [dbo].[Usp_CheckDuplicatePermissionlevelName] 
@PermissionlevelName VARCHAR(50)   
AS      
SET NOCOUNT ON;  
BEGIN      
	SELECT COUNT(*) FROM Tbl_Permission WITH(NOLOCK) WHERE PermissionName=LTRIM(RTRIM(@PermissionlevelName))
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckValidUserforLogin]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_CheckValidUserforLogin]
(
	@UserName VARCHAR(100),
	@Loccode VARCHAR(100) = NULL,
	@FinYear VARCHAR(100) = NULL,
	@CompanyCode VARCHAR(100) = NULL
)
AS
BEGIN
	DECLARE @Error INT = 0, @Message NVARCHAR(MAX) = '', @IsPasswordExpired VARCHAR(10), @LastLoginDateDiff INT;
	DECLARE @CustomerId INT, @LicenseCount INT;
	SELECT @LastLoginDateDiff = DATEDIFF(HOUR, LastLoginDate,GETDATE()) FROM Tbl_Master_Users TMU WITH(NOLOCK) WHERE TMU.UserId = @Username;

	IF EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(IsBlock, 0) = 1)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Your Account is block, Please contact your administrator.';
	END
	ELSE IF NOT EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Invalid Username or Password.';
	END
	ELSE IF NOT EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Your Account is deactivted, Please contact your administrator.';
	END
	ELSE IF EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(IsBlock, 0) = 1)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Your Account is block, Please contact your administrator.';
	END
	ELSE IF EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		UPDATE Tbl_Master_Users SET LastLoginDate = GETDATE() WHERE UserId = @UserName;
	END

	IF ((SELECT CAST(ISNULL(IsPasswordExpired, 1) AS INT) FROM Tbl_Master_Users WHERE UserId = @UserName) = 1)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Password is Expired, Please contact your administrator.';
	END

	SELECT @Error AS Error, @Message AS [Message];

	/*---------- Start : Get CustomerWise Liecense Count ----------*/
	SELECT @CustomerId = ISNULL(TMU.CustomerId,0) FROM Tbl_Master_Users TMU WITH(NOLOCK) WHERE TMU.UserId = @UserName;
	IF (ISNULL(@CustomerId, 0) > 0)
	BEGIN
		SELECT @LicenseCount = CAST(tcr.LicenseCount AS INT)
		FROM tbl_CustomerRegistration tcr WITH(NOLOCK)
		WHERE ISNULL(tcr.CustomerId, 0) = @CustomerId;
	END
	ELSE
	BEGIN
		SELECT @LicenseCount = COUNT(*)
		FROM Tbl_Users tu WITH(NOLOCK)
		WHERE ISNULL(tu.Iscancel, 0) = 0 AND ISNULL(tu.ParentCustID, 0) = @CustomerId;
	END
	/*---------- End : Get CustomerWise Liecense Count ----------*/

	SELECT
		ISNULL(WMU.CustomerId, 0) AS TenantId,
		XX.ToolList,
		XX.PermissionTyp,
		XX.Targeting,
		XX.Viewing,
		WMU.User_Image,
		WMU.User_Type,
		WMU.Id AS BaseUserId,
		LastLoginDateDiff = ISNULL(@LastLoginDateDiff,0),
		DaysRemaining = (CASE WHEN ISNULL(WMU.CustomerId, 0) = 0 THEN 365 ELSE (CASE WHEN DATEDIFF(d, GETDATE(), ExpiresDate) < 0 THEN 0 ELSE DATEDIFF(d, GETDATE(), ExpiresDate) END) + 1 END),
		IsExpired = (CASE WHEN ISNULL(WMU.CustomerId, 0) = 0 THEN 0 ELSE (CASE WHEN GETDATE() <= TCR.ExpiresDate + ' 23:59:59' THEN 0 ELSE 1 END) END),
		CompanyName = (CASE WHEN ISNULL(TCR.CompanyName,'') = '' THEN @UserName ELSE TCR.CompanyName END),
		FullName = (CASE WHEN ISNULL(WMU.Name,'') = '' THEN @UserName ELSE WMU.Name+' '+ISNULL(WMU.LastName,'') END),
		CompanyLogo = DS.CompanyLogo,
		LicenseCount = @LicenseCount,
		WMU.MFAEnabled,
		WMU.EmailId
	FROM Tbl_Master_Users WMU WITH(NOLOCK)
	LEFT OUTER JOIN tbl_CustomerRegistration TCR ON WMU.CustomerId = TCR.CustomerId
	LEFT OUTER JOIN tbl_Alert_Ticker_Default_Setting DS WITH(NOLOCK) ON DS.CoustomerId = ISNULL(WMU.CustomerId,0)
	CROSS APPLY
	(
		SELECT
			Tps.ToolList,
			PermissionTyp = (CASE WHEN TP.Administator = 1 THEN 'Administator' WHEN TP.ContentManager = 1 THEN 'ContentManager' WHEN TP.[Custom] = 1 THEN 'Custom' END),
			Targeting = (CASE WHEN Tps.IsEntireOrganization = 1 THEN 'EntireOrganization' WHEN Tps.IsCoustomize = 1 THEN 'Coustomize' END),
			Viewing = (CASE WHEN Tps.Personal = 1 THEN 'Personal' WHEN Tps.FullViewing = 1 THEN 'FullViewing' WHEN TP.ContentManager = 1 THEN 'FullViewing' END)
		FROM Tbl_Permission TP WITH(NOLOCK)
		INNER JOIN Tbl_PermissionSettings Tps ON TP.Id = Tps.PermissionId WHERE TP.Id = WMU.AccessLevel
	) XX
	WHERE WMU.UserId = @UserName AND ISNULL(WMU.Iscancel, 0) = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckValidUserforLogin_BKP]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
 EXEC USP_CheckValidUserforLogin 'XCOMMS','','',''        
 EXEC USP_CheckValidUserforLogin 'CYGNUSTEAM','','',''        
 EXEC USP_CheckValidUserforLogin 'ashokgankoliya@gmail.com','','',''        
*/
CREATE PROCEDURE [dbo].[USP_CheckValidUserforLogin_BKP] 
@UserName VARCHAR(100),
@Loccode VARCHAR(100) = NULL,
@FinYear VARCHAR(100) = NULL,
@CompanyCode VARCHAR(100) = NULL
AS
BEGIN
	DECLARE @Error INT = 0
		   ,@Message NVARCHAR(MAX) = ''
		   ,@IsPasswordExpired VARCHAR(10)
		   ,@LastLoginDateDiff INT

	SELECT @LastLoginDateDiff = DATEDIFF(HOUR,LastLoginDate,GETDATE()) FROM Tbl_Master_Users WHERE UserId=@Username

	IF EXISTS (SELECT * FROM Tbl_Master_Users WITH (NOLOCK) WHERE UserId = @UserName AND ISNULL(IsBlock, 0) = 1)
	BEGIN
		SET @Error = 1
		SET @Message = 'Your Account is block, Please contact your administrator.'
	END
	ELSE IF NOT EXISTS (SELECT * FROM Tbl_Master_Users WITH (NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		SET @Error = 1
		SET @Message = 'Invalid Username or Password.'
	END
	ELSE IF NOT EXISTS (SELECT * FROM Tbl_Master_Users WITH (NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		SET @Error = 1
		SET @Message = 'Your Account is deactivted, Please contact your administrator.'
	END
	ELSE IF EXISTS (SELECT * FROM Tbl_Master_Users WITH (NOLOCK) WHERE UserId = @UserName AND ISNULL(IsBlock, 0) = 1)
	BEGIN
		SET @Error = 1
		SET @Message = 'Your Account is block, Please contact your administrator.'
	END
	ELSE IF EXISTS (SELECT * FROM Tbl_Master_Users WITH (NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		UPDATE Tbl_Master_Users SET LastLoginDate = GETDATE() WHERE UserId = @UserName
	END

	IF ((SELECT CAST(ISNULL(IsPasswordExpired, 1) AS INT) FROM Tbl_Master_Users WHERE UserId = @UserName) = 1)
	BEGIN
		SET @Error = 1
		SET @Message = 'Password is Expired, Please contact your administrator.'
	END

	SELECT @Error AS Error ,@Message AS Message

	SELECT
		ISNULL(WMU.CustomerId, 0) AS TenantId ,XX.ToolList ,XX.PermissionTyp ,Targeting ,Viewing ,User_Image ,User_Type ,WMU.Id AS BaseUserId ,LastLoginDateDiff = @LastLoginDateDiff 
		,DaysRemaining = CASE WHEN ISNULL(WMU.CustomerId, 0) = 0 THEN 365 ELSE (CASE WHEN DATEDIFF(d, GETDATE(), ExpiresDate) < 0 THEN 0 ELSE DATEDIFF(d, GETDATE(), ExpiresDate) END) + 1 END
	   ,IsExpired = (CASE WHEN ISNULL(WMU.CustomerId, 0) = 0 THEN 0 ELSE (CASE WHEN GETDATE() <= b.ExpiresDate + ' 23:59:59' THEN 0 ELSE 1 END) END),
	   CompanyName = (CASE WHEN ISNULL(b.CompanyName,'') = '' THEN @UserName ELSE b.CompanyName END),
	   FullName = (CASE WHEN ISNULL(WMU.Name,'') = '' THEN @UserName ELSE WMU.Name+' '+ISNULL(WMU.LastName,'') END) 
	FROM Tbl_Master_Users WMU WITH (NOLOCK)
	LEFT OUTER JOIN tbl_CustomerRegistration b
		ON WMU.CustomerId = b.CustomerId
	CROSS APPLY (SELECT Tps.ToolList ,PermissionTyp = (CASE WHEN a.Administator = 1 THEN 'Administator' WHEN a.ContentManager = 1 THEN 'ContentManager' WHEN a.Custom = 1 THEN 'Custom' END)
			,Targeting = (CASE WHEN Tps.IsEntireOrganization = 1 THEN 'EntireOrganization' WHEN Tps.IsCoustomize = 1 THEN 'Coustomize' END)
			,Viewing = (CASE WHEN Tps.Personal = 1 THEN 'Personal' WHEN Tps.FullViewing = 1 THEN 'FullViewing' WHEN a.ContentManager = 1 THEN 'FullViewing' END)
		FROM Tbl_Permission a
		INNER JOIN Tbl_PermissionSettings Tps
			ON a.Id = Tps.PermissionId
		WHERE a.Id = WMU.AccessLevel) XX
	--OUTER APPLY
	--(
	--  SELECT IsExpired=CASE WHEN GETDATE()+1<=Cust.ExpiresDate+ ' 23:59:59'  THEN 0 ELSE 1 END
	--  FROM tbl_CustomerRegistration Cust WHERE Cust.CompanyName=@UserName
	--)Cust        
	WHERE WMU.UserId = @UserName
	AND ISNULL(Iscancel, 0) = 0
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckValidUserforLogin_BKP_CR]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
	EXEC USP_CheckValidUserforLogin 'XCOMMS','','',''
	EXEC USP_CheckValidUserforLogin 'CYGNUSTEAM','','',''
	EXEC USP_CheckValidUserforLogin 'ashokgankoliya@gmail.com','','',''
*/
CREATE PROCEDURE [dbo].[USP_CheckValidUserforLogin_BKP_CR]
(
	@UserName VARCHAR(100),
	@Loccode VARCHAR(100) = NULL,
	@FinYear VARCHAR(100) = NULL,
	@CompanyCode VARCHAR(100) = NULL
)
AS
BEGIN
	DECLARE @Error INT = 0, @Message NVARCHAR(MAX) = '', @IsPasswordExpired VARCHAR(10), @LastLoginDateDiff INT;
	DECLARE @CustomerId INT, @LicenseCount INT;
	SELECT @LastLoginDateDiff = DATEDIFF(HOUR, LastLoginDate,GETDATE()) FROM Tbl_Master_Users TMU WITH(NOLOCK) WHERE TMU.UserId = @Username;

	IF EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(IsBlock, 0) = 1)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Your Account is block, Please contact your administrator.';
	END
	ELSE IF NOT EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Invalid Username or Password.';
	END
	ELSE IF NOT EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Your Account is deactivted, Please contact your administrator.';
	END
	ELSE IF EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(IsBlock, 0) = 1)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Your Account is block, Please contact your administrator.';
	END
	ELSE IF EXISTS (SELECT * FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @UserName AND ISNULL(Iscancel, 0) = 0)
	BEGIN
		UPDATE Tbl_Master_Users SET LastLoginDate = GETDATE() WHERE UserId = @UserName;
	END

	IF ((SELECT CAST(ISNULL(IsPasswordExpired, 1) AS INT) FROM Tbl_Master_Users WHERE UserId = @UserName) = 1)
	BEGIN
		SET @Error = 1;
		SET @Message = 'Password is Expired, Please contact your administrator.';
	END

	SELECT @Error AS Error, @Message AS [Message];

	/*---------- Start : Get CustomerWise Liecense Count ----------*/
	SELECT @CustomerId = ISNULL(TMU.CustomerId,0) FROM Tbl_Master_Users TMU WITH(NOLOCK) WHERE TMU.UserId = @UserName;
	IF (ISNULL(@CustomerId, 0) > 0)
	BEGIN
		SELECT @LicenseCount = CAST(tcr.LicenseCount AS INT)
		FROM tbl_CustomerRegistration tcr WITH(NOLOCK)
		WHERE ISNULL(tcr.CustomerId, 0) = @CustomerId;
	END
	ELSE
	BEGIN
		SELECT @LicenseCount = COUNT(*)
		FROM Tbl_Users tu WITH(NOLOCK)
		WHERE ISNULL(tu.Iscancel, 0) = 0 AND ISNULL(tu.ParentCustID, 0) = @CustomerId;
	END
	/*---------- End : Get CustomerWise Liecense Count ----------*/

	SELECT
		ISNULL(WMU.CustomerId, 0) AS TenantId,
		XX.ToolList,
		XX.PermissionTyp,
		XX.Targeting,
		XX.Viewing,
		WMU.User_Image,
		WMU.User_Type,
		WMU.Id AS BaseUserId,
		LastLoginDateDiff = @LastLoginDateDiff,
		DaysRemaining = (CASE WHEN ISNULL(WMU.CustomerId, 0) = 0 THEN 365 ELSE (CASE WHEN DATEDIFF(d, GETDATE(), ExpiresDate) < 0 THEN 0 ELSE DATEDIFF(d, GETDATE(), ExpiresDate) END) + 1 END),
		IsExpired = (CASE WHEN ISNULL(WMU.CustomerId, 0) = 0 THEN 0 ELSE (CASE WHEN GETDATE() <= TCR.ExpiresDate + ' 23:59:59' THEN 0 ELSE 1 END) END),
		CompanyName = (CASE WHEN ISNULL(TCR.CompanyName,'') = '' THEN @UserName ELSE TCR.CompanyName END),
		FullName = (CASE WHEN ISNULL(WMU.Name,'') = '' THEN @UserName ELSE WMU.Name+' '+ISNULL(WMU.LastName,'') END),
		CompanyLogo = DS.CompanyLogo,
		LicenseCount = @LicenseCount
	FROM Tbl_Master_Users WMU WITH(NOLOCK)
	LEFT OUTER JOIN tbl_CustomerRegistration TCR ON WMU.CustomerId = TCR.CustomerId
	LEFT OUTER JOIN tbl_Alert_Ticker_Default_Setting DS WITH(NOLOCK) ON DS.CoustomerId = ISNULL(WMU.CustomerId,0)
	CROSS APPLY
	(
		SELECT
			Tps.ToolList,
			PermissionTyp = (CASE WHEN TP.Administator = 1 THEN 'Administator' WHEN TP.ContentManager = 1 THEN 'ContentManager' WHEN TP.[Custom] = 1 THEN 'Custom' END),
			Targeting = (CASE WHEN Tps.IsEntireOrganization = 1 THEN 'EntireOrganization' WHEN Tps.IsCoustomize = 1 THEN 'Coustomize' END),
			Viewing = (CASE WHEN Tps.Personal = 1 THEN 'Personal' WHEN Tps.FullViewing = 1 THEN 'FullViewing' WHEN TP.ContentManager = 1 THEN 'FullViewing' END)
		FROM Tbl_Permission TP WITH(NOLOCK)
		INNER JOIN Tbl_PermissionSettings Tps ON TP.Id = Tps.PermissionId WHERE TP.Id = WMU.AccessLevel
	) XX
	WHERE WMU.UserId = @UserName AND ISNULL(WMU.Iscancel, 0) = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ClearHistory]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_ClearHistory '','',''
*/
CREATE PROCEDURE [dbo].[USP_ClearHistory]
(
	@Type VARCHAR(10) = 'All',
	@Id INT,
	@DeskbarId VARCHAR(100) = 'DA989DC7-CC53-430B-86BC-38ADE586EEDC'
)
AS
BEGIN
	IF(@Type = 'All')
	BEGIN
		UPDATE tbl_Send_Alert_User SET
			[Status] = 'Clear',ClearDate = GETDATE()
		WHERE SAUseId IN (SELECT tsau.SAUseId FROM tbl_Send_Alert_User tsau WITH(NOLOCK)
		INNER JOIN Tbl_Users tu WITH(NOLOCK) ON tu.id = tsau.UserId
		WHERE tu.deskbar_id = @DeskbarId AND [Status] = 'Send' AND ISNULL(tsau.IsReceived,0) = 1)
	END
	ELSE
	BEGIN
		UPDATE tbl_Send_Alert_User SET
			[Status] = 'Clear',
			ClearDate = GETDATE()
		WHERE SAUseId = @Id  AND ISNULL(IsReceived,0) = 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ContentManagerAnalticDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_ContentManagerAnalticDetail 'CYGNUSTEAM','1','27 Sep 2021','26 Oct 2021'
	EXEC USP_ContentManagerAnalticDetail 'xcomms','1','27 Sep 2021','26 Oct 2021'
*/
CREATE PROCEDURE [dbo].[USP_ContentManagerAnalticDetail]
(
	@UserId varchar(50),  
	@Type varchar(50),
	@Fromdate VARCHAR(50),
	@ToDate VARCHAR(50)
)
AS
BEGIN
	SELECT
		Recipientes.CNT AS NoOfRecipientes,
		tau.AlertId,
		AlertTitle = (CASE WHEN @Type = 3 THEN ISNULL(tau.[DESCRIPTION],tau.AlertBody) WHEN @Type = 7 THEN ISNULL(tau.[DESCRIPTION],tau.AlertBody) ELSE tau.AlertTital END),
		tau.AlertTital,
		Title = (CASE WHEN @Type = 3 THEN ISNULL(tau.[DESCRIPTION],tau.AlertBody) WHEN @Type = 7 THEN ISNULL(tau.[DESCRIPTION],tau.AlertBody) ELSE tau.AlertTital END),
		tau.EntryBy,tau.EntryDate
	FROM tbl_Alert_popUp tau
	CROSS APPLY      
	(      
		SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WHERE tsau.Alertid = tau.AlertId
	)Recipientes
	WHERE EntryBy=@UserId AND Type=@Type AND ISNULL(tau.Iscancel,0) = 0 AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ContentManagerList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
	EXEC USP_ContentManagerList '09 Jan 2022','07 Feb 2022','0','FullViewing','XCOMMS'
*/
CREATE PROCEDURE [dbo].[USP_ContentManagerList]
(
	@Fromdate VARCHAR(50),
	@ToDate VARCHAR(50),
	@TenantId INT,
	@BaseViewingType VARCHAR(200),
	@BaseUserId VARCHAR(200)
)
AS
BEGIN
	SELECT
		*
	FROM (SELECT
			TMU.UserId
		   ,TMU.Name
		   ,TMU.EntryDate
		   ,TMU.CustomerId
		   ,AlertCnt1.EntryBy,
		   Iscancel = ISNULL(TMU.Iscancel, 0)
		   ,CASE
				WHEN ISNULL(TMU.Iscancel, 0) = 0 THEN '<span class="label label-success">Yes</span>'
				ELSE '<span class="label label-danger">No</span>'
			END
			AS StatusDesc
		   ,TP.PermissionName AS AccesslevelDesc
		   ,ISNULL(TickerCnt.Count1, 0) AS TickerCnt
		   ,ISNULL(AlertCnt1.Count1, 0) AS AlertCnt
		   ,ISNULL(WallPaPerCnt1.Count1, 0) AS WallPaperCnt
		   ,ISNULL(ScreenSaverCnt1.Count1, 0) AS ScreenSaverCnt
		   ,ISNULL(LockScreenCnt1.Count1, 0) AS LockScreenCnt
		FROM Tbl_Master_Users(NOLOCK) TMU
		INNER JOIN Tbl_Permission(NOLOCK) TP
			ON Tp.Id = TMU.Accesslevel
		OUTER APPLY (SELECT DISTINCT
				a.EntryBy
			   ,COUNT(*) AS Count1
			FROM tbl_Alert_popUp a
			INNER JOIN Tbl_Master_Users b
				ON b.UserId = a.EntryBy
			WHERE a.Type = 2
			AND b.Accesslevel = Tp.Id
			AND a.EntryBy = TMU.UserId
			AND a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			AND ISNULL(a.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE a.CustomerId END) = (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE @TenantId END)
			AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE a.EntryBy END)
			--AND (CASE WHEN @TenantId =0  THEN '1' ELSE a.CustomerId  END ) =(CASE 
			--WHEN @TenantId=0 THEN '1' ELSE @TenantId END )       
			--AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' 
			--THEN @BaseUserId ELSE a.EntryBy  END)     
			GROUP BY a.EntryBy) TickerCnt
		OUTER APPLY (SELECT DISTINCT
				a.EntryBy
			   ,COUNT(*)
				AS Count1
			FROM tbl_Alert_popUp a
			INNER JOIN Tbl_Master_Users b
				ON b.UserId = a.EntryBy
			WHERE a.Type = 1
			AND b.Accesslevel = Tp.Id
			AND a.EntryBy = TMU.UserId
			AND a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			AND ISNULL(a.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE a.CustomerId END) = (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE @TenantId END)
			AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE a.EntryBy END)
			--AND (CASE WHEN @TenantId =0  THEN '1' ELSE a.CustomerId  END ) =(CASE WHEN 
			--@TenantId=0 THEN '1' ELSE @TenantId END )
			--AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' 
			--THEN @BaseUserId ELSE a.EntryBy  END)
			GROUP BY a.EntryBy) AlertCnt1
		OUTER APPLY (SELECT DISTINCT
				a.EntryBy
			   ,COUNT(*)
				AS Count1
			FROM tbl_Alert_popUp a
			INNER JOIN Tbl_Master_Users b
				ON b.UserId = a.EntryBy
			WHERE a.Type = 3
			AND b.Accesslevel = Tp.Id
			AND a.EntryBy = TMU.UserId
			AND a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			AND ISNULL(a.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE a.CustomerId END) = (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE @TenantId END)
			AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE a.EntryBy END)
			--AND (CASE WHEN @TenantId =0  THEN '1' ELSE a.CustomerId  END ) =(CASE 
			--WHEN @TenantId=0 THEN '1' ELSE @TenantId END )
			--AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' 
			--THEN @BaseUserId ELSE a.EntryBy  END)     
			GROUP BY a.EntryBy) WallPaPerCnt1
		OUTER APPLY (SELECT DISTINCT
				a.EntryBy
			   ,COUNT(*)
				AS Count1
			FROM tbl_Alert_popUp a
			INNER JOIN Tbl_Master_Users b
				ON b.UserId = a.EntryBy
			WHERE a.Type = 4
			AND b.Accesslevel = Tp.Id
			AND a.EntryBy = TMU.UserId
			AND a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			AND ISNULL(a.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE a.CustomerId END) = (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE @TenantId END)
			AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE a.EntryBy END)
			--AND (CASE WHEN @TenantId =0  THEN '1' ELSE a.CustomerId  END ) =(CASE 
			--WHEN @TenantId=0 THEN '1' ELSE @TenantId END )       
			--AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' 
			--THEN @BaseUserId ELSE a.EntryBy  END)     
			GROUP BY a.EntryBy) ScreenSaverCnt1
		OUTER APPLY (SELECT DISTINCT
				a.EntryBy
			   ,COUNT(*)
				AS Count1
			FROM tbl_Alert_popUp a
			INNER JOIN Tbl_Master_Users b
				ON b.UserId = a.EntryBy
			WHERE a.Type = 7
			AND b.Accesslevel = Tp.Id
			AND a.EntryBy = TMU.UserId
			AND a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			AND ISNULL(a.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE a.CustomerId END) = (CASE WHEN ISNULL(@TenantId, 0) = 0 THEN '1' ELSE @TenantId END)
			AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE a.EntryBy END)
			--AND (CASE WHEN ISNULL(@TenantId,0) =0  THEN '1' ELSE a.CustomerId  END ) =(CASE 
			--WHEN ISNULL(@TenantId,0)=0 THEN '1' ELSE @TenantId END )       
			--AND a.EntryBy = (CASE @BaseViewingType WHEN 'Personal' 
			--THEN @BaseUserId ELSE a.EntryBy  END)     
			GROUP BY a.EntryBy) LockScreenCnt1) XX
	WHERE 1 = 1 
	--AND (CASE
	--	WHEN ISNULL(@TenantId, 0) = 0 THEN '1'
	--	ELSE XX.CustomerId
	--END) = (CASE
	--	WHEN ISNULL(@TenantId, 0) = 0 THEN '1'
	--	ELSE @TenantId
	--END)
	--AND XX.EntryBy = (CASE @BaseViewingType
	--	WHEN 'Personal' THEN @BaseUserId
	--	ELSE XX.EntryBy
	--END)
	AND ISNULL(XX.CustomerId,0) = @TenantId
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_CopyDeletePermission_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_CopyDeletePermission_Submit]  
@Type VARCHAR(10),  
@Id INT,  
@UserName NVARCHAR(50)  
AS        
BEGIN TRANSACTION  
 DECLARE @Status INT, @Message VARCHAR(500)       
 SELECT  @Message = 'Not Done',@Status = 0    
  
 IF(@Id>0 AND @Type='D')  
 BEGIN  
  UPDATE Tbl_Permission SET Iscancel=1,cancelby=@UserName,CancelDate=GETDATE() WHERE ID=@Id  
  SELECT @Status = 1, @Message = 'Done'  
 END  
 IF(@Id>0 AND @Type='C')  
 BEGIN  
  INSERT INTO Tbl_Permission(PermissionName,Administator,ContentManager,Custom,EntryBy,EntryDate)    
  SELECT PermissionName,Administator,ContentManager,Custom,@UserName,GETDATE() FROM Tbl_Permission WHERE Id=@Id  
  
  DECLARE @PermissionId INT  
  SET @PermissionId=SCOPE_IDENTITY();  
   
  INSERT INTO Tbl_PermissionSettings(PermissionId,ToolList,IsEntireOrganization,IsCoustomize,UserList,Personal,FullViewing,EntryBy,EntryDate)   
  SELECT @PermissionId,ToolList,IsEntireOrganization,IsCoustomize,UserList,Personal,FullViewing,@UserName,GETDATE() FROM Tbl_PermissionSettings  
  WHERE PermissionId=@Id  
  
  SELECT @Status = 1, @Message = 'Done'  
 END  
          
SELECT MESSAGE = @Message,STATUS = @Status   
COMMIT TRANSACTION         
GOTO EndSave          
QuitWithRollback:          
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION  
BEGIN        
SELECT  MESSAGE = @Message,STATUS = @Status  
END  
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[Usp_CopyHistory_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_CopyHistory_Submit '','',''
*/
CREATE PROCEDURE [dbo].[Usp_CopyHistory_Submit]
(
	@AlertId INT,
	@UserName NVARCHAR(50),
	@Type VARCHAR(10)
)
AS
BEGIN TRANSACTION

	DECLARE @Status INT ,@Message VARCHAR(500) ,@AlertId1 INT;
	SELECT @Message = 'Not Done' ,@Status = 0;
      
	INSERT INTO tbl_Alert_popUp
	(
		AlertTital, AlertBody, CriticalAlert, AutoCloseIn, AutoCloseInMin,
		ExpiresIn, ExpiresTimeValue, ExpiresTimeType, TrayNotification, AcknoledgrButton, FullScreenAlert,
		DesktopSizeWidth, DesktopSizeHeight, AlertPosition, EntryDate, EntryBy, Status, ThemeId, isResize,
		Type, TickerSpeed, TickerPosition, CustomerId, MessagingType,DESCRIPTION,ScreenWaitMinutes
	)
	SELECT
		AlertTital, AlertBody, CriticalAlert, AutoCloseIn, AutoCloseInMin,
		ExpiresIn, ExpiresTimeValue, ExpiresTimeType, TrayNotification, AcknoledgrButton, FullScreenAlert,
		DesktopSizeWidth, DesktopSizeHeight, AlertPosition, GETDATE(), @UserName, 'Drafts', ThemeId, isResize,
		@Type, TickerSpeed, TickerPosition, T.CustomerId, MessagingType,DESCRIPTION,ScreenWaitMinutes
	FROM tbl_Alert_popUp T WITH (NOLOCK) WHERE T.AlertId = @AlertId

	IF (@@error <> 0)
	GOTO QuitWithRollback

	SET @AlertId1 = SCOPE_IDENTITY();

	INSERT INTO tbl_Alert_Schedule_Setting
	(
		AlertId, SchedulePatternType, OnceStartDateTime, OnceEndDateTime,
		IsOnceReminder, OnceReminderVal, DailyPatternVal, WeeklyVal, WeeklydaySunday, WeeklydayMonday, WeeklydayTuesday,
		WeeklydayWednesday, WeeklydayThursday, WeeklydayFriday, WeeklydaySaturday, MonthDay, MonthVal,
		MonthlyType, WeekinMontly, DayinWeek, WeeklyMonthVal, YearlyType, YearlMonth, DayinWeekYearly,
		WeekinMontYearly, MonthsYearl, StartDateComman, CommanDateType, CommanOccurences, CommanEndBy,
		EntryBy, EntryDate
	)
	SELECT
		@AlertId1, SchedulePatternType, OnceStartDateTime, OnceEndDateTime,
		IsOnceReminder, OnceReminderVal, DailyPatternVal, WeeklyVal, WeeklydaySunday, WeeklydayMonday, WeeklydayTuesday,
		WeeklydayWednesday, WeeklydayThursday, WeeklydayFriday, WeeklydaySaturday, MonthDay, MonthVal,
		MonthlyType, WeekinMontly, DayinWeek, WeeklyMonthVal, YearlyType, YearlMonth, DayinWeekYearly,
		WeekinMontYearly, MonthsYearl, StartDateComman, CommanDateType, CommanOccurences, CommanEndBy,@UserName, GETDATE()
	FROM tbl_Alert_Schedule_Setting TS WITH (NOLOCK) WHERE TS.AlertId = @AlertId

	IF (@@error <> 0) GOTO QuitWithRollback
	SELECT @Status = 1 ,@Message = 'Done'
      
	SELECT MESSAGE = @Message ,STATUS = @Status ,AlertId = @AlertId1, PreviousAlertID = @AlertId

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@trancount > 0)
	ROLLBACK TRANSACTION
	BEGIN
		SELECT MESSAGE = @Message ,STATUS = @Status ,AlertId = @AlertId1, PreviousAlertID = @AlertId
	END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_Create_Quiz_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_Create_Quiz_Submit '','','','',''
*/
CREATE PROCEDURE [dbo].[Usp_Create_Quiz_Submit]
(
	@XML1 VARCHAR(MAX),
	@XML2 VARCHAR(MAX),
	/* @XML3 VARCHAR(MAX), */
	@QuizTital VARCHAR(1000),
	@UserName NVARCHAR(50),
	@CustomerId INT = 0
)
AS
	DECLARE @Status INT, @Message VARCHAR(500), @AlertId INT, @QuizId INT, @SchedulePatternTypeNow VARCHAR(50);
	SELECT @Message = 'Not Done', @Status = 0;
	DECLARE @hdoc1 INT, @hdoc2 INT, @CountXML INT=0, @Counter INT=1;

	EXEC sp_xml_preparedocument @hdoc1 OUTPUT,@XML1;
	EXEC sp_xml_preparedocument @hdoc2 OUTPUT,@XML2;

	BEGIN TRANSACTION
	BEGIN

		/* --INSERT INTO tbl_Alert_popUp(AlertTital,ThemeId,Type,EntryDate,EntryBy)
		--SELECT @QuizTital,'</br>',6,GETDATE(),@UserName
		--SET @AlertId= SCOPE_IDENTITY();
		--INSERT INTO tbl_Alert_Schedule_Setting(AlertId,EntryDate,EntryBy)
		--SELECT @AlertId,GETDATE(),@UserName */
 
		INSERT INTO tbl_Alert_popUp
		(
			AlertTital, AlertBody, CriticalAlert, AutoCloseIn,
			AutoCloseInMin, ExpiresIn, ExpiresTimeValue, ExpiresTimeType,
			TrayNotification, AcknoledgrButton, FullScreenAlert, DesktopSizeWidth,
			DesktopSizeHeight, AlertPosition, EntryDate, EntryBy,
			[Status], ThemeId, isResize, [Type], TickerSpeed, TickerPosition,
			ShowQuizFinalScore, ShowQuizAnswerResult, CustomerId
		)
		SELECT
			@QuizTital, AlertBody, CriticalAlert, AutoCloseIn,
			AutoCloseInMin, ExpiresIn, ExpiresTimeValue, ExpiresTimeType,
			TrayNotification, AcknoledgrButton, FullScreenAlert, DesktopSizeWidth,
			DesktopSizeHeight, AlertPosition, GETDATE(), @UserName,
			'Drafts', ThemeId, isResize, 6, TickerSpeed, TickerPosition,
			ShowQuizFinalScore, ShowQuizAnswerResult, @CustomerId
		FROM OPENXML(@hdoc2, 'AlertModel', 2)
		WITH
		(
			AlertTital VARCHAR(MAX) 'AlertTital',
			AlertBody VARCHAR(MAX) 'AlertBody',
			CriticalAlert BIT 'CriticalAlert',
			AutoCloseIn BIT 'AutoCloseIn',
			AutoCloseInMin INT 'AutoCloseInMin',
			ExpiresIn BIT 'ExpiresIn',
			ExpiresTimeValue BIT 'ExpiresTimeValue',
			ExpiresTimeType VARCHAR(100) 'ExpiresTimeType',
			TrayNotification BIT 'TrayNotification',
			AcknoledgrButton BIT 'AcknoledgrButton',
			FullScreenAlert BIT 'FullScreenAlert',
			DesktopSizeWidth INT 'DesktopSizeWidth',
			DesktopSizeHeight INT 'DesktopSizeHeight',
			AlertPosition VARCHAR(50) 'AlertPosition',
			ThemeId VARCHAR(50) 'ThemeId',
			isResize BIT 'isResize',
			TickerSpeed VARCHAR(20) 'TickerSpeed',
			TickerPosition VARCHAR(100) 'TickerPosition',
			ShowQuizFinalScore BIT 'ShowQuizFinalScore',
			ShowQuizAnswerResult BIT 'ShowQuizAnswerResult'
		)
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
		SET @AlertId= SCOPE_IDENTITY();

		INSERT INTO tbl_Alert_Schedule_Setting
		(
			AlertId,SchedulePatternType,OnceStartDateTime,
			OnceEndDateTime,IsOnceReminder,OnceReminderVal,
			DailyPatternVal,WeeklyVal,WeeklydaySunday,
			WeeklydayMonday,WeeklydayTuesday,WeeklydayWednesday,
			WeeklydayThursday,WeeklydayFriday,WeeklydaySaturday,
			MonthDay,MonthVal,MonthlyType,WeekinMontly,DayinWeek,
			WeeklyMonthVal,YearlyType,YearlMonth,DayinWeekYearly,
			WeekinMontYearly,MonthsYearl,StartDateComman,
			CommanDateType,CommanOccurences,CommanEndBy,EntryBy,EntryDate
		)
		SELECT
			@AlertId,SchedulePatternType,OnceStartDateTime,
			OnceEndDateTime,IsOnceReminder,OnceReminderVal,
			DailyPatternVal,WeeklyVal,WeeklydaySunday,
			WeeklydayMonday,WeeklydayTuesday,WeeklydayWednesday,
			WeeklydayThursday,WeeklydayFriday,WeeklydaySaturday,
			MonthDay,MonthVal,MonthlyType,WeekinMontly,DayinWeek,
			WeeklyMonthVal,YearlyType,YearlMonth,DayinWeekYearly,
			WeekinMontYearly,MonthsYearl,StartDateComman,
			CommanDateType,CommanOccurences,CommanEndBy,@UserName,GETDATE()
		FROM OPENXML(@hdoc2, 'AlertModel', 2)                     
		WITH   
		(            
			SchedulePatternType VARCHAR(50) 'SchedulePatternType',
			OnceStartDateTime DATETIME 'OnceStartDateTime',
			OnceEndDateTime DATETIME 'OnceEndDateTime',
			IsOnceReminder BIT 'IsOnceReminder',
			OnceReminderVal INT 'OnceReminderVal',
			DailyPatternVal VARCHAR(50) 'DailyPatternVal',
			WeeklyVal VARCHAR(50) 'WeeklyVal',
			WeeklydaySunday BIT 'WeeklydaySunday',
			WeeklydayMonday BIT 'WeeklydayMonday',
			WeeklydayTuesday BIT 'WeeklydayTuesday',
			WeeklydayWednesday BIT 'WeeklydayWednesday',
			WeeklydayThursday BIT 'WeeklydayThursday',
			WeeklydayFriday BIT 'WeeklydayFriday',
			WeeklydaySaturday BIT 'WeeklydaySaturday',
			MonthDay VARCHAR(50) 'MonthDay',
			MonthVal VARCHAR(50) 'MonthVal',
			MonthlyType VARCHAR(50) 'MonthlyType',
			WeekinMontly VARCHAR(50) 'WeekinMontly',
			DayinWeek VARCHAR(50) 'DayinWeek',
			WeeklyMonthVal VARCHAR(50) 'WeeklyMonthVal',
			YearlyType VARCHAR(50) 'YearlyType',
			YearlMonth VARCHAR(50) 'YearlMonth',
			DayinWeekYearly VARCHAR(50) 'DayinWeekYearly',
			WeekinMontYearly VARCHAR(50) 'WeekinMontYearly',
			MonthsYearl VARCHAR(50) 'MonthsYearl',
			StartDateComman DATETIME 'StartDateComman',
			CommanDateType VARCHAR(50) 'CommanDateType',
			CommanOccurences INT 'CommanOccurences',
			CommanEndBy VARCHAR(200) 'CommanEndBy'
		)                      
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
    
		SELECT @CountXML=(COUNT(*))	FROM OPENXML(@hdoc1, 'root/QuestionDetail', 2)
		WITH
		( QuestionName VARCHAR(MAX) 'QuestionName' )

		WHILE(@Counter <= @CountXML)
		BEGIN
			INSERT INTO tbl_QuizQuestion
			( QuizId,Question,QuestionType,EntryBy,EntryDate )
			SELECT @AlertId,QuestionName,QuestionType,@UserName,GETDATE()
			FROM OPENXML(@hdoc1, 'root/QuestionDetail', 2)
			WITH
			(
				SrNo INT 'SrNo',
				QuestionName VARCHAR(MAX) 'QuestionName',
				QuestionType VARCHAR(MAX) 'QuestionType'
			)XX WHERE XX.SrNo=@Counter
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback

			SET @QuizId= SCOPE_IDENTITY();            
          
			/*Multi Choice */            
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,MCQ1,AnsMCQ1,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/MCQQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				MCQ1 VARCHAR(MAX) 'MCQ1',          
				AnsMCQ1 BIT 'AnsMCQ1'          
			)X WHERE ISNULL(X.MCQ1,'')<>'' AND X.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback             
	         
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,MCQ2,AnsMCQ2,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/MCQQuestionDetail', 2)                           
			WITH                  
			(                 
				SrNo INT 'SrNo',          
				MCQ2 VARCHAR(MAX) 'MCQ2',          
				AnsMCQ2 BIT 'AnsMCQ2'          
			)XXX WHERE ISNULL(XXX.MCQ2,'')<>'' AND XXX.SrNo=@Counter                                
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback           
	            
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,MCQ3,AnsMCQ3,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/MCQQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				MCQ3 VARCHAR(MAX) 'MCQ3',          
				AnsMCQ3 BIT 'AnsMCQ3'           
			)XX4 WHERE ISNULL(XX4.MCQ3,'')<>'' AND XX4.SrNo=@Counter                                
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback             
	         
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,MCQ4,AnsMCQ4,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/MCQQuestionDetail', 2)                           
			WITH                  
			(                 
				SrNo INT 'SrNo',          
				MCQ4 VARCHAR(MAX) 'MCQ4',          
				AnsMCQ4 BIT 'AnsMCQ4'           
			)XX5 WHERE ISNULL(XX5.MCQ4,'')<>'' AND XX5.SrNo=@Counter                                
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback             
	         
			/*Single answer */          
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)          
			SELECT @QuizId,TextAnswer,1,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/SAQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				TextAnswer VARCHAR(MAX) 'TextAnswer'           
			)XX6 WHERE ISNULL(XX6.TextAnswer,'')<>'' AND XX6.SrNo=@Counter                                
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback             
	       
			/*Single Choice */        
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,SCQ1,AnsSCQ1,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/SCQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				SCQ1 VARCHAR(MAX) 'SCQ1',          
				AnsSCQ1 BIT 'AnsSCQ1'          
			)Xs1 WHERE ISNULL(Xs1.SCQ1,'')<>'' AND Xs1.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback             
	           
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,SCQ2,AnsSCQ2,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/SCQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				SCQ2 VARCHAR(MAX) 'SCQ2',          
				AnsSCQ2 BIT 'AnsSCQ2'          
			)Xs2 WHERE ISNULL(Xs2.SCQ2,'')<>'' AND Xs2.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback        
	       
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,SCQ3,AnsSCQ3,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/SCQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				SCQ3 VARCHAR(MAX) 'SCQ3',          
				AnsSCQ3 BIT 'AnsSCQ3'          
			)Xs3 WHERE ISNULL(Xs3.SCQ3,'')<>'' AND Xs3.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback        
	       
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,SCQ4,AnsSCQ4,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/SCQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				SCQ4 VARCHAR(MAX) 'SCQ4',          
				AnsSCQ4 BIT 'AnsSCQ4'          
			)Xs4 WHERE ISNULL(Xs4.SCQ4,'')<>'' AND Xs4.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback        
	      
			/*True False */           
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,TFValT,TFTVal,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/TFQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				TFValT VARCHAR(MAX) 'TFValT',          
				TFTVal BIT 'TFTVal'          
			)Xt WHERE ISNULL(Xt.TFValT,'')<>'' AND Xt.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback      
	    
			INSERT INTO tbl_QuizAnswer(QuestId,Answer,CorrectAnswer,EntryBy,EntryDate)             
			SELECT @QuizId,TFValF,TFFVal,@UserName,GETDATE()            
			FROM OPENXML(@hdoc1, 'root/QuestionDetail/TFQuestionDetail', 2)                           
			WITH                  
			(                  
				SrNo INT 'SrNo',          
				TFValF VARCHAR(MAX) 'TFValF',          
				TFFVal BIT 'TFFVal'          
			)Xf WHERE ISNULL(Xf.TFValF,'')<>'' AND Xf.SrNo=@Counter                           
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback      
	       
			SET @Counter  = @Counter  + 1          
		END

		SELECT @SchedulePatternTypeNow = ZZ.SchedulePatternType
		FROM OPENXML(@hdoc2, 'AlertModel', 2)                   
		WITH          
		(          
			SchedulePatternType VARCHAR(50) 'SchedulePatternType'     
		)ZZ
    
		IF(@SchedulePatternTypeNow != 'Now')
		BEGIN
			EXEC Usp_Alert_Auto_Schedule @AlertId, 6
		END
	END

	SELECT @Status = 1, @Message = 'Done';
	SELECT MESSAGE = @Message,STATUS = @Status ,AlertId=@AlertId;
	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF(@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT  MESSAGE = @Message,STATUS = @Status ,AlertId=@AlertId;
	END
	EndSave:
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateC#ClassFromSQL]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[USP_CreateC#ClassFromSQL]
@TableName sysname
AS

declare @Result varchar(max) = 'public class ' + @TableName + '
{
'select @Result = @Result + 'public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }'
from
(
    select
        replace(col.name, ' ', '_') ColumnName,
        column_id ColumnId,
        case typ.name
            when 'bigint' then 'long'

            when 'binary' then 'byte[]'
            when 'bit' then 'bool'
            when 'char' then 'string'
            when 'date' then 'DateTime'
            when 'datetime' then 'DateTime'
            when 'datetime2' then 'DateTime'
            when 'datetimeoffset' then 'DateTimeOffset'
            when 'decimal' then 'decimal'
            when 'float' then 'double'
            when 'image' then 'byte[]'
            when 'int' then 'int'
            when 'money' then 'decimal'
            when 'nchar' then 'string'
            when 'ntext' then 'string'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'string'
            when 'real' then 'float'
            when 'smalldatetime' then 'DateTime'
            when 'smallint' then 'short'
            when 'smallmoney' then 'decimal'
            when 'text' then 'string'
            when 'time' then 'TimeSpan'
            when 'timestamp' then 'long'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'Guid'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'string'
            else 'UNKNOWN_' + typ.name
        end ColumnType,
        case
            when col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifie
r')
            then '?'
            else ''
        end NullableSign
    from sys.columns col
        join sys.types typ on
            col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
    where object_id = object_id(@TableName)
) t
order by ColumnId

set @Result = @Result  + '
}
'
print @Result
GO
/****** Object:  StoredProcedure [dbo].[Usp_Customer_Registratation_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_Customer_Registratation_Submit '','','',''
*/
CREATE PROCEDURE [dbo].[Usp_Customer_Registratation_Submit]
(
	@XML1 VARCHAR(MAX),	
	@UserName NVARCHAR(50),
	@EditFlag VARCHAR(10),
	@DefaultTemplateLogoPath VARCHAR(100)
)
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500), @PermissionId INT, @CustomerId INT;
	SELECT  @Message = 'Not Done', @Status = 0;

	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'CustomerViewModel';
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;

	IF(@EditFlag = 'N')
	BEGIN
		INSERT INTO Tbl_Permission
		(PermissionName, Administator, ContentManager, [Custom], EntryBy, EntryDate, PermissionType)
		SELECT 'Administrator',1,0,0,@UserName,GETDATE(),'3'
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		( CompanyName VARCHAR(500) 'CompanyName' )
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback

		SELECT @PermissionId=SCOPE_IDENTITY();

		INSERT INTO Tbl_PermissionSettings
		(PermissionId, ToolList, IsEntireOrganization, IsCoustomize, Personal, FullViewing, EntryBy, EntryDate)
		SELECT @PermissionId,ModuleId,0,0,0,1,@UserName,GETDATE()
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		( ModuleId VARCHAR(100) 'ModuleId' )
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback

		INSERT INTO tbl_CustomerRegistration
		(
			CompanyName,FullName,CompanyEmail,PhoneNumber,StartDate,ExpiresDate,Module,
			LicenseCount,PurchasedTrial,EntryDate,EntryBy,Accesslevel
		)
		SELECT CompanyName,FullName,CompanyEmail,PhoneNumber,StartDate,ExpiresDate,ModuleId,
		LicenseCount,PurchasedTrial,GETDATE(),@UserName,@PermissionId
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName',
			StartDate DATETIME 'StartDate',
			ExpiresDate DATETIME 'ExpiresDate',
			ModuleId VARCHAR(100) 'ModuleId',
			LicenseCount VARCHAR(50) 'LicenseCount',
			PurchasedTrial VARCHAR(50) 'PurchasedTrial'
		)
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
         
		SELECT @CustomerId = SCOPE_IDENTITY();
		INSERT INTO Tbl_Master_Users
		(
			UserId,User_Type,BranchCode,[Name],EmailId,[Status],EntryDate,EntryBy,
			LastUpdatedDate,DOB,mobileno,EmpId,TenantId,PhoneNo,Accesslevel,CustomerId
		)
		SELECT CompanyEmail,'Cust','HQTR',FullName,CompanyEmail,100,GETDATE(),@UserName,
		GETDATE(),GETDATE(),PhoneNumber,CompanyEmail,'1',PhoneNumber,@PermissionId,@CustomerId
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName'
		)

		UPDATE Tbl_Permission SET CustomerId=@CustomerId WHERE Id=@PermissionId;
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
 
		INSERT INTO tbl_Alert_Ticker_Default_Setting
		(
			AlertPosition, FullScreenAlert, isResize, DesktopSizeWidth, DesktopSizeHeight, TickerPosition,
			TickerSpeed, CriticalAlert, ExpiresIn, ExpiresTimeValue, ExpiresTimeType, AutoCloseIn, AutoCloseInMin,
			TrayNotification, AcknoledgrButton, EntryDate, EntryBy, UpdateBy, UpdateDate, ThemeId, ThemeIdTic, CoustomerId,
			Timeinterval, ScreenWaitMinutes, IsOnResumeDisplay, CompanyLogo
		)
		SELECT TOP 1 AlertPosition, FullScreenAlert, isResize, DesktopSizeWidth, DesktopSizeHeight, TickerPosition,
		TickerSpeed, CriticalAlert, ExpiresIn, ExpiresTimeValue, ExpiresTimeType, AutoCloseIn, AutoCloseInMin,
		TrayNotification, AcknoledgrButton, EntryDate, @UserName, NULL, NULL, ThemeId, ThemeIdTic, @CustomerId,
		Timeinterval, ScreenWaitMinutes, IsOnResumeDisplay, @DefaultTemplateLogoPath
		FROM tbl_Alert_Ticker_Default_Setting WITH(NOLOCK) WHERE ISNULL(CoustomerId,0) = 0
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback  
		
		INSERT INTO tblCustomerPreferences(CustomerId,UserId,WallpaperFeatureEnabled,WallpaperLockFeatureEnabled,LockScreenFeatureEnabled,LockScreenLockFeatureEnabled,ScreenSaverFeatureEnabled,ScreenSaverLockFeatureEnabled)
		SELECT ISNULL(@CustomerId,0),CompanyName,1,1,1,1,1,1
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName'
		)     
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback  
	END

	IF(@EditFlag = 'Y')
	BEGIN
		UPDATE tbl_CustomerRegistration SET
		CompanyName = X.CompanyName,
		FullName = X.FullName,
		PhoneNumber = X.PhoneNumber,
		StartDate = X.StartDate,
		ExpiresDate = X.ExpiresDate,
		Module = X.ModuleId,
		LicenseCount = X.LicenseCount,
		PurchasedTrial = X.PurchasedTrial,
		EntryDate = GETDATE(),
		EntryBy = @UserName
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName',
			StartDate DATETIME 'StartDate',
			ExpiresDate DATETIME 'ExpiresDate',
			ModuleId VARCHAR(100) 'ModuleId',
			LicenseCount VARCHAR(50) 'LicenseCount',
			CustomerId BIGINT 'CustomerId',
			PurchasedTrial VARCHAR(50) 'PurchasedTrial',
			AccessLevel INT 'AccessLevel'
		)X WHERE tbl_CustomerRegistration.CustomerId = X.CustomerId;
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
		
		UPDATE Tbl_PermissionSettings
		SET ToolList = X.ModuleId
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			ModuleId VARCHAR(100) 'ModuleId',
			AccessLevel INT 'AccessLevel'
		)X WHERE Tbl_PermissionSettings.PermissionId=X.AccessLevel
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
	END

	SELECT @Status = 1, @Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status;

	COMMIT TRANSACTION
	GOTO EndSave QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT  [MESSAGE] = 'LINE No. '+ CAST(ERROR_LINE() AS VARCHAR(50)) + ' ' + ERROR_MESSAGE() + @Message, [STATUS] = @Status;
	END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Customer_Registratation_Submit_old]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_Customer_Registratation_Submit '','','',''
*/
CREATE PROCEDURE [dbo].[Usp_Customer_Registratation_Submit_old]
(
	@XML1 VARCHAR(MAX),	
	@UserName NVARCHAR(50),
	@EditFlag VARCHAR(10),
	@DefaultTemplateLogoPath VARCHAR(100)
)
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500), @PermissionId INT, @CustomerId INT;
	SELECT  @Message = 'Not Done', @Status = 0;

	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'CustomerViewModel';
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;

	IF(@EditFlag = 'N')
	BEGIN
		INSERT INTO Tbl_Permission
		(PermissionName, Administator, ContentManager, [Custom], EntryBy, EntryDate, PermissionType)
		SELECT 'Administrator',1,0,0,@UserName,GETDATE(),'3'
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		( CompanyName VARCHAR(500) 'CompanyName' )
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback

		SELECT @PermissionId=SCOPE_IDENTITY();

		INSERT INTO Tbl_PermissionSettings
		(PermissionId, ToolList, IsEntireOrganization, IsCoustomize, Personal, FullViewing, EntryBy, EntryDate)
		SELECT @PermissionId,ModuleId,0,0,0,1,@UserName,GETDATE()
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		( ModuleId VARCHAR(100) 'ModuleId' )
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback

		INSERT INTO tbl_CustomerRegistration
		(
			CompanyName,FullName,CompanyEmail,PhoneNumber,StartDate,ExpiresDate,Module,
			LicenseCount,PurchasedTrial,EntryDate,EntryBy,Accesslevel
		)
		SELECT CompanyName,FullName,CompanyEmail,PhoneNumber,StartDate,ExpiresDate,ModuleId,
		LicenseCount,PurchasedTrial,GETDATE(),@UserName,@PermissionId
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName',
			StartDate DATETIME 'StartDate',
			ExpiresDate DATETIME 'ExpiresDate',
			ModuleId VARCHAR(100) 'ModuleId',
			LicenseCount VARCHAR(50) 'LicenseCount',
			PurchasedTrial VARCHAR(50) 'PurchasedTrial'
		)
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
         
		SELECT @CustomerId = SCOPE_IDENTITY();
		INSERT INTO Tbl_Master_Users
		(
			UserId,User_Type,BranchCode,[Name],EmailId,[Status],EntryDate,EntryBy,
			LastUpdatedDate,DOB,mobileno,EmpId,TenantId,PhoneNo,Accesslevel,CustomerId
		)
		SELECT CompanyEmail,'Cust','HQTR',FullName,CompanyEmail,100,GETDATE(),@UserName,
		GETDATE(),GETDATE(),PhoneNumber,CompanyEmail,'1',PhoneNumber,@PermissionId,@CustomerId
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName'
		)

		UPDATE Tbl_Permission SET CustomerId=@CustomerId WHERE Id=@PermissionId;
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
 
		INSERT INTO tbl_Alert_Ticker_Default_Setting
		(
			AlertPosition, FullScreenAlert, isResize, DesktopSizeWidth, DesktopSizeHeight, TickerPosition,
			TickerSpeed, CriticalAlert, ExpiresIn, ExpiresTimeValue, ExpiresTimeType, AutoCloseIn, AutoCloseInMin,
			TrayNotification, AcknoledgrButton, EntryDate, EntryBy, UpdateBy, UpdateDate, ThemeId, ThemeIdTic, CoustomerId,
			Timeinterval, ScreenWaitMinutes, IsOnResumeDisplay, CompanyLogo
		)
		SELECT TOP 1 AlertPosition, FullScreenAlert, isResize, DesktopSizeWidth, DesktopSizeHeight, TickerPosition,
		TickerSpeed, CriticalAlert, ExpiresIn, ExpiresTimeValue, ExpiresTimeType, AutoCloseIn, AutoCloseInMin,
		TrayNotification, AcknoledgrButton, EntryDate, @UserName, NULL, NULL, ThemeId, ThemeIdTic, @CustomerId,
		Timeinterval, ScreenWaitMinutes, IsOnResumeDisplay, @DefaultTemplateLogoPath
		FROM tbl_Alert_Ticker_Default_Setting WITH(NOLOCK) WHERE ISNULL(CoustomerId,0) = 0
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback            
	END

	IF(@EditFlag = 'Y')
	BEGIN
		UPDATE tbl_CustomerRegistration SET
		CompanyName = X.CompanyName,
		FullName = X.FullName,
		PhoneNumber = X.PhoneNumber,
		StartDate = X.StartDate,
		ExpiresDate = X.ExpiresDate,
		Module = X.ModuleId,
		LicenseCount = X.LicenseCount,
		PurchasedTrial = X.PurchasedTrial,
		EntryDate = GETDATE(),
		EntryBy = @UserName
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			CompanyName VARCHAR(500) 'CompanyName',
			CompanyEmail VARCHAR(500) 'CompanyEmail',
			PhoneNumber VARCHAR(20) 'PhoneNumber',
			FullName VARCHAR(100) 'FullName',
			StartDate DATETIME 'StartDate',
			ExpiresDate DATETIME 'ExpiresDate',
			ModuleId VARCHAR(100) 'ModuleId',
			LicenseCount VARCHAR(50) 'LicenseCount',
			CustomerId BIGINT 'CustomerId',
			PurchasedTrial VARCHAR(50) 'PurchasedTrial',
			AccessLevel INT 'AccessLevel'
		)X WHERE tbl_CustomerRegistration.CustomerId = X.CustomerId;
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
		
		UPDATE Tbl_PermissionSettings
		SET ToolList = X.ModuleId
		FROM OPENXML(@hdoc1, @hdocName, 2)
		WITH
		(
			ModuleId VARCHAR(100) 'ModuleId',
			AccessLevel INT 'AccessLevel'
		)X WHERE Tbl_PermissionSettings.PermissionId=X.AccessLevel
		IF (@@ERROR <> 0 ) GOTO QuitWithRollback
	END

	SELECT @Status = 1, @Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status;

	COMMIT TRANSACTION
	GOTO EndSave QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT  [MESSAGE] = 'LINE No. '+ CAST(ERROR_LINE() AS VARCHAR(50)) + ' ' + ERROR_MESSAGE() + @Message, [STATUS] = @Status;
	END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Dashboard_Recent_Activity]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*     
EXEC USP_Dashboard_Recent_Activity 'CYGNUSTEAM'
EXEC USP_Dashboard_Recent_Activity 'XCOMMS'
*/  
CREATE PROCEDURE [dbo].[USP_Dashboard_Recent_Activity]
(
	@BaseUser VARCHAR(500)
)
AS
BEGIN
	SELECT  
  X.Alertid AS [AlertId]
    ,X.Status  
    ,X.AlertType  
    ,X.EntryDateDesc  
    ,Active =  
  CASE  
   WHEN X.Active = 'N' THEN '<span class="label label-danger">No</span>'  
   ELSE '<span class="label label-success">Yes</span>'  
  END  
    ,X.EntryBy  
    ,Recurring =  
  CASE  
   WHEN X.Recurring = 'N' THEN '<span class="label label-danger">No</span>'  
   ELSE '<span class="label label-success">Yes</span>'  
  END  
    ,X.AlertTital  
    ,AcknowledgementRequested =  
  CASE  
   WHEN  
    AcknowledgementRequested = 'N' THEN '<span class="label label-danger">No</span>'  
   ELSE '<span class="label label-success">Yes</span>'  
  END  
    ,X.NoOfRecipientes  
    ,X.Delivered  
    ,CAST(CAST(CASE  
   WHEN X.Delivered > 0 AND  
    X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)  
   ELSE 0  
  END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per]  
    ,X.NotDelivered  
    ,CAST(100.00 - CAST(CASE  
   WHEN X.Delivered > 0 AND  
    X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)  
   ELSE 0  
  END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per]  
    ,X.Acknowledged  
    ,CAST(CAST(CASE  
   WHEN X.Acknowledged > 0 AND  
    X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes)  
   ELSE 0  
  END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]  
    ,X.Type  
    ,X.EntryDate  
    ,X.TypeTicker  
 FROM (SELECT  
   tau.Alertid  
     ,tau.Status  
     ,tau.AlertType  
     ,FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc  
     ,tau.EntryDate  
     ,CASE ISNULL(tau.Iscancel, 0)  
    WHEN 0 THEN 'Y'  
    ELSE 'N'  
   END AS Active  
     ,tau.EntryBy  
     ,CASE  
    WHEN tass.SchedulePatternType IN ('Now', 'Daily', '0', '1') THEN 'N'  
    ELSE 'Y'  
   END AS Recurring  
     ,AlertTital = CASE WHEN tau.Type IN ('3','7') THEN tau.AlertBody ELSE tau.AlertTital END  
     ,CASE  
    WHEN tau.AlertType = 'BC' THEN Users.CNT  
    ELSE Recipientes.CNT  
   END AS NoOfRecipientes  
     ,Delivered.CNT AS [Delivered]  
     ,(CASE  
    WHEN tau.AlertType = 'BC' THEN Users.CNT  
    ELSE Recipientes.CNT  
   END) - Delivered.CNT AS [NotDelivered]  
     ,Acknowledge.CNT AS [Acknowledged]  
     ,CASE tau.AcknoledgrButton  
    WHEN 1 THEN 'Y'  
    ELSE 'N'  
   END AS AcknowledgementRequested  
     ,Type = (CASE  
    WHEN tau.Type = 1 THEN 'Pop up Alert'  
    WHEN tau.Type = 2 THEN 'Ticker'  
    WHEN tau.Type = 3 THEN 'Wallpaper'  
    WHEN tau.Type = 4 THEN 'Screen Saver'  
    WHEN tau.Type = 7 THEN 'Lock Screen'  
    WHEN tau.Type = 6 THEN 'Quiz'  
    WHEN tau.Type = 5 THEN 'Email'  
   END)  
     ,tau.Type AS TypeTicker  
  FROM tbl_Alert_popUp tau  
  INNER JOIN tbl_Alert_Schedule_Setting tass  
   ON tass.Alertid = tau.Alertid  
  CROSS APPLY (SELECT  
    COUNT(*)  
    AS CNT  
   FROM Tbl_Users tu  
   WHERE tu.deskbar_id IS NOT NULL) Users  
  CROSS APPLY (SELECT  
    COUNT(*)  
    AS CNT  
   FROM tbl_Send_Alert_User tsau  
   WHERE tsau.Alertid = tau.Alertid) Recipientes  
  CROSS APPLY (SELECT  
    COUNT(*)  
    AS CNT  
   FROM tbl_Send_Alert_User tsau  
   WHERE tsau.Alertid = tau.Alertid  
   AND ISNULL(tsau.IsReceived, 0) = 1) Delivered  
  CROSS APPLY (SELECT  
    COUNT(*)  
    AS CNT  
   FROM tbl_Send_Alert_User tsau  
   WHERE tsau.Alertid = tau.Alertid  
   AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge  
  WHERE tau.Iscancel = 0  
  AND tau.Status = 'Send'  
  AND tass.EntryBy = @BaseUser  
 --AND tau.Type = @Type AND tau.EntryDate BETWEEN @Fromdate AND @ToDate                            
 ) X  
 ORDER BY X.EntryDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Default_Setting_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_Default_Setting_Submit '','CYGNUSTEAM','0'
*/
CREATE PROCEDURE [dbo].[Usp_Default_Setting_Submit]
(
	@XML1 VARCHAR(MAX),
	@UserName NVARCHAR(50),
	@CustomerId INT
)
AS
BEGIN TRANSACTION

	DECLARE @Status INT, @Message VARCHAR(500);
	SELECT  @Message = 'Not Done', @Status = 0 ;
	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = 'AlertModel';
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;
     
	UPDATE tbl_Alert_Ticker_Default_Setting
	SET
		AlertPosition = X.AlertPosition,
		FullScreenAlert = X.FullScreenAlert,
		isResize = X.isResize,    
		DesktopSizeWidth = X.DesktopSizeWidth,
		DesktopSizeHeight = X.DesktopSizeHeight,
		TickerPosition = X.TickerPosition,
		TickerSpeed = X.TickerSpeed,
		CriticalAlert = X.CriticalAlert,
		ExpiresIn = X.ExpiresIn,
		ExpiresTimeValue = X.ExpiresTimeValue,
		ExpiresTimeType = X.ExpiresTimeType,
		AutoCloseIn = X.AutoCloseIn,
		AutoCloseInMin = X.AutoCloseInMin,
		TrayNotification = X.TrayNotification,
		AcknoledgrButton = X.AcknoledgrButton,
		ThemeId = X.ThemeId,
		ThemeIdTic = X.ThemeIdTic,
		UpdateBy = @UserName,
		UpdateDate = GETDATE(),
		Timeinterval = X.Timeinterval,
		ScreenWaitMinutes = X.ScreenWaitMinutes,
		IsOnResumeDisplay = X.IsOnResumeDisplay,
		CompanyLogo = X.CompanyLogo
	FROM OPENXML(@hdoc1, @hdocName, 2)
	WITH
	(
		AlertPosition VARCHAR(50) 'AlertPosition',
		FullScreenAlert BIT 'FullScreenAlert',
		isResize BIT 'isResize',
		DesktopSizeWidth INT 'DesktopSizeWidth',
		DesktopSizeHeight INT 'DesktopSizeHeight',
		TickerPosition VARCHAR(200) 'TickerPosition',
		TickerSpeed VARCHAR(200) 'TickerSpeed',
		CriticalAlert BIT 'CriticalAlert',
		ExpiresIn BIT 'ExpiresIn',
		ExpiresTimeValue int 'ExpiresTimeValue',
		ExpiresTimeType VARCHAR(100) 'ExpiresTimeType',
		AutoCloseIn BIT 'AutoCloseIn',
		AutoCloseInMin INT 'AutoCloseInMin',
		TrayNotification BIT 'TrayNotification',
		AcknoledgrButton BIT 'AcknoledgrButton',
		ThemeId VARCHAR(100) 'ThemeId',
		ThemeIdTic VARCHAR(100) 'ThemeIdTic',
		Timeinterval INT 'Timeinterval',
		ScreenWaitMinutes INT 'ScreenWaitMinutes',
		IsOnResumeDisplay BIT 'IsOnResumeDisplay',
		CompanyLogo NVARCHAR(MAX) 'CompanyLogo'
	)X
	WHERE tbl_Alert_Ticker_Default_Setting.CoustomerId = @CustomerId;

	IF (@@ERROR <> 0 ) GOTO QuitWithRollback
	SELECT @Status = 1, @Message = 'Done';
	SELECT MESSAGE = @Message, STATUS = @Status;

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT  MESSAGE = @Message,STATUS = @Status;
	END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_Delete_Group_By_Id]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_Delete_Group_By_Id]
@ID INT,
@UserName NVARCHAR(50)
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@ID>0)
	BEGIN
		UPDATE Tbl_Groups SET IsActive=0,UpdateBy=@UserName,UpdateDate=GETDATE() WHERE Id=@ID
		SELECT @Status = 1, @Message = 'Done'
	END
        
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[Usp_Delete_Organization_By_Id]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_Delete_Organization_By_Id]
@OrganizationId INT,
@UserName NVARCHAR(50)
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@OrganizationId>0)
	BEGIN
		UPDATE Tbl_Organization_Details SET IsActive=0,UpdateBy=@UserName,UpdateDate=GETDATE() WHERE OrganizationId=@OrganizationId
		SELECT @Status = 1, @Message = 'Done'
	END
        
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 





GO
/****** Object:  StoredProcedure [dbo].[Usp_Delete_User_By_Id]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_Delete_User_By_Id]
@ID INT,
@UserName NVARCHAR(50)
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@ID>0)
	BEGIN
		UPDATE Tbl_Users SET Iscancel=1,update_By=@UserName,update_date=GETDATE() WHERE Id=@ID
		SELECT @Status = 1, @Message = 'Done'
	END
        
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 


GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteContentManager_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_DeleteContentManager_Submit]
@Type VARCHAR(50),
@Id INT,
@UserName NVARCHAR(50)
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@Type='A' AND @Id>0)
	BEGIN
		UPDATE Tbl_Master_Users SET Status=100 WHERE ID=@Id
		SELECT @Status = 1, @Message = 'Done'
	END
	ELSE IF(@Type='DA' AND @Id>0)
	BEGIN
		UPDATE Tbl_Master_Users SET Status=200 WHERE ID=@Id
		SELECT @Status = 1, @Message = 'Done'
	END
	ELSE IF(@Type='DE' AND @Id>0)
	BEGIN
		UPDATE Tbl_Master_Users SET Iscancel=1,cancelby=@UserName,CancelDate=GETDATE() WHERE ID=@Id
		SELECT @Status = 1, @Message = 'Done'
	END
        
SELECT MESSAGE = @Message,STATUS = @Status 
COMMIT TRANSACTION       
GOTO EndSave        
QuitWithRollback:        
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN      
SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteMultipleDraft]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Usp_DeleteMultipleDraft]
(
	@XML XML,
	@EntryBy VARCHAR(50)
)
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	UPDATE T                
		  SET Iscancel=1,cancelby=@EntryBy,CancelDate=GETDATE()  
		  FROM tbl_Alert_popUp T
		  INNER JOIN 
		  (
				SELECT  
					t.value('AlertId[1]','INT') AS AlertId,
					t.value('IsChecked[1]','BIT') AS IsChecked
				FROM @XML.nodes('/ArrayOfAlertModel/AlertModel')AS X(t)
		  )X ON X.IsChecked=1 AND T.AlertId=X.AlertId

		SELECT @Status = 1, @Message = 'Done'
	
SELECT MESSAGE = @Message,STATUS = @Status 
COMMIT TRANSACTION       
GOTO EndSave        
QuitWithRollback:        
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN      
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteMultipleHistory]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeleteMultipleHistory]  
(  
 @XML XML,  
 @EntryBy VARCHAR(50)  
)  
AS  
BEGIN  
 BEGIN TRANSACTION  
 DECLARE @Status INT, @Message VARCHAR(500)    
 DECLARE @Cnt INT=1,@Totcnt INT,@StopAlertId INT,@JobNameDel varchar(500),@hdoc1 INT;  
 EXEC sp_xml_preparedocument @hdoc1 OUTPUT,@XML  
 SELECT  @Message = 'Not Done',@Status = 0    
  
 UPDATE T                  
    SET
		IsDeleted = 1,
		DeletedBy = @EntryBy,
		DeletedDate = GETDATE()
	/* Iscancel=1,cancelby=@EntryBy,CancelDate=GETDATE() */
    FROM tbl_Alert_popUp T  
    INNER JOIN   
    (  
    SELECT    
     t.value('AlertId[1]','INT') AS AlertId,  
     t.value('IsChecked[1]','BIT') AS IsChecked  
    FROM @XML.nodes('/ArrayOfAlertModel/AlertModel')AS X(t)  
    )X ON X.IsChecked=1 AND T.AlertId=X.AlertId  

	/* Job Delete */
	DECLARE @tmp TABLE  
	(  
		Id INT IDENTITY(1,1),  
		AlertId INT,  
		JobName VARCHAR(500)   
	);  
  
	INSERT INTO @tmp(AlertId)  
	SELECT AlertId  
	FROM OPENXML(@hdoc1, '/ArrayOfAlertModel/AlertModel', 2)                 
	WITH        
	(        
		AlertId INT 'AlertId'  
	)      
   
	UPDATE @tmp SET JobName=ap.JobName from tbl_Alert_popUp ap INNER JOIN @tmp t ON ap.AlertId=t.AlertId  
  
	SELECT @Totcnt=COUNT(*) FROM @tmp;  
  
	WHILE(@Cnt<=@Totcnt)  
	BEGIN  
		SELECT @JobNameDel=JobName,@StopAlertId=AlertId FROM @tmp WHERE Id=@Cnt  
		IF(@JobNameDel != '')  
		BEGIN  
			EXEC msdb.dbo.sp_delete_job   @job_name=@JobNameDel;  
			UPDATE tbl_Alert_popUp SET JobName=NULL WHERE AlertId =@StopAlertId    
			DELETE FROM tbl_Send_Alert_User WHERE Alertid=@StopAlertId    
		END  
		SET @Cnt=@Cnt+1; 
	END 
  
  SELECT @Status = 1, @Message = 'Done'  
   
SELECT MESSAGE = @Message,STATUS = @Status   
COMMIT TRANSACTION         
GOTO EndSave          
QuitWithRollback:          
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION  
BEGIN        
 SELECT  MESSAGE = @Message,STATUS = @Status  
END  
EndSave:    
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteMultipleTemplate]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Usp_DeleteMultipleTemplate]
(
	@XML XML,
	@EntryBy VARCHAR(50)
)
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	UPDATE T                
		  SET Iscancel=1,cancelby=@EntryBy,CancelDate=GETDATE()  
		  FROM Tbl_Template T
		  INNER JOIN 
		  (
				SELECT  
					t.value('ID[1]','INT') AS ID,
					t.value('IsChecked[1]','BIT') AS IsChecked
				FROM @XML.nodes('/ArrayOfTamlpateModel/TamlpateModel')AS X(t)
		  )X ON X.IsChecked=1 AND T.ID=X.ID

		--UPDATE Tbl_Template SET Iscancel=1,cancelby=@UserName,CancelDate=GETDATE() WHERE ID=@Id
		SELECT @Status = 1, @Message = 'Done'
	
SELECT MESSAGE = @Message,STATUS = @Status 
COMMIT TRANSACTION       
GOTO EndSave        
QuitWithRollback:        
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN      
SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 	
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteTemplate_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_DeleteTemplate_Submit]
@Id INT,
@UserName NVARCHAR(50)
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@Id>0)
	BEGIN
		UPDATE Tbl_Template SET Iscancel=1,cancelby=@UserName,CancelDate=GETDATE() WHERE ID=@Id
		SELECT @Status = 1, @Message = 'Done'
	END
        
SELECT MESSAGE = @Message,STATUS = @Status 
COMMIT TRANSACTION       
GOTO EndSave        
QuitWithRollback:        
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN      
SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteWallpaperMultipleHistory]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_DeleteWallpaperMultipleHistory]
(
	@XML XML,
	@EntryBy VARCHAR(50),
	@Typ INT
)
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	UPDATE T                
	SET
		/* Iscancel = 1,
		cancelby = @EntryBy,
		CancelDate = GETDATE() */
		IsDeleted = 1,
		DeletedBy = @EntryBy,
		DeletedDate = GETDATE()
	FROM tbl_Alert_popUp T
	INNER JOIN 
	(
		SELECT  
			t.value('AlertId[1]','INT') AS AlertId,
			t.value('IsChecked[1]','BIT') AS IsChecked
		FROM @XML.nodes('/ArrayOfTbl_Alert_popUp/tbl_Alert_popUp')AS X(t)
	)X ON X.IsChecked=1 AND T.AlertId=X.AlertId

SELECT @Status = 1, @Message = 'Done'
	
SELECT MESSAGE = @Message,STATUS = @Status,Type=@Typ 
COMMIT TRANSACTION       
GOTO EndSave        
QuitWithRollback:        
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN      
	SELECT  MESSAGE = @Message,STATUS = @Status,Type=0
END
EndSave: 	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DirectDeliveryUpdate]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_DirectDeliveryUpdate]
	@empcd VARCHAR(15),
	@xmlData XML
AS
BEGIN
SET NOCOUNT ON
-----------------

DECLARE @hDoc INT;
DECLARE @Status INT=0,@Message VARCHAR(MAX)='';

BEGIN TRANSACTION
	BEGIN TRY

		EXEC sp_xml_preparedocument @hDoc OUTPUT, @xmlData;

		UPDATE CYGNUS_Trans_Docket_Status
		SET
			DelPkgQty = ISNULL(DelPkgQty,0) + PKGSDELIVERED,
			PendPkgQty = PKGSWASPENDING - PKGSDELIVERED,
			Delivered = (CASE WHEN PKGSWASPENDING=PKGSDELIVERED THEN 'Y' ELSE 'N' END),
			Dely_Date =  (CASE WHEN PKGSWASPENDING=PKGSDELIVERED THEN CONVERT(VARCHAR,CONVERT(DATETIME,DELYDATE),106) + ' ' + DELYTIME + ':00' ELSE NULL END),
			DECLCODAMT = CODDODAMOUNT,
			CODCollected = CODDODCOLLECTED,
			CODNo = CODDODNO,
			DELYREASON=X.DELYREASON,
			LateDelyReason   =X.cboLateReason,
			DELYPERSON=X.DELYPERSON,
			StatusCode=(CASE DELYSTATUS WHEN  'U' THEN 'ST012' WHEN  'P' THEN 'ST013' WHEN  'L' THEN 'ST014' ELSE 'ST014' END),
			OP_Status=(CASE DELYSTATUS 
						WHEN  'U' THEN 'Undelivered Via '+DRS+' on '+CONVERT(VARCHAR,Getdate(),6) +' Reason : - '+ ISNULL(
							(SELECT CodeDesc FROM CYGNUS_Master_General WHERE CodeType='UNDELY' AND CodeId=x.DELYREASON),'')
						WHEN  'P' THEN 'Part Delivered Via '+DRS+' on '+Convert(varchar,Getdate(),6) +' Reason : - '+ ISNULL(
							(SELECT CodeDesc FROM CYGNUS_Master_General WHERE CodeType='Part_d' AND CodeId=x.DELYREASON),'')
						WHEN  'L' THEN 'Delivered Via '+DRS+' on '+CONVERT(VARCHAR,CONVERT(DATETIME,DELYDATE),106)  +' Reason : - '+ ISNULL(
							(SELECT CodeDesc FROM CYGNUS_Master_General WHERE CodeType='Part_d' AND codeid=x.DELYREASON),'') 
						ELSE 'Delivered Via '+DRS+' on '+CONVERT(VARCHAR,CONVERT(DATETIME,DELYDATE),106)  END),
			OP_Stocktype=(CASE DELYSTATUS WHEN  'U' Then 'Delivery Stock' WHEN  'P' Then 'Delivery Stock' END)
			,OP_FlowType=(CASE DELYSTATUS WHEN  'U' Then 'Fail Delivery' WHEN  'P' Then 'Part Delivery' WHEN  'L' THEN 'Delivered' ELSE 'Delivered' END),
			OP_DelyType=(CASE WHEN DATEDIFF(d,cdeldt,CONVERT(DATETIME,CONVERT(VARCHAR,CONVERT(DATETIME,DELYDATE),106) + ' ' + DELYTIME + ':00'))>0 THEN 'Late Delivery'
							WHEN DATEDIFF(d,cdeldt,CONVERT(DATETIME,CONVERT(VARCHAR,CONVERT(DATETIME,DELYDATE),106) + ' ' + DELYTIME + ':00'))>0 THEN 'Early Delivery' 
							ELSE 'On Time Delivery' END)
			,DRSUpdated='Y',DRSUP_DT =GETDATE() ,ISBadPodApplied=X.ISBadPodApplied
		FROM CYGNUS_Trans_Docket_Status WTDS
		INNER JOIN CYGNUS_master_docket D ON  WTDS.dockno=d.dockno
		INNER JOIN
		(
			SELECT * FROM  OPENXML(@hDoc, 'root/DRS',2)
			 WITH
			 (
			  DRSCode VARCHAR(25) 'DRSCode',
			  CLOSEKM NUMERIC(18,0) 'CLOSEKM',
			  DOCKET VARCHAR(25) 'DOCKET',
			  DOCKETSF CHAR(1) 'DOCKETSF',
			  PKGSWASPENDING NUMERIC(9,0) 'PKGSWASPENDING',
			  PKGSDELIVERED NUMERIC(9,0) 'PKGSDELIVERED',
			  DELYDATE VARCHAR(25) 'DELYDATE',
			  DELYSTATUS CHAR(1) 'DELYSTATUS',
			  DELYTIME VARCHAR(5) 'DELYTIME',
			  DELYREASON VARCHAR(200) 'DELYREASON',
			  DELYPERSON VARCHAR(50) 'DELYPERSON',
			  cboLateReason VARCHAR(50) 'cboLateReason',
			  CODDODAMOUNT NUMERIC(9,0) 'CODDODAMOUNT',
			  CODDODCOLLECTED NUMERIC(9,0) 'CODDODCOLLECTED',
			  CODDODNO VARCHAR(50) 'CODDODNO',
			  ISBadPodApplied BIT  'IsEnabledBadPodoption'
			 )
		)X
		ON WTDS.Dockno = X.DOCKET AND WTDS.DockSF = X.DOCKETSF;
		COMMIT TRANSACTION;
		EXEC sp_xml_removedocument @hDoc;
		SELECT @Status=1,@Message='Done';
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT @Status=1,@Message=ERROR_MESSAGE();
	END CATCH

	SELECT [Status]=@Status,[Message]=@Message;

END

GO
/****** Object:  StoredProcedure [dbo].[Usp_EnableDisbale_user]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_EnableDisbale_user]     
@Id INT,
@Type varchar(50)
AS    
BEGIN    
 SET NOCOUNT ON;   
DECLARE @Status INT, @Message VARCHAR(500)     
SELECT  @Message = 'Not Done',@Status = 0 
 IF(@Type='E')
 BEGIN
 update Tbl_Users SET Iscancel=0 WHERE id=@Id
 SELECT @Status = 1, @Message = 'Done'  
 END
  IF(@Type='D')
 BEGIN
 update Tbl_Users SET Iscancel=1 WHERE id=@Id
 SELECT @Status = 1, @Message = 'Done'  
 END
 SELECT MESSAGE = @Message,STATUS = @Status
 SET NOCOUNT OFF;    
END


GO
/****** Object:  StoredProcedure [dbo].[Usp_EnableDisbaleGroup]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
================================================================
Objective : Update Active/De-Active Group Data
================================================================
EXEC Usp_EnableDisbaleGroup'46','E','CYGNUSTEAM'
================================================================
*/
CREATE PROCEDURE [dbo].[Usp_EnableDisbaleGroup]
(
	@GroupId INT,
	@ActionType VARCHAR(20),
	@BaseUsername VARCHAR(50)
)
AS
BEGIN
	DECLARE @Status INT = 1, @Message VARCHAR(MAX) = '';
	SELECT @Message = 'Not Done', @Status = 0;

	BEGIN TRANSACTION
	BEGIN
		/*---------- Start : Update Data ----------*/
		UPDATE
			Tbl_Groups
		SET
			IsActive = (CASE WHEN @ActionType = 'E' THEN 1 WHEN @ActionType = 'D' THEN 0 ELSE 0 END),
			UpdateBy = @BaseUsername,
			UpdateDate = GETDATE()
		WHERE Id = @GroupId;
		/*---------- End : Update Data ----------*/

		SELECT @Message = 'Done', @Status = 1;
	END

	SELECT [Message] = @Message, [Status] = @Status;

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT [MESSAGE] = @Message, [Status] = @Status;
	END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GeneralMaster_List]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*      
	EXEC USP_GeneralMaster_List '0','20'
	EXEC USP_GeneralMaster_List '0','21'
	EXEC USP_GeneralMaster_List '0','19'
	EXEC USP_GeneralMaster_List '0','0'
*/
CREATE PROCEDURE [dbo].[USP_GeneralMaster_List]
(
	@Id INT,
	@CustomerId INT = 1
)
AS
BEGIN
	IF (ISNULL(@CustomerId, 0) > 0)
	BEGIN
		IF (@Id > 0)
		BEGIN
			SELECT DISTINCT
				A.CodeId, A.CodeDesc, A.CodeType, A.StatusCode, CAST(CASE A.CodeId WHEN X.Items THEN 1 ELSE 0 END AS BIT) AS chacked
			FROM CYGNUS_Master_General(NOLOCK) A
			LEFT JOIN (SELECT LTRIM(RTRIM(Items)) AS Items FROM dbo.Split((SELECT ToolList FROM Tbl_PermissionSettings(NOLOCK) WHERE PermissionId = @Id) , ',')) X ON X.Items = A.CodeId
			WHERE CodeType = 'PERMISSIONTYPE' --AND CodeId not in (6)    
			AND CodeId IN (SELECT * FROM dbo.SplitString((SELECT Module FROM tbl_CustomerRegistration WHERE CustomerId = @CustomerId) , ','))
		END
		ELSE
		BEGIN
			SELECT
				CMG.CodeType, CMG.CodeId, CMG.CodeDesc,
				CMG.CodeAccess, CMG.StatusCode,
				CMG.EntryDate, CMG.EntryBy,
				CMG.LastUpdatedDate, CMG.LastUpdatedBy,
				CMG.noofdigits, CMG.noofchar, CMG.codefor
			FROM CYGNUS_Master_General CMG WITH (NOLOCK)
		END
	END
	ELSE
	BEGIN
		IF (@Id > 0)
		BEGIN
			SELECT DISTINCT
				CMG.CodeId, CMG.CodeDesc, CMG.CodeType, CMG.StatusCode,
				CAST(0 AS BIT) AS chacked
			FROM CYGNUS_Master_General CMG WITH(NOLOCK)
			WHERE CodeType = 'PERMISSIONTYPE' --AND CodeId not in (6)    
		END
		ELSE
		BEGIN
			SELECT
				CMG.CodeType, CMG.CodeId, CMG.CodeDesc,
				CMG.CodeAccess, CMG.StatusCode,
				CMG.EntryDate, CMG.EntryBy,
				CMG.LastUpdatedDate, CMG.LastUpdatedBy,
				CMG.noofdigits, CMG.noofchar, CMG.codefor
			FROM CYGNUS_Master_General CMG WITH (NOLOCK)
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_AD_SaveSync_DraftData]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
===================================================================
DESCRIPTION : Get AD Sync SchedulerData From Draft
===================================================================
EXEC USP_Get_AD_SaveSync_DraftData '2','0'
===================================================================
*/
CREATE PROCEDURE [dbo].[USP_Get_AD_SaveSync_DraftData]
(
	@AD_Header_Id INT,
	@CustomerId INT
)
AS
BEGIN
	SELECT
		HDR.Id, HDR.Domain, HDR.UserId, HDR.[Password],
		HDR.CustomerId, HDR.ADSyncName, HDR.IsAutoSync,
		HDR.IsActive, SD.OUJsonString, SD.GroupJsonString,
		SD.SchedulerXML, SD.SchedulerJobName, SD.JobCreateDate
	FROM Tbl_AD_Sync_Header HDR WITH(NOLOCK)
	INNER JOIN Tbl_AD_SyncSave_Draft SD WITH(NOLOCK) ON SD.AD_Header_Id = HDR.Id
	WHERE HDR.Id = @AD_Header_Id AND HDR.CustomerId = @CustomerId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_ALERT_BY_USER]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_ALERT_BY_USER]
	@UserId VARCHAR(50)
	,@GroupId VARCHAR(50)
AS
BEGIN
	
	SELECT id
	/*,alert_text,title,[type],group_type,create_date,sent_date,type2,from_date,to_date,schedule,schedule_type,recurrence,urgent,toolbarmode,deskalertsmode,sender_id,template_id
	,group_id,aknown,ticker,ticker_speed,fullscreen,alert_width,alert_height,email_sender,email,sms,desktop,escalate,escalate_hours,escalate_count,escalate_step,escalate_hours_initial
	,autoclose,param_temp_id,caption_id,class,parent_id,resizable,post_to_blog,social_media,self_deletable,text_to_call,campaign_id,video,approve_status,reject_reason,[lifetime],terminated
	,color_code,rss_allow_content,device */
	FROM tbl_alerts
	WHERE sent_date IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_AlertTicker_Data_By]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_Get_AlertTicker_Data_By '5243','235B70C5-EE65-4F2F-BA4A-8FBD6A691D21'
*/
CREATE PROCEDURE [dbo].[USP_Get_AlertTicker_Data_By]
(
	@AlertId INT,
	@DeskbarId VARCHAR(100)
)
AS
BEGIN
	SELECT
		AlertTital,
		tau.EntryDate,
		AlertBody,
		tau.AlertId,
		ThemeId,
		tsau.UserName,
		tsau.UserId,
		x.deskbar_id,
		DesktopSizeWidth = (CASE tau.Type WHEN '1' THEN DesktopSizeWidth ELSE 0 END),
		DesktopSizeHeight = (CASE tau.Type WHEN '1' THEN DesktopSizeHeight ELSE 0 END), 
		AlertPosition = (CASE tau.Type WHEN '1' THEN AlertPosition WHEN '2' THEN TickerPosition ELSE '' END),
		FullScreenAlert = (CASE tau.Type WHEN '1' THEN FullScreenAlert ELSE CAST('false' AS BIT) END), 
		AutoCloseInMin = ISNULL(AutoCloseInMin, 0),
		WebURL = (CASE tau.[Type] WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END), 
		isTicker = (CASE tau.[Type] WHEN '2' THEN CAST('true' AS BIT) ELSE CAST('false' AS BIT) END),
		TrayNotification = CAST('false' AS BIT), 
		AcknoledgrButton = CAST(CASE WHEN ISNULL(AcknoledgrButton, 0) = 1 AND ISNULL(tsau.AcknowledgeDate, '') = '' THEN 1 ELSE 0 END AS BIT)  
	FROM tbl_Alert_popUp tau WITH (NOLOCK)
	INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tsau.AlertId = tau.AlertId 
	CROSS APPLY
	(
		SELECT tu.deskbar_id,tu.PlayAlertSound
		FROM dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId), ',') ,',') A 
		INNER JOIN Tbl_Users tu WITH(NOLOCK) ON tu.Id = A.Items 
		WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId  AND tsau.UserType ='User')
	)X
	LEFT JOIN Tbl_Users tu WITH(NOLOCK) ON tu.deskbar_id = x.deskbar_id
	WHERE 1=1 AND tau.AlertId = @AlertId AND X.deskbar_id = @DeskbarId;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_Get_AlertTickerData_ByAlertId_DeskbarId]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_Get_AlertTickerData_ByAlertId_DeskbarId '8924','59D8D9BB-9E09-4097-91B7-E877E7562D98','CYGNUX116','1'
	EXEC USP_Get_AlertTickerData_ByAlertId_DeskbarId '9309','EB62CB58-0B5B-4A10-AF35-32C30882ECA2','CYGNUX116','1'
*/
CREATE PROCEDURE [dbo].[USP_Get_AlertTickerData_ByAlertId_DeskbarId]
(
	@AlertId INT,
	@DeskbarId VARCHAR(100),
	@UserName VARCHAR(100),
	@Read VARCHAR(10)
)
AS
BEGIN
	IF(@Read = '1')
	BEGIN
		SELECT
			AlertTital,
			tau.EntryDate,
			AlertBody,
			tau.AlertId,
			tau.ThemeId,
			tsau.UserName,
			tsau.UserId,
			tu.deskbar_id,
			DesktopSizeWidth = (CASE tau.Type WHEN '1' THEN tau.DesktopSizeWidth ELSE 0 END),
			DesktopSizeHeight = (CASE tau.Type WHEN '1' THEN tau.DesktopSizeHeight ELSE 0 END), 
			AlertPosition = (CASE tau.Type WHEN '1' THEN tau.AlertPosition WHEN '2' THEN tau.TickerPosition ELSE '' END),
			FullScreenAlert = (CASE tau.Type WHEN '1' THEN tau.FullScreenAlert ELSE CAST('false' AS BIT) END), 
			AutoCloseInMin = ISNULL(tau.AutoCloseInMin, 0),
			WebURL = (CASE tau.[Type] WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END), 
			isTicker = (CASE tau.[Type] WHEN '2' THEN CAST('true' AS BIT) ELSE CAST('false' AS BIT) END),
			TrayNotification = CAST('false' AS BIT), 
			AcknoledgrButton = CAST(CASE WHEN ISNULL(tau.AcknoledgrButton, 0) = 1 AND ISNULL(tsau.AcknowledgeDate, '') = '' THEN 1 ELSE 0 END AS BIT),
			CompanyLogo = ISNULL(CustLogo.CompanyLogo,'/Templates/img/logo.png')
		FROM tbl_Alert_popUp tau WITH (NOLOCK)
		INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tsau.AlertId = tau.AlertId 
		OUTER APPLY
		(
			SELECT
				tu.deskbar_id,tu.PlayAlertSound
			FROM dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId), ',') ,',') A 
			INNER JOIN Tbl_Users tu WITH(NOLOCK) ON tu.Id = A.Items 
			WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId  AND tsau.UserType = 'User')
		)X
		LEFT JOIN Tbl_Users tu WITH(NOLOCK) ON tu.id = tsau.UserId
		OUTER APPLY
		(
			SELECT TU.deskbar_id FROM Tbl_Users TU WITH(NOLOCK) WHERE TU.id IN (TSAU.UserId)
		)UserDeskId
		OUTER APPLY
		(
			SELECT TOP 1 DS.CompanyLogo FROM tbl_Alert_Ticker_Default_Setting DS WITH(NOLOCK) WHERE DS.CoustomerId = ISNULL(tu.ParentCustID,0)
		)CustLogo
		WHERE 1=1 AND tau.AlertId = @AlertId
		AND @DeskbarId IN (X.deskbar_id, UserDeskId.deskbar_id) 
		--AND X.deskbar_id = @DeskbarId;
	END
	ELSE
	BEGIN
		SELECT
			AlertTital,
			tau.EntryDate,
			AlertBody,
			tau.AlertId,
			tau.ThemeId,
			tsau.UserName,
			tsau.UserId,
			DesktopSizeWidth = (CASE tau.Type WHEN '1' THEN tau.DesktopSizeWidth ELSE 0 END),
			DesktopSizeHeight = (CASE tau.Type WHEN '1' THEN tau.DesktopSizeHeight ELSE 0 END), 
			AlertPosition = (CASE tau.Type WHEN '1' THEN tau.AlertPosition WHEN '2' THEN tau.TickerPosition ELSE '' END),
			FullScreenAlert = (CASE tau.Type WHEN '1' THEN tau.FullScreenAlert ELSE CAST('false' AS BIT) END), 
			AutoCloseInMin = ISNULL(tau.AutoCloseInMin, 0),
			WebURL = (CASE tau.[Type] WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END),
			isTicker = (CASE tau.Type WHEN '2' THEN CAST('true' AS BIT) ELSE CAST('false' AS BIT) END),
			TrayNotification = CAST('false' AS BIT),
			AcknoledgrButton = CAST(CASE WHEN ISNULL(tau.AcknoledgrButton, 0) = 1 AND ISNULL(tsau.AcknowledgeDate, '') = '' THEN 1 ELSE 0 END AS BIT),
			CompanyLogo = ISNULL(CustLogo.CompanyLogo,'/Templates/img/logo.png')
		FROM tbl_Alert_popUp tau WITH (NOLOCK)
		INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tsau.AlertId = tau.AlertId
		OUTER APPLY
		(
			SELECT TOP 1 DS.CompanyLogo FROM tbl_Alert_Ticker_Default_Setting DS WITH(NOLOCK) WHERE DS.CoustomerId = ISNULL(tau.CustomerId,0)
		)CustLogo
		WHERE 1 = 1 AND tau.AlertId = @AlertId AND tsau.UserName = @UserName;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Get_CommaSepret_UserList_For_AutoScheduling]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC Usp_Get_CommaSepret_UserList_For_AutoScheduling '850'
EXEC Usp_Get_CommaSepret_UserList_For_AutoScheduling '97'
*/
CREATE PROCEDURE [dbo].[Usp_Get_CommaSepret_UserList_For_AutoScheduling]
(
	@AlertId INT
)
AS
BEGIN
	BEGIN TRANSACTION

	DECLARE @Status INT, @Message VARCHAR(500), @DeskbarId VARCHAR(MAX), @LicenseCount INT;
	DECLARE @ResultString VARCHAR(MAX) = NULL, @CustomerId INT, @CompanyLogo VARCHAR(100);
	SELECT @Message = 'Not Done', @Status = 0;

	SELECT @ResultString = STRING_AGG(tsau.UserId, ',')
	FROM tbl_Send_Alert_User tsau WITH(NOLOCK)
	WHERE AlertId = @AlertId AND tsau.UserType = 'User';
	
	SELECT @ResultString = COALESCE(@ResultString + ',', '') + dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(UserId), ',')
	FROM tbl_Send_Alert_User tsau WITH(NOLOCK)
	WHERE AlertId = @AlertId AND tsau.UserType = 'Group';

	/*-- SELECT @ResultString 
	-- SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString,',')) */

	SELECT @DeskbarId = STRING_AGG(tu.deskbar_id, ',')
	FROM Tbl_Users tu WITH(NOLOCK)
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','));

	/*---------- Start : Get CustomerWise Liecense Count ----------*/
	SELECT @CustomerId = TAU.CustomerId FROM tbl_Alert_popUp TAU WITH(NOLOCK) WHERE TAU.AlertId = @AlertId;
	IF (ISNULL(@CustomerId, 0) > 0)
	BEGIN
		SELECT @LicenseCount = CAST(tcr.LicenseCount AS INT)
		FROM tbl_CustomerRegistration tcr WITH(NOLOCK)
		WHERE ISNULL(tcr.CustomerId, 0) = @CustomerId;
	END
	ELSE
	BEGIN
		SELECT @LicenseCount = COUNT(*)
		FROM Tbl_Users tu WITH(NOLOCK)
		WHERE ISNULL(tu.Iscancel, 0) = 0 AND ISNULL(tu.ParentCustID, 0) = @CustomerId;
	END
	SELECT @CompanyLogo = TATDS.CompanyLogo
	FROM tbl_Alert_Ticker_Default_Setting TATDS WITH(NOLOCK) WHERE TATDS.CoustomerId = ISNULL(@CustomerId,0);
	/*---------- End : Get CustomerWise Liecense Count ----------*/
	
	SELECT @Status = 1, @Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status, DeskbarId = @DeskbarId, CustomerId = @CustomerId, LicenseCount = @LicenseCount, CompanyLogo = @CompanyLogo;

	/* --SELECT AlertTital as Name,AlertBody as Message,ThemeId as Theme,DesktopSizeWidth as Width,DesktopSizeHeight as Height,
	--AlertPosition as Position,FullScreenAlert as FullScrteen,AutoCloseInMin as AutoCloseinSec,'' as WebURL 
	--FROM tbl_Alert_popUp WHERE AlertId=@AlertId */
	
	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
		IF (@@trancount > 0)
			ROLLBACK TRANSACTION
		BEGIN
			SELECT [MESSAGE] = @Message, [STATUS] = @Status, [DeskbarId] = '', [CustomerId] = 0, [LicenseCount] = 0, [CompanyLogo] = '';
		END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Get_CommaSepret_UserList_For_AutoScheduling_BKP_CR]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC Usp_Get_CommaSepret_UserList_For_AutoScheduling '2'
*/
CREATE PROC [dbo].[Usp_Get_CommaSepret_UserList_For_AutoScheduling_BKP_CR] 
@AlertId INT
AS
	BEGIN TRANSACTION
	DECLARE @Status INT ,@Message VARCHAR(500) ,@DeskbarId VARCHAR(MAX);
	SELECT @Message = 'Not Done' ,@Status = 0	
 

	DECLARE @ResultString VARCHAR(MAX) = NULL;
	SELECT @ResultString = STRING_AGG(tsau.UserId, ',')
	FROM tbl_Send_Alert_User tsau
	WHERE AlertId = @AlertId AND tsau.UserType = 'User'
	
	SELECT @ResultString = COALESCE(@ResultString + ',', '') + dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(UserId), ',')
	FROM tbl_Send_Alert_User tsau
	WHERE AlertId = @AlertId AND tsau.UserType = 'Group'
	--SELECT @ResultString 
	--SELECT tu.deskbar_id as DeskbarId FROM Tbl_Users tu WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString,','))
	SELECT @DeskbarId = STRING_AGG(tu.deskbar_id, ',')
	FROM Tbl_Users tu
	WHERE tu.id IN (SELECT * FROM dbo.SplitString(@ResultString, ','))
	
	SELECT @Status = 1 ,@Message = 'Done'
	
	SELECT MESSAGE = @Message ,STATUS = @Status ,DeskbarId = @DeskbarId

	--SELECT AlertTital as Name,AlertBody as Message,ThemeId as Theme,DesktopSizeWidth as Width,DesktopSizeHeight as Height,
	--AlertPosition as Position,FullScreenAlert as FullScrteen,AutoCloseInMin as AutoCloseinSec,'' as WebURL 
	--FROM tbl_Alert_popUp WHERE AlertId=@AlertId
	
	COMMIT TRANSACTION
	GOTO EndSave
QuitWithRollback:
	IF (@@trancount > 0)
		ROLLBACK TRANSACTION
	BEGIN
		SELECT MESSAGE = @Message ,STATUS = @Status
	END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_Customer_Expired_Popupdata]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* EXEC [USP_Get_Customer_Expired_Popupdata] 'sarita@cygnux.in' */
CREATE PROC [dbo].[USP_Get_Customer_Expired_Popupdata] 
@CustomerId VARCHAR(500)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE @baseCustId INT ,@ExpDays INT ,@PurchasedTrial VARCHAR(50)

	SELECT @baseCustId = ISNULL(CustomerId,0) FROM Tbl_Master_Users WHERE UserId = @CustomerId

	IF @baseCustId > 0 
	BEGIN  
		SELECT @PurchasedTrial = PurchasedTrial ,@ExpDays = (CASE WHEN DATEDIFF(d, GETDATE(), ExpiresDate) < 0 THEN 0 ELSE DATEDIFF(d, GETDATE(), ExpiresDate) + 1 END)
		FROM tbl_CustomerRegistration
		WHERE CustomerId = @baseCustId /*AND PurchasedTrial = 'Trial'*/	
    END
	ELSE
	BEGIN
		SELECT @PurchasedTrial = 'Purchased' ,@ExpDays = 365
	END

	SELECT ExpDays = ISNULL(@ExpDays,0) ,PurchasedTrial = ISNULL(@PurchasedTrial,0)

END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_Repecient_Detail_By_Id]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_Get_Repecient_Detail_By_Id '1',1,68,'01 Aug 2021','18 Nov 2021'
	EXEC USP_Get_Repecient_Detail_By_Id '1','0','145','01 Aug 2021','18 Nov 2021'
	EXEC USP_Get_Repecient_Detail_By_Id '3','0','176','01 Aug 2021','18 Nov 2021'
	EXEC USP_Get_Repecient_Detail_By_Id '1','12','177','01 Aug 2021','18 Nov 2021'
*/
CREATE PROCEDURE [dbo].[USP_Get_Repecient_Detail_By_Id]
(
	@Type VARCHAR(20),
	@CustomerId INT,
	@UserId INT,
	@Fromdate varchar(50),
	@ToDate varchar(50)
)
AS
BEGIN
	SELECT
		a.AlertTital, a.EntryBy, a.EntryDate, a.Type,
		AlertParentId = ISNULL(a.AlertParentId,0),
		a.AlertBody
	FROM tbl_Alert_popUp a WITH(NOLOCK)
	INNER JOIN tbl_Send_Alert_User b WITH(NOLOCK) ON a.AlertId=b.AlertId  
	WHERE a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59' AND ISNULL(a.CustomerId,0)=@CustomerId AND a.Type=@Type  AND b.UserId=@UserId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_SyncDraftData_ForScheduler]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
===============================================================
DESCRIPTION : Call API for Save Sync OU,Group,Scheduler Data
===============================================================
EXEC USP_Get_SyncDraftData_ForScheduler '72','0'
===============================================================
*/
CREATE PROCEDURE [dbo].[USP_Get_SyncDraftData_ForScheduler]
(
	@AD_Header_Id VARCHAR(50),
	@CustomerId VARCHAR(50)
)
AS
BEGIN
	DECLARE @APIString NVARCHAR(MAX) = '';
	/* SET @APIString = 'http://192.168.0.183/XCommAlert/Master/ApplyADSaveSyncData?AD_Header_Id=' + @AD_Header_Id + '&CustomerId=' + @CustomerId; */
	SET @APIString = 'https://tool.xcomms.com/Master/ApplyADSaveSyncData?AD_Header_Id=' + @AD_Header_Id + '&CustomerId=' + @CustomerId;
	
	IF(ISNULL(@APIString,'') <> '')
	BEGIN
		DECLARE @Object AS INT;
		DECLARE @ResponseText AS VARCHAR(8000);
		EXEC sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
		EXEC sp_OAMethod @Object, 'open', NULL, 'post', @APIString,'false';
		EXEC sp_OAMethod @Object, 'setRequestHeader', NULL, 'Content-Type', 'application/json';
		EXEC sp_OAMethod @Object, 'send';
		EXEC sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT
		PRINT 'ResponseText : ' + @ResponseText;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_UserWise_Alert_Ticker_History]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC USP_Get_UserWise_Alert_Ticker_History '43B7BCAD-7847-411B-B490-CFD75544E53B','0'
EXEC USP_Get_UserWise_Alert_Ticker_History '43B7BCAD-7847-411B-B490-CFD75544E53B','1'
*/
CREATE PROCEDURE [dbo].[USP_Get_UserWise_Alert_Ticker_History]
(
	@Deskbar_id VARCHAR(100),
	@Read VARCHAR(1) = '0'
)
AS
BEGIN
	IF (@Read = '1')
	BEGIN
		SELECT TOP 100 * FROM
		(
			SELECT DISTINCT
				AlertTital
			   ,tsau.EntryDate
			   ,AlertBody =''
			   ,tau.AlertId
			   ,ThemeId
			   ,DesktopSizeWidth
			   ,DesktopSizeHeight
			   ,AlertPosition
			   ,FullScreenAlert
			   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
			   ,WebURL = ''/*(CASE tau.Type WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END)*/
			   ,isTicker = CAST((CASE tau.Type WHEN '2' THEN 'true' ELSE 'false' END) AS BIT)
			   ,tsau.SAUseId
			   ,IsReceived = CAST(ISNULL(tsau.IsReceived, 0) AS BIT)
			FROM tbl_Alert_popUp tau WITH (NOLOCK)
			INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK)
				ON tsau.Alertid = tau.Alertid
			INNER JOIN Tbl_Users tu WITH (NOLOCK)
				ON tu.Id = tsau.UserId
			WHERE 1 = 1
			AND tu.deskbar_id = @Deskbar_id 
			AND tsau.Status = 'Send' 
			AND ISNULL(tsau.IsReceived,0) = ISNULL(@Read,0)
			AND tau.Type IN ('1','2')
			AND IsDeleted = 0
			/* AND ISNULL(tau.Iscancel,0) = 0 */
			/* --UNION ALL
			--SELECT DISTINCT
			--	AlertTital = AlertTital
			--   ,tstu.EntryDate
			--   ,AlertBody = AlertBody
			--   ,AlertId = ttu.AlertId
			--   ,ThemeId
			--   ,DesktopSizeWidth = 0
			--   ,DesktopSizeHeight = 0
			--   ,AlertPosition = TickerPosition
			--   ,FullScreenAlert = 0
			--   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
			--   ,WebURL = 'https://tool.xcomms.com/Templates/Tickers/one.html'
			--   ,isTicker = CAST('true' AS BIT)
			--   ,tstu.SAUseId
			--FROM tbl_Alert_popUp ttu WITH (NOLOCK)
			--INNER JOIN tbl_Seand_Alert_User tstu WITH (NOLOCK)
			--	ON tstu.AlertId = ttu.AlertId
			--INNER JOIN Tbl_Users tu WITH (NOLOCK)
			--	ON tu.Id = tstu.UserId
			--WHERE 1 = 1
			--AND tu.deskbar_id = @Deskbar_id AND tstu.Status = 'Send' AND ISNULL(tstu.IsReceived,0) = 1 AND Type=2 */
		)X ORDER BY X.EntryDate DESC;
	END
	ELSE IF (@Read = '0')
	BEGIN
		SELECT TOP 100 * FROM
		(
			SELECT DISTINCT
				AlertTital
			   ,tsau.EntryDate
			   ,AlertBody =''
			   ,tau.AlertId
			   ,ThemeId
			   ,DesktopSizeWidth
			   ,DesktopSizeHeight
			   ,AlertPosition
			   ,FullScreenAlert
			   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
			   ,WebURL = ''/*(CASE tau.Type WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END)*/
			   ,isTicker = CAST((CASE tau.Type WHEN '2' THEN 'true' ELSE 'false' END) AS BIT)
			   ,tsau.SAUseId
			   ,IsReceived = CAST(ISNULL(tsau.IsReceived, 0) AS BIT)
			FROM tbl_Alert_popUp tau WITH (NOLOCK)
			INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tsau.Alertid = tau.Alertid
			CROSS APPLY
			(
				SELECT tu.deskbar_id,tu.PlayAlertSound FROM  dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId), ',') ,',') A INNER JOIN Tbl_Users tu ON tu.Id = A.Items 
				WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau WHERE tsau.AlertId = tau.AlertId  AND tsau.UserType ='User')
			)X
			WHERE 1 = 1
			AND X.deskbar_id = @Deskbar_id 
			AND tsau.Status = 'Send' 
			AND ISNULL(tsau.IsReceived,0) = ISNULL(@Read,0)
			AND tau.Type IN ('1','2')
			AND IsDeleted = 0
			/* AND ISNULL(tau.Iscancel,0) = 0 */
		)X ORDER BY X.EntryDate DESC;
	END
	ELSE
	BEGIN
		SELECT AlertTital = '' ,EntryDate = '',AlertBody ='',
		AlertId = '' ,ThemeId = '' ,DesktopSizeWidth ='' ,
		DesktopSizeHeight='' ,AlertPosition='' ,FullScreenAlert='' ,
		AutoCloseInMin = 0 ,WebURL = '',
		isTicker = CAST('false' AS BIT),
		SAUseId = '' ,IsReceived = CAST(0 AS BIT);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_UserWise_Alert_Ticker_Unread_TrayNotification]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	USP_Get_UserWise_Alert_Ticker_Unread_TrayNotification '59D8D9BB-9E09-4097-91B7-E877E7562D98'
*/ 
CREATE PROCEDURE [dbo].[USP_Get_UserWise_Alert_Ticker_Unread_TrayNotification]
(
	@Deskbar_id VARCHAR(100)
)
AS
BEGIN
	SELECT * FROM
	(
		SELECT DISTINCT
			AlertTital
		   ,tsau.EntryDate
		   ,AlertBody
		   ,tau.Alertid
		   ,ThemeId
		   ,DesktopSizeWidth
		   ,DesktopSizeHeight
		   ,AlertPosition
		   ,FullScreenAlert
		   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
		   ,WebURL = (CASE tau.Type WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END)
		   ,isTicker = CAST((CASE tau.Type WHEN '1' THEN 'false' WHEN '2' THEN 'true' ELSE 'false' END) AS BIT)
		   ,tsau.SAUseId
		   ,X.PlayAlertSound
		FROM tbl_Alert_popUp tau WITH (NOLOCK)
		INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tsau.Alertid = tau.Alertid AND tau.[Type] IN ('1','2')
		/* --INNER JOIN Tbl_Users tu WITH (NOLOCK)
		--	ON tu.Id = tsau.UserId */
		CROSS APPLY
		(
			SELECT tu.deskbar_id,tu.PlayAlertSound FROM  dbo.SplitWithXML(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId)  ,',') A 
			INNER JOIN Tbl_Users tu ON tu.Id = A.Items  AND tu.deskbar_id = @Deskbar_id
			cROSS aPPLY(SELECT cnt=cOUNT(*) FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND Items= tsau.UserId AND tsau.UserType ='User')C
			wHERE cnt=0
			--WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId  AND tsau.UserType ='User')
		)X
		WHERE 1 = 1
		
		/* --AND tau.TrayNotification IS NOT NULL
		--AND tau.TrayNotification = 1 */
		AND (IsReceived = NULL OR IsReceived = 0)
		AND tau.Type IN ('1','2')
		AND IsDeleted = 0
		/* --UNION ALL
		--SELECT DISTINCT
		--	AlertTital = TickerTital
		--   ,tstu.EntryDate
		--   ,AlertBody = TickerBody
		--   ,AlertId = TickerID
		--   ,ThemeId
		--   ,DesktopSizeWidth = 0
		--   ,DesktopSizeHeight = 0
		--   ,AlertPosition = TickerPosition
		--   ,FullScreenAlert = 0
		--   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
		--   ,WebURL = 'http://103.232.124.146/XcommAlert/Templates/Tickers/one.html'
		--   ,isTicker = CAST('true' AS BIT)
		--   ,tstu.SAUseId
		--FROM Tbl_Ticker_popUp ttu WITH (NOLOCK)
		--INNER JOIN tbl_Send_Ticker_User tstu WITH (NOLOCK)
		--	ON tstu.AlertId = ttu.TickerID
		--INNER JOIN Tbl_Users tu WITH (NOLOCK)
		--	ON tu.Id = tstu.UserId
		--WHERE 1 = 1
		--AND tu.deskbar_id = @Deskbar_id
		--AND ttu.TrayNotification IS NOT NULL
		--AND ttu.TrayNotification = 1
		--AND (IsReceived = NULL OR IsReceived = 0) */
	)X ORDER BY X.EntryDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_UserWise_Alert_Ticker_Unread_TrayNotification_Count]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	USP_Get_UserWise_Alert_Ticker_Unread_TrayNotification_Count '59D8D9BB-9E09-4097-91B7-E877E7562D98'
*/ 
CREATE PROCEDURE [dbo].[USP_Get_UserWise_Alert_Ticker_Unread_TrayNotification_Count]
(
	@Deskbar_id VARCHAR(100)
)
AS
BEGIN
	--SELECT * FROM
	--(
		SELECT DISTINCT
			 CNT=cast(Count(*) as varchar)+':'+cast(X.PlayAlertSound as varchar)
		FROM tbl_Alert_popUp tau WITH (NOLOCK)
		INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tsau.Alertid = tau.Alertid AND tau.[Type] IN ('1','2')
		/* --INNER JOIN Tbl_Users tu WITH (NOLOCK)
		--	ON tu.Id = tsau.UserId */
		CROSS APPLY
		(
			SELECT tu.PlayAlertSound FROM  dbo.SplitWithXML(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId)  ,',') A 
			INNER JOIN Tbl_Users tu ON tu.Id = A.Items  AND tu.deskbar_id = @Deskbar_id
			cROSS aPPLY(SELECT cnt=cOUNT(*) FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND Items= tsau.UserId AND tsau.UserType ='User')C
			wHERE cnt=0
			--WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId  AND tsau.UserType ='User')
		)X
		WHERE 1 = 1
		
		/* --AND tau.TrayNotification IS NOT NULL
		--AND tau.TrayNotification = 1 */
		AND (IsReceived = NULL OR IsReceived = 0)
		--AND tau.Type IN ('1','2')
		AND IsDeleted = 0
		Group by 
		X.PlayAlertSound
		/* --UNION ALL
		--SELECT DISTINCT
		--	AlertTital = TickerTital
		--   ,tstu.EntryDate
		--   ,AlertBody = TickerBody
		--   ,AlertId = TickerID
		--   ,ThemeId
		--   ,DesktopSizeWidth = 0
		--   ,DesktopSizeHeight = 0
		--   ,AlertPosition = TickerPosition
		--   ,FullScreenAlert = 0
		--   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
		--   ,WebURL = 'http://103.232.124.146/XcommAlert/Templates/Tickers/one.html'
		--   ,isTicker = CAST('true' AS BIT)
		--   ,tstu.SAUseId
		--FROM Tbl_Ticker_popUp ttu WITH (NOLOCK)
		--INNER JOIN tbl_Send_Ticker_User tstu WITH (NOLOCK)
		--	ON tstu.AlertId = ttu.TickerID
		--INNER JOIN Tbl_Users tu WITH (NOLOCK)
		--	ON tu.Id = tstu.UserId
		--WHERE 1 = 1
		--AND tu.deskbar_id = @Deskbar_id
		--AND ttu.TrayNotification IS NOT NULL
		--AND ttu.TrayNotification = 1
		--AND (IsReceived = NULL OR IsReceived = 0) */
	--)X ORDER BY X.EntryDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_UserWise_Unread_Alert_Ticker]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_Get_UserWise_Unread_Alert_Ticker ''
*/
CREATE PROC [dbo].[USP_Get_UserWise_Unread_Alert_Ticker]
(
	@Deskbar_id VARCHAR(100) = '15CA4901-9949-492F-AA64-BE822DC3DFE8'
)
AS  
BEGIN  
 SELECT   * FROM  
 (  
  SELECT DISTINCT  
   AlertTital  
     ,tau.EntryDate  
     ,AlertBody  
     ,tau.AlertId  
     ,ThemeId  
     ,DesktopSizeWidth=ISNULL(DesktopSizeWidth,0)  
     ,DesktopSizeHeight=ISNULL(DesktopSizeHeight,0)  
     ,AlertPosition =(CASE tau.Type WHEN '1' THEN AlertPosition WHEN '2' THEN TickerPosition ELSE '' END) 
     ,FullScreenAlert =ISNULL(FullScreenAlert,0) 
     ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)  
     ,WebURL =(CASE tau.Type WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END)
     ,isTicker = CAST((CASE tau.Type WHEN '1' THEN 'false' WHEN '2' THEN 'true' ELSE 'false' END) AS BIT)
     ,0 AS SAUseId
	 ,PlayAlertSound = (SELECT tu.PlayAlertSound FROM Tbl_Users tu WHERE tu.deskbar_id = @Deskbar_id)
  FROM tbl_Alert_popUp tau  
  CROSS APPLY (  
   SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau INNER JOIN Tbl_Users tu ON tu.id = tsau.UserId WHERE tsau.AlertId = tau.AlertId AND tu.deskbar_id = @Deskbar_id  
  ) X WHERE 1 = 1  
  AND tau.AlertType = 'BC'  
  AND X.CNT = 0
  AND tau.Type IN ('1','2')
  UNION ALL  
  SELECT DISTINCT  
   AlertTital  
     ,tau.EntryDate  
     ,AlertBody  
     ,tau.AlertId  
     ,ThemeId  
     ,DesktopSizeWidth =ISNULL(DesktopSizeWidth,0)  
     ,DesktopSizeHeight=ISNULL(DesktopSizeHeight,0)   
     ,AlertPosition=(CASE tau.Type WHEN '1' THEN AlertPosition WHEN '2' THEN TickerPosition ELSE '' END)   
     ,FullScreenAlert =ISNULL(FullScreenAlert,0)  
     ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)  
     ,WebURL = (CASE tau.Type WHEN '1' THEN 'https://tool.xcomms.com/Templates/one.html' WHEN '2' THEN 'https://tool.xcomms.com/Templates/Tickers/one.html' ELSE '' END)
     ,isTicker =  CAST((CASE tau.Type WHEN '1' THEN 'false' WHEN '2' THEN 'true' ELSE 'false' END) AS BIT)
     ,0 AS SAUseId
	 ,PlayAlertSound = (SELECT tu.PlayAlertSound FROM Tbl_Users tu WHERE tu.deskbar_id = @Deskbar_id)
  FROM tbl_Alert_popUp tau  
  INNER JOIN tbl_Send_Alert_User tsau  
   ON tsau.AlertId = tau.AlertId  
  --INNER JOIN Tbl_Users tu  
  -- ON tu.id = tsau.UserId  
  CROSS APPLY
  (
	SELECT tu.deskbar_id FROM  dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId), ',') ,',') A
	INNER JOIN Tbl_Users tu ON tu.Id = A.Items WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau
	WHERE tsau.AlertId = tau.AlertId  AND tsau.UserType ='User')
  )X
  WHERE 1 = 1  
  AND X.deskbar_id = @Deskbar_id  
  AND tau.AlertType = 'SR'  
  AND (IsReceived = NULL OR IsReceived = 0)  
  AND tau.Type IN ('1','2')
  --UNION ALL  
  --SELECT DISTINCT  
  -- AlertTital = AlertTital  
  --   ,ttu.EntryDate  
  --   ,AlertBody = AlertBody  
  --   ,AlertId = AlertId  
  --   ,ThemeId  
  --   ,DesktopSizeWidth = 0  
  --   ,DesktopSizeHeight = 0  
  --   ,AlertPosition = TickerPosition  
  --   ,FullScreenAlert = 0  
  --   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)  
  --   ,WebURL = 'http://103.232.124.146/XcommAlert/Templates/Tickers/one.html'  
  --   ,isTicker = CAST('true' AS BIT)  
  --   ,0 AS SAUseId  
  --FROM tbl_Alert_popUp ttu  
  --CROSS APPLY (  
  -- SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tstu INNER JOIN Tbl_Users tu ON tu.id = tstu.UserId WHERE tstu.AlertId = ttu.AlertId AND tu.deskbar_id = @Deskbar_id  
  --) X WHERE 1 = 1  
  --AND ttu.AlertType = 'BC'  
  --AND X.CNT = 0  
  --AND Type=2
  --UNION ALL  
  --SELECT DISTINCT  
  -- AlertTital = AlertTital  
  --   ,ttu.EntryDate  
  --   ,AlertBody = AlertBody  
  --   ,AlertId = ttu.AlertId  
  --   ,ThemeId  
  --   ,DesktopSizeWidth = 0  
  --   ,DesktopSizeHeight = 0  
  --   ,AlertPosition = TickerPosition  
  --   ,FullScreenAlert = 0  
  --   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)  
  --   ,WebURL = 'http://103.232.124.146/XcommAlert/Templates/Tickers/one.html'  
  --   ,isTicker = CAST('true' AS BIT)  
  --   ,0 AS SAUseId  
  --FROM tbl_Alert_popUp ttu  
  --INNER JOIN tbl_Send_Alert_User tstu  
  -- ON tstu.AlertId = ttu.AlertId  
  --INNER JOIN Tbl_Users tu  
  -- ON tu.id = tstu.UserId  
  --WHERE 1 = 1  
  --AND tu.deskbar_id = @Deskbar_id  
  --AND ttu.AlertType = 'SR'  
  --AND (IsReceived = NULL OR IsReceived = 0)  
  --AND Type=2
 )X ORDER BY X.EntryDate DESC  
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetActiveDirectoryList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=====================================================
DESCRIPTION : Get Active Directory Header Detail
=====================================================
EXEC USP_GetActiveDirectoryList 'XCOMMS','0'
EXEC USP_GetActiveDirectoryList 'CYGNUSTEAM','0'
=====================================================
*/
CREATE PROCEDURE [dbo].[USP_GetActiveDirectoryList]
(
	@BaseUserName VARCHAR(50),
	@CustomerId INT
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		AD_HDR.Id, AD_HDR.Domain, AD_HDR.UserId, AD_HDR.[Password],
		AD_HDR.CustomerId, AD_HDR.ADSyncName,
		IsAutoSync = CONVERT(BIT,(CASE WHEN X.ScheduleType = 'Now' THEN 0 ELSE 1 END)),
		Schedule = X.ScheduleType,
		AD_HDR.IsActive, AD_HDR.EntryBy, AD_HDR.EntryDate,
		AD_HDR.UpdateBy, AD_HDR.UpdateDate,
		DomainName = AD_HDR.Domain,
		ADUserName = AD_HDR.UserId,
		ADPassword = AD_HDR.[Password]
	FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
	OUTER APPLY(
		SELECT SS.ScheduleType
		FROM Tbl_AD_Sync_Schedule_Setting SS WITH(NOLOCK)
		WHERE SS.AD_Header_Id = AD_HDR.Id
		AND SS.CustomerId = AD_HDR.CustomerId
	)X
	WHERE AD_HDR.CustomerId = @CustomerId AND AD_HDR.IsActive = 1;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAD_Header_Draft_Schedule_Detail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==============================================================================
DESCRIPTION : Get AD Header,Draft,Scheduler Detail
==============================================================================
EXEC USP_GetAD_Header_Draft_Schedule_Detail 'corp.cygnux.in','administrator','0'
==============================================================================
*/
CREATE PROCEDURE [dbo].[USP_GetAD_Header_Draft_Schedule_Detail]
(
	@DomainName VARCHAR(100),
	@ADUserName VARCHAR(50),
	@CustomerId INT
)
AS
BEGIN
	DECLARE @AD_Header_Id INT = 0;
	SET @AD_Header_Id = (SELECT HDR.Id FROM Tbl_AD_Sync_Header HDR WITH(NOLOCK)
	WHERE HDR.Domain = @DomainName AND HDR.UserId = @ADUserName AND HDR.CustomerId = @CustomerId)

	SELECT
		AD_HDR.Id, AD_HDR.Domain, AD_HDR.UserId, AD_HDR.[Password],
		AD_HDR.CustomerId, AD_HDR.ADSyncName, AD_HDR.IsAutoSync,
		AD_HDR.IsActive, AD_HDR.EntryBy, AD_HDR.EntryDate,
		AD_HDR.UpdateBy, AD_HDR.UpdateDate, AD_HDR.SaveDraftSyncDate,
		AD_HDR.SubmitSyncDate
	FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
	WHERE AD_HDR.Domain = @DomainName AND AD_HDR.UserId = @ADUserName
	AND AD_HDR.CustomerId = @CustomerId;

	IF(@AD_Header_Id > 0 AND @AD_Header_Id != '')
	BEGIN
		SELECT
			HDR.Id, HDR.Domain, HDR.UserId, HDR.[Password],
			HDR.CustomerId, HDR.ADSyncName, HDR.IsAutoSync,
			HDR.IsActive, SD.OUJsonString, SD.GroupJsonString,
			SD.SchedulerXML, SD.SchedulerJobName, SD.JobCreateDate
		FROM Tbl_AD_Sync_Header HDR WITH(NOLOCK)
		INNER JOIN Tbl_AD_SyncSave_Draft SD WITH(NOLOCK) ON SD.AD_Header_Id = HDR.Id
		WHERE HDR.Id = @AD_Header_Id AND HDR.CustomerId = @CustomerId;
	END

	IF(@AD_Header_Id > 0 AND @AD_Header_Id != '')
	BEGIN
		SELECT
			SS.ScheduleId, SS.AD_Header_Id, SS.ScheduleType,
			SS.SyncStartDate, SS.WeeklydaySunday, SS.WeeklydayMonday,
			SS.WeeklydayTuesday, SS.WeeklydayWednesday, SS.WeeklydayThursday,
			SS.WeeklydayFriday, SS.WeeklydaySaturday, SS.CustomerId,
			SS.IsActive, SS.EntryBy, SS.EntryDate, SS.UpdateBy, SS.UpdateDate
		FROM Tbl_AD_Sync_Schedule_Setting SS WITH(NOLOCK)
		WHERE SS.AD_Header_Id = @AD_Header_Id AND SS.CustomerId = @CustomerId;
	END

	SELECT
		cast(ROW_NUMBER() OVER ( ORDER BY DET.Id ) AS VARCHAR) AS [id],
		DET.UserName AS [text],
		ISNULL(DET.AD_ParentUser,'') AS [OU_ParentName],
		DET.AD_GUID AS [UniqueID],
		ISNULL(DET.ParentOUGUID,'') AS [OUGUID]
	FROM Tbl_AD_Sync_Header HDR WITH(NOLOCK) INNER JOIN Tbl_AD_Sync_Detail DET WITH(NOLOCK) ON HDR.Id = DET.AD_Header_Id
	WHERE HDR.Domain = @DomainName AND HDR.CustomerId = @CustomerId
	AND DET.Is_AD_User = 1 AND DET.Is_Sync = 1 ORDER BY det.Id ASC;

	SELECT
		CAST(ROW_NUMBER() OVER ( ORDER BY TG.Id ) AS VARCHAR) AS [Gid],
		TG.GroupName AS [text],
		TG.AD_GuId AS [UniqueID],
		TG.Is_AD_Group AS [Is_AD_Group],
		TG.AD_DomainName AS [AD_DomainName],
		TG.IsADGroupSync AS [IsADGroupSync]
	FROM Tbl_Groups TG WITH(NOLOCK)
	WHERE TG.AD_DomainName = @DomainName AND TG.CustomerId = @CustomerId AND TG.Is_AD_Group = 1
	AND TG.IsADGroupSync = 1 ORDER BY TG.Id ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetADSyncDetailById]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=====================================================
DESCRIPTION : Get Active Directory Detail By ID
=====================================================
EXEC USP_GetADSyncDetailById '2','0'
=====================================================
*/
CREATE PROCEDURE [dbo].[USP_GetADSyncDetailById]
(
	@Id INT,
	@CustomerId INT
)
AS
BEGIN
	SELECT
		HDR.Id, HDR.Domain, HDR.UserId, HDR.[Password],
		HDR.CustomerId, HDR.ADSyncName, HDR.IsAutoSync,
		HDR.IsActive, HDR.EntryBy, HDR.EntryDate,
		HDR.UpdateBy, HDR.UpdateDate, HDR.SaveDraftSyncDate,
		HDR.SubmitSyncDate
	FROM Tbl_AD_Sync_Header HDR WITH(NOLOCK)
	WHERE HDR.Id = @Id AND HDR.CustomerId = @CustomerId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAlertMembers]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==========================================================
DESCRIPTION : Get Group Members List
==========================================================
EXEC USP_GetGroupMemberList '50'
EXEC USP_GetGroupMemberList '49'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetAlertMembers]
(
	@AlertID INT
)
AS
BEGIN
	SET NOCOUNT ON;
	
	    DECLARE @UserIds AS Table
		(
			ID INT
		)

		--Inserting Dest User List
		INSERT INTO @UserIds
		SELECT UserId FROm tbl_Send_Alert_User WHERE Alertid=@AlertId AND UserType='User'
		
		--Inserting Dest Group Members List
		DECLARE @GroupId AS Table
		(
			ID INT
		)

		INSERT INTO @GroupId
		SELECT UserId FROm tbl_Send_Alert_User WHERE Alertid=@AlertId AND UserType='GROUP'


		INSERT INTO @UserIds
		SELECT UserId 			
		FROM Tbl_Users_Group
		WHERE Group_HDR_Id in (SELECT GroupId FROM Tbl_Users_Group WHERE Group_HDR_Id IN (SELECT ID FROM @GroupId) AND IsActive=1) AND IsActive=1 AND GroupId is null

		INSERT INTO @UserIds
		SELECT UserId 			
		FROM Tbl_Users_Group
		WHERE Group_HDR_Id IN (SELECT ID FROM @GroupId) AND IsActive=1 AND GroupId is null

	
	    SELECT DISTINCT ID FROM @UserIds

	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetAlertMembersCount]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==========================================================
DESCRIPTION : Get Group Members List
==========================================================
EXEC USP_GetGroupMemberList '50'
EXEC USP_GetGroupMemberList '49'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetAlertMembersCount]
(
	@AlertID INT
)
AS
BEGIN
	SET NOCOUNT ON;
	
	    DECLARE @UserIds AS Table
		(
			ID INT
		)

		--Inserting Dest User List
		INSERT INTO @UserIds
		exec [dbo].[USP_GetAlertMembers] @AlertId

	    SELECT COUNT(DISTINCT ID) FROM @UserIds

	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetAlertMembersDetails]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION : Get Group Members List
==========================================================
EXEC USP_GetGroupMemberList '50'
EXEC USP_GetGroupMemberList '49'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetAlertMembersDetails]
(
	@AlertID INT
)
AS
BEGIN
	SET NOCOUNT ON;
	
	    DECLARE @UserIds AS Table
		(
			ID INT
		)

		--Inserting Dest User List
		INSERT INTO @UserIds
		exec [dbo].[USP_GetAlertMembers] @AlertId

	    SELECT id,name,email,mobile_phone FROM Tbl_Users with(nolock) WHERE id in (SELECT ID FROM @UserIds)

	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllTickerListDetails]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAllTickerListDetails]  
AS
SET NOCOUNT ON
BEGIN  
	SELECT * FROM tbl_Alert_popUp a 
	INNER JOIN tbl_Alert_Schedule_Setting b ON a.AlertId=b.AlertId
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetContentManagerDetailData]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetContentManagerDetailData '3643'
*/
CREATE PROCEDURE [dbo].[USP_GetContentManagerDetailData]
(
	@AlertId INT
)
AS  
BEGIN

	DECLARE @AlertType VARCHAR(10)='',@TotalReceptient VARCHAR(10)='';
	SELECT @AlertType = tap.AlertType FROM tbl_Alert_popUp tap WHERE tap.AlertId = @AlertId;

	BEGIN
		SELECT
			tu.[Name] AS [Name],
			tu.display_name AS FullName
			--tu.deskbar_id AS ComputerName
		FROM tbl_Send_Alert_User tsau
		INNER JOIN Tbl_Users tu ON tu.id = tsau.UserId WHERE Alertid = @AlertId;
	END  
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetContentManagerDetailsById]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetContentManagerDetailsById] 
@Id INT
AS
SET NOCOUNT ON
BEGIN  
	
	IF(@Id>0)
	BEGIN
		SELECT CAST(TMU.Id AS INT) AS Id,TMU.Name AS FirstName,TMU.UserId AS Username,TMU.UserPwd AS Password,TMU.UserPwd AS OldPassword,TMU.Accesslevel,TMU.LastName,TMU.MFAEnabled,EmailId,Iscancel = case WHEN isnull(TMU.Iscancel,0)=0 then cast(1 as BIT) else cast(0 as BIT) END,
		CASE WHEN TMU.Status=100 THEN 'Active' ELSE 'Inactive' END AS StatusDesc,TP.PermissionName AS AccesslevelDesc FROM Tbl_Master_Users(NOLOCK) TMU
		LEFT OUTER JOIN Tbl_Permission(NOLOCK) TP ON Tp.Id=TMU.Accesslevel
		WHERE TMU.Id=CAST(@Id AS BIGINT) 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetContentManagerList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetContentManagerList]         
@id varchar(20)    
AS        
SET NOCOUNT ON        
BEGIN          
         
 BEGIN     
  DECLARE @custId INT;
  DECLARE @admin BIt;
  select @custId=TMU.CustomerId, @admin=TP.Administator from Tbl_Master_Users TMU       
  LEFT OUTER JOIN Tbl_Permission(NOLOCK) TP ON Tp.Id=TMU.Accesslevel
  WHERE TMU.Id=@id
  
  SELECT CASE WHEN ISNULL(TMU.Iscancel,0)=0 THEN '<span class="label label-success">Yes</span>' ELSE '<span class="label label-danger">No</span>' END AS StatusDesc,        
  TP.PermissionName AS AccesslevelDesc,* FROM Tbl_Master_Users(NOLOCK) TMU        
  LEFT OUTER JOIN Tbl_Permission(NOLOCK) TP ON Tp.Id=TMU.Accesslevel 
  WHERE (TMU.Id=@id OR TMU.ManagerId=@id) OR (@admin=1 AND @custId=TMU.CustomerId)  
  /*WHERE ISNULL(TMU.Iscancel,0)=0  */      
 END        
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerIdByUser]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	EXEC USP_GetCustomerIdByUser 65
*/
CREATE PROCEDURE [dbo].[USP_GetCustomerIdByUser]
(
	@UserId INT
)
AS
BEGIN
	SELECT
		TMU.Id, TMU.UserId,
		CustomerId = ISNULL(TMU.CustomerId,0)
	FROM Tbl_Master_Users TMU WITH(NOLOCK) WHERE TMU.Id = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
=======================================
DESCRIPTION : Get Customers
=======================================
EXEC USP_GetCustomerList
=======================================
*/
CREATE PROCEDURE [dbo].[USP_GetCustomerList]
AS
BEGIN
	SELECT CustomerId, CompanyName, FullName,
	CompanyEmail, PhoneNumber, StartDate,
	ExpiresDate, Cust.PurchasedTrial,
	Purchased = (CASE WHEN Cust.PurchasedTrial = 'Purchased' THEN CAST('true' AS BIT)
	ELSE CAST('false' AS BIT) END),
	Trail = (CASE WHEN Cust.PurchasedTrial = 'Trial' THEN CAST('true' AS BIT)
	ELSE CAST('false' AS BIT) END),
	ModuleId = Module, LicenseCount, Cust.EntryDate, Cust.EntryBy,
	CntModule = ((len(Module) - LEN(REPLACE(Module, ',', '')))+1),
	[Status] = (CASE WHEN GETDATE()<=Cust.ExpiresDate + ' 23:59:59' THEN 'Yes' ELSE 'No' END), AccessLevel,
	ExpDays = (CASE WHEN DATEDIFF(d, GETDATE(), Cust.ExpiresDate) < 0 THEN 0 ELSE DATEDIFF(d, GETDATE(), Cust.ExpiresDate) + 1 END),
	IsBlock = (CASE WHEN US.BlockCnt > 0 THEN CAST('true' AS BIT) ELSE CAST('false' AS BIT) END)
	FROM tbl_CustomerRegistration Cust WITH(NOLOCK)
	OUTER APPLY
	(
		SELECT BlockCnt = COUNT(*) FROM Tbl_Master_Users MU WITH(NOLOCK)
		WHERE MU.CustomerId = Cust.CustomerId AND ISNULL(MU.IsBlock,0) = 1
	)US
	/* --LEFT join CYGNUS_Master_General GN ON GN.CodeId=Cust.Module AND */
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerWiseContentManagerList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetCustomerWiseContentManagerList '24'
*/
CREATE PROCEDURE [dbo].[USP_GetCustomerWiseContentManagerList]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT * FROM
	(
		SELECT
			TMU.Id,
			TMU.UserId,
			TMU.[Name],
			TMU.EntryDate,
			CustomerId = ISNULL(TMU.CustomerId,0),
			Iscancel = ISNULL(TMU.Iscancel,0),
			AccesslevelDesc = TP.PermissionName,
			AlertCnt = ISNULL(AlertCnt1.Count1, 0),
			TickerCnt = ISNULL(TickerCnt.CNT, 0),
			WallPaperCnt = ISNULL(WallPaPerCnt1.Count1, 0),
			ScreenSaverCnt = ISNULL(ScreenSaverCnt1.Count1, 0),
			LockScreenCnt = ISNULL(LockScreenCnt1.Count1, 0)
		FROM Tbl_Master_Users(NOLOCK) TMU
		INNER JOIN Tbl_Permission(NOLOCK) TP ON Tp.Id = TMU.Accesslevel
		OUTER APPLY
		(
			SELECT DISTINCT TAP.EntryBy, COUNT(*) AS Count1
			FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users b ON b.UserId = TAP.EntryBy
			WHERE TAP.Type = 1
			AND b.Accesslevel = Tp.Id
			AND TAP.EntryBy = TMU.UserId
			AND ISNULL(TAP.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE TAP.CustomerId END) = (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE @CustomerId END)
			GROUP BY TAP.EntryBy
		) AlertCnt1
		OUTER APPLY
		(
			SELECT DISTINCT TAP.EntryBy, COUNT(*) AS CNT
			FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users b ON b.UserId = TAP.EntryBy
			WHERE TAP.Type = 2 AND b.Accesslevel = Tp.Id AND TAP.EntryBy = TMU.UserId AND ISNULL(TAP.Iscancel,0) = 0
			GROUP BY TAP.EntryBy
		) TickerCnt
		OUTER APPLY
		(
			SELECT DISTINCT TAP.EntryBy, COUNT(*) AS Count1
			FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users b ON b.UserId = TAP.EntryBy
			WHERE TAP.Type = 3
			AND b.Accesslevel = Tp.Id
			AND TAP.EntryBy = TMU.UserId
			AND ISNULL(TAP.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE TAP.CustomerId END) = (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE @CustomerId END)
			GROUP BY TAP.EntryBy
		) WallPaPerCnt1
		OUTER APPLY
		(
			SELECT DISTINCT TAP.EntryBy, COUNT(*) AS Count1
			FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users b ON b.UserId = TAP.EntryBy
			WHERE TAP.Type = 4
			AND b.Accesslevel = Tp.Id
			AND TAP.EntryBy = TMU.UserId
			AND ISNULL(TAP.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE TAP.CustomerId END) = (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE @CustomerId END)
			GROUP BY TAP.EntryBy
		) ScreenSaverCnt1
		OUTER APPLY
		(
			SELECT DISTINCT TAP.EntryBy, COUNT(*) AS Count1
			FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users b ON b.UserId = TAP.EntryBy
			WHERE TAP.Type = 7
			AND b.Accesslevel = Tp.Id
			AND TAP.EntryBy = TMU.UserId
			AND ISNULL(TAP.Iscancel,0) = 0
			AND (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE TAP.CustomerId END) = (CASE WHEN ISNULL(@CustomerId, 0) = 0 THEN '1' ELSE @CustomerId END)
			GROUP BY TAP.EntryBy
		) LockScreenCnt1
	) XX
	WHERE 1 = 1	AND ISNULL(XX.CustomerId,0) = @CustomerId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerWiseMailSMTPConfiguration]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetCustomerWiseMailSMTPConfiguration '0'
	EXEC USP_GetCustomerWiseMailSMTPConfiguration '12'
*/
CREATE PROCEDURE [dbo].[USP_GetCustomerWiseMailSMTPConfiguration]
(
	@CustomerID INT
)
AS
BEGIN
	SELECT
		SMTP.Id, SmtpServer = ISNULL(SMTP.SmtpServer,''),
		SmtpPort = ISNULL(SMTP.SmtpPort,''), SmtpUserName = ISNULL(SMTP.SmtpUserName,''),
		SmtpPassword = ISNULL(SMTP.SmtpPassword,''), FromAddress = ISNULL(SMTP.FromAddress,''),
		RecepientAddress = ISNULL(SMTP.RecepientAddress,''), SMTP.TLSSL,
		SMTP.SmtpSetting, SMTP.EmailSupport, CustomerId = ISNULL(SMTP.CustomerId,0)
	FROM tbl_Smtpconfiguratation SMTP WITH(NOLOCK)
	WHERE SMTP.CustomerId = @CustomerID;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetDefaultSettingByCustomer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetDefaultSettingByCustomer '0'
	EXEC USP_GetDefaultSettingByCustomer '12'
*/
CREATE PROCEDURE [dbo].[USP_GetDefaultSettingByCustomer]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT
		DS.Id, DS.AlertPosition, DS.FullScreenAlert, DS.isResize, DS.DesktopSizeWidth,
		DS.DesktopSizeHeight, DS.TickerPosition, DS.TickerSpeed, DS.CriticalAlert,
		DS.ExpiresIn, DS.ExpiresTimeValue, DS.ExpiresTimeType, DS.AutoCloseIn,
		AutoCloseInMin = (CASE WHEN AutoCloseIn = 1 AND ISNULL(DS.AutoCloseInMin,0) > 0 THEN DS.AutoCloseInMin ELSE 5 END),
		DS.TrayNotification, DS.AcknoledgrButton, DS.EntryDate, DS.EntryBy, DS.UpdateBy, DS.UpdateDate,
		DS.ThemeId, DS.ThemeIdTic, DS.CoustomerId, DS.Timeinterval, DS.ScreenWaitMinutes, DS.IsOnResumeDisplay,
		DS.CompanyLogo
	FROM tbl_Alert_Ticker_Default_Setting DS WITH(NOLOCK)
	WHERE ISNULL(DS.CoustomerId,0) = @CustomerId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetDraftList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetDraftList '1','FullViewing','ERP SOLUTION',1
	EXEC USP_GetDraftList '1','FullViewing','CYGNUSTEAM','0'
*/
CREATE PROCEDURE [dbo].[USP_GetDraftList]
(
	@Type VARCHAR(5),
	@ViewingType VARCHAR(200),
	@BaseUser VARCHAR(500),
	@CustomerId INT
)
AS
BEGIN
	SELECT * FROM tbl_Alert_popUp(NOLOCK) a
	INNER JOIN tbl_Alert_Schedule_Setting(NOLOCK) b ON a.AlertId = b.AlertId
	WHERE UPPER(Status)='DRAFTS' AND ISNULL(Iscancel,0)=0 AND [Type] = @Type AND AlertParentId IS NULL
	/* AND (CASE WHEN @ViewingType='Personal' THEN a.EntryBy ELSE '1' END )=(CASE WHEN @ViewingType='Personal' THEN @BaseUser ELSE '1' END ) */
	AND a.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE a.EntryBy  END)
	/* AND (CASE WHEN @CustomerId =0  THEN '1' ELSE a.CustomerId  END ) = (CASE WHEN @CustomerId=0 THEN '1' ELSE @CustomerId END ) */
	AND a.CustomerId = @CustomerId
	ORDER BY a.AlertId DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetExcelData]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC Usp_GetExcelData
*/
CREATE PROCEDURE [dbo].[Usp_GetExcelData]
(
	@AlertId INT,
	@Status VARCHAR(50),
	@ModuleType INT
)
AS
BEGIN    
	EXEC USP_PopAlertAnalyticDetail @AlertId, @Status, @ModuleType
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetExcelDataForContentManager]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	exec Usp_GetExcelDataForContentManager 'xcomms','3','27 Sep 2021','26 Oct 2021'
*/
CREATE PROCEDURE [dbo].[Usp_GetExcelDataForContentManager]
(
	@UserId varchar(50),  
	@Type varchar(50),
	@Fromdate VARCHAR(50),
	@ToDate VARCHAR(50)
)
AS    
BEGIN  
	EXEC USP_ContentManagerAnalticDetail @UserId,@Type,@Fromdate,@ToDate
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetExcelDataForContentManagerDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_GetExcelDataForContentManagerDetail]    
 @AlertId INT 
AS    
BEGIN    
   
EXEC USP_GetContentManagerDetailData @AlertId
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetExcelDataForModal]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_GetExcelDataForModal]
(
	@AlertId INT,
	@Status VARCHAR(50),
	@ModuleType INT
)
AS
BEGIN
	EXEC USP_PopAlertAnalyticDetail @AlertId,@Status,@ModuleType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetExistSMTPCountByCustomer]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetExistSMTPCountByCustomer '0'
	EXEC USP_GetExistSMTPCountByCustomer '12'
	EXEC USP_GetExistSMTPCountByCustomer '24'
*/
CREATE PROCEDURE [dbo].[USP_GetExistSMTPCountByCustomer]
(
	@CustomerID INT
)
AS
BEGIN
	SELECT
		CNT = COUNT(*)
	FROM tbl_Smtpconfiguratation SMTP WITH(NOLOCK) WHERE SMTP.CustomerId = @CustomerID;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGeneralMasterobject]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetGeneralMasterobject 'WALLPAPERTYPE'
*/
CREATE PROCEDURE [dbo].[USP_GetGeneralMasterobject]
(
	@CodeType varchar(50)  
)
AS
BEGIN
	SELECT
		CodeId,CodeDesc
	FROM CYGNUS_Master_General WITH(NOLOCK)
	WHERE CodeType=@CodeType AND StatusCode='Y';
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroupList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION : Get Customer Wise Group DataList
==========================================================
EXEC USP_GetGroupList '0'
EXEC USP_GetGroupList '1'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetGroupList]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT      
		TG.Id, TG.GroupName, TG.GroupType, TG.IsActive, TG.EntryBy,    
		TG.EntryDate, TG.UpdateBy, TG.UpdateDate,
		TG.CustomerId, TG.Is_AD_Group, TG.IsADGroupSync
	FROM Tbl_Groups TG WITH (NOLOCK)    
	WHERE ISNULL(CustomerId,0)=@CustomerId  
	ORDER BY TG.Id DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroupMemberList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION : Get Group Members List
==========================================================
EXEC USP_GetGroupMemberList '50'
EXEC USP_GetGroupMemberList '49'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetGroupMemberList]
(
	@GroupId INT
)
AS
BEGIN
	SET NOCOUNT ON;
	declare @custid integer;
	SET @custid = (SELECT CustomerId FROm Tbl_Groups WHERE ID=@GroupId)
	IF (SELECT CustomerId FROm Tbl_Groups WHERE ID=@GroupId) > 0
	BEGIN
		SELECT
			RowId = ROW_NUMBER() OVER (ORDER BY TG.GroupName),
			Id = CONVERT(INT,TG.Id),
			IsChecked = ISNULL(X.IsActive,0),
			GroupName = TG.GroupName,
			EntryBy = TG.EntryBy,
			EntryDate = TG.EntryDate,
			IsActive = TG.IsActive,
			TG.Is_AD_Group,AD_GuId =ISNULL(TG.AD_GuId,''),
			AD_DomainName = ISNULL(TG.AD_DomainName,''), TG.IsADGroupSync
		FROM Tbl_Groups TG WITH(NOLOCK)
		OUTER APPLY
		(
			SELECT
				TUG.IsActive
			FROM Tbl_Users_Group TUG WITH(NOLOCK)
			WHERE TUG.GroupId = TG.Id AND TUG.Type='Group'
			AND TUG.Group_HDR_Id = @GroupId
		)X
		WHERE TG.CustomerId=@custid
		ORDER BY TG.Id DESC;
		END
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroupMemberListV1]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==========================================================
DESCRIPTION : Get Group Members List
==========================================================
EXEC USP_GetGroupMemberList '50'
EXEC USP_GetGroupMemberList '49'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetGroupMemberListV1]
(
	@GroupId INT
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		RowId = ROW_NUMBER() OVER (ORDER BY TG.GroupName),
		Id = CONVERT(INT,TG.Id),
		IsChecked = ISNULL(X.IsActive,0),
		GroupName = TG.GroupName,
		EntryBy = TG.EntryBy,
		EntryDate = TG.EntryDate,
		IsActive = TG.IsActive,
		TG.Is_AD_Group,AD_GuId =ISNULL(TG.AD_GuId,''),
		AD_DomainName = ISNULL(TG.AD_DomainName,''), TG.IsADGroupSync
	FROM Tbl_Groups TG WITH(NOLOCK)
	OUTER APPLY
	(
		SELECT
			TUG.IsActive
		FROM Tbl_Users_Group TUG WITH(NOLOCK)
		WHERE TUG.GroupId = TG.Id AND TUG.Type='Group'
		AND TUG.Group_HDR_Id = @GroupId
	)X
	ORDER BY TG.Id DESC;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroupMembersListOnly]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetGroupMembersListOnly]
(
	@GroupId INT
)
AS
BEGIN
	DECLARE @custid INT;

	SET @custid = (
		SELECT CustomerId 
		FROM Tbl_Groups 
		WHERE ID = @GroupId
	);

	SET NOCOUNT ON;

	SELECT
		RowId = ROW_NUMBER() OVER (ORDER BY TU.display_name),
		ID = CONVERT(INT, TU.Id),
		[Name] = TU.[name],
		DisplayName = TU.display_name,
		Email = TU.email,
		EntryDate = TU.reg_date,
		Y.CNT AS Assigned,
		TU.Is_AD_User,
		AD_GuId = ISNULL(TU.AD_GuId, ''),
		AD_DomainName = ISNULL(TU.AD_DomainName, ''),
		TU.IsADSync
	FROM Tbl_Users TU WITH(NOLOCK)
	INNER JOIN Tbl_Users_Group TUG WITH(NOLOCK)
		ON TUG.UserId = TU.ID 
		AND TUG.Type = 'User'
		AND TUG.Group_HDR_Id = @GroupId
	OUTER APPLY (
		SELECT COUNT(*) AS CNT 
		FROM Tbl_Users_Group tug2 WITH(NOLOCK)
		WHERE tug2.UserId = TU.Id AND tug2.Group_HDR_Id <> @GroupId
	) Y
	WHERE ISNULL(TU.Iscancel, 0) = 0
	  AND TU.ParentCustId = @custid
	ORDER BY TU.ID DESC;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroupUsersList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
===================================
DESCRIPTION : Get Group Users List
===================================
EXEC USP_GetGroupUsersList '50'
EXEC USP_GetGroupUsersList '49'
===================================
*/
CREATE PROCEDURE [dbo].[USP_GetGroupUsersList]
(
	@GroupId INT
)
AS
BEGIN
	declare @custid integer;
	SET @custid = (SELECT CustomerId FROm Tbl_Groups WHERE ID=@GroupId)
	SET NOCOUNT ON;
	
	SELECT
		RowId = ROW_NUMBER() OVER (ORDER BY TU.display_name),
		ID = CONVERT(INT,TU.Id),
		IsChecked = ISNULL(X.IsActive,0),
		[Name] = TU.[name],
		DisplayName = TU.display_name,
		Email = TU.email,
		EntryDate = TU.reg_date,
		Y.CNT AS Assiged,
		TU.Is_AD_User,AD_GuId =ISNULL(TU.AD_GuId,''),
		AD_DomainName = ISNULL(TU.AD_DomainName,''), TU.IsADSync
	FROM Tbl_Users TU WITH(NOLOCK)
	OUTER APPLY
	(
		SELECT
			TUG.IsActive, TUG.Group_HDR_Id
		FROM Tbl_Users_Group TUG WITH(NOLOCK)
		WHERE TUG.UserId = TU.ID AND TUG.Type='User'
		AND TUG.Group_HDR_Id = @GroupId
	)X
	OUTER APPLY(
		SELECT COUNT(*) AS CNT FROM Tbl_Users_Group tug WITH(NOLOCK)
		WHERE tug.UserId = tu.Id AND tug.Group_HDR_Id <> @GroupId
	)Y
	WHERE ISNULL(TU.Iscancel,0) = 0 AND TU.ParentCustId=@custid
	ORDER BY TU.id DESC;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroupUsersListV1]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
===================================
DESCRIPTION : Get Group Users List
===================================
EXEC USP_GetGroupUsersList '50'
EXEC USP_GetGroupUsersList '49'
===================================
*/
CREATE PROCEDURE [dbo].[USP_GetGroupUsersListV1]
(
	@GroupId INT
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		RowId = ROW_NUMBER() OVER (ORDER BY TU.display_name),
		ID = CONVERT(INT,TU.Id),
		IsChecked = ISNULL(X.IsActive,0),
		[Name] = TU.[name],
		DisplayName = TU.display_name,
		Email = TU.email,
		EntryDate = TU.reg_date,
		Y.CNT AS Assiged,
		TU.Is_AD_User,AD_GuId =ISNULL(TU.AD_GuId,''),
		AD_DomainName = ISNULL(TU.AD_DomainName,''), TU.IsADSync
	FROM Tbl_Users TU WITH(NOLOCK)
	OUTER APPLY
	(
		SELECT
			TUG.IsActive, TUG.Group_HDR_Id
		FROM Tbl_Users_Group TUG WITH(NOLOCK)
		WHERE TUG.UserId = TU.ID AND TUG.Type='User'
		AND TUG.Group_HDR_Id = @GroupId
	)X
	OUTER APPLY(
		SELECT COUNT(*) AS CNT FROM Tbl_Users_Group tug WITH(NOLOCK)
		WHERE tug.UserId = tu.Id AND tug.Group_HDR_Id <> @GroupId
	)Y
	WHERE ISNULL(TU.Iscancel,0) = 0
	ORDER BY TU.id DESC;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetHistoryList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
	EXEC USP_GetHistoryList '1','FullViewing','CYGNUSTEAM','0'
*/
CREATE PROCEDURE [dbo].[USP_GetHistoryList]
(
	@Type VARCHAR(5),
	@ViewingType VARCHAR(200),
	@BaseUser VARCHAR(500),
	@CustomerId INT
)
AS
BEGIN
	SELECT
		TAP.AlertId,
		AlertParentId = ISNULL(TAP.AlertParentId,0),
		TAP.AlertTital,
		TAP.EntryDate,
		TAP.EntryBy,
		TAP.DesktopSizeHeight,
		TAP.DesktopSizeWidth,
		TAP.AlertPosition,
		/* (CASE WHEN TASS.SchedulePatternType IN ('Now', 'Once') THEN '<span class="label label-danger">No</span>'
		ELSE '<span class="label label-success">Yes</span>' END) AS Recurring, */
		(CASE WHEN TASS.SchedulePatternType IN ('Now', 'Once') THEN 'No' ELSE 'Yes' END) AS Recurring,
		X.Resend,
		TAP.FullScreenAlert,
		IsActive = ISNULL(TAP.Iscancel,0)
	FROM tbl_Alert_popUp TAP WITH(NOLOCK)
	INNER JOIN tbl_Alert_Schedule_Setting TASS WITH (NOLOCK) ON TAP.AlertId = TASS.AlertId
	OUTER APPLY (SELECT Resend = COUNT(*) FROM tbl_Alert_popUp AP WITH (NOLOCK) WHERE AP.AlertParentId = TAP.AlertId) X
	WHERE UPPER(Status) = 'SEND' AND TAP.[Type] = @Type
	AND TAP.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE TAP.EntryBy END)
	AND CustomerId = @CustomerId
	AND TAP.IsDeleted = 0
	/* AND ISNULL(TAP.Iscancel,0) = 0 */
	--ORDER BY TAP.EntryDate DESC;

	/* --AND AlertParentId is NULL */
	/* --AND (CASE WHEN @ViewingType='Personal' THEN a.EntryBy ELSE '1' END )=(CASE WHEN @ViewingType='Personal' THEN @BaseUser ELSE '1' END ) */
	/* AND (CASE WHEN @CustomerId = 0 THEN '1' ELSE TAP.CustomerId END) = (CASE WHEN @CustomerId = 0 THEN '1' ELSE @CustomerId END) */
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetHistoryListForEmail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
EXEC USP_GetHistoryListForEmail 5 ,'Personal','CYGNUSTEAM'
*/
CREATE PROC [dbo].[USP_GetHistoryListForEmail] 
@Type VARCHAR(5),
@ViewingType VARCHAR(200),
@BaseUser VARCHAR(500),
@CustomerId INT = 0
AS
SET NOCOUNT ON
BEGIN  
	SELECT Status=(CASE WHEN Status IS NULL THEN 'Drafts' WHEN Status='Send' THEN 'Sent' ELSE Status END ),* ,ROW_NUMBER() over (order by a.EntryDate) as SrNo,
	--CASE WHEN b.SchedulePatternType IN ('Now','Daily') THEN '<span class="label label-danger">No</span>' ELSE '<span class="label label-success">Yes</span>' END AS Recurring,
	X.Resend
	FROM tbl_Alert_popUp a 
	OUTER APPLY(SELECT Resend=count(*) FROM tbl_Alert_popUp WHERE AlertParentId=a.AlertId)X
	WHERE ISNULL(a.Iscancel,0)=0 AND Type=@Type 
	AND a.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE a.EntryBy  END)
	AND ISNULL(a.CustomerId,0) = @CustomerId
	ORDER BY a.EntryDate DESC
END
 
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLastest_WP_SS_LS_ByUserId_Online]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Description : WP/SS/LS - Content delivering (One Minute) after client comes back online process.
-------------------------------------------------------------------------------------------------
EXEC USP_GetLastest_WP_SS_LS_ByUserId_Online '8D7A4E38-70A7-4E04-9551-85A86343B38D'
EXEC USP_GetLastest_WP_SS_LS_ByUserId_Online '93AA87DC-0215-4856-B06B-19D29FA987CA'
EXEC USP_GetLastest_WP_SS_LS_ByUserId_Online '43B7BCAD-7847-411B-B490-CFD75544E53B'
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[USP_GetLastest_WP_SS_LS_ByUserId_Online]
(
	@DeskbarId VARCHAR(100)
)
AS
BEGIN
	DECLARE @ContentCount INT,  @ReturnCode NVARCHAR(MAX), @AutoJobName NVARCHAR(200) = '';
	DECLARE @DeleteLevel INT = 0, @dbname SYSNAME;
	DECLARE @StringQuery VARCHAR(MAX) = ''

	/*---------- START : Stored UnDelivered Content In Temp Table ----------*/
	DECLARE @UnDeliveredContent TABLE
	(
		SrNo INT, AlertId INT, AlertTital NVARCHAR(MAX), [Type] INT, EntryDate DATETIME,
		IsTicker BIT, SAUseId INT, IsReceived BIT, UserId INT, DeskbarId VARCHAR(255)
	)

	INSERT INTO @UnDeliveredContent
	SELECT * FROM
	(
		SELECT
			ROW_NUMBER() OVER(PARTITION BY TAP.[Type] ORDER BY TAP.EntryDate DESC) AS Srno,
			TAP.AlertId,
			TAP.AlertTital,
			[TAP].[Type],
			TSAU.EntryDate,
			isTicker = CAST((CASE TAP.[Type] WHEN '2' THEN 'true' ELSE 'false' END) AS BIT),
			TSAU.SAUseId,
			IsReceived = CAST(ISNULL(TSAU.IsReceived, 0) AS BIT),
			TSAU.UserId,
			@DeskbarId AS DeskbarId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK)
		INNER JOIN tbl_Send_Alert_User TSAU WITH(NOLOCK) ON TSAU.AlertId = TAP.AlertId
		OUTER APPLY
		(
			SELECT tu.deskbar_id, tu.PlayAlertSound
			FROM dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(TSAU.UserId), ','), ',') A
			INNER JOIN Tbl_Users tu WITH(NOLOCK) ON tu.Id = A.Items
			WHERE A.Items NOT IN
			( SELECT TSAU.UserId FROM tbl_Send_Alert_User TSAU WITH(NOLOCK) WHERE TSAU.AlertId = TAP.AlertId AND TSAU.UserType = 'User' )
		)GroupUserDeskId
		OUTER APPLY
		( SELECT TU.deskbar_id FROM Tbl_Users TU WITH(NOLOCK) WHERE TU.id IN (TSAU.UserId))UserDeskId
		WHERE 1 = 1 AND @DeskbarId IN (GroupUserDeskId.deskbar_id, UserDeskId.deskbar_id) AND TAP.[Status] = 'Send'
		AND ISNULL(TSAU.IsReceived, 0) = 0 AND TAP.[Type] IN ('3', '4', '7')
	) QueryData WHERE QueryData.Srno = 1 ORDER BY QueryData.EntryDate DESC;
	/*---------- END : Stored UnDelivered Content In Temp Table ----------*/

	SELECT @ContentCount = COUNT(*) FROM @UnDeliveredContent;
	IF(@ContentCount > 0)
	BEGIN
		/*---------- CURSOR START : CREATE JOB FOR SENT AUTO SCHEDULER CONTENT ----------*/
		DECLARE @SrNo INT, @AlertId INT, @AlertTital NVARCHAR(MAX), @Type INT, @EntryDate DATETIME;
		DECLARE @IsTicker BIT, @SAUseId INT, @IsReceived BIT, @UserId INT;

		DECLARE AD_User_cursor CURSOR FOR
		SELECT
			SrNo = TempTbl.SrNo,
			AlertId = TempTbl.AlertId,
			AlertTital = TempTbl.AlertTital,
			[Type] = TempTbl.[Type],
			EntryDate = TempTbl.EntryDate,
			IsTicker = TempTbl.IsTicker,
			SAUseId = TempTbl.SAUseId,
			IsReceived = TempTbl.IsReceived,
			UserId = TempTbl.UserId
		FROM
		(
			SELECT * FROM @UnDeliveredContent
		)TempTbl
		OPEN AD_User_cursor
		FETCH NEXT FROM AD_User_cursor INTO @SrNo, @AlertId, @AlertTital, @Type, @EntryDate, @IsTicker, @SAUseId, @IsReceived, @UserId
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @AutoJobName = 'UnDeliveredContent_' + CONVERT(VARCHAR,@AlertId);
			
			DECLARE @jobId BINARY(16);
			SELECT @jobId = job_id FROM msdb.dbo.sysjobs WHERE (name = @AutoJobName);
			IF (@jobId IS NOT NULL)
			BEGIN
			    EXEC msdb.dbo.sp_delete_job @jobId
			END

			BEGIN TRANSACTION
				DECLARE @AutoJobId UNIQUEIDENTIFIER;
				SET @AutoJobId = NULL

				DECLARE @StartDateint INT, @StartTimeint INT;
				SET @StartDateint = CAST(CONVERT(VARCHAR, GETDATE(), 112) AS INT);
				SET @StartTimeint = REPLACE(CONVERT(VARCHAR, DATEADD(MINUTE,1,GETDATE()),108),':','');

				/*---------- Start : Create/Update Job Step 1 : General ----------*/
				EXEC @ReturnCode = msdb.dbo.sp_add_job
				@job_name = @AutoJobName,
				@enabled = 1,
				@description = N'Auto Schedule For Content Deliver Client ComeBack Online Process',
				@category_name = '[Uncategorized (Local)]',
				@owner_login_name = 'sa',
				@notify_level_eventlog = 0,
				@notify_level_email = 0,
				@notify_level_netsend = 0,
				@notify_level_page = 0,
				@notify_email_operator_name = NULL,
				@delete_level = @DeleteLevel,
				@job_id = @AutoJobId OUTPUT
				IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
				/*---------- End : Create/Update Job Step 1 : General ----------*/


				/*---------- Start : Create Job Step 2 : Steps ----------*/
				SET @dbname = DB_NAME();
				SET @StringQuery = 'EXEC Alert_Auto_Schedule_list ''' + CAST(@AlertId AS VARCHAR(50)) + ''',
				''' + CAST(@Type AS VARCHAR(50)) + ''',''' + CAST(@IsTicker AS VARCHAR(50)) + ''',
				''' + CAST(@DeskbarId AS VARCHAR(100)) + ''' ';

				EXEC @ReturnCode = msdb.dbo.sp_add_jobstep
				@job_id = @AutoJobId,
				@step_id = 1,
				@step_name = 'Auto UnDeliver Content WP/SS/LS Schedule Step',
				@subsystem = N'TSQL',
				@command = @StringQuery,
				@cmdexec_success_code = 0,
				@on_success_action = 1,
				@on_success_step_id = 0,
				@on_fail_action = 2,
				@on_fail_step_id = 0,
				@database_name = @dbname,
				@retry_attempts = 0,
				@retry_interval = 0,
				@os_run_priority = 0,
				@flags = 0
				IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
				/*---------- End : Create Job Step 2 : Steps ----------*/
					
				EXEC @ReturnCode = msdb.dbo.sp_update_job
				@job_id = @AutoJobId,
				@start_step_id = 1
				IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
					
				/*---------- Start : Create Job Step 3 : Schedules ----------*/
				EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule
				@job_id = @AutoJobId,
				@name = 'Auto ActiveDirectory Scheduler',
				@enabled = 1,
				@freq_type = 1,
				@freq_interval = 0,
				@freq_subday_type = 0,
				@freq_subday_interval = 0,
				@freq_recurrence_factor = 0,
				@freq_relative_interval = 0,
				@active_start_date = @StartDateint,
				@active_end_date = 0,
				@active_start_time = @StartTimeint,
				@active_end_time = 0
				IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

				EXEC @ReturnCode = msdb.dbo.sp_add_jobserver
				@job_id = @AutoJobId,
				@server_name = N'(local)',
				@automatic_post = 1
				IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
				/*---------- End : Create Job Step 3 : Schedules ----------*/

				PRINT @AutoJobName;
				PRINT @AlertId;

			COMMIT TRANSACTION
			GOTO EndSave
			QuitWithRollback:
			    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
			EndSave:

		FETCH NEXT FROM AD_User_cursor INTO @SrNo, @AlertId, @AlertTital, @Type, @EntryDate, @IsTicker, @SAUseId, @IsReceived, @UserId
		END
		
		CLOSE AD_User_cursor
		DEALLOCATE AD_User_cursor
		/*---------- CURSOR END : CREATE JOB FOR SENT AUTO SCHEDULER CONTENT ----------*/
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLastest_WP_SS_LS_ByUserId_Online_BKP_22022022]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetLastest_WP_SS_LS_ByUserId_Online_BKP_22022022 'EB62CB58-0B5B-4A10-AF35-32C30882ECA2'
*/
CREATE PROCEDURE [dbo].[USP_GetLastest_WP_SS_LS_ByUserId_Online_BKP_22022022]
(
	@Deskbar_id VARCHAR(100)
)
AS
BEGIN
	SELECT * FROM
	(
		SELECT
			ROW_NUMBER() OVER(PARTITION BY tau.[Type] ORDER BY tau.EntryDate DESC) AS Srno,
			tau.AlertTital,
			TSAU.EntryDate,
			AlertBody = '',
			tau.AlertId,
			tau.ThemeId,
			tau.DesktopSizeWidth,
			tau.DesktopSizeHeight,
			tau.AlertPosition,
			tau.FullScreenAlert,
			AutoCloseInMin = ISNULL(tau.AutoCloseInMin, 0),
			WebURL = '',
			isTicker = CAST((CASE tau.[Type] WHEN '2' THEN 'true' ELSE 'false' END) AS BIT),
			TSAU.SAUseId,
			IsReceived = CAST(ISNULL(TSAU.IsReceived, 0) AS BIT),
			TSAU.UserId,
			[tau].[Type]
		FROM tbl_Alert_popUp tau WITH(NOLOCK)
		INNER JOIN tbl_Send_Alert_User TSAU WITH(NOLOCK) ON TSAU.AlertId = tau.AlertId
		OUTER APPLY
		(
			SELECT tu.deskbar_id, tu.PlayAlertSound
			FROM dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(TSAU.UserId), ','), ',') A
			INNER JOIN Tbl_Users tu WITH(NOLOCK) ON tu.Id = A.Items
			WHERE A.Items NOT IN
			(
				SELECT TSAU.UserId FROM tbl_Send_Alert_User TSAU WITH(NOLOCK)
				WHERE TSAU.AlertId = tau.AlertId AND TSAU.UserType = 'User'
			)
		)GroupUserDeskId
		OUTER APPLY
		(
			SELECT TU.deskbar_id FROM Tbl_Users TU WITH(NOLOCK) WHERE TU.id IN (TSAU.UserId)
		)UserDeskId
		WHERE 1 = 1 AND @Deskbar_id IN (GroupUserDeskId.deskbar_id, UserDeskId.deskbar_id) AND tau.[Status] = 'Send'
		AND ISNULL(TSAU.IsReceived, 0) = 0 AND tau.[Type] IN ('3', '4', '7')
	) QueryData
	WHERE QueryData.Srno = 1
	ORDER BY QueryData.EntryDate DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLastest_WP_SS_LS_ByUserId_Online_BKP_CR_18Feb22]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetLastest_WP_SS_LS_ByUserId_Online_BKP_CR_18Feb22 '59D8D9BB-9E09-4097-91B7-E877E7562D98'
*/
CREATE PROCEDURE [dbo].[USP_GetLastest_WP_SS_LS_ByUserId_Online_BKP_CR_18Feb22]
(
	@Deskbar_id VARCHAR(100) = '15CA4901-9949-492F-AA64-BE822DC3DFE8'
)
AS
BEGIN
	SELECT
		*
	FROM (SELECT
			AlertTital
		   ,tsau.EntryDate
		   ,AlertBody = ''
		   ,tau.AlertId
		   ,ThemeId
		   ,DesktopSizeWidth
		   ,DesktopSizeHeight
		   ,AlertPosition
		   ,FullScreenAlert
		   ,AutoCloseInMin = ISNULL(AutoCloseInMin, 0)
		   ,WebURL = ''
		   /*(CASE tau.Type WHEN '1' THEN 'http://103.232.124.146/XcommAlert/Templates/one.html' WHEN '2' THEN 'http://103.232.124.146/XcommAlert/Templates/Tickers/one.html' ELSE '' END)*/
		   ,isTicker = CAST((CASE tau.Type WHEN '2' THEN 'true' ELSE 'false' END) AS BIT)
		   ,tsau.SAUseId
		   ,IsReceived = CAST(ISNULL(tsau.IsReceived, 0) AS BIT)
		   ,tsau.UserId
		   ,[Type]
		   ,SRNO = ROW_NUMBER() OVER (PARTITION BY tau.Type ORDER BY tau.EntryDate DESC)
		FROM tbl_Alert_popUp tau WITH(NOLOCK)
		INNER JOIN tbl_Send_Alert_User tsau WITH(NOLOCK) ON tsau.AlertId = tau.AlertId
		--INNER JOIN Tbl_Users tu WITH (NOLOCK) ON tu.Id = tsau.UserId
		CROSS APPLY 
		(
			SELECT tu.deskbar_id ,tu.PlayAlertSound FROM dbo.SplitString(dbo.DistinctCommaSeperatedList(dbo.UFN_GET_USERS_FROM_GROUP_SUBGROUP(tsau.UserId), ','), ',') A INNER JOIN Tbl_Users tu ON tu.Id = A.Items
			WHERE Items NOT IN (SELECT tsau.UserId FROM tbl_Send_Alert_User tsau WHERE tsau.AlertId = tau.AlertId AND tsau.UserType = 'User')
		) X
		WHERE 1 = 1
		AND X.deskbar_id = @Deskbar_id
		AND tsau.Status = 'Send'
		AND ISNULL(tsau.IsReceived, 0) = 0
		AND tau.Type IN ('3', '4', '7')
	--AND tau.AlertId IN ('3589')
	) X
	WHERE X.Srno = 1
	ORDER BY X.EntryDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMenus_NewPortal]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[USP_GetMenus_NewPortal]  
AS   
/*  
USP_GetMenus_NewPortal  
*/  
SET NOCOUNT ON;  
BEGIN  
 SELECT * FROM Tbl_Master_Menu WITH(NOLOCK) WHERE IsNewPortal=1  
END  
  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetOrganizationList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetOrganizationList]  
AS
SET NOCOUNT ON
BEGIN  
	SELECT * FROM Tbl_Organization_Details
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPermissionDetails]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetPermissionDetails]  
 AS 
 SET NOCOUNT ON;  
 BEGIN  
 SELECT PermissionName AS UserName,* FROM Tbl_Permission WITH(NOLOCK)  
  END 
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPermissionDetailsById]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Exec USP_GetPermissionDetailsById 7  
*/  
CREATE PROC [dbo].[USP_GetPermissionDetailsById]   
@Id INT  
AS  
SET NOCOUNT ON  
BEGIN    
   
 IF(@Id>0)  
 BEGIN  
  SELECT A.Id,A.PermissionName AS PermissionlevelName,CASE WHEN B.IsEntireOrganization=1 THEN 1 ELSE 0 END AS PermittedToTarget1,  
  CASE WHEN B.IsCoustomize =1 THEN 2 ELSE 0 END AS CustomizeTarget1,  
  CASE WHEN A.Administator =1 THEN 1 ELSE 0 END  AS Administator1,  
  CASE WHEN A.ContentManager=1 THEN 2 ELSE 0 END AS ContentManager1,  
  CASE WHEN A.Custom=1 THEN 3 ELSE 0 END AS Custom1,  
  CASE WHEN B.Personal=1 THEN 1 ELSE 0 END AS PersonalContent1,  
  CASE WHEN B.FullViewing =1 THEN 2 ELSE 0 END AS FullPermission1  
  FROM Tbl_Permission(NOLOCK) A INNER JOIN Tbl_PermissionSettings(NOLOCK) B ON A.Id=B.PermissionId WHERE A.Id=CAST(@Id AS BIGINT)   
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPermissionList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
EXEC USP_GetPermissionList  '1'  
EXEC USP_GetPermissionList  '0'  
*/  
CREATE PROCEDURE [dbo].[USP_GetPermissionList]    
@CustomerId INT  
AS  
BEGIN    
SET NOCOUNT ON;  
 IF(ISNULL(@CustomerId,0) > 0)  
 BEGIN  
  SELECT TW.Id,TW.PermissionName,X.Cnt AS Permissioncount,* FROM Tbl_Permission TW WITH (NOLOCK)    
  OUTER APPLY(    
   SELECT COUNT(*) AS Cnt FROM Tbl_Master_Users(NOLOCK) TMU WHERE TMU.Accesslevel=TW.Id AND ISNULL(TMU.Iscancel,0)=0   
  )X  
  WHERE ISNULL(TW.Iscancel,0)=0 AND CustomerId = @CustomerId  
 END  
 ELSE  
 BEGIN  
  SELECT TW.Id,TW.PermissionName,X.Cnt AS Permissioncount,* FROM Tbl_Permission TW WITH (NOLOCK)    
  OUTER APPLY(    
   SELECT COUNT(*) AS Cnt FROM Tbl_Master_Users(NOLOCK) TMU WHERE TMU.Accesslevel=TW.Id AND ISNULL(TMU.Iscancel,0)=0   
  )X  
  WHERE ISNULL(TW.Iscancel,0)=0 AND ISNULL(CustomerId,'') = ''  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPopUpAnalyticsData]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetPopUpAnalyticsData] @Type VARCHAR(10),
@AlertId INT,
@TenantId INT,
@BaseUserName VARCHAR(50),
@ViewingType VARCHAR(50)
AS
	DECLARE @TemTable AS TABLE (
		SrNo BIGINT
	   ,AlertBody VARCHAR(MAX)
	   ,Type VARCHAR(50)
	   ,AlertId INT
	   ,Status VARCHAR(100)
	   ,AlertType VARCHAR(100)
	   ,EntryDate VARCHAR(100)
	   ,EntryDateDesc VARCHAR(100)
	   ,Active VARCHAR(100)
	   ,EntryBy VARCHAR(100)
	   ,Recurring VARCHAR(100)
	   ,AlertTital VARCHAR(MAX)
	   ,AcknowledgementRequested VARCHAR(100)
	   ,NoOfRecipientes VARCHAR(100)
	   ,Delivered VARCHAR(100)
	   ,Delivered_Per VARCHAR(100)
	   ,NotDelivered VARCHAR(100)
	   ,NotDelivered_Per VARCHAR(100)
	   ,Acknowledged VARCHAR(100)
	   ,Acknowledged_Per VARCHAR(100)
	)

	
	DECLARE @UserIds AS Table(ID INT)

	INSERT INTO @UserIds
	exec [dbo].[USP_GetAlertMembers] @AlertId
	
	DECLARE @totalUsers INT = (SELECT COUNT(DISTINCT ID) FROM @UserIds)
	DECLARE @totalDelivered INT = (SELECT COUNT(*) FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = @AlertId AND ISNULL(tsau.IsReceived, 0) = 1)
	DECLARE @totalAcknowledged INT = (SELECT COUNT(*) FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = @AlertId AND ISNULL(tsau.IsAcknowledge, 0) = 1)
	DECLARE @notDelivered INT = @totalUsers-@totalDelivered
	
	DECLARE @Todate VARCHAR(100) = CONVERT(VARCHAR, GETDATE(), 106)
	INSERT INTO @TemTable
	VALUES(1,'test',@Type,@AlertId,'1','','','','','','','','',@totalUsers,@totalDelivered,CAST(IIF(@totalUsers=0,0,(@totalDelivered*100)/@totalUsers) as varchar(100))+'% ',@notDelivered,CAST(IIF(@totalUsers=0,0,(@notDelivered*100)/@totalUsers) as varchar(100)) + '% ',@totalAcknowledged,CAST(IIF(@totalUsers=0,0,(@totalAcknowledged*100)/@totalUsers) as varchar(100)) + '% ')
	SELECT * FROM @TemTable
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPopUpAnalyticsDataV1]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetPopUpAnalyticsDataV1] @Type VARCHAR(10),
@AlertId INT,
@TenantId INT,
@BaseUserName VARCHAR(50),
@ViewingType VARCHAR(50)
AS
	DECLARE @TemTable AS TABLE (
		SrNo BIGINT
	   ,AlertBody VARCHAR(MAX)
	   ,Type VARCHAR(50)
	   ,AlertId INT
	   ,Status VARCHAR(100)
	   ,AlertType VARCHAR(100)
	   ,EntryDate VARCHAR(100)
	   ,EntryDateDesc VARCHAR(100)
	   ,Active VARCHAR(100)
	   ,EntryBy VARCHAR(100)
	   ,Recurring VARCHAR(100)
	   ,AlertTital VARCHAR(MAX)
	   ,AcknowledgementRequested VARCHAR(100)
	   ,NoOfRecipientes VARCHAR(100)
	   ,Delivered VARCHAR(100)
	   ,Delivered_Per VARCHAR(100)
	   ,NotDelivered VARCHAR(100)
	   ,NotDelivered_Per VARCHAR(100)
	   ,Acknowledged VARCHAR(100)
	   ,Acknowledged_Per VARCHAR(100)

	)
	DECLARE @Todate VARCHAR(100) = CONVERT(VARCHAR, GETDATE(), 106)
	INSERT INTO @TemTable
	EXEC USP_PopAlertList @Type,'01 Jan 2019',@Todate,@TenantId,@BaseUserName,@ViewingType
	SELECT * FROM @TemTable WHERE AlertId = @AlertId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPopUpList_By_Type]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
	EXEC USP_GetPopUpList_By_Type '1','1','878'
*/
CREATE PROCEDURE [dbo].[USP_GetPopUpList_By_Type]
(
	@Type VARCHAR(5),
	@CustomerId INT = 0,
	@AlertId INT = 0
)
AS
SET NOCOUNT ON
BEGIN
	IF (@Type = 3 OR @Type = 7)
	BEGIN
		SELECT a.AlertId,AlertTital,AlertBody,CriticalAlert,AutoCloseIn,AutoCloseInMin,ExpiresIn,ExpiresTimeValue,
		ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,DesktopSizeWidth,DesktopSizeHeight,a.AlertPosition
		,a.EntryDate,a.EntryBy,a.UpdateBy,a.UpdateDate,Status,Iscancel,Cancelby,CancelDate,ThemeId,AlertType,SRUsertpy,
		SRGrouptyp,JobName,isResize,Type,TickerSpeed,TickerPosition,AlertParentId,c.SchedulePatternType
		FROM tbl_Alert_popUp a
		INNER JOIN tbl_Alert_Schedule_Setting c ON a.AlertId = c.AlertId
		LEFT OUTER JOIN CYGNUS_Master_General b
		ON b.CodeId = a.AlertPosition AND b.CodeType = 'WALLPAPERTYPE'
		WHERE a.Type = @Type AND @AlertId = (CASE WHEN @AlertId > 0 THEN a.AlertId ELSE 0 END) AND ISNULL(a.CustomerId,0) = @CustomerId
	END
	ELSE IF (@Type = 4)
	BEGIN
		SELECT a.AlertId,AlertTital,AlertBody,CriticalAlert = ISNULL(a.IsOnResumeDisplay,0),AutoCloseIn,AutoCloseInMin = a.ScreenWaitMinutes
		,ExpiresIn,ExpiresTimeValue,ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,DesktopSizeWidth,DesktopSizeHeight,a.AlertPosition
		,a.EntryDate,a.EntryBy,a.UpdateBy,a.UpdateDate,Status,Iscancel,Cancelby,CancelDate,ThemeId,AlertType,SRUsertpy,SRGrouptyp,JobName,
		isResize,Type,TickerSpeed,TickerPosition,AlertParentId,c.SchedulePatternType
		FROM tbl_Alert_popUp a
		INNER JOIN tbl_Alert_Schedule_Setting c ON a.AlertId = c.AlertId
		LEFT OUTER JOIN CYGNUS_Master_General b ON b.CodeId = a.AlertPosition AND b.CodeType = 'ScreenSaverType'
		WHERE a.Type = @Type AND @AlertId = (CASE WHEN @AlertId > 0 THEN a.AlertId ELSE 0 END) AND ISNULL(a.CustomerId,0) = @CustomerId
	END
	ELSE IF (@Type = 5)
	BEGIN
		SELECT AlertId,AlertTital,AlertBody,CriticalAlert,AutoCloseIn,AutoCloseInMin,ExpiresIn,ExpiresTimeValue,
		ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,DesktopSizeWidth,DesktopSizeHeight,a.AlertPosition
		,a.EntryDate,a.EntryBy,UpdateBy,UpdateDate,Status,Iscancel,Cancelby,CancelDate,ISNULL(ThemeId,'') AS ThemeId,AlertType,
		SRUsertpy,SRGrouptyp,JobName,isResize,Type,TickerSpeed,TickerPosition,AlertParentId
		FROM tbl_Alert_popUp a WHERE a.Type = @Type AND @AlertId = (CASE WHEN @AlertId > 0 THEN a.AlertId ELSE 0 END) AND ISNULL(a.CustomerId,0) = @CustomerId
	END
	ELSE
	BEGIN
		SELECT *
		FROM tbl_Alert_popUp a
		INNER JOIN tbl_Alert_Schedule_Setting b
		ON a.AlertId = b.AlertId AND a.Type = @Type AND @AlertId = (CASE WHEN @AlertId > 0 THEN a.AlertId ELSE 0 END) AND ISNULL(a.CustomerId,0) = @CustomerId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetQuiz_FinalScore_AnswerResultsByQuizId]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetQuiz_FinalScore_AnswerResultsByQuizId '7724','43B7BCAD-7847-411B-B490-CFD75544E53B'
*/
CREATE PROCEDURE [dbo].[USP_GetQuiz_FinalScore_AnswerResultsByQuizId]
(
	@QuizId INT,
	@DeskbarId NVARCHAR(100)
)
AS
BEGIN
	DECLARE @TotalQues INT = 0, @AnswerCNT INT=0, @ShowQuizFinalScore BIT = 0, @ShowQuizAnswerResult BIT = 0;
	SELECT @TotalQues = COUNT(*) FROM tbl_QuizQuestion QQ WITH(NOLOCK) WHERE QQ.QuizId = @QuizId;

	SELECT @AnswerCNT = SUM(X.CA) FROM (
		SELECT CA = (CASE
						WHEN QQ.QuestionType='SA' THEN (CASE WHEN UA.CorrectAnswer = QA.Answer THEN 1 ELSE 0 END)
						ELSE QA.CorrectAnswer
					END)
		FROM tbl_UserQuizAnswer UA WITH(NOLOCK)
		OUTER APPLY
		(
			SELECT QuestionType FROM tbl_QuizQuestion QQ WITH(NOLOCK) WHERE QQ.QuizId=UA.QuizId AND QQ.Id = UA.QuestId
		)QQ
		OUTER APPLY
		(
			SELECT QuestId,Answer,CorrectAnswer FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId = UA.QuestId
			AND QA.Id = (CASE
				WHEN QQ.QuestionType = 'SA' THEN (SELECT TOP 1 ID FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId=UA.QuestId AND QA.Answer = UA.CorrectAnswer)
				WHEN QQ.QuestionType = 'MCQ' THEN (SELECT TOP 1 Id FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId=UA.QuestId AND QA.Answer = UA.CorrectAnswer)
				ELSE UA.CorrectAnswer END)
		)QA
		WHERE UA.QuizId = @QuizId AND UA.DeskbarId = @DeskbarId
	)X;

	SELECT @ShowQuizFinalScore = TAP.ShowQuizFinalScore, @ShowQuizAnswerResult = TAP.ShowQuizAnswerResult
	FROM tbl_Alert_popUp TAP WITH(NOLOCK) WHERE [Type] = 6 AND TAP.AlertId = @QuizId;


	/*---------- START : GET QUIZ CONCERNING SCORE ----------*/
	SELECT ISNULL(@AnswerCNT,0) AS CorrectScore,
	IsNULL(CONVERT(INT , ((CONVERT(DECIMAL(18,2), @AnswerCNT) / CONVERT(DECIMAL(18,2), @TotalQues)) * 100)), 0) AS CorrectAnsPer,
	@TotalQues AS TotalQuestions,
	@ShowQuizFinalScore AS ShowQuizFinalScore,
	@ShowQuizAnswerResult AS ShowQuizAnswerResult;
	/*---------- END : GET QUIZ CONCERNING SCORE ----------*/


	/*---------- START : GET SUBMITTED QUIZ RESULT ----------*/
	SELECT DISTINCT
		Q.QuestionType,
		Q.Question,
		SubmittedAnswer = UserAns.CorrectAnswer,
		CorrectAnswer = CA.Answer
	FROM tbl_QuizQuestion Q WITH(NOLOCK)
	INNER JOIN tbl_QuizAnswer QANS ON Q.Id = QANS.QuestId
	OUTER APPLY
	(
		SELECT
			Answer = (CASE
				WHEN Q.QuestionType = 'MCQ' THEN STUFF((SELECT ' , ' + A.Answer FROM tbl_QuizAnswer A WITH(NOLOCK)
				WHERE A.QuestId = (SELECT Id FROM tbl_QuizQuestion TQQ WHERE TQQ.QuizId = @QuizId AND TQQ.QuestionType = 'MCQ') FOR XML PATH('')), 1, 1, '')
			ELSE QA.Answer END)
		FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId = Q.Id AND QA.CorrectAnswer = 1
	)CA
	OUTER APPLY
	(
		SELECT
		CorrectAnswer = (CASE
			WHEN Q.QuestionType = 'SC' THEN (SELECT TQA.Answer FROM tbl_QuizAnswer TQA WHERE TQA.Id = TUQA.CorrectAnswer)
			WHEN Q.QuestionType = 'TF' THEN (SELECT TQA.Answer FROM tbl_QuizAnswer TQA WHERE TQA.Id = TUQA.CorrectAnswer)
			WHEN Q.QuestionType = 'MCQ' THEN STUFF((SELECT ' , ' + A.Answer FROM tbl_QuizAnswer A WITH(NOLOCK)
			WHERE A.QuestId = (SELECT Id FROM tbl_QuizQuestion TQQ WHERE TQQ.QuizId = @QuizId AND TQQ.QuestionType = 'MCQ') FOR XML PATH('')), 1, 1,	 '')
			ELSE TUQA.CorrectAnswer END)
		FROM tbl_UserQuizAnswer TUQA WITH(NOLOCK) WHERE TUQA.QuizId = Q.QuizId AND TUQA.QuestId = Q.Id
	)UserAns
	WHERE Q.QuizId = @QuizId;
	/*---------- END : GET SUBMITTED QUIZ RESULT ----------*/
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetQuiz_FinalScore_AnswerResultsByQuizId_BKP]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetQuiz_FinalScore_AnswerResultsByQuizId '7712','43B7BCAD-7847-411B-B490-CFD75544E53B'
*/
CREATE PROCEDURE [dbo].[USP_GetQuiz_FinalScore_AnswerResultsByQuizId_BKP]
(
	@QuizId INT,
	@DeskbarId NVARCHAR(100)
)
AS
BEGIN
	DECLARE @TotalQues INT = 0, @AnswerCNT INT=0, @ShowQuizFinalScore BIT = 0, @ShowQuizAnswerResult BIT = 0;
	SELECT @TotalQues = COUNT(*) FROM tbl_QuizQuestion QQ WITH(NOLOCK) WHERE QQ.QuizId = @QuizId;

	SELECT @AnswerCNT = SUM(X.CA) FROM (
		SELECT CA = (CASE
						WHEN QQ.QuestionType='SA' THEN (CASE WHEN UA.CorrectAnswer = QA.Answer THEN 1 ELSE 0 END)
						ELSE QA.CorrectAnswer
					END)
		FROM tbl_UserQuizAnswer UA WITH(NOLOCK)
		OUTER APPLY
		(
			SELECT QuestionType FROM tbl_QuizQuestion QQ WITH(NOLOCK) WHERE QQ.QuizId=UA.QuizId AND QQ.Id = UA.QuestId
		)QQ
		OUTER APPLY
		(
			SELECT QuestId,Answer,CorrectAnswer FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId = UA.QuestId
			AND QA.ID= (CASE
				WHEN QQ.QuestionType = 'SA' THEN (SELECT TOP 1 ID FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId=UA.QuestId AND QA.Answer = UA.CorrectAnswer)
				WHEN QQ.QuestionType = 'MCQ' THEN (SELECT TOP 1 Id FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId=UA.QuestId AND QA.Answer = UA.CorrectAnswer)
				ELSE UA.CorrectAnswer END)
		)QA
		WHERE UA.QuizId = @QuizId AND UA.DeskbarId = @DeskbarId
	)X;

	SELECT @ShowQuizFinalScore = TAP.ShowQuizFinalScore, @ShowQuizAnswerResult = TAP.ShowQuizAnswerResult
	FROM tbl_Alert_popUp TAP WITH(NOLOCK) WHERE [Type] = 6 AND TAP.AlertId = @QuizId;


	/*---------- START : GET QUIZ CONCERNING SCORE ----------*/
	SELECT ISNULL(@AnswerCNT,0) AS CorrectScore,
	CONVERT(INT , ((CONVERT(DECIMAL(18,2), @AnswerCNT) / CONVERT(DECIMAL(18,2), @TotalQues)) * 100)) AS CorrectAnsPer,
	@TotalQues AS TotalQuestions,
	@ShowQuizFinalScore AS ShowQuizFinalScore,
	@ShowQuizAnswerResult AS ShowQuizAnswerResult;
	/*---------- END : GET QUIZ CONCERNING SCORE ----------*/


	/*---------- START : GET SUBMITTED QUIZ RESULT ----------*/
	SELECT DISTINCT
		Q.QuestionType,
		Q.Question,
		SubmittedAnswer = '',
		CorrectAnswer = ISNULL(CA.Answer,'')
	FROM tbl_QuizQuestion Q WITH(NOLOCK)
	INNER JOIN tbl_QuizAnswer A ON Q.Id = A.QuestId
	OUTER APPLY
	(
		SELECT
			Answer = (CASE
				WHEN Q.QuestionType = 'MCQ' THEN STUFF((SELECT ' , ' + ISNULL(A.Answer,'') FROM tbl_QuizAnswer A WITH(NOLOCK)
				WHERE A.QuestId = (SELECT Id FROM tbl_QuizQuestion TQQ WHERE TQQ.QuizId = @QuizId AND TQQ.QuestionType = 'MCQ') FOR XML PATH('')), 1, 1, '')
			ELSE QA.Answer END)
		FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId = Q.Id AND QA.CorrectAnswer = 1
	)CA
	WHERE Q.QuizId = @QuizId;
	/*---------- END : GET SUBMITTED QUIZ RESULT ----------*/
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetQuizEditList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC USP_GetQuizEditList '423'
*/
CREATE PROC [dbo].[USP_GetQuizEditList] 
@AlertId VARCHAR(5)
AS
SET NOCOUNT ON
BEGIN 
   Declare @Title VARCHAR(50);
   SELECT @Title=AlertTital  from tbl_Alert_popUp WHERE AlertId=@AlertId 
   SELECT *,ROW_NUMBER() OVER (ORDER BY Id ) AS SrNo,@Title AS AlertTitle,@AlertId AS AlertId FROM tbl_QuizQuestion  WHERE QuizId=@AlertId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTemplateListDetails]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTemplateListDetails]   
@CudtomerId INT  
AS    
SET NOCOUNT ON    
BEGIN      
 SELECT ID,TemplateName,TemplateTitle,TemplateBody,EntryDate,EntryBy   
 FROM Tbl_Template(NOLOCK)   
 WHERE ISNULL(Iscancel,0)=0    
 AND ISNULL(CudtomerId,0)=@CudtomerId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserDetails]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetUserDetails]  
 AS  

 SET NOCOUNT ON;  
 BEGIN  
  
 SELECT * FROM Tbl_Master_Users WITH(NOLOCK)  
   
  END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserListForPermission]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetUserListForPermission]      
@Id INT,    
@CusomerId INT    
AS      
BEGIN    
	SET NOCOUNT ON;

	DECLARE @UserList VARCHAR(MAX), @IsCustomize BIT;
	SELECT 
		@UserList = UserList,
		@IsCustomize = ISNULL(IsCoustomize, 0) 
	FROM Tbl_PermissionSettings WITH(NOLOCK)
	WHERE PermissionId = @Id;

	-- Temp table to hold users and groups
	DECLARE @Temp TABLE (
		UserId INT,
		UserName VARCHAR(255),
		DeskbarId VARCHAR(255),
		UserType VARCHAR(50)
	);

	-- Insert Users
	INSERT INTO @Temp
	SELECT 
		id AS UserId,
		name AS UserName,
		display_name AS DeskbarId,
		'User' AS UserType
	FROM Tbl_Users WITH(NOLOCK)
	WHERE ISNULL(Iscancel, 0) <> 1
	  AND ParentCustID = @CusomerId;

	-- Insert Groups
	INSERT INTO @Temp
	SELECT 
		id AS UserId,
		GroupName AS UserName,
		'' AS DeskbarId,
		'Group' AS UserType
	FROM Tbl_Groups WITH(NOLOCK)
	WHERE IsActive = 1
	  AND CustomerId = @CusomerId;

	-- Final output: Filter if customized, else return all
	
	SELECT 
		ROW_NUMBER() OVER (ORDER BY UserId) AS SrNo,
		UserId,
		UserName,
		DeskbarId,
		UserType,
		CAST(
			CASE 
				WHEN @IsCustomize = 0 THEN 1
				WHEN ',' + @UserList + ',' LIKE '%,' + CAST(UserId AS VARCHAR) + ',%' THEN 1
				ELSE 0
			END AS BIT
		) AS Newchacked

	FROM @Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserListForSendAlert_bkp]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetUserListForSendAlert_bkp]
(
	@User BIT,
	@Group BIT,
	@ViewingType VARCHAR(200),
	@BaseUser VARCHAR(500),
	@CustomerId INT,
	@Targeting VARCHAR(100)
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @AccessLevel VARCHAR(100), @UserList VARCHAR(MAX);
	SELECT @AccessLevel = Accesslevel FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @BaseUser;
	SELECT @UserList = UserList FROM Tbl_PermissionSettings WITH(NOLOCK) WHERE PermissionId = @AccessLevel;

	DECLARE @IncludeUsers BIT = @User;
	DECLARE @IncludeGroups BIT = @Group;
	DECLARE @IsCustomTargeting BIT = IIF(@Targeting = 'Coustomize', 1, 0);

	DECLARE @UserTable TABLE (
		UserId INT,
		UserName VARCHAR(255),
		UserType VARCHAR(50),
		DeskbarId VARCHAR(255),
		email VARCHAR(255),
		ComputerName VARCHAR(255),
		mobile_phone VARCHAR(50),
		IsOnline BIT,
		Is_AD_User BIT,
		AD_DomainName VARCHAR(255),
		IsADSync BIT,
		LastLoginDateUTC DATETIME
	);

	IF @IncludeUsers = 1
	BEGIN
		INSERT INTO @UserTable
		SELECT
			id AS UserId,
			[name] AS UserName,
			'User' AS UserType,
			deskbar_id AS DeskbarId,
			email,
			display_name AS ComputerName,
			mobile_phone,
			CAST(CASE WHEN ISNULL(DATEDIFF(MINUTE, last_date, GETUTCDATE()), 31) <= 5 THEN 1 ELSE 0 END AS BIT),
			Is_AD_User,
			ISNULL(AD_DomainName, ''),
			IsADSync,
			last_date
		FROM Tbl_Users WITH(NOLOCK)
		WHERE ISNULL(Iscancel, 0) <> 1
		  AND ISNULL(ParentCustID, 0) = @CustomerId;
	END

	IF @IncludeGroups = 1
	BEGIN
		INSERT INTO @UserTable
		SELECT
			id AS UserId,
			GroupName AS UserName,
			'Group' AS UserType,
			'' AS DeskbarId,
			'' AS email,
			'' AS ComputerName,
			'' AS mobile_phone,
			CAST(0 AS BIT),
			Is_AD_Group,
			ISNULL(AD_DomainName, ''),
			IsADGroupSync,
			GETUTCDATE()
		FROM Tbl_Groups WITH(NOLOCK)
		WHERE IsActive = 1
		  AND ISNULL(CustomerId, 0) = @CustomerId;
	END

	-- Final Output with Conditional Filtering
	SELECT ROW_NUMBER() OVER (ORDER BY UserId) AS SrNo, *
	FROM @UserTable
	WHERE 
		@Targeting <> 'Coustomize'
		OR ',' + @UserList + ',' LIKE '%,' + CAST(UserId AS VARCHAR) + ',%';
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserListForSendAlert_bkp_2023]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION : Get Customer Wise Group DataList
==========================================================
EXEC USP_GetUserListForSendAlert_bkp 'True','True','FullViewing','CYGNUSTEAM','0','EntireOrganization'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetUserListForSendAlert_bkp_2023]
(
	@User BIT,
	@Group BIT,
	@ViewingType varchar(200),
	@BaseUser varchar(500),
	@CustomerId INT,
	@Targeting varchar(100)
)
AS
BEGIN
	DECLARE @ACccesslevel VARCHAR(100),@UserList VARCHAR(MAX);
	SELECT @ACccesslevel=Accesslevel FROM Tbl_Master_Users WITH(NOLOCK) WHERE UserId = @BaseUser;
	SELECT @UserList=UserList FROM Tbl_PermissionSettings WITH(NOLOCK) WHERE PermissionId = @ACccesslevel;

	IF(@User = 'True' AND @Group = 'True' AND @Targeting='Coustomize')
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY UserId) AS SrNo, * FROM
		(
			SELECT
				id AS UserId,
				[name] AS UserName,
				'User' AS UserType,
				deskbar_id AS DeskbarId,
				email,
				display_name AS ComputerName,
				mobile_phone,
				IsOnline = CAST(CASE WHEN ISNULL(DATEDIFF(SECOND,last_date,GETUTCDATE()),31) <= 59 THEN 1 ELSE 0 END AS BIT),
				Is_AD_User,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync
			FROM Tbl_Users WITH(NOLOCK)
			WHERE id IN (SELECT RTRIM(LTRIM(Items)) FROM dbo.Split(@UserList, ','))
			AND ISNULL(Iscancel,0) <> 1 AND ISNULL(ParentCustID,0) = @CustomerId
			UNION ALL
			SELECT
				id AS UserId,
				GroupName AS UserName,
				'Group' AS UserType,
				'' AS DeskbarId,
				email = '',
				'' AS ComputerName,
				'' AS mobile_phone,
				IsOnline = CAST(0 AS BIT),
				Is_AD_User = Is_AD_Group,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync = IsADGroupSync
			FROM Tbl_Groups WITH(NOLOCK)
			WHERE IsActive = 1 AND ISNULL(CustomerId,0) = @CustomerId
		)X
	END
	ELSE IF(@User = 'True' AND @Group = 'True' AND @Targeting!='Coustomize')
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY UserId) AS SrNo, * FROM
		(
			SELECT
				id AS UserId,
				[name] AS UserName,
				'User' AS UserType,
				deskbar_id AS DeskbarId,
				email,
				display_name AS ComputerName,
				mobile_phone,
				IsOnline = CAST(CASE WHEN ISNULL(DATEDIFF(SECOND,last_date,GETUTCDATE()),31) <= 59 THEN 1 ELSE 0 END AS BIT),
				Is_AD_User,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync
			FROM Tbl_Users WITH(NOLOCK)
			WHERE ISNULL(Iscancel,0) <> 1 AND ISNULL(ParentCustID,0) = @CustomerId
			UNION ALL
			SELECT
				id AS UserId,
				GroupName AS UserName,
				'Group' AS UserType,
				'' AS DeskbarId,
				email = '',
				'' AS ComputerName,
				'' AS mobile_phone,
				IsOnline = CAST(0 AS BIT),
				Is_AD_User = Is_AD_Group,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync = IsADGroupSync
			FROM Tbl_Groups WITH(NOLOCK)
			WHERE IsActive=1 AND ISNULL(CustomerId,0) = @CustomerId
		)X
	END
	IF(@User = 'True' AND @Group = 'False' AND @Targeting='Coustomize')
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY UserId) AS SrNo, * FROM
		(
			SELECT
				id AS UserId,
				[name] AS UserName,
				'User' AS UserType,
				deskbar_id AS DeskbarId,
				email,
				display_name AS ComputerName,
				mobile_phone,
				IsOnline = CAST(CASE WHEN ISNULL(DATEDIFF(SECOND,last_date,GETUTCDATE()),31) <= 59 THEN 1 ELSE 0 END AS BIT),
				Is_AD_User,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync
			FROM Tbl_Users WITH(NOLOCK)
			WHERE id IN (SELECT RTRIM(LTRIM(Items)) FROM dbo.Split(@UserList, ','))
			AND ISNULL(Iscancel,0) <> 1 AND ISNULL(ParentCustID,0) = @CustomerId        
		)X
	END                  
	IF(@User = 'True' AND @Group = 'False' AND @Targeting!='Coustomize')
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY UserId) AS SrNo, * FROM
		(
			SELECT
				id AS UserId,
				[name] AS UserName,
				'User' AS UserType,
				deskbar_id AS DeskbarId,
				email,
				display_name AS ComputerName,
				mobile_phone,
				IsOnline = CAST(CASE WHEN ISNULL(DATEDIFF(SECOND,last_date,GETUTCDATE()),31) <= 59 THEN 1 ELSE 0 END AS BIT),
				Is_AD_User,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync
			FROM Tbl_Users WITH(NOLOCK)
			WHERE ISNULL(Iscancel,0) <> 1 AND ISNULL(ParentCustID,0) = @CustomerId
		)X            
	END
	IF(@User = 'False' AND @Group = 'True')
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY UserId) AS SrNo, * FROM
		(
			SELECT
				id AS UserId,
				GroupName AS UserName,
				'Group' AS UserType,
				'' AS DeskbarId,
				email = '',
				'' AS ComputerName,
				'' AS mobile_phone,
				IsOnline = CAST(0 AS BIT),
				Is_AD_User = Is_AD_Group,
				AD_DomainName = ISNULL(AD_DomainName,''),
				IsADSync = IsADGroupSync
			FROM Tbl_Groups WITH(NOLOCK)
			WHERE IsActive = 1 AND ISNULL(CustomerId,0) = @CustomerId
		)X
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUserMenuRights]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*    
Usp_GetUserMenuRights '10001','1'    
SELECT * from CYGNUS_Master_Menu_Access WHERE UserId='YPR004'    
SELECT Status,* from CYGNUS_Master_Users WHERE UserId='YPR004'      
exec Usp_GetUserMenuRights 'CYGNUTEAM','0'    
*/    
CREATE Proc [dbo].[Usp_GetUserMenuRights]  
@UserId VARCHAR(50),    
@Type VARCHAR(1) = null    
AS    
SET NOCOUNT ON;    
BEGIN  
 IF(@Type != '1')  
 BEGIN  
  SELECT   
   [MenuID]=a.MenuId,b.[UserId],[DisplayName],[ParentID],[NavigationURL],[DisplayRank],[HasAccess]=isnull(HasAccess,'0'),[MenuLevel],[IsNewPortal]  
   ,a.[MenuIcon],a.[Action],a.[Action1],a.[Action2],a.[Action3],a.[Controller]  
  FROM Tbl_MASTER_MENU a  
  INNER JOIN Tbl_Master_Menu_Access b ON a.Menuid=B.Menuid AND userId=@UserId AND a.IsNewPortal=1  
  WHERE IsActive='true'  
 END  
 ELSE  
 BEGIN  
  SELECT   
   [MenuID]=a.MenuId,b.[UserId],[DisplayName],[ParentID],[NavigationURL],[DisplayRank],[HasAccess]=isnull(HasAccess,'0'),[MenuLevel],[IsNewPortal]  
   ,a.[MenuIcon],a.[Action],a.[Action1],a.[Action2],a.[Action3],a.[Controller]  
  FROM Tbl_MASTER_MENU a  
  LEFT OUTER JOIN Tbl_Master_Menu_Access b ON a.Menuid=B.Menuid AND userId=@UserId AND a.IsNewPortal=1  
  WHERE IsActive='true'  
 END  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUsersList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION : Get Users List
==========================================================
EXEC USP_GetUsersList '0'
EXEC USP_GetUsersList '1'
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_GetUsersList]
(
	@BaseUserId INT
)
AS
BEGIN
	SET NOCOUNT ON;  
	IF(ISNULL(@BaseUserId,0) > 0)  
	BEGIN  
		SELECT  
			RowId = ROW_NUMBER() OVER (ORDER BY TU.display_name)  
			,[ID] = CONVERT(INT, TU.ID)  
			,[Name] = TU.Name  
			,[DisplayName] = ISNULL(TU.display_name, '-')  
			,[Password] = TU.pass  
			,[Email] = ISNULL(TU.Email, '')  
			,[EntryDate] = TU.reg_date  
			,[DeskbarId] = ISNULL(TU.deskbar_id, '-')  
			,TU.OrganizationSecretKey  
			,TU.PlayAlertSound  
			,TU.last_date AS LastLoginDateUTC
			,DATEADD(MINUTE, tu.Offset, tu.last_date) AS LastLoginDate
			,CAST(CASE ISNULL(TU.Iscancel, 0) WHEN 0 THEN 1 ELSE 0 END AS BIT) AS IsActive  
			,TU.mobile_phone
			,ISNULL(TU.ParentCustID,0) AS ParentCustID,
			TU.Is_AD_User,AD_GuId =ISNULL(TU.AD_GuId,''),
			AD_DomainName = ISNULL(TU.AD_DomainName,''), TU.IsADSync
		FROM Tbl_Users TU WITH (NOLOCK)  
		WHERE ParentCustID = @BaseUserId  
		ORDER BY TU.reg_date DESC;  
	END  
	ELSE  
	BEGIN  
		SELECT  
			RowId = ROW_NUMBER() OVER (ORDER BY TU.display_name)  
			,[ID] = CONVERT(INT, TU.ID)  
			,[Name] = TU.Name  
			,[DisplayName] = ISNULL(TU.display_name, '-')  
			,[Password] = TU.pass  
			,[Email] = ISNULL(TU.Email, '')  
			,[EntryDate] = TU.reg_date  
			,[DeskbarId] = ISNULL(TU.deskbar_id, '-')  
			,TU.OrganizationSecretKey  
			,TU.PlayAlertSound  
			,TU.last_date AS LastLoginDateUTC
			,DATEADD(MINUTE, tu.Offset, tu.last_date) AS LastLoginDate  
			,CAST(CASE ISNULL(TU.Iscancel, 0) WHEN 0 THEN 1 ELSE 0 END AS BIT) AS IsActive  
			,TU.mobile_phone
			,ISNULL(TU.ParentCustID,0) AS ParentCustID,
			TU.Is_AD_User,AD_GuId =ISNULL(TU.AD_GuId,''),
			AD_DomainName = ISNULL(TU.AD_DomainName,''), TU.IsADSync
		FROM Tbl_Users TU WITH (NOLOCK)    
		ORDER BY TU.reg_date DESC;  
	END  
	SET NOCOUNT OFF;  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUsersList_CustomerWise]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetUsersList_CustomerWise 0
*/
CREATE PROCEDURE [dbo].[USP_GetUsersList_CustomerWise]
(
	@BaseUserId INT
)
AS
BEGIN
	SELECT
		[ID] = CONVERT(INT, TU.ID),
		[Name] = TU.[Name],
		[DisplayName] = ISNULL(TU.display_name, '-'),
		[Email] = ISNULL(TU.Email, ''),
		[EntryDate] = TU.reg_date,
		TU.last_date AS LastLoginDateUTC,
		DATEADD(MINUTE, tu.Offset, tu.last_date) AS LastLoginDate,
		ISNULL(TU.Iscancel, 0) AS IsActive,
		TU.mobile_phone,
		ParentCustID,
		TU.Is_AD_User, 
		TU.IsADSync, TU.ParentUser, TU.Version
	 FROM Tbl_Users TU WITH(NOLOCK)
	 WHERE ISNULL(ParentCustID,0) = @BaseUserId
	 ORDER BY EntryDate DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUsersList_CustomerWise_Paged]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetUsersList_CustomerWise_Paged]
(
    @BaseUserId INT,
    @Start INT,
    @Length INT,
    @SearchTerm NVARCHAR(100) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Create temp table
    CREATE TABLE #FilteredUsers
    (
        ID INT,
        [Name] NVARCHAR(100),
        display_name NVARCHAR(100),
        Email NVARCHAR(100),
        reg_date DATETIME,
        last_date DATETIME,
        Offset INT,
        Iscancel BIT,
        mobile_phone NVARCHAR(20),
        ParentCustID INT,
        Is_AD_User BIT,
        IsADSync BIT,
        ParentUser INT,
        Version NVARCHAR(50)
    );

    -- Insert filtered data
    INSERT INTO #FilteredUsers
    SELECT
        TU.ID,
        TU.[Name],
        TU.display_name,
        TU.Email,
        TU.reg_date,
        TU.last_date,
        TU.Offset,
        TU.Iscancel,
        TU.mobile_phone,
        TU.ParentCustID,
        TU.Is_AD_User,
        TU.IsADSync,
        TU.ParentUser,
        TU.Version
    FROM Tbl_Users TU WITH(NOLOCK)
    WHERE ISNULL(TU.ParentCustID, 0) = @BaseUserId
    AND (
        @SearchTerm IS NULL OR @SearchTerm = '' OR
        TU.Name LIKE '%' + @SearchTerm + '%' OR
        TU.display_name LIKE '%' + @SearchTerm + '%' OR
        TU.Email LIKE '%' + @SearchTerm + '%'
    );

    -- Total filtered count
    SELECT COUNT(1) AS TotalCount FROM #FilteredUsers;

    -- Total online count
    SELECT COUNT(1) AS OnlineCount
    FROM #FilteredUsers
    WHERE last_date > DATEADD(MINUTE, -5, GETUTCDATE());

    -- Paged result
    SELECT
        [ID] = CONVERT(INT, FU.ID),
        [Name] = FU.[Name],
        [DisplayName] = ISNULL(FU.display_name, '-'),
        [Email] = ISNULL(FU.Email, ''),
        [EntryDate] = FU.reg_date,
        FU.last_date AS LastLoginDateUTC,
        DATEADD(MINUTE, FU.Offset, FU.last_date) AS LastLoginDate,
        ISNULL(FU.Iscancel, 0) AS IsActive,
        FU.mobile_phone,
        FU.ParentCustID,
        FU.Is_AD_User,
        FU.IsADSync,
        FU.ParentUser,
        FU.Version,
       CAST(
    CASE WHEN FU.last_date > DATEADD(MINUTE, -5, GETUTCDATE()) THEN 1 ELSE 0 END 
    AS BIT
) AS IsOnline
    FROM #FilteredUsers FU
    ORDER BY 
    IsOnline DESC,
    FU.[Name] ASC
    OFFSET @Start ROWS
    FETCH NEXT @Length ROWS ONLY;

    DROP TABLE #FilteredUsers;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUsersProfileByName]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC USP_GetUsersProfileByName 'CYGNUSTEAM'
*/
CREATE PROCEDURE [dbo].[USP_GetUsersProfileByName]
@BaseUserName varchar(500)
AS
BEGIN
	SELECT mu.Id,UserId,Name,FullName=Name+' '+ISNULL(mu.LastName,''),UserPwd,mu.mobileno,EmailId,pm.PermissionName,User_Image,User_Image=User_Image,
	mu.UserPwd As OldPassword
	FROM Tbl_Master_Users mu 
	LEFT JOIN Tbl_Permission pm on mu.Accesslevel=pm.Id 
	WHERE UserId=@BaseUserName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetWallPaperHistoryList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=======================================================================
Objective : To get the list of wallpaper for wallpaper history.
=======================================================================
EXEC USP_GetWallPaperHistoryList '3','FullViewing','CYGNUSTEAM','0'
EXEC USP_GetWallPaperHistoryList '4','FullViewing','CYGNUSTEAM','0'
EXEC USP_GetWallPaperHistoryList '7','FullViewing','CYGNUSTEAM','0'
=======================================================================
*/
CREATE PROCEDURE [dbo].[USP_GetWallPaperHistoryList]
(
	@Type VARCHAR(5),
	@ViewingType VARCHAR(200),
	@BaseUser VARCHAR(500),
	@CustomerId INT
)
AS
BEGIN
	IF(@Type = '3' OR @Type = '7')
	BEGIN
		SELECT
			WP.AlertId,AlertTital,AlertBody,CONVERT(VARCHAR,WP.EntryDate,106) AS EntrDateDesc,WP.EntryDate,ExpiresTimeValue,
			WP.EntryBy,ThemeId,AlertType,Type,AlertPosition=AP.CodeDesc,Typ=cast(@Type AS INT),Ass.OnceStartDateTime,Ass.OnceEndDateTime,
			Status = (CASE WHEN Status IS NULL OR Status = 'Drafts' THEN 'Draft' WHEN Status='Send' THEN 'Sent' ELSE Status END ),APostion=WP.AlertPosition,
			DateStatus = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL
			THEN '<span class="label label-success">Yes</span>' ELSE '<span class="label label-danger">No</span>' END),
			ScheduledActive = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN 'Yes' ELSE 'No' END),
			x.Resend,AlertParentId,
			ScheduledStatus = (CASE
				WHEN ISNULL(WP.IsAlertStop,0) = 1 THEN 'Stopped'
				WHEN WP.Status = 'Send' THEN 'Sent'
				WHEN WP.Status = 'Drafts' OR WP.Status = 'Draft' THEN 'Draft'
				WHEN GETDATE() BETWEEN ASS.OnceStartDateTime AND ASS.OnceEndDateTime THEN 'Active'
				WHEN GETDATE() < ASS.OnceStartDateTime THEN 'Scheduled'
				WHEN GETDATE() > ASS.OnceEndDateTime THEN 'Expired'
				--WHEN ((ASS.OnceStartDateTime IS NOT NULL AND ASS.OnceEndDateTime IS NOT NULL) AND GETDATE() <= ASS.OnceEndDateTime) THEN 'Active'
				--WHEN ((ASS.OnceStartDateTime IS NOT NULL AND ASS.OnceEndDateTime IS NOT NULL) AND GETDATE() >= ASS.OnceEndDateTime) THEN 'Expired'
				--WHEN ((ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL)) THEN 'Not Scheduled'
			ELSE 'Draft' END),
			[Iscancel] = WP.Iscancel
		FROM tbl_Alert_popUp WP WITH(NOLOCK)
		INNER JOIN CYGNUS_Master_General AP  WITH(NOLOCK) ON WP.AlertPosition=Ap.CodeId AND AP.CodeType='WALLPAPERTYPE'
		INNER JOIN tbl_Alert_Schedule_Setting ASS WITH(NOLOCK) ON ASS.AlertId=WP.AlertId
		OUTER APPLY(SELECT Resend=count(*) FROM tbl_Alert_popUp WITH(NOLOCK) WHERE AlertParentId=WP.AlertId)X
		WHERE WP.Type = @Type 
		AND WP.IsDeleted = 0
		/* AND ISNULL(Iscancel,0)=0 */
		AND WP.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE WP.EntryBy END)
		/* AND (CASE WHEN @CustomerId =0  THEN '1' ELSE WP.CustomerId END)=(CASE WHEN @CustomerId=0 THEN '1' ELSE @CustomerId END) */
		AND WP.CustomerId = @CustomerId
		ORDER BY EntryDate DESC
	END
    IF(@Type='4')
	BEGIN
		SELECT WP.AlertId,AlertTital,AlertBody,CONVERT(VARCHAR,WP.EntryDate,106) AS EntrDateDesc,WP.EntryDate,ExpiresTimeValue,  
		WP.EntryBy,ThemeId,AlertType,Type,AlertPosition=AP.CodeDesc,Typ=cast(@Type AS INT),Ass.OnceStartDateTime,Ass.OnceEndDateTime,  
		Status = (CASE WHEN Status IS NULL OR Status = 'Drafts' THEN 'Draft' WHEN Status='Send' THEN 'Sent' ELSE Status END ),APostion=WP.AlertPosition,  
		DateStatus = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN '<span class="label label-success">Yes</span>' ELSE '<span class="label label-danger">No</span>' END),
		ScheduledActive = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN 'Yes' ELSE 'No' END),
		x.Resend,AlertParentId,
		ScheduledStatus = (CASE
				WHEN ISNULL(WP.IsAlertStop,0) = 1 THEN 'Stopped'
				WHEN WP.Status = 'Send' THEN 'Sent'
				WHEN WP.Status = 'Drafts' OR WP.Status = 'Draft' THEN 'Draft'
				WHEN GETDATE() BETWEEN ASS.OnceStartDateTime AND ASS.OnceEndDateTime THEN 'Active'
				WHEN GETDATE() < ASS.OnceStartDateTime THEN 'Scheduled'
				WHEN GETDATE() > ASS.OnceEndDateTime THEN 'Expired'
				--WHEN ((ASS.OnceStartDateTime IS NOT NULL AND ASS.OnceEndDateTime IS NOT NULL) AND GETDATE() <= ASS.OnceEndDateTime) THEN 'Active'
				--WHEN ((ASS.OnceStartDateTime IS NOT NULL AND ASS.OnceEndDateTime IS NOT NULL) AND GETDATE() >= ASS.OnceEndDateTime) THEN 'Expired'
				--WHEN ((ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL)) THEN 'Not Scheduled'
			ELSE 'Draft' END),
			[Iscancel] = WP.Iscancel
		FROM tbl_Alert_popUp WP WITH(NOLOCK)
		INNER JOIN CYGNUS_Master_General AP WITH(NOLOCK) ON WP.AlertPosition=Ap.CodeId AND AP.CodeType='ScreenSaverType'  
		INNER JOIN tbl_Alert_Schedule_Setting ASS WITH(NOLOCK) ON ASS.AlertId=WP.AlertId
		OUTER APPLY(SELECT Resend=count(*) FROM tbl_Alert_popUp WITH(NOLOCK) WHERE AlertParentId=WP.AlertId)X
	WHERE WP.Type=@Type 
	AND WP.IsDeleted = 0
	/* AND ISNULL(Iscancel,0) = 0 */
	AND WP.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE WP.EntryBy END)
	/* AND (CASE WHEN @CustomerId =0  THEN '1' ELSE WP.CustomerId  END )=(CASE WHEN @CustomerId=0 THEN '1' ELSE @CustomerId END ) */
	AND WP.CustomerId = @CustomerId
	ORDER BY EntryDate DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetWallPaperHistoryList_BKP_28Sep21]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
========================================================================
Created By : Sarita Pal  
Created Date: 1 Jul 2021 
Last Update date : 22 September 2021 By Chirag Ramoliya
Description: To get the list of wallpaper for wallpaper history
========================================================================
EXEC USP_GetWallPaperHistoryList '3','FullViewing','CYGNUSTEAM','0' 
========================================================================
*/        
CREATE PROCEDURE [dbo].[USP_GetWallPaperHistoryList_BKP_28Sep21]
(
	@Type VARCHAR(5),
	@ViewingType varchar(200),
	@BaseUser varchar(500),
	@CustomerId INT
)
AS
BEGIN  
	SET NOCOUNT ON;

	IF(@Type='3' OR @Type='7')  
	BEGIN  
		SELECT
			WP.AlertId,AlertTital,AlertBody,CONVERT(VARCHAR,WP.EntryDate,106) AS EntrDateDesc,WP.EntryDate,ExpiresTimeValue,
			WP.EntryBy,ThemeId,AlertType,Type,AlertPosition=AP.CodeDesc,Typ=cast(@Type AS INT),Ass.OnceStartDateTime,Ass.OnceEndDateTime,
			Status = (CASE WHEN Status IS NULL THEN 'Drafts' WHEN Status='Send' THEN 'Sent' ELSE Status END ),APostion=WP.AlertPosition,
			DateStatus = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime + '23:59:59' OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN '<span class="label label-success">Yes</span>' ELSE '<span class="label label-danger">No</span>' END),
			ScheduledActive = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime + '23:59:59' OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN 'Yes' ELSE 'No' END),
			x.Resend,AlertParentId
		FROM tbl_Alert_popUp WP WITH(NOLOCK)
		INNER JOIN CYGNUS_Master_General AP  WITH(NOLOCK) ON WP.AlertPosition=Ap.CodeId AND AP.CodeType='WALLPAPERTYPE'
		INNER JOIN tbl_Alert_Schedule_Setting ASS WITH(NOLOCK) ON ASS.AlertId=WP.AlertId
		OUTER APPLY(SELECT Resend=count(*) FROM tbl_Alert_popUp WITH(NOLOCK) WHERE AlertParentId=WP.AlertId)X
		WHERE ISNULL(Iscancel,0)=0 AND WP.Type = @Type
		AND WP.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE WP.EntryBy END)
		AND (CASE WHEN @CustomerId =0  THEN '1' ELSE WP.CustomerId  END )=(CASE WHEN @CustomerId=0 THEN '1' ELSE @CustomerId END)
		ORDER BY EntryDate DESC
	END  
    IF(@Type='4')
	BEGIN
		SELECT WP.AlertId,AlertTital,AlertBody,CONVERT(VARCHAR,WP.EntryDate,106) AS EntrDateDesc,WP.EntryDate,ExpiresTimeValue,  
		WP.EntryBy,ThemeId,AlertType,Type,AlertPosition=AP.CodeDesc,Typ=cast(@Type AS INT),Ass.OnceStartDateTime,Ass.OnceEndDateTime,  
		Status = (CASE WHEN Status IS NULL THEN 'Drafts' WHEN Status='Send' THEN 'Sent' ELSE Status END ),APostion=WP.AlertPosition,  
		DateStatus = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime + '23:59:59' OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN '<span class="label label-success">Yes</span>' ELSE '<span class="label label-danger">No</span>' END),
		ScheduledActive = (CASE WHEN GETDATE() <= ASS.OnceEndDateTime + '23:59:59' OR ASS.OnceStartDateTime IS NULL AND ASS.OnceEndDateTime IS NULL THEN 'Yes' ELSE 'No' END),
		x.Resend,AlertParentId
		FROM tbl_Alert_popUp WP WITH(NOLOCK)
		INNER JOIN CYGNUS_Master_General AP WITH(NOLOCK) ON WP.AlertPosition=Ap.CodeId AND AP.CodeType='ScreenSaverType'  
		INNER JOIN tbl_Alert_Schedule_Setting ASS WITH(NOLOCK) ON ASS.AlertId=WP.AlertId
		OUTER APPLY(SELECT Resend=count(*) FROM tbl_Alert_popUp WITH(NOLOCK) WHERE AlertParentId=WP.AlertId)X
	WHERE  ISNULL(Iscancel,0)=0 AND WP.Type=@Type
	AND WP.EntryBy = (CASE @ViewingType WHEN 'Personal' THEN @BaseUser ELSE WP.EntryBy END)
	AND (CASE WHEN @CustomerId =0  THEN '1' ELSE WP.CustomerId  END )=(CASE WHEN @CustomerId=0 THEN '1' ELSE @CustomerId END ) ORDER BY EntryDate DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetWallPaperListForEdit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*    
	Created By : Sarita Pal    
	Created Date: 08 Aug 2021   
	EXEC USP_GetWallPaperListForEdit '4','1092' 
	EXEC USP_GetWallPaperListForEdit '4','670' 
	EXEC USP_GetWallPaperListForEdit '4','678' 
*/
CREATE PROC [dbo].[USP_GetWallPaperListForEdit]
(
	@Type VARCHAR(5),
	@AlertId INT
)
AS    
SET NOCOUNT ON    
BEGIN    
	IF(@Type='3' OR @Type='7')    
	BEGIN    
		SELECT
			*,Ass.*,CommanOccurences=CAST(ASS.CommanOccurences As INT),
			ScreenSaverTital = WP.AlertTital
		FROM tbl_Alert_popUp WP    
		INNER JOIN CYGNUS_Master_General AP ON WP.AlertPosition=Ap.CodeId AND AP.CodeType='WALLPAPERTYPE'    
		INNER JOIN tbl_Alert_Schedule_Setting ASS ON ASS.AlertId=WP.AlertId    
		WHERE ISNULL(Iscancel,0)=0 AND WP.Type=@Type AND WP.AlertId=@AlertId  
	END    
    IF(@Type='4')          
	BEGIN          
		SELECT
			*,Ass.*,ScreenSaverTital = WP.AlertTital
		FROM tbl_Alert_popUp WP     
		INNER JOIN CYGNUS_Master_General AP ON WP.AlertPosition=Ap.CodeId AND AP.CodeType='ScreenSaverType' 
		INNER JOIN tbl_Alert_Schedule_Setting ASS ON ASS.AlertId=WP.AlertId
		WHERE  ISNULL(Iscancel,0)=0 AND WP.Type=@Type AND WP.AlertId=@AlertId   
	END  
	 IF(@Type='5')            
	BEGIN            
		SELECT ASS.AlertId,WP.Type,WP.AlertTital,WP.AlertBody
		FROM tbl_Alert_popUp WP       
		INNER JOIN tbl_Alert_Schedule_Setting ASS ON ASS.AlertId=WP.AlertId  
		WHERE ISNULL(Iscancel,0)=0 AND WP.Type=@Type AND WP.AlertId=@AlertId     
	END     
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetXCommsAnalyticsDataList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_GetXCommsAnalyticsDataList '03 Feb 2022','04 Mar 2022'
	EXEC USP_GetXCommsAnalyticsDataList '01 Jan 2021','04 Mar 2022'
*/
CREATE PROCEDURE [dbo].[USP_GetXCommsAnalyticsDataList]
(
	@Fromdate VARCHAR(50),
	@ToDate VARCHAR(50)
)
AS
BEGIN
SELECT * FROM
(
	SELECT DISTINCT
		CustomerId = CR.CustomerId,
		CompanyName = CR.CompanyName,
		FullName = CR.FullName,
		CompanyEmail = ISNULL(CR.CompanyEmail,''),
		PurchasedTrial = CR.PurchasedTrial,
		Registered = CONVERT(VARCHAR,CR.EntryDate,101),
		DaysLeft = (CASE WHEN DATEDIFF(d, GETDATE(), CR.ExpiresDate) < 0 THEN 0 ELSE DATEDIFF(d, GETDATE(), CR.ExpiresDate) + 1 END),
		CMPolicies = CONVERT(VARCHAR,ISNULL(PoliciesCnt.CNT,0)),
		Tools = CAST(((LEN(ISNULL(Module,0)) - LEN(REPLACE(ISNULL(Module,0), ',', ''))) + 1) AS VARCHAR),
		ContentManagerCount = ISNULL(CMCnt.CNT,0),
		[IsActive] = (CASE WHEN GETDATE() <= CR.ExpiresDate + ' 23:59:59' THEN CONVERT(BIT,1) ELSE CONVERT(BIT,0) END),
		[AlertCount] = ISNULL(AlertCount.CNT,0),
		[TickerCount] = ISNULL(TickerCount.CNT,0),
		[WallPaperCount] = ISNULL(WPCount.CNT,0),
		[ScreenSaverCount] = ISNULL(SSCount.CNT,0),
		[LockScreenCount] = ISNULL(LSCount.CNT,0),
		[QuizCount] = ISNULL(QuizCount.CNT,0),
		[EmailCount] = ISNULL(EmailCount.CNT,0),
		[SMSCount] = ISNULL(SMSCount.CNT,0),
		[WhatsappCount] = ISNULL(WhatsappCount.CNT,0)
	FROM tbl_CustomerRegistration CR WITH(NOLOCK)
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT
		FROM Tbl_Master_Users(NOLOCK) TMU INNER JOIN Tbl_Permission(NOLOCK) TP ON Tp.Id = TMU.Accesslevel
		WHERE ISNULL(TMU.CustomerId,0) = CR.CustomerId GROUP BY TMU.CustomerId
	)CMCnt
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT
		FROM Tbl_Permission TP WITH(NOLOCK) WHERE ISNULL(TP.CustomerId,0) = CR.CustomerId
		GROUP BY ISNULL(TP.CustomerId,0)
	)PoliciesCnt
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId
		/* AND TAP.[Status] = 'Send' */
		AND [Type] = 1 GROUP BY tap.CustomerId
	)AlertCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId
		/* AND TAP.[Status] = 'Send' */
		AND [Type] = 2 GROUP BY tap.CustomerId
	)TickerCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, ISNULL(TAP.CustomerId,1) AS CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,1) = cr.CustomerId
		/* AND TAP.[Status] = 'Send' */
		AND [Type] = 3 GROUP BY tap.CustomerId
	)WPCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId
		/* AND TAP.[Status] = 'Send' */
		AND [Type] = 4 GROUP BY tap.CustomerId
	)SSCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId
		/* AND TAP.[Status] = 'Send' */
		AND [Type] = 5 GROUP BY tap.CustomerId
	)EmailCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId AND [Type] = 6 GROUP BY tap.CustomerId
	)QuizCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId
		/* AND TAP.[Status] = 'Send' */
		AND [Type] = 7 GROUP BY tap.CustomerId
	)LSCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId AND TAP.[Type] IN ('1','2')
		AND ISNULL(TAP.MessagingType,0) <> '0'
		AND ('SMS' IN (SELECT Items FROM dbo.SplitString(TAP.MessagingType,',')))
		GROUP BY tap.CustomerId
	)SMSCount
	OUTER APPLY
	(
		SELECT COUNT(*) AS CNT, tap.CustomerId
		FROM tbl_Alert_popUp TAP WITH(NOLOCK) INNER JOIN Tbl_Master_Users TU WITH(NOLOCK) ON tu.userid = tap.EntryBy
		WHERE ISNULL(TAP.CustomerId,0) = cr.CustomerId AND TAP.[Type] IN ('1','2')
		AND ISNULL(TAP.MessagingType,0) <> '0'
		AND ('Whatsapp' IN (SELECT Items FROM dbo.SplitString(TAP.MessagingType,',')))
		GROUP BY tap.CustomerId
	)WhatsappCount
	WHERE CR.EntryDate BETWEEN CONVERT(DATETIME,@Fromdate) AND CONVERT(DATETIME,@ToDate)
)XX WHERE 1 = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_Template]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROC [dbo].[USP_INSERT_Template]  
(  
 @TemplateName VARCHAR(MAX),  
 @TemplateBody VARCHAR(MAX),  
 @TemplateTitle VARCHAR(MAX),   
 @BaseUserName VARCHAR(100),  
 @Basetenant int  
)  
as  
begin  
 DECLARE @status VARCHAR(100)  
 INSERT INTO Tbl_Template(TemplateName,TemplateBody,TemplateTitle,EntryBy,EntryDate,CudtomerId)
 VALUES(@TemplateName,@TemplateBody,@TemplateTitle,@BaseUserName,Getdate(),@Basetenant)  
  SET @status='DONE'  
  SELECT @status  
END  
GO
/****** Object:  StoredProcedure [dbo].[Usp_licence_Count]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_licence_Count] 
@TenantId INT
AS
BEGIN
	IF (ISNULL(@TenantId, 0) > 0)
	BEGIN
		SELECT
			CAST(tcr.LicenseCount AS INT) AS TotalUser
		   ,CAST(Total.ActiveUser AS INT) AS ActiveUser
		FROM tbl_CustomerRegistration tcr
		CROSS APPLY (SELECT
				ISNULL(COUNT(*), 0) AS ActiveUser
			FROM Tbl_Users tu
			WHERE DATEDIFF(MINUTE, tu.last_date, GETDATE()) <= 1440
			AND ISNULL(tu.Iscancel, 0) = 0
			AND ISNULL(tu.ParentCustID, 0) = @TenantId) Total
		WHERE ISNULL(tcr.CustomerId, 0) = @TenantId
	END
	ELSE
	BEGIN
		SELECT
			COUNT(*) AS TotalUser
		   ,Total.ActiveUser
		FROM Tbl_Users tu
		CROSS APPLY (SELECT
				ISNULL(COUNT(*), 0) AS ActiveUser
			FROM Tbl_Users tu
			WHERE DATEDIFF(MINUTE, tu.last_date, GETDATE()) <= 1440
			AND ISNULL(tu.Iscancel, 0) = 0
			AND ISNULL(tu.ParentCustID, 0) = @TenantId) Total
		WHERE ISNULL(tu.Iscancel, 0) = 0
		AND ISNULL(tu.ParentCustID, 0) = @TenantId
		GROUP BY Total.ActiveUser
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoginUser]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec  USP_LoginUser '10001','b21ov8FN8baBN0iZw+K28g=='                
exec  USP_LoginUser 'CYGNUSTEAM','8rQr6sqi8mI='                
*/
CREATE Proc [dbo].[USP_LoginUser]
@UserId varchar(100),
@Password varchar(100)
,@UserType varchar(100) =null
as
      
 select @UserType = isnull(@UserType,'')      
    
Select BrachName=(select top 1 locname from Tbl_location where loccode=BranchCode),UserId,User_Type,UserPwd,BranchCode,CMU.Name,PasswordQues,PasswordAns,EmpId,ManagerId,  
EmailId,PhoneNo,ActiveTillDate,PwdLastChangeOn,LastPwd,Status,CMU.EntryDate,CMU.EntryBy,CMU.LastUpdatedDate,CMU.LastUpdatedBy,mobileno,gender,resi_addr,DOB,DOJ_ORG,ROLEID,  
IsPassEncrypted,emptype,ispassreset,'' AS Photo,'POD Upload' as Menu_1, 'POD View' as Menu_2,User_Image,Company.CODE AS CompanyCode,Company.NAME AS CompanyName
,CMU.Category,CMU.Designation,[CategoryDesc] = CMGF.CodeDesc,[DesignationDesc] = Design.CodeDesc

 From Tbl_Master_Users CMU
INNER JOIN Tbl_EMPLOYEE_COMPANY_MAPPING WECM WITH(NOLOCK) ON WECM.EMP_CODE = CMU.UserId
CROSS APPLY(SELECT A.CompanyCode AS CODE,A.CompanyName AS NAME FROM CYGNUX_Master_Company A 
WHERE A.IsActive='1' AND A.CompanyCode IN (SELECT Items FROM dbo.SplitString(WECM.DEFAULT_COMPANY,',')))Company
 
 LEFT JOIN Tbl_Master_General CMGF ON CMGF.CodeId=CMU.Category AND CMGF.CodeType='HIERARCHY' AND CMGF.StatusCode = 'Y'
  LEFT JOIN Tbl_Master_General Design ON Design.CodeId=CMU.Designation AND Design.CodeType='DESIG' AND Design.StatusCode = 'Y'

 Where STATUS='100'   
and LTRIM(RTRIM(UserId))=LTRIM((RTRIM(@UserId))) and     LTRIM(RTRIM(UserPwd))=LTRIM((RTRIM(@Password)))     

GO
/****** Object:  StoredProcedure [dbo].[Usp_NewContentManager_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_NewContentManager_Submit]
@XML1 VARCHAR(MAX),
@UserName NVARCHAR(50),
@BaseUSerId VARCHAR(50),
@CustomerId INT

AS
BEGIN TRANSACTION

DECLARE @Status INT, @Message VARCHAR(500),@Id INT,@Iscancel INT
SELECT  @Message = 'Not Done',@Status = 0

DECLARE @hdoc1 INT,@hdocName VARCHAR(1000)='PermisionModel'
EXEC sp_xml_preparedocument @hdoc1 OUTPUT,@XML1

SELECT @Id=Id,@Iscancel=Iscancel
FROM OPENXML(@hdoc1, @hdocName, 2)
WITH
(
	Id INT 'Id',
	Iscancel BIT 'Iscancel'
)
IF (@@ERROR <> 0 ) GOTO QuitWithRollback

IF(@Id>0)
BEGIN
	UPDATE Tbl_Master_Users SET Name=T.FirstName,Accesslevel=T.Accesslevel,EmailId=T.EmailId,MFAEnabled = T.MFAEnabled,
	UserPwd=T.Password,LastName=T.LastName,Iscancel=CASE WHEN ISNULL(@Iscancel,0)=0 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END
	FROM OPENXML(@hdoc1, @hdocName, 2)
	WITH
	(
		Id INT 'Id',
		FirstName VARCHAR(500) 'FirstName',
		LastName VARCHAR(500) 'LastName',
		Username VARCHAR(50) 'Username',
		Password VARCHAR(500) 'Password',
		EmailId VARCHAR(50) 'EmailId',
		MFAEnabled bit 'MFAEnabled',
		Accesslevel VARCHAR(50) 'Accesslevel'
	)T WHERE Tbl_Master_Users.Id=T.Id
END
ELSE
BEGIN
	INSERT INTO Tbl_Master_Users(UserId,User_Type,UserPwd,Name,Accesslevel,BranchCode,EmailId,MFAEnabled,Status,EntryBy,EntryDate,LastUpdatedDate,DOB,LastName,
	Tbl_Master_Users.TenantId,Tbl_Master_Users.Iscancel,ManagerId,CustomerId)

	SELECT UserName,(CASE WHEN @CustomerId > 0 THEN 'Cust' ELSE '001' END ) ,Password,FirstName,Accesslevel,'HQTR',EmailId,MFAEnabled,100,@UserName,GETDATE(),
	GETDATE(),GETDATE(),LastName,1,CASE WHEN ISNULL(@Iscancel,0)=0 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END ,@BaseUSerId ,@CustomerId
	FROM OPENXML(@hdoc1, @hdocName, 2)
	WITH
	(
		FirstName VARCHAR(500) 'FirstName',
		LastName VARCHAR(500) 'LastName',
		Username VARCHAR(50) 'Username',
		Password VARCHAR(500) 'Password',
		EmailId VARCHAR(50) 'EmailId',
		MFAEnabled bit 'MFAEnabled',
		Accesslevel VARCHAR(50) 'Accesslevel'
	)
	IF (@@ERROR <> 0 ) GOTO QuitWithRollback


END

SELECT @Status = 1, @Message = 'Done'
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_NewContentManager_Submit_Old]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_NewContentManager_Submit_Old]
@XML1 VARCHAR(MAX),
@UserName NVARCHAR(50),
@BaseUSerId VARCHAR(50),
@CustomerId INT

AS
BEGIN TRANSACTION

DECLARE @Status INT, @Message VARCHAR(500),@Id INT,@Iscancel INT
SELECT  @Message = 'Not Done',@Status = 0

DECLARE @hdoc1 INT,@hdocName VARCHAR(1000)='PermisionModel'
EXEC sp_xml_preparedocument @hdoc1 OUTPUT,@XML1

SELECT @Id=Id,@Iscancel=Iscancel
FROM OPENXML(@hdoc1, @hdocName, 2)
WITH
(
	Id INT 'Id',
	Iscancel BIT 'Iscancel'
)
IF (@@ERROR <> 0 ) GOTO QuitWithRollback

IF(@Id>0)
BEGIN
	UPDATE Tbl_Master_Users SET Name=T.FirstName,Accesslevel=T.Accesslevel,EmailId=T.EmailId,
	UserPwd=T.Password,LastName=T.LastName,Iscancel=CASE WHEN ISNULL(@Iscancel,0)=0 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END
	FROM OPENXML(@hdoc1, @hdocName, 2)
	WITH
	(
		Id INT 'Id',
		FirstName VARCHAR(500) 'FirstName',
		LastName VARCHAR(500) 'LastName',
		Username VARCHAR(50) 'Username',
		Password VARCHAR(500) 'Password',
		EmailId VARCHAR(50) 'EmailId',
		Accesslevel VARCHAR(50) 'Accesslevel'
	)T WHERE Tbl_Master_Users.Id=T.Id
END
ELSE
BEGIN
	INSERT INTO Tbl_Master_Users(UserId,User_Type,UserPwd,Name,Accesslevel,BranchCode,EmailId,Status,EntryBy,EntryDate,LastUpdatedDate,DOB,LastName,
	Tbl_Master_Users.TenantId,Tbl_Master_Users.Iscancel,ManagerId,CustomerId)

	SELECT UserName,(CASE WHEN @CustomerId > 0 THEN 'Cust' ELSE '001' END ) ,Password,FirstName,Accesslevel,'HQTR',EmailId,100,@UserName,GETDATE(),
	GETDATE(),GETDATE(),LastName,1,CASE WHEN ISNULL(@Iscancel,0)=0 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END ,@BaseUSerId ,@CustomerId
	FROM OPENXML(@hdoc1, @hdocName, 2)
	WITH
	(
		FirstName VARCHAR(500) 'FirstName',
		LastName VARCHAR(500) 'LastName',
		Username VARCHAR(50) 'Username',
		Password VARCHAR(500) 'Password',
		EmailId VARCHAR(50) 'EmailId',
		Accesslevel VARCHAR(50) 'Accesslevel'
	)
	IF (@@ERROR <> 0 ) GOTO QuitWithRollback
END

SELECT @Status = 1, @Message = 'Done'
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_Organization_Setup_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_Organization_Setup_Submit]
@XML1 VARCHAR(MAX),
@UserName NVARCHAR(50),
@EditFlag VARCHAR(10)
AS      
BEGIN TRANSACTION  
 
DECLARE @Status INT, @Message VARCHAR(500)
SELECT  @Message = 'Not Done',@Status = 0      
        
DECLARE @hdoc1 INT,@hdocName VARCHAR(1000)='OrganizationModel'
        
EXEC sp_xml_preparedocument @hdoc1 OUTPUT,@XML1      

IF(@EditFlag = 'N') 
BEGIN  
	INSERT INTO Tbl_Organization_Details(OrganizationName,Website,OrgEmailId,OrgContactNo,Country,City,PostCode,OrgAddress,
	UserName,UserMobileNo,UserEmailId,EntryBy,EntryDate,IsActive,UniqueId)  
	     
	SELECT OrganizationName,Website,OrgEmailId,OrgContactNo,Country,City,PostCode,OrgAddress,UserName,UserMobileNo,UserEmailId,@UserName,GETDATE(),1,newid()
      
	FROM OPENXML(@hdoc1, @hdocName, 2)               
	WITH      
	(      
		OrganizationName VARCHAR(500) 'OrganizationName',
        Website VARCHAR(500) 'Website',
        OrgEmailId VARCHAR(200) 'OrgEmailId',
        OrgContactNo VARCHAR(20) 'OrgContactNo',
        Country VARCHAR(200) 'Country',
        City VARCHAR(200) 'City',
        PostCode VARCHAR(50) 'PostCode',
        OrgAddress VARCHAR(500) 'OrgAddress',
        UserName VARCHAR(500) 'UserName',
        UserMobileNo VARCHAR(20) 'UserMobileNo',
        UserEmailId VARCHAR(200) 'UserEmailId'		
	)                
	IF (@@ERROR <> 0 ) GOTO QuitWithRollback  

	
	INSERT INTO Tbl_Master_Users(UserId,User_Type,BranchCode,Name,EmpId,EmailId,PhoneNo,Status,EntryDate,EntryBy,LastUpdatedDate,LastUpdatedBy,mobileno,DOB,TenantId) 
	SELECT OrgEmailId,'001','HQTR',OrganizationName,OrgEmailId,OrgEmailId,OrgContactNo,100,GETDATE(),@UserName,GETDATE(),@UserName,OrgContactNo,GETDATE(),1
	FROM OPENXML(@hdoc1, @hdocName, 2)               
	WITH      
	(      
		OrganizationName VARCHAR(500) 'OrganizationName',
        OrgEmailId VARCHAR(200) 'OrgEmailId',
        OrgContactNo VARCHAR(20) 'OrgContactNo'        	
	)         
	IF (@@ERROR <> 0 ) GOTO QuitWithRollback  

	INSERT INTO Tbl_EMPLOYEE_COMPANY_MAPPING(EMP_CODE,COMPANY_LIST,DEFAULT_COMPANY,ACTIVEFLAG,ENTRYBY,ENTRYDT)
	SELECT OrgEmailId,'C001','C001','Y',@UserName,GETDATE()
	FROM OPENXML(@hdoc1, @hdocName, 2)               
	WITH      
	(      
        OrgEmailId VARCHAR(200) 'OrgEmailId'
	)         
	IF (@@ERROR <> 0 ) GOTO QuitWithRollback  
	
	 
END      

IF(@EditFlag = 'Y') 
BEGIN 

	UPDATE Tbl_Organization_Details set OrganizationName=X.OrganizationName,Website=X.Website,OrgEmailId=X.OrgEmailId,
	OrgContactNo=X.OrgContactNo,Country=X.Country,City=X.City,PostCode=X.PostCode,OrgAddress=X.OrgAddress,UserName=X.UserName,
	UserMobileNo=X.UserMobileNo,UserEmailId=X.UserEmailId,UpdateBy=@UserName,UpdateDate=GETDATE() 
      
	FROM OPENXML(@hdoc1, @hdocName, 2)               
	WITH      
	(      
		OrganizationId INT 'OrganizationId',
		OrganizationName VARCHAR(500) 'OrganizationName',
        Website VARCHAR(500) 'Website',
        OrgEmailId VARCHAR(200) 'OrgEmailId',
        OrgContactNo VARCHAR(20) 'OrgContactNo',
        Country VARCHAR(200) 'Country',
        City VARCHAR(200) 'City',
        PostCode VARCHAR(50) 'PostCode',
        OrgAddress VARCHAR(500) 'OrgAddress',
        UserName VARCHAR(500) 'UserName',
        UserMobileNo VARCHAR(20) 'UserMobileNo',
        UserEmailId VARCHAR(200) 'UserEmailId'	

	)   X WHERE   Tbl_Organization_Details.OrganizationId=X.OrganizationId   
	        
	IF (@@ERROR <> 0 ) GOTO QuitWithRollback

END  
  
SELECT @Status = 1, @Message = 'Done'        
        
SELECT MESSAGE = @Message,STATUS = @Status 
      
COMMIT TRANSACTION       
      
GOTO EndSave        
QuitWithRollback:        
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION        
BEGIN      
SELECT  MESSAGE = @Message,STATUS = @Status
END      
      
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[USP_PopAlertAnalyticDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- created By:  Sarita pal    
-- Create date: 18 Jun 2021    
-- Description: To get deatils on the base of pie-chart    
--	EXEC USP_PopAlertAnalyticDetail '9',''  
-- =============================================    
CREATE PROCEDURE [dbo].[USP_PopAlertAnalyticDetail]
(
	@AlertId INT,  
	@Status VARCHAR(50),
	@ModuleType INT
)
AS
BEGIN  
	DECLARE @AlertType VARCHAR(10) = '' ,@TotalReceptient VARCHAR(10) = ''  
	SELECT @AlertType = tap.AlertType FROM tbl_Alert_popUp tap WHERE tap.AlertId = @AlertId  
  
	IF (@AlertType = 'SR')  
	BEGIN  
		IF (@Status = 'Deliverd')  
		BEGIN
			SELECT
				Title = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN ISNULL(AP.AlertBody,'') ELSE AP.AlertTital END),
				DateTime = REPLACE(CONVERT(VARCHAR , AP.EntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
				CAST(AP.EntryDate AS TIME),100),'/','-') ,
				tu.Name AS Name ,tu.display_name AS ComputerName,
				Delivered = CASE WHEN tsau.IsReceived = 1 THEN 'Yes' ELSE 'No' END,
				Acknowledged = CASE WHEN tsau.IsAcknowledge = 1 THEN 'Yes' ELSE 'No' END
			FROM tbl_Send_Alert_User tsau WITH (NOLOCK)
			INNER JOIN Tbl_Users tu WITH (NOLOCK) ON tu.Id = tsau.UserId  
			INNER JOIN tbl_Alert_popUp AP WITH (NOLOCK) ON AP.AlertId = tsau.AlertId  
			WHERE tsau.AlertId = @AlertId AND tsau.IsReceived = 1  
		END
		IF (@Status = 'NotDeliverd')
		BEGIN
			SELECT
				Title = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN ISNULL(AP.AlertBody,'') ELSE AP.AlertTital END),
				DateTime = REPLACE(CONVERT(VARCHAR , AP.EntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
			CAST(AP.EntryDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName,
			Delivered = CASE WHEN tsau.IsReceived = 1 THEN 'Yes' ELSE 'No' END,
			Acknowledged = CASE WHEN tsau.IsAcknowledge = 1 THEN 'Yes' ELSE 'No' END  
			FROM tbl_Send_Alert_User tsau WITH (NOLOCK)  
			INNER JOIN Tbl_Users tu WITH (NOLOCK) ON tu.Id = tsau.UserId  
			INNER JOIN tbl_Alert_popUp AP WITH (NOLOCK)	ON AP.AlertId = tsau.AlertId  
			WHERE tsau.AlertId = @AlertId AND tsau.IsReceived = 0  
		END  
		IF (@Status = 'Acknowleged')  
		BEGIN
			SELECT
				Title = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN ISNULL(AP.AlertBody,'') ELSE AP.AlertTital END),
				DateTime = REPLACE(CONVERT(VARCHAR , AP.EntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
			CAST(AP.EntryDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName,
			Delivered = CASE WHEN tsau.IsReceived = 1 THEN 'Yes' ELSE 'No' END,
			Acknowledged = CASE WHEN tsau.IsAcknowledge = 1 THEN 'Yes' ELSE 'No' END  
			FROM tbl_Send_Alert_User tsau WITH (NOLOCK)  
			INNER JOIN Tbl_Users tu WITH (NOLOCK) ON tu.Id = tsau.UserId  
			INNER JOIN tbl_Alert_popUp AP WITH (NOLOCK) ON AP.AlertId = tsau.AlertId  
			WHERE tsau.AlertId = @AlertId AND tsau.IsAcknowledge = 1  
		END  
		IF (@Status = '')  
		BEGIN
			SELECT
				Title = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN ISNULL(AP.AlertBody,'') ELSE AP.AlertTital END),
				DateTime = REPLACE(CONVERT(VARCHAR , AP.EntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
			CAST(AP.EntryDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName,
			Delivered = CASE WHEN tsau.IsReceived = 1 THEN 'Yes' ELSE 'No' END,
			Acknowledged = CASE WHEN tsau.IsAcknowledge = 1 THEN 'Yes' ELSE 'No' END  
			FROM tbl_Send_Alert_User tsau WITH (NOLOCK)  
			INNER JOIN Tbl_Users tu WITH (NOLOCK) ON tu.Id = tsau.UserId  
			INNER JOIN tbl_Alert_popUp AP WITH (NOLOCK) ON AP.AlertId = tsau.AlertId  
			WHERE tsau.AlertId = @AlertId  
		END  
	END  
	ELSE
	IF(@AlertType = 'BC')
	BEGIN
		SELECT
			Title = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN ISNULL(AP.AlertBody,'') ELSE AP.AlertTital END),
			DateTime = REPLACE(CONVERT(VARCHAR , AP.EntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
		CAST(AP.EntryDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName,
		Delivered = CASE WHEN tsau.IsReceived = 1 THEN 'Yes' ELSE 'No' END,
		Acknowledged = CASE WHEN tsau.IsAcknowledge = 1 THEN 'Yes' ELSE 'No' END  
		FROM Tbl_Users tu WITH (NOLOCK)
		INNER JOIN tbl_Send_Alert_User tsau WITH (NOLOCK) ON tu.Id = tsau.UserId
		INNER JOIN tbl_Alert_popUp AP WITH (NOLOCK) ON AP.AlertId = tsau.AlertId
		WHERE tu.deskbar_id IS NOT NULL
	END  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PopAlertAnalyticDetailV1]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- created By:  Sarita pal    
-- Create date: 18 Jun 2021    
-- Description: To get deatils on the base of pie-chart    
--	EXEC USP_PopAlertAnalyticDetail '9',''  
-- =============================================    
CREATE PROCEDURE [dbo].[USP_PopAlertAnalyticDetailV1]
(
	@AlertId INT,  
	@Status VARCHAR(50),
	@ModuleType INT
)
AS
BEGIN  
	DECLARE @AlertType VARCHAR(10) = '' ,
	@TotalReceptient VARCHAR(10) = '' ,
	@AlertTitle VARCHAR(255) = '',
	@AlertEntryDate DateTime
	
	SELECT @AlertType = tap.AlertType, @AlertTitle=AlertTital, @AlertEntryDate=EntryDate FROM tbl_Alert_popUp tap WHERE tap.AlertId = @AlertId  
  
  	DECLARE @UserIds AS Table(ID INT)

	INSERT INTO @UserIds
	exec [dbo].[USP_GetAlertMembers] @AlertId


		IF (@Status = 'Deliverd')  
		BEGIN
			SELECT
				Title = @AlertTitle,
				DateTime = REPLACE(CONVERT(VARCHAR , tsau.ReceivedDate, 101) + ' ' + CONVERT(VARCHAR(15),
				CAST(tsau.ReceivedDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName, Delivered = 'No', Acknowledged='No'
				FROM Tbl_Users tu WITH (NOLOCK)
				INNER JOIN tbl_Send_Alert_User tsau ON tsau.UserId=tu.id
				WHERE tsau.Alertid=@AlertId AND tsau.IsReceived=1	
		END
		IF (@Status = 'NotDeliverd')
		BEGIN
			SELECT
				Title = @AlertTitle,
				DateTime = REPLACE(CONVERT(VARCHAR , @AlertEntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
				CAST(@AlertEntryDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName, Delivered = 'No', Acknowledged='No'
				FROM Tbl_Users tu WITH (NOLOCK)
				WHERE Id IN (SELECT * FROM @UserIds WHERE Id NOT IN (SELECT UserId FROM tbl_Send_Alert_User WHERE Alertid=@AlertId AND IsReceived=1))			
		END  
		IF (@Status = 'Acknowleged')  
		BEGIN
			SELECT
				Title = @AlertTitle,
				DateTime = REPLACE(CONVERT(VARCHAR , tsau.AcknowledgeDate, 101) + ' ' + CONVERT(VARCHAR(15),
				CAST(tsau.AcknowledgeDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName, Delivered = 'Yes', Acknowledged='Yes'
				FROM Tbl_Users tu WITH (NOLOCK)
				INNER JOIN tbl_Send_Alert_User tsau ON tsau.UserId=tu.id
				WHERE tsau.Alertid=@AlertId AND tsau.IsAcknowledge=1	
		END  
		IF (@Status = '')  
		BEGIN
			SELECT
				Title = @AlertTitle,
				DateTime = REPLACE(CONVERT(VARCHAR , @AlertEntryDate, 101) + ' ' + CONVERT(VARCHAR(15),
				CAST(@AlertEntryDate AS TIME),100),'/','-') ,tu.Name AS Name ,tu.display_name AS ComputerName, Delivered = 'No', Acknowledged='No'
				FROM Tbl_Users tu WITH (NOLOCK)
				WHERE Id IN (SELECT * FROM @UserIds)	
		END  
	END  
GO
/****** Object:  StoredProcedure [dbo].[USP_PopAlertList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_PopAlertList '1','01 Jan 2021','07 Feb 2022','0','CYGNUSTEAM','FullViewing'
	EXEC USP_PopAlertList '4','01 Jan 2021','07 Feb 2022','0','CYGNUSTEAM','FullViewing'
*/
CREATE PROCEDURE [dbo].[USP_PopAlertList]
(
	@Type VARCHAR(50),
	@Fromdate VARCHAR(50),
	@ToDate VARCHAR(50),
	@TenantId INT,
	@BaseUserId VARCHAR(50),
	@BaseViewingType VARCHAR(50)
)
AS
BEGIN

	IF (@Type = '4')
	BEGIN
		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo,
			X.AlertBody,
			[Type] = @Type ,
			X.AlertId ,
			X.[Status],
			X.AlertType ,
			X.EntryDate,
			X.EntryDateDesc,
			Active = X.Active,
			X.EntryBy,
			Recurring = 'N' ,
			X.AlertTital,
			AcknowledgementRequested = X.AcknowledgementRequested,
			NoOfRecipientes = CASE WHEN X.NoOfRecipientes > X.CustomerLicenseCount THEN X.CustomerLicenseCount ELSE X.NoOfRecipientes END,
			X.Delivered,
			CAST(CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per],
			X.NotDelivered,
			CAST(100.00 - CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per],
			X.Acknowledged,
			CAST(CAST(CASE WHEN X.Acknowledged > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]
		FROM
		(
			SELECT
				tau.AlertBody, tau.AlertId, tau.[Status], tau.AlertType, tau.EntryDate, FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc,
				(CASE ISNULL(tau.Iscancel, 0) WHEN 0 THEN 'Y' ELSE 'N' END) AS Active, tau.EntryBy, tau.AlertTital,
				(CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) AS NoOfRecipientes,
				Delivered.CNT AS [Delivered], (CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) - Delivered.CNT AS [NotDelivered],
				/* --0 AS [NotDelivered%], */
				Acknowledge.CNT AS [Acknowledged], (CASE tau.AcknoledgrButton WHEN 1 THEN 'Y' ELSE 'N' END) AS AcknowledgementRequested,
				CustomerCNT.LicenseCount AS CustomerLicenseCount
			FROM tbl_Alert_popUp tau WITH(NOLOCK)
			/* --INNER JOIN tbl_Alert_Schedule_Setting tass ON tass.AlertId = tau.AlertId */
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM Tbl_Users tu WITH(NOLOCK) WHERE tu.deskbar_id IS NOT NULL AND tu.ParentCustID = @TenantId) Users
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId) Recipientes
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			OUTER APPLY (SELECT tcr.LicenseCount FROM tbl_CustomerRegistration tcr WITH (NOLOCK) WHERE tcr.CustomerId = @TenantId) CustomerCNT
			WHERE tau.[Status] = 'Send' AND tau.[Type] = @Type AND tau.CustomerId = @TenantId
			/* AND (CASE WHEN @TenantId = 0 THEN '1' ELSE tau.CustomerId END) = (CASE WHEN @TenantId = 0 THEN '1' ELSE @TenantId END) */
			AND tau.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE tau.EntryBy END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			/* --AND tau.AlertParentId IS NULL */
		) X
		ORDER BY X.EntryDate DESC
	END
	ELSE
	BEGIN
		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo,
			X.AlertBody,
			[Type] = @Type,
			X.AlertId,
			X.[Status],
			X.AlertType,
			X.EntryDate,
			X.EntryDateDesc,
			Active = X.Active,
			X.EntryBy,
			Recurring = X.Recurring,
			X.AlertTital,
			AcknowledgementRequested = X.AcknowledgementRequested,
			NoOfRecipientes = CASE WHEN X.NoOfRecipientes > X.CustomerLicenseCount THEN X.CustomerLicenseCount ELSE X.NoOfRecipientes END,
			X.Delivered,
			CAST(CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC (18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per],
			X.NotDelivered,
			CAST(100.00 - CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per],
			X.Acknowledged,
			CAST(CAST(CASE WHEN X.Acknowledged > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]
		FROM
		(
			SELECT tau.AlertBody, tau.AlertId, tau.[Status], tau.AlertType, tau.EntryDate, FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc,
				(CASE ISNULL(tau.Iscancel, 0) WHEN 0 THEN 'Y' ELSE 'N' END) AS Active,
				tau.EntryBy, (CASE WHEN tass.SchedulePatternType IN ('Now', 'Daily', '0', '1') THEN 'N' ELSE 'Y' END) AS Recurring,
				tau.AlertTital, (CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) AS NoOfRecipientes,
				Delivered.CNT AS [Delivered],
				(CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) - Delivered.CNT AS [NotDelivered],
				Acknowledge.CNT AS [Acknowledged], (CASE tau.AcknoledgrButton WHEN 1 THEN 'Y' ELSE 'N' END) AS AcknowledgementRequested,
				CustomerCNT.LicenseCount AS CustomerLicenseCount
			FROM tbl_Alert_popUp tau WITH(NOLOCK)
			INNER JOIN tbl_Alert_Schedule_Setting tass WITH(NOLOCK) ON tass.AlertId = tau.AlertId
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM Tbl_Users tu WITH(NOLOCK) WHERE tu.deskbar_id IS NOT NULL AND tu.ParentCustID = @TenantId) Users
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId) Recipientes
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			OUTER APPLY (SELECT tcr.LicenseCount FROM tbl_CustomerRegistration tcr WITH (NOLOCK) WHERE tcr.CustomerId = @TenantId) CustomerCNT
			WHERE tau.[Status] = 'Send' AND tau.[Type] = @Type AND tau.CustomerId = @TenantId
			/* AND (CASE WHEN @TenantId = 0 THEN '1' ELSE tau.CustomerId END) = (CASE WHEN @TenantId = 0 THEN '1' ELSE @TenantId END) */
			AND tau.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE tau.EntryBy END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			/* --AND tau.AlertParentId IS NULL */
		) X
		ORDER BY X.EntryDate DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PopAlertList_BKP]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PopAlertList_BKP]
@Type VARCHAR(50),
@Fromdate VARCHAR(50),
@ToDate VARCHAR(50),
@TenantId INT,
@BaseUserId VARCHAR(50),
@BaseViewingType VARCHAR(50)

AS
BEGIN

	IF (@Type = '4')
	BEGIN
		SELECT
			ROW_NUMBER(
			) OVER (ORDER BY X.AlertId) AS SrNo
		   ,X.AlertBody
		   ,Type = @Type
		   ,X.AlertId
		   ,X.Status
		   ,X.AlertType
		   ,X.EntryDate
		   ,X.EntryDateDesc
		   ,Active =
			CASE
				WHEN X.Active = 'N' THEN '<span class="label label-danger">No</span>'


				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.EntryBy
		   ,Recurring =
			'<span class="label label-danger">No</span>'
		   ,X.AlertTital
		   ,AcknowledgementRequested =
			CASE
				WHEN AcknowledgementRequested = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.NoOfRecipientes
		   ,X.Delivered
		   ,CAST(CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %'

			AS [Delivered_Per]
		   ,X.NotDelivered
		   ,CAST(100.00 - CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END
			AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per]
		   ,X.Acknowledged
		   ,CAST(CAST(CASE
				WHEN X.Acknowledged > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes)
				ELSE 0
			END AS NUMERIC(18, 2))
			AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]

		FROM (SELECT
				tau.AlertBody
			   ,tau.AlertId
			   ,tau.Status
			   ,tau.AlertType
			   ,tau.EntryDate
			   ,FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc
			   ,CASE ISNULL(tau.Iscancel, 0)
					WHEN 0 THEN 'Y'
					ELSE 'N'
				END AS Active
			   ,tau.EntryBy
			   ,tau.AlertTital
			   ,CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END AS NoOfRecipientes
			   ,Delivered.CNT AS [Delivered]
			   ,(CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END) - Delivered.CNT AS [NotDelivered]
			   ,
				--0 AS [NotDelivered%],        

				Acknowledge.CNT AS [Acknowledged]
			   ,CASE tau.AcknoledgrButton
					WHEN 1 THEN 'Y'
					ELSE 'N'
				END
				AS AcknowledgementRequested
			FROM tbl_Alert_popUp tau
			--INNER JOIN tbl_Alert_Schedule_Setting tass ON tass.AlertId = tau.AlertId            
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM Tbl_Users tu
				WHERE tu.deskbar_id IS NOT NULL) Users
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId) Recipientes
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			WHERE tau.Status = 'Send'
			AND tau.Type = @Type
			AND (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE tau.CustomerId
			END)
			= (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE @TenantId
			END)
			AND tau.EntryBy = (CASE @BaseViewingType
				WHEN 'Personal' THEN @BaseUserId
				ELSE tau.EntryBy
			END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
		--AND tau.AlertParentId IS NULL            
		) X
		ORDER BY X.EntryDate DESC
	END
	ELSE
	BEGIN

		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo
		   ,X.AlertBody
		   ,Type = @Type
		   ,X.AlertId
		   ,X.Status
		   ,X.AlertType
		   ,X.EntryDate
		   ,X.EntryDateDesc
		   ,Active =
			CASE
				WHEN X.Active = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.EntryBy
		   ,Recurring =
			CASE
				WHEN X.Recurring = 'N' THEN '<span class="label label-danger">No</span>'

				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.AlertTital

		   ,AcknowledgementRequested =
			CASE
				WHEN AcknowledgementRequested = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.NoOfRecipientes
		   ,X.Delivered
		   ,CAST(CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS NUMERIC
			(18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per]
		   ,X.NotDelivered
		   ,CAST(100.00 - CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS

			NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per]
		   ,X.Acknowledged
		   ,CAST(CAST(CASE
				WHEN X.Acknowledged > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes)
				ELSE 0
			END AS

			NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]

		FROM (SELECT
				tau.AlertBody
			   ,tau.AlertId
			   ,tau.Status
			   ,tau.AlertType
			   ,tau.EntryDate
			   ,FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc
			   ,CASE ISNULL(tau.Iscancel, 0)
					WHEN 0 THEN 'Y'
					ELSE 'N'
				END AS Active
			   ,tau.EntryBy
			   ,CASE
					WHEN tass.SchedulePatternType IN ('Now', 'Daily', '0', '1') THEN 'N'
					ELSE 'Y'
				END AS Recurring
			   ,tau.AlertTital
			   ,CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END AS NoOfRecipientes
			   ,Delivered.CNT AS [Delivered]
			   ,(CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END) - Delivered.CNT AS [NotDelivered]
			   ,Acknowledge.CNT AS [Acknowledged]
			   ,CASE tau.AcknoledgrButton
					WHEN 1 THEN 'Y'
					ELSE 'N'
				END
				AS AcknowledgementRequested
			FROM tbl_Alert_popUp tau
			INNER JOIN tbl_Alert_Schedule_Setting tass
				ON tass.AlertId = tau.AlertId
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM Tbl_Users tu
				WHERE tu.deskbar_id IS NOT NULL) Users
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId) Recipientes
			CROSS APPLY (SELECT
					COUNT(*)
					AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			WHERE tau.Status = 'Send'
			AND tau.Type = @Type
			AND (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE tau.CustomerId
			END) = (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE @TenantId
			END)
			AND tau.EntryBy = (CASE @BaseViewingType
				WHEN 'Personal' THEN @BaseUserId
				ELSE tau.EntryBy
			END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'



		--AND tau.AlertParentId IS NULL            
		) X
		ORDER BY X.EntryDate DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PopAlertList_BKP_CR]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_PopAlertList '1','01 Jan 2021','07 Feb 2022','0','CYGNUSTEAM','FullViewing'
	EXEC USP_PopAlertList '4','01 Jan 2021','07 Feb 2022','0','CYGNUSTEAM','FullViewing'
*/
CREATE PROCEDURE [dbo].[USP_PopAlertList_BKP_CR]
(
	@Type VARCHAR(50),
	@Fromdate VARCHAR(50),
	@ToDate VARCHAR(50),
	@TenantId INT,
	@BaseUserId VARCHAR(50),
	@BaseViewingType VARCHAR(50)
)
AS
BEGIN

	IF (@Type = '4')
	BEGIN
		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo,
			X.AlertBody,
			[Type] = @Type ,
			X.AlertId ,
			X.[Status],
			X.AlertType ,
			X.EntryDate,
			X.EntryDateDesc,
			Active = X.Active,
			X.EntryBy,
			Recurring = 'N' ,
			X.AlertTital,
			AcknowledgementRequested = X.AcknowledgementRequested,
			NoOfRecipientes = CASE WHEN X.NoOfRecipientes > X.CustomerLicenseCount THEN X.CustomerLicenseCount ELSE X.NoOfRecipientes END,
			X.Delivered,
			CAST(CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per],
			X.NotDelivered,
			CAST(100.00 - CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per],
			X.Acknowledged,
			CAST(CAST(CASE WHEN X.Acknowledged > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]
		FROM
		(
			SELECT
				tau.AlertBody, tau.AlertId, tau.[Status], tau.AlertType, tau.EntryDate, FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc,
				(CASE ISNULL(tau.Iscancel, 0) WHEN 0 THEN 'Y' ELSE 'N' END) AS Active, tau.EntryBy, tau.AlertTital,
				(CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) AS NoOfRecipientes,
				Delivered.CNT AS [Delivered], (CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) - Delivered.CNT AS [NotDelivered],
				/* --0 AS [NotDelivered%], */
				Acknowledge.CNT AS [Acknowledged], (CASE tau.AcknoledgrButton WHEN 1 THEN 'Y' ELSE 'N' END) AS AcknowledgementRequested,
				CustomerCNT.LicenseCount AS CustomerLicenseCount
			FROM tbl_Alert_popUp tau WITH(NOLOCK)
			/* --INNER JOIN tbl_Alert_Schedule_Setting tass ON tass.AlertId = tau.AlertId */
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM Tbl_Users tu WITH(NOLOCK) WHERE tu.deskbar_id IS NOT NULL AND tu.ParentCustID = @TenantId) Users
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId) Recipientes
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			OUTER APPLY(SELECT tcr.LicenseCount FROM tbl_CustomerRegistration tcr WITH (NOLOCK) WHERE tcr.CustomerId = @TenantId) CustomerCNT
			WHERE tau.[Status] = 'Send' AND tau.[Type] = @Type AND tau.CustomerId = @TenantId
			/* AND (CASE WHEN @TenantId = 0 THEN '1' ELSE tau.CustomerId END) = (CASE WHEN @TenantId = 0 THEN '1' ELSE @TenantId END) */
			AND tau.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE tau.EntryBy END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			/* --AND tau.AlertParentId IS NULL */
		) X
		ORDER BY X.EntryDate DESC
	END
	ELSE
	BEGIN
		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo,
			X.AlertBody,
			[Type] = @Type,
			X.AlertId,
			X.[Status],
			X.AlertType,
			X.EntryDate,
			X.EntryDateDesc,
			Active = X.Active,
			X.EntryBy,
			Recurring = X.Recurring,
			X.AlertTital,
			AcknowledgementRequested = X.AcknowledgementRequested,
			NoOfRecipientes = CASE WHEN X.NoOfRecipientes > X.CustomerLicenseCount THEN X.CustomerLicenseCount ELSE X.NoOfRecipientes END,
			X.Delivered,
			CAST(CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC (18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per],
			X.NotDelivered,
			CAST(100.00 - CAST(CASE WHEN X.Delivered > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per],
			X.Acknowledged,
			CAST(CAST(CASE WHEN X.Acknowledged > 0 AND X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes) ELSE 0 END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]
		FROM
		(
			SELECT tau.AlertBody, tau.AlertId, tau.[Status], tau.AlertType, tau.EntryDate, FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc,
				(CASE ISNULL(tau.Iscancel, 0) WHEN 0 THEN 'Y' ELSE 'N' END) AS Active,
				tau.EntryBy, (CASE WHEN tass.SchedulePatternType IN ('Now', 'Once', '0', '1') THEN 'N' ELSE 'Y' END) AS Recurring,
				tau.AlertTital, (CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) AS NoOfRecipientes,
				Delivered.CNT AS [Delivered],
				(CASE WHEN tau.AlertType = 'BC' THEN Users.CNT ELSE Recipientes.CNT END) - Delivered.CNT AS [NotDelivered],
				Acknowledge.CNT AS [Acknowledged], (CASE tau.AcknoledgrButton WHEN 1 THEN 'Y' ELSE 'N' END) AS AcknowledgementRequested,
				CustomerCNT.LicenseCount AS CustomerLicenseCount
			FROM tbl_Alert_popUp tau WITH(NOLOCK)
			INNER JOIN tbl_Alert_Schedule_Setting tass WITH(NOLOCK) ON tass.AlertId = tau.AlertId
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM Tbl_Users tu WITH(NOLOCK) WHERE tu.deskbar_id IS NOT NULL AND tu.ParentCustID = @TenantId) Users
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId) Recipientes
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT COUNT(*) AS CNT FROM tbl_Send_Alert_User tsau WITH(NOLOCK) WHERE tsau.AlertId = tau.AlertId AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			OUTER APPLY(SELECT tcr.LicenseCount FROM tbl_CustomerRegistration tcr WITH (NOLOCK) WHERE tcr.CustomerId = @TenantId) CustomerCNT
			WHERE tau.[Status] = 'Send' AND tau.[Type] = @Type AND tau.CustomerId = @TenantId
			/* AND (CASE WHEN @TenantId = 0 THEN '1' ELSE tau.CustomerId END) = (CASE WHEN @TenantId = 0 THEN '1' ELSE @TenantId END) */
			AND tau.EntryBy = (CASE @BaseViewingType WHEN 'Personal' THEN @BaseUserId ELSE tau.EntryBy END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
			/* --AND tau.AlertParentId IS NULL */
		) X
		ORDER BY X.EntryDate DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PopAlertList_server_17_Sep]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
-- =============================================              
-- created By:  Sarita pal              
-- Create date: 16 Jun 2021              
-- Description: Pop Alert List              
--EXEC USP_PopAlertList '4','01 Jan 2021','02 Jul 2021'    
--EXEC USP_PopAlertList '1','09 Jun 2021','09 Aug 2021'    
--EXEC USP_PopAlertList '1','19 Jul 2021','17 Aug 2021','0','CYGNUSTEAM',''    
-- =============================================              
*/
CREATE PROCEDURE [dbo].[USP_PopAlertList_server_17_Sep] @Type VARCHAR(50),
@Fromdate VARCHAR(50),
@ToDate VARCHAR(50),
@TenantId INT,
@BaseUserId VARCHAR(50),
@BaseViewingType VARCHAR(50)
AS
BEGIN
	IF (@Type = '4')
	BEGIN
		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo
		   ,X.AlertBody
		   ,Type = @Type
		   ,X.AlertId
		   ,X.Status
		   ,X.AlertType
		   ,X.EntryDate
		   ,X.EntryDateDesc
		   ,X.EntryBy
		   ,X.AlertTital
		   ,X.NoOfRecipientes
		   ,Active =
			CASE
				WHEN X.Active = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,Recurring = '<span class="label label-danger">No</span>'
		   ,AcknowledgementRequested =
			CASE
				WHEN AcknowledgementRequested = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.Delivered
		   ,[Delivered_Per] = CAST(CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %'
		   ,X.NotDelivered
		   ,[NotDelivered_Per] = CAST(100.00 - CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %'
		   ,X.Acknowledged
		   ,[Acknowledged_Per] = CAST(CAST(CASE
				WHEN X.Acknowledged > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes)
				ELSE 0
			END AS NUMERIC(18, 2)) AS VARCHAR(10)) + ' %'
		FROM (SELECT
				tau.AlertBody
			   ,tau.AlertId
			   ,tau.Status
			   ,tau.AlertType
			   ,tau.EntryDate
			   ,FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc
			   ,CASE ISNULL(tau.Iscancel, 0)
					WHEN 0 THEN 'Y'
					ELSE 'N'
				END AS Active
			   ,tau.EntryBy
			   ,tau.AlertTital
			   ,CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END AS NoOfRecipientes
			   ,Delivered.CNT AS [Delivered]
			   ,(CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END) - Delivered.CNT AS [NotDelivered]
			   ,Acknowledge.CNT AS [Acknowledged]
			   ,CASE tau.AcknoledgrButton
					WHEN 1 THEN 'Y'
					ELSE 'N'
				END
				AS AcknowledgementRequested
			FROM tbl_Alert_popUp tau

			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM Tbl_Users tu
				WHERE tu.deskbar_id IS NOT NULL) Users
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND tsau.UserType = 'User') Recipientes
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			WHERE tau.Status = 'Send'
			AND tau.Type = @Type
			AND (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE tau.CustomerId
			END) = (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE @TenantId
			END)
			AND tau.EntryBy = (CASE @BaseViewingType
				WHEN 'Personal' THEN @BaseUserId
				ELSE tau.EntryBy
			END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
		--AND tau.AlertParentId IS NULL              
		) X
		ORDER BY X.EntryDate DESC
	END
	ELSE
	BEGIN

		SELECT
			ROW_NUMBER() OVER (ORDER BY X.AlertId) AS SrNo
		   ,X.AlertBody
		   ,Type = @Type
		   ,X.AlertId
		   ,X.Status
		   ,X.AlertType
		   ,X.EntryDate
		   ,X.EntryDateDesc
		   ,Active =
			CASE
				WHEN X.Active = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.EntryBy
		   ,Recurring =
			CASE
				WHEN X.Recurring = 'N' THEN '<span class="label label-danger">No</span>'

				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.AlertTital


		   ,AcknowledgementRequested =
			CASE
				WHEN AcknowledgementRequested = 'N' THEN '<span class="label label-danger">No</span>'
				ELSE '<span class="label label-success">Yes</span>'
			END
		   ,X.NoOfRecipientes
		   ,X.Delivered
		   ,CAST(CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS NUMERIC
			(18, 2)) AS VARCHAR(10)) + ' %' AS [Delivered_Per]
		   ,X.NotDelivered
		   ,CAST(100.00 - CAST(CASE
				WHEN X.Delivered > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Delivered) / NoOfRecipientes)
				ELSE 0
			END AS

			NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [NotDelivered_Per]
		   ,X.Acknowledged
		   ,CAST(CAST(CASE
				WHEN X.Acknowledged > 0 AND
					X.NoOfRecipientes > 0 THEN ((100.00 * X.Acknowledged) / X.NoOfRecipientes)
				ELSE 0
			END AS

			NUMERIC(18, 2)) AS VARCHAR(10)) + ' %' AS [Acknowledged_Per]

		FROM (SELECT
				tau.AlertBody
			   ,tau.AlertId
			   ,tau.Status
			   ,tau.AlertType
			   ,tau.EntryDate
			   ,FORMAT(tau.EntryDate, 'MM-dd-yyyy') AS EntryDateDesc
			   ,CASE ISNULL(tau.Iscancel, 0)
					WHEN 0 THEN 'Y'
					ELSE 'N'
				END AS Active
			   ,tau.EntryBy
			   ,CASE
					WHEN tass.SchedulePatternType IN ('Now', 'Daily', '0', '1') THEN 'N'
					ELSE 'Y'
				END AS Recurring
			   ,tau.AlertTital
			   ,CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END AS NoOfRecipientes
			   ,Delivered.CNT AS [Delivered]
			   ,(CASE
					WHEN tau.AlertType = 'BC' THEN Users.CNT
					ELSE Recipientes.CNT
				END) - Delivered.CNT AS [NotDelivered]
			   ,Acknowledge.CNT AS [Acknowledged]
			   ,CASE tau.AcknoledgrButton
					WHEN 1 THEN 'Y'
					ELSE 'N'
				END
				AS AcknowledgementRequested
			FROM tbl_Alert_popUp tau
			INNER JOIN tbl_Alert_Schedule_Setting tass
				ON tass.AlertId = tau.AlertId
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM Tbl_Users tu
				WHERE tu.deskbar_id IS NOT NULL) Users
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND tsau.UserType = 'User') Recipientes
			CROSS APPLY (SELECT
					COUNT(*)
					AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsReceived, 0) = 1) Delivered
			CROSS APPLY (SELECT
					COUNT(*) AS CNT
				FROM tbl_Send_Alert_User tsau
				WHERE tsau.AlertId = tau.AlertId
				AND ISNULL(tsau.IsAcknowledge, 0) = 1) Acknowledge
			WHERE tau.Status = 'Send'
			AND tau.Type = @Type
			AND (CASE
				WHEN @TenantId =

					0 THEN '1'
				ELSE tau.CustomerId
			END) = (CASE
				WHEN @TenantId = 0 THEN '1'
				ELSE @TenantId
			END)
			AND tau.EntryBy = (CASE @BaseViewingType
				WHEN 'Personal' THEN @BaseUserId
				ELSE tau.EntryBy
			END)
			AND tau.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
		--AND tau.AlertParentId IS NULL              
		) X
		ORDER BY X.EntryDate DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Quiz_Delete]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_Quiz_Delete]  
@AlertId varchar(10)
AS        
BEGIN TRANSACTION    
   
DECLARE @Status INT, @Message VARCHAR(500),@Id INT  
SELECT  @Message = 'Not Done',@Status = 0       
    
BEGIN  
  update tbl_Alert_popUp SET Iscancel=1 WHERE AlertId=@AlertId
  SELECT  @Message = 'Done',@Status = 1       

END     
SELECT MESSAGE = @Message,STATUS = @Status   
        
COMMIT TRANSACTION         
        
GOTO EndSave          
QuitWithRollback:          
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION          
BEGIN        
SELECT  MESSAGE = @Message,STATUS = @Status   
END        
        
EndSave:   
GO
/****** Object:  StoredProcedure [dbo].[Usp_Quiz_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Created By:sarita pal
	created date: 24 jul 2021
*/
CREATE PROCEDURE [dbo].[Usp_Quiz_Submit]
(
	@XML1 VARCHAR(MAX),
	@XML2 VARCHAR(MAX),
	@XML3 VARCHAR(MAX),
	@XML4 VARCHAR(MAX),
	@UserName VARCHAR(50),
	@QuizId INT,
	@DeskbarId NVARCHAR(100)
)
AS
	BEGIN TRANSACTION

	DECLARE @Status INT, @Message VARCHAR(500), @AcknoledgrButton BIT;
	DECLARE @hdoc1 INT, @hdocName1 VARCHAR(1000) = 'root/QuizAnswer1';
	DECLARE @hdoc2 INT, @hdocName2 VARCHAR(1000) = 'root/QuizAnswer2';
    DECLARE @hdoc3 INT, @hdocName3 VARCHAR(1000) = 'root/QuizAnswer3';
	DECLARE @hdoc4 INT, @hdocName4 VARCHAR(1000) = 'root/QuizAnswer4';
	SELECT @Message = 'Not Done', @Status = 0;

	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;
	EXEC sp_xml_preparedocument @hdoc2 OUTPUT, @XML2;
	EXEC sp_xml_preparedocument @hdoc3 OUTPUT, @XML3;
	EXEC sp_xml_preparedocument @hdoc4 OUTPUT, @XML4;

	BEGIN
		INSERT INTO tbl_UserQuizAnswer
		(QuizId, QuestId, CorrectAnswer, EntryBy, EntryDate, DeskbarId)
		SELECT QuizId ,QuestId ,Id ,@UserName ,GETDATE(), @DeskbarId
		FROM OPENXML(@hdoc2, @hdocName2, 2)
		WITH
		(
			QuizId BIGINT 'QuizId',
			QuestId BIGINT 'QuestId',
			Id VARCHAR(50) 'Id'
		)
		IF (@@error <> 0) GOTO QuitWithRollback

		INSERT INTO tbl_UserQuizAnswer
		(QuizId, QuestId, CorrectAnswer, EntryBy, EntryDate, DeskbarId)
		SELECT QuizId ,QuestId ,Id ,@UserName ,GETDATE(), @DeskbarId
		FROM OPENXML(@hdoc3, @hdocName3, 2)
		WITH
		(
			QuizId BIGINT 'QuizId', 
			QuestId BIGINT 'QuestId', 
		    Id VARCHAR(50) 'Id'
		)
		IF (@@error <> 0) GOTO QuitWithRollback

	    INSERT INTO tbl_UserQuizAnswer
		(QuizId, QuestId, CorrectAnswer, EntryBy, EntryDate, DeskbarId)
		SELECT QuizId ,QuestId ,Id ,@UserName ,GETDATE(), @DeskbarId
		FROM OPENXML(@hdoc4, @hdocName4, 2)
		WITH
		(
			QuizId BIGINT 'QuizId', 
			QuestId BIGINT 'QuestId', 
		    Id VARCHAR(50) 'Id'
		)
		IF (@@error <> 0) GOTO QuitWithRollback

		INSERT INTO tbl_UserQuizAnswer
		(QuizId, QuestId, CorrectAnswer, EntryBy, EntryDate, DeskbarId)
		SELECT QuizId ,QuestId, TextAnswer, @UserName, GETDATE(), @DeskbarId
		FROM OPENXML(@hdoc1, @hdocName1, 2)
		WITH
		(
			QuizId BIGINT 'QuizId', 
			QuestId BIGINT 'QuestId', 
			TextAnswer VARCHAR(50) 'TextAnswer'
		)
		IF (@@error <> 0) GOTO QuitWithRollback
	END

	SELECT @Status = 1, @Message = 'Done';
	
	SELECT [MESSAGE] = @Message, [Status] = @Status, [QuizId] = @QuizId, [DeskbarId] = @DeskbarId;
	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@trancount > 0)
	ROLLBACK TRANSACTION
	BEGIN
		SELECT [MESSAGE] = @Message, [STATUS] = @Status, [QuizId] = 0, [DeskbarId] = 0;
	END
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[USP_QuizAnalyticDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_QuizAnalyticDetail 7727
*/
CREATE PROCEDURE [dbo].[USP_QuizAnalyticDetail]
(
	@AlertId INT
)
AS
BEGIN
	SELECT
		tab.Id,
		tab.QuestId,
		Question,
		SUM(totalans) AS TotalAnswer,
		SUM(trueans) AS CorrectAnswer,
		SUM(falseans) AS IncorrectAnswer,
		CAST(sum(trueans) * 100 / SUM(totalans) AS VARCHAR(10) ) + ' %' AS CorrectPer,
		CAST(sum(tab.falseans) * 100 / SUM(totalans) AS VARCHAR(10) ) + ' %' AS InCorrectPer
		FROM
		(
			SELECT
				TQQ.Id,
				TQQ.Question,
				Count(TUQA.QuestId) AS totalans,
				TUQA.QuestId,
				COUNT(TUQA.CorrectAnswer) AS trueans,
				0 AS falseans
			FROM tbl_UserQuizAnswer TUQA WITH(NOLOCK)
			LEFT OUTER JOIN tbl_QuizQuestion TQQ WITH(NOLOCK) ON TUQA.QuestId=TQQ.Id
			WHERE TUQA.QuestId IN (SELECT Id FROM tbl_QuizQuestion WITH(NOLOCK) WHERE QuizId = @AlertId)
			AND TUQA.CorrectAnswer IN
			(
				SELECT Id = (CASE
						WHEN TQQ.QuestionType = 'SA' THEN (SELECT QA.Answer FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId = TQQ.Id AND QA.Id = Id)
						ELSE CAST(TQA.Id AS VARCHAR)
					END)
				FROM tbl_QuizAnswer TQA WITH(NOLOCK) WHERE QuestId IN (SELECT Id FROM tbl_QuizQuestion WITH(NOLOCK) WHERE QuizId = @AlertId) AND CorrectAnswer = 1
			)
			GROUP BY TUQA.QuestId,TQQ.Question,TQQ.Id

			UNION ALL

			SELECT
				TQQ.Id,
				TQQ.Question,
				COUNT(TUQA.QuestId) AS totalans,
				TUQA.QuestId,
				0 AS trueans,
				COUNT(TUQA.CorrectAnswer) AS falseans
			FROM tbl_UserQuizAnswer TUQA WITH(NOLOCK)
			LEFT OUTER JOIN tbl_QuizQuestion TQQ WITH(NOLOCK) ON TUQA.QuestId = TQQ.Id
			WHERE TUQA.QuestId IN (SELECT Id FROM tbl_QuizQuestion WITH(NOLOCK) WHERE QuizId = @AlertId)
			AND TUQA.CorrectAnswer NOT IN
			(
				SELECT
					Id = (CASE
						WHEN TQQ.QuestionType = 'SA' THEN (SELECT QA.Answer FROM tbl_QuizAnswer QA WITH(NOLOCK) WHERE QA.QuestId = TQQ.Id AND QA.Id = Id)
						ELSE CAST(TQA.Id AS VARCHAR)
					END)			
				FROM tbl_QuizAnswer TQA WITH(NOLOCK) WHERE QuestId IN (SELECT Id FROM tbl_QuizQuestion WITH(NOLOCK) WHERE QuizId = @AlertId) AND CorrectAnswer = 1
			)
			GROUP BY TUQA.QuestId,TQQ.Question,TQQ.Id
		) AS tab
	GROUP BY QuestId, Question,Id
	ORDER BY Id ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_QuizAnalyticDetail_BKP_CR_02Feb22]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- created By:  Salman Patel      
-- Create date: 27 10 2021      
-- Description: To get deatils Quiz for Analytics   
-- EXEC USP_QuizAnalyticDetail '3745'
-- EXEC USP_QuizAnalyticDetail '4973'
-- =============================================   
CREATE PROCEDURE [dbo].[USP_QuizAnalyticDetail_BKP_CR_02Feb22]
(  
	@AlertId INT
)  
AS  
BEGIN
	SELECT
		/* Id = ROW_NUMBER() OVER (ORDER BY tab.Id ASC), */
		tab.Id, tab.QuestId,
		Question, sum(totalans) as TotalAnswer, sum(trueans) AS CorrectAnswer, sum(falseans) AS IncorrectAnswer,
		CAST(sum(trueans) * 100 / sum(totalans) AS VARCHAR(10) ) + ' %' AS CorrectPer,
		CAST(sum(tab.falseans) * 100 / sum(totalans) AS VARCHAR(10) ) + ' %' AS InCorrectPer
		FROM(
				SELECT TQQ.Id,TQQ.Question,Count(TUQA.QuestId) as totalans,TUQA.QuestId,COUNT(TUQA.CorrectAnswer) as trueans,0 as falseans 
				from tbl_UserQuizAnswer TUQA
				LEFT OUTER JOIN tbl_QuizQuestion TQQ ON TUQA.QuestId=TQQ.Id
				where TUQA.QuestId in (SELECT Id FROM tbl_QuizQuestion WHERE QuizId = @AlertId)
				and TUQA.CorrectAnswer in (SELECT CAST(Id AS VARCHAR) FROM tbl_QuizAnswer WHERE QuestId IN (SELECT Id FROM tbl_QuizQuestion WHERE QuizId = @AlertId) AND CorrectAnswer = 1)
				group by TUQA.QuestId,TQQ.Question,TQQ.Id
				union all
				select TQQ.Id,TQQ.Question,Count(TUQA.QuestId) as totalans,TUQA.QuestId,0 as trueans,COUNT(TUQA.CorrectAnswer) as falseans 
				from tbl_UserQuizAnswer TUQA
				LEFT OUTER JOIN tbl_QuizQuestion TQQ ON TUQA.QuestId=TQQ.Id
				where TUQA.QuestId in (SELECT Id FROM tbl_QuizQuestion WHERE QuizId = @AlertId)
				and TUQA.CorrectAnswer NOT in (SELECT CAST(Id AS VARCHAR) FROM tbl_QuizAnswer WHERE QuestId IN (SELECT Id FROM tbl_QuizQuestion WHERE QuizId = @AlertId) AND CorrectAnswer = 1)
				group by TUQA.QuestId,TQQ.Question,TQQ.Id
			) AS tab
	GROUP BY QuestId,Question,Id
	ORDER BY Id ASC;
	--ORDER BY tab.Id ASC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_QuizUserWiseResult]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_QuizUserWiseResult '79','correct'
	EXEC USP_QuizUserWiseResult '79','Incorrect'
*/
CREATE PROCEDURE [dbo].[USP_QuizUserWiseResult]
(
	@AlertId VARCHAR(50),
	@Type VARCHAR(50)
)
AS  
BEGIN
	IF(@Type = 'Correct')
	BEGIN
		SELECT
			/* CA.EntryBy AS UserName, */
 			ISNULL(CA.DeskbarId,'') AS DeskbarId,
			ISNULL(UR.[name],'') AS UserName,
			ISNULL(UR.display_name,'') AS DisplayName
		FROM tbl_UserQuizAnswer CA WITH(NOLOCK)
		OUTER APPLY
		(
			SELECT
				TU.[name], TU.display_name
			FROM Tbl_Users TU WITH(NOLOCK) WHERE TU.deskbar_id = CA.DeskbarId
		)UR
		WHERE QuestId = CONVERT(INT, @AlertId)
		AND CorrectAnswer IN (SELECT CONVERT(VARCHAR,Id) FROM tbl_QuizAnswer WITH(NOLOCK) WHERE QuestId IN (SELECT Id FROM tbl_QuizQuestion WITH(NOLOCK)) AND CorrectAnswer = 1)
	END
	ELSE
	BEGIN
		SELECT
			/* IA.EntryBy AS UserName, */
			ISNULL(IA.DeskbarId,'') AS DeskbarId,
			ISNULL(USR.[name],'') AS UserName,
			ISNULL(USR.display_name,'') AS DisplayName
		FROM tbl_UserQuizAnswer IA WITH(NOLOCK)
		OUTER APPLY
		(
			SELECT
				TU.[name], TU.display_name
			FROM Tbl_Users TU WITH(NOLOCK) WHERE TU.deskbar_id = IA.DeskbarId
		)USR
		WHERE QuestId = CONVERT(INT, @AlertId)
		AND CorrectAnswer NOT IN (SELECT CONVERT(VARCHAR,Id) FROM tbl_QuizAnswer WHERE QuestId IN (SELECT Id FROM tbl_QuizQuestion WITH(NOLOCK)) AND CorrectAnswer = 1)	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RepecientList]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*      
	EXEC USP_RepecientList '01 Aug 2021','18 Nov 2021',0
*/     
CREATE PROCEDURE [dbo].[USP_RepecientList]
(
	@Fromdate VARCHAR(50),            
	@ToDate VARCHAR(50),  
	@CustomerId INT
)
AS           
BEGIN  
 SELECT ROW_NUMBER() Over (Order by sau.Id) As SrNo,sau.Name AS UserName,sau.Id As id,CONVERT(VARCHAR,sau.reg_date,101) AS reg_dateDesc,  
 sau.reg_date,sau.email,sau.mobile_phone, ISNULL(XX.AlertCnt,0) AS AlertCnt,ISNULL(XX1.TickerCnt,0) AS TickerCnt,  
 ISNULL(XX2.WallpaperCnt,0) AS WallpaperCnt, ISNULL(XX3.ScreenSaverCnt,0) AS ScreenSaverCnt,ISNULL(XX4.LockScreenCnt,0) AS LockScreenCnt,
 Is_AD_User = sau.Is_AD_User,
 AD_DomainName = ISNULL(sau.AD_DomainName,''),
 IsADSync = sau.IsADSync
 FROM Tbl_Users sau    
 OUTER APPLY (   SELECT COUNT(cc.UserId) AS AlertCnt,cc.UserId   
     FROM tbl_Send_Alert_User cc  
     INNER JOIN tbl_Alert_popUp a ON sau.id = cc.UserId  
     AND a.Alertid = cc.AlertId AND a.Type = 1   
     AND a.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
     AND a.Status='Send'  
     AND ISNULL(a.CustomerId,0)=@CustomerId  
     GROUP BY cc.UserId   
    )XX   
 OUTER  APPLY (  SELECT COUNT(cc1.UserId) AS TickerCnt,cc1.UserId  
     FROM tbl_Send_Alert_User cc1  
     INNER JOIN tbl_Alert_popUp a1 ON sau.id=cc1.UserId AND a1.AlertId=cc1.Alertid AND a1.Type=2     
     AND a1.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'   
     AND a1.Status='Send'  
     AND ISNULL(a1.CustomerId,0)=@CustomerId  
     GROUP BY cc1.UserId   
     )XX1   
 OUTER  APPLY (  SELECT COUNT(cc2.UserId) AS WallpaperCnt,cc2.UserId FROM tbl_Send_Alert_User cc2   
     INNER JOIN tbl_Alert_popUp a2 on sau.id=cc2.UserId AND a2.AlertId=cc2.Alertid AND a2.Type=3    
     AND a2.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'   
     AND a2.Status='Send'  
     AND ISNULL(a2.CustomerId,0)=@CustomerId  
     GROUP BY cc2.UserId   
     )XX2   
 OUTER  APPLY (  SELECT COUNT(cc3.UserId) AS ScreenSaverCnt,cc3.UserId FROM tbl_Send_Alert_User cc3   
     INNER JOIN tbl_Alert_popUp a3 on sau.id=cc3.UserId AND a3.AlertId=cc3.Alertid AND a3.Type=4    
     AND a3.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
     AND a3.Status='Send'  
     AND ISNULL(a3.CustomerId,0)=@CustomerId  
     GROUP BY cc3.UserId   
     )XX3   
 OUTER  APPLY (  SELECT COUNT(cc4.UserId) AS LockScreenCnt,cc4.UserId FROM tbl_Send_Alert_User cc4   
     INNER JOIN tbl_Alert_popUp a4 on sau.id=cc4.UserId AND a4.AlertId=cc4.Alertid AND a4.Type=7    
     AND a4.EntryDate BETWEEN @Fromdate AND @ToDate + ' 23:59:59'
     AND a4.Status='Send'  
     AND ISNULL(a4.CustomerId,0)=@CustomerId  
     GROUP BY cc4.UserId   
     )XX4   
 WHERE 1=1 AND ISNULL(sau.ParentCustID,0)=@CustomerId  
 GROUP by  sau.Name,sau.Id,sau.reg_date, sau.email,sau.mobile_phone ,XX.AlertCnt,XX1.TickerCnt,  
 XX2.WallpaperCnt,XX3.ScreenSaverCnt, XX4.LockScreenCnt,sau.Is_AD_User, sau.AD_DomainName,sau.IsADSync
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Resend_Alert]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_Resend_Alert '',''
*/
CREATE PROCEDURE [dbo].[USP_Resend_Alert]
(
	@AlertId INT,
	@EntryBy VARCHAR(100)
)
AS
BEGIN

	DECLARE @NewAlertId INT, @PreviousAlertID INT;
	DECLARE @Status INT, @Message VARCHAR(500), @NAlertId VARCHAR(500), @Type VARCHAR(100), @typ VARCHAR(100);
	SELECT @Message = 'Not Done', @Status = 0;

	BEGIN
		INSERT INTO tbl_Alert_popUp
		(
			AlertTital,AlertBody,CriticalAlert,AutoCloseIn,AutoCloseInMin,
			ExpiresIn,ExpiresTimeValue,ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,
			DesktopSizeWidth,DesktopSizeHeight,AlertPosition,EntryDate,EntryBy,Status,ThemeId,isResize,Type,
			TickerSpeed,TickerPosition,AlertParentId,AlertType,CustomerId,
			ScreenWaitMinutes,IsOnResumeDisplay,MessagingType,AcknowledgeButtonText
		)
		SELECT
			AlertTital,AlertBody,CriticalAlert,AutoCloseIn,AutoCloseInMin,
			ExpiresIn,ExpiresTimeValue,ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,
			DesktopSizeWidth,DesktopSizeHeight,AlertPosition,GETDATE(),@EntryBy,'Send',ThemeId,isResize,Type,
			TickerSpeed,TickerPosition,T.AlertId,AlertType,T.CustomerId,
			ScreenWaitMinutes,IsOnResumeDisplay,MessagingType,AcknowledgeButtonText
		FROM tbl_Alert_popUp T WITH(NOLOCK)
		WHERE T.Alertid = @AlertId

		--IF (@@ERROR <> 0 ) GOTO QuitWithRollback   
		SELECT @typ= Type FROM tbl_Alert_popUp T WITH(NOLOCK) WHERE T.AlertId = @AlertId
		SET @NewAlertId= SCOPE_IDENTITY();

		INSERT INTO tbl_Alert_Schedule_Setting
		(
			AlertId,SchedulePatternType,OnceStartDateTime,OnceEndDateTime,
			IsOnceReminder,OnceReminderVal,DailyPatternVal,WeeklyVal,WeeklydaySunday,WeeklydayMonday,WeeklydayTuesday,
			WeeklydayWednesday,WeeklydayThursday,WeeklydayFriday,WeeklydaySaturday,MonthDay,MonthVal,
			MonthlyType,WeekinMontly,DayinWeek,WeeklyMonthVal,YearlyType,YearlMonth,DayinWeekYearly,
			WeekinMontYearly,MonthsYearl,StartDateComman,CommanDateType,CommanOccurences,CommanEndBy,EntryBy,EntryDate
		)
		SELECT
			@NewAlertId,SchedulePatternType,OnceStartDateTime,OnceEndDateTime,IsOnceReminder,OnceReminderVal,
			DailyPatternVal,WeeklyVal,WeeklydaySunday,WeeklydayMonday,WeeklydayTuesday,WeeklydayWednesday,
			WeeklydayThursday,WeeklydayFriday,WeeklydaySaturday,MonthDay,MonthVal,MonthlyType,WeekinMontly,
			DayinWeek,WeeklyMonthVal,YearlyType,YearlMonth,DayinWeekYearly,WeekinMontYearly,MonthsYearl,
			StartDateComman,CommanDateType,CommanOccurences,CommanEndBy,@EntryBy,GETDATE()
		FROM tbl_Alert_Schedule_Setting TS WITH(NOLOCK)
		WHERE TS.Alertid = @AlertId
  
		--IF (@@ERROR <> 0 ) GOTO QuitWithRollback
		INSERT INTO tbl_Send_Alert_User
		(
			Alertid,UserId,UserName,EntryBy,EntryDate,UserType,IsAcknowledge,AcknowledgeDate,Status,ClearDate
		)
		SELECT DISTINCT
			@NewAlertId,UserId,UserName,@EntryBy,GETDATE(),UserType,0,NULL,'Send',NULL FROM tbl_Send_Alert_User tsau
		WHERE tsau.Alertid = @AlertId

		PRINT 'S';
		PRINT 'M';
	END
	SELECT @Status = 1, @Message = 'Done', @NAlertId=@NewAlertId, @Type=@typ, @PreviousAlertID = @AlertId;

	BEGIN
		SELECT MESSAGE = @Message, STATUS = @Status, NewAlertId = @NAlertId, Type = @Type, PreviousAlertID = @PreviousAlertID;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_ReSetPassword]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_ReSetPassword]
@Password Varchar(MAX),
@ID INT
AS      
BEGIN TRANSACTION
	DECLARE @Status INT, @Message VARCHAR(500)     
	SELECT  @Message = 'Not Done',@Status = 0  

	IF(@ID>0)
	BEGIN
		UPDATE Tbl_Master_Users SET UserPwd=@Password WHERE Id=@ID
		SELECT @Status = 1, @Message = 'Done'
	END
        
SELECT MESSAGE = @Message,STATUS = @Status
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
BEGIN
	SELECT  MESSAGE = @Message,STATUS = @Status
END
EndSave: 
GO
/****** Object:  StoredProcedure [dbo].[USP_Save_AD_SyncDataAsDraft]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
===========================================================================
DESCRIPTION : Save AD SyncData As Draft & Create SQL Job For Schedule
===========================================================================
EXEC USP_Save_AD_SyncDataAsDraft '','','','',''
===========================================================================
*/
CREATE PROCEDURE [dbo].[USP_Save_AD_SyncDataAsDraft]
(
	@ADHeaderXML XML,
	@OUJson NVARCHAR(MAX),
	@GroupJson NVARCHAR(MAX),
	@ADSyncScheduleXML XML,
	@BaseUserName VARCHAR(50),
	@CustomerId INT
)
AS
BEGIN
	DECLARE @Status INT, @Message VARCHAR(500), @ProfileName VARCHAR(100);
	SELECT @Message = 'Not Done', @Status = 0, @ProfileName = '';

	/*---------- START : GET GLOBAL VALUE ----------*/
	DECLARE @Domain VARCHAR(100), @ADUserName VARCHAR(100), @ADSyncName VARCHAR(100);
	DECLARE @ADSaveExist INT = 0, @AD_HeaderId INT = 0, @ADJobName VARCHAR(100) = '';
	SELECT
		@Domain = DXML.DomainName,
		@ADUserName = DXML.ADUserName,
		@ADSyncName = DXML.ADSyncName
	FROM
	(
		SELECT
			A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
			A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
			A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName
		FROM @ADHeaderXML.nodes('/ActiveDerectoryModel') A (H)
	)DXML

	SELECT @AD_HeaderId = AD_HDR.Id FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
	WHERE AD_HDR.Domain = @Domain AND AD_HDR.UserId = @ADUserName
	AND AD_HDR.CustomerId = @CustomerId;
	/*---------- END : GET GLOBAL VALUE ----------*/


	/*---------- START : GET SCHEDULE SETTING VALUE ----------*/
	DECLARE @ScheduleType VARCHAR(100), @SyncStartDate DATETIME;
	SELECT
		@ScheduleType = DXML.ScheduleType,
		@SyncStartDate = DXML.SyncStartDate
	FROM
	(
		SELECT
			A.H.value('AD_Header_Id[1]', 'INT') AS AD_Header_Id,
			A.H.value('ScheduleType[1]', 'VARCHAR(100)') AS ScheduleType,
			A.H.value('SyncStartDate[1]', 'DATETIME') AS SyncStartDate,
			A.H.value('WeeklydaySunday[1]', 'BIT') AS WeeklydaySunday,
			A.H.value('WeeklydayMonday[1]', 'BIT') AS WeeklydayMonday,
			A.H.value('WeeklydayTuesday[1]', 'BIT') AS WeeklydayTuesday,
			A.H.value('WeeklydayWednesday[1]', 'BIT') AS WeeklydayWednesday,
			A.H.value('WeeklydayThursday[1]', 'BIT') AS WeeklydayThursday,
			A.H.value('WeeklydayFriday[1]', 'BIT') AS WeeklydayFriday,
			A.H.value('WeeklydaySaturday[1]', 'BIT') AS WeeklydaySaturday,
			A.H.value('CustomerId[1]', 'INT') AS CustomerId
		FROM @ADSyncScheduleXML.nodes('/ADScheduleSetting') A (H)
	)DXML
	/*---------- END : GET SCHEDULE SETTING VALUE ----------*/

	BEGIN TRANSACTION
	BEGIN TRY

		SELECT @ADSaveExist = COUNT(*) FROM Tbl_AD_SyncSave_Draft Draft WITH(NOLOCK)
		WHERE Draft.AD_Header_Id = @AD_HeaderId;

		IF(@ADSaveExist > 0)
		BEGIN
			UPDATE Tbl_AD_SyncSave_Draft
			SET
				OUJsonString = @OUJson,
				GroupJsonString = @GroupJson,
				SchedulerXML = @ADSyncScheduleXML,
				UpdateBy = @BaseUserName,
				UpdateDate = GETDATE()
			WHERE Tbl_AD_SyncSave_Draft.AD_Header_Id = @AD_HeaderId;

			UPDATE Tbl_AD_Sync_Header
			SET
				ADSyncName = @ADSyncName,
				SaveDraftSyncDate = GETDATE(),
				IsActive = 1
			WHERE Tbl_AD_Sync_Header.Id = @AD_HeaderId;
		END
		ELSE
		BEGIN
			INSERT INTO Tbl_AD_SyncSave_Draft
			(
				AD_Header_Id, OUJsonString, GroupJsonString,
				SchedulerXML, EntryBy, EntryDate
			)
			VALUES
			(
				@AD_HeaderId, @OUJson, @GroupJson,
				@ADSyncScheduleXML, @BaseUserName, GETDATE()
			);
		END

		/*---------- Start : Create/Remove AD Auto Sync SQLJob ----------*/
		SELECT @ADJobName = SD.SchedulerJobName FROM Tbl_AD_SyncSave_Draft SD WITH(NOLOCK)
		WHERE SD.AD_Header_Id = @AD_HeaderId;

		IF(@ScheduleType = 'Weekly')
		BEGIN
			IF(ISNULL(@ADJobName,'') <> '')
			BEGIN
				EXEC msdb.dbo.sp_delete_job @job_name = @ADJobName, @delete_history = 1;

				UPDATE Tbl_AD_SyncSave_Draft SET SchedulerJobName = ''
				WHERE AD_Header_Id = @AD_HeaderId;
			END

			EXEC dbo.USP_AD_AutoSync_CreateSchedulerJob @AD_HeaderId, @CustomerId, @ADSyncScheduleXML;
		END
		ELSE
		BEGIN
        	IF(ISNULL(@ADJobName,'') <> '')
			BEGIN
				EXEC msdb.dbo.sp_delete_job @job_name = @ADJobName, @delete_history = 1;

				UPDATE Tbl_AD_SyncSave_Draft SET SchedulerJobName = ''
				WHERE AD_Header_Id = @AD_HeaderId;
			END
        END
		/*---------- End : Create/Remove AD Auto Sync SQLJob ----------*/

		SELECT @Message = 'Done', @Status = 1, @ProfileName = @Domain;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT @Status = 0, @Message = 'LINE No. '+ CAST(ERROR_LINE() AS VARCHAR(50)) + ' ' + ERROR_MESSAGE(), @ProfileName = '';
		ROLLBACK TRANSACTION
	END CATCH
	SELECT [Message] = @Message, [Status] = @Status, [ProfileName] = @ProfileName;
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_SmtpConfiguration_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
=====================================================
DESCRIPTION : Add/Edit Mail SMTP Configuration
=====================================================
EXEC Usp_SmtpConfiguration_Submit '','',''
=====================================================
*/
CREATE PROCEDURE [dbo].[Usp_SmtpConfiguration_Submit]
(
	@XML1 XML,
	@BaseUserName VARCHAR(50),
	@CustomerId INT
)
AS
BEGIN TRANSACTION
 
	DECLARE @Status INT, @Message VARCHAR(500), @ID INT = 0, @CustId INT;
	SELECT  @Message = 'Not Done',@Status = 0     
        
	DECLARE @hdoc1 INT,@hdocName VARCHAR(1000)='SmtpConfigurationModel';
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT,@XML1;

	/*---------- START : GET GLOBAL VALUE ----------*/
	SELECT
		@ID = DXML.Id,
		@CustId = DXML.CustomerId
	FROM
	(        
		SELECT
			A.H.value('Id[1]', 'INT') AS Id,
			A.H.value('CustomerId[1]', 'INT') AS CustomerId
		FROM @XML1.nodes('/SmtpConfigurationModel') A (H)
	)DXML
	/*---------- END : GET GLOBAL VALUE ----------*/

	BEGIN
		IF(@ID > 0)
		BEGIN
			/*----- Start : Modify SMTP Data -----*/  
			UPDATE SMTP
			SET
				SMTP.SmtpServer = DXML.SmtpServer,
				SMTP.SmtpPort = DXML.SmtpPort,
				SMTP.SmtpUserName = DXML.SmtpUserName,
				SMTP.SmtpPassword = DXML.SmtpPassword,
				SMTP.FromAddress = DXML.FromAddress,
				SMTP.RecepientAddress = DXML.RecepientAddress,
				SMTP.TLSSL = DXML.TLSSL,
				SMTP.SmtpSetting = DXML.SmtpSetting,
				SMTP.EmailSupport = DXML.EmailSupport
			FROM tbl_Smtpconfiguratation SMTP
			INNER JOIN
			(  
				SELECT
					B.Id, B.CustomerId, B.SmtpServer, B.SmtpPort,
					B.SmtpUserName, B.SmtpPassword, B.FromAddress,
					B.RecepientAddress, B.TLSSL, B.SmtpSetting,
					B.EmailSupport
				FROM  
				(  
					SELECT  
						A.H.value('Id[1]', 'INT') AS Id,
						A.H.value('CustomerId[1]', 'INT') AS CustomerId,
						A.H.value('SmtpServer[1]', 'VARCHAR(200)') AS SmtpServer,
						A.H.value('SmtpPort[1]', 'VARCHAR(200)') AS SmtpPort,
						A.H.value('SmtpUserName[1]', 'VARCHAR(200)') AS SmtpUserName,
						A.H.value('SmtpPassword[1]', 'VARCHAR(200)') AS SmtpPassword,
						A.H.value('FromAddress[1]', 'VARCHAR(200)') AS FromAddress,
						A.H.value('RecepientAddress[1]', 'VARCHAR(200)') AS RecepientAddress,
						A.H.value('EmailSupport[1]', 'BIT') AS EmailSupport,
						A.H.value('SmtpSetting[1]', 'BIT') AS SmtpSetting,
						A.H.value('TLSSL[1]', 'BIT') AS TLSSL
					FROM @XML1.nodes('/SmtpConfigurationModel') A (H)
				)B
			) DXML
			ON DXML.ID = SMTP.[Id]
			WHERE SMTP.ID = DXML.[Id] AND SMTP.CustomerId = DXML.CustomerId;
			/*----- End : Modify SMTP Data -----*/

			IF (@@ERROR <> 0 ) GOTO QuitWithRollback;
			SELECT @Status = 1, @Message = 'Done'
		END
		ELSE
		BEGIN
			INSERT INTO tbl_Smtpconfiguratation
			(
				SmtpServer,SmtpPort,SmtpUserName,SmtpPassword,
				FromAddress,RecepientAddress,TLSSL,SmtpSetting,
				EmailSupport,EntryBy,EntryDate,CustomerId
			) 
			SELECT
				SmtpServer,SmtpPort,SmtpUserName,SmtpPassword,
				FromAddress,RecepientAddress,EmailSupport,SmtpSetting,
				TLSSL,@BaseUserName,GETDATE(),@CustomerId
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				SmtpServer VARCHAR(50) 'SmtpServer',
				SmtpPort VARCHAR(50) 'SmtpPort',
				SmtpUserName VARCHAR(50) 'SmtpUserName',
				SmtpPassword VARCHAR(50) 'SmtpPassword',
				FromAddress VARCHAR(50) 'FromAddress',
				RecepientAddress VARCHAR(50) 'RecepientAddress',
				EmailSupport BIT 'EmailSupport',
				SmtpSetting BIT 'SmtpSetting',
				TLSSL BIT 'TLSSL'
			)

			IF (@@ERROR <> 0 ) GOTO QuitWithRollback;
			SELECT @Status = 1, @Message = 'Done'
		END
	END
	SELECT MESSAGE = @Message,STATUS = @Status;
	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN      
		SELECT  MESSAGE = @Message,STATUS = @Status;
	END        
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[USP_Stop_Delete_AD_SyncData]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
====================================================================
DESCRIPTION :  Stop,Delete ADSync Data & Remove AutoJob By Profiler
====================================================================
EXEC USP_Stop_Delete_AD_SyncData '','XCOMMS','0','StopAD'
EXEC USP_Stop_Delete_AD_SyncData '','XCOMMS','0','DeleteAD'
====================================================================
*/
CREATE PROCEDURE [dbo].[USP_Stop_Delete_AD_SyncData]
(
	@ADHeaderXML XML,
	@BaseUserName VARCHAR(50),
	@CustomerId INT,
	@Flag VARCHAR(30) = ''
)
AS
BEGIN
	DECLARE @Status INT, @Message VARCHAR(500), @ProfileName VARCHAR(100);
	SELECT @Message = 'Not Done', @Status = 0, @ProfileName = '';

	/*---------- START : GET GLOBAL VALUE ----------*/
	DECLARE @ADDomain VARCHAR(100), @ADUserName VARCHAR(100), @ADSyncName VARCHAR(100);
	DECLARE @AD_HeaderId INT = 0, @ADJobName VARCHAR(100) = '';
	SELECT
		@ADDomain = DXML.DomainName,
		@ADUserName = DXML.ADUserName,
		@ADSyncName = DXML.ADSyncName
	FROM
	(
		SELECT
			A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
			A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
			A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName,
			A.H.value('ADPassword[1]', 'VARCHAR(100)') AS ADPassword
		FROM @ADHeaderXML.nodes('/ActiveDerectoryModel') A (H)
	)DXML
	/*---------- END : GET GLOBAL VALUE ----------*/

	SELECT @AD_HeaderId = AD_HDR.Id FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
	WHERE AD_HDR.Domain = @ADDomain AND AD_HDR.UserId = @ADUserName
	AND AD_HDR.CustomerId = @CustomerId;

	BEGIN TRANSACTION
	BEGIN TRY
		IF(@AD_HeaderId > 0)
		BEGIN
			IF(ISNULL(@Flag,'') <> '' AND @Flag = 'DeleteAD')
			BEGIN
            	UPDATE Tbl_AD_Sync_Header
				SET
					ADSyncName = '',
					IsAutoSync = 0,
					IsActive = 0,
					ADDeleteBy = @BaseUserName,
					ADDeleteDate = GETDATE()
				WHERE Id = @AD_HeaderId AND CustomerId = @CustomerId;
            END
			ELSE IF(ISNULL(@Flag,'') <> '' AND @Flag = 'StopAD')
			BEGIN
				UPDATE Tbl_AD_Sync_Header
				SET
					StopSyncBy = @BaseUserName,
					StopSyncDate = GETDATE()
				WHERE Id = @AD_HeaderId AND CustomerId = @CustomerId;
			END

			UPDATE Tbl_AD_Sync_Detail
			SET
				Is_Sync = 0,
				UpdateBy = @BaseUserName,
				UpdateDate = GETDATE()
			WHERE AD_Header_Id = @AD_HeaderId AND Is_AD_User = 1;

			UPDATE Tbl_AD_Sync_Schedule_Setting
			SET
				ScheduleType = 'Now',
				WeeklydaySunday = 0,
				WeeklydayMonday = 0,
				WeeklydayTuesday = 0,
				WeeklydayWednesday = 0,
				WeeklydayThursday = 0,
				WeeklydayFriday = 0,
				WeeklydaySaturday = 0,
				UpdateBy = @BaseUserName,
				UpdateDate = GETDATE()
			WHERE AD_Header_Id = @AD_HeaderId AND CustomerId = @CustomerId;

			UPDATE Tbl_Users
			SET
				IsADSync = 0,
				Iscancel = 0,
				update_By = @BaseUserName,
				update_date = GETDATE()
			WHERE AD_Header_Id = @AD_HeaderId
			AND AD_DomainName = @ADDomain AND Is_AD_User = 1;

			UPDATE Tbl_Groups
			SET
				IsADGroupSync = 0,
				UpdateBy = @BaseUserName,
				UpdateDate = GETDATE()
			WHERE AD_Header_Id = @AD_HeaderId
			AND AD_DomainName = @ADDomain AND Is_AD_Group = 1;

			/*---------- Start : Remove AD Auto Sync SQLJob ----------*/
			SELECT @ADJobName = SD.SchedulerJobName FROM Tbl_AD_SyncSave_Draft SD WITH(NOLOCK)
			WHERE SD.AD_Header_Id = @AD_HeaderId;

			IF(ISNULL(@ADJobName,'') <> '')
			BEGIN
				EXEC msdb.dbo.sp_delete_job @job_name = @ADJobName, @delete_history = 1;
				UPDATE Tbl_AD_SyncSave_Draft
				SET
					SchedulerJobName = '',
					OUJsonString = '',
					GroupJsonString = '',
					SchedulerXML = '',
					UpdateBy = @BaseUserName,
					UpdateDate = GETDATE()
				WHERE AD_Header_Id = @AD_HeaderId;
			END
			/*---------- End : Remove AD Auto Sync SQLJob ----------*/
		END

		SELECT @Message = 'Done', @Status = 1, @ProfileName = @ADDomain;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @Status = 0, @Message = 'LINE No. '+ CAST(ERROR_LINE() AS VARCHAR(50)) + ' ' + ERROR_MESSAGE(), @ProfileName = '';
		ROLLBACK TRANSACTION
	END CATCH

	SELECT [Message] = @Message, [Status] = @Status, [ProfileName] = @ProfileName;;
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_StopAlert]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_StopAlert]
(
	@XML XML,
	@EntryBy VARCHAR(50)
)
AS
BEGIN
	DECLARE @Status INT, @Message VARCHAR(500), @StopAlertId INT, @JobNameDel VARCHAR(500);
	SELECT  @Message = 'Not Done', @Status = 0;
	DECLARE @Cnt INT = 1, @Totcnt INT;

	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000) = '/ArrayOfAlertModel/AlertModel';
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML;

	BEGIN TRANSACTION

	DECLARE @tmp TABLE
	(
		Id INT IDENTITY(1,1),
		AlertId INT,
		JobName VARCHAR(MAX)
	);

	INSERT INTO @tmp(AlertId)
	SELECT AlertId FROM OPENXML(@hdoc1, @hdocName, 2)
	WITH ( AlertId INT 'AlertId' )

	UPDATE @tmp SET JobName = TAP.JobName
	FROM tbl_Alert_popUp TAP
	INNER JOIN @tmp t ON TAP.AlertId = t.AlertId;

	SELECT @Totcnt = COUNT(*) FROM @tmp;

	WHILE(@Cnt <= @Totcnt)
	BEGIN
		SELECT @JobNameDel = JobName, @StopAlertId = AlertId FROM @tmp WHERE Id = @Cnt;

		IF(@JobNameDel != '')
		BEGIN
			EXEC msdb.dbo.sp_delete_job @job_name = @JobNameDel;

			UPDATE tbl_Alert_popUp
			SET
				IsAlertStop = 1,
				Iscancel = 1,
				JobName = NULL,
				UpdateBy = @EntryBy,
				UpdateDate = GETDATE()
			WHERE AlertId = @StopAlertId;
			
			DELETE FROM tbl_Send_Alert_User WHERE AlertId = @StopAlertId;
		END
		ELSE
		BEGIN
			/*----------START - STOP ALERT : CANCEL/INACTIVE ----------*/
			UPDATE tbl_Alert_popUp 
			SET
				Iscancel = 1,
				UpdateBy = @EntryBy,
				UpdateDate = GETDATE()
			WHERE tbl_Alert_popUp.AlertId = @StopAlertId;
			/*----------END - STOP ALERT : CANCEL/INACTIVE ----------*/
		END

		SET @Cnt = @Cnt + 1;
	END

	SELECT @Status = 1, @Message = 'Done';
	SELECT [MESSAGE] = @Message, [STATUS] = @Status;

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT [MESSAGE] = @Message, [STATUS] = @Status;
	END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Submit_AD_SyncData]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
===================================================================
DESCRIPTION : Add/Edit ActiveDirectory Sync Users & Group Data
===================================================================
EXEC USP_SubmitSyncADData '','','','',''
===================================================================
*/
CREATE PROCEDURE [dbo].[USP_Submit_AD_SyncData]
(
	@XML XML,
	@XmlOUDirectoryList XML,
	@XmlADGroupDirectoryList XML,
	@ADSyncSchedule XML,
	@BaseUserName VARCHAR(50),
	@CustomerId INT,
	@Flag VARCHAR(30)
)
AS
BEGIN
	DECLARE @Status INT, @Message VARCHAR(500), @ProfileName VARCHAR(100);
	SELECT @Message = 'Not Done', @Status = 0, @ProfileName = '';

	/*---------- START : GET GLOBAL VALUE ----------*/
	DECLARE @Domain VARCHAR(100), @ADUserName VARCHAR(100), @ADSyncName VARCHAR(100);
	DECLARE @ADExist INT = 0, @AD_HeaderId INT = 0, @SyncScheduleCnt INT = 0;
	SELECT
		@Domain = DXML.DomainName,
		@ADUserName = DXML.ADUserName,
		@ADSyncName = DXML.ADSyncName
	FROM
	(
		SELECT
			A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
			A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
			A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName
		FROM @XML.nodes('/ActiveDerectoryModel') A (H)
	)DXML
	/*---------- END : GET GLOBAL VALUE ----------*/

	BEGIN TRANSACTION
	BEGIN TRY

		SELECT @ADExist = COUNT(*) FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
		WHERE AD_HDR.Domain = @Domain AND AD_HDR.UserId = @ADUserName;

		IF(@ADExist = 0)
		BEGIN
			INSERT INTO Tbl_AD_Sync_Header
			(
				Domain, UserId, [Password], CustomerId,
				ADSyncName, IsActive, EntryBy, EntryDate,
				SubmitSyncDate
			)
			SELECT
				DXML.DomainName, DXML.ADUserName, DXML.ADPassword, @CustomerId,
				@ADSyncName, 1, @BaseUserName, GETDATE(),
				GETDATE()
			FROM
			(
				SELECT
					A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
					A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
					A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName,
					A.H.value('ADPassword[1]', 'VARCHAR(100)') AS ADPassword
				FROM @XML.nodes('/ActiveDerectoryModel') A (H)
			)DXML
		END
		ELSE
		BEGIN
			UPDATE AD_HDR
			SET
				[AD_HDR].[Domain] = @Domain,
				[AD_HDR].[UserId] = @ADUserName,
				[AD_HDR].[ADSyncName] = @ADSyncName,
				[AD_HDR].[UpdateDate] = GETDATE(),
				[AD_HDR].[UpdateBy] = @BaseUserName,
				[AD_HDR].[IsActive] = 1
			FROM Tbl_AD_Sync_Header AD_HDR
			INNER JOIN
			(
				SELECT
					B.DomainName, B.ADUserName, B.ADSyncName
				FROM
				(
					SELECT
						A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
						A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
						A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName
					FROM @XML.nodes('/ActiveDerectoryModel') A (H)
				) B
			) DXML
			ON DXML.DomainName = [AD_HDR].[Domain] AND DXML.ADUserName = [AD_HDR].[UserId]
			WHERE [AD_HDR].[UserId] = DXML.ADUserName AND [AD_HDR].[Domain] = DXML.DomainName
			AND [AD_HDR].[CustomerId] = @CustomerId;
		END

		SELECT @AD_HeaderId = AD_HDR.Id FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
		WHERE AD_HDR.Domain = @Domain AND AD_HDR.UserId = @ADUserName
		AND AD_HDR.CustomerId = @CustomerId;

		IF(@Flag = 'SaveRunSync')
		BEGIN
			UPDATE Tbl_AD_Sync_Header 
			SET
				SubmitSyncDate = GETDATE()
			WHERE Id = @AD_HeaderId;
		END

		SELECT @SyncScheduleCnt = COUNT(*) FROM Tbl_AD_Sync_Schedule_Setting SS WITH(NOLOCK)
		WHERE SS.AD_Header_Id = @AD_HeaderId AND ss.CustomerId = @CustomerId;

		IF(@SyncScheduleCnt = 0)
		BEGIN
			INSERT INTO Tbl_AD_Sync_Schedule_Setting
			(
				AD_Header_Id, ScheduleType, SyncStartDate,
				WeeklydaySunday, WeeklydayMonday, WeeklydayTuesday,
				WeeklydayWednesday, WeeklydayThursday, WeeklydayFriday,
				WeeklydaySaturday, CustomerId, IsActive,
				EntryBy, EntryDate
			)
			SELECT
				@AD_HeaderId, DXML.ScheduleType, DXML.SyncStartDate,
				DXML.WeeklydaySunday, DXML.WeeklydayMonday, DXML.WeeklydayTuesday,
				DXML.WeeklydayWednesday, DXML.WeeklydayThursday, DXML.WeeklydayFriday,
				DXML.WeeklydaySaturday, @CustomerId, 1,
				@BaseUserName, GETDATE()
			FROM
			(
				SELECT
					A.H.value('ScheduleType[1]', 'VARCHAR(100)') AS ScheduleType,
					A.H.value('SyncStartDate[1]', 'DATETIME') AS SyncStartDate,
					A.H.value('WeeklydaySunday[1]', 'BIT') AS WeeklydaySunday,
					A.H.value('WeeklydayMonday[1]', 'BIT') AS WeeklydayMonday,
					A.H.value('WeeklydayTuesday[1]', 'BIT') AS WeeklydayTuesday,
					A.H.value('WeeklydayWednesday[1]', 'BIT') AS WeeklydayWednesday,
					A.H.value('WeeklydayThursday[1]', 'BIT') AS WeeklydayThursday,
					A.H.value('WeeklydayFriday[1]', 'BIT') AS WeeklydayFriday,
					A.H.value('WeeklydaySaturday[1]', 'BIT') AS WeeklydaySaturday,
					A.H.value('CustomerId[1]', 'INT') AS CustomerId
				FROM @ADSyncSchedule.nodes('/ADScheduleSetting') A (H)
			)DXML
		END
		BEGIN
			UPDATE SS 
			SET
				ScheduleType = DXML.ScheduleType,
				SyncStartDate = DXML.SyncStartDate,
				WeeklydaySunday = DXML.WeeklydaySunday,
				WeeklydayMonday = DXML.WeeklydayMonday,
				WeeklydayTuesday = DXML.WeeklydayTuesday,
				WeeklydayWednesday = DXML.WeeklydayWednesday,
				WeeklydayThursday = DXML.WeeklydayThursday,
				WeeklydayFriday = DXML.WeeklydayFriday,
				WeeklydaySaturday = DXML.WeeklydaySaturday,
				UpdateBy = @BaseUserName,
				UpdateDate = GETDATE()
			FROM Tbl_AD_Sync_Schedule_Setting SS
			INNER JOIN
			(
				SELECT
					A.H.value('AD_Header_Id[1]', 'INT') AS AD_Header_Id,
					A.H.value('ScheduleType[1]', 'VARCHAR(100)') AS ScheduleType,
					A.H.value('SyncStartDate[1]', 'DATETIME') AS SyncStartDate,
					A.H.value('WeeklydaySunday[1]', 'BIT') AS WeeklydaySunday,
					A.H.value('WeeklydayMonday[1]', 'BIT') AS WeeklydayMonday,
					A.H.value('WeeklydayTuesday[1]', 'BIT') AS WeeklydayTuesday,
					A.H.value('WeeklydayWednesday[1]', 'BIT') AS WeeklydayWednesday,
					A.H.value('WeeklydayThursday[1]', 'BIT') AS WeeklydayThursday,
					A.H.value('WeeklydayFriday[1]', 'BIT') AS WeeklydayFriday,
					A.H.value('WeeklydaySaturday[1]', 'BIT') AS WeeklydaySaturday,
					A.H.value('CustomerId[1]', 'INT') AS CustomerId
				FROM @ADSyncSchedule.nodes('/ADScheduleSetting') A (H)
			) DXML
			ON DXML.AD_Header_Id = SS.AD_Header_Id AND DXML.CustomerId = ss.CustomerId
			WHERE ss.CustomerId = @CustomerId AND SS.AD_Header_Id = @AD_HeaderId;
		END


		/*---------- CURSOR START : OU USER SYNC ----------*/
		DECLARE @AutoId VARCHAR(50), @UserName VARCHAR(200), @Parent_OU VARCHAR(200), @GUId VARCHAR(500), @IsSync BIT;
		DECLARE @ExistCount INT = 0, @mail VARCHAR(100), @telephoneNumber VARCHAR(100), @mobile VARCHAR(100);
		DECLARE @displayName VARCHAR(200), @OUGUID VARCHAR(200), @Is_Cancel BIT;

		DECLARE AD_User_cursor CURSOR FOR
		SELECT
			AutoId = X.ID,
			UserName = X.[text],
			Parent_OU = X.OU_ParentName,
			[GUId] = X.UniqueID,
			IsSync = X.Is_Checked,
			mail = X.mail,
			telephoneNumber = X.telephoneNumber,
			mobile = X.mobile,
			displayName = X.displayName,
			OUGUID = X.OUGUID,
			Is_Cancel = X.Is_Cancel
		FROM
		(
			SELECT
				H.value('id[1]','VARCHAR(50)') AS ID,
				H.value('text[1]','VARCHAR(200)') AS [text],
				H.value('OU_ParentName[1]','VARCHAR(200)') AS OU_ParentName,
				H.value('UniqueID[1]','VARCHAR(500)') AS UniqueID,
				H.value('Is_Checked[1]','BIT') AS Is_Checked,
				H.value('mail[1]','VARCHAR(100)') AS mail,
				H.value('telephoneNumber[1]','VARCHAR(100)') AS telephoneNumber,
				H.value('mobile[1]','VARCHAR(100)') AS mobile,
				H.value('displayName[1]','VARCHAR(200)') AS displayName,
				H.value('OUGUID[1]','VARCHAR(200)') AS OUGUID,
				H.value('Is_Cancel[1]','BIT') AS Is_Cancel
			FROM @XmlOUDirectoryList.nodes('/ArrayOfADOUList/ADOUList') B(H)
		)X
		OPEN AD_User_cursor
		FETCH NEXT FROM AD_User_cursor INTO @AutoId, @UserName, @Parent_OU, @GUId,
		@IsSync, @mail, @telephoneNumber, @mobile, @displayName, @OUGUID, @Is_Cancel
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @ExistCount = COUNT(*) FROM Tbl_Users TU WITH(NOLOCK)
			WHERE TU.AD_GuId = @GUId AND TU.Is_AD_User = 1 AND TU.AD_DomainName = @Domain;

			IF(@ExistCount = 0)
			BEGIN
				INSERT INTO Tbl_Users
				(
					[name], display_name, reg_date, Is_AD_User, AD_GuId, AD_DomainName,
					IsADSync, ParentUser, mobile_phone, email, Iscancel, AD_Header_Id
				)
				VALUES
				(
					@UserName, @displayName, GETDATE(), 1, @GUId, @Domain,
					@IsSync, @Parent_OU, @mobile, @mail, @Is_Cancel, @AD_HeaderId
				);

				INSERT INTO Tbl_AD_Sync_Detail
				(
					AD_Header_Id, UserName, AD_GUID, Is_AD_User,
					Is_Sync, AD_ParentUser, EntryBy, EntryDate,
					ParentOUGUID
				)
				VALUES
				(
					@AD_HeaderId, @UserName, @GUId, 1,
					@IsSync, @Parent_OU, @BaseUserName, GETDATE(),
					@OUGUID
				);
			END
			ELSE
			BEGIN
				UPDATE Tbl_Users
				SET
					[Tbl_Users].[name] = @UserName,
					[Tbl_Users].[display_name] = @displayName,
					[Tbl_Users].[mobile_phone] = @mobile,
					[Tbl_Users].[email] = @mail,
					[Tbl_Users].[IsADSync] = @IsSync,
					[Tbl_Users].[Iscancel] = @Is_Cancel,
					[Tbl_Users].[ParentUser] = @Parent_OU,
					[Tbl_Users].[update_By] = @BaseUserName,
					[Tbl_Users].[update_date] = GETDATE()
				WHERE [Tbl_Users].AD_GuId = @GUId
				AND [Tbl_Users].AD_DomainName = @Domain
				AND [Tbl_Users].AD_Header_Id = @AD_HeaderId
				AND Is_AD_User = 1;

				UPDATE Tbl_AD_Sync_Detail
				SET
					[Tbl_AD_Sync_Detail].[ParentOUGUID] = @OUGUID,
					[Tbl_AD_Sync_Detail].[Is_Sync] = @IsSync,
					[Tbl_AD_Sync_Detail].[AD_ParentUser] = @Parent_OU,
					[Tbl_AD_Sync_Detail].[UpdateBy] = @BaseUserName,
					[Tbl_AD_Sync_Detail].[UpdateDate] = GETDATE()
				WHERE Tbl_AD_Sync_Detail.AD_GUID = @GUId AND Is_AD_User = 1;
				/* AND [Tbl_AD_Sync_Detail].[UserName] = @UserName; */
			END
		
			FETCH NEXT FROM AD_User_cursor INTO @AutoId, @UserName, @Parent_OU, @GUId,
			@IsSync, @mail, @telephoneNumber, @mobile, @displayName, @OUGUID, @Is_Cancel
		END
		
		CLOSE AD_User_cursor
		DEALLOCATE AD_User_cursor
		/*---------- CURSOR END : OU USER SYNC ----------*/




		/*---------- CURSOR START : GROUP WISE USER SYNC ----------*/
		DECLARE @GroupAutoId VARCHAR(50), @GroupUserName VARCHAR(200), @ParentGroupName VARCHAR(200);
		DECLARE @GroupGUId VARCHAR(500), @IsGroupUserSync BIT, @IsGroupUser BIT, @GroupName VARCHAR(200);
		DECLARE @GroupUserGUID VARCHAR(500), @ExistGroupCount INT, @IsUserExistCount INT, @GroupIsActive BIT;
		DECLARE @ADGroupID INT, @ADGroupUserID INT, @IsExistADGroupUserCount INT, @UserdisplayName VARCHAR(200);
		DECLARE @GroupUserMail VARCHAR(100), @GroupUsertelephoneNumber VARCHAR(100), @GroupUserMobile VARCHAR(100);

		DECLARE AD_GroupUsers_cursor CURSOR FOR
		SELECT
			GroupAutoId = X.ID,
			GroupName = X.GroupName,
			[GroupGUId] = X.GroupGUID,
			ParentGroupName = X.ParentGroupName,
			GroupUserName = X.[text],
			GroupUserGUID = X.GroupUserGUID,
			IsGroupUserSync = X.Is_Checked,
			IsGroupUser = X.IsGroupUser,
			GroupUserMail = X.mail,
			GroupUsertelephoneNumber = X.telephoneNumber,
			GroupUserMobile = X.mobile,
			displayName = X.displayName,
			GroupIsActive = X.Is_Active
		FROM
		(
			SELECT
				H.value('Gid[1]','VARCHAR(50)') AS ID,
				H.value('text[1]','VARCHAR(200)') AS [text],
				H.value('G_ParentName[1]','VARCHAR(200)') AS ParentGroupName,
				H.value('UniqueID[1]','VARCHAR(500)') AS GroupGUID,
				H.value('GroupUserGUID[1]','VARCHAR(500)') AS GroupUserGUID,
				H.value('Is_Checked[1]','BIT') AS Is_Checked,
				H.value('Is_Active[1]','BIT') AS Is_Active,
				H.value('IsGroupUser[1]','BIT') AS IsGroupUser,
				H.value('GroupName[1]','VARCHAR(200)') AS GroupName,
				H.value('mail[1]','VARCHAR(100)') AS mail,
				H.value('telephoneNumber[1]','VARCHAR(100)') AS telephoneNumber,
				H.value('mobile[1]','VARCHAR(100)') AS mobile,
				H.value('displayName[1]','VARCHAR(200)') AS displayName
			FROM @XmlADGroupDirectoryList.nodes('/ArrayOfADGroupList/ADGroupList') B(H)
		)X
		OPEN AD_GroupUsers_cursor
		FETCH NEXT FROM AD_GroupUsers_cursor INTO @GroupAutoId, @GroupName, @GroupGUId, @ParentGroupName,
		@GroupUserName, @GroupUserGUID, @IsGroupUserSync, @IsGroupUser,
		@GroupUserMail, @GroupUsertelephoneNumber, @GroupUserMobile, @UserdisplayName, @GroupIsActive
		WHILE @@FETCH_STATUS = 0
		BEGIN
			/*---------- START : CHECK GROUP EXIST AFTER APPLY INSERT/UPDATE ----------*/
			SELECT @ExistGroupCount = COUNT(*) FROM Tbl_Groups TG WITH(NOLOCK)
			WHERE TG.AD_GuId = @GroupGUId AND TG.Is_AD_Group = 1 AND TG.AD_DomainName = @Domain
			AND TG.CustomerId = @CustomerId;

			IF(@ExistGroupCount = 0)
			BEGIN
				INSERT INTO Tbl_Groups
				(
					GroupName, IsActive, EntryBy, EntryDate, CustomerId, Is_AD_Group,
					AD_GuId, AD_DomainName, IsADGroupSync, AD_Header_Id
				)
				VALUES
				(
					@GroupName, @GroupIsActive, @BaseUserName, GETDATE(), @CustomerId, 1,
					@GroupGUId, @Domain, @IsGroupUserSync, @AD_HeaderId
				);
			END
			ELSE
			BEGIN
				UPDATE Tbl_Groups
				SET
					[Tbl_Groups].[GroupName] = @GroupName,
					[Tbl_Groups].[IsADGroupSync] = @IsGroupUserSync,
					[Tbl_Groups].[IsActive] = @GroupIsActive,
					[Tbl_Groups].[UpdateBy] = @BaseUserName,
					[Tbl_Groups].[UpdateDate] = GETDATE()
				WHERE [Tbl_Groups].[AD_DomainName] = @Domain
				AND [Tbl_Groups].AD_Header_Id = @AD_HeaderId
				AND [Tbl_Groups].[AD_GuId] = @GroupGUId
				AND [Tbl_Groups].[Is_AD_Group] = 1
				AND [Tbl_Groups].[CustomerId] = @CustomerId;
			END
			/*---------- END : CHECK GROUP EXIST AFTER APPLY INSERT/UPDATE ----------*/


			/*---------- START : CHECK GROUP USERS EXIST AFTER APPLY INSERT/UPDATE ----------*/
			SELECT @ADGroupID = TG.Id FROM Tbl_Groups TG WITH(NOLOCK)
			WHERE TG.AD_DomainName = @Domain AND TG.AD_GuId = @GroupGUId AND TG.Is_AD_Group = 1
			AND TG.CustomerId = @CustomerId;

			SELECT @ADGroupUserID = TU.Id FROM Tbl_Users TU WITH(NOLOCK)
			WHERE TU.AD_GuId = @GroupUserGUID AND TU.AD_DomainName = @Domain AND TU.Is_AD_User = 1;

			SELECT @IsExistADGroupUserCount = COUNT(*) FROM Tbl_Users_Group TUG WITH(NOLOCK)
			WHERE TUG.Group_HDR_Id = @ADGroupID AND TUG.UserId = @ADGroupUserID AND TUG.AD_DomainName = @Domain;

			IF(@IsExistADGroupUserCount = 0)
			BEGIN
				INSERT INTO Tbl_Users_Group
				(
					Group_HDR_Id, UserId, [Type], IsActive, EntryBy, EntryDate,
					Is_AD_User, AD_DomainName, IsADSync
				)
				VALUES
				(
					@ADGroupID, @ADGroupUserID, 'User', @GroupIsActive, @BaseUserName, GETDATE(),
					1, @Domain, @IsGroupUserSync
				);
			END
			ELSE
			BEGIN
				UPDATE Tbl_Users_Group
				SET
					[Tbl_Users_Group].[IsADSync] = @IsGroupUserSync,
	
				[Tbl_Users_Group].[IsActive] = @GroupIsActive,
					[Tbl_Users_Group].[UpdateBy] = @BaseUserName,
					[Tbl_Users_Group].[UpdateDate] = GETDATE()
				WHERE Tbl_Users_Group.Group_HDR_Id = @ADGroupID
				AND Tbl_Users_Group.UserId = @ADGroupUserID
				AND Tbl_Users_Group.AD_DomainName = @Domain;
			END
			/*---------- END : CHECK GROUP USERS EXIST AFTER APPLY INSERT/UPDATE ----------*/

			FETCH NEXT FROM AD_GroupUsers_cursor INTO @GroupAutoId, @GroupName, @GroupGUId, @ParentGroupName,
			@GroupUserName, @GroupUserGUID, @IsGroupUserSync, @IsGroupUser,
			@GroupUserMail, @GroupUsertelephoneNumber, @GroupUserMobile, @UserdisplayName, @GroupIsActive
		END
		
		CLOSE AD_GroupUsers_cursor
		DEALLOCATE AD_GroupUsers_cursor
		/*---------- CURSOR END : GROUP WISE USER SYNC ----------*/

		SELECT @Message = 'Done', @Status = 1, @ProfileName = @Domain;
		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		CLOSE AD_User_cursor
		DEALLOCATE AD_User_cursor

		CLOSE AD_GroupUsers_cursor
		DEALLOCATE AD_GroupUsers_cursor

		SELECT @Status = 0, @Message = 'LINE No. '+ CAST(ERROR_LINE() AS VARCHAR(50)) + ' ' + ERROR_MESSAGE(), @ProfileName = '';
		ROLLBACK TRANSACTION
	END CATCH
	SELECT [Message] = @Message, [Status] = @Status, [ProfileName] = @ProfileName;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Submit_SaveADSyncDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION :  Add/Edit Save Sync Users & Group Data 
==========================================================
EXEC USP_Submit_SaveADSyncDetail '','','','','',''
==========================================================
*/
CREATE PROCEDURE [dbo].[USP_Submit_SaveADSyncDetail]
(
	@ADHeaderXML XML,
	@SelectedOUXML XML,
	@SelectedGroupXML XML,
	@SchedulerXML XML,
	@BaseUserName VARCHAR(50),
	@CustomerId INT
)
AS
BEGIN
	DECLARE @Status INT, @Message VARCHAR(500);
	SELECT @Message = 'Not Done', @Status = 0;

	/*---------- START : GET GLOBAL VALUE ----------*/
	DECLARE @Domain VARCHAR(100), @ADUserName VARCHAR(100), @ADSyncName VARCHAR(100);
	DECLARE @ADExist INT = 0, @AD_HeaderId INT = 0, @SyncScheduleCnt INT = 0;
	SELECT
		@Domain = DXML.DomainName,
		@ADUserName = DXML.ADUserName,
		@ADSyncName = DXML.ADSyncName
	FROM
	(
		SELECT
			A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
			A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
			A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName
		FROM @ADHeaderXML.nodes('/ActiveDerectoryModel') A (H)
	)DXML
	/*---------- END : GET GLOBAL VALUE ----------*/

	BEGIN TRANSACTION
	BEGIN TRY

		/*---------- START : Add/Edit AD HEADER DETAIL ----------*/
		SELECT @ADExist = COUNT(*) FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
		WHERE AD_HDR.Domain = @Domain AND AD_HDR.UserId = @ADUserName;

		IF(@ADExist = 0)
		BEGIN
			INSERT INTO Tbl_AD_Sync_Header
			(
				Domain, UserId, [Password], CustomerId,
				ADSyncName, IsActive, EntryBy, EntryDate
			)
			SELECT
				DXML.DomainName, DXML.ADUserName, DXML.ADPassword, @CustomerId,
				@ADSyncName, 1, @BaseUserName, GETDATE()
			FROM
			(
				SELECT
					A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
					A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
					A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName,
					A.H.value('ADPassword[1]', 'VARCHAR(100)') AS ADPassword
				FROM @ADHeaderXML.nodes('/ActiveDerectoryModel') A (H)
			)DXML
		END
		ELSE
		BEGIN
			UPDATE AD_HDR
			SET
				[AD_HDR].[Domain] = @Domain,
				[AD_HDR].[UserId] = @ADUserName,
				[AD_HDR].[ADSyncName] = @ADSyncName
			FROM Tbl_AD_Sync_Header AD_HDR
			INNER JOIN
			(
				SELECT
					B.DomainName, B.ADUserName, B.ADSyncName
				FROM
				(
					SELECT
						A.H.value('DomainName[1]', 'VARCHAR(100)') AS DomainName,
						A.H.value('ADUserName[1]', 'VARCHAR(100)') AS ADUserName,
						A.H.value('ADSyncName[1]', 'VARCHAR(100)') AS ADSyncName
					FROM @ADHeaderXML.nodes('/ActiveDerectoryModel') A (H)
				) B
			) DXML
			ON DXML.DomainName = [AD_HDR].[Domain] AND DXML.ADUserName = [AD_HDR].[UserId]
			WHERE [AD_HDR].[UserId] = DXML.ADUserName AND [AD_HDR].[Domain] = DXML.DomainName
			AND [AD_HDR].[CustomerId] = @CustomerId;
		END
		/*---------- END : Add/Edit AD HEADER DETAIL ----------*/



		/*---------- START : Add/Edit AD SYNC SCHEDULER ----------*/
		SELECT @AD_HeaderId = AD_HDR.Id FROM Tbl_AD_Sync_Header AD_HDR WITH(NOLOCK)
		WHERE AD_HDR.Domain = @Domain AND AD_HDR.UserId = @ADUserName
		AND AD_HDR.CustomerId = @CustomerId;

		SELECT @SyncScheduleCnt = COUNT(*) FROM Tbl_AD_Sync_Schedule_Setting SS WITH(NOLOCK)
		WHERE SS.AD_Header_Id = @AD_HeaderId AND ss.CustomerId = @CustomerId;

		IF(@SyncScheduleCnt = 0)
		BEGIN
			INSERT INTO Tbl_AD_Sync_Schedule_Setting
			(
				AD_Header_Id, ScheduleType, SyncStartDate,
				WeeklydaySunday, WeeklydayMonday, WeeklydayTuesday,
				WeeklydayWednesday, WeeklydayThursday, WeeklydayFriday,
				WeeklydaySaturday, CustomerId, IsActive,
				EntryBy, EntryDate
			)
			SELECT
				@AD_HeaderId, DXML.ScheduleType, DXML.SyncStartDate,
				DXML.WeeklydaySunday, DXML.WeeklydayMonday, DXML.WeeklydayTuesday,
				DXML.WeeklydayWednesday, DXML.WeeklydayThursday, DXML.WeeklydayFriday,
				DXML.WeeklydaySaturday, @CustomerId, 1,
				@BaseUserName, GETDATE()
			FROM
			(
				SELECT
					A.H.value('ScheduleType[1]', 'VARCHAR(100)') AS ScheduleType,
					A.H.value('SyncStartDate[1]', 'DATETIME') AS SyncStartDate,
					A.H.value('WeeklydaySunday[1]', 'BIT') AS WeeklydaySunday,
					A.H.value('WeeklydayMonday[1]', 'BIT') AS WeeklydayMonday,
					A.H.value('WeeklydayTuesday[1]', 'BIT') AS WeeklydayTuesday,
					A.H.value('WeeklydayWednesday[1]', 'BIT') AS WeeklydayWednesday,
					A.H.value('WeeklydayThursday[1]', 'BIT') AS WeeklydayThursday,
					A.H.value('WeeklydayFriday[1]', 'BIT') AS WeeklydayFriday,
					A.H.value('WeeklydaySaturday[1]', 'BIT') AS WeeklydaySaturday,
					A.H.value('CustomerId[1]', 'INT') AS CustomerId
				FROM @SchedulerXML.nodes('/ADScheduleSetting') A (H)
			)DXML
		END
		BEGIN
			UPDATE SS 
			SET
				ScheduleType = DXML.ScheduleType,
				SyncStartDate = DXML.SyncStartDate,
				WeeklydaySunday = DXML.WeeklydaySunday,
				WeeklydayMonday = DXML.WeeklydayMonday,
				WeeklydayTuesday = DXML.WeeklydayTuesday,
				WeeklydayWednesday = DXML.WeeklydayWednesday,
				WeeklydayThursday = DXML.WeeklydayThursday,
				WeeklydayFriday = DXML.WeeklydayFriday,
				WeeklydaySaturday = DXML.WeeklydaySaturday,
				UpdateBy = @BaseUserName,
				UpdateDate = GETDATE()
			FROM Tbl_AD_Sync_Schedule_Setting SS
			INNER JOIN
			(
				SELECT
					A.H.value('AD_Header_Id[1]', 'INT') AS AD_Header_Id,
					A.H.value('ScheduleType[1]', 'VARCHAR(100)') AS ScheduleType,
					A.H.value('SyncStartDate[1]', 'DATETIME') AS SyncStartDate,
					A.H.value('WeeklydaySunday[1]', 'BIT') AS WeeklydaySunday,
					A.H.value('WeeklydayMonday[1]', 'BIT') AS WeeklydayMonday,
					A.H.value('WeeklydayTuesday[1]', 'BIT') AS WeeklydayTuesday,
					A.H.value('WeeklydayWednesday[1]', 'BIT') AS WeeklydayWednesday,
					A.H.value('WeeklydayThursday[1]', 'BIT') AS WeeklydayThursday,
					A.H.value('WeeklydayFriday[1]', 'BIT') AS WeeklydayFriday,
					A.H.value('WeeklydaySaturday[1]', 'BIT') AS WeeklydaySaturday,
					A.H.value('CustomerId[1]', 'INT') AS CustomerId
				FROM @SchedulerXML.nodes('/ADScheduleSetting') A (H)
			) DXML
			ON DXML.AD_Header_Id = SS.AD_Header_Id AND DXML.CustomerId = ss.CustomerId
			WHERE ss.CustomerId = @CustomerId AND SS.AD_Header_Id = @AD_HeaderId;
		END
		/*---------- END : Add/Edit AD SYNC SCHEDULER ----------*/



		/*---------- CURSOR START : OU USER SYNC ----------*/
		DECLARE @AutoId VARCHAR(50), @UserName VARCHAR(200), @Parent_OU VARCHAR(200), @GUId VARCHAR(500), @IsSync BIT;
		DECLARE @ExistCount INT = 0, @mail VARCHAR(100), @telephoneNumber VARCHAR(100), @mobile VARCHAR(100);
		DECLARE @displayName VARCHAR(200),@OUGUID VARCHAR(200),@Is_Cancel BIT;

		DECLARE AD_User_cursor CURSOR FOR
		SELECT
			AutoId = X.ID,
			UserName = X.[text],
			Parent_OU = X.OU_ParentName,
			[GUId] = X.UniqueID,
			IsSync = X.Is_Checked,
			mail = X.mail,
			telephoneNumber = X.telephoneNumber,
			mobile = X.mobile,
			displayName = X.displayName,
			OUGUID = X.OUGUID,
			Is_Cancel = X.Is_Cancel
		FROM
		(
			SELECT
				H.value('id[1]','VARCHAR(50)') AS ID,
				H.value('text[1]','VARCHAR(200)') AS [text],
				H.value('OU_ParentName[1]','VARCHAR(200)') AS OU_ParentName,
				H.value('UniqueID[1]','VARCHAR(500)') AS UniqueID,
				H.value('Is_Checked[1]','BIT') AS Is_Checked,
				H.value('mail[1]','VARCHAR(100)') AS mail,
				H.value('telephoneNumber[1]','VARCHAR(100)') AS telephoneNumber,
				H.value('mobile[1]','VARCHAR(100)') AS mobile,
				H.value('displayName[1]','VARCHAR(200)') AS displayName,
				H.value('OUGUID[1]','VARCHAR(200)') AS OUGUID,
				H.value('Is_Cancel[1]','BIT') AS Is_Cancel
			FROM @SelectedOUXML.nodes('/ArrayOfADOUList/ADOUList') B(H)
		)X
		OPEN AD_User_cursor
		FETCH NEXT FROM AD_User_cursor INTO @AutoId, @UserName, @Parent_OU, @GUId,
		@IsSync, @mail, @telephoneNumber, @mobile, @displayName, @OUGUID, @Is_Cancel
		WHILE @@FETCH_STATUS = 0
		BEGIN
		
			SELECT @ExistCount = COUNT(*) FROM Tbl_Users TU WITH(NOLOCK)
			WHERE TU.AD_GuId = @GUId AND TU.Is_AD_User = 1 AND TU.AD_DomainName = @Domain;

			IF(@ExistCount = 0)
			BEGIN
				INSERT INTO Tbl_Users
				(
					[name], display_name, reg_date, Is_AD_User, AD_GuId, AD_DomainName,
					IsADSync, ParentUser, mobile_phone, email, Iscancel, AD_Header_Id
				)
				VALUES
				(
					@UserName, @displayName, GETDATE(), 1, @GUId, @Domain,
					@IsSync, @Parent_OU, @mobile, @mail, @Is_Cancel, @AD_HeaderId
				);

				INSERT INTO Tbl_AD_Sync_Detail
				(
					AD_Header_Id, UserName, AD_GUID, Is_AD_User,
					Is_Sync, AD_ParentUser, EntryBy, EntryDate,
					ParentOUGUID
				)
				VALUES
				(
					@AD_HeaderId, @UserName, @GUId, 1,
					@IsSync, @Parent_OU, @BaseUserName, GETDATE(),
					@OUGUID
				);
			END
			ELSE
			BEGIN
				UPDATE Tbl_Users
				SET
					[Tbl_Users].[name] = @UserName,
					[Tbl_Users].[display_name] = @displayName,
					[Tbl_Users].[mobile_phone] = @mobile,
					[Tbl_Users].[email] = @mail,
					[Tbl_Users].[IsADSync] = @IsSync,
					[Tbl_Users].[Iscancel] = @Is_Cancel,
					[Tbl_Users].[ParentUser] = @Parent_OU,
					[Tbl_Users].[update_By] = @BaseUserName,
					[Tbl_Users].[update_date] = GETDATE()
				WHERE [Tbl_Users].AD_GuId = @GUId
				AND [Tbl_Users].AD_DomainName = @Domain
				AND [Tbl_Users].AD_Header_Id = @AD_HeaderId
				AND Is_AD_User = 1;

				UPDATE Tbl_AD_Sync_Detail
				SET
					[Tbl_AD_Sync_Detail].[ParentOUGUID] = @OUGUID,
					[Tbl_AD_Sync_Detail].[Is_Sync] = @IsSync,
					[Tbl_AD_Sync_Detail].[AD_ParentUser] = @Parent_OU,
					[Tbl_AD_Sync_Detail].[UpdateBy] = @BaseUserName,
					[Tbl_AD_Sync_Detail].[UpdateDate] = GETDATE()
				WHERE Tbl_AD_Sync_Detail.AD_GUID = @GUId AND Is_AD_User = 1;
				/* AND [Tbl_AD_Sync_Detail].[UserName] = @UserName; */
			END
		
		FETCH NEXT FROM AD_User_cursor INTO @AutoId, @UserName, @Parent_OU, @GUId,
		@IsSync, @mail, @telephoneNumber, @mobile, @displayName, @OUGUID, @Is_Cancel
		END
		
		CLOSE AD_User_cursor
		DEALLOCATE AD_User_cursor
		/*---------- CURSOR END : OU USER SYNC ----------*/

		

		/*---------- CURSOR START : GROUP WISE USER SYNC ----------*/
		DECLARE @GroupAutoId VARCHAR(50), @GroupUserName VARCHAR(200), @ParentGroupName VARCHAR(200);
		DECLARE @GroupGUId VARCHAR(500), @IsGroupUserSync BIT, @IsGroupUser BIT, @GroupName VARCHAR(200);
		DECLARE @GroupUserGUID VARCHAR(500),@ExistGroupCount INT,@IsUserExistCount INT, @GroupIsActive BIT;
		DECLARE @ADGroupID INT, @ADGroupUserID INT, @IsExistADGroupUserCount INT, @UserdisplayName VARCHAR(200);
		DECLARE @GroupUserMail VARCHAR(100), @GroupUsertelephoneNumber VARCHAR(100);
		DECLARE @GroupUserMobile VARCHAR(100);

		DECLARE AD_GroupUsers_cursor CURSOR FOR
		SELECT
			GroupAutoId = X.ID,
			GroupName = X.GroupName,
			[GroupGUId] = X.GroupGUID,
			ParentGroupName = X.ParentGroupName,
			GroupUserName = X.[text],
			GroupUserGUID = X.GroupUserGUID,
			IsGroupUserSync = X.Is_Checked,
			IsGroupUser = X.IsGroupUser,
			GroupUserMail = X.mail,
			GroupUsertelephoneNumber = X.telephoneNumber,
			GroupUserMobile = X.mobile,
			displayName = X.displayName,
			GroupIsActive = X.Is_Active
		FROM
		(
			SELECT
				H.value('Gid[1]','VARCHAR(50)') AS ID,
				H.value('text[1]','VARCHAR(200)') AS [text],
				H.value('G_ParentName[1]','VARCHAR(200)') AS ParentGroupName,
				H.value('UniqueID[1]','VARCHAR(500)') AS GroupGUID,
				H.value('GroupUserGUID[1]','VARCHAR(500)') AS GroupUserGUID,
				H.value('Is_Checked[1]','BIT') AS Is_Checked,
				H.value('Is_Active[1]','BIT') AS Is_Active,
				H.value('IsGroupUser[1]','BIT') AS IsGroupUser,
				H.value('GroupName[1]','VARCHAR(200)') AS GroupName,
				H.value('mail[1]','VARCHAR(100)') AS mail,
				H.value('telephoneNumber[1]','VARCHAR(100)') AS telephoneNumber,
				H.value('mobile[1]','VARCHAR(100)') AS mobile,
				H.value('displayName[1]','VARCHAR(200)') AS displayName
			FROM @SelectedGroupXML.nodes('/ArrayOfADGroupList/ADGroupList') B(H)
		)X
		OPEN AD_GroupUsers_cursor
		FETCH NEXT FROM AD_GroupUsers_cursor INTO @GroupAutoId, @GroupName, @GroupGUId, @ParentGroupName,
		@GroupUserName, @GroupUserGUID, @IsGroupUserSync, @IsGroupUser,
		@GroupUserMail,@GroupUsertelephoneNumber,@GroupUserMobile, @UserdisplayName, @GroupIsActive
		WHILE @@FETCH_STATUS = 0
		BEGIN

			/*---------- START : CHECK GROUP EXIST AFTER APPLY INSERT/UPDATE ----------*/
			SELECT @ExistGroupCount = COUNT(*) FROM Tbl_Groups TG WITH(NOLOCK)
			WHERE TG.AD_GuId = @GroupGUId AND TG.Is_AD_Group = 1 AND TG.AD_DomainName = @Domain
			AND TG.CustomerId = @CustomerId;

			IF(@ExistGroupCount = 0)
			BEGIN
				INSERT INTO Tbl_Groups
				(
					GroupName, IsActive, EntryBy, EntryDate, CustomerId, Is_AD_Group,
					AD_GuId, AD_DomainName, IsADGroupSync, AD_Header_Id
				)
				VALUES
				(
					@GroupName, @GroupIsActive, @BaseUserName, GETDATE(), @CustomerId, 1,
					@GroupGUId, @Domain, @IsGroupUserSync, @AD_HeaderId
				);
			END
			ELSE
			BEGIN
				UPDATE Tbl_Groups
				SET
					[Tbl_Groups].[GroupName] = @GroupName,
					[Tbl_Groups].[IsADGroupSync] = @IsGroupUserSync,
					[Tbl_Groups].[IsActive] = @GroupIsActive,
					[Tbl_Groups].[UpdateBy] = @BaseUserName,
					[Tbl_Groups].[UpdateDate] = GETDATE()
				WHERE [Tbl_Groups].[AD_DomainName] = @Domain
				AND [Tbl_Groups].AD_Header_Id = @AD_HeaderId
				AND [Tbl_Groups].[AD_GuId] = @GroupGUId
				AND [Tbl_Groups].[Is_AD_Group] = 1
				AND [Tbl_Groups].[CustomerId] = @CustomerId;
			END
			/*---------- END : CHECK GROUP EXIST AFTER APPLY INSERT/UPDATE ----------*/


			/*---------- START : CHECK GROUP USERS EXIST AFTER APPLY INSERT/UPDATE ----------*/
			SELECT @ADGroupID = TG.Id FROM Tbl_Groups TG WITH(NOLOCK)
			WHERE TG.AD_DomainName = @Domain AND TG.AD_GuId = @GroupGUId AND TG.Is_AD_Group = 1
			AND TG.CustomerId = @CustomerId;

			SELECT @ADGroupUserID = TU.Id FROM Tbl_Users TU WITH(NOLOCK)
			WHERE TU.AD_GuId = @GroupUserGUID AND TU.AD_DomainName = @Domain AND TU.Is_AD_User = 1;

			SELECT @IsExistADGroupUserCount = COUNT(*) FROM Tbl_Users_Group TUG WITH(NOLOCK)
			WHERE TUG.Group_HDR_Id = @ADGroupID AND TUG.UserId = @ADGroupUserID AND TUG.AD_DomainName = @Domain;

			IF(@IsExistADGroupUserCount = 0)
			BEGIN
				INSERT INTO Tbl_Users_Group
				(
					Group_HDR_Id, UserId, [Type], IsActive, EntryBy, EntryDate,
					Is_AD_User, AD_DomainName, IsADSync
				)
				VALUES
				(
					@ADGroupID, @ADGroupUserID, 'User', @GroupIsActive, @BaseUserName, GETDATE(),
					1, @Domain, @IsGroupUserSync
				);
			END
			ELSE
			BEGIN
				UPDATE Tbl_Users_Group
				SET
					[Tbl_Users_Group].[IsADSync] = @IsGroupUserSync,
					[Tbl_Users_Group].[IsActive] = @GroupIsActive,
					[Tbl_Users_Group].[UpdateBy] = @BaseUserName,
					[Tbl_Users_Group].[UpdateDate] = GETDATE()
				WHERE Tbl_Users_Group.Group_HDR_Id = @ADGroupID
				AND Tbl_Users_Group.UserId = @ADGroupUserID
				AND Tbl_Users_Group.AD_DomainName = @Domain;
			END
	
		/*---------- END : CHECK GROUP USERS EXIST AFTER APPLY INSERT/UPDATE ----------*/

		FETCH NEXT FROM AD_GroupUsers_cursor INTO @GroupAutoId, @GroupName, @GroupGUId, @ParentGroupName,
		@GroupUserName, @GroupUserGUID, @IsGroupUserSync, @IsGroupUser,
		@GroupUserMail, @GroupUsertelephoneNumber, @GroupUserMobile, @UserdisplayName, @GroupIsActive
		END
		
		CLOSE AD_GroupUsers_cursor
		DEALLOCATE AD_GroupUsers_cursor
		/*---------- CURSOR END : GROUP WISE USER SYNC ----------*/

		SELECT @Message = 'Done', @Status = 1;
		COMMIT TRANSACTION;	
	END TRY
	BEGIN CATCH
		SELECT @Status = 0, @Message = 'LINE No. '+ CAST(ERROR_LINE() AS VARCHAR(50)) + ' ' + ERROR_MESSAGE();
		ROLLBACK TRANSACTION
	END CATCH
	SELECT [Message] = @Message, [Status] = @Status;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SubmitSupportContactDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        
=====================================================
DESCRIPTION : Add Contact Support Detail
=====================================================
EXEC USP_SubmitSupportContactDetail '','',''
=====================================================
*/
CREATE PROCEDURE [dbo].[USP_SubmitSupportContactDetail]
(
	@XML1 XML,
	@BaseUserName VARCHAR(50),
	@CustomerId INT
)
AS
BEGIN TRANSACTION
 
	DECLARE @Status INT, @Message VARCHAR(500), @ID INT = 0;
	SELECT  @Message = 'Not Done', @Status = 0     
        
	DECLARE @hdoc1 INT, @hdocName VARCHAR(1000)='ContactSupport';
	EXEC sp_xml_preparedocument @hdoc1 OUTPUT, @XML1;

	/*---------- START : GET GLOBAL VALUE ----------*/
	SELECT
		@ID = DXML.Id
	FROM
	(        
		SELECT
			A.H.value('ID[1]', 'INT') AS ID
		FROM @XML1.nodes('/ContactSupport') A (H)
	)DXML
	/*---------- END : GET GLOBAL VALUE ----------*/

	BEGIN
		IF(@ID < 0)
		BEGIN
			INSERT INTO Tbl_ContactSupport
			(
				FirstName, LastName, CompanyEmail,
				CompanyName, SupportType,
				Remark, IsActive,
				CustomerId, EntryBy, EntryDate
			)
			SELECT
				FirstName, LastName, CompanyEmail,
				CompanyName, SupportType,
				Remark, IsActive,
				@CustomerId, @BaseUserName, GETDATE()
			FROM OPENXML(@hdoc1, @hdocName, 2)
			WITH
			(
				FirstName VARCHAR(50) 'FirstName',
				LastName VARCHAR(50) 'LastName',
				CompanyEmail VARCHAR(100) 'CompanyEmail',
				CompanyName VARCHAR(100) 'CompanyName',
				SupportType VARCHAR(50) 'SupportType',
				Remark VARCHAR(MAX) 'Remark',
				IsActive BIT 'IsActive',
				CustomerId INT 'CustomerId',
				EntryBy VARCHAR(50) 'EntryBy',
				EntryDate DATETIME 'EntryDate'
			)
			IF (@@ERROR <> 0 ) GOTO QuitWithRollback;
			SELECT @Status = 1, @Message = 'Done';
		END
	END
	SELECT MESSAGE = @Message, STATUS = @Status;
	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN      
		SELECT  MESSAGE = @Message,STATUS = @Status;
	END        
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[USP_Update_Received_Status]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC USP_Update_Received_Status '15CA4901-9949-492F-AA64-BE822DC3DFE8',2,'A'
*/
CREATE PROC [dbo].[USP_Update_Received_Status]
@Deskbar_id VARCHAR(100) = '15CA4901-9949-492F-AA64-BE822DC3DFE8'
,@Id INT = 2 /*AlertId/TickerId*/
,@Type VARCHAR(100) = 'A'
AS
BEGIN
	DECLARE @EntryBy VARCHAR(100) = '',@AcknoledgrButton BIT
	--IF @Type = 'A' 
	--BEGIN  
		SELECT @EntryBy = tau.EntryBy,@AcknoledgrButton = ISNULL(tau.AcknoledgrButton,0) FROM tbl_Alert_popUp tau WHERE tau.AlertId = @Id
		IF NOT EXISTS(SELECT * FROM tbl_Send_Alert_User tsau INNER JOIN Tbl_Users tu ON tu.id = tsau.UserId WHERE tu.deskbar_id = @Deskbar_id AND tsau.AlertId = @Id)
		BEGIN
			PRINT 'NOT EXISTS : So Entry with IsReceived=true and ReceivedDate=GETDATE()'
			INSERT INTO tbl_Send_Alert_User (Alertid, UserId, UserName, UserType, IsAcknowledge, AcknowledgeDate, SentDate, IsReceived, ReceivedDate, IsCleared, ClearDate, Status, EntryBy, EntryDate)
			SELECT @Id,tu.id,tu.name,'User',0, DATEADD(MINUTE, tu.Offset, GETUTCDATE()), DATEADD(MINUTE, tu.Offset, GETUTCDATE()),1,DATEADD(MINUTE, tu.Offset, GETUTCDATE()),0,NULL,'Send',@EntryBy,DATEADD(MINUTE, tu.Offset, GETUTCDATE()) FROM Tbl_Users tu WHERE tu.deskbar_id = @Deskbar_id			
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT * FROM tbl_Send_Alert_User tsau INNER JOIN Tbl_Users tu ON tu.id = tsau.UserId WHERE tu.deskbar_id = @Deskbar_id AND tsau.AlertId = @Id AND ISNULL(tsau.IsReceived,0) = 0)
			BEGIN
				PRINT 'EXISTS : So Update IsReceived=true and ReceivedDate=GETDATE()'
				INSERT INTO tbl_Send_Alert_User_History (SAUseId,Alertid,UserId,GroupId,GroupName,UserName,UserType,IsAcknowledge,AcknowledgeDate,SentDate,IsReceived,ReceivedDate,IsCleared,ClearDate,Status,EntryBy,EntryDate,UpdateBy,UpdateDate)
				
				SELECT SAUseId,Alertid,UserId,GroupId,GroupName,UserName,UserType,IsAcknowledge,AcknowledgeDate,SentDate,IsReceived,ReceivedDate,IsCleared,ClearDate,Status,EntryBy,EntryDate,UpdateBy,UpdateDate 
				FROM tbl_Send_Alert_User tsau INNER JOIN Tbl_Users tu ON tu.id = tsau.UserId WHERE tu.deskbar_id = @Deskbar_id AND tsau.AlertId = @Id AND ISNULL(tsau.IsReceived,0) = 0
				
				UPDATE tsau SET IsReceived = 1, ReceivedDate = DATEADD(MINUTE, tu.Offset, GETUTCDATE()), STATUS = 'Send',UpdateBy = @EntryBy ,UpdateDate = GETDATE() 
				,IsAcknowledge = 0/*CASE @AcknoledgrButton WHEN 1 THEN 0 ELSE 1 END*/,AcknowledgeDate = NULL /*CASE @AcknoledgrButton WHEN 1 THEN NULL ELSE GETDATE() END*/
				FROM tbl_Send_Alert_User tsau INNER JOIN Tbl_Users tu
				ON tu.id = tsau.UserId WHERE tu.deskbar_id = @Deskbar_id AND tsau.AlertId = @Id AND ISNULL(tsau.IsReceived,0) = 0 
			END
		END
	--END
	--IF @Type = 'T' 
	--BEGIN
	--	SELECT @EntryBy = ttu.EntryBy FROM Tbl_Ticker_popUp ttu WHERE ttu.TickerID = @Id
	--	IF NOT EXISTS(SELECT * FROM tbl_Send_Ticker_User tstu INNER JOIN Tbl_Users tu ON tu.id = tstu.UserId WHERE tu.deskbar_id = @Deskbar_id AND tstu.AlertId = @Id)
	--	BEGIN
	--		PRINT 'NOT EXISTS : So Entry with IsReceived=true and ReceivedDate=GETDATE()'
	--		INSERT INTO tbl_Send_Ticker_User (Alertid, UserId, UserName, UserType, IsAcknowledge, AcknowledgeDate, SentDate, IsReceived, ReceivedDate, IsCleared, ClearDate, Status, EntryBy, EntryDate)
	--		SELECT @Id,tu.id,tu.name,'User',1,GETDATE(),GETDATE(),1,GETDATE(),0,NULL,'Send',@EntryBy,GETDATE() FROM Tbl_Users tu WHERE tu.deskbar_id = @Deskbar_id
	--	END
	--	ELSE
	--	BEGIN
	--		IF EXISTS(SELECT * FROM tbl_Send_Ticker_User tstu INNER JOIN Tbl_Users tu ON tu.id = tstu.UserId WHERE tu.deskbar_id = @Deskbar_id AND tstu.AlertId = @Id AND ISNULL(tstu.IsReceived,0) = 0)
	--		BEGIN
	--			PRINT 'EXISTS : So Update IsReceived=true and ReceivedDate=GETDATE()'
	--			INSERT INTO tbl_Send_Ticker_User_History (SAUseId,Alertid,UserId,GroupId,GroupName,UserName,UserType,IsAcknowledge,AcknowledgeDate,SentDate,IsReceived,ReceivedDate,IsCleared,ClearDate,Status,EntryBy,EntryDate,UpdateBy,UpdateDate)
	--			SELECT 
	--				SAUseId,Alertid,UserId,GroupId,GroupName,UserName,UserType,IsAcknowledge,AcknowledgeDate,SentDate,IsReceived,ReceivedDate,IsCleared,ClearDate,Status,EntryBy,EntryDate,UpdateBy,UpdateDate 
	--			FROM tbl_Send_Ticker_User tstu INNER JOIN Tbl_Users tu ON tu.id = tstu.UserId WHERE tu.deskbar_id = @Deskbar_id AND tstu.AlertId = @Id AND ISNULL(tstu.IsReceived,0) = 0
	--			UPDATE tstu SET IsReceived = 1, ReceivedDate = GETDATE(), STATUS = 'Send',UpdateBy = @EntryBy ,UpdateDate = GETDATE() FROM tbl_Send_Ticker_User tstu INNER JOIN Tbl_Users tu 
	--			ON tu.id = tstu.UserId WHERE tu.deskbar_id = @Deskbar_id AND tstu.AlertId =@Id AND ISNULL(tstu.IsReceived,0) = 0
	--		END
	--	END
	--END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Update_Template]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Update_Template]
(
	@ID int,
	@TemplateName VARCHAR(MAX),
	@TemplateBody VARCHAR(MAX),
	@TemplateTitle VARCHAR(MAX),
	@BaseUserName VARCHAR(100)
)
as
BEGIN
	DECLARE @status VARCHAR(100)

	update Tbl_Template SET TemplateName=@TemplateName,TemplateBody=@TemplateBody,UpdateBy=@BaseUserName,UpdateDate=GETDATE(),
	TemplateTitle=@TemplateTitle
	WHERE ID=@ID

	 SET @status='DONE'

	 SELECT @status
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_UserPermissionDetails_Submit]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*      
begin tran      
--rollback      
EXEC Usp_UserPermissionDetails_Submit '<?xml version="1.0"?><PermisionModel xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><Id>3</Id><PermissionlevelName>ERPSolutionSub</PermissionlevelName><PermittedToT
arget1>0</PermittedToTarget1><CustomizeTarget1>2</CustomizeTarget1><Administator1>0</Administator1><ContentManager1>2</ContentManager1><Custom1>0</Custom1><PersonalContent1>1</PersonalContent1><FullPermission1>0</FullPermission1><Administator>false</Admin
istator><ContentManager>true</ContentManager><Custom>false</Custom><Accesslevel>0</Accesslevel><Newchacked>false</Newchacked><Iscancel>false</Iscancel><PermissionType>2</PermissionType><PermittedToTarget>false</PermittedToTarget><CustomizeTarget>true</Cus
tomizeTarget><PersonalContent>true</PersonalContent><FullPermission>false</FullPermission></PermisionModel>','<root></root>','<root><UserDetail><SrNo>2</SrNo><UserId>68</UserId><UserName>Ashok</UserName><DisplayName>CYGNUS64-PC</DisplayName></UserDetail><
UserDetail><SrNo>3</SrNo><UserId>92</UserId><UserName>Mohan</UserName><DisplayName>Mohan patel</DisplayName></UserDetail></root>','ERP SOLUTION','1'    
  
SELECT * FROM Tbl_Permission  
SELECT * FROM Tbl_PermissionSettings  
SELECT Accesslevel,TenantId,* FROM Tbl_Master_Users  
SELECT * FROM tbl_CustomerRegistration  
  
*/  
CREATE PROC [dbo].[Usp_UserPermissionDetails_Submit]   
@XML1 VARCHAR(MAX),  
@XML2 VARCHAR(MAX),  
@XML3 VARCHAR(MAX),  
@UserName NVARCHAR(50),  
@CustomerId INT  
  
AS  
 BEGIN TRANSACTION  
 DECLARE @Status INT,@Message VARCHAR(500),@Id INT  
 SELECT @Message = 'Not Done',@Status = 0  
   
 DECLARE @hdoc1 INT ,@hdocName VARCHAR(1000) = 'PermisionModel'  
 DECLARE @hdoc2 INT ,@hdocName1 VARCHAR(1000) = 'root/AlertDetail'  
 DECLARE @hdoc3 INT ,@hdocName2 VARCHAR(1000) = 'root/UserDetail'  
  
 EXEC sp_xml_preparedocument @hdoc1 OUTPUT ,@XML1  
 EXEC sp_xml_preparedocument @hdoc2 OUTPUT ,@XML2  
 EXEC sp_xml_preparedocument @hdoc3 OUTPUT ,@XML3  
  
 SELECT @Id = Id  
 FROM OPENXML(@hdoc1, @hdocName, 2)  
 WITH  
 (  
  Id INT 'Id'  
 ) AS TB  
  
 DECLARE @ConcatString VARCHAR(MAX) ,@UserList VARCHAR(MAX)  
  
 SELECT @ConcatString = COALESCE(@ConcatString + ',', '') + TBL.CodeId  
 FROM OPENXML(@hdoc2, @hdocName1, 2)  
 WITH  
 (  
  CodeId VARCHAR(50) 'CodeId'  
 ) AS TBL  
  
 SELECT @ConcatString = (CASE WHEN @ConcatString LIKE '%6%' THEN '6' ELSE @ConcatString END)  
  
 SELECT @UserList = COALESCE(@UserList + ',', '') + TBL1.UserId  
 FROM OPENXML(@hdoc3, @hdocName2, 2)  
 WITH  
 (  
  UserId VARCHAR(50) 'UserId'  
 ) AS TBL1  
  
 IF (@Id > 0)  
 BEGIN  
  UPDATE Tbl_Permission  
  SET PermissionName = X1.PermissionlevelName  
     ,Administator = X1.Administator  
     ,ContentManager = X1.ContentManager  
     ,Custom = X1.Custom  
     ,PermissionType = X1.PermissionType  
  FROM OPENXML(@hdoc1, @hdocName, 2)  
  WITH  
  (  
   Id INT 'Id',  
   PermissionlevelName VARCHAR(500) 'PermissionlevelName',  
   Administator BIT 'Administator',  
   ContentManager BIT 'ContentManager',  
   Custom BIT 'Custom',  
   PermissionType VARCHAR(10) 'PermissionType'  
  ) X1  
  WHERE Tbl_Permission.Id = X1.Id  
  
  UPDATE Tbl_PermissionSettings  
  SET ToolList = @ConcatString  
     ,IsEntireOrganization = X2.PermittedToTarget  
     ,IsCoustomize = X2.CustomizeTarget  
     ,UserList = @UserList  
     ,Personal = X2.PersonalContent  
     ,FullViewing = X2.FullPermission  
     ,EntryBy = @UserName  
     ,EntryDate = GETDATE()  
  FROM OPENXML(@hdoc1, @hdocName, 2)  
  WITH  
  (  
   IsTools BIT 'IsTools',  
   CustomizeTarget BIT 'CustomizeTarget',  
   PersonalContent BIT 'PersonalContent',  
   FullPermission BIT 'FullPermission',  
   PermittedToTarget BIT 'PermittedToTarget'  
  ) X2  
  WHERE Tbl_PermissionSettings.PermissionId = @Id  
  
  /*Ashok*/  
  DECLARE @ContentManagerCheck VARCHAR(50),@CustModule VARCHAR(100)   
  
  SELECT @ContentManagerCheck=ContentManager  
  FROM OPENXML(@hdoc1, @hdocName, 2)  
  WITH  
  (  
   Id INT 'Id',  
   ContentManager BIT 'ContentManager'  
      
  ) X11  
  WHERE Id = X11.Id  
     
  IF(@ContentManagerCheck = 1)  
  BEGIN  
   SELECT @CustModule=Module FROM tbl_CustomerRegistration WHERE CustomerId=@CustomerId  
  
   UPDATE Tbl_PermissionSettings  
   SET ToolList = @CustModule  
      ,IsEntireOrganization = 0  
      ,IsCoustomize = 0  
      ,UserList = NULL  
      ,Personal = 0  
      ,FullViewing = 0  
      ,EntryBy = @UserName  
      ,EntryDate = GETDATE()  
         
      
   WHERE PermissionId = @Id  
  END  
  
 END  
 ELSE  
 BEGIN  
  
  INSERT INTO Tbl_Permission (PermissionName, PermissionType, Administator, ContentManager, Custom, EntryBy, EntryDate, CustomerId)  
   SELECT  
    PermissionlevelName  
      ,PermissionType  
      ,Administator  
      ,ContentManager  
      ,Custom  
      ,@UserName  
      ,GETDATE()  
      ,@CustomerId  
   FROM OPENXML(@hdoc1, @hdocName, 2)  
   WITH  
   (  
    PermissionlevelName VARCHAR(500) 'PermissionlevelName',  
    PermissionType VARCHAR(10) 'PermissionType',  
    Administator BIT 'Administator',  
    ContentManager BIT 'ContentManager',  
    Custom BIT 'Custom'  
   )  
  IF (@@error <> 0)  
   GOTO QuitWithRollback  
  PRINT '111'  
  DECLARE @PermissionId INT  
  SET @PermissionId = SCOPE_IDENTITY();  
  
  INSERT INTO Tbl_PermissionSettings (PermissionId, ToolList, IsEntireOrganization, IsCoustomize, UserList, Personal, FullViewing, EntryBy, EntryDate)  
   SELECT  
    @PermissionId  
      ,@ConcatString  
      ,PermittedToTarget  
      ,CustomizeTarget  
      ,@UserList  
      ,PersonalContent  
      ,FullPermission  
      ,@UserName  
      ,GETDATE()  
   FROM OPENXML(@hdoc1, @hdocName, 2)  
   WITH  
   (  
    IsTools BIT 'IsTools',  
    CustomizeTarget BIT 'CustomizeTarget',  
    PersonalContent BIT 'PersonalContent',  
    FullPermission BIT 'FullPermission',  
    PermittedToTarget BIT 'PermittedToTarget'  
   )  
  IF (@@error <> 0)  
   GOTO QuitWithRollback  
 END  
  
 SELECT  
  @Status = 1  
    ,@Message = 'Done'  
 SELECT  
  MESSAGE = @Message  
    ,STATUS = @Status  
 COMMIT TRANSACTION  
 GOTO EndSave  
QuitWithRollback:  
 IF (@@trancount > 0)  
  ROLLBACK TRANSACTION  
 BEGIN  
  SELECT  
   MESSAGE = @Message  
     ,STATUS = @Status  
 END  
EndSave:
GO
/****** Object:  StoredProcedure [dbo].[Usp_UserProfile_Update]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_UserProfile_Update]  
(  
 @XmlDoc XML,  
 @BaseUsername VARCHAR(50)  
)  
AS  
BEGIN  
 SET NOCOUNT ON;  
 DECLARE @Status INT = 1, @Message VARCHAR(MAX) = '', @MessageCode INT = 202;  
 DECLARE @ID INT = 0

  
 SELECT  
  @ID = X.Id  
 FROM  
 (  
  SELECT  
   A.H.value('Id[1]', 'INT') AS ID  
  FROM @XmlDoc.nodes('/DocumentElement') A (H)  
 ) X  
  
 BEGIN TRANSACTION  
 BEGIN TRY  
  
  IF(@ID > 0)  
  BEGIN  
   /*----- Start : Modify User Data -----*/  
   UPDATE TU  
   SET  
    TU.Name = DXML.Name,  
    TU.UserPwd = DXML.UserPwd,  
    TU.PhoneNo = DXML.mobileno,  
    TU.User_Image = DXML.User_Image ,
	TU.EmailId=DXML.EmailId
   FROM Tbl_Master_Users TU  
   INNER JOIN  
   (  
    SELECT  
     B.ID, B.[Name], B.mobileno,  
     B.[UserPwd], B.[User_Image],B.EmailId
    FROM  
    (  
     SELECT  
      A.H.value('Id[1]', 'INT') AS [ID],  
      A.H.value('Name[1]', 'VARCHAR(200)') AS [Name],  
      A.H.value('mobileno[1]', 'VARCHAR(200)') AS [mobileno],  
      A.H.value('UserPwd[1]', 'VARCHAR(200)') AS [UserPwd],  
      A.H.value('User_Image[1]', 'VARCHAR(200)') AS [User_Image],
	  A.H.value('EmailId[1]', 'VARCHAR(200)')  AS [EmailId]
     FROM @XmlDoc.nodes('/DocumentElement') A (H)  
    ) B  
   ) DXML  
   ON DXML.ID = TU.ID  
   WHERE TU.ID = DXML.ID;  
   /*----- End : Modify User Data -----*/  
  END   
  
  SELECT @Message = 'Done', @Status = 1, @MessageCode = 202;  
  COMMIT TRANSACTION  
 END TRY  
 BEGIN CATCH  
  SELECT @Message = 'Not Done', @Status = 0, @MessageCode = 201;  
  ROLLBACK TRANSACTION  
 END CATCH  
  
 SELECT  
  [Message] = @Message, [Status] = @Status, [MessageCode] = @MessageCode;  
 SET NOCOUNT OFF;  
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_wallpaperLockscreen_Update]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
================================================================
Objective : Update WP,LS,SS Edit Data & Schedule Data
================================================================
EXEC Usp_wallpaperLockscreen_Update
================================================================
*/
CREATE PROCEDURE [dbo].[Usp_wallpaperLockscreen_Update]
(
	@Id INT,
	@FromDate DATETIME,
	@EndDate DATETIME,
	@BaseUsername VARCHAR(50),
	@FileName VARCHAR(MAX),
	@ScreenWaitMinutes INT,
	@Title VARCHAR(8000),
	@Desc VARCHAR(8000),
	@ScreenSaverType INT,
	@Timeinterval VARCHAR(50),
	@SchedulePatternType VARCHAR(20),
	@IsOnResumeDisplay BIT,
	@ModuleType INT
)
AS
BEGIN
	DECLARE @Status INT = 1, @Message VARCHAR(MAX) = '', @AlertId INT = 0;
	SELECT @Message = 'Not Done', @Status = 0, @AlertId = 0;

	BEGIN TRANSACTION
	BEGIN
		/*---------- Start : Update Data ----------*/
		UPDATE tbl_Alert_popUp
		SET
			AlertTital =  (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN @FileName ELSE @Title END),
			AlertBody = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN @Title ELSE @Desc END),
			[DESCRIPTION] = (CASE WHEN @ModuleType = 3 OR @ModuleType = 7 THEN @Desc ELSE '' END),
			AlertPosition = @ScreenSaverType,
			AlertType = 'BC',
			UpdateBy = @BaseUsername,
			UpdateDate = GETDATE(),
			AutoCloseInMin = @Timeinterval,
			ScreenWaitMinutes = @ScreenWaitMinutes,
			IsOnResumeDisplay = @IsOnResumeDisplay
		WHERE AlertId = @Id;
		/*---------- End : Update Data ----------*/

		/*---------- Start : Update Schedule Data ----------*/
		IF(@SchedulePatternType = '1')
		BEGIN
			UPDATE
				tbl_Alert_Schedule_Setting
			SET
				SchedulePatternType = 1,
				OnceStartDateTime = @FromDate,
				OnceEndDateTime = @EndDate,
				UpdateBy = @BaseUsername,
				UpdateDate = GETDATE()
			WHERE AlertId = @Id;
		END
		ELSE
		BEGIN
			UPDATE
				tbl_Alert_Schedule_Setting
			SET
				SchedulePatternType = 0,
				OnceStartDateTime = NULL,
				OnceEndDateTime = NULL,
				UpdateBy = @BaseUsername,
				UpdateDate = GETDATE()
			WHERE AlertId = @Id;
		END
		/*---------- End : Update Schedule Data ----------*/

		SELECT @Message = 'Done', @Status = 1;
	END

	SELECT [Message] = @Message, [Status] = @Status, AlertId = @Id;

	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
	IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	BEGIN
		SELECT [MESSAGE] = @Message, [Status] = @Status, AlertId = @Id;
	END
	EndSave:
END
GO
/****** Object:  StoredProcedure [dbo].[uspCreateShortcutAlert]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
	EXEC USP_Resend_Alert '',''
*/
CREATE PROCEDURE [dbo].[uspCreateShortcutAlert]
(
	@AlertId INT,
	@EntryBy VARCHAR(100)
)
AS
BEGIN

	DECLARE @AlertTitle VARCHAR(500), @CustomerId INT;
	SELECT @AlertTitle = AlertTital, @CustomerId= CustomerId from tbl_Alert_popUp WHERE AlertId=@AlertId
		INSERT INTO tblShortcuts(AlertId,AlertTitle,UpdatedTime,CreatedBy, CustomerId)
		VALUES(@AlertId,@AlertTitle,GETUTCDATE(),@EntryBy,@CustomerId)

END


GO
/****** Object:  StoredProcedure [dbo].[uspGetScheduledAlerts]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC USP_Resend_Alert '',''
*/
CREATE PROCEDURE [dbo].[uspGetScheduledAlerts]
(
	@Day VARCHAR(100)
)
AS
BEGIN
	declare @dayname varchar(50);
	SET @dayname=(SELECT DATENAME(dw, GETDATE()))

	 DECLARE @AlertIds AS Table(id INT)

	INSERT INTO @AlertIds 
	SELECT DISTINCT(ap.AlertId) FROM tbl_Alert_popUp ap
	INNER JOIN tbl_Send_Alert_User tsa ON tsa.AlertId = ap.AlertId
	INNER JOIN tbl_Alert_Schedule_Setting tss ON tss.AlertId=ap.AlertId
	WHERE tss.SchedulePatternType='Once' AND tss.OnceStartDateTime <= GETDATE() AND tss.OnceEndDateTime >= GETDATE() AND Type not in ('3', '4', '7') AND ISNUll(tss.IsProcessed,0)=0
	
	
	INSERT INTO @AlertIds 
	SELECT DISTINCT(ap.AlertId) FROM tbl_Alert_popUp ap
	INNER JOIN tbl_Send_Alert_User tsa ON tsa.AlertId = ap.AlertId
	INNER JOIN tbl_Alert_Schedule_Setting tss ON tss.AlertId=ap.AlertId
	WHERE tss.SchedulePatternType='Weekly' AND tss.StartDateComman < GETDATE() AND Type not in ('3', '4', '7') AND ((@dayname='Monday' AND tss.WeeklydayMonday=1) OR (@dayname='Tuesday' AND tss.WeeklydayTuesday=1) OR (@dayname='Wednesday' AND tss.WeeklydayWednesday=1) OR (@dayname='Thursday' AND tss.WeeklydayThursday=1)
	OR (@dayname='Friday' AND tss.WeeklydayFriday=1) OR (@dayname='Saturday' AND tss.WeeklydaySaturday=1) OR (@dayname='Sunday' AND tss.WeeklydaySunday=1)) AND (tss.ProcessedDay is null OR tss.ProcessedDay<>@Day)

	SELECT distinct(id) AS AlertId from @AlertIds

END
GO
/****** Object:  StoredProcedure [dbo].[uspSaveADDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION :  Add/Edit Save Sync Users & Group Data 
==========================================================
EXEC USP_Submit_SaveADSyncDetail '','','','','',''
==========================================================
*/
CREATE PROCEDURE [dbo].[uspSaveADDetail]
(
	@app NVARCHAR(50),
	@sec NVARCHAR(50),
	@ten NVARCHAR(50),
	@CustomerId INT
)
AS
BEGIN
	DECLARE @ADExist INT = 0
	SELECT @ADExist = COUNT(*) FROM adsyncinfo WITH(NOLOCK) WHERE CustomerId=@CustomerId
	IF(@ADExist = 0)
		BEGIN
			INSERT INTO adsyncinfo(sysid, systid, stenant, customerid) VALUES(@app, @sec, @ten, @CustomerId)
		END
	ELSE
		BEGIN
			UPDATE adsyncinfo
			SET
				sysid = @app,
				systid = @sec,
				stenant = @ten
			WHERE CustomerId = @CustomerId 
		END
END
GO
/****** Object:  StoredProcedure [dbo].[uspSaveADGroupDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION :  Add/Edit Save Sync Users & Group Data 
==========================================================
EXEC USP_Submit_SaveADSyncDetail '','','','','',''
==========================================================
*/
CREATE PROCEDURE [dbo].[uspSaveADGroupDetail]
(
	@Name NVARCHAR(250),
	@CustomerId INT,
	@Id NVARCHAR(255),
	@Domain NVARCHAR(255)
)
AS
BEGIN
	DECLARE @ADExist INT = 0
	SELECT @ADExist = COUNT(*) FROM Tbl_Groups WITH(NOLOCK) WHERE CustomerId=@CustomerId AND GroupName=@Name
	IF(@ADExist = 0)
		BEGIN
			INSERT INTO Tbl_Groups(GroupName, IsActive, EntryBy, EntryDate, UpdateBy, UpdateDate, GroupType, CustomerId, Is_AD_Group, AD_GuId, AD_DomainName)
			VALUES(@Name, 1, 'AD Sync Service', GETDATE(), 'AD Sync Service', GETDATE(), 'Azure AD', @CustomerId, 1 , @Id, @Domain)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[uspSaveADUserGroup]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION :  Add/Edit Save Sync Users & Group Data 
==========================================================
EXEC USP_Submit_SaveADSyncDetail '','','','','',''
==========================================================
*/
CREATE PROCEDURE [dbo].[uspSaveADUserGroup]
(
	@GroupMemberIds NVARCHAR(MAX),
	@CustomerId INT,
	@UserId INT
)
AS
BEGIN
	INSERT INTO Tbl_Users_Group(Group_HDR_Id, UserId,IsActive,Is_AD_User,IsADSync, EntryBy, EntryDate, UpdateBy, UpdateDate, Type)
		SELECT Id ,@UserId,1,1,1, 'AD Data Sync', GETUTCDATE(), 'AD Data Sync', GETUTCDATE(), 'User'
		FROM Tbl_Groups WITH(NOLOCK) 
		JOIN STRING_SPLIT(@GroupMemberIds, ',') ON value=AD_GuId
		AND Id Not In (SELECT Group_HDR_Id FROM Tbl_Users_Group WHERE UserId=@UserId)
		AND CustomerId=@CustomerId
END
GO
/****** Object:  StoredProcedure [dbo].[uspSaveBulkADGroupDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSaveBulkADGroupDetail]
(
    @GroupTable dbo.GroupTableType READONLY  -- Declare the TVP parameter
)
AS
BEGIN
    -- Use the MERGE statement to perform an update if the entry exists, or insert a new entry if it doesn't
    MERGE INTO Tbl_Groups AS target
    USING @GroupTable AS source
    ON target.AD_GuId = source.Id
    WHEN MATCHED THEN
        -- Update the existing record
        UPDATE SET 
            target.GroupName = source.Name, 
            target.IsActive = 1, 
            target.UpdateBy = 'AD Sync Service', 
            target.UpdateDate = GETDATE(), 
            target.GroupType = 'Azure AD', 
            target.CustomerId = source.CustomerId, 
            target.Is_AD_Group = 1, 
            target.AD_DomainName = source.Domain
    WHEN NOT MATCHED THEN
        -- Insert new record
        INSERT (
            GroupName, IsActive, EntryBy, EntryDate, UpdateBy, UpdateDate, 
            GroupType, CustomerId, Is_AD_Group, AD_GuId, AD_DomainName
        )
        VALUES (
            source.Name, 
            1, 
            'AD Sync Service', 
            GETDATE(), 
            'AD Sync Service', 
            GETDATE(), 
            'Azure AD', 
            source.CustomerId, 
            1, 
            source.Id, 
            source.Domain
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[uspSaveBulkAdUsers]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[uspSaveBulkAdUsers]
(
    @UserTable dbo.UserTableType READONLY  -- Declare the TVP parameter
)
AS
BEGIN
    -- Update existing users based on matching email
    UPDATE target
    SET 
        target.mobile_phone = source.MobilePhone,
        target.fname = source.FName,
        target.sname = source.SName,
        target.Ad_DomainName = source.Domain,
        target.Department = source.Department,
        target.Is_Ad_User = 1,
        target.AD_GuId = source.AdGuid
    FROM Tbl_Users AS target
    INNER JOIN @UserTable AS source
    ON LOWER(target.name) = LOWER(source.LoginName) and target.ParentCustID = source.ParentCustID;

	   -- Now, call the uspSaveADUserGroup stored procedure for each updated user
    DECLARE @GroupMemberIds NVARCHAR(MAX), @CustomerId INT, @UserId INT;

    DECLARE updatedUsersCursor CURSOR FOR 
    SELECT source.GroupMemberIds, source.ParentCustID, target.id
    FROM @UserTable AS source
    INNER JOIN Tbl_Users AS target
    ON LOWER(target.name) = LOWER(source.LoginName) and target.ParentCustID = source.ParentCustID;

    OPEN updatedUsersCursor;
    FETCH NEXT FROM updatedUsersCursor INTO @GroupMemberIds, @CustomerId, @UserId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Execute the uspSaveADUserGroup stored procedure
        EXEC uspSaveADUserGroup @GroupMemberIds = @GroupMemberIds, @CustomerId = @CustomerId, @UserId = @UserId;

        FETCH NEXT FROM updatedUsersCursor INTO @GroupMemberIds, @CustomerId, @UserId;
    END;

    CLOSE updatedUsersCursor;
    DEALLOCATE updatedUsersCursor;
END;
GO
/****** Object:  StoredProcedure [dbo].[uspSaveLocalADDetail]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==========================================================
DESCRIPTION :  Add/Edit Save Sync Users & Group Data 
==========================================================
EXEC USP_Submit_SaveADSyncDetail '','','','','',''
==========================================================
*/
CREATE PROCEDURE [dbo].[uspSaveLocalADDetail]
(
	@domain NVARCHAR(50),
	@userid NVARCHAR(50),
	@pass NVARCHAR(50),
	@CustomerId INT
)
AS
BEGIN
	DECLARE @ADExist INT = 0
	SELECT @ADExist = COUNT(*) FROM Tbl_AD_Sync_Header WITH(NOLOCK) WHERE CustomerId=@CustomerId
	IF(@ADExist = 0)
		BEGIN
			INSERT INTO Tbl_AD_Sync_Header(Domain, UserId, Password, customerid) VALUES(@domain, @userid, @pass, @CustomerId)
		END
	ELSE
		BEGIN
			UPDATE Tbl_AD_Sync_Header
			SET
				Domain = @domain,
				UserId = @userid,
				Password = @pass
			WHERE CustomerId = @CustomerId 
		END
END
GO
/****** Object:  StoredProcedure [dbo].[uspSendScheduledAlert]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	EXEC USP_Resend_Alert '',''
*/
CREATE PROCEDURE [dbo].[uspSendScheduledAlert]
(
	@AlertId INT,
	@EntryBy VARCHAR(100),
	@Day VARCHAR(100)
)
AS
BEGIN

	DECLARE @NewAlertId INT, @PreviousAlertID INT;
	DECLARE @Status INT, @Message VARCHAR(500), @NAlertId VARCHAR(500), @Type VARCHAR(100), @AlertStatus VARCHAR(100), @BaseUserName VARCHAR(100), @typ VARCHAR(100);
	SELECT @Message = 'Not Done', @Status = 0;

	BEGIN
		SELECT @typ= Type, @BaseUserName=EntryBy FROM tbl_Alert_popUp T WITH(NOLOCK) WHERE T.AlertId = @AlertId
		SELECT @AlertStatus=SchedulePatternType FROM tbl_Alert_Schedule_Setting T WITH(NOLOCK) WHERE T.AlertId = @AlertId
				
		if(@AlertStatus='Once')
			BEGIN
				UPDATE tbl_Alert_popUp
				SET Status='Send'
				WHERE Alertid = @AlertId

				UPDATE tbl_Send_Alert_User
				SET Status='Send'
				WHERE Alertid = @AlertId

				UPDATE tbl_Alert_Schedule_Setting
				SET SchedulePatternType='1'
				WHERE Alertid = @AlertId
			END
		ELSE
			BEGIN
				INSERT INTO tbl_Alert_popUp
				(
					AlertTital,AlertBody,CriticalAlert,AutoCloseIn,AutoCloseInMin,
					ExpiresIn,ExpiresTimeValue,ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,
					DesktopSizeWidth,DesktopSizeHeight,AlertPosition,EntryDate,EntryBy,Status,ThemeId,isResize,Type,
					TickerSpeed,TickerPosition,AlertType,CustomerId,
					ScreenWaitMinutes,IsOnResumeDisplay,MessagingType
				)
				SELECT
					AlertTital,AlertBody,CriticalAlert,AutoCloseIn,AutoCloseInMin,
					ExpiresIn,ExpiresTimeValue,ExpiresTimeType,TrayNotification,AcknoledgrButton,FullScreenAlert,
					DesktopSizeWidth,DesktopSizeHeight,AlertPosition,GETDATE(),@EntryBy,'Scheduled Send',ThemeId,isResize,Type,
					TickerSpeed,TickerPosition,AlertType,T.CustomerId,
					ScreenWaitMinutes,IsOnResumeDisplay,MessagingType
				FROM tbl_Alert_popUp T WITH(NOLOCK)
				WHERE T.Alertid = @AlertId

				--IF (@@ERROR <> 0 ) GOTO QuitWithRollback   
				SET @NewAlertId= SCOPE_IDENTITY();

				UPDATE tbl_Alert_Schedule_Setting
				SET ProcessedDay=@Day,IsProcessed=1
				WHERE Alertid = @AlertId
  
				--IF (@@ERROR <> 0 ) GOTO QuitWithRollback
				INSERT INTO tbl_Send_Alert_User
				(
					Alertid,UserId,UserName,EntryBy,EntryDate,UserType,IsAcknowledge,AcknowledgeDate,Status,ClearDate
				)
				SELECT DISTINCT
					@NewAlertId,UserId,UserName,@EntryBy,GETDATE(),UserType,0,NULL,'Send',NULL FROM tbl_Send_Alert_User tsau
				WHERE tsau.Alertid = @AlertId
			END

		PRINT 'S';
		PRINT 'M';
	END
	SELECT @Status = 1, @Message = 'Done', @NAlertId=@NewAlertId, @Type=@typ, @PreviousAlertID = @AlertId;

	BEGIN
		SELECT MESSAGE = @Message, STATUS = @Status, NewAlertId = @NAlertId, Type = @Type, PreviousAlertID = @PreviousAlertID;
	END
END
GO
/****** Object:  DdlTrigger [CaptureStoredProcedureChanges]    Script Date: 6/3/2025 12:17:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CaptureStoredProcedureChanges]
    ON DATABASE
    FOR CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE,CREATE_TABLE, ALTER_TABLE, DROP_TABLE,CREATE_FUNCTION, ALTER_FUNCTION, DROP_FUNCTION,CREATE_VIEW, ALTER_VIEW, DROP_VIEW
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EventData XML = EVENTDATA(), @ip VARCHAR(32);

    SELECT @ip = client_net_address
        FROM sys.dm_exec_connections
        WHERE session_id = @@SPID;
   
    INSERT dbo.ProcedureChanges
    (
        EventType,
        EventDDL,
        SchemaName,
        ObjectName,
        DatabaseName,
        HostName,
        IPAddress,
        ProgramName,
        LoginName
    )
    SELECT
        @EventData.value('(/EVENT_INSTANCE/EventType)[1]',   'NVARCHAR(100)'), 
        @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(MAX)'),
        @EventData.value('(/EVENT_INSTANCE/SchemaName)[1]',  'NVARCHAR(255)'), 
        @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]',  'NVARCHAR(255)'),
        DB_NAME(), HOST_NAME(), @ip, PROGRAM_NAME(), SUSER_SNAME();
END

GO
ENABLE TRIGGER [CaptureStoredProcedureChanges] ON DATABASE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tap"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 38
         End
         Begin Table = "tsa"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tss"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAlerts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAlerts'
GO
USE [master]
GO
ALTER DATABASE [XComms] SET  READ_WRITE 
GO
