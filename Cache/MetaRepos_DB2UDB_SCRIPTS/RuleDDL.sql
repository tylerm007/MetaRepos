ALTER TABLE Groups ADD CONSTRAINT 
JV__0001Groups
FOREIGN KEY (RepositoryName) REFERENCES 
Repository (RepositoryName)
;

alter table Activity add 
constraint B0444935989706003
check (IsStart in (0,1,-1))
;
alter table Activity add 
constraint B0444935989533004
check (IsEnd in (0,1,-1))
;
alter table Derivation add 
constraint B0444935989580010
check (ParentReplicateIsMaintained in (0,1,-1))
;
ALTER TABLE AttrObjectMapper ADD CONSTRAINT 
JV__0001AttrObject
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName, SourceAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName)
;

ALTER TABLE AttrObjectMapper ADD CONSTRAINT 
JV__0002AttrObject
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName, TargetAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName)
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
JV__0001DataObject
FOREIGN KEY (SourceRepositoryName) REFERENCES 
Repository (RepositoryName)
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
JV__0002DataObject
FOREIGN KEY (TargetRepositoryName) REFERENCES 
Repository (RepositoryName)
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
JV__0003DataObject
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName)
;

ALTER TABLE DataObjectMapper ADD CONSTRAINT 
JV__0004DataObject
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName)
;

alter table Attribute add 
constraint B0444935989290004
check (Persistent in (0,1,-1))
;
alter table Attribute add 
constraint B0444935989302005
check (PreventUserUpdate in (0,1,-1))
;
alter table Attribute add 
constraint B0444935989775006
check (ValueRequired in (0,1,-1))
;
alter table DataObject_Jn_Reln add 
constraint B0444935989014004
check (isParentRole in (0,1,-1))
;
alter table RelationshipRole add 
constraint B0444935989761007
check (isEnforce in (0,1,-1))
;
alter table Relationship add 
constraint B0444935989814007
check (isEnforce in (0,1,-1))
;
alter table IndexDO add 
constraint B0444935989709004
check (PrimaryIndx in (0,1,-1))
;
alter table IndexDO add 
constraint B0444935989045005
check (UniqueIndx in (0,1,-1))
;
alter table QueryAttr add 
constraint B0444935989414007
check (Persistent in (0,1,-1))
;
alter table RSAttribute add 
constraint B0444935989863006
check (isScalar in (0,1,-1))
;
alter table RSAttribute add 
constraint B0444935989790007
check (isPlaced in (0,1,-1))
;
alter table RSAttribute add 
constraint B0444935989374008
check (isDisplayed in (0,1,-1))
;
alter table RSAttribute add 
constraint B0444935989962000
check (ColumnEnabled in (0,1,-1))
;
alter table Form add 
constraint B0444935989871004
check (isJava in (0,1,-1))
;
alter table Form add 
constraint B0444935989056000
check (HasCustomFormLayout in (0,1,-1))
;
alter table Application add 
constraint B0444935989950005
check (isJava in (0,1,-1))
;
alter table Transition add 
constraint B0444935989364009
check (IsTargetInitialQueryMode in (0,1,-1))
;
alter table Transition add 
constraint B0444935989525010
check (IsTargetInitialAddMode in (0,1,-1))
;
alter table Transition add 
constraint B0444935989767011
check (RelnIsFromParent in (0,1,-1))
;
alter table RecordSource add 
constraint B0444935989054009
check (AllowInsert in (0,1,-1))
;
alter table RecordSource add 
constraint B0444935989592010
check (AllowUpdate in (0,1,-1))
;
alter table RecordSource add 
constraint B0444935989469011
check (AllowDelete in (0,1,-1))
;
alter table Method add 
constraint B0444935989298008
check (IsPublic in (0,1,-1))
;
alter table Method add 
constraint B0444935989623009
check (IsUserDefined in (0,1,-1))
;
alter table DataObject add 
constraint B0444935989648003
check (isCodedValueList in (0,1,-1))
;
