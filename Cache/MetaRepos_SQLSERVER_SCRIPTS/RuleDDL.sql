ALTER TABLE Groups WITH NOCHECK ADD CONSTRAINT JV__0001Groups
FOREIGN KEY (RepositoryName) REFERENCES 
Repository (RepositoryName)
go

ALTER TABLE AttrObjectMapper WITH NOCHECK ADD CONSTRAINT JV__0001AttrObjectMapper
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName, SourceAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName)
go

ALTER TABLE AttrObjectMapper WITH NOCHECK ADD CONSTRAINT JV__0002AttrObjectMapper
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName, TargetAttrName) REFERENCES 
Attribute (RepositoryName, DataObjectName, AttrName)
go

ALTER TABLE DataObjectMapper WITH NOCHECK ADD CONSTRAINT JV__0001DataObjectMapper
FOREIGN KEY (SourceRepositoryName) REFERENCES 
Repository (RepositoryName)
go

ALTER TABLE DataObjectMapper WITH NOCHECK ADD CONSTRAINT JV__0002DataObjectMapper
FOREIGN KEY (TargetRepositoryName) REFERENCES 
Repository (RepositoryName)
go

ALTER TABLE DataObjectMapper WITH NOCHECK ADD CONSTRAINT JV__0003DataObjectMapper
FOREIGN KEY (SourceRepositoryName, SourceDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName)
go

ALTER TABLE DataObjectMapper WITH NOCHECK ADD CONSTRAINT JV__0004DataObjectMapper
FOREIGN KEY (TargetRepositoryName, TargetDataObjectName) REFERENCES 
DataObject (RepositoryName, DataObjectName)
go

