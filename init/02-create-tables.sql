-- Create tables in the target database
USE brewnet;

DROP TABLE IF EXISTS tbl_member;

CREATE TABLE tbl_member (
	member_code	INT	NOT NULL,
	id	VARCHAR(255)	NOT NULL,
	password	VARCHAR(255)	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	nickname	VARCHAR(255)	NOT NULL
);

DROP TABLE IF EXISTS tbl_role;

CREATE TABLE tbl_role (
	role_code	INT	NOT NULL,
	role	ENUM('마스터', '관리자', '본사 책임자', '본사 직원', '가맹점', '배송기사')	NOT NULL
);

DROP TABLE IF EXISTS tbl_member_role;

CREATE TABLE tbl_member_role (
	role_code	INT	NOT NULL,
	member_code	INT	NOT NULL
);

ALTER TABLE tbl_member ADD CONSTRAINT PK_TBL_MEMBER PRIMARY KEY (
	member_code
);

ALTER TABLE tbl_role ADD CONSTRAINT PK_TBL_ROLE PRIMARY KEY (
	role_code
);

ALTER TABLE tbl_member_role ADD CONSTRAINT PK_TBL_MEMBER_ROLE PRIMARY KEY (
	role_code,
	member_code
);

ALTER TABLE tbl_member_role ADD CONSTRAINT FK_tbl_role_TO_tbl_member_role_1 FOREIGN KEY (
	role_code
)
REFERENCES tbl_role (
	role_code
);

ALTER TABLE tbl_member_role ADD CONSTRAINT FK_tbl_member_TO_tbl_member_role_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);


ALTER TABLE tbl_member MODIFY member_code INT NOT NULL AUTO_INCREMENT;
ALTER TABLE tbl_role MODIFY role_code INT NOT NULL AUTO_INCREMENT;
