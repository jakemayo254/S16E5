DROP TABLE Department CASCADE CONSTRAINTS ;

DROP TABLE Employees_Projects CASCADE CONSTRAINTS ;

DROP TABLE Parent_Child CASCADE CONSTRAINTS ;

DROP TABLE Person CASCADE CONSTRAINTS ;

DROP TABLE Project CASCADE CONSTRAINTS ;

CREATE TABLE Department
  (
    dept_id   INTEGER NOT NULL ,
    dept_name VARCHAR2 (200)
  ) ;
ALTER TABLE Department ADD CONSTRAINT Department_PK PRIMARY KEY ( dept_id ) ;


CREATE TABLE Employees_Projects
  (
    employees_projects_id INTEGER NOT NULL ,
    project_employee      INTEGER NOT NULL ,
    project_id            INTEGER NOT NULL
  ) ;
ALTER TABLE Employees_Projects ADD CONSTRAINT Projects_PKv1 PRIMARY KEY ( employees_projects_id ) ;
ALTER TABLE Employees_Projects ADD CONSTRAINT Projects_PK UNIQUE ( employees_projects_id ) ;


CREATE TABLE Parent_Child
  (
    parent_child_id INTEGER NOT NULL ,
    parent_id       INTEGER NOT NULL ,
    child_id        INTEGER NOT NULL
  ) ;
ALTER TABLE Parent_Child ADD CONSTRAINT Parent_Child_PK PRIMARY KEY ( parent_child_id ) ;


CREATE TABLE Person
  (
    person_id        INTEGER NOT NULL ,
    type             VARCHAR2 (200) ,
    first_name       VARCHAR2 (200) ,
    last_name        VARCHAR2 (200) ,
    home_address     VARCHAR2 (200) ,
    zipcode          INTEGER ,
    home_phone       INTEGER ,
    us_citizen       CHAR (1) ,
    employee_id      INTEGER ,
    salary           INTEGER ,
    salary_exception CHAR (1) ,
    isFired          CHAR (1) ,
    bonus            INTEGER ,
    dept_id          INTEGER NOT NULL ,
    employees_id     INTEGER NOT NULL ,
    spouse_id        INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Person__IDX ON Person
  (
    spouse_id ASC
  )
  ;
ALTER TABLE Person ADD CONSTRAINT Person_PK PRIMARY KEY ( person_id ) ;


CREATE TABLE Project
  (
    project_id       INTEGER NOT NULL ,
    project_title    VARCHAR2 (200) ,
    type             VARCHAR2 (200) ,
    project_active   CHAR (1) ,
    end_date         DATE ,
    est_person_hours INTEGER ,
    master_project   INTEGER ,
    manager_id     INTEGER NOT NULL ,
    dept_id          INTEGER NOT NULL ,
    sub_project      INTEGER NOT NULL
  ) ;
ALTER TABLE Project ADD CONSTRAINT Project_PK PRIMARY KEY ( project_id ) ;


ALTER TABLE Parent_Child ADD CONSTRAINT Parent_Child_Person_FK FOREIGN KEY ( parent_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Parent_Child ADD CONSTRAINT Parent_Child_Person_FKv1 FOREIGN KEY ( child_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Person ADD CONSTRAINT Person_Department_FK FOREIGN KEY ( dept_id ) REFERENCES Department ( dept_id ) ;

ALTER TABLE Person ADD CONSTRAINT Person_Person_FK FOREIGN KEY ( employees_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Person ADD CONSTRAINT Person_Person_FKv2 FOREIGN KEY ( spouse_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Project ADD CONSTRAINT Project_Department_FK FOREIGN KEY ( dept_id ) REFERENCES Department ( dept_id ) ;

ALTER TABLE Project ADD CONSTRAINT Project_Person_FK FOREIGN KEY ( manager_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Project ADD CONSTRAINT Project_Project_FK FOREIGN KEY ( sub_project ) REFERENCES Project ( project_id ) ;

ALTER TABLE Employees_Projects ADD CONSTRAINT Projects_Person_FK FOREIGN KEY ( project_employee ) REFERENCES Person ( person_id ) ;

ALTER TABLE Employees_Projects ADD CONSTRAINT Projects_Project_FK FOREIGN KEY ( project_id ) REFERENCES Project ( project_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             1
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0