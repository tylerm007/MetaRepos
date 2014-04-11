SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `ReposName`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReposName` ;

CREATE TABLE IF NOT EXISTS `ReposName` (
  `ReposInternalName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ReposInternalName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ReposVersion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReposVersion` ;

CREATE TABLE IF NOT EXISTS `ReposVersion` (
  `Version` VARCHAR(50) NOT NULL,
  `Comments` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`Version`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Repository`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Repository` ;

CREATE TABLE IF NOT EXISTS `Repository` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `DataObject_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Relationship_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Attr_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Action_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Constraint_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Java_App_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `HTML_App_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Lines_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `User_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `User_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Total_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Total_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Line_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `User_Line_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `Gen_Method_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `User_Method_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `Comments` VARCHAR(255) NULL DEFAULT NULL,
  `Other_File_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Other_File_Lines` SMALLINT(6) NULL DEFAULT NULL,
  `Other_File_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `QueryObject_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `JavaForm_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `HTML_Form_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `ReposInternalName` VARCHAR(50) NOT NULL,
  `RootDirectory` VARCHAR(150) NULL DEFAULT NULL,
  `Description` VARCHAR(250) NULL DEFAULT NULL,
  `Databasename` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`),
  INDEX `fk_Repository_ReposVersion1_idx` (`RepositoryVersion` ASC),
  CONSTRAINT `fk_Repository_ReposName`
    FOREIGN KEY (`RepositoryName`)
    REFERENCES `ReposName` (`ReposInternalName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Repository_ReposVersion1`
    FOREIGN KEY (`RepositoryVersion`)
    REFERENCES `ReposVersion` (`Version`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `DataObject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataObject` ;

CREATE TABLE IF NOT EXISTS `DataObject` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `isCodedValueList` BIT(1) NOT NULL DEFAULT 0,
  `SuperClassName` VARCHAR(50) NULL,
  `SingularCaption` VARCHAR(50) NULL,
  `PluralCaption` VARCHAR(50) NULL,
  `Description` TEXT NULL,
  `Attr_Cnt` SMALLINT(6) NULL,
  `Constraint_Cnt` SMALLINT(6) NULL,
  `Action_Cnt` SMALLINT(6) NULL,
  `ParentReln_Cnt` SMALLINT(6) NULL,
  `ChildReln_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Lines_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `User_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Method_Cnt` SMALLINT(6) NULL,
  `User_Method_Cnt` SMALLINT(6) NULL,
  `Total_Line_Cnt` SMALLINT(6) NULL,
  `Total_Method_Cnt` SMALLINT(6) NULL,
  `Gen_Line_Pct` DECIMAL(10,2) NULL,
  `User_Line_Pct` DECIMAL(10,2) NULL,
  `Gen_Method_Pct` DECIMAL(10,2) NULL,
  `User_Method_Pct` DECIMAL(10,2) NULL,
  `InternalPathName` VARCHAR(250) NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `DataObjectName`),
  CONSTRAINT `fk_DataObject_Repository1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`)
    REFERENCES `Repository` (`RepositoryName` , `RepositoryVersion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `Action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Action` ;

CREATE TABLE IF NOT EXISTS `Action` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `ActionName` VARCHAR(50) NOT NULL,
  `ActionToPerform` TEXT NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Conditions` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`,`DataObjectName`, `ActionName`),
  CONSTRAINT `fk_Action_DataObject1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`, `DataObjectName`)
    REFERENCES `DataObject` (`RepositoryName` , `RepositoryVersion`, `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Activity` WorkFlow
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Activity` ;

CREATE TABLE IF NOT EXISTS `Activity` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `TemplateName` VARCHAR(50) NOT NULL,
  `ActivityName` VARCHAR(50) NOT NULL,
  `IsStart` BIT(1) NOT NULL DEFAULT 1,
  `IsEnd` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`,`TemplateName`, `ActivityName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Application` ;

CREATE TABLE IF NOT EXISTS `Application` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `ApplicationName` VARCHAR(100) NOT NULL,
  `isJava` BIT(1) NOT NULL DEFAULT 1,
  `Form_Cnt` SMALLINT(6) NULL,
  `Gen_Lines_Cnt` SMALLINT(6) NULL,
  `User_Line_Cnt` SMALLINT(6) NULL,
  `Gen_Method_Cnt` SMALLINT(6) NULL,
  `User_Method_Cnt` SMALLINT(6) NULL,
  `Total_Line_Cnt` SMALLINT(6) NULL,
  `Total_Method_Cnt` SMALLINT(6) NULL,
  `Gen_Line_Pct` DECIMAL(10,2) NULL,
  `User_Line_Pct` DECIMAL(10,2) NULL,
  `Gen_Method_Pct` DECIMAL(10,2) NULL,
  `User_Method_Pct` DECIMAL(10,2) NULL,
  `TransitionCnt` SMALLINT(6) NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `ApplicationName`),
  INDEX `fk_Application_Repository1_idx` (`RepositoryName` ASC, `RepositoryVersion` ASC),
  CONSTRAINT `fk_Application_Repository1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`)
    REFERENCES `Repository` (`RepositoryName` , `RepositoryVersion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `AttrObjectMapper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AttrObjectMapper` ;

CREATE TABLE IF NOT EXISTS `AttrObjectMapper` (
  `ProjectName` VARCHAR(50) NOT NULL,
  `SourceRepositoryName` VARCHAR(50) NOT NULL,
  `TargetRepositoryName` VARCHAR(50) NOT NULL,
  `SourceDataObjectName` VARCHAR(50) NOT NULL,
  `TargetDataObjectName` VARCHAR(50) NOT NULL,
  `SourceAttrName` VARCHAR(50) NOT NULL,
  `TargetAttrName` VARCHAR(50) NOT NULL,
  `TransformDesc` VARCHAR(250) NULL DEFAULT NULL,
  `TransformRule` VARCHAR(15) NULL DEFAULT NULL,
  `SourceAttrDatatype` VARCHAR(50) NULL DEFAULT NULL,
  `TargetAttrDatatype` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ProjectName`, `SourceRepositoryName`, `TargetRepositoryName`, `SourceDataObjectName`, `TargetDataObjectName`, `SourceAttrName`, `TargetAttrName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Attribute` ;

CREATE TABLE IF NOT EXISTS `Attribute` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `AttrName` VARCHAR(50) NOT NULL,
  `Persistent` BIT(1) NOT NULL DEFAULT 1,
  `PreventUserUpdate` BIT(1) NOT NULL DEFAULT 0,
  `ValueRequired` BIT(1) NOT NULL DEFAULT 0,
  `DataType` VARCHAR(50) NULL,
  `SQLDataType` VARCHAR(50) NULL,
  `AttrSize` SMALLINT(6) NULL,
  `Description` TEXT NULL,
  `Caption` VARCHAR(250) NULL,
  `Comments` TEXT NULL,
  `Format` VARCHAR(50) NULL,
  `MicroHelp` VARCHAR(50) NULL,
  `Derivation_Cnt` SMALLINT(6) NULL,
  `Validation_Cnt` SMALLINT(6) NULL,
  `Formula_Cnt` SMALLINT(6) NULL,
  `Sum_Cnt` SMALLINT(6) NULL,
  `Count_Cnt` SMALLINT(6) NULL,
  `ParentRepl_Cnt` SMALLINT(6) NULL,
  `Precision1` SMALLINT(6) NULL,
  `Scale` SMALLINT(6) NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `DataObjectName`, `AttrName`),
  CONSTRAINT `fk_Attribute_DataObject1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` , `DataObjectName`)
    REFERENCES `DataObject` (`RepositoryName` , `RepositoryVersion` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `Constraints`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Constraints` ;

CREATE TABLE IF NOT EXISTS `Constraints` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `ConstraintName` VARCHAR(50) NOT NULL,
  `ConditionType` VARCHAR(50) NULL DEFAULT NULL,
  `Conditions` TEXT NULL DEFAULT NULL,
  `ErrorMessage` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`,`RepositoryVersion` , `DataObjectName`, `ConstraintName`),
  CONSTRAINT `fk_Constraints_DataObject1`
    FOREIGN KEY (`RepositoryName` ,`RepositoryVersion` , `DataObjectName`)
    REFERENCES `DataObject` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `DataObjectMapper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataObjectMapper` ;

CREATE TABLE IF NOT EXISTS `DataObjectMapper` (
  `ProjectName` VARCHAR(50) NOT NULL,
  `SourceRepositoryName` VARCHAR(50) NOT NULL,
  `TargetRepositoryName` VARCHAR(50) NOT NULL,
  `SourceDataObjectName` VARCHAR(50) NOT NULL,
  `TargetDataObjectName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ProjectName`, `SourceRepositoryName`, `TargetRepositoryName`, `SourceDataObjectName`, `TargetDataObjectName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `DataObject_Jn_Reln`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataObject_Jn_Reln` ;

CREATE TABLE IF NOT EXISTS `DataObject_Jn_Reln` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `RelationshipName` VARCHAR(150) NOT NULL,
  `isParentRole` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`RepositoryName`,`RepositoryVersion` , `DataObjectName`,`RelationshipName` ))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Derivation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Derivation` ;

CREATE TABLE IF NOT EXISTS `Derivation` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `AttrName` VARCHAR(50) NOT NULL,
  `DerivationType` VARCHAR(50) NOT NULL,
  `DefaultValue` VARCHAR(50) NULL,
  `Formula` TEXT NULL,
  `QualificationExpression` TEXT NULL,
  `SourceAttr` VARCHAR(50) NULL,
  `SourceDataObject` VARCHAR(50) NULL,
  `ParentReplicateIsMaintained` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`DataObjectName`, `AttrName`, `DerivationType`),
  CONSTRAINT `fk_Derivation_Attribute1`
    FOREIGN KEY (`RepositoryName` ,`RepositoryVersion` , `DataObjectName` , `AttrName`)
    REFERENCES `Attribute` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName` , `AttrName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Form`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Form` ;

CREATE TABLE IF NOT EXISTS `Form` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `ApplicationName` VARCHAR(100) NOT NULL,
  `FormName` VARCHAR(100) NOT NULL,
  `isJava` BIT(1) NOT NULL DEFAULT 1,
  `RecordSource_Cnt` SMALLINT(6) NULL,
  `RecordSourceCnt` SMALLINT(6) NULL,
  `FormCaption` VARCHAR(50) NULL,
  `FormLayout` TEXT NULL,
  `Gen_Lines_Cnt` SMALLINT(6) NULL,
  `User_Line_Cnt` SMALLINT(6) NULL,
  `Gen_Method_Cnt` SMALLINT(6) NULL,
  `User_Method_Cnt` SMALLINT(6) NULL,
  `Total_Line_Cnt` SMALLINT(6) NULL,
  `Total_Method_Cnt` SMALLINT(6) NULL,
  `Gen_Line_Pct` DECIMAL(10,2) NULL,
  `User_Line_Pct` DECIMAL(10,2) NULL,
  `Gen_Method_Pct` DECIMAL(10,2) NULL,
  `User_Method_Pct` DECIMAL(10,2) NULL,
  `TransitionCount` SMALLINT(6) NULL,
  `HasCustomFormLayout` BIT(1) NOT NULL DEFAULT 1,
  `DefinedClassName` VARCHAR(250) NULL,
  `Archetype` VARCHAR(150) NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`ApplicationName`, `FormName`),
  CONSTRAINT `fk_Form_Application1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ApplicationName`)
    REFERENCES `Application` (`RepositoryName` , `RepositoryVersion` ,`ApplicationName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `Owner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Owner` ;

CREATE TABLE IF NOT EXISTS `Owner` (
  `OwnerID` VARCHAR(50) NOT NULL,
  `OwnerName` VARCHAR(150) NULL DEFAULT NULL,
  `Email` VARCHAR(75) NULL DEFAULT NULL,
  `Phone` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`OwnerID`))

DEFAULT CHARACTER SET = latin1;

-- insert into owner values('1','admin','email@gmail.com','999-999-9999');

-- -----------------------------------------------------
-- Table `Groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Groups` ;

CREATE TABLE IF NOT EXISTS `Groups` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `GroupName` VARCHAR(100) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `ParentGroupName` VARCHAR(50) NULL DEFAULT 'DataObject',
  `OwnerID` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `GroupName`),
  INDEX `fk_Groups_Owner1_idx` (`OwnerID` ASC),
  CONSTRAINT `fk_Groups_Owner1`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `Owner` (`OwnerID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Groups_Repository1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`)
    REFERENCES `Repository` (`RepositoryName` , `RepositoryVersion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `IndexDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IndexDO` ;

CREATE TABLE IF NOT EXISTS `IndexDO` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(5) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `IndexName` VARCHAR(50) NOT NULL,
  `PrimaryIndx` BIT(1) NOT NULL DEFAULT 1,
  `UniqueIndx` BIT(1) NOT NULL DEFAULT 0,
  `IgnoreNulls` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`DataObjectName`, `IndexName`),
  CONSTRAINT `fk_IndexDO_DataObject1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`DataObjectName`)
    REFERENCES `DataObject` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `IndexAttr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IndexAttr` ;

CREATE TABLE IF NOT EXISTS `IndexAttr` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `IndexName` VARCHAR(50) NOT NULL,
  `IndexAttrName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`DataObjectName`, `IndexName`, `IndexAttrName`),
  INDEX `fk_IndexAttr_Attribute1_idx` (`RepositoryName` ASC, `DataObjectName` ASC, `IndexAttrName` ASC),
  CONSTRAINT `fk_IndexAttr_IndexDO1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`DataObjectName` , `IndexName`)
    REFERENCES `IndexDO` (`RepositoryName` , `RepositoryVersion` ,`DataObjectName` , `IndexName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IndexAttr_Attribute1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`DataObjectName` , `IndexAttrName`)
    REFERENCES `Attribute` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName` , `AttrName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `List_Derivation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `List_Derivation` ;

CREATE TABLE IF NOT EXISTS `List_Derivation` (
  `DerivationType` VARCHAR(50) NOT NULL,
  `DerivationName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`DerivationType`))
;


-- -----------------------------------------------------
-- Table `Method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Method` ;

CREATE TABLE IF NOT EXISTS `Method` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `TheMethodName` VARCHAR(100) NOT NULL,
  `ReturnType` VARCHAR(50) NULL,
  `TheSignature` VARCHAR(250) NOT NULL,
  `TheObjectName` VARCHAR(50) NOT NULL,
  `TheObjectType` VARCHAR(10) NOT NULL,
  `MethodSource` TEXT NULL,
  `IsPUBLIC` BIT(1) NOT NULL DEFAULT 1,
  `IsUserDefined` BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `TheMethodName`, `TheSignature`, `TheObjectName`, `TheObjectType`),
  INDEX `fk_Method_Repository1_idx` (`RepositoryName` ASC, `RepositoryVersion` ASC),
  CONSTRAINT `fk_Method_Repository1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`)
    REFERENCES `Repository` (`RepositoryName` , `RepositoryVersion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `ObjectDiff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ObjectDiff` ;

CREATE TABLE IF NOT EXISTS `ObjectDiff` (
  `ReposName1` VARCHAR(50) NOT NULL,
  `ReposName2` VARCHAR(50) NOT NULL,
  `ObjectName1` VARCHAR(50) NOT NULL,
  `ObjectName2` VARCHAR(50) NOT NULL,
  `ObjectType` VARCHAR(50) NOT NULL,
  `DiffComment` VARCHAR(250) NULL DEFAULT NULL,
  `Total_1_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Total_2_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Line_Cnt_Diff` SMALLINT(6) NULL DEFAULT NULL,
  `Total_1_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Total_2_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Method_Cnt_Diff` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ReposName1`, `ObjectName1`, `ReposName2`, `ObjectName2`, `ObjectType`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Object_JN_Group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Object_JN_Group` ;

CREATE TABLE IF NOT EXISTS `Object_JN_Group` (
  `RepositoryName` VARCHAR(50) NOT NULL,
   `RepositoryVersion` VARCHAR(50) NOT NULL,
  `GroupName` VARCHAR(100) NOT NULL,
  `ObjectName` VARCHAR(50) NOT NULL,
  `ObjectType` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`RepositoryName`,  `RepositoryVersion`,`GroupName`, `ObjectName`, `ObjectType`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OtherFile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OtherFile` ;

CREATE TABLE IF NOT EXISTS `OtherFile` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `OtherFileName` VARCHAR(50) NOT NULL,
  `User_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `User_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `OtherFileName`),
  CONSTRAINT `fk_OtherFile_Repository1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`)
    REFERENCES `Repository` (`RepositoryName` ,`RepositoryVersion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `Project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project` ;

CREATE TABLE IF NOT EXISTS `Project` (
`RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `ProjectName` VARCHAR(50) NOT NULL,
  `ProjectDescription` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName` ,`RepositoryVersion`,`ProjectName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `QueryDataObject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `QueryDataObject` ;

CREATE TABLE IF NOT EXISTS `QueryDataObject` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `QueryObjectName` VARCHAR(50) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `Alias` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `QueryObjectName`, `DataObjectName`),
  INDEX `fk_QueryDataObject_DataObject1_idx` (`RepositoryName` ASC, `DataObjectName` ASC),
  CONSTRAINT `fk_QueryDataObject_DataObject1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`DataObjectName`)
    REFERENCES `DataObject` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QueryDataObject_Repository1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion`)
    REFERENCES `Repository` (`RepositoryName` , `RepositoryVersion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `QueryAttr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `QueryAttr` ;

CREATE TABLE IF NOT EXISTS `QueryAttr` (
  `RepositoryName` VARCHAR(50) NOT NULL,
   `RepositoryVersion` VARCHAR(50) NOT NULL,
  `QueryObjectName` VARCHAR(50) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `AttrName` VARCHAR(50) NOT NULL,
  `Alias` VARCHAR(50) NOT NULL,
  `AggregationType` VARCHAR(50) NOT NULL,
  `IsPersistent` BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`QueryObjectName`,`DataObjectName`,  `AttrName`),
  INDEX `fk_QueryAttr_QueryDataObject1_idx` (`RepositoryName` ASC, `QueryObjectName` ASC, `DataObjectName` ASC),
  INDEX `fk_QueryAttr_Attribute1_idx` (`RepositoryName` ASC, `DataObjectName` ASC, `AttrName` ASC),
  CONSTRAINT `fk_QueryAttr_QueryDataObject1`
    FOREIGN KEY (`RepositoryName` ,`RepositoryVersion` , `QueryObjectName` , `DataObjectName`)
    REFERENCES `QueryDataObject` (`RepositoryName` ,`RepositoryVersion` , `QueryObjectName` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QueryAttr_Attribute1`
    FOREIGN KEY (`RepositoryName` ,`RepositoryVersion` , `DataObjectName` , `AttrName`)
    REFERENCES `Attribute` (`RepositoryName` , `RepositoryVersion` ,`DataObjectName` , `AttrName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `Relationship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Relationship` ;

CREATE TABLE IF NOT EXISTS `Relationship` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `RelationshipName` VARCHAR(150) NOT NULL,
  `ParentDOName` VARCHAR(50) NOT NULL,
  `ParentRoleName` VARCHAR(50) NULL,
  `ChildDOName` VARCHAR(50) NOT NULL,
  `ChildRoleName` VARCHAR(50) NULL,
  `IsEnforce` BIT(1) NOT NULL DEFAULT 1,
  `ParentAttribute` VARCHAR(50) NOT NULL,
  `ChildAttribute` VARCHAR(50) NOT NULL,
  `RolePlayer_CNT` SMALLINT(6) NULL,
  PRIMARY KEY (`RepositoryName`,`RepositoryVersion` ,`RelationshipName`, `ChildDOName`, `ParentDOName`),
  UNIQUE INDEX `UKeyRelToRelRole` (`RepositoryName` ASC, `RelationshipName` ASC, `ParentDOName` ASC, `ChildDOName` ASC),
  INDEX `fk_Relationship_DataObject1_idx` (`RepositoryName` ASC, `RepositoryVersion` ASC,`ParentDOName` ASC),
  INDEX `fk_Relationship_DataObject2_idx` (`RepositoryName` ASC, `RepositoryVersion` ASC,`ChildDOName` ASC),
  INDEX `fk_Relationship_Attribute1_idx` (`RepositoryName` ASC, `RepositoryVersion` ASC,`ParentDOName` ASC, `ParentAttribute` ASC),
  INDEX `fk_Relationship_Attribute2_idx` (`RepositoryName` ASC, `RepositoryVersion` ASC,`ChildDOName` ASC, `ChildAttribute` ASC),
  CONSTRAINT `fk_Relationship_Repository1`
    FOREIGN KEY (`RepositoryName`,`RepositoryVersion` )
    REFERENCES `Repository` (`RepositoryName`,`RepositoryVersion`)
    ON DELETE cascade
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relationship_DataObject1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ParentDOName`)
    REFERENCES `DataObject` (`RepositoryName` , `RepositoryVersion` ,`DataObjectName`)
    ON DELETE cascade
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relationship_DataObject2`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ChildDOName`)
    REFERENCES `DataObject` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName`)
    ON DELETE cascade
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relationship_Attribute1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ParentDOName` , `ParentAttribute`)
    REFERENCES `Attribute` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName` , `AttrName`)
    ON DELETE cascade
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relationship_Attribute2`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ChildDOName` , `ChildAttribute`)
    REFERENCES `Attribute` (`RepositoryName` ,`RepositoryVersion` , `DataObjectName` , `AttrName`)
    ON DELETE cascade
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `QueryJoinDataObject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `QueryJoinDataObject` ;

CREATE TABLE IF NOT EXISTS `QueryJoinDataObject` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `QueryObjectName` VARCHAR(50) NOT NULL,
  `LeftDataObjectName` VARCHAR(50) NOT NULL,
  `RightDataObjectName` VARCHAR(50) NOT NULL,
  `RelationshipName` VARCHAR(100) NOT NULL,
  `JoinType` VARCHAR(15) NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`QueryObjectName`, `LeftDataObjectName`, `RightDataObjectName`, `RelationshipName`),
  INDEX `fk_QueryJoinRightDataObjec` (`RepositoryName` ASC, `RepositoryVersion` ASC,`QueryObjectName` ASC, `RightDataObjectName` ASC),
  INDEX `fk_QueryJoinLeftDataObject` (`RepositoryName` ASC, `RepositoryVersion` ASC, `RelationshipName` ASC),
  CONSTRAINT `fk_QueryJoinDataObject_QueryDataObject1`
    FOREIGN KEY (`RepositoryName` ,`RepositoryVersion` , `QueryObjectName` , `LeftDataObjectName`)
    REFERENCES `QueryDataObject` (`RepositoryName` ,`RepositoryVersion` , `QueryObjectName` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QueryJoinDataObject_QueryDataObject2`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`QueryObjectName` , `RightDataObjectName`)
    REFERENCES `QueryDataObject` (`RepositoryName` , `RepositoryVersion` ,`QueryObjectName` , `DataObjectName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QueryJoinDataObject_Relationship1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`RelationshipName`)
    REFERENCES `Relationship` (`RepositoryName` ,`RepositoryVersion` , `RelationshipName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `QueryObject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `QueryObject` ;

CREATE TABLE IF NOT EXISTS `QueryObject` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(50) NOT NULL,
  `QueryObjectName` VARCHAR(50) NOT NULL,
  `SuperClass` VARCHAR(50) NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `DataObject_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Reln_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `RuntimeSql` TEXT NULL DEFAULT NULL,
  `Gen_Lines_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `User_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `User_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Total_Line_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Total_Method_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  `Gen_Line_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `User_Line_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `Gen_Method_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `User_Method_Pct` DECIMAL(10,2) NULL DEFAULT NULL,
  `InternalPathName` VARCHAR(250) NULL DEFAULT NULL,
  `Attr_Cnt` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`QueryObjectName`),
  CONSTRAINT `fk_Query_Repository`
      FOREIGN KEY (`RepositoryName` ,`RepositoryVersion`)
      REFERENCES `Repository` (`RepositoryName` ,`RepositoryVersion` )
      ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RSAttribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RSAttribute` ;

CREATE TABLE IF NOT EXISTS `RSAttribute` (
  `RepositoryName` VARCHAR(50) NOT NULL,
`RepositoryVersion` VARCHAR(50) NOT NULL,
  `ApplicationName` VARCHAR(100) NOT NULL,
  `FormName` VARCHAR(100) NOT NULL,
  `BusinessObject` VARCHAR(50) NOT NULL,
  `AttrName` VARCHAR(50) NOT NULL,
  `isScalar` BIT(1) NOT NULL DEFAULT 0,
  `isPlaced` BIT(1) NOT NULL DEFAULT 0,
  `isDisplayed` BIT(1) NOT NULL DEFAULT 1,
  `RSID` SMALLINT(6) NOT NULL,
  `ColumnLabel` VARCHAR(150) NULL DEFAULT NULL,
  `ClassName` VARCHAR(150) NULL DEFAULT NULL,
  `ColumnEnabled` BIT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`ApplicationName`,`FormName`,`BusinessObject`,`AttrName`))
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RecordSource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RecordSource` ;

CREATE TABLE IF NOT EXISTS `RecordSource` (
  `RepositoryName` VARCHAR(50) NOT NULL,
`RepositoryVersion` VARCHAR(50) NOT NULL ,
  `ApplicationName` VARCHAR(100) NOT NULL,
  `FormName` VARCHAR(100) NOT NULL,
  `Attr_Cnt` SMALLINT(6) NULL,
  `BusinessObject` VARCHAR(50) NOT NULL,
  `PlacedAttrCnt` SMALLINT(6) NULL,
  `DisplayedAttrCnt` SMALLINT(6) NULL,
  `ScalarGrid` VARCHAR(10) NULL,
  `AllowInsert` BIT(1) NOT NULL DEFAULT 1,
  `AllowUpdate` BIT(1) NOT NULL DEFAULT 1,
  `AllowDelete` BIT(1) NOT NULL DEFAULT 1,
  `Relationship` VARCHAR(150) NULL,
  `ClassName` VARCHAR(150) NULL,
  `RSID` SMALLINT(6) NOT NULL,
  `TransitionCnt` SMALLINT(6) NULL,
  `RecordSourceArchetype` VARCHAR(250) NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`ApplicationName`, `FormName`),
  CONSTRAINT `fk_RecordSource_Form1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ApplicationName` , `FormName`)
    REFERENCES `Form` (`RepositoryName` ,`RepositoryVersion` , `ApplicationName` , `FormName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RelationshipRole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RelationshipRole` ;

CREATE TABLE IF NOT EXISTS `RelationshipRole` (
  `RepositoryName` VARCHAR(50) NOT NULL,
`RepositoryVersion` VARCHAR(50) NOT NULL ,
  `RelationshipName` VARCHAR(150) NOT NULL,
  `ParentDOName` VARCHAR(50) NOT NULL,
  `ParentRoleName` VARCHAR(50) NOT NULL,
  `ChildDOName` VARCHAR(50) NOT NULL,
  `ChildRoleName` VARCHAR(50) NOT NULL,
  `isEnforce` BIT(1) NOT NULL  DEFAULT 0,
  `ParentAttribute` VARCHAR(250) NULL DEFAULT NULL,
  `ChildAttribute` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`RelationshipName`, `ParentRoleName`, `ChildRoleName`, `ParentDOName`, `ChildDOName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ReposDiff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ReposDiff` ;

CREATE TABLE IF NOT EXISTS `ReposDiff` (
  `ReposName1` VARCHAR(50) NOT NULL,
  `ReposName2` VARCHAR(50) NOT NULL,
  `Repos1Version` VARCHAR(50) NULL DEFAULT NULL,
  `Repos2Version` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ReposName1`, `ReposName2`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Template`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Template` ;

CREATE TABLE IF NOT EXISTS `Template` (
  `TemplateName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`TemplateName`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Transition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Transition` ;

CREATE TABLE IF NOT EXISTS `Transition` (
  `RepositoryName` VARCHAR(50) NOT NULL,
`RepositoryVersion` VARCHAR(50) NOT NULL,
  `ApplicationName` VARCHAR(100) NOT NULL,
  `FormName` VARCHAR(100) NOT NULL,
  `TargetFormName` VARCHAR(100) NOT NULL,
  `BusinessObject` VARCHAR(50) NOT NULL,
  `FormTransNum` VARCHAR(5) NOT NULL,
  `Relationship` VARCHAR(150) NULL,
  `ClassName` VARCHAR(150) NULL,
  `IsTargetInitialQueryMode` BIT(1) NULL DEFAULT 0,
  `IsTargetInitialAddMode` BIT(1) NULL DEFAULT 0,
  `RelnIsFromParent` BIT(1) NULL DEFAULT 0,
  `FormTransCaption` VARCHAR(150) NULL,
  `RSID` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion` ,`ApplicationName`, `FormName`, `BusinessObject`, `RSID`, `FormTransNum`),
  INDEX `fk_Transition_Form2_idx` (`RepositoryName` ASC, `ApplicationName` ASC, `TargetFormName` ASC),
  CONSTRAINT `fk_Transition_Form1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ApplicationName` , `FormName`)
    REFERENCES `Form` (`RepositoryName` ,`RepositoryVersion` , `ApplicationName` , `FormName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transition_Form2`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` ,`ApplicationName` , `TargetFormName`)
    REFERENCES `Form` (`RepositoryName` ,`RepositoryVersion` , `ApplicationName` , `FormName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Valid_ObjectType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Valid_ObjectType` ;

CREATE TABLE IF NOT EXISTS `Valid_ObjectType` (
  `storedValue` VARCHAR(12) NOT NULL,
  `displayValue` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`storedValue`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Valid_SQLTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Valid_SQLTypes` ;

CREATE TABLE IF NOT EXISTS `Valid_SQLTypes` (
  `SqlType` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`SqlType`))

DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Validation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Validation` ;

CREATE TABLE IF NOT EXISTS `Validation` (
  `RepositoryName` VARCHAR(50) NOT NULL,
  `RepositoryVersion` VARCHAR(45) NOT NULL,
  `DataObjectName` VARCHAR(50) NOT NULL,
  `AttrName` VARCHAR(50) NOT NULL,
  `ValidationType` VARCHAR(50) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `CodedValueList` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`RepositoryName`, `RepositoryVersion`, `DataObjectName`, `AttrName`, `ValidationType`),
  CONSTRAINT `fk_Validation_Attribute1`
    FOREIGN KEY (`RepositoryName` , `RepositoryVersion` , `DataObjectName` , `AttrName`)
    REFERENCES `Attribute` (`RepositoryName` , `RepositoryVersion` , `DataObjectName` , `AttrName`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `WFTransition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WFTransition` ;

CREATE TABLE IF NOT EXISTS `WFTransition` (
  `TemplateName` VARCHAR(50) NOT NULL,
  `SourceActivityName` VARCHAR(50) NOT NULL,
  `TargetActivityName` VARCHAR(50) NOT NULL,
  `Conditions` VARCHAR(250) NULL DEFAULT NULL,
  `Action` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`TemplateName`, `SourceActivityName`, `TargetActivityName`))

DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BIT');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TINYINT');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('SMALLINT');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARCHAR');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('DATETIME');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('FLOAT');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('TEXT');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('VARBINARY');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('MONEY');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('IMAGE');
INSERT INTO Valid_SQLTypes( SqlType) VALUES ('BINARY');


INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('DATAOBJECT', 'Data Object');
INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('QRYOBJECT', 'Query Object');
INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('APPLICATION', 'Application');
INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('JAVA_APP', 'Java Application');
INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('HTML_APP', 'HTML Application');
INSERT INTO Valid_ObjectType( storedValue, displayValue) VALUES ('OTHER', 'Other Files');