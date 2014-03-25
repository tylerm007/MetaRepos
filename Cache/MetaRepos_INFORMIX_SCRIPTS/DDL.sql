
DROP TABLE ObjectDiff
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'ObjectDiff'
;

CREATE TABLE ObjectDiff(
ReposName1   VARCHAR(50) NOT NULL , 
ReposName2   VARCHAR(50) NOT NULL , 
ObjectName1   VARCHAR(50) NOT NULL , 
ObjectName2   VARCHAR(50) NOT NULL , 
ObjectType   VARCHAR(50) NOT NULL , 
DiffComment   VARCHAR(250), 
Total_1_Line_Cnt   SMALLINT, 
Total_2_Line_Cnt   SMALLINT, 
Line_Cnt_Diff   SMALLINT, 
Total_1_Method_Cnt   SMALLINT, 
Total_2_Method_Cnt   SMALLINT, 
Method_Cnt_Diff   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE ObjectDiff ADD CONSTRAINT PRIMARY KEY( 
ReposName1, 
ObjectName1, 
ReposName2, 
ObjectName2, 
ObjectType) CONSTRAINT PKObjectDiff_Objec
;

GRANT ALL ON ObjectDiff TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('ObjectDiff','2003-04-02 13:00:38','2003-04-02 13:00:38')
;


DROP TABLE ReposDiff
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'ReposDiff'
;

CREATE TABLE ReposDiff(
ReposName1   VARCHAR(50) NOT NULL , 
ReposName2   VARCHAR(50) NOT NULL , 
Repos1Version   VARCHAR(50), 
Repos2Version   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE ReposDiff ADD CONSTRAINT PRIMARY KEY( 
ReposName1, 
ReposName2) CONSTRAINT PKReposDiffPkey_Re
;

GRANT ALL ON ReposDiff TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('ReposDiff','2003-07-05 17:29:43','2003-07-05 17:29:43')
;


DROP TABLE Object_JN_Group
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Object_JN_Group'
;

CREATE TABLE Object_JN_Group(
GroupName   VARCHAR(100) NOT NULL , 
RepositoryName   VARCHAR(50) NOT NULL , 
ObjectName   VARCHAR(50) NOT NULL , 
ObjectType   VARCHAR(12) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE Object_JN_Group ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
GroupName, 
ObjectName, 
ObjectType) CONSTRAINT PKDataObjectGroupP
;

GRANT ALL ON Object_JN_Group TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Object_JN_Group','2003-04-02 12:59:53','2003-04-02 12:59:53')
;


DROP TABLE Groups
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Groups'
;

CREATE TABLE Groups(
GroupName   VARCHAR(100) NOT NULL , 
ParentGroupName   VARCHAR(50), 
RepositoryName   VARCHAR(50) NOT NULL , 
ParentRepositoryName   VARCHAR(50), 
OwnerID   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE Groups ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
GroupName) CONSTRAINT PKGroupPkey_Groups
;

GRANT ALL ON Groups TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Groups','2003-04-02 12:59:06','2003-04-02 12:59:06')
;


DROP TABLE Owner
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Owner'
;

CREATE TABLE Owner(
OwnerID   VARCHAR(50) NOT NULL , 
OwnerName   VARCHAR(150), 
Email   VARCHAR(75), 
Phone   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE Owner ADD CONSTRAINT PRIMARY KEY( 
OwnerID) CONSTRAINT PKEY_OWNER_OwnerOw
;

GRANT ALL ON Owner TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Owner','2003-04-02 13:01:09','2003-04-02 13:01:09')
;


DROP TABLE WFTransition
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'WFTransition'
;

CREATE TABLE WFTransition(
TemplateName   VARCHAR(50) NOT NULL , 
SourceActivityName   VARCHAR(50) NOT NULL , 
TargetActivityName   VARCHAR(50) NOT NULL , 
Condition   VARCHAR(250), 
Action   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE WFTransition ADD CONSTRAINT PRIMARY KEY( 
TemplateName, 
SourceActivityName, 
TargetActivityName) CONSTRAINT PKPkeyWFTransition
;

GRANT ALL ON WFTransition TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('WFTransition','2003-09-30 20:16:51','2003-09-30 20:16:51')
;


DROP TABLE Activity
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Activity'
;

CREATE TABLE Activity(
TemplateName   VARCHAR(50) NOT NULL , 
ActivityName   VARCHAR(50) NOT NULL , 
IsStart   SMALLINT, 
IsEnd   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE Activity ADD CONSTRAINT PRIMARY KEY( 
TemplateName, 
ActivityName) CONSTRAINT PK_Activity_Activi
;

GRANT ALL ON Activity TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Activity','2003-09-30 20:12:21','2003-09-30 20:12:21')
;


DROP TABLE Template
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Template'
;

CREATE TABLE Template(
TemplateName   VARCHAR(50) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE Template ADD CONSTRAINT PRIMARY KEY( 
TemplateName) CONSTRAINT PK_Template_Templa
;

GRANT ALL ON Template TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Template','2003-09-30 10:55:42','2003-09-30 10:55:42')
;


DROP TABLE Action
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Action'
;

CREATE TABLE Action(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
ActionName   VARCHAR(50) NOT NULL , 
ActionToPerform   TEXT, 
Description   TEXT, 
Condition   TEXT ) LOCK MODE ROW 
;

ALTER TABLE Action ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
ActionName) CONSTRAINT PKActionPkey_Actio
;

GRANT ALL ON Action TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Action','2003-04-02 13:12:06','2003-04-02 13:12:06')
;


DROP TABLE Derivation
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Derivation'
;

CREATE TABLE Derivation(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
DerivationType   VARCHAR(50) NOT NULL , 
DefaultValue   VARCHAR(50), 
Formula   TEXT, 
QualificationExpression   TEXT, 
SourceAttr   VARCHAR(50), 
SourceDataObject   VARCHAR(50), 
ParentReplicateIsMaintained   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE Derivation ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName, 
DerivationType) CONSTRAINT PKDerivationPkey_D
;

GRANT ALL ON Derivation TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Derivation','2003-04-02 13:14:26','2003-04-02 13:14:26')
;


DROP TABLE IndexAttr
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'IndexAttr'
;

CREATE TABLE IndexAttr(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
IndexName   VARCHAR(50) NOT NULL , 
IndexAttrName   VARCHAR(50) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE IndexAttr ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
IndexName, 
IndexAttrName) CONSTRAINT PKIndexAttrPkey_In
;

GRANT ALL ON IndexAttr TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('IndexAttr','2003-04-02 13:15:11','2003-04-02 13:15:11')
;


DROP TABLE Validation
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Validation'
;

CREATE TABLE Validation(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
ValidationType   VARCHAR(50) NOT NULL , 
Description   TEXT, 
CodedValueList   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE Validation ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName, 
ValidationType) CONSTRAINT PKValidationPkey_V
;

GRANT ALL ON Validation TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Validation','2003-04-02 13:17:30','2003-04-02 13:17:30')
;


DROP TABLE AttrObjectMapper
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'AttrObjectMapper'
;

CREATE TABLE AttrObjectMapper(
ProjectName   VARCHAR(50) NOT NULL , 
SourceRepositoryName   VARCHAR(50) NOT NULL , 
TargetRepositoryName   VARCHAR(50) NOT NULL , 
SourceDataObjectName   VARCHAR(50) NOT NULL , 
TargetDataObjectName   VARCHAR(50) NOT NULL , 
SourceAttrName   VARCHAR(50) NOT NULL , 
TargetAttrName   VARCHAR(50) NOT NULL , 
TransformDesc   VARCHAR(250), 
TransformRule   VARCHAR(15), 
SourceAttrDatatype   VARCHAR(50), 
TargetAttrDatatype   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE AttrObjectMapper ADD CONSTRAINT PRIMARY KEY( 
ProjectName, 
SourceRepositoryName, 
TargetRepositoryName, 
SourceDataObjectName, 
TargetDataObjectName, 
SourceAttrName, 
TargetAttrName) CONSTRAINT PKPkeyATTRMapper_A
;

GRANT ALL ON AttrObjectMapper TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('AttrObjectMapper','2003-09-30 19:47:32','2003-09-30 19:47:32')
;


DROP TABLE DataObjectMapper
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'DataObjectMapper'
;

CREATE TABLE DataObjectMapper(
ProjectName   VARCHAR(50) NOT NULL , 
SourceRepositoryName   VARCHAR(50) NOT NULL , 
TargetRepositoryName   VARCHAR(50) NOT NULL , 
SourceDataObjectName   VARCHAR(50) NOT NULL , 
TargetDataObjectName   VARCHAR(50) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT PRIMARY KEY( 
ProjectName, 
SourceRepositoryName, 
TargetRepositoryName, 
SourceDataObjectName, 
TargetDataObjectName) CONSTRAINT PKPkeyDOMapper_Dat
;

GRANT ALL ON DataObjectMapper TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('DataObjectMapper','2003-09-30 14:35:07','2003-09-30 14:35:07')
;


DROP TABLE Project
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Project'
;

CREATE TABLE Project(
ProjectName   VARCHAR(50) NOT NULL , 
ProjectDescription   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE Project ADD CONSTRAINT PRIMARY KEY( 
ProjectName) CONSTRAINT PKPkeyProject_Proj
;

GRANT ALL ON Project TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Project','2003-09-30 14:36:20','2003-09-30 14:36:20')
;


DROP TABLE Attribute
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Attribute'
;

CREATE TABLE Attribute(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
Persistent   SMALLINT, 
PreventUserUpdate   SMALLINT, 
ValueRequired   SMALLINT, 
DataType   VARCHAR(50), 
AttrSize   SMALLINT, 
Description   TEXT, 
Caption   VARCHAR(250), 
Comments   TEXT, 
Format   VARCHAR(50), 
MicroHelp   VARCHAR(50), 
Derivation_Cnt   SMALLINT, 
Validation_Cnt   SMALLINT, 
Formula_Cnt   SMALLINT, 
Sum_Cnt   SMALLINT, 
Count_Cnt   SMALLINT, 
ParentRepl_Cnt   SMALLINT, 
Precision   SMALLINT, 
Scale   SMALLINT, 
SQLDataType   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE Attribute ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName) CONSTRAINT PKAttrPkey_Attribu
;

GRANT ALL ON Attribute TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Attribute','2003-09-30 19:53:20','2003-09-30 19:53:20')
;


DROP TABLE Constraint
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Constraint'
;

CREATE TABLE Constraint(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
ConstraintName   VARCHAR(50) NOT NULL , 
ConditionType   VARCHAR(50), 
Condition   TEXT, 
ErrorMessage   TEXT ) LOCK MODE ROW 
;

ALTER TABLE Constraint ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
ConstraintName) CONSTRAINT PKConstraintPkey_C
;

GRANT ALL ON Constraint TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Constraint','2003-04-02 13:12:59','2003-04-02 13:12:59')
;


DROP TABLE DataObject_Jn_Reln
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'DataObject_Jn_Reln'
;

CREATE TABLE DataObject_Jn_Reln(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(150) NOT NULL , 
isParentRole   SMALLINT NOT NULL  ) LOCK MODE ROW 
;

GRANT ALL ON DataObject_Jn_Reln TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('DataObject_Jn_Reln','2003-04-02 12:57:21','2003-04-02 12:57:21')
;


DROP TABLE RelationshipRole
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'RelationshipRole'
;

CREATE TABLE RelationshipRole(
RepositoryName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(150) NOT NULL , 
ParentDOName   VARCHAR(50) NOT NULL , 
ParentRoleName   VARCHAR(50) NOT NULL , 
ChildDOName   VARCHAR(50) NOT NULL , 
ChildRoleName   VARCHAR(50) NOT NULL , 
isEnforce   SMALLINT, 
ParentAttribute   VARCHAR(250), 
ChildAttribute   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE RelationshipRole ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
RelationshipName, 
ParentRoleName, 
ChildRoleName, 
ParentDOName, 
ChildDOName) CONSTRAINT PKPRKY_RELROLE_Rel
;

GRANT ALL ON RelationshipRole TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('RelationshipRole','2003-09-05 16:50:08','2003-09-05 16:50:08')
;


DROP TABLE Relationship
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Relationship'
;

CREATE TABLE Relationship(
RepositoryName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(150) NOT NULL , 
ParentDOName   VARCHAR(50) NOT NULL , 
ParentRoleName   VARCHAR(50), 
ChildDOName   VARCHAR(50) NOT NULL , 
ChildRoleName   VARCHAR(50), 
isEnforce   SMALLINT, 
ParentAttribute   VARCHAR(50), 
ChildAttribute   VARCHAR(50), 
RolePlayer_CNT   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE Relationship ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
RelationshipName) CONSTRAINT PKRelnPkey_Relatio
;

ALTER TABLE Relationship ADD CONSTRAINT  UNIQUE(
RepositoryName, 
RelationshipName, 
ParentDOName, 
ChildDOName) CONSTRAINT U_KeyRelToRelRole_
;

GRANT ALL ON Relationship TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Relationship','2003-09-05 16:51:45','2003-09-05 16:51:45')
;


DROP TABLE IndexDO
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'IndexDO'
;

CREATE TABLE IndexDO(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
IndexName   VARCHAR(50) NOT NULL , 
PrimaryIndx   SMALLINT, 
UniqueIndx   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE IndexDO ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
IndexName) CONSTRAINT PKEYIndex_IndexDOR
;

GRANT ALL ON IndexDO TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('IndexDO','2003-04-02 13:14:53','2003-04-02 13:14:53')
;


DROP TABLE QueryAttr
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'QueryAttr'
;

CREATE TABLE QueryAttr(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
Alias   VARCHAR(50) NOT NULL , 
AggregationType   VARCHAR(50) NOT NULL , 
Persistent   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE QueryAttr ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
QueryObjectName, 
AttrName, 
Alias) CONSTRAINT PK_QRYATTR_QueryAt
;

GRANT ALL ON QueryAttr TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('QueryAttr','2003-09-12 11:19:18','2003-09-12 11:19:18')
;


DROP TABLE QueryJoinDataObject
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'QueryJoinDataObject'
;

CREATE TABLE QueryJoinDataObject(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
LeftDataObjectName   VARCHAR(50) NOT NULL , 
RightDataObjectName   VARCHAR(50) NOT NULL , 
RelationshipName   VARCHAR(100), 
JoinType   VARCHAR(15) ) LOCK MODE ROW 
;

ALTER TABLE QueryJoinDataObject ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
QueryObjectName, 
LeftDataObjectName, 
RightDataObjectName) CONSTRAINT PKQueryDataObjPkey
;

GRANT ALL ON QueryJoinDataObject TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('QueryJoinDataObject','2003-04-02 13:02:30','2003-04-02 13:02:30')
;


DROP TABLE QueryDataObject
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'QueryDataObject'
;

CREATE TABLE QueryDataObject(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
Alias   VARCHAR(50) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE QueryDataObject ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
QueryObjectName, 
DataObjectName, 
Alias) CONSTRAINT PKQueryDataObjPkey
;

GRANT ALL ON QueryDataObject TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('QueryDataObject','2003-09-14 15:11:25','2003-09-14 15:11:25')
;


DROP TABLE RSAttribute
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'RSAttribute'
;

CREATE TABLE RSAttribute(
RepositoryName   VARCHAR(50) NOT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
BusinessObject   VARCHAR(50) NOT NULL , 
AttrName   VARCHAR(50) NOT NULL , 
isScalar   SMALLINT NOT NULL , 
isPlaced   SMALLINT, 
isDisplayed   SMALLINT, 
RSID   SMALLINT NOT NULL , 
ColumnLabel   VARCHAR(150), 
ClassName   VARCHAR(150), 
ColumnEnabled   SMALLINT ) LOCK MODE ROW 
;

GRANT ALL ON RSAttribute TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('RSAttribute','2003-10-03 15:41:28','2003-10-03 15:41:28')
;


DROP TABLE Form
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Form'
;

CREATE TABLE Form(
RepositoryName   VARCHAR(50) NOT NULL , 
RecordSource_Cnt   SMALLINT, 
ApplicationName   VARCHAR(100) NOT NULL , 
isJava   SMALLINT, 
FormName   VARCHAR(100) NOT NULL , 
RecordSourceCnt   SMALLINT, 
FormCaption   VARCHAR(50), 
FormLayout   TEXT, 
Gen_Lines_Cnt   SMALLINT, 
User_Line_Cnt   SMALLINT, 
Gen_Method_Cnt   SMALLINT, 
User_Method_Cnt   SMALLINT, 
Total_Line_Cnt   SMALLINT, 
Total_Method_Cnt   SMALLINT, 
Gen_Line_Pct   NUMERIC(10,2), 
User_Line_Pct   NUMERIC(10,2), 
Gen_Method_Pct   NUMERIC(10,2), 
User_Method_Pct   NUMERIC(10,2), 
TransitionCount   SMALLINT, 
HasCustomFormLayout   SMALLINT, 
ClassName   VARCHAR(250), 
Archetype   VARCHAR(150) ) LOCK MODE ROW 
;

ALTER TABLE Form ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName) CONSTRAINT PKFormPkey_FormRep
;

GRANT ALL ON Form TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Form','2003-10-03 15:19:44','2003-10-03 15:19:44')
;


DROP TABLE Application
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Application'
;

CREATE TABLE Application(
RepositoryName   VARCHAR(50) NOT NULL , 
RepositoryVersion   VARCHAR(50), 
Form_Cnt   SMALLINT, 
ApplicationName   VARCHAR(100) NOT NULL , 
isJava   SMALLINT, 
Gen_Lines_Cnt   SMALLINT, 
User_Line_Cnt   SMALLINT, 
Gen_Method_Cnt   SMALLINT, 
User_Method_Cnt   SMALLINT, 
Total_Line_Cnt   SMALLINT, 
Total_Method_Cnt   SMALLINT, 
Gen_Line_Pct   NUMERIC(10,2), 
User_Line_Pct   NUMERIC(10,2), 
Gen_Method_Pct   NUMERIC(10,2), 
User_Method_Pct   NUMERIC(10,2), 
TransitionCnt   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE Application ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
ApplicationName) CONSTRAINT PKApplicationPkey_
;

GRANT ALL ON Application TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Application','2003-09-05 17:30:05','2003-09-05 17:30:05')
;


DROP TABLE Transition
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Transition'
;

CREATE TABLE Transition(
RepositoryName   VARCHAR(50) NOT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
TargetFormName   VARCHAR(100) NOT NULL , 
BusinessObject   VARCHAR(50) NOT NULL , 
FormTransNum   VARCHAR(5) NOT NULL , 
Relationship   VARCHAR(150), 
ClassName   VARCHAR(150), 
IsTargetInitialQueryMode   SMALLINT, 
IsTargetInitialAddMode   SMALLINT, 
RelnIsFromParent   SMALLINT, 
FormTransCaption   VARCHAR(150), 
RSID   SMALLINT NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE Transition ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID, 
FormTransNum) CONSTRAINT PKTransitionPkey_T
;

GRANT ALL ON Transition TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Transition','2003-09-05 17:24:38','2003-09-05 17:24:38')
;


DROP TABLE RecordSource
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'RecordSource'
;

CREATE TABLE RecordSource(
RepositoryName   VARCHAR(50) NOT NULL , 
ApplicationName   VARCHAR(100) NOT NULL , 
FormName   VARCHAR(100) NOT NULL , 
Attr_Cnt   SMALLINT, 
BusinessObject   VARCHAR(50) NOT NULL , 
PlacedAttrCnt   SMALLINT, 
DisplayedAttrCnt   SMALLINT, 
ScalarGrid   VARCHAR(10), 
AllowInsert   SMALLINT, 
AllowUpdate   SMALLINT, 
AllowDelete   SMALLINT, 
Relationship   VARCHAR(150), 
ClassName   VARCHAR(150), 
RSID   SMALLINT NOT NULL , 
TransitionCnt   SMALLINT, 
RecordSourceArchetype   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE RecordSource ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID) CONSTRAINT PKRecordSourcePkey
;

GRANT ALL ON RecordSource TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('RecordSource','2003-10-03 15:23:49','2003-10-03 15:23:49')
;


DROP TABLE Method
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Method'
;

CREATE TABLE Method(
RepositoryName   VARCHAR(50) NOT NULL , 
MethodName   VARCHAR(100) NOT NULL , 
ReturnType   VARCHAR(50), 
Signature   VARCHAR(250) NOT NULL , 
ObjectName   VARCHAR(50) NOT NULL , 
ObjectType   VARCHAR(10) NOT NULL , 
MethodSource   TEXT, 
IsPublic   SMALLINT, 
IsUserDefined   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE Method ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
ObjectName, 
Signature, 
MethodName, 
ObjectType) CONSTRAINT PKEY_METHOD_Method
;

GRANT ALL ON Method TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Method','2003-04-02 12:53:00','2003-04-02 12:53:00')
;


DROP TABLE QueryObject
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'QueryObject'
;

CREATE TABLE QueryObject(
RepositoryName   VARCHAR(50) NOT NULL , 
QueryObjectName   VARCHAR(50) NOT NULL , 
SuperClass   VARCHAR(50), 
Description   TEXT, 
DataObject_Cnt   SMALLINT, 
Reln_Cnt   SMALLINT, 
RuntimeSql   TEXT, 
Gen_Lines_Cnt   SMALLINT, 
User_Line_Cnt   SMALLINT, 
Gen_Method_Cnt   SMALLINT, 
User_Method_Cnt   SMALLINT, 
Total_Line_Cnt   SMALLINT, 
Total_Method_Cnt   SMALLINT, 
Gen_Line_Pct   NUMERIC(10,2), 
User_Line_Pct   NUMERIC(10,2), 
Gen_Method_Pct   NUMERIC(10,2), 
User_Method_Pct   NUMERIC(10,2), 
InternalPathName   VARCHAR(250), 
Attr_Cnt   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE QueryObject ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
QueryObjectName) CONSTRAINT PKQueryObjPkey_Que
;

GRANT ALL ON QueryObject TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('QueryObject','2003-09-12 11:21:59','2003-09-12 11:21:59')
;


DROP TABLE DataObject
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'DataObject'
;

CREATE TABLE DataObject(
RepositoryName   VARCHAR(50) NOT NULL , 
DataObjectName   VARCHAR(50) NOT NULL , 
isCodedValueList   SMALLINT, 
SuperClass   VARCHAR(50), 
SingularCaption   VARCHAR(50), 
PluralCaption   VARCHAR(50), 
Description   TEXT, 
Attr_Cnt   SMALLINT, 
Constraint_Cnt   SMALLINT, 
Action_Cnt   SMALLINT, 
ParentReln_Cnt   SMALLINT, 
ChildReln_Cnt   SMALLINT, 
Gen_Lines_Cnt   SMALLINT, 
User_Line_Cnt   SMALLINT, 
Gen_Method_Cnt   SMALLINT, 
User_Method_Cnt   SMALLINT, 
Total_Line_Cnt   SMALLINT, 
Total_Method_Cnt   SMALLINT, 
Gen_Line_Pct   NUMERIC(10,2), 
User_Line_Pct   NUMERIC(10,2), 
Gen_Method_Pct   NUMERIC(10,2), 
User_Method_Pct   NUMERIC(10,2), 
InternalPathName   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE DataObject ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
DataObjectName) CONSTRAINT PKDataObjPkey_Data
;

GRANT ALL ON DataObject TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('DataObject','2003-08-07 11:02:52','2003-08-07 11:02:52')
;


DROP TABLE OtherFile
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'OtherFile'
;

CREATE TABLE OtherFile(
RepositoryName   VARCHAR(50) NOT NULL , 
FileName   VARCHAR(50) NOT NULL , 
User_Line_Cnt   SMALLINT, 
User_Method_Cnt   SMALLINT ) LOCK MODE ROW 
;

ALTER TABLE OtherFile ADD CONSTRAINT PRIMARY KEY( 
RepositoryName, 
FileName) CONSTRAINT PKEY_OTHERFILE_Oth
;

GRANT ALL ON OtherFile TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('OtherFile','2003-04-02 12:54:17','2003-04-02 12:54:17')
;


DROP TABLE Repository
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Repository'
;

CREATE TABLE Repository(
RepositoryName   VARCHAR(50) NOT NULL , 
RepositoryVersion   VARCHAR(50) NOT NULL , 
DataObject_Cnt   SMALLINT, 
Relationship_Cnt   SMALLINT, 
Attr_Cnt   SMALLINT, 
Action_Cnt   SMALLINT, 
Constraint_Cnt   SMALLINT, 
Java_App_Cnt   SMALLINT, 
HTML_App_Cnt   SMALLINT, 
Gen_Lines_Cnt   SMALLINT, 
User_Line_Cnt   SMALLINT, 
Gen_Method_Cnt   SMALLINT, 
User_Method_Cnt   SMALLINT, 
Total_Line_Cnt   SMALLINT, 
Total_Method_Cnt   SMALLINT, 
Gen_Line_Pct   NUMERIC(10,2), 
User_Line_Pct   NUMERIC(10,2), 
Gen_Method_Pct   NUMERIC(10,2), 
User_Method_Pct   NUMERIC(10,2), 
Comments   VARCHAR(255), 
Other_File_Cnt   SMALLINT, 
Other_File_Lines   SMALLINT, 
Other_File_Method_Cnt   SMALLINT, 
QueryObject_Cnt   SMALLINT, 
JavaForm_Cnt   SMALLINT, 
HTML_Form_Cnt   SMALLINT, 
ReposInternalName   VARCHAR(50) NOT NULL , 
RootDirectory   VARCHAR(150), 
Description   VARCHAR(250), 
Database   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE Repository ADD CONSTRAINT PRIMARY KEY( 
RepositoryName) CONSTRAINT PKReposPkey_Reposi
;

GRANT ALL ON Repository TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Repository','2003-09-30 11:09:38','2003-09-30 11:09:38')
;


DROP TABLE ReposName
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'ReposName'
;

CREATE TABLE ReposName(
ReposInternalName   VARCHAR(50) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE ReposName ADD CONSTRAINT PRIMARY KEY( 
ReposInternalName) CONSTRAINT PK_REPOSNAME_Repos
;

GRANT ALL ON ReposName TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('ReposName','2003-03-17 16:16:39','2003-03-17 16:16:39')
;


DROP TABLE ReposVersion
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'ReposVersion'
;

CREATE TABLE ReposVersion(
Version   VARCHAR(50) NOT NULL , 
Comments   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE ReposVersion ADD CONSTRAINT PRIMARY KEY( 
Version) CONSTRAINT PKVersionPkey_Repo
;

GRANT ALL ON ReposVersion TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('ReposVersion','2003-03-17 16:18:47','2003-03-17 16:18:47')
;


DROP TABLE List_Derivation
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'List_Derivation'
;

CREATE TABLE List_Derivation(
DerivationType   VARCHAR(50) NOT NULL , 
DerivationName   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE List_Derivation ADD CONSTRAINT PRIMARY KEY( 
DerivationType) CONSTRAINT PKListDerivationPk
;

GRANT ALL ON List_Derivation TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('List_Derivation','2003-02-26 15:50:45','2003-02-26 15:50:45')
;

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Count', 'Count')
;

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Default', 'Default')
;

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Formula', 'Formula')
;

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('None', 'None')
;

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('ParentReplicate', 'Parent Replicate')
;

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Sum', 'Sum')
;



DROP TABLE Valid_ObjectType
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Valid_ObjectType'
;

CREATE TABLE Valid_ObjectType(
storedValue   VARCHAR(12) NOT NULL , 
displayValue   VARCHAR(50) ) LOCK MODE ROW 
;

ALTER TABLE Valid_ObjectType ADD CONSTRAINT PRIMARY KEY( 
storedValue) CONSTRAINT PKValid_ObjectType
;

GRANT ALL ON Valid_ObjectType TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Valid_ObjectType','2003-02-26 15:50:46','2003-02-26 15:50:46')
;

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('DATAOBJECT', 'Data Object')
;

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('QRYOBJECT', 'Query Object')
;

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('APPLICATION', 'Application')
;

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('JAVA_APP', 'Java Application')
;

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('HTML_APP', 'HTML Application')
;

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('OTHER', 'Other Files')
;



DROP TABLE Valid_SQLTypes
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Valid_SQLTypes'
;

CREATE TABLE Valid_SQLTypes(
SqlType   VARCHAR(50) NOT NULL  ) LOCK MODE ROW 
;

ALTER TABLE Valid_SQLTypes ADD CONSTRAINT PRIMARY KEY( 
SqlType) CONSTRAINT PKPkeySqlType_Vali
;

GRANT ALL ON Valid_SQLTypes TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Valid_SQLTypes','2003-09-30 19:53:10','2003-09-30 19:53:10')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BIT')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TINYINT')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('SMALLINT')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('CHAR')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARCHAR')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('DATETIME')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('FLOAT')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TEXT')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARBINARY')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('MONEY')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('IMAGE')
;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BINARY')
;



DROP TABLE Valid_TransformRule
;

DELETE FROM "VSVBTableVersions" WHERE "RepositoryTableNam" = 'Valid_TransformRule'
;

CREATE TABLE Valid_TransformRule(
TranformRule   VARCHAR(15) NOT NULL , 
RuleDescription   VARCHAR(250) ) LOCK MODE ROW 
;

ALTER TABLE Valid_TransformRule ADD CONSTRAINT PRIMARY KEY( 
TranformRule) CONSTRAINT PKPkeyValidTransfo
;

GRANT ALL ON Valid_TransformRule TO PUBLIC
;

INSERT INTO "VSVBTableVersions" VALUES('Valid_TransformRule','2003-09-30 19:14:33','2003-09-30 19:14:33')
;

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTEQ', 'ASSERT $ROW.COLA = $OTHROW.COLB')
;

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNULL', 'ASSERT $ROW IS NULL')
;

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNOTNULL', 'ASSERT $ROW IS NOT NULL')
;

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNE', 'ASSERT $ROW.COLA <> $OTHROW.COLB')
;

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('CUSTOM', 'Custom Transform')
;

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('NONE', 'No Transform Defined')
;


