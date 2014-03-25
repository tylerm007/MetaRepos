ALTER TABLE Groups ADD CONSTRAINT JV__0001Groups
FOREIGN KEY (RepositoryName) REFERENCES 
Repository (RepositoryName)
/

alter table Activity add ( 
constraint 
Activity_IsStart_BVSVB
check (IsStart in (0,1,-1))
,
constraint 
Activity_IsEnd_BVSVB
check (IsEnd in (0,1,-1))
)
/

alter table Derivation add ( 
constraint 
Derivation_ParentReplicateIsM
check (ParentReplicateIsMaintained in (0,1,-1))
)
/

ALTER TABLE AttrObjectMapper ADD CONSTRAINT JV__0001AttrObjectMapper
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName, SourceAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName)
/

ALTER TABLE AttrObjectMapper ADD CONSTRAINT JV__0002AttrObjectMapper
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName, TargetAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName)
/

ALTER TABLE DataObjectMapper ADD CONSTRAINT JV__0001DataObjectMapper
FOREIGN KEY (SourceRepositoryName) REFERENCES 
Repository (RepositoryName)
/

ALTER TABLE DataObjectMapper ADD CONSTRAINT JV__0002DataObjectMapper
FOREIGN KEY (TargetRepositoryName) REFERENCES 
Repository (RepositoryName)
/

ALTER TABLE DataObjectMapper ADD CONSTRAINT JV__0003DataObjectMapper
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName)
/

ALTER TABLE DataObjectMapper ADD CONSTRAINT JV__0004DataObjectMapper
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName)
/

alter table Attribute add ( 
constraint 
Attribute_Persistent_BVSVB
check (Persistent in (0,1,-1))
,
constraint 
Attribute_PreventUserUpdate_B
check (PreventUserUpdate in (0,1,-1))
,
constraint 
Attribute_ValueRequired_BVSVB
check (ValueRequired in (0,1,-1))
)
/

alter table DataObject_Jn_Reln add ( 
constraint 
DataObject_Jn_Reln_isParentRo
check (isParentRole in (0,1,-1))
)
/

alter table RelationshipRole add ( 
constraint 
RelationshipRole_isEnforce_BV
check (isEnforce in (0,1,-1))
)
/

alter table Relationship add ( 
constraint 
Relationship_isEnforce_BVSVB
check (isEnforce in (0,1,-1))
)
/

alter table IndexDO add ( 
constraint 
IndexDO_PrimaryIndx_BVSVB
check (PrimaryIndx in (0,1,-1))
,
constraint 
IndexDO_UniqueIndx_BVSVB
check (UniqueIndx in (0,1,-1))
)
/

alter table QueryAttr add ( 
constraint 
QueryAttr_Persistent_BVSVB
check (Persistent in (0,1,-1))
)
/

alter table RSAttribute add ( 
constraint 
RSAttribute_isScalar_BVSVB
check (isScalar in (0,1,-1))
,
constraint 
RSAttribute_isPlaced_BVSVB
check (isPlaced in (0,1,-1))
,
constraint 
RSAttribute_isDisplayed_BVSVB
check (isDisplayed in (0,1,-1))
,
constraint 
RSAttribute_ColumnEnabled_BVS
check (ColumnEnabled in (0,1,-1))
)
/

alter table Form add ( 
constraint 
Form_isJava_BVSVB
check (isJava in (0,1,-1))
,
constraint 
Form_HasCustomFormLayout_BVSV
check (HasCustomFormLayout in (0,1,-1))
)
/

alter table Application add ( 
constraint 
Application_isJava_BVSVB
check (isJava in (0,1,-1))
)
/

alter table Transition add ( 
constraint 
Transition_IsTargetInitialQue
check (IsTargetInitialQueryMode in (0,1,-1))
,
constraint 
Transition_IsTargetInitialAdd
check (IsTargetInitialAddMode in (0,1,-1))
,
constraint 
Transition_RelnIsFromParent_B
check (RelnIsFromParent in (0,1,-1))
)
/

alter table RecordSource add ( 
constraint 
RecordSource_AllowInsert_BVSV
check (AllowInsert in (0,1,-1))
,
constraint 
RecordSource_AllowUpdate_BVSV
check (AllowUpdate in (0,1,-1))
,
constraint 
RecordSource_AllowDelete_BVSV
check (AllowDelete in (0,1,-1))
)
/

alter table Method add ( 
constraint 
Method_IsPublic_BVSVB
check (IsPublic in (0,1,-1))
,
constraint 
Method_IsUserDefined_BVSVB
check (IsUserDefined in (0,1,-1))
)
/

alter table DataObject add ( 
constraint 
DataObject_isCodedValueList_B
check (isCodedValueList in (0,1,-1))
)
/

