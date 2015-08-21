USE [master]
GO
/****** Object:  Database [Wetu]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE DATABASE [Wetu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wetu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Wetu.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Wetu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Wetu_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Wetu] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wetu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wetu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wetu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wetu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wetu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wetu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wetu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wetu] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Wetu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wetu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wetu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wetu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wetu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wetu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wetu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wetu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wetu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wetu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wetu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wetu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wetu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wetu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wetu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wetu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wetu] SET RECOVERY FULL 
GO
ALTER DATABASE [Wetu] SET  MULTI_USER 
GO
ALTER DATABASE [Wetu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wetu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wetu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wetu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Wetu]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  UserDefinedTableType [dbo].[IntList]    Script Date: 2015-08-21 01:09:40 PM ******/
CREATE TYPE [dbo].[IntList] AS TABLE(
	[Item] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END

GO
/****** Object:  StoredProcedure [dbo].[usp_a_DeviceLinksDelete]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_a_DeviceLinksDelete] 
	@AnimalId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[a_DeviceLinks]
	SET IsCurrent = 0
	WHERE AnimalId = @AnimalId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_a_DeviceLinksInsert]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_a_DeviceLinksInsert] 
    @DeviceId int,
    @AnimalId int,
    @IsCurrent bit,
    @ModifiedDate datetime,
    @ModifiedBy int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[a_DeviceLinks] ([DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy])
	SELECT @DeviceId, @AnimalId, @IsCurrent, @ModifiedDate, @ModifiedBy

	SELECT * 
	INTO #AnimalDevices
	FROM [dbo].[a_DeviceLinks] L
	WHERE L.AnimalId = @AnimalId AND L.DeviceId <> @DeviceId

	UPDATE [dbo].[a_DeviceLinks] 
	SET IsCurrent = 0
	WHERE DeviceLinkId IN (
		SELECT DeviceLinkId
		FROM #AnimalDevices
	)

	
	-- Begin Return Select <- do not remove
	--SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_a_DeviceLinksSelect]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_a_DeviceLinksSelect] 
    @DeviceLinkId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy] 
	FROM   [dbo].[a_DeviceLinks] 
	WHERE  ([DeviceLinkId] = @DeviceLinkId OR @DeviceLinkId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_a_DeviceLinksUpdate]    Script Date: 2015-08-21 01:09:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_a_DeviceLinksUpdate] 
    @DeviceLinkId int,
    @DeviceId int,
    @AnimalId int,
    @IsCurrent bit,
    @ModifiedDate datetime,
    @ModifiedBy int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[a_DeviceLinks]
	SET    [DeviceId] = @DeviceId, [AnimalId] = @AnimalId, [IsCurrent] = @IsCurrent, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy
	WHERE  [DeviceLinkId] = @DeviceLinkId
	
	-- Begin Return Select <- do not remove
	SELECT [DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]
	FROM   [dbo].[a_DeviceLinks]
	WHERE  [DeviceLinkId] = @DeviceLinkId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_aspnet_RolesSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_aspnet_RolesSelect] 
    @RoleName varchar(256)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [RoleId], [ApplicationId], [RoleName], [LoweredRoleName], [Description] 
	FROM   [dbo].[aspnet_Roles] 
	WHERE  ([RoleName] = @RoleName) 

	COMMIT

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_aspnet_UsersSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_aspnet_UsersSelect] 
    @UserName varchar(256)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [UserId], [ApplicationId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate] 
	FROM   [dbo].[aspnet_Users] 
	WHERE  ([UserName] = @UserName) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_AnimalTypesDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_AnimalTypesDelete] 
    @AnimalTypeId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[l_AnimalTypes]
	WHERE  [AnimalTypeId] = @AnimalTypeId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_AnimalTypesInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_AnimalTypesInsert] 
    @Description varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[l_AnimalTypes] ([Description])
	SELECT @Description
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_AnimalTypesSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_AnimalTypesSelect] 
    @AnimalTypeId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [AnimalTypeId], [Description] 
	FROM   [dbo].[l_AnimalTypes] 
	WHERE  ([AnimalTypeId] = @AnimalTypeId OR @AnimalTypeId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_AnimalTypesSelectAll]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_AnimalTypesSelectAll] 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [AnimalTypeId], [Description] 
	FROM   [dbo].[l_AnimalTypes] 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_AnimalTypesUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_AnimalTypesUpdate] 
    @AnimalTypeId int,
    @Description varchar(50)
AS 
	UPDATE [dbo].[l_AnimalTypes]
	SET    [Description] = @Description
	WHERE  [AnimalTypeId] = @AnimalTypeId
	
	-- Begin Return Select <- do not remove
SET NOCOUNT ON
	RETURN
	-- End Return Select <- do not remove
	

GO
/****** Object:  StoredProcedure [dbo].[usp_l_BirthTypesDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_BirthTypesDelete] 
    @BirthTypeId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[l_BirthTypes]
	WHERE  [BirthTypeId] = @BirthTypeId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_BirthTypesInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_BirthTypesInsert] 
    @Description varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[l_BirthTypes] ([Description])
	SELECT @Description
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_BirthTypesSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_BirthTypesSelect] 
    @BirthTypeId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [BirthTypeId], [Description] 
	FROM   [dbo].[l_BirthTypes] 
	WHERE  ([BirthTypeId] = @BirthTypeId OR @BirthTypeId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_BirthTypesSelectAll]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_BirthTypesSelectAll] 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [BirthTypeId], [Description] 
	FROM   [dbo].[l_BirthTypes] 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_BirthTypesUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_BirthTypesUpdate] 
    @BirthTypeId int,
    @Description varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[l_BirthTypes]
	SET    [Description] = @Description
	WHERE  [BirthTypeId] = @BirthTypeId
	
	-- Begin Return Select <- do not remove
	SELECT [BirthTypeId], [Description]
	FROM   [dbo].[l_BirthTypes]
	WHERE  [BirthTypeId] = @BirthTypeId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_SexesDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_SexesDelete] 
    @SexId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[l_Sexes]
	WHERE  [SexId] = @SexId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_SexesInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_SexesInsert] 
    @Description varchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[l_Sexes] ([Description])
	SELECT @Description
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_SexesSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_SexesSelect] 
    @SexId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [SexId], [Description] 
	FROM   [dbo].[l_Sexes] 
	WHERE  ([SexId] = @SexId OR @SexId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_SexesSelectAll]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_SexesSelectAll] 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [SexId], [Description] 
	FROM   [dbo].[l_Sexes] 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_l_SexesUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_l_SexesUpdate] 
    @SexId int,
    @Description varchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[l_Sexes]
	SET    [Description] = @Description
	WHERE  [SexId] = @SexId
	
	-- Begin Return Select <- do not remove
	SELECT [SexId], [Description]
	FROM   [dbo].[l_Sexes]
	WHERE  [SexId] = @SexId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_AnimalsDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_AnimalsDelete] 
    @AnimalId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Animals]
	WHERE  [AnimalId] = @AnimalId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_AnimalSelectFromDeviceId]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_AnimalSelectFromDeviceId] 
    @DeviceId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT L.AnimalId
	FROM   [dbo].[a_DeviceLinks] L 
	WHERE L.DeviceId = @DeviceId
	AND L.IsCurrent = 1

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_AnimalsInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_AnimalsInsert] 
    @AnimalTypeId int,
    @SexId int,
    @DecriptiveName varchar(50),
    @TagNumber varchar(5),
    @BirthDate datetime,
    @CreatedDate datetime,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @CompanyId int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Animals] ([AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed])
	SELECT @AnimalTypeId, @SexId, @DecriptiveName, @TagNumber, @BirthDate, @CreatedDate, @ModifiedDate, @ModifiedBy, @CompanyId, @Removed
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_AnimalsSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_AnimalsSelect] 
    @AnimalId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT A.*, S.Description as Sex, T.Description as Species, C.Name as Company, U.Username as Username,
	COALESCE((SELECT L.DeviceId
	FROM a_DeviceLinks L 
	WHERE L.AnimalId = A.AnimalId
	AND L.IsCurrent = 1),0) as DeviceId,
	COALESCE((SELECT D.Address
	FROM a_DeviceLinks DL INNER JOIN [dbo].[t_Devices] D ON DL.DeviceId = D.DeviceId
	WHERE DL.AnimalId = A.AnimalId
	AND DL.IsCurrent = 1),'Not Connected') as DeviceAddress
	FROM   [dbo].[t_Animals] A INNER JOIN [dbo].[l_AnimalTypes] T ON A.AnimalTypeId = T.AnimalTypeId
		   INNER JOIN [dbo].[l_Sexes] S ON A.SexId = S.SexId 
		   INNER JOIN [dbo].[t_Companies] C ON A.CompanyId = C.CompanyId
		   INNER JOIN [dbo].[t_Users] U ON A.ModifiedBy = U.UserKey
	WHERE  A.AnimalId = @AnimalId 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_AnimalsSelectAll]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_AnimalsSelectAll] 
    @Companies [dbo].[IntList] READONLY
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT A.*, S.Description as Sex, T.Description as Species, C.Name as Company, U.Username as Username,
	COALESCE((SELECT L.DeviceId
	FROM a_DeviceLinks L 
	WHERE L.AnimalId = A.AnimalId
	AND L.IsCurrent = 1),0) as DeviceId,
	COALESCE((SELECT D.Address
	FROM a_DeviceLinks DL INNER JOIN [dbo].[t_Devices] D ON DL.DeviceId = D.DeviceId
	WHERE DL.AnimalId = A.AnimalId
	AND DL.IsCurrent = 1),'Not Connected') as DeviceAddress

	FROM   [dbo].[t_Animals] A INNER JOIN [dbo].[l_AnimalTypes] T ON A.AnimalTypeId = T.AnimalTypeId
		   INNER JOIN [dbo].[l_Sexes] S ON A.SexId = S.SexId 
		   INNER JOIN [dbo].[t_Companies] C ON A.CompanyId = C.CompanyId
		   INNER JOIN [dbo].[t_Users] U ON A.ModifiedBy = U.UserKey
	WHERE  A.CompanyId IN (SELECT * FROM @Companies) 
	AND A.Removed = 0

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_AnimalsUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_AnimalsUpdate] 
    @AnimalId int,
    @AnimalTypeId int,
    @SexId int,
    @DecriptiveName varchar(50),
    @TagNumber varchar(5),
    @BirthDate datetime,
    @CreatedDate datetime,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @CompanyId int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Animals]
	SET    [AnimalTypeId] = @AnimalTypeId, [SexId] = @SexId, [DecriptiveName] = @DecriptiveName, [TagNumber] = @TagNumber, [BirthDate] = @BirthDate, [CreatedDate] = @CreatedDate, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [CompanyId] = @CompanyId, [Removed] = @Removed
	WHERE  [AnimalId] = @AnimalId
	
	-- Begin Return Select <- do not remove
	SELECT [AnimalId], [AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]
	FROM   [dbo].[t_Animals]
	WHERE  [AnimalId] = @AnimalId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_BirthHistoryDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_BirthHistoryDelete] 
    @HistoryId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_BirthHistory]
	WHERE  [HistoryId] = @HistoryId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_BirthHistoryInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_BirthHistoryInsert] 
    @BirthTypeId int,
    @FemaleParentId int,
    @MaleParentId int,
    @ChildId int,
    @TubeId int,
    @ModifiedDate datetime,
    @ModifiedBy int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_BirthHistory] ([BirthTypeId], [FemaleParentId], [MaleParentId], [ChildId], [TubeId], [ModifiedDate], [ModifiedBy])
	SELECT @BirthTypeId, @FemaleParentId, @MaleParentId, @ChildId, @TubeId, @ModifiedDate, @ModifiedBy
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_BirthHistorySelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_BirthHistorySelect] 
    @HistoryId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [HistoryId], [BirthTypeId], [FemaleParentId], [MaleParentId], [ChildId], [TubeId], [ModifiedDate], [ModifiedBy] 
	FROM   [dbo].[t_BirthHistory] 
	WHERE  ([HistoryId] = @HistoryId OR @HistoryId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_BirthHistoryUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_BirthHistoryUpdate] 
    @HistoryId int,
    @BirthTypeId int,
    @FemaleParentId int,
    @MaleParentId int,
    @ChildId int,
    @TubeId int,
    @ModifiedDate datetime,
    @ModifiedBy int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_BirthHistory]
	SET    [BirthTypeId] = @BirthTypeId, [FemaleParentId] = @FemaleParentId, [MaleParentId] = @MaleParentId, [ChildId] = @ChildId, [TubeId] = @TubeId, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy
	WHERE  [HistoryId] = @HistoryId
	
	-- Begin Return Select <- do not remove
	SELECT [HistoryId], [BirthTypeId], [FemaleParentId], [MaleParentId], [ChildId], [TubeId], [ModifiedDate], [ModifiedBy]
	FROM   [dbo].[t_BirthHistory]
	WHERE  [HistoryId] = @HistoryId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_CompaniesDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_CompaniesDelete] 
    @CompanyId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Companies]
	WHERE  [CompanyId] = @CompanyId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_CompaniesInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_CompaniesInsert] 
    @Name varchar(50),
    @RoleId uniqueidentifier,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Companies] ([Name], [RoleId], [Removed])
	SELECT @Name, @RoleId, @Removed
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_CompaniesSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_CompaniesSelect] 
    @CompanyId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [CompanyId], [Name], [RoleId], [Removed] 
	FROM   [dbo].[t_Companies] 
	WHERE  ([CompanyId] = @CompanyId OR @CompanyId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_CompaniesUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_CompaniesUpdate] 
    @CompanyId int,
    @Name varchar(50),
    @RoleId uniqueidentifier,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Companies]
	SET    [Name] = @Name, [RoleId] = @RoleId, [Removed] = @Removed
	WHERE  [CompanyId] = @CompanyId
	
	-- Begin Return Select <- do not remove
	SELECT [CompanyId], [Name], [RoleId], [Removed]
	FROM   [dbo].[t_Companies]
	WHERE  [CompanyId] = @CompanyId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_CompanySelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_CompanySelect]
    @Name varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [CompanyId], [Name], [RoleId], [Removed] 
	FROM   [dbo].[t_Companies] 
	WHERE  ([Name] = @Name) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DevicesDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DevicesDelete] 
    @DeviceId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Devices]
	WHERE  [DeviceId] = @DeviceId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DeviceSelectFromAddress]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DeviceSelectFromAddress] 
    @Address varchar(16)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT D.DeviceId
	FROM   [dbo].[t_Devices] D 
	WHERE  ([Address] = @Address) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DevicesInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DevicesInsert] 
    @Address varchar(16),
    @CreatedDate datetime,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @CompanyId int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Devices] ([Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed])
	SELECT @Address, @CreatedDate, @ModifiedDate, @ModifiedBy, @CompanyId, @Removed
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DevicesSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DevicesSelect] 
    @DeviceId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT D.*, U.Username, C.Name as [CompanyName]
	FROM   [dbo].[t_Devices] D INNER JOIN [dbo].[t_Users] U ON D.ModifiedBy = U.UserKey
			INNER JOIN [dbo].[t_Companies] C ON D.CompanyId = C.CompanyId
	WHERE  ([DeviceId] = @DeviceId OR @DeviceId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DevicesSelectAll]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DevicesSelectAll] 
    @Companies [dbo].[IntList] READONLY
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT D.*, U.Username, C.Name as [CompanyName]
	FROM   [dbo].[t_Devices] D INNER JOIN [dbo].[t_Users] U ON D.ModifiedBy = U.UserKey
			INNER JOIN [dbo].[t_Companies] C ON D.CompanyId = C.CompanyId
	WHERE  D.CompanyId IN (SELECT * FROM @Companies) 
	AND D.Removed = 0

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DevicesSelectDropDown]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DevicesSelectDropDown] 
    @Companies [dbo].[IntList] READONLY
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT D.DeviceId, D.Address
	FROM    [dbo].[t_Devices] D 
	WHERE  D.CompanyId IN (SELECT * FROM @Companies) 
	AND D.Removed = 0
	AND D.DeviceId NOT IN(
		SELECT DISTINCT L.DeviceId
		FROM a_DeviceLinks L
		WHERE L.IsCurrent = 1
	)

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_DevicesUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_DevicesUpdate] 
    @DeviceId int,
    @Address varchar(16),
    @CreatedDate datetime,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @CompanyId int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Devices]
	SET    [Address] = @Address, [CreatedDate] = @CreatedDate, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [CompanyId] = @CompanyId, [Removed] = @Removed
	WHERE  [DeviceId] = @DeviceId
	
	-- Begin Return Select <- do not remove
	SELECT [DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]
	FROM   [dbo].[t_Devices]
	WHERE  [DeviceId] = @DeviceId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_ProximityDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_ProximityDelete] 
    @ProximityId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Proximity]
	WHERE  [ProximityId] = @ProximityId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_ProximityInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_ProximityInsert] 
    @DeviceConnectedTo int,
    @DeviceInProximity int,
    @AnimalConnectedTo int,
    @AnimalInProximity int,
    @ProximityStarted datetime,
    @ProximityEnded datetime,
    @LogDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Proximity] ([DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate])
	SELECT @DeviceConnectedTo, @DeviceInProximity, @AnimalConnectedTo, @AnimalInProximity, @ProximityStarted, @ProximityEnded, @LogDate
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_ProximitySelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_ProximitySelect] 
    @ProximityId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate] 
	FROM   [dbo].[t_Proximity] 
	WHERE  ([ProximityId] = @ProximityId OR @ProximityId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_ProximitySelectAll]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_ProximitySelectAll] 
    @Companies [dbo].[IntList] READONLY
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT P.*,
	(
		SELECT D.Address
		FROM [dbo].[t_Devices] D
		WHERE D.DeviceId = P.DeviceConnectedTo
	) as DeviceA,
	(
		SELECT D.Address
		FROM [dbo].[t_Devices] D
		WHERE D.DeviceId = P.DeviceInProximity
	) as DeviceB,
	(
		SELECT A.DecriptiveName
		FROM [dbo].[t_Animals] A
		WHERE A.AnimalId = P.AnimalConnectedTo
	) as AnimalA,
	(
		SELECT A.DecriptiveName
		FROM [dbo].[t_Animals] A
		WHERE A.AnimalId = P.AnimalInProximity
	) as AnimalB,
	C.Name as Company
	FROM   [dbo].[t_Proximity] P INNER JOIN [dbo].[t_Devices] D ON P.DeviceConnectedTo = D.DeviceId
	INNER JOIN [dbo].[t_Companies] C On D.CompanyId = C.CompanyId
	WHERE  D.CompanyId IN (SELECT * FROM @Companies) 
	ORDER BY P.LogDate DESC

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_ProximityUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_ProximityUpdate] 
    @ProximityId int,
    @DeviceConnectedTo int,
    @DeviceInProximity int,
    @AnimalConnectedTo int,
    @AnimalInProximity int,
    @ProximityStarted datetime,
    @ProximityEnded datetime,
    @LogDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Proximity]
	SET    [DeviceConnectedTo] = @DeviceConnectedTo, [DeviceInProximity] = @DeviceInProximity, [AnimalConnectedTo] = @AnimalConnectedTo, [AnimalInProximity] = @AnimalInProximity, [ProximityStarted] = @ProximityStarted, [ProximityEnded] = @ProximityEnded, [LogDate] = @LogDate
	WHERE  [ProximityId] = @ProximityId
	
	-- Begin Return Select <- do not remove
	SELECT [ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]
	FROM   [dbo].[t_Proximity]
	WHERE  [ProximityId] = @ProximityId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_PublicRegistrarDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_PublicRegistrarDelete] 
    @PublicId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_PublicRegistrar]
	WHERE  [PublicId] = @PublicId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_PublicRegistrarInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_PublicRegistrarInsert] 
    @AnimalId int,
    @RegistrationNumber varchar(50),
    @ModifiedDate datetime,
    @ModifiedBy int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_PublicRegistrar] ([AnimalId], [RegistrationNumber], [ModifiedDate], [ModifiedBy], [Removed])
	SELECT @AnimalId, @RegistrationNumber, @ModifiedDate, @ModifiedBy, @Removed
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_PublicRegistrarSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_PublicRegistrarSelect] 
    @PublicId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [PublicId], [AnimalId], [RegistrationNumber], [ModifiedDate], [ModifiedBy], [Removed] 
	FROM   [dbo].[t_PublicRegistrar] 
	WHERE  ([PublicId] = @PublicId OR @PublicId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_PublicRegistrarUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_PublicRegistrarUpdate] 
    @PublicId int,
    @AnimalId int,
    @RegistrationNumber varchar(50),
    @ModifiedDate datetime,
    @ModifiedBy int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_PublicRegistrar]
	SET    [AnimalId] = @AnimalId, [RegistrationNumber] = @RegistrationNumber, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [Removed] = @Removed
	WHERE  [PublicId] = @PublicId
	
	-- Begin Return Select <- do not remove
	SELECT [PublicId], [AnimalId], [RegistrationNumber], [ModifiedDate], [ModifiedBy], [Removed]
	FROM   [dbo].[t_PublicRegistrar]
	WHERE  [PublicId] = @PublicId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_RelationshipsDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_RelationshipsDelete] 
    @RelationshipId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Relationships]
	WHERE  [RelationshipId] = @RelationshipId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_RelationshipsInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_RelationshipsInsert] 
    @ParentId int,
    @ChildId int,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Relationships] ([ParentId], [ChildId], [ModifiedDate], [ModifiedBy], [Removed])
	SELECT @ParentId, @ChildId, @ModifiedDate, @ModifiedBy, @Removed
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_RelationshipsSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_RelationshipsSelect] 
    @RelationshipId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [RelationshipId], [ParentId], [ChildId], [ModifiedDate], [ModifiedBy], [Removed] 
	FROM   [dbo].[t_Relationships] 
	WHERE  ([RelationshipId] = @RelationshipId OR @RelationshipId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_RelationshipsUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_RelationshipsUpdate] 
    @RelationshipId int,
    @ParentId int,
    @ChildId int,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @Removed bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Relationships]
	SET    [ParentId] = @ParentId, [ChildId] = @ChildId, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [Removed] = @Removed
	WHERE  [RelationshipId] = @RelationshipId
	
	-- Begin Return Select <- do not remove
	SELECT [RelationshipId], [ParentId], [ChildId], [ModifiedDate], [ModifiedBy], [Removed]
	FROM   [dbo].[t_Relationships]
	WHERE  [RelationshipId] = @RelationshipId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_SpermbankDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_SpermbankDelete] 
    @TubeId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Spermbank]
	WHERE  [TubeId] = @TubeId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_SpermbankInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_SpermbankInsert] 
    @AnimalId int,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @Removed bit,
    @CreatedDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Spermbank] ([AnimalId], [ModifiedDate], [ModifiedBy], [Removed], [CreatedDate])
	SELECT @AnimalId, @ModifiedDate, @ModifiedBy, @Removed, @CreatedDate
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_SpermbankSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_SpermbankSelect] 
    @TubeId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [TubeId], [AnimalId], [ModifiedDate], [ModifiedBy], [Removed], [CreatedDate] 
	FROM   [dbo].[t_Spermbank] 
	WHERE  ([TubeId] = @TubeId OR @TubeId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_SpermbankUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_SpermbankUpdate] 
    @TubeId int,
    @AnimalId int,
    @ModifiedDate datetime,
    @ModifiedBy int,
    @Removed bit,
    @CreatedDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Spermbank]
	SET    [AnimalId] = @AnimalId, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [Removed] = @Removed, [CreatedDate] = @CreatedDate
	WHERE  [TubeId] = @TubeId
	
	-- Begin Return Select <- do not remove
	SELECT [TubeId], [AnimalId], [ModifiedDate], [ModifiedBy], [Removed], [CreatedDate]
	FROM   [dbo].[t_Spermbank]
	WHERE  [TubeId] = @TubeId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_TubeHistoryDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_TubeHistoryDelete] 
    @HistoryId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_TubeHistory]
	WHERE  [HistoryId] = @HistoryId

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_TubeHistoryInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_TubeHistoryInsert] 
    @AnimalId int,
    @ModifiedDate datetime,
    @ModifiedBy int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_TubeHistory] ([AnimalId], [ModifiedDate], [ModifiedBy])
	SELECT @AnimalId, @ModifiedDate, @ModifiedBy
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_TubeHistorySelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_TubeHistorySelect] 
    @HistoryId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [HistoryId], [AnimalId], [ModifiedDate], [ModifiedBy] 
	FROM   [dbo].[t_TubeHistory] 
	WHERE  ([HistoryId] = @HistoryId OR @HistoryId IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_TubeHistoryUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_TubeHistoryUpdate] 
    @HistoryId int,
    @AnimalId int,
    @ModifiedDate datetime,
    @ModifiedBy int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_TubeHistory]
	SET    [AnimalId] = @AnimalId, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy
	WHERE  [HistoryId] = @HistoryId
	
	-- Begin Return Select <- do not remove
	SELECT [HistoryId], [AnimalId], [ModifiedDate], [ModifiedBy]
	FROM   [dbo].[t_TubeHistory]
	WHERE  [HistoryId] = @HistoryId	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_UserNoSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_UserNoSelect] 
    @Username varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [UserKey], [UserId], [Username], [Removed], [CreatedDate] 
	FROM   [dbo].[t_Users] 
	WHERE  ([Username] = @Username) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_UsersDelete]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_UsersDelete] 
    @UserKey int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[t_Users]
	WHERE  [UserKey] = @UserKey

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_UsersInsert]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_UsersInsert] 
    @UserId uniqueidentifier,
    @Username varchar(50),
    @Removed bit,
    @CreatedDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[t_Users] ([UserId], [Username], [Removed], [CreatedDate])
	SELECT @UserId, @Username, @Removed, @CreatedDate
	
	-- Begin Return Select <- do not remove
	SELECT CAST(SCOPE_IDENTITY() AS int)
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_UsersSelect]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_UsersSelect] 
    @UserKey int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [UserKey], [UserId], [Username], [Removed], [CreatedDate] 
	FROM   [dbo].[t_Users] 
	WHERE  ([UserKey] = @UserKey OR @UserKey IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_t_UsersUpdate]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_t_UsersUpdate] 
    @UserKey int,
    @UserId uniqueidentifier,
    @Username varchar(50),
    @Removed bit,
    @CreatedDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[t_Users]
	SET    [UserId] = @UserId, [Username] = @Username, [Removed] = @Removed, [CreatedDate] = @CreatedDate
	WHERE  [UserKey] = @UserKey
	
	-- Begin Return Select <- do not remove
	SELECT [UserKey], [UserId], [Username], [Removed], [CreatedDate]
	FROM   [dbo].[t_Users]
	WHERE  [UserKey] = @UserKey	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  Table [dbo].[a_DeviceLinks]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a_DeviceLinks](
	[DeviceLinkId] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NOT NULL,
	[AnimalId] [int] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_a_DeviceLinks] PRIMARY KEY CLUSTERED 
(
	[DeviceLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[l_AnimalTypes]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[l_AnimalTypes](
	[AnimalTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_l_AnimalType] PRIMARY KEY CLUSTERED 
(
	[AnimalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[l_BirthTypes]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[l_BirthTypes](
	[BirthTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_l_BirthTypes] PRIMARY KEY CLUSTERED 
(
	[BirthTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[l_Sexes]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[l_Sexes](
	[SexId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](10) NOT NULL,
 CONSTRAINT [PK_l_Sex] PRIMARY KEY CLUSTERED 
(
	[SexId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Animals]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Animals](
	[AnimalId] [int] IDENTITY(1,1) NOT NULL,
	[AnimalTypeId] [int] NOT NULL,
	[SexId] [int] NOT NULL,
	[DecriptiveName] [varchar](50) NOT NULL,
	[TagNumber] [varchar](5) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_t_Animals] PRIMARY KEY CLUSTERED 
(
	[AnimalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_BirthHistory]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BirthHistory](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[BirthTypeId] [int] NOT NULL,
	[FemaleParentId] [int] NOT NULL,
	[MaleParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL,
	[TubeId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_t_BirthHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Companies]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_t_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Devices]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Devices](
	[DeviceId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](16) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_t_Devices] PRIMARY KEY CLUSTERED 
(
	[DeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Proximity]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Proximity](
	[ProximityId] [int] IDENTITY(1,1) NOT NULL,
	[DeviceConnectedTo] [int] NOT NULL,
	[DeviceInProximity] [int] NOT NULL,
	[AnimalConnectedTo] [int] NOT NULL,
	[AnimalInProximity] [int] NOT NULL,
	[ProximityStarted] [datetime] NOT NULL,
	[ProximityEnded] [datetime] NOT NULL,
	[LogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_t_Proximity] PRIMARY KEY CLUSTERED 
(
	[ProximityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_PublicRegistrar]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_PublicRegistrar](
	[PublicId] [int] IDENTITY(1,1) NOT NULL,
	[AnimalId] [int] NOT NULL,
	[RegistrationNumber] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_t_PublicRegistrar] PRIMARY KEY CLUSTERED 
(
	[PublicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Relationships]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Relationships](
	[RelationshipId] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_t_Relationships] PRIMARY KEY CLUSTERED 
(
	[RelationshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Spermbank]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Spermbank](
	[TubeId] [int] IDENTITY(1,1) NOT NULL,
	[AnimalId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_t_Spermbank] PRIMARY KEY CLUSTERED 
(
	[TubeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_TubeHistory]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TubeHistory](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AnimalId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_t_TubeHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Users]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Users](
	[UserKey] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Removed] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_t_User] PRIMARY KEY CLUSTERED 
(
	[UserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  

GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  

GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  

GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  

GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  

GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  

GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  

GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  

GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 2015-08-21 01:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[a_DeviceLinks] ON 

INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (1, 5, 3, 0, CAST(0x0000A4FA00B907D1 AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (2, 6, 3, 0, CAST(0x0000A4FA00B9B7E6 AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (3, 5, 2, 0, CAST(0x0000A4FA00BC75D2 AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (4, 5, 4, 0, CAST(0x0000A4FA00D1BD6B AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (5, 5, 4, 0, CAST(0x0000A4FA00D3A3EB AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (6, 6, 4, 0, CAST(0x0000A4FA00D3A951 AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (7, 5, 4, 1, CAST(0x0000A4FA00E2735C AS DateTime), 2)
INSERT [dbo].[a_DeviceLinks] ([DeviceLinkId], [DeviceId], [AnimalId], [IsCurrent], [ModifiedDate], [ModifiedBy]) VALUES (8, 6, 5, 1, CAST(0x0000A4FA00E28B02 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[a_DeviceLinks] OFF
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'b77d5696-1239-4ef7-ae00-387b72fa366f', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'b77d5696-1239-4ef7-ae00-387b72fa366f', N'3b1570b0-ef74-4561-bc3d-2aa4aa50b0d0', N'qxta1Y7Hq6KqgqgkstlqzlwBzMo=', 1, N'tprTtd7N3Zh1G3uXEMQXIQ==', NULL, N'rmlombard8@gmail.com', N'rmlombard8@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A4F900C78EB8 AS DateTime), CAST(0x0000A4FB00B770B4 AS DateTime), CAST(0x0000A4F900C78EB8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'b77d5696-1239-4ef7-ae00-387b72fa366f', N'3425c6b2-9fca-457b-8743-6203e57467cd', N'p_Admin', N'p_admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'b77d5696-1239-4ef7-ae00-387b72fa366f', N'ef13f6dc-d0f4-4040-90e7-854754953c20', N'u_Tuks', N'u_tuks', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'b77d5696-1239-4ef7-ae00-387b72fa366f', N'3b1570b0-ef74-4561-bc3d-2aa4aa50b0d0', N'admin', N'admin', NULL, 0, CAST(0x0000A4FB00B770B4 AS DateTime))
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3b1570b0-ef74-4561-bc3d-2aa4aa50b0d0', N'3425c6b2-9fca-457b-8743-6203e57467cd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3b1570b0-ef74-4561-bc3d-2aa4aa50b0d0', N'ef13f6dc-d0f4-4040-90e7-854754953c20')
SET IDENTITY_INSERT [dbo].[l_AnimalTypes] ON 

INSERT [dbo].[l_AnimalTypes] ([AnimalTypeId], [Description]) VALUES (1, N'Nguni')
SET IDENTITY_INSERT [dbo].[l_AnimalTypes] OFF
SET IDENTITY_INSERT [dbo].[l_Sexes] ON 

INSERT [dbo].[l_Sexes] ([SexId], [Description]) VALUES (1, N'Male')
INSERT [dbo].[l_Sexes] ([SexId], [Description]) VALUES (2, N'Female')
SET IDENTITY_INSERT [dbo].[l_Sexes] OFF
SET IDENTITY_INSERT [dbo].[t_Animals] ON 

INSERT [dbo].[t_Animals] ([AnimalId], [AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (1, 1, 1, N'Bestie', N'52', CAST(0x0000A4E700000000 AS DateTime), CAST(0x0000A4FA00B57B97 AS DateTime), CAST(0x0000A4FA00B57B97 AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Animals] ([AnimalId], [AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (2, 1, 1, N'Test', N'12', CAST(0x0000A4E700000000 AS DateTime), CAST(0x0000A4FA00BEF533 AS DateTime), CAST(0x0000A4FA00BEF533 AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Animals] ([AnimalId], [AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (3, 1, 2, N'Betsie', N'80', CAST(0x0000A4E700000000 AS DateTime), CAST(0x0000A4FA00BF0FB4 AS DateTime), CAST(0x0000A4FA00BF0FB4 AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Animals] ([AnimalId], [AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (4, 1, 2, N'Testy', N'56', CAST(0x0000A4E700000000 AS DateTime), CAST(0x0000A4FA00E2735C AS DateTime), CAST(0x0000A4FA00E2735C AS DateTime), 2, 10, 0)
INSERT [dbo].[t_Animals] ([AnimalId], [AnimalTypeId], [SexId], [DecriptiveName], [TagNumber], [BirthDate], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (5, 1, 2, N'Testy se Maatjie', N'12', CAST(0x0000A4E700000000 AS DateTime), CAST(0x0000A4FA00E28B01 AS DateTime), CAST(0x0000A4FA00E28B01 AS DateTime), 2, 10, 0)
SET IDENTITY_INSERT [dbo].[t_Animals] OFF
SET IDENTITY_INSERT [dbo].[t_Companies] ON 

INSERT [dbo].[t_Companies] ([CompanyId], [Name], [RoleId], [Removed]) VALUES (10, N'Tuks', N'ef13f6dc-d0f4-4040-90e7-854754953c20', 0)
SET IDENTITY_INSERT [dbo].[t_Companies] OFF
SET IDENTITY_INSERT [dbo].[t_Devices] ON 

INSERT [dbo].[t_Devices] ([DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (1, N'1', CAST(0x0000A4F900000000 AS DateTime), CAST(0x0000A4F9010DA5B3 AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Devices] ([DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (2, N'21', CAST(0x0000A4F900000000 AS DateTime), CAST(0x0000A4F90106BD20 AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Devices] ([DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (3, N'21123', CAST(0x0000A4F900000000 AS DateTime), CAST(0x0000A4F9010DA2AC AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Devices] ([DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (4, N'2', CAST(0x0000A4F900000000 AS DateTime), CAST(0x0000A4F9010DA027 AS DateTime), 2, 10, 1)
INSERT [dbo].[t_Devices] ([DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (5, N'40BF8A9E', CAST(0x0000A4FA00000000 AS DateTime), CAST(0x0000A4FB00B3EAD1 AS DateTime), 2, 10, 0)
INSERT [dbo].[t_Devices] ([DeviceId], [Address], [CreatedDate], [ModifiedDate], [ModifiedBy], [CompanyId], [Removed]) VALUES (6, N'40BF8B3D', CAST(0x0000A4FA00000000 AS DateTime), CAST(0x0000A4FB00B3F4E8 AS DateTime), 2, 10, 0)
SET IDENTITY_INSERT [dbo].[t_Devices] OFF
SET IDENTITY_INSERT [dbo].[t_Proximity] ON 

INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (1, 5, 6, 4, 5, CAST(0x0000A4FA00EDA225 AS DateTime), CAST(0x0000A4FA00EDA226 AS DateTime), CAST(0x0000A4FA00EDA458 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (2, 5, 6, 4, 5, CAST(0x0000A4FA00EDA225 AS DateTime), CAST(0x0000A4FA00EDBF74 AS DateTime), CAST(0x0000A4FA00EDBF7D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (3, 5, 6, 4, 5, CAST(0x0000A4FA00EDA225 AS DateTime), CAST(0x0000A4FA00EDDCC5 AS DateTime), CAST(0x0000A4FA00EDDCC9 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (4, 5, 6, 4, 5, CAST(0x0000A4FB00B4FBE2 AS DateTime), CAST(0x0000A4FB00B52F59 AS DateTime), CAST(0x0000A4FB00B52F73 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (5, 5, 6, 4, 5, CAST(0x0000A4FB00B630D2 AS DateTime), CAST(0x0000A4FB00B6533B AS DateTime), CAST(0x0000A4FB00B6537B AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (6, 5, 6, 4, 5, CAST(0x0000A4FB00B8788F AS DateTime), CAST(0x0000A4FB00B8923F AS DateTime), CAST(0x0000A4FB00B89248 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (7, 5, 6, 4, 5, CAST(0x0000A4FB00B9AD9F AS DateTime), CAST(0x0000A4FB00B9E10A AS DateTime), CAST(0x0000A4FB00B9E114 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (8, 6, 5, 5, 4, CAST(0x0000A4FB00BAF62F AS DateTime), CAST(0x0000A4FB00BAFEC4 AS DateTime), CAST(0x0000A4FB00BAFEC9 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (9, 5, 6, 4, 5, CAST(0x0000A4FB00BAF3A0 AS DateTime), CAST(0x0000A4FB00BB2FCA AS DateTime), CAST(0x0000A4FB00BB2FCD AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (10, 5, 6, 4, 5, CAST(0x0000A4FB00BBCA49 AS DateTime), CAST(0x0000A4FB00BBE3F5 AS DateTime), CAST(0x0000A4FB00BBE3FA AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (11, 6, 5, 5, 4, CAST(0x0000A4FB00BBCB6E AS DateTime), CAST(0x0000A4FB00BC473A AS DateTime), CAST(0x0000A4FB00BC4740 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (12, 5, 6, 4, 5, CAST(0x0000A4FB00BC7E7F AS DateTime), CAST(0x0000A4FB00BCA0C8 AS DateTime), CAST(0x0000A4FB00BCA0CC AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (13, 6, 5, 5, 4, CAST(0x0000A4FB00BC7ACB AS DateTime), CAST(0x0000A4FB00BCDD01 AS DateTime), CAST(0x0000A4FB00BCDD04 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (14, 5, 6, 4, 5, CAST(0x0000A4FB00BCE590 AS DateTime), CAST(0x0000A4FB00BD1075 AS DateTime), CAST(0x0000A4FB00BD1078 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (15, 6, 5, 5, 4, CAST(0x0000A4FB00BCE59A AS DateTime), CAST(0x0000A4FB00BD1087 AS DateTime), CAST(0x0000A4FB00BD108A AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (16, 6, 5, 5, 4, CAST(0x0000A4FB00BD21B5 AS DateTime), CAST(0x0000A4FB00BD6674 AS DateTime), CAST(0x0000A4FB00BD6676 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (17, 5, 6, 4, 5, CAST(0x0000A4FB00BD1904 AS DateTime), CAST(0x0000A4FB00BD6EE2 AS DateTime), CAST(0x0000A4FB00BD6EE5 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (18, 6, 5, 5, 4, CAST(0x0000A4FB00BDC951 AS DateTime), CAST(0x0000A4FB00BDDA9D AS DateTime), CAST(0x0000A4FB00BDDAA6 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (19, 5, 6, 4, 5, CAST(0x0000A4FB00BDC4BC AS DateTime), CAST(0x0000A4FB00BDDE79 AS DateTime), CAST(0x0000A4FB00BDDE81 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (20, 5, 6, 4, 5, CAST(0x0000A4FB00BE11EE AS DateTime), CAST(0x0000A4FB00BE1A83 AS DateTime), CAST(0x0000A4FB00BE1A8D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (21, 6, 5, 5, 4, CAST(0x0000A4FB00BE4697 AS DateTime), CAST(0x0000A4FB00BE93D0 AS DateTime), CAST(0x0000A4FB00BE93D9 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (22, 6, 5, 5, 4, CAST(0x0000A4FB00BE9C66 AS DateTime), CAST(0x0000A4FB00BEE120 AS DateTime), CAST(0x0000A4FB00BEE12B AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (23, 6, 5, 5, 4, CAST(0x0000A4FB00BEE9B6 AS DateTime), CAST(0x0000A4FB00BEF24F AS DateTime), CAST(0x0000A4FB00BEF257 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (24, 5, 6, 4, 5, CAST(0x0000A4FB00BE2314 AS DateTime), CAST(0x0000A4FB00BF1381 AS DateTime), CAST(0x0000A4FB00BF1388 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (25, 6, 5, 5, 4, CAST(0x0000A4FB00BEFB02 AS DateTime), CAST(0x0000A4FB00BF2E70 AS DateTime), CAST(0x0000A4FB00BF2E7A AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (26, 6, 5, 5, 4, CAST(0x0000A4FB00BF36FA AS DateTime), CAST(0x0000A4FB00BF4842 AS DateTime), CAST(0x0000A4FB00BF484B AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (27, 6, 5, 5, 4, CAST(0x0000A4FB00BF50E6 AS DateTime), CAST(0x0000A4FB00BF6AA7 AS DateTime), CAST(0x0000A4FB00BF6AAE AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (28, 6, 5, 5, 4, CAST(0x0000A4FB00BF7BC6 AS DateTime), CAST(0x0000A4FB00BF8CF1 AS DateTime), CAST(0x0000A4FB00BF8CFA AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (29, 5, 6, 4, 5, CAST(0x0000A4FB00BF1C27 AS DateTime), CAST(0x0000A4FB00BFD04C AS DateTime), CAST(0x0000A4FB00BFD053 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (30, 6, 5, 5, 4, CAST(0x0000A4FB00BFA6C0 AS DateTime), CAST(0x0000A4FB00BFF427 AS DateTime), CAST(0x0000A4FB00BFF42E AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (31, 6, 5, 5, 4, CAST(0x0000A4FB00BFFCAC AS DateTime), CAST(0x0000A4FB00C00542 AS DateTime), CAST(0x0000A4FB00C0054B AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (32, 6, 5, 5, 4, CAST(0x0000A4FB00C00DD7 AS DateTime), CAST(0x0000A4FB00C0166B AS DateTime), CAST(0x0000A4FB00C01674 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (33, 6, 5, 5, 4, CAST(0x0000A4FB00C027BE AS DateTime), CAST(0x0000A4FB00C038DE AS DateTime), CAST(0x0000A4FB00C038E7 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (34, 5, 6, 4, 5, CAST(0x0000A4FB00BFD8EC AS DateTime), CAST(0x0000A4FB00C0511B AS DateTime), CAST(0x0000A4FB00C05122 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (35, 6, 5, 5, 4, CAST(0x0000A4FB00C04A08 AS DateTime), CAST(0x0000A4FB00C052AC AS DateTime), CAST(0x0000A4FB00C052B0 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (36, 6, 5, 5, 4, CAST(0x0000A4FB00C05B49 AS DateTime), CAST(0x0000A4FB00C0976B AS DateTime), CAST(0x0000A4FB00C09772 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (37, 6, 5, 5, 4, CAST(0x0000A4FB00C0B129 AS DateTime), CAST(0x0000A4FB00C0C263 AS DateTime), CAST(0x0000A4FB00C0C26D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (38, 5, 6, 4, 5, CAST(0x0000A4FB00C059A1 AS DateTime), CAST(0x0000A4FB00C0DA70 AS DateTime), CAST(0x0000A4FB00C0DA79 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (39, 5, 6, 4, 5, CAST(0x0000A4FB00C0F436 AS DateTime), CAST(0x0000A4FB00C1169A AS DateTime), CAST(0x0000A4FB00C116A4 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (40, 6, 5, 5, 4, CAST(0x0000A4FB00C0D37F AS DateTime), CAST(0x0000A4FB00C148E8 AS DateTime), CAST(0x0000A4FB00C148EF AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (41, 5, 6, 4, 5, CAST(0x0000A4FB00C1A878 AS DateTime), CAST(0x0000A4FB00C1CADA AS DateTime), CAST(0x0000A4FB00C1CAE2 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (42, 5, 6, 4, 5, CAST(0x0000A4FB00C1E484 AS DateTime), CAST(0x0000A4FB00C1ED19 AS DateTime), CAST(0x0000A4FB00C1ED21 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (43, 5, 6, 4, 5, CAST(0x0000A4FB00C1FE3F AS DateTime), CAST(0x0000A4FB00C206D2 AS DateTime), CAST(0x0000A4FB00C206D4 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (44, 5, 6, 4, 5, CAST(0x0000A4FB00C20F6A AS DateTime), CAST(0x0000A4FB00C217FF AS DateTime), CAST(0x0000A4FB00C2180A AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (45, 5, 6, 4, 5, CAST(0x0000A4FB00C22925 AS DateTime), CAST(0x0000A4FB00C23A6D AS DateTime), CAST(0x0000A4FB00C23A75 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (46, 5, 6, 4, 5, CAST(0x0000A4FB00C2430D AS DateTime), CAST(0x0000A4FB00C24B93 AS DateTime), CAST(0x0000A4FB00C24B9C AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (47, 5, 6, 4, 5, CAST(0x0000A4FB00C25428 AS DateTime), CAST(0x0000A4FB00C25CB8 AS DateTime), CAST(0x0000A4FB00C25CC1 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (48, 5, 6, 4, 5, CAST(0x0000A4FB00C26DEC AS DateTime), CAST(0x0000A4FB00C27F09 AS DateTime), CAST(0x0000A4FB00C27F10 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (49, 5, 6, 4, 5, CAST(0x0000A4FB00C28799 AS DateTime), CAST(0x0000A4FB00C29040 AS DateTime), CAST(0x0000A4FB00C29048 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (50, 5, 6, 4, 5, CAST(0x0000A4FB00C2A155 AS DateTime), CAST(0x0000A4FB00C2A9EA AS DateTime), CAST(0x0000A4FB00C2A9F3 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (51, 5, 6, 4, 5, CAST(0x0000A4FB00C2B280 AS DateTime), CAST(0x0000A4FB00C2BB3C AS DateTime), CAST(0x0000A4FB00C2BB45 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (52, 5, 6, 4, 5, CAST(0x0000A4FB00C2C3A5 AS DateTime), CAST(0x0000A4FB00C2CC39 AS DateTime), CAST(0x0000A4FB00C2CC3F AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (53, 5, 6, 4, 5, CAST(0x0000A4FB00C2D4E8 AS DateTime), CAST(0x0000A4FB00C2F735 AS DateTime), CAST(0x0000A4FB00C2F73C AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (54, 5, 6, 4, 5, CAST(0x0000A4FB00C2FFCA AS DateTime), CAST(0x0000A4FB00C32216 AS DateTime), CAST(0x0000A4FB00C3221D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (55, 5, 6, 4, 5, CAST(0x0000A4FB00C366CE AS DateTime), CAST(0x0000A4FB00C36F64 AS DateTime), CAST(0x0000A4FB00C36F6C AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (56, 5, 6, 4, 5, CAST(0x0000A4FB00C377F9 AS DateTime), CAST(0x0000A4FB00C3891F AS DateTime), CAST(0x0000A4FB00C38928 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (57, 5, 6, 4, 5, CAST(0x0000A4FB00C391AF AS DateTime), CAST(0x0000A4FB00C3AB6B AS DateTime), CAST(0x0000A4FB00C3AB73 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (58, 5, 6, 4, 5, CAST(0x0000A4FB00C3B400 AS DateTime), CAST(0x0000A4FB00C3BC96 AS DateTime), CAST(0x0000A4FB00C3BC9F AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (59, 5, 6, 4, 5, CAST(0x0000A4FB00C3D651 AS DateTime), CAST(0x0000A4FB00C3E77B AS DateTime), CAST(0x0000A4FB00C3E783 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (60, 6, 5, 5, 4, CAST(0x0000A4FB00C1D14B AS DateTime), CAST(0x0000A4FB00C3FFDE AS DateTime), CAST(0x0000A4FB00C3FFE7 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (61, 5, 6, 4, 5, CAST(0x0000A4FB00C3F8B3 AS DateTime), CAST(0x0000A4FB00C4014D AS DateTime), CAST(0x0000A4FB00C40151 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (62, 5, 6, 4, 5, CAST(0x0000A4FB00C409E4 AS DateTime), CAST(0x0000A4FB00C445EB AS DateTime), CAST(0x0000A4FB00C445F3 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (63, 5, 6, 4, 5, CAST(0x0000A4FB00C45726 AS DateTime), CAST(0x0000A4FB00C45FA6 AS DateTime), CAST(0x0000A4FB00C45FAF AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (64, 5, 6, 4, 5, CAST(0x0000A4FB00C4683B AS DateTime), CAST(0x0000A4FB00C470CC AS DateTime), CAST(0x0000A4FB00C470D1 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (65, 5, 6, 4, 5, CAST(0x0000A4FB00C47972 AS DateTime), CAST(0x0000A4FB00C48AA6 AS DateTime), CAST(0x0000A4FB00C48AAD AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (66, 5, 6, 4, 5, CAST(0x0000A4FB00C4B595 AS DateTime), CAST(0x0000A4FB00C4BE25 AS DateTime), CAST(0x0000A4FB00C4BE2D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (67, 5, 6, 4, 5, CAST(0x0000A4FB00C4C6AB AS DateTime), CAST(0x0000A4FB00C4D7E6 AS DateTime), CAST(0x0000A4FB00C4D7F0 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (68, 5, 6, 4, 5, CAST(0x0000A4FB00C4E077 AS DateTime), CAST(0x0000A4FB00C55010 AS DateTime), CAST(0x0000A4FB00C5501C AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (69, 5, 6, 4, 5, CAST(0x0000A4FB00C55890 AS DateTime), CAST(0x0000A4FB00C569CB AS DateTime), CAST(0x0000A4FB00C569D4 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (70, 5, 6, 4, 5, CAST(0x0000A4FB00C5725E AS DateTime), CAST(0x0000A4FB00C58393 AS DateTime), CAST(0x0000A4FB00C5839B AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (71, 5, 6, 4, 5, CAST(0x0000A4FB00C59D49 AS DateTime), CAST(0x0000A4FB00C5A5EA AS DateTime), CAST(0x0000A4FB00C5A5F2 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (72, 5, 6, 4, 5, CAST(0x0000A4FB00C5AE85 AS DateTime), CAST(0x0000A4FB00C5EA7B AS DateTime), CAST(0x0000A4FB00C5EA84 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (73, 5, 6, 4, 5, CAST(0x0000A4FB00C5F309 AS DateTime), CAST(0x0000A4FB00C5FBB2 AS DateTime), CAST(0x0000A4FB00C5FBBB AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (74, 5, 6, 4, 5, CAST(0x0000A4FB00C6044E AS DateTime), CAST(0x0000A4FB00C60CE3 AS DateTime), CAST(0x0000A4FB00C60CEC AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (75, 5, 6, 4, 5, CAST(0x0000A4FB00C61E09 AS DateTime), CAST(0x0000A4FB00C6269F AS DateTime), CAST(0x0000A4FB00C626A8 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (76, 5, 6, 4, 5, CAST(0x0000A4FB00C62F3F AS DateTime), CAST(0x0000A4FB00C6517F AS DateTime), CAST(0x0000A4FB00C65185 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (77, 5, 6, 4, 5, CAST(0x0000A4FB00C66B36 AS DateTime), CAST(0x0000A4FB00C673D0 AS DateTime), CAST(0x0000A4FB00C673D8 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (78, 5, 6, 4, 5, CAST(0x0000A4FB00C6850E AS DateTime), CAST(0x0000A4FB00C68DA4 AS DateTime), CAST(0x0000A4FB00C68DAC AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (79, 5, 6, 4, 5, CAST(0x0000A4FB00C69634 AS DateTime), CAST(0x0000A4FB00C69EC9 AS DateTime), CAST(0x0000A4FB00C69ED2 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (80, 6, 5, 5, 4, CAST(0x0000A4FB00C4089F AS DateTime), CAST(0x0000A4FB00C6AEFF AS DateTime), CAST(0x0000A4FB00C6AF08 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (81, 5, 6, 4, 5, CAST(0x0000A4FB00C6A769 AS DateTime), CAST(0x0000A4FB00C6EBF6 AS DateTime), CAST(0x0000A4FB00C6EBFF AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (82, 5, 6, 4, 5, CAST(0x0000A4FB00C705B3 AS DateTime), CAST(0x0000A4FB00C71F87 AS DateTime), CAST(0x0000A4FB00C71F8A AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (83, 5, 6, 4, 5, CAST(0x0000A4FB00C741DA AS DateTime), CAST(0x0000A4FB00C74A6F AS DateTime), CAST(0x0000A4FB00C74A77 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (84, 5, 6, 4, 5, CAST(0x0000A4FB00C752FD AS DateTime), CAST(0x0000A4FB00C77560 AS DateTime), CAST(0x0000A4FB00C77569 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (85, 6, 5, 5, 4, CAST(0x0000A4FB00C6B798 AS DateTime), CAST(0x0000A4FB00C7A82B AS DateTime), CAST(0x0000A4FB00C7A832 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (86, 5, 6, 4, 5, CAST(0x0000A4FB00C797A1 AS DateTime), CAST(0x0000A4FB00C7CB17 AS DateTime), CAST(0x0000A4FB00C7CB1F AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (87, 5, 6, 4, 5, CAST(0x0000A4FB00C7ED84 AS DateTime), CAST(0x0000A4FB00C8073F AS DateTime), CAST(0x0000A4FB00C80748 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (88, 5, 6, 4, 5, CAST(0x0000A4FB00C80FE0 AS DateTime), CAST(0x0000A4FB00C81875 AS DateTime), CAST(0x0000A4FB00C8187D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (89, 5, 6, 4, 5, CAST(0x0000A4FB00C8210A AS DateTime), CAST(0x0000A4FB00C829A1 AS DateTime), CAST(0x0000A4FB00C829A9 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (90, 6, 5, 5, 4, CAST(0x0000A4FB00C7B0AF AS DateTime), CAST(0x0000A4FB00C842B1 AS DateTime), CAST(0x0000A4FB00C842BB AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (91, 5, 6, 4, 5, CAST(0x0000A4FB00C83220 AS DateTime), CAST(0x0000A4FB00C84BDB AS DateTime), CAST(0x0000A4FB00C84BE4 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (92, 5, 6, 4, 5, CAST(0x0000A4FB00C85471 AS DateTime), CAST(0x0000A4FB00C85D01 AS DateTime), CAST(0x0000A4FB00C85D0A AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (93, 5, 6, 4, 5, CAST(0x0000A4FB00C87F6F AS DateTime), CAST(0x0000A4FB00C8AA55 AS DateTime), CAST(0x0000A4FB00C8AA5F AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (94, 6, 5, 5, 4, CAST(0x0000A4FB00D0A451 AS DateTime), CAST(0x0000A4FB00D0B578 AS DateTime), CAST(0x0000A4FB00D0B590 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (95, 5, 6, 4, 5, CAST(0x0000A4FB00D0A50A AS DateTime), CAST(0x0000A4FB00D0B63B AS DateTime), CAST(0x0000A4FB00D0B644 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (96, 5, 6, 4, 5, CAST(0x0000A4FB00D0E9C5 AS DateTime), CAST(0x0000A4FB00D0F258 AS DateTime), CAST(0x0000A4FB00D0F261 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (97, 5, 6, 4, 5, CAST(0x0000A4FB00D12E67 AS DateTime), CAST(0x0000A4FB00D13F8D AS DateTime), CAST(0x0000A4FB00D13F97 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (98, 5, 6, 4, 5, CAST(0x0000A4FB00D18CDC AS DateTime), CAST(0x0000A4FB00D1A694 AS DateTime), CAST(0x0000A4FB00D1A69D AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (99, 6, 5, 5, 4, CAST(0x0000A4FB00D20F1C AS DateTime), CAST(0x0000A4FB00D2290B AS DateTime), CAST(0x0000A4FB00D22914 AS DateTime))
GO
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (100, 5, 6, 4, 5, CAST(0x0000A4FB00D1EB38 AS DateTime), CAST(0x0000A4FB00D249AA AS DateTime), CAST(0x0000A4FB00D249AF AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (101, 5, 6, 4, 5, CAST(0x0000A4FB00D296F7 AS DateTime), CAST(0x0000A4FB00D2F56D AS DateTime), CAST(0x0000A4FB00D2F572 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (102, 6, 5, 5, 4, CAST(0x0000A4FB00D2BDB8 AS DateTime), CAST(0x0000A4FB00D334DF AS DateTime), CAST(0x0000A4FB00D334E4 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (103, 5, 6, 4, 5, CAST(0x0000A4FB00D852CB AS DateTime), CAST(0x0000A4FB00D85B4D AS DateTime), CAST(0x0000A4FB00D85B56 AS DateTime))
INSERT [dbo].[t_Proximity] ([ProximityId], [DeviceConnectedTo], [DeviceInProximity], [AnimalConnectedTo], [AnimalInProximity], [ProximityStarted], [ProximityEnded], [LogDate]) VALUES (104, 5, 6, 4, 5, CAST(0x0000A4FB00D86C90 AS DateTime), CAST(0x0000A4FB00D87525 AS DateTime), CAST(0x0000A4FB00D8752A AS DateTime))
SET IDENTITY_INSERT [dbo].[t_Proximity] OFF
SET IDENTITY_INSERT [dbo].[t_Users] ON 

INSERT [dbo].[t_Users] ([UserKey], [UserId], [Username], [Removed], [CreatedDate]) VALUES (2, N'3b1570b0-ef74-4561-bc3d-2aa4aa50b0d0', N'admin', 0, CAST(0x0000A4F900E88498 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_Users] OFF
/****** Object:  Index [PK__aspnet_A__C93A4C9876264AA3]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE4703C2425]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__309103315E94D27B]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4DC3855D76]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58900CDC26]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC069DA581E7]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1BDEF7F34D]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4DCDE51D7D]    Script Date: 2015-08-21 01:09:41 PM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 2015-08-21 01:09:41 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[a_DeviceLinks]  WITH CHECK ADD  CONSTRAINT [FK_a_DeviceLinks_t_Animals] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[a_DeviceLinks] CHECK CONSTRAINT [FK_a_DeviceLinks_t_Animals]
GO
ALTER TABLE [dbo].[a_DeviceLinks]  WITH CHECK ADD  CONSTRAINT [FK_a_DeviceLinks_t_Devices] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[t_Devices] ([DeviceId])
GO
ALTER TABLE [dbo].[a_DeviceLinks] CHECK CONSTRAINT [FK_a_DeviceLinks_t_Devices]
GO
ALTER TABLE [dbo].[a_DeviceLinks]  WITH CHECK ADD  CONSTRAINT [FK_a_DeviceLinks_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[a_DeviceLinks] CHECK CONSTRAINT [FK_a_DeviceLinks_t_Users]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[t_Animals]  WITH CHECK ADD  CONSTRAINT [FK_t_Animals_l_AnimalTypes] FOREIGN KEY([AnimalTypeId])
REFERENCES [dbo].[l_AnimalTypes] ([AnimalTypeId])
GO
ALTER TABLE [dbo].[t_Animals] CHECK CONSTRAINT [FK_t_Animals_l_AnimalTypes]
GO
ALTER TABLE [dbo].[t_Animals]  WITH CHECK ADD  CONSTRAINT [FK_t_Animals_l_Sexes] FOREIGN KEY([SexId])
REFERENCES [dbo].[l_Sexes] ([SexId])
GO
ALTER TABLE [dbo].[t_Animals] CHECK CONSTRAINT [FK_t_Animals_l_Sexes]
GO
ALTER TABLE [dbo].[t_Animals]  WITH CHECK ADD  CONSTRAINT [FK_t_Animals_t_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[t_Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[t_Animals] CHECK CONSTRAINT [FK_t_Animals_t_Companies]
GO
ALTER TABLE [dbo].[t_Animals]  WITH CHECK ADD  CONSTRAINT [FK_t_Animals_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_Animals] CHECK CONSTRAINT [FK_t_Animals_t_Users]
GO
ALTER TABLE [dbo].[t_BirthHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_BirthHistory_l_BirthTypes] FOREIGN KEY([BirthTypeId])
REFERENCES [dbo].[l_BirthTypes] ([BirthTypeId])
GO
ALTER TABLE [dbo].[t_BirthHistory] CHECK CONSTRAINT [FK_t_BirthHistory_l_BirthTypes]
GO
ALTER TABLE [dbo].[t_BirthHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_BirthHistory_t_Animals_Child] FOREIGN KEY([ChildId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_BirthHistory] CHECK CONSTRAINT [FK_t_BirthHistory_t_Animals_Child]
GO
ALTER TABLE [dbo].[t_BirthHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_BirthHistory_t_Animals_Female_Parent] FOREIGN KEY([FemaleParentId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_BirthHistory] CHECK CONSTRAINT [FK_t_BirthHistory_t_Animals_Female_Parent]
GO
ALTER TABLE [dbo].[t_BirthHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_BirthHistory_t_Animals_Male_Parent] FOREIGN KEY([MaleParentId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_BirthHistory] CHECK CONSTRAINT [FK_t_BirthHistory_t_Animals_Male_Parent]
GO
ALTER TABLE [dbo].[t_BirthHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_BirthHistory_t_Spermbank] FOREIGN KEY([HistoryId])
REFERENCES [dbo].[t_Spermbank] ([TubeId])
GO
ALTER TABLE [dbo].[t_BirthHistory] CHECK CONSTRAINT [FK_t_BirthHistory_t_Spermbank]
GO
ALTER TABLE [dbo].[t_BirthHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_BirthHistory_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_BirthHistory] CHECK CONSTRAINT [FK_t_BirthHistory_t_Users]
GO
ALTER TABLE [dbo].[t_Companies]  WITH CHECK ADD  CONSTRAINT [FK_t_Company_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[t_Companies] CHECK CONSTRAINT [FK_t_Company_aspnet_Roles]
GO
ALTER TABLE [dbo].[t_Devices]  WITH CHECK ADD  CONSTRAINT [FK_t_Devices_t_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[t_Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[t_Devices] CHECK CONSTRAINT [FK_t_Devices_t_Companies]
GO
ALTER TABLE [dbo].[t_Devices]  WITH CHECK ADD  CONSTRAINT [FK_t_Devices_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_Devices] CHECK CONSTRAINT [FK_t_Devices_t_Users]
GO
ALTER TABLE [dbo].[t_Proximity]  WITH CHECK ADD  CONSTRAINT [FK_t_Proximity_t_Animals_Connected_To] FOREIGN KEY([AnimalConnectedTo])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_Proximity] CHECK CONSTRAINT [FK_t_Proximity_t_Animals_Connected_To]
GO
ALTER TABLE [dbo].[t_Proximity]  WITH CHECK ADD  CONSTRAINT [FK_t_Proximity_t_Animals_In_Proximity] FOREIGN KEY([AnimalInProximity])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_Proximity] CHECK CONSTRAINT [FK_t_Proximity_t_Animals_In_Proximity]
GO
ALTER TABLE [dbo].[t_Proximity]  WITH CHECK ADD  CONSTRAINT [FK_t_Proximity_t_Devices_Connected_To] FOREIGN KEY([DeviceConnectedTo])
REFERENCES [dbo].[t_Devices] ([DeviceId])
GO
ALTER TABLE [dbo].[t_Proximity] CHECK CONSTRAINT [FK_t_Proximity_t_Devices_Connected_To]
GO
ALTER TABLE [dbo].[t_Proximity]  WITH CHECK ADD  CONSTRAINT [FK_t_Proximity_t_Devices_In_Proximity] FOREIGN KEY([DeviceInProximity])
REFERENCES [dbo].[t_Devices] ([DeviceId])
GO
ALTER TABLE [dbo].[t_Proximity] CHECK CONSTRAINT [FK_t_Proximity_t_Devices_In_Proximity]
GO
ALTER TABLE [dbo].[t_PublicRegistrar]  WITH CHECK ADD  CONSTRAINT [FK_t_PublicRegistrar_t_Animals] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_PublicRegistrar] CHECK CONSTRAINT [FK_t_PublicRegistrar_t_Animals]
GO
ALTER TABLE [dbo].[t_PublicRegistrar]  WITH CHECK ADD  CONSTRAINT [FK_t_PublicRegistrar_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_PublicRegistrar] CHECK CONSTRAINT [FK_t_PublicRegistrar_t_Users]
GO
ALTER TABLE [dbo].[t_Relationships]  WITH CHECK ADD  CONSTRAINT [FK_t_Relationships_t_Animals_Child] FOREIGN KEY([ChildId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_Relationships] CHECK CONSTRAINT [FK_t_Relationships_t_Animals_Child]
GO
ALTER TABLE [dbo].[t_Relationships]  WITH CHECK ADD  CONSTRAINT [FK_t_Relationships_t_Animals_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_Relationships] CHECK CONSTRAINT [FK_t_Relationships_t_Animals_Parent]
GO
ALTER TABLE [dbo].[t_Relationships]  WITH CHECK ADD  CONSTRAINT [FK_t_Relationships_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_Relationships] CHECK CONSTRAINT [FK_t_Relationships_t_Users]
GO
ALTER TABLE [dbo].[t_Spermbank]  WITH CHECK ADD  CONSTRAINT [FK_t_Spermbank_t_Animals] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_Spermbank] CHECK CONSTRAINT [FK_t_Spermbank_t_Animals]
GO
ALTER TABLE [dbo].[t_Spermbank]  WITH CHECK ADD  CONSTRAINT [FK_t_Spermbank_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_Spermbank] CHECK CONSTRAINT [FK_t_Spermbank_t_Users]
GO
ALTER TABLE [dbo].[t_TubeHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_TubeHistory_t_Animals] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[t_Animals] ([AnimalId])
GO
ALTER TABLE [dbo].[t_TubeHistory] CHECK CONSTRAINT [FK_t_TubeHistory_t_Animals]
GO
ALTER TABLE [dbo].[t_TubeHistory]  WITH CHECK ADD  CONSTRAINT [FK_t_TubeHistory_t_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[t_Users] ([UserKey])
GO
ALTER TABLE [dbo].[t_TubeHistory] CHECK CONSTRAINT [FK_t_TubeHistory_t_Users]
GO
ALTER TABLE [dbo].[t_Users]  WITH CHECK ADD  CONSTRAINT [FK_t_User_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[t_Users] CHECK CONSTRAINT [FK_t_User_aspnet_Users]
GO
USE [master]
GO
ALTER DATABASE [Wetu] SET  READ_WRITE 
GO
