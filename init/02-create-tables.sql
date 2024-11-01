-- Create tables in the target database
USE brewnet;

DROP TABLE IF EXISTS member;

CREATE TABLE member (
	member_code	INT	NOT NULL,
	id	VARCHAR(255)	NOT NULL,
	password	VARCHAR(255)	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	nickname	VARCHAR(255)	NOT NULL
);

DROP TABLE IF EXISTS role;

CREATE TABLE role (
	role_code	INT	NOT NULL,
	role	ENUM('마스터', '관리자', '본사 책임자', '본사 직원', '가맹점', '배송기사')	NOT NULL
);

DROP TABLE IF EXISTS member_role;

CREATE TABLE member_role (
	role_code	INT	NOT NULL,
	member_code	INT	NOT NULL
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_code
);

ALTER TABLE role ADD CONSTRAINT PK_ROLE PRIMARY KEY (
	role_code
);

ALTER TABLE member_role ADD CONSTRAINT PK_MEMBER_ROLE PRIMARY KEY (
	role_code,
	member_code
);

ALTER TABLE member_role ADD CONSTRAINT FK_role_TO_member_role_1 FOREIGN KEY (
	role_code
)
REFERENCES role (
	role_code
);

ALTER TABLE member_role ADD CONSTRAINT FK_member_TO_member_role_1 FOREIGN KEY (
	member_code
)
REFERENCES member (
	member_code
);

ALTER TABLE member MODIFY member_code INT NOT NULL AUTO_INCREMENT;
ALTER TABLE role MODIFY role_code INT NOT NULL AUTO_INCREMENT;