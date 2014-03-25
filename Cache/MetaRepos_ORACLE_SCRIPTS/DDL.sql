
DROP TABLE ObjectDiff CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'ObjectDiff'

/

CREATE TABLE ObjectDiff(
ReposName1   VARCHAR2(50) NULL , 
ReposName2   VARCHAR2(50) NULL , 
ObjectName1   VARCHAR2(50) NULL , 
ObjectName2   VARCHAR2(50) NULL , 
ObjectType   VARCHAR2(50) NULL , 
DiffComment   VARCHAR2(250) NULL , 
Total_1_Line_Cnt   NUMBER(10,0) NULL , 
Total_2_Line_Cnt   NUMBER(10,0) NULL , 
Line_Cnt_Diff   NUMBER(10,0) NULL , 
Total_1_Method_Cnt   NUMBER(10,0) NULL , 
Total_2_Method_Cnt   NUMBER(10,0) NULL , 
Method_Cnt_Diff   NUMBER(10,0) NULL  )
/

GRANT ALL ON ObjectDiff TO PUBLIC
/

ALTER TABLE ObjectDiff ADD CONSTRAINT PKEY_ObjectDiff PRIMARY KEY( 
ReposName1, 
ObjectName1, 
ReposName2, 
ObjectName2, 
ObjectType)
/

INSERT INTO "VSVBTableVersions" VALUES('ObjectDiff','2003-04-02 13:00:38','2003-04-02 13:00:38')
/


DROP TABLE ReposDiff CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'ReposDiff'

/

CREATE TABLE ReposDiff(
ReposName1   VARCHAR2(50) NOT NULL , 
ReposName2   VARCHAR2(50) NOT NULL , 
Repos1Version   VARCHAR2(50) NULL , 
Repos2Version   VARCHAR2(50) NULL  )
/

GRANT ALL ON ReposDiff TO PUBLIC
/

ALTER TABLE ReposDiff ADD CONSTRAINT PKEY_ReposDiff PRIMARY KEY( 
ReposName1, 
ReposName2)
/

INSERT INTO "VSVBTableVersions" VALUES('ReposDiff','2003-07-05 17:29:43','2003-07-05 17:29:43')
/


DROP TABLE Object_JN_Group CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Object_JN_Group'

/

CREATE TABLE Object_JN_Group(
GroupName   VARCHAR2(100) NOT NULL , 
RepositoryName   VARCHAR2(50) NOT NULL , 
ObjectName   VARCHAR2(50) NOT NULL , 
ObjectType   VARCHAR2(12) NULL  )
/

GRANT ALL ON Object_JN_Group TO PUBLIC
/

ALTER TABLE Object_JN_Group ADD CONSTRAINT PKEY_Object_JN_Group PRIMARY KEY( 
RepositoryName, 
GroupName, 
ObjectName, 
ObjectType)
/

INSERT INTO "VSVBTableVersions" VALUES('Object_JN_Group','2003-04-02 12:59:53','2003-04-02 12:59:53')
/


DROP TABLE Groups CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Groups'

/

CREATE TABLE Groups(
GroupName   VARCHAR2(100) NOT NULL , 
ParentGroupName   VARCHAR2(50) NULL , 
RepositoryName   VARCHAR2(50) NOT NULL , 
ParentRepositoryName   VARCHAR2(50) NULL , 
OwnerID   VARCHAR2(50) NULL  )
/

GRANT ALL ON Groups TO PUBLIC
/

ALTER TABLE Groups ADD CONSTRAINT PKEY_Groups PRIMARY KEY( 
RepositoryName, 
GroupName)
/

INSERT INTO "VSVBTableVersions" VALUES('Groups','2003-04-02 12:59:06','2003-04-02 12:59:06')
/


DROP TABLE Owner CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Owner'

/

CREATE TABLE Owner(
OwnerID   VARCHAR2(50) NOT NULL , 
OwnerName   VARCHAR2(150) NULL , 
Email   VARCHAR2(75) NULL , 
Phone   VARCHAR2(50) NULL  )
/

GRANT ALL ON Owner TO PUBLIC
/

ALTER TABLE Owner ADD CONSTRAINT PKEY_Owner PRIMARY KEY( 
OwnerID)
/

INSERT INTO "VSVBTableVersions" VALUES('Owner','2003-04-02 13:01:09','2003-04-02 13:01:09')
/


DROP TABLE WFTransition CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'WFTransition'

/

CREATE TABLE WFTransition(
TemplateName   VARCHAR2(50) NOT NULL , 
SourceActivityName   VARCHAR2(50) NOT NULL , 
TargetActivityName   VARCHAR2(50) NOT NULL , 
Condition   VARCHAR2(250) NULL , 
Action   VARCHAR2(250) NULL  )
/

GRANT ALL ON WFTransition TO PUBLIC
/

ALTER TABLE WFTransition ADD CONSTRAINT PKEY_WFTransition PRIMARY KEY( 
TemplateName, 
SourceActivityName, 
TargetActivityName)
/

INSERT INTO "VSVBTableVersions" VALUES('WFTransition','2003-09-30 20:16:51','2003-09-30 20:16:51')
/


DROP TABLE Activity CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Activity'

/

CREATE TABLE Activity(
TemplateName   VARCHAR2(50) NULL , 
ActivityName   VARCHAR2(50) NULL , 
IsStart   NUMBER(3,0) NOT NULL , 
IsEnd   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON Activity TO PUBLIC
/

ALTER TABLE Activity ADD CONSTRAINT PKEY_Activity PRIMARY KEY( 
TemplateName, 
ActivityName)
/

INSERT INTO "VSVBTableVersions" VALUES('Activity','2003-09-30 20:12:21','2003-09-30 20:12:21')
/


DROP TABLE Template CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Template'

/

CREATE TABLE Template(
TemplateName   VARCHAR2(50) NULL  )
/

GRANT ALL ON Template TO PUBLIC
/

ALTER TABLE Template ADD CONSTRAINT PKEY_Template PRIMARY KEY( 
TemplateName)
/

INSERT INTO "VSVBTableVersions" VALUES('Template','2003-09-30 10:55:42','2003-09-30 10:55:42')
/


DROP TABLE Action CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Action'

/

CREATE TABLE Action(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
ActionName   VARCHAR2(50) NOT NULL , 
ActionToPerform   VARCHAR2(1500) NULL , 
Description   VARCHAR2(1500) NULL , 
Condition   VARCHAR2(1500) NULL  )
/

GRANT ALL ON Action TO PUBLIC
/

ALTER TABLE Action ADD CONSTRAINT PKEY_Action PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
ActionName)
/

INSERT INTO "VSVBTableVersions" VALUES('Action','2003-04-02 13:12:06','2003-04-02 13:12:06')
/


DROP TABLE Derivation CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Derivation'

/

CREATE TABLE Derivation(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
AttrName   VARCHAR2(50) NOT NULL , 
DerivationType   VARCHAR2(50) NOT NULL , 
DefaultValue   VARCHAR2(50) NULL , 
Formula   VARCHAR2(1500) NULL , 
QualificationExpression   VARCHAR2(1500) NULL , 
SourceAttr   VARCHAR2(50) NULL , 
SourceDataObject   VARCHAR2(50) NULL , 
ParentReplicateIsMaintained   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON Derivation TO PUBLIC
/

ALTER TABLE Derivation ADD CONSTRAINT PKEY_Derivation PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName, 
DerivationType)
/

INSERT INTO "VSVBTableVersions" VALUES('Derivation','2003-04-02 13:14:26','2003-04-02 13:14:26')
/


DROP TABLE IndexAttr CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'IndexAttr'

/

CREATE TABLE IndexAttr(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
IndexName   VARCHAR2(50) NOT NULL , 
IndexAttrName   VARCHAR2(50) NOT NULL  )
/

GRANT ALL ON IndexAttr TO PUBLIC
/

ALTER TABLE IndexAttr ADD CONSTRAINT PKEY_IndexAttr PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
IndexName, 
IndexAttrName)
/

INSERT INTO "VSVBTableVersions" VALUES('IndexAttr','2003-04-02 13:15:11','2003-04-02 13:15:11')
/


DROP TABLE Validation CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Validation'

/

CREATE TABLE Validation(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
AttrName   VARCHAR2(50) NOT NULL , 
ValidationType   VARCHAR2(50) NOT NULL , 
Description   VARCHAR2(1500) NULL , 
CodedValueList   VARCHAR2(50) NULL  )
/

GRANT ALL ON Validation TO PUBLIC
/

ALTER TABLE Validation ADD CONSTRAINT PKEY_Validation PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName, 
ValidationType)
/

INSERT INTO "VSVBTableVersions" VALUES('Validation','2003-04-02 13:17:30','2003-04-02 13:17:30')
/


DROP TABLE AttrObjectMapper CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'AttrObjectMapper'

/

CREATE TABLE AttrObjectMapper(
ProjectName   VARCHAR2(50) NOT NULL , 
SourceRepositoryName   VARCHAR2(50) NOT NULL , 
TargetRepositoryName   VARCHAR2(50) NOT NULL , 
SourceDataObjectName   VARCHAR2(50) NOT NULL , 
TargetDataObjectName   VARCHAR2(50) NOT NULL , 
SourceAttrName   VARCHAR2(50) NOT NULL , 
TargetAttrName   VARCHAR2(50) NOT NULL , 
TransformDesc   VARCHAR2(250) NULL , 
TransformRule   VARCHAR2(15) NULL , 
SourceAttrDatatype   VARCHAR2(50) NULL , 
TargetAttrDatatype   VARCHAR2(50) NULL  )
/

GRANT ALL ON AttrObjectMapper TO PUBLIC
/

ALTER TABLE AttrObjectMapper ADD CONSTRAINT PKEY_AttrObjectMapper PRIMARY KEY( 
ProjectName, 
SourceRepositoryName, 
TargetRepositoryName, 
SourceDataObjectName, 
TargetDataObjectName, 
SourceAttrName, 
TargetAttrName)
/

INSERT INTO "VSVBTableVersions" VALUES('AttrObjectMapper','2003-09-30 19:47:32','2003-09-30 19:47:32')
/


DROP TABLE DataObjectMapper CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'DataObjectMapper'

/

CREATE TABLE DataObjectMapper(
ProjectName   VARCHAR2(50) NOT NULL , 
SourceRepositoryName   VARCHAR2(50) NOT NULL , 
TargetRepositoryName   VARCHAR2(50) NOT NULL , 
SourceDataObjectName   VARCHAR2(50) NOT NULL , 
TargetDataObjectName   VARCHAR2(50) NOT NULL  )
/

GRANT ALL ON DataObjectMapper TO PUBLIC
/

ALTER TABLE DataObjectMapper ADD CONSTRAINT PKEY_DataObjectMapper PRIMARY KEY( 
ProjectName, 
SourceRepositoryName, 
TargetRepositoryName, 
SourceDataObjectName, 
TargetDataObjectName)
/

INSERT INTO "VSVBTableVersions" VALUES('DataObjectMapper','2003-09-30 14:35:07','2003-09-30 14:35:07')
/


DROP TABLE Project CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Project'

/

CREATE TABLE Project(
ProjectName   VARCHAR2(50) NOT NULL , 
ProjectDescription   VARCHAR2(250) NULL  )
/

GRANT ALL ON Project TO PUBLIC
/

ALTER TABLE Project ADD CONSTRAINT PKEY_Project PRIMARY KEY( 
ProjectName)
/

INSERT INTO "VSVBTableVersions" VALUES('Project','2003-09-30 14:36:20','2003-09-30 14:36:20')
/


DROP TABLE Attribute CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Attribute'

/

CREATE TABLE Attribute(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
AttrName   VARCHAR2(50) NOT NULL , 
Persistent   NUMBER(3,0) NOT NULL , 
PreventUserUpdate   NUMBER(3,0) NOT NULL , 
ValueRequired   NUMBER(3,0) NOT NULL , 
DataType   VARCHAR2(50) NULL , 
AttrSize   NUMBER(10,0) NULL , 
Description   VARCHAR2(1500) NULL , 
Caption   VARCHAR2(250) NULL , 
Comments   VARCHAR2(1500) NULL , 
Format   VARCHAR2(50) NULL , 
MicroHelp   VARCHAR2(50) NULL , 
Derivation_Cnt   NUMBER(10,0) NULL , 
Validation_Cnt   NUMBER(10,0) NULL , 
Formula_Cnt   NUMBER(10,0) NULL , 
Sum_Cnt   NUMBER(10,0) NULL , 
Count_Cnt   NUMBER(10,0) NULL , 
ParentRepl_Cnt   NUMBER(10,0) NULL , 
Precision   NUMBER(10,0) NULL , 
Scale   NUMBER(10,0) NULL , 
SQLDataType   VARCHAR2(50) NULL  )
/

GRANT ALL ON Attribute TO PUBLIC
/

ALTER TABLE Attribute ADD CONSTRAINT PKEY_Attribute PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
AttrName)
/

INSERT INTO "VSVBTableVersions" VALUES('Attribute','2003-09-30 19:53:20','2003-09-30 19:53:20')
/


DROP TABLE Constraint CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Constraint'

/

CREATE TABLE Constraint(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
ConstraintName   VARCHAR2(50) NOT NULL , 
ConditionType   VARCHAR2(50) NULL , 
Condition   VARCHAR2(1500) NULL , 
ErrorMessage   VARCHAR2(1500) NULL  )
/

GRANT ALL ON Constraint TO PUBLIC
/

ALTER TABLE Constraint ADD CONSTRAINT PKEY_Constraint PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
ConstraintName)
/

INSERT INTO "VSVBTableVersions" VALUES('Constraint','2003-04-02 13:12:59','2003-04-02 13:12:59')
/


DROP TABLE DataObject_Jn_Reln CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'DataObject_Jn_Reln'

/

CREATE TABLE DataObject_Jn_Reln(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
RelationshipName   VARCHAR2(150) NOT NULL , 
isParentRole   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON DataObject_Jn_Reln TO PUBLIC
/

ALTER TABLE DataObject_Jn_Reln ADD CONSTRAINT PKEY_DataObject_Jn_Reln PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
RelationshipName, 
isParentRole)
/

INSERT INTO "VSVBTableVersions" VALUES('DataObject_Jn_Reln','2003-04-02 12:57:21','2003-04-02 12:57:21')
/


DROP TABLE RelationshipRole CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'RelationshipRole'

/

CREATE TABLE RelationshipRole(
RepositoryName   VARCHAR2(50) NOT NULL , 
RelationshipName   VARCHAR2(150) NOT NULL , 
ParentDOName   VARCHAR2(50) NOT NULL , 
ParentRoleName   VARCHAR2(50) NOT NULL , 
ChildDOName   VARCHAR2(50) NOT NULL , 
ChildRoleName   VARCHAR2(50) NOT NULL , 
isEnforce   NUMBER(3,0) NOT NULL , 
ParentAttribute   VARCHAR2(250) NULL , 
ChildAttribute   VARCHAR2(250) NULL  )
/

GRANT ALL ON RelationshipRole TO PUBLIC
/

ALTER TABLE RelationshipRole ADD CONSTRAINT PKEY_RelationshipRole PRIMARY KEY( 
RepositoryName, 
RelationshipName, 
ParentRoleName, 
ChildRoleName, 
ParentDOName, 
ChildDOName)
/

INSERT INTO "VSVBTableVersions" VALUES('RelationshipRole','2003-09-05 16:50:08','2003-09-05 16:50:08')
/


DROP TABLE Relationship CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Relationship'

/

CREATE TABLE Relationship(
RepositoryName   VARCHAR2(50) NOT NULL , 
RelationshipName   VARCHAR2(150) NOT NULL , 
ParentDOName   VARCHAR2(50) NOT NULL , 
ParentRoleName   VARCHAR2(50) NULL , 
ChildDOName   VARCHAR2(50) NOT NULL , 
ChildRoleName   VARCHAR2(50) NULL , 
isEnforce   NUMBER(3,0) NOT NULL , 
ParentAttribute   VARCHAR2(50) NULL , 
ChildAttribute   VARCHAR2(50) NULL , 
RolePlayer_CNT   NUMBER(10,0) NULL  )
/

GRANT ALL ON Relationship TO PUBLIC
/

ALTER TABLE Relationship ADD CONSTRAINT PKEY_Relationship PRIMARY KEY( 
RepositoryName, 
RelationshipName)
/

ALTER TABLE Relationship ADD CONSTRAINT U_KeyRelToRelRole_Relationshi UNIQUE(
RepositoryName, 
RelationshipName, 
ParentDOName, 
ChildDOName)
/

INSERT INTO "VSVBTableVersions" VALUES('Relationship','2003-09-05 16:51:45','2003-09-05 16:51:45')
/


DROP TABLE IndexDO CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'IndexDO'

/

CREATE TABLE IndexDO(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
IndexName   VARCHAR2(50) NOT NULL , 
PrimaryIndx   NUMBER(3,0) NOT NULL , 
UniqueIndx   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON IndexDO TO PUBLIC
/

ALTER TABLE IndexDO ADD CONSTRAINT PKEY_IndexDO PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
IndexName)
/

INSERT INTO "VSVBTableVersions" VALUES('IndexDO','2003-04-02 13:14:53','2003-04-02 13:14:53')
/


DROP TABLE QueryAttr CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'QueryAttr'

/

CREATE TABLE QueryAttr(
RepositoryName   VARCHAR2(50) NOT NULL , 
QueryObjectName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
AttrName   VARCHAR2(50) NOT NULL , 
Alias   VARCHAR2(50) NOT NULL , 
AggregationType   VARCHAR2(50) NOT NULL , 
Persistent   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON QueryAttr TO PUBLIC
/

ALTER TABLE QueryAttr ADD CONSTRAINT PKEY_QueryAttr PRIMARY KEY( 
RepositoryName, 
DataObjectName, 
QueryObjectName, 
AttrName, 
Alias)
/

INSERT INTO "VSVBTableVersions" VALUES('QueryAttr','2003-09-12 11:19:18','2003-09-12 11:19:18')
/


DROP TABLE QueryJoinDataObject CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'QueryJoinDataObject'

/

CREATE TABLE QueryJoinDataObject(
RepositoryName   VARCHAR2(50) NOT NULL , 
QueryObjectName   VARCHAR2(50) NOT NULL , 
LeftDataObjectName   VARCHAR2(50) NOT NULL , 
RightDataObjectName   VARCHAR2(50) NOT NULL , 
RelationshipName   VARCHAR2(100) NULL , 
JoinType   VARCHAR2(15) NULL  )
/

GRANT ALL ON QueryJoinDataObject TO PUBLIC
/

ALTER TABLE QueryJoinDataObject ADD CONSTRAINT PKEY_QueryJoinDataObject PRIMARY KEY( 
RepositoryName, 
QueryObjectName, 
LeftDataObjectName, 
RightDataObjectName)
/

INSERT INTO "VSVBTableVersions" VALUES('QueryJoinDataObject','2003-04-02 13:02:30','2003-04-02 13:02:30')
/


DROP TABLE QueryDataObject CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'QueryDataObject'

/

CREATE TABLE QueryDataObject(
RepositoryName   VARCHAR2(50) NOT NULL , 
QueryObjectName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
Alias   VARCHAR2(50) NULL  )
/

GRANT ALL ON QueryDataObject TO PUBLIC
/

ALTER TABLE QueryDataObject ADD CONSTRAINT PKEY_QueryDataObject PRIMARY KEY( 
RepositoryName, 
QueryObjectName, 
DataObjectName, 
Alias)
/

INSERT INTO "VSVBTableVersions" VALUES('QueryDataObject','2003-09-14 15:11:25','2003-09-14 15:11:25')
/


DROP TABLE RSAttribute CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'RSAttribute'

/

CREATE TABLE RSAttribute(
RepositoryName   VARCHAR2(50) NOT NULL , 
ApplicationName   VARCHAR2(100) NOT NULL , 
FormName   VARCHAR2(100) NOT NULL , 
BusinessObject   VARCHAR2(50) NOT NULL , 
AttrName   VARCHAR2(50) NOT NULL , 
isScalar   NUMBER(3,0) NOT NULL , 
isPlaced   NUMBER(3,0) NOT NULL , 
isDisplayed   NUMBER(3,0) NOT NULL , 
RSID   NUMBER(10,0) NOT NULL , 
ColumnLabel   VARCHAR2(150) NULL , 
ClassName   VARCHAR2(150) NULL , 
ColumnEnabled   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON RSAttribute TO PUBLIC
/

ALTER TABLE RSAttribute ADD CONSTRAINT PKEY_RSAttribute PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID, 
AttrName, 
isScalar)
/

INSERT INTO "VSVBTableVersions" VALUES('RSAttribute','2003-10-03 15:41:28','2003-10-03 15:41:28')
/


DROP TABLE Form CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Form'

/

CREATE TABLE Form(
RepositoryName   VARCHAR2(50) NOT NULL , 
RecordSource_Cnt   NUMBER(10,0) NULL , 
ApplicationName   VARCHAR2(100) NOT NULL , 
isJava   NUMBER(3,0) NOT NULL , 
FormName   VARCHAR2(100) NOT NULL , 
RecordSourceCnt   NUMBER(10,0) NULL , 
FormCaption   VARCHAR2(50) NULL , 
FormLayout   VARCHAR2(1500) NULL , 
Gen_Lines_Cnt   NUMBER(10,0) NULL , 
User_Line_Cnt   NUMBER(10,0) NULL , 
Gen_Method_Cnt   NUMBER(10,0) NULL , 
User_Method_Cnt   NUMBER(10,0) NULL , 
Total_Line_Cnt   NUMBER(10,0) NULL , 
Total_Method_Cnt   NUMBER(10,0) NULL , 
Gen_Line_Pct   NUMBER(10,2) NULL , 
User_Line_Pct   NUMBER(10,2) NULL , 
Gen_Method_Pct   NUMBER(10,2) NULL , 
User_Method_Pct   NUMBER(10,2) NULL , 
TransitionCount   NUMBER(10,0) NULL , 
HasCustomFormLayout   NUMBER(3,0) NOT NULL , 
ClassName   VARCHAR2(250) NULL , 
Archetype   VARCHAR2(150) NULL  )
/

GRANT ALL ON Form TO PUBLIC
/

ALTER TABLE Form ADD CONSTRAINT PKEY_Form PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName)
/

INSERT INTO "VSVBTableVersions" VALUES('Form','2003-10-03 15:19:44','2003-10-03 15:19:44')
/


DROP TABLE Application CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Application'

/

CREATE TABLE Application(
RepositoryName   VARCHAR2(50) NOT NULL , 
RepositoryVersion   VARCHAR2(50) NOT NULL , 
Form_Cnt   NUMBER(10,0) NULL , 
ApplicationName   VARCHAR2(100) NOT NULL , 
isJava   NUMBER(3,0) NOT NULL , 
Gen_Lines_Cnt   NUMBER(10,0) NULL , 
User_Line_Cnt   NUMBER(10,0) NULL , 
Gen_Method_Cnt   NUMBER(10,0) NULL , 
User_Method_Cnt   NUMBER(10,0) NULL , 
Total_Line_Cnt   NUMBER(10,0) NULL , 
Total_Method_Cnt   NUMBER(10,0) NULL , 
Gen_Line_Pct   NUMBER(10,2) NULL , 
User_Line_Pct   NUMBER(10,2) NULL , 
Gen_Method_Pct   NUMBER(10,2) NULL , 
User_Method_Pct   NUMBER(10,2) NULL , 
TransitionCnt   NUMBER(10,0) NULL  )
/

GRANT ALL ON Application TO PUBLIC
/

ALTER TABLE Application ADD CONSTRAINT PKEY_Application PRIMARY KEY( 
RepositoryName, 
ApplicationName)
/

INSERT INTO "VSVBTableVersions" VALUES('Application','2003-09-05 17:30:05','2003-09-05 17:30:05')
/


DROP TABLE Transition CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Transition'

/

CREATE TABLE Transition(
RepositoryName   VARCHAR2(50) NOT NULL , 
ApplicationName   VARCHAR2(100) NOT NULL , 
FormName   VARCHAR2(100) NOT NULL , 
TargetFormName   VARCHAR2(100) NOT NULL , 
BusinessObject   VARCHAR2(50) NOT NULL , 
FormTransNum   VARCHAR2(5) NOT NULL , 
Relationship   VARCHAR2(150) NULL , 
ClassName   VARCHAR2(150) NULL , 
IsTargetInitialQueryMode   NUMBER(3,0) NULL , 
IsTargetInitialAddMode   NUMBER(3,0) NULL , 
RelnIsFromParent   NUMBER(3,0) NULL , 
FormTransCaption   VARCHAR2(150) NULL , 
RSID   NUMBER(10,0) NOT NULL  )
/

GRANT ALL ON Transition TO PUBLIC
/

ALTER TABLE Transition ADD CONSTRAINT PKEY_Transition PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID, 
FormTransNum)
/

INSERT INTO "VSVBTableVersions" VALUES('Transition','2003-09-05 17:24:38','2003-09-05 17:24:38')
/


DROP TABLE RecordSource CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'RecordSource'

/

CREATE TABLE RecordSource(
RepositoryName   VARCHAR2(50) NOT NULL , 
ApplicationName   VARCHAR2(100) NOT NULL , 
FormName   VARCHAR2(100) NOT NULL , 
Attr_Cnt   NUMBER(10,0) NULL , 
BusinessObject   VARCHAR2(50) NOT NULL , 
PlacedAttrCnt   NUMBER(10,0) NULL , 
DisplayedAttrCnt   NUMBER(10,0) NULL , 
ScalarGrid   VARCHAR2(10) NULL , 
AllowInsert   NUMBER(3,0) NOT NULL , 
AllowUpdate   NUMBER(3,0) NOT NULL , 
AllowDelete   NUMBER(3,0) NOT NULL , 
Relationship   VARCHAR2(150) NULL , 
ClassName   VARCHAR2(150) NULL , 
RSID   NUMBER(10,0) NOT NULL , 
TransitionCnt   NUMBER(10,0) NULL , 
RecordSourceArchetype   VARCHAR2(250) NULL  )
/

GRANT ALL ON RecordSource TO PUBLIC
/

ALTER TABLE RecordSource ADD CONSTRAINT PKEY_RecordSource PRIMARY KEY( 
RepositoryName, 
ApplicationName, 
FormName, 
BusinessObject, 
RSID)
/

INSERT INTO "VSVBTableVersions" VALUES('RecordSource','2003-10-03 15:23:49','2003-10-03 15:23:49')
/


DROP TABLE Method CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Method'

/

CREATE TABLE Method(
RepositoryName   VARCHAR2(50) NOT NULL , 
MethodName   VARCHAR2(100) NOT NULL , 
ReturnType   VARCHAR2(50) NULL , 
Signature   VARCHAR2(250) NULL , 
ObjectName   VARCHAR2(50) NOT NULL , 
ObjectType   VARCHAR2(10) NOT NULL , 
MethodSource   VARCHAR2(1500) NULL , 
IsPublic   NUMBER(3,0) NOT NULL , 
IsUserDefined   NUMBER(3,0) NOT NULL  )
/

GRANT ALL ON Method TO PUBLIC
/

ALTER TABLE Method ADD CONSTRAINT PKEY_Method PRIMARY KEY( 
RepositoryName, 
ObjectName, 
Signature, 
MethodName, 
ObjectType)
/

INSERT INTO "VSVBTableVersions" VALUES('Method','2003-04-02 12:53:00','2003-04-02 12:53:00')
/


DROP TABLE QueryObject CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'QueryObject'

/

CREATE TABLE QueryObject(
RepositoryName   VARCHAR2(50) NOT NULL , 
QueryObjectName   VARCHAR2(50) NOT NULL , 
SuperClass   VARCHAR2(50) NULL , 
Description   VARCHAR2(1500) NULL , 
DataObject_Cnt   NUMBER(10,0) NULL , 
Reln_Cnt   NUMBER(10,0) NULL , 
RuntimeSql   VARCHAR2(1500) NULL , 
Gen_Lines_Cnt   NUMBER(10,0) NULL , 
User_Line_Cnt   NUMBER(10,0) NULL , 
Gen_Method_Cnt   NUMBER(10,0) NULL , 
User_Method_Cnt   NUMBER(10,0) NULL , 
Total_Line_Cnt   NUMBER(10,0) NULL , 
Total_Method_Cnt   NUMBER(10,0) NULL , 
Gen_Line_Pct   NUMBER(10,2) NULL , 
User_Line_Pct   NUMBER(10,2) NULL , 
Gen_Method_Pct   NUMBER(10,2) NULL , 
User_Method_Pct   NUMBER(10,2) NULL , 
InternalPathName   VARCHAR2(250) NULL , 
Attr_Cnt   NUMBER(10,0) NULL  )
/

GRANT ALL ON QueryObject TO PUBLIC
/

ALTER TABLE QueryObject ADD CONSTRAINT PKEY_QueryObject PRIMARY KEY( 
RepositoryName, 
QueryObjectName)
/

INSERT INTO "VSVBTableVersions" VALUES('QueryObject','2003-09-12 11:21:59','2003-09-12 11:21:59')
/


DROP TABLE DataObject CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'DataObject'

/

CREATE TABLE DataObject(
RepositoryName   VARCHAR2(50) NOT NULL , 
DataObjectName   VARCHAR2(50) NOT NULL , 
isCodedValueList   NUMBER(3,0) NOT NULL , 
SuperClass   VARCHAR2(50) NULL , 
SingularCaption   VARCHAR2(50) NULL , 
PluralCaption   VARCHAR2(50) NULL , 
Description   VARCHAR2(1500) NULL , 
Attr_Cnt   NUMBER(10,0) NULL , 
Constraint_Cnt   NUMBER(10,0) NULL , 
Action_Cnt   NUMBER(10,0) NULL , 
ParentReln_Cnt   NUMBER(10,0) NULL , 
ChildReln_Cnt   NUMBER(10,0) NULL , 
Gen_Lines_Cnt   NUMBER(10,0) NULL , 
User_Line_Cnt   NUMBER(10,0) NULL , 
Gen_Method_Cnt   NUMBER(10,0) NULL , 
User_Method_Cnt   NUMBER(10,0) NULL , 
Total_Line_Cnt   NUMBER(10,0) NULL , 
Total_Method_Cnt   NUMBER(10,0) NULL , 
Gen_Line_Pct   NUMBER(10,2) NULL , 
User_Line_Pct   NUMBER(10,2) NULL , 
Gen_Method_Pct   NUMBER(10,2) NULL , 
User_Method_Pct   NUMBER(10,2) NULL , 
InternalPathName   VARCHAR2(250) NULL  )
/

GRANT ALL ON DataObject TO PUBLIC
/

ALTER TABLE DataObject ADD CONSTRAINT PKEY_DataObject PRIMARY KEY( 
RepositoryName, 
DataObjectName)
/

INSERT INTO "VSVBTableVersions" VALUES('DataObject','2003-08-07 11:02:52','2003-08-07 11:02:52')
/


DROP TABLE OtherFile CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'OtherFile'

/

CREATE TABLE OtherFile(
RepositoryName   VARCHAR2(50) NOT NULL , 
FileName   VARCHAR2(50) NOT NULL , 
User_Line_Cnt   NUMBER(10,0) NULL , 
User_Method_Cnt   NUMBER(10,0) NULL  )
/

GRANT ALL ON OtherFile TO PUBLIC
/

ALTER TABLE OtherFile ADD CONSTRAINT PKEY_OtherFile PRIMARY KEY( 
RepositoryName, 
FileName)
/

INSERT INTO "VSVBTableVersions" VALUES('OtherFile','2003-04-02 12:54:17','2003-04-02 12:54:17')
/


DROP TABLE Repository CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Repository'

/

CREATE TABLE Repository(
RepositoryName   VARCHAR2(50) NOT NULL , 
RepositoryVersion   VARCHAR2(50) NOT NULL , 
DataObject_Cnt   NUMBER(10,0) NULL , 
Relationship_Cnt   NUMBER(10,0) NULL , 
Attr_Cnt   NUMBER(10,0) NULL , 
Action_Cnt   NUMBER(10,0) NULL , 
Constraint_Cnt   NUMBER(10,0) NULL , 
Java_App_Cnt   NUMBER(10,0) NULL , 
HTML_App_Cnt   NUMBER(10,0) NULL , 
Gen_Lines_Cnt   NUMBER(10,0) NULL , 
User_Line_Cnt   NUMBER(10,0) NULL , 
Gen_Method_Cnt   NUMBER(10,0) NULL , 
User_Method_Cnt   NUMBER(10,0) NULL , 
Total_Line_Cnt   NUMBER(10,0) NULL , 
Total_Method_Cnt   NUMBER(10,0) NULL , 
Gen_Line_Pct   NUMBER(10,2) NULL , 
User_Line_Pct   NUMBER(10,2) NULL , 
Gen_Method_Pct   NUMBER(10,2) NULL , 
User_Method_Pct   NUMBER(10,2) NULL , 
Comments   VARCHAR2(255) NULL , 
Other_File_Cnt   NUMBER(10,0) NULL , 
Other_File_Lines   NUMBER(10,0) NULL , 
Other_File_Method_Cnt   NUMBER(10,0) NULL , 
QueryObject_Cnt   NUMBER(10,0) NULL , 
JavaForm_Cnt   NUMBER(10,0) NULL , 
HTML_Form_Cnt   NUMBER(10,0) NULL , 
ReposInternalName   VARCHAR2(50) NOT NULL , 
RootDirectory   VARCHAR2(150) NULL , 
Description   VARCHAR2(250) NULL , 
Database   VARCHAR2(50) NULL  )
/

GRANT ALL ON Repository TO PUBLIC
/

ALTER TABLE Repository ADD CONSTRAINT PKEY_Repository PRIMARY KEY( 
RepositoryName)
/

INSERT INTO "VSVBTableVersions" VALUES('Repository','2003-09-30 11:09:38','2003-09-30 11:09:38')
/


DROP TABLE ReposName CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'ReposName'

/

CREATE TABLE ReposName(
ReposInternalName   VARCHAR2(50) NOT NULL  )
/

GRANT ALL ON ReposName TO PUBLIC
/

ALTER TABLE ReposName ADD CONSTRAINT PKEY_ReposName PRIMARY KEY( 
ReposInternalName)
/

INSERT INTO "VSVBTableVersions" VALUES('ReposName','2003-03-17 16:16:39','2003-03-17 16:16:39')
/


DROP TABLE ReposVersion CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'ReposVersion'

/

CREATE TABLE ReposVersion(
Version   VARCHAR2(50) NOT NULL , 
Comments   VARCHAR2(250) NULL  )
/

GRANT ALL ON ReposVersion TO PUBLIC
/

ALTER TABLE ReposVersion ADD CONSTRAINT PKEY_ReposVersion PRIMARY KEY( 
Version)
/

INSERT INTO "VSVBTableVersions" VALUES('ReposVersion','2003-03-17 16:18:47','2003-03-17 16:18:47')
/


DROP TABLE List_Derivation CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'List_Derivation'

/

CREATE TABLE List_Derivation(
DerivationType   VARCHAR2(50) NOT NULL , 
DerivationName   VARCHAR2(50) NULL  )
/

GRANT ALL ON List_Derivation TO PUBLIC
/

ALTER TABLE List_Derivation ADD CONSTRAINT PKEY_List_Derivation PRIMARY KEY( 
DerivationType)
/

INSERT INTO "VSVBTableVersions" VALUES('List_Derivation','2003-02-26 15:50:45','2003-02-26 15:50:45')
/

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Count', 'Count')
/

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Default', 'Default')
/

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Formula', 'Formula')
/

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('None', 'None')
/

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('ParentReplicate', 'Parent Replicate')
/

INSERT INTO List_Derivation( DerivationType, DerivationName) VALUES ('Sum', 'Sum')
/



DROP TABLE Valid_ObjectType CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Valid_ObjectType'

/

CREATE TABLE Valid_ObjectType(
storedValue   VARCHAR2(12) NOT NULL , 
displayValue   VARCHAR2(50) NULL  )
/

GRANT ALL ON Valid_ObjectType TO PUBLIC
/

ALTER TABLE Valid_ObjectType ADD CONSTRAINT PKEY_Valid_ObjectType PRIMARY KEY( 
storedValue)
/

INSERT INTO "VSVBTableVersions" VALUES('Valid_ObjectType','2003-02-26 15:50:46','2003-02-26 15:50:46')
/

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('DATAOBJECT', 'Data Object')
/

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('QRYOBJECT', 'Query Object')
/

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('APPLICATION', 'Application')
/

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('JAVA_APP', 'Java Application')
/

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('HTML_APP', 'HTML Application')
/

INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('OTHER', 'Other Files')
/



DROP TABLE Valid_SQLTypes CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Valid_SQLTypes'

/

CREATE TABLE Valid_SQLTypes(
SqlType   VARCHAR2(50) NULL  )
/

GRANT ALL ON Valid_SQLTypes TO PUBLIC
/

ALTER TABLE Valid_SQLTypes ADD CONSTRAINT PKEY_Valid_SQLTypes PRIMARY KEY( 
SqlType)
/

INSERT INTO "VSVBTableVersions" VALUES('Valid_SQLTypes','2003-09-30 19:53:10','2003-09-30 19:53:10')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BIT')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TINYINT')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('SMALLINT')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('CHAR')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARCHAR')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('DATETIME')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('FLOAT')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TEXT')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARBINARY')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('MONEY')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('IMAGE')
/

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BINARY')
/



DROP TABLE Valid_TransformRule CASCADE CONSTRAINTS 
/

DELETE "VSVBTableVersions" WHERE "RepositoryTableName" = 'Valid_TransformRule'

/

CREATE TABLE Valid_TransformRule(
TranformRule   VARCHAR2(15) NOT NULL , 
RuleDescription   VARCHAR2(250) NULL  )
/

GRANT ALL ON Valid_TransformRule TO PUBLIC
/

ALTER TABLE Valid_TransformRule ADD CONSTRAINT PKEY_Valid_TransformRule PRIMARY KEY( 
TranformRule)
/

INSERT INTO "VSVBTableVersions" VALUES('Valid_TransformRule','2003-09-30 19:14:33','2003-09-30 19:14:33')
/

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTEQ', 'ASSERT $ROW.COLA = $OTHROW.COLB')
/

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNULL', 'ASSERT $ROW IS NULL')
/

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNOTNULL', 'ASSERT $ROW IS NOT NULL')
/

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('ASSERTNE', 'ASSERT $ROW.COLA <> $OTHROW.COLB')
/

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('CUSTOM', 'Custom Transform')
/

INSERT INTO Valid_TransformRule( TranformRule, RuleDescription) VALUES ('NONE', 'No Transform Defined')
/


