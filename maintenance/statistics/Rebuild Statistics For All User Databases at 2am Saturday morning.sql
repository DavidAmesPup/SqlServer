
/*

	This script will create an agent job to rebuild modified statistics for all user databases at 2am on Saturday mornings.  
	Results are logged to the MASTER.CommandLog table

	It is dependent on /lib/PUP-Ola Hallengren Index Management.sql

*/

EXECUTE [dbo].[IndexOptimize]
    @Databases = 'USER_DATABASES' ,
    @FragmentationLow = NULL ,
    @FragmentationMedium = NULL ,
    @FragmentationHigh = NULL ,
    @UpdateStatistics = 'ALL' ,
    @OnlyModifiedStatistics = N'Y' ,
    @LogToTable = N'Y';