drop table PERSON_ROLE
/
drop table PERSON
/
drop table ROLE
/
CREATE TABLE PERSON (
	ID VARCHAR(32) not null 
	,LOGIN VARCHAR(255) not null
	,PASSWORD VARCHAR(255) not null
	,EMAIL VARCHAR(255) not null
	,IS_ENABLED TINYINT(1)
	,CIVILITY VARCHAR(2)
	,FIRST_NAME VARCHAR(255)
	,LAST_NAME VARCHAR(255)
	,BIRTH_DATE TIMESTAMP
	,VERSION INTEGER(10) default 0,
    PRIMARY KEY (ID)
)
/

CREATE UNIQUE INDEX  PERSON_UNIQUE_1_INDEX_8
	ON PERSON (LOGIN)
/
CREATE UNIQUE INDEX  PERSON_UNIQUE_2_INDEX_8
	ON PERSON (EMAIL)
/

CREATE TABLE PERSON_ROLE (
	PERSON_ID VARCHAR(32) not null,  
	ROLE_ID INTEGER(10) not null,  
    PRIMARY KEY (PERSON_ID,ROLE_ID)
)
/
CREATE INDEX PERSON_ROLE_FK_1_INDEX_6
	ON PERSON_ROLE (PERSON_ID)
/
CREATE INDEX  PERSON_ROLE_FK_2_INDEX_6
	ON PERSON_ROLE (ROLE_ID)
/
CREATE TABLE ROLE (
	ID INTEGER(10) not null AUTO_INCREMENT,
	ROLE_NAME VARCHAR(255) not null,
    PRIMARY KEY (ID)
)
/
CREATE UNIQUE INDEX  ROLE_UNIQUE_1_INDEX_2
	ON ROLE (ROLE_NAME)
/

ALTER TABLE PERSON_ROLE 
	ADD CONSTRAINT PERSON_ROLE_FK_1
		FOREIGN KEY (PERSON_ID)
			REFERENCES PERSON (ID)
/
ALTER TABLE PERSON_ROLE 
	ADD CONSTRAINT PERSON_ROLE_FK_2
		FOREIGN KEY (ROLE_ID)
			REFERENCES ROLE (ID)
/





INSERT INTO PERSON (id, login, password, email, is_enabled) VALUES ('0000000000000000000000000000001', 'admin', 'admin', 'admin@example.com', true)
  /
INSERT INTO PERSON (id, login, password, email, is_enabled) VALUES ('0000000000000000000000000000002', 'user',  'user',  'user@example.com', true) 
 /
INSERT INTO PERSON (id, login, password, email, is_enabled) VALUES ('0000000000000000000000000000003', 'demo',  'demo',  'demo@example.com', true)
  /
INSERT INTO PERSON (id, login, password, email, is_enabled) VALUES ('0000000000000000000000000000004', 'user04',  'user04',  'user04@example.com', true) 
 /

INSERT INTO ROLE (id,role_name) VALUES (1,'ROLE_ADMIN')  
/
INSERT INTO ROLE (id,role_name) VALUES (2,'ROLE_USER') 
 /

INSERT INTO PERSON_ROLE (person_id, role_id) VALUES ('0000000000000000000000000000001', 1)  
/
INSERT INTO PERSON_ROLE (person_id, role_id) VALUES ('0000000000000000000000000000001', 2)
  /
INSERT INTO PERSON_ROLE (person_id, role_id) VALUES ('0000000000000000000000000000002', 2)
  /
INSERT INTO PERSON_ROLE (person_id, role_id) VALUES ('0000000000000000000000000000003', 2) 
 /