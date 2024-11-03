-- Insert dummy data into the example_table
USE brewnet;
INSERT INTO tbl_role (role) VALUES ('마스터');
INSERT INTO tbl_role (role) VALUES ('관리자');
INSERT INTO tbl_role (role) VALUES ('본사 책임자');
INSERT INTO tbl_role (role) VALUES ('본사 직원');
INSERT INTO tbl_role (role) VALUES ('가맹점');
INSERT INTO tbl_role (role) VALUES ('배송기사');

INSERT INTO tbl_member (id, password, name, nickname) VALUES ('master', 'masterpw', 'mastername', 'masternickname');

-- 마스터 계정 생성
INSERT INTO tbl_member_role (role_code, member_code)
SELECT r.role_code, m.member_code
FROM tbl_role r, tbl_member m
WHERE r.role = '마스터' AND m.id = 'master';
