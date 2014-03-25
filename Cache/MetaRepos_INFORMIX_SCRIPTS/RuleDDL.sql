ALTER TABLE Groups ADD CONSTRAINT 
FOREIGN KEY (RepositoryName) REFERENCES 
Repository (RepositoryName) CONSTRAINT 
JV__0001Groups
;

alter table Activity add 
constraint 
check (IsStart in (0,1,-1))
constraint Activity_IsStart_B
;
alter table Activity add 
constraint 
check (IsEnd in (0,1,-1))
constraint Activity_IsEnd_BVS
;
alter table Derivation add 
constraint 
check (ParentReplicateIsMaintained in (0,1,-1))
constraint Derivation_ParentR
;
ALTER TABLE AttrObjectMapper ADD CONSTRAINT 
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName, SourceAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName) CONSTRAINT 
JV__0001AttrObject
;

ALTER TABLE AttrObjectMapper ADD CONSTRAINT 
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName, TargetAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName) CONSTRAINT 
JV__0002AttrObject
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
FOREIGN KEY (SourceRepositoryName) REFERENCES 
Repository (RepositoryName) CONSTRAINT 
JV__0001DataObject
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
FOREIGN KEY (TargetRepositoryName) REFERENCES 
Repository (RepositoryName) CONSTRAINT 
JV__0002DataObject
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName) CONSTRAINT 
JV__0003DataObject
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName) CONSTRAINT 
JV__0004DataObject
;

alter table Attribute add 
constraint 
check (Persistent in (0,1,-1))
constraint Attribute_Persiste
;
alter table Attribute add 
constraint 
check (PreventUserUpdate in (0,1,-1))
constraint Attribute_PreventU
;
alter table Attribute add 
constraint 
check (ValueRequired in (0,1,-1))
constraint Attribute_ValueReq
;
alter table DataObject_Jn_Reln add 
constraint 
check (isParentRole in (0,1,-1))
constraint DataObject_Jn_Reln
;
alter table RelationshipRole add 
constraint 
check (isEnforce in (0,1,-1))
constraint RelationshipRole_i
;
alter table Relationship add 
constraint 
check (isEnforce in (0,1,-1))
constraint Relationship_isEnf
;
alter table IndexDO add 
constraint 
check (PrimaryIndx in (0,1,-1))
constraint IndexDO_PrimaryInd
;
alter table IndexDO add 
constraint 
check (UniqueIndx in (0,1,-1))
constraint IndexDO_UniqueIndx
;
alter table QueryAttr add 
constraint 
check (Persistent in (0,1,-1))
constraint QueryAttr_Persiste
;
alter table RSAttribute add 
constraint 
check (isScalar in (0,1,-1))
constraint RSAttribute_isScal
;
alter table RSAttribute add 
constraint 
check (isPlaced in (0,1,-1))
constraint RSAttribute_isPlac
;
alter table RSAttribute add 
constraint 
check (isDisplayed in (0,1,-1))
constraint RSAttribute_isDisp
;
alter table RSAttribute add 
constraint 
check (ColumnEnabled in (0,1,-1))
constraint RSAttribute_Column
;
alter table Form add 
constraint 
check (isJava in (0,1,-1))
constraint Form_isJava_BVSVB
;
alter table Form add 
constraint 
check (HasCustomFormLayout in (0,1,-1))
constraint Form_HasCustomForm
;
alter table Application add 
constraint 
check (isJava in (0,1,-1))
constraint Application_isJava
;
alter table Transition add 
constraint 
check (IsTargetInitialQueryMode in (0,1,-1))
constraint Transition_IsTarge
;
alter table Transition add 
constraint 
check (IsTargetInitialAddMode in (0,1,-1))
constraint Transition_IsTarge
;
alter table Transition add 
constraint 
check (RelnIsFromParent in (0,1,-1))
constraint Transition_RelnIsF
;
alter table RecordSource add 
constraint 
check (AllowInsert in (0,1,-1))
constraint RecordSource_Allow
;
alter table RecordSource add 
constraint 
check (AllowUpdate in (0,1,-1))
constraint RecordSource_Allow
;
alter table RecordSource add 
constraint 
check (AllowDelete in (0,1,-1))
constraint RecordSource_Allow
;
alter table Method add 
constraint 
check (IsPublic in (0,1,-1))
constraint Method_IsPublic_BV
;
alter table Method add 
constraint 
check (IsUserDefined in (0,1,-1))
constraint Method_IsUserDefin
;
alter table DataObject add 
constraint 
check (isCodedValueList in (0,1,-1))
constraint DataObject_isCoded
;
