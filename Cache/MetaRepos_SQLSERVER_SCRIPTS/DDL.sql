
DROP TABLE ObjectDiff
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'ObjectDiff'
go

CREATE TABLE ObjectDiff(
ReposName1   VARCHAR(50) NOT NULL , 
ReposName2   VARCHAR(50) NOT NULL , 
ObjectName1   VARCHAR(50) NOT NULL , 
ObjectName2   VARCHAR(50) NOT NULL , 
ObjectType   VARCHAR(50) NOT NULL , 
DiffComment   VARCHAR(250) NULL , 
Total_1_Line_Cnt   SMALLINT NULL , 
Total_2_Line_Cnt   SMALLINT NULL , 
Line_Cnt_Diff   SMALLINT NULL , 
Total_1_Method_Cnt   SMALLINT NULL , 
Total_2_Method_Cnt   SMALLINT NULL , 
Method_Cnt_Diff   SMALLINT NULL  )
go

ALTER TABLE ObjectDiff ADD CONSTRAINT PKObjectDiff_ObjectDiffReposNa PRIMARY KEY( 
ReposName1, 
ObjectName1, 
ReposName2, 
ObjectName2, 
ObjectType)
go

GRANT ALL ON ObjectDiff TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('ObjectDiff','2003-04-02 13:00:38','2003-04-02 13:00:38')
go


DROP TABLE ReposDiff
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'ReposDiff'
go

CREATE TABLE ReposDiff(
ReposName1   VARCHAR(50) NOT NULL , 
ReposName2   VARCHAR(50) NOT NULL , 
Repos1Version   VARCHAR(50) NULL , 
Repos2Version   VARCHAR(50) NULL  )
go

ALTER TABLE ReposDiff ADD CONSTRAINT PKReposDiffPkey_ReposDiffRepos PRIMARY KEY( 
ReposName1, 
ReposName2)
go

GRANT ALL ON ReposDiff TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('ReposDiff','2003-07-05 17:29:43','2003-07-05 17:29:43')
go


DROP TABLE Object_JN_Group
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Object_JN_Group'
go

CREATE TABLE Object_JN_Group(
GroupName   VARCHAR(100) NOT NULL , 
RepositoryName   VARCHAR(50) NOT NULL , 
ObjectName   VARCHAR(50) NOT NULL , 
ObjectType   VARCHAR(12) NOT NULL  )
go

ALTER TABLE Object_JN_Group ADD CONSTRAINT PKDataObjectGroupPkey_Object_J PRIMARY KEY( 
RepositoryName, 
GroupName, 
ObjectName, 
ObjectType)
go

GRANT ALL ON Object_JN_Group TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Object_JN_Group','2003-04-02 12:59:53','2003-04-02 12:59:53')
go


DROP TABLE Groups
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Groups'
go

CREATE TABLE Groups(
GroupName   VARCHAR(100) NOT NULL , 
ParentGroupName   VARCHAR(50) NULL , 
RepositoryName   VARCHAR(50) NOT NULL , 
ParentRepositoryName   VARCHAR(50) NULL , 
OwnerID   VARCHAR(50) NULL  )
go

ALTER TABLE Groups ADD CONSTRAINT PKGroupPkey_GroupsRepositoryNa PRIMARY KEY( 
RepositoryName, 
GroupName)
go

GRANT ALL ON Groups TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Groups','2003-04-02 12:59:06','2003-04-02 12:59:06')
go


DROP TABLE Owner
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Owner'
go

CREATE TABLE Owner(
OwnerID   VARCHAR(50) NOT NULL , 
OwnerName   VARCHAR(150) NULL , 
Email   VARCHAR(75) NULL , 
Phone   VARCHAR(50) NULL  )
go

ALTER TABLE Owner ADD CONSTRAINT PKEY_OWNER_OwnerOwnerID_ PRIMARY KEY( 
OwnerID)
go

GRANT ALL ON Owner TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Owner','2003-04-02 13:01:09','2003-04-02 13:01:09')
go


DROP TABLE WFTransition
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'WFTransition'
go

CREATE TABLE WFTransition(
TemplateName   VARCHAR(50) NOT NULL , 
SourceActivityName   VARCHAR(50) NOT NULL , 
TargetActivityName   VARCHAR(50) NOT NULL , 
Condition   VARCHAR(250) NULL , 
Action   VARCHAR(250) NULL  )
go

ALTER TABLE WFTransition ADD CONSTRAINT PKPkeyWFTransition_WFTransitio PRIMARY KEY( 
TemplateName, 
SourceActivityName, 
TargetActivityName)
go

GRANT ALL ON WFTransition TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('WFTransition','2003-09-30 20:16:51','2003-09-30 20:16:51')
go


DROP TABLE Activity
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Activity'
go

CREATE TABLE Activity(
TemplateName   VARCHAR(50) NOT NULL , 
ActivityName   VARCHAR(50) NOT NULL , 
IsStart   BIT NOT NULL , 
IsEnd   BIT NOT NULL  )
go

ALTER TABLE Activity ADD CONSTRAINT PK_Activity_ActivityTemplateNa PRIMARY KEY( 
TemplateName, 
ActivityName)
go

GRANT ALL ON Activity TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Activity','2003-09-30 20:12:21','2003-09-30 20:12:21')
go


DROP TABLE Template
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Template'
go

CREATE TABLE Template(
TemplateName   VARCHAR(50) NOT NULL  )
go

ALTER TABLE Template ADD CONSTRAINT PK_Template_TemplateTemplateNa PRIMARY KEY( 
TemplateName)
go

GRANT ALL ON Template TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Template','2003-09-30 10:55:42','2003-09-30 10:55:42')
go


DROP TABLE Action
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Action'
go

CREATE TABLE Action(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
ActionName   VARCHAR(50) NOT NULL , 
ActionToPerform   TEXT NULL , 
Description   TEXT NULL , 
Condition   TEXT NULL  )
go

ALTER TABLE Action ADD CONSTRAINT PKActionPkey_ActionRepositoryN PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
ActionName)
go

GRANT ALL ON Action TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Action','2003-04-02 13:12:06','2003-04-02 13:12:06')
go


DROP TABLE Derivation
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Derivation'
go

CREATE TABLE Derivation(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
DerivationType   VARCHAR(50) NOT NULL , 
DefaultValue   VARCHAR(50) NULL , 
Formula   TEXT NULL , 
QualificationExpression   TEXT NULL , 
SourceAttr   VARCHAR(50) NULL , 
SourceDataObject   VARCHAR(50) NULL , 
ParentReplicateIsMaintained   BIT NOT NULL  )
go

ALTER TABLE Derivation ADD CONSTRAINT PKDerivationPkey_DerivationRep PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName, 
DerivationType)
go

GRANT ALL ON Derivation TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Derivation','2003-04-02 13:14:26','2003-04-02 13:14:26')
go


DROP TABLE IndexAttr
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'IndexAttr'
go

CREATE TABLE IndexAttr(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
IndexName   VARCHAR(50) NOT NULL , 
IndexAttrName   VARCHAR(50) NOT NULL  )
go

ALTER TABLE IndexAttr ADD CONSTRAINT PKIndexAttrPkey_IndexAttrRepos PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
IndexName, 
IndexAttrName)
go

GRANT ALL ON IndexAttr TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('IndexAttr','2003-04-02 13:15:11','2003-04-02 13:15:11')
go


DROP TABLE Validation
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Validation'
go

CREATE TABLE Validation(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
ValidationType   VARCHAR(50) NOT NULL , 
Description   TEXT NULL , 
CodedValueList   VARCHAR(50) NULL  )
go

ALTER TABLE Validation ADD CONSTRAINT PKValidationPkey_ValidationRep PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName, 
ValidationType)
go

GRANT ALL ON Validation TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Validation','2003-04-02 13:17:30','2003-04-02 13:17:30')
go


DROP TABLE AttrObjectMapper
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'AttrObjectMapper'
go

CREATE TABLE AttrObjectMapper(
ProjectName   VARCHAR(50) NOT NULL , 
SourceRepositoryName   VARCHAR(50) NOT NULL , 
TargetRepositoryName   VARCHAR(50) NOT NULL , 
SourceDataObjectName   VARCHAR(50) NOT NULL , 
TargetDataObjectName   VARCHAR(50) NOT NULL , 
SourceAttrName   VARCHAR(50) NOT NULL , 
TargetAttrName   VARCHAR(50) NOT NULL , 
TransformDesc   VARCHAR(250) NULL , 
TransformRule   VARCHAR(15) NULL , 
SourceAttrDatatype   VARCHAR(50) NULL , 
TargetAttrDatatype   VARCHAR(50) NULL  )
go

ALTER TABLE AttrObjectMapper ADD CONSTRAINT PKPkeyATTRMapper_AttrObjectMap PRIMARY KEY( 
ProjectName, 
SourceRepositoryName, 
TargetRepositoryName, 
SourceDataObjectName, 
TargetDataObjectName, 
SourceAttrName, 
TargetAttrName)
go

GRANT ALL ON AttrObjectMapper TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('AttrObjectMapper','2003-09-30 19:47:32','2003-09-30 19:47:32')
go


DROP TABLE DataObjectMapper
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'DataObjectMapper'
go

CREATE TABLE DataObjectMapper(
ProjectName   VARCHAR(50) NOT NULL , 
SourceRepositoryName   VARCHAR(50) NOT NULL , 
TargetRepositoryName   VARCHAR(50) NOT NULL , 
SourceDataObjectName   VARCHAR(50) NOT NULL , 
TargetDataObjectName   VARCHAR(50) NOT NULL  )
go

ALTER TABLE DataObjectMapper ADD CONSTRAINT PKPkeyDOMapper_DataObjectMappe PRIMARY KEY( 
ProjectName, 
SourceRepositoryName, 
TargetRepositoryName, 
SourceDataObjectName, 
TargetDataObjectName)
go

GRANT ALL ON DataObjectMapper TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('DataObjectMapper','2003-09-30 14:35:07','2003-09-30 14:35:07')
go


DROP TABLE Project
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Project'
go

CREATE TABLE Project(
ProjectName   VARCHAR(50) NOT NULL , 
ProjectDescription   VARCHAR(250) NULL  )
go

ALTER TABLE Project ADD CONSTRAINT PKPkeyProject_ProjectProjectNa PRIMARY KEY( 
ProjectName)
go

GRANT ALL ON Project TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Project','2003-09-30 14:36:20','2003-09-30 14:36:20')
go


DROP TABLE Attribute
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Attribute'
go

CREATE TABLE Attribute(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
Persistent   BIT NOT NULL , 
PreventUserUpdate   BIT NOT NULL , 
ValueRequired   BIT NOT NULL , 
DataType   VARCHAR(50) NULL , 
AttrSize   SMALLINT NULL , 
Description   TEXT NULL , 
Caption   VARCHAR(250) NULL , 
Comments   TEXT NULL , 
Format   VARCHAR(50) NULL , 
MicroHelp   VARCHAR(50) NULL , 
Derivation_Cnt   SMALLINT NULL , 
Validation_Cnt   SMALLINT NULL , 
Formula_Cnt   SMALLINT NULL , 
Sum_Cnt   SMALLINT NULL , 
Count_Cnt   SMALLINT NULL , 
ParentRepl_Cnt   SMALLINT NULL , 
Precision   SMALLINT NULL , 
Scale   SMALLINT NULL , 
SQLDataType   VARCHAR(50) NULL  )
go

ALTER TABLE Attribute ADD CONSTRAINT PKAttrPkey_AttributeRepository PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName)
go

GRANT ALL ON Attribute TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Attribute','2003-09-30 19:53:20','2003-09-30 19:53:20')
go


DROP TABLE Constraint
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Constraint'
go

CREATE TABLE Constraint(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
ConstraintName   VARCHAR(50) NOT NULL , 
ConditionType   VARCHAR(50) NULL , 
Condition   TEXT NULL , 
ErrorMessage   TEXT NULL  )
go

ALTER TABLE Constraint ADD CONSTRAINT PKConstraintPkey_ConstraintRep PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
ConstraintName)
go

GRANT ALL ON Constraint TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Constraint','2003-04-02 13:12:59','2003-04-02 13:12:59')
go


DROP TABLE DataObject_Jn_Reln
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'DataObject_Jn_Reln'
go

CREATE TABLE DataObject_Jn_Reln(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(150) NOT NULL , 
isParentRole   BIT NOT NULL  )
go

GRANT ALL ON DataObject_Jn_Reln TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('DataObject_Jn_Reln','2003-04-02 12:57:21','2003-04-02 12:57:21')
go


DROP TABLE RelationshipRole
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'RelationshipRole'
go

CREATE TABLE RelationshipRole(
RepositoryName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(150) NOT NULL , 
ParentDOName   VARCHAR(50) NOT NULL , 
ParentRoleName   VARCHAR(50) NOT NULL , 
ChildDOName   VARCHAR(50) NOT NULL , 
ChildRoleName   VARCHAR(50) NOT NULL , 
isEnforce   BIT NOT NULL , 
ParentAttribute   VARCHAR(250) NULL , 
ChildAttribute   VARCHAR(250) NULL  )
go

ALTER TABLE RelationshipRole ADD CONSTRAINT PKPRKY_RELROLE_RelationshipRol PRIMARY KEY( 
RepositoryName, 
RelationshipName, 
ParentRoleName, 
ChildRoleName, 
ParentDOName, 
ChildDOName)
go

GRANT ALL ON RelationshipRole TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('RelationshipRole','2003-09-05 16:50:08','2003-09-05 16:50:08')
go


DROP TABLE Relationship
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Relationship'
go

CREATE TABLE Relationship(
RepositoryName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(150) NOT NULL , 
ParentDOName   VARCHAR(50) NOT NULL , 
ParentRoleName   VARCHAR(50) NULL , 
ChildDOName   VARCHAR(50) NOT NULL , 
ChildRoleName   VARCHAR(50) NULL , 
isEnforce   BIT NOT NULL , 
ParentAttribute   VARCHAR(50) NULL , 
ChildAttribute   VARCHAR(50) NULL , 
RolePlayer_CNT   SMALLINT NULL  )
go

ALTER TABLE Relationship ADD CONSTRAINT PKRelnPkey_RelationshipReposit PRIMARY KEY( 
RepositoryName, 
RelationshipName)
go

ALTER TABLE Relationship ADD CONSTRAINT U_KeyRelToRelRole_Relationship UNIQUE(
RepositoryName, 
RelationshipName, 
ParentDOName, 
ChildDOName)
go

GRANT ALL ON Relationship TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Relationship','2003-09-05 16:51:45','2003-09-05 16:51:45')
go


DROP TABLE IndexDO
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'IndexDO'
go

CREATE TABLE IndexDO(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
IndexName   VARCHAR(50) NOT NULL , 
PrimaryIndx   BIT NOT NULL , 
UniqueIndx   BIT NOT NULL  )
go

ALTER TABLE IndexDO ADD CONSTRAINT PKEYIndex_IndexDORepositoryNam PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
IndexName)
go

GRANT ALL ON IndexDO TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('IndexDO','2003-04-02 13:14:53','2003-04-02 13:14:53')
go


DROP TABLE QueryAttr
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'QueryAttr'
go

CREATE TABLE QueryAttr(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
Alias   VARCHAR(50) NOT NULL , 
AggregationType   VARCHAR(50) NOT NULL , 
Persistent   BIT NOT NULL  )
go

ALTER TABLE QueryAttr ADD CONSTRAINT PK_QRYATTR_QueryAttrRepository PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
QueryObjectName, 
AttrName, 
Alias)
go

GRANT ALL ON QueryAttr TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('QueryAttr','2003-09-12 11:19:18','2003-09-12 11:19:18')
go


DROP TABLE QueryJoinDataObject
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'QueryJoinDataObject'
go

CREATE TABLE QueryJoinDataObject(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
LeftDataObjectName   VARCHAR(50) NOT NULL , 
RightDataObjectName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(100) NULL , 
JoinType   VARCHAR(15) NULL  )
go

ALTER TABLE QueryJoinDataObject ADD CONSTRAINT PKQueryDataObjPkey_QueryJoinDa PRIMARY KEY( 
RepositoryName, 
QueryObjectName, 
LeftDataObjectName, 
RightDataObjectName)
go

GRANT ALL ON QueryJoinDataObject TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('QueryJoinDataObject','2003-04-02 13:02:30','2003-04-02 13:02:30')
go


DROP TABLE QueryDataObject
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'QueryDataObject'
go

CREATE TABLE QueryDataObject(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
Alias   VARCHAR(50) NOT NULL  )
go

ALTER TABLE QueryDataObject ADD CONSTRAINT PKQueryDataObjPkey_QueryDataOb PRIMARY KEY( 
RepositoryName, 
QueryObjectName, 
DataObjectName, 
Alias)
go

GRANT ALL ON QueryDataObject TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('QueryDataObject','2003-09-14 15:11:25','2003-09-14 15:11:25')
go


DROP TABLE RSAttribute
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'RSAttribute'
go

CREATE TABLE RSAttribute(
RepositoryName   VARCHAR(50) NOT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
BusinessObject   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
isScalar   BIT NOT NULL , 
isPlaced   BIT NOT NULL , 
isDisplayed   BIT NOT NULL , 
RSID   SMALLINT NOT NULL , 
ColumnLabel   VARCHAR(150) NULL , 
ClassName   VARCHAR(150) NULL , 
ColumnEnabled   BIT NOT NULL  )
go

GRANT ALL ON RSAttribute TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('RSAttribute','2003-10-03 15:41:28','2003-10-03 15:41:28')
go


DROP TABLE Form
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Form'
go

CREATE TABLE Form(
RepositoryName   VARCHAR(50) NOT NULL , 
RecordSource_Cnt   SMALLINT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
isJava   BIT NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
RecordSourceCnt   SMALLINT NULL , 
FormCaption   VARCHAR(50) NULL , 
FormLayout   TEXT NULL , 
Gen_Lines_Cnt   SMALLINT NULL , 
User_Line_Cnt   SMALLINT NULL , 
Gen_Method_Cnt   SMALLINT NULL , 
User_Method_Cnt   SMALLINT NULL , 
Total_Line_Cnt   SMALLINT NULL , 
Total_Method_Cnt   SMALLINT NULL , 
Gen_Line_Pct   NUMERIC(10,2) NULL , 
User_Line_Pct   NUMERIC(10,2) NULL , 
Gen_Method_Pct   NUMERIC(10,2) NULL , 
User_Method_Pct   NUMERIC(10,2) NULL , 
TransitionCount   SMALLINT NULL , 
HasCustomFormLayout   BIT NOT NULL , 
ClassName   VARCHAR(250) NULL , 
Archetype   VARCHAR(150) NULL  )
go

ALTER TABLE Form ADD CONSTRAINT PKFormPkey_FormRepositoryName_ PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName)
go

GRANT ALL ON Form TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Form','2003-10-03 15:19:44','2003-10-03 15:19:44')
go


DROP TABLE Application
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Application'
go

CREATE TABLE Application(
RepositoryName   VARCHAR(50) NOT NULL , 
RepositoryVersion   VARCHAR(50) NOT NULL , 
Form_Cnt   SMALLINT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
isJava   BIT NOT NULL , 
Gen_Lines_Cnt   SMALLINT NULL , 
User_Line_Cnt   SMALLINT NULL , 
Gen_Method_Cnt   SMALLINT NULL , 
User_Method_Cnt   SMALLINT NULL , 
Total_Line_Cnt   SMALLINT NULL , 
Total_Method_Cnt   SMALLINT NULL , 
Gen_Line_Pct   NUMERIC(10,2) NULL , 
User_Line_Pct   NUMERIC(10,2) NULL , 
Gen_Method_Pct   NUMERIC(10,2) NULL , 
User_Method_Pct   NUMERIC(10,2) NULL , 
TransitionCnt   SMALLINT NULL  )
go

ALTER TABLE Application ADD CONSTRAINT PKApplicationPkey_ApplicationR PRIMARY KEY( 
RepositoryName, 
ApplicationName)
go

GRANT ALL ON Application TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Application','2003-09-05 17:30:05','2003-09-05 17:30:05')
go


DROP TABLE Transition
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Transition'
go

CREATE TABLE Transition(
RepositoryName   VARCHAR(50) NOT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
TargetFormName   VARCHAR(100) NOT NULL , 
BusinessObject   VARCHAR(50) NOT NULL , 
FormTransNum   VARCHAR(5) NOT NULL , 
Relationship   VARCHAR(150) NULL , 
ClassName   VARCHAR(150) NULL , 
IsTargetInitialQueryMode   BIT NULL , 
IsTargetInitialAddMode   BIT NULL , 
RelnIsFromParent   BIT NULL , 
FormTransCaption   VARCHAR(150) NULL , 
RSID   SMALLINT NOT NULL  )
go

ALTER TABLE Transition ADD CONSTRAINT PKTransitionPkey_TransitionRep PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID, 
FormTransNum)
go

GRANT ALL ON Transition TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Transition','2003-09-05 17:24:38','2003-09-05 17:24:38')
go


DROP TABLE RecordSource
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'RecordSource'
go

CREATE TABLE RecordSource(
RepositoryName   VARCHAR(50) NOT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
Attr_Cnt   SMALLINT NULL , 
BusinessObject   VARCHAR(50) NOT NULL , 
PlacedAttrCnt   SMALLINT NULL , 
DisplayedAttrCnt   SMALLINT NULL , 
ScalarGrid   VARCHAR(10) NULL , 
AllowInsert   BIT NOT NULL , 
AllowUpdate   BIT NOT NULL , 
AllowDelete   BIT NOT NULL , 
Relationship   VARCHAR(150) NULL , 
ClassName   VARCHAR(150) NULL , 
RSID   SMALLINT NOT NULL , 
TransitionCnt   SMALLINT NULL , 
RecordSourceArchetype   VARCHAR(250) NULL  )
go

ALTER TABLE RecordSource ADD CONSTRAINT PKRecordSourcePkey_RecordSourc PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID)
go

GRANT ALL ON RecordSource TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('RecordSource','2003-10-03 15:23:49','2003-10-03 15:23:49')
go


DROP TABLE Method
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Method'
go

CREATE TABLE Method(
RepositoryName   VARCHAR(50) NOT NULL , 
MethodName   VARCHAR(100) NOT NULL , 
ReturnType   VARCHAR(50) NULL , 
Signature   VARCHAR(250) NOT NULL , 
ObjectName   VARCHAR(50) NOT NULL , 
ObjectType   VARCHAR(10) NOT NULL , 
MethodSource   TEXT NULL , 
IsPublic   BIT NOT NULL , 
IsUserDefined   BIT NOT NULL  )
go

ALTER TABLE Method ADD CONSTRAINT PKEY_METHOD_MethodRepositoryNa PRIMARY KEY( 
RepositoryName, 
ObjectName, 
Signature, 
MethodName, 
ObjectType)
go

GRANT ALL ON Method TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Method','2003-04-02 12:53:00','2003-04-02 12:53:00')
go


DROP TABLE QueryObject
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'QueryObject'
go

CREATE TABLE QueryObject(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
SuperClass   VARCHAR(50) NULL , 
Description   TEXT NULL , 
DataObject_Cnt   SMALLINT NULL , 
Reln_Cnt   SMALLINT NULL , 
RuntimeSql   TEXT NULL , 
Gen_Lines_Cnt   SMALLINT NULL , 
User_Line_Cnt   SMALLINT NULL , 
Gen_Method_Cnt   SMALLINT NULL , 
User_Method_Cnt   SMALLINT NULL , 
Total_Line_Cnt   SMALLINT NULL , 
Total_Method_Cnt   SMALLINT NULL , 
Gen_Line_Pct   NUMERIC(10,2) NULL , 
User_Line_Pct   NUMERIC(10,2) NULL , 
Gen_Method_Pct   NUMERIC(10,2) NULL , 
User_Method_Pct   NUMERIC(10,2) NULL , 
InternalPathName   VARCHAR(250) NULL , 
Attr_Cnt   SMALLINT NULL  )
go

ALTER TABLE QueryObject ADD CONSTRAINT PKQueryObjPkey_QueryObjectRepo PRIMARY KEY( 
RepositoryName, 
QueryObjectName)
go

GRANT ALL ON QueryObject TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('QueryObject','2003-09-12 11:21:59','2003-09-12 11:21:59')
go


DROP TABLE DataObject
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'DataObject'
go

CREATE TABLE DataObject(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
isCodedValueList   BIT NOT NULL , 
SuperClass   VARCHAR(50) NULL , 
SingularCaption   VARCHAR(50) NULL , 
PluralCaption   VARCHAR(50) NULL , 
Description   TEXT NULL , 
Attr_Cnt   SMALLINT NULL , 
Constraint_Cnt   SMALLINT NULL , 
Action_Cnt   SMALLINT NULL , 
ParentReln_Cnt   SMALLINT NULL , 
ChildReln_Cnt   SMALLINT NULL , 
Gen_Lines_Cnt   SMALLINT NULL , 
User_Line_Cnt   SMALLINT NULL , 
Gen_Method_Cnt   SMALLINT NULL , 
User_Method_Cnt   SMALLINT NULL , 
Total_Line_Cnt   SMALLINT NULL , 
Total_Method_Cnt   SMALLINT NULL , 
Gen_Line_Pct   NUMERIC(10,2) NULL , 
User_Line_Pct   NUMERIC(10,2) NULL , 
Gen_Method_Pct   NUMERIC(10,2) NULL , 
User_Method_Pct   NUMERIC(10,2) NULL , 
InternalPathName   VARCHAR(250) NULL  )
go

ALTER TABLE DataObject ADD CONSTRAINT PKDataObjPkey_DataObjectReposi PRIMARY KEY( 
RepositoryName, 
DataObjectName)
go

GRANT ALL ON DataObject TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('DataObject','2003-08-07 11:02:52','2003-08-07 11:02:52')
go


DROP TABLE OtherFile
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'OtherFile'
go

CREATE TABLE OtherFile(
RepositoryName   VARCHAR(50) NOT NULL , 
FileName   VARCHAR(50) NOT NULL , 
User_Line_Cnt   SMALLINT NULL , 
User_Method_Cnt   SMALLINT NULL  )
go

ALTER TABLE OtherFile ADD CONSTRAINT PKEY_OTHERFILE_OtherFileReposi PRIMARY KEY( 
RepositoryName, 
FileName)
go

GRANT ALL ON OtherFile TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('OtherFile','2003-04-02 12:54:17','2003-04-02 12:54:17')
go


DROP TABLE Repository
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Repository'
go

CREATE TABLE Repository(
RepositoryName   VARCHAR(50) NOT NULL , 
RepositoryVersion   VARCHAR(50) NOT NULL , 
DataObject_Cnt   SMALLINT NULL , 
Relationship_Cnt   SMALLINT NULL , 
Attr_Cnt   SMALLINT NULL , 
Action_Cnt   SMALLINT NULL , 
Constraint_Cnt   SMALLINT NULL , 
Java_App_Cnt   SMALLINT NULL , 
HTML_App_Cnt   SMALLINT NULL , 
Gen_Lines_Cnt   SMALLINT NULL , 
User_Line_Cnt   SMALLINT NULL , 
Gen_Method_Cnt   SMALLINT NULL , 
User_Method_Cnt   SMALLINT NULL , 
Total_Line_Cnt   SMALLINT NULL , 
Total_Method_Cnt   SMALLINT NULL , 
Gen_Line_Pct   NUMERIC(10,2) NULL , 
User_Line_Pct   NUMERIC(10,2) NULL , 
Gen_Method_Pct   NUMERIC(10,2) NULL , 
User_Method_Pct   NUMERIC(10,2) NULL , 
Comments   VARCHAR(255) NULL , 
Other_File_Cnt   SMALLINT NULL , 
Other_File_Lines   SMALLINT NULL , 
Other_File_Method_Cnt   SMALLINT NULL , 
QueryObject_Cnt   SMALLINT NULL , 
JavaForm_Cnt   SMALLINT NULL , 
HTML_Form_Cnt   SMALLINT NULL , 
ReposInternalName   VARCHAR(50) NOT NULL , 
RootDirectory   VARCHAR(150) NULL , 
Description   VARCHAR(250) NULL , 
Database   VARCHAR(50) NULL  )
go

ALTER TABLE Repository ADD CONSTRAINT PKReposPkey_RepositoryReposito PRIMARY KEY( 
RepositoryName)
go

GRANT ALL ON Repository TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Repository','2003-09-30 11:09:38','2003-09-30 11:09:38')
go


DROP TABLE ReposName
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'ReposName'
go

CREATE TABLE ReposName(
ReposInternalName   VARCHAR(50) NOT NULL  )
go

ALTER TABLE ReposName ADD CONSTRAINT PK_REPOSNAME_ReposNameReposInt PRIMARY KEY( 
ReposInternalName)
go

GRANT ALL ON ReposName TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('ReposName','2003-03-17 16:16:39','2003-03-17 16:16:39')
go


DROP TABLE ReposVersion
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'ReposVersion'
go

CREATE TABLE ReposVersion(
Version   VARCHAR(50) NOT NULL , 
Comments   VARCHAR(250) NULL  )
go

ALTER TABLE ReposVersion ADD CONSTRAINT PKVersionPkey_ReposVersionVers PRIMARY KEY( 
Version)
go

GRANT ALL ON ReposVersion TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('ReposVersion','2003-03-17 16:18:47','2003-03-17 16:18:47')
go


DROP TABLE List_Derivation
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'List_Derivation'
go

CREATE TABLE List_Derivation(
DerivationType   VARCHAR(50) NOT NULL , 
DerivationName   VARCHAR(50) NULL  )
go

ALTER TABLE List_Derivation ADD CONSTRAINT PKListDerivationPkey_List_Deri PRIMARY KEY( 
DerivationType)
go

GRANT ALL ON List_Derivation TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('List_Derivation','2003-02-26 15:50:45','2003-02-26 15:50:45')
go

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Count', 'Count')
go

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Default', 'Default')
go

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Formula', 'Formula')
go

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('None', 'None')
go

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('ParentReplicate', 'Parent Replicate')
go

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Sum', 'Sum')
go



DROP TABLE Valid_ObjectType
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Valid_ObjectType'
go

CREATE TABLE Valid_ObjectType(
storedValue   VARCHAR(12) NOT NULL , 
displayValue   VARCHAR(50) NULL  )
go

ALTER TABLE Valid_ObjectType ADD CONSTRAINT PKValid_ObjectTypeIndex_Valid_ PRIMARY KEY( 
storedValue)
go

GRANT ALL ON Valid_ObjectType TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Valid_ObjectType','2003-02-26 15:50:46','2003-02-26 15:50:46')
go

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('DATAOBJECT', 'Data Object')
go

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('QRYOBJECT', 'Query Object')
go

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('APPLICATION', 'Application')
go

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('JAVA_APP', 'Java Application')
go

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('HTML_APP', 'HTML Application')
go

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('OTHER', 'Other Files')
go



DROP TABLE Valid_SQLTypes
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Valid_SQLTypes'
go

CREATE TABLE Valid_SQLTypes(
SqlType   VARCHAR(50) NOT NULL  )
go

ALTER TABLE Valid_SQLTypes ADD CONSTRAINT PKPkeySqlType_Valid_SQLTypesSq PRIMARY KEY( 
SqlType)
go

GRANT ALL ON Valid_SQLTypes TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Valid_SQLTypes','2003-09-30 19:53:10','2003-09-30 19:53:10')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BIT')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TINYINT')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('SMALLINT')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('CHAR')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARCHAR')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('DATETIME')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('FLOAT')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TEXT')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARBINARY')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('MONEY')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('IMAGE')
go

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BINARY')
go



DROP TABLE Valid_TransformRule
go

DELETE "VSVBTableVersions" WHERE RepositoryTableName =  'Valid_TransformRule'
go

CREATE TABLE Valid_TransformRule(
TranformRule   VARCHAR(15) NOT NULL , 
RuleDescription   VARCHAR(250) NULL  )
go

ALTER TABLE Valid_TransformRule ADD CONSTRAINT PKPkeyValidTransform_Valid_Tra PRIMARY KEY( 
TranformRule)
go

GRANT ALL ON Valid_TransformRule TO PUBLIC
go

INSERT INTO "VSVBTableVersions" VALUES('Valid_TransformRule','2003-09-30 19:14:33','2003-09-30 19:14:33')
go

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTEQ', 'ASSERT $ROW.COLA = $OTHROW.COLB')
go

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNULL', 'ASSERT $ROW IS NULL')
go

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNOTNULL', 'ASSERT $ROW IS NOT NULL')
go

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNE', 'ASSERT $ROW.COLA <> $OTHROW.COLB')
go

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('CUSTOM', 'Custom Transform')
go

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('NONE', 'No Transform Defined')
go


