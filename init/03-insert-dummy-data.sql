-- Insert dummy data into the example_table
USE brewnet;

-- company 테이블 데이터 삽입
INSERT INTO tbl_company (company_code, name, business_number, corporate_number, ceo_name, address, type_of_business, contact, date_of_establishment, created_at, active)
VALUES
    (1, 'Alpha Corp', '1234567890', '9876543210', 'CEO A', '123 Alpha Street', 'Retail', '010-1234-5678', '2000-01-01', NOW(), TRUE);

-- seal 테이블 더미 데이터
INSERT INTO tbl_seal (image_url, created_at, active, company_code) VALUES
    ('https://example.com/seal1.png', '2024-01-01 10:00:00', TRUE, 1);

-- job_grade 테이블 더미 데이터
INSERT INTO tbl_position (position_code, name, created_at, active) VALUES
                                                                       (1, 'STAFF', '2024-01-01 09:00:00', TRUE),
                                                                       (2, 'ASSISTANT_MANAGER', '2024-01-01 09:00:00', TRUE),
                                                                       (3, 'MANAGER', '2024-01-01 09:00:00', TRUE),
                                                                       (4, 'CEO', '2024-01-01 09:00:00', TRUE);

-- role 테이블 더미 데이터
INSERT INTO tbl_role (role_code, role, created_at, active) VALUES
                                                               (1, 'ROLE_MASTER', '2024-01-01 08:00:00', TRUE),
                                                               (2, 'ROLE_GENERAL_ADMIN', '2024-01-01 08:00:00', TRUE),
                                                               (3, 'ROLE_RESPONSIBLE_ADMIN', '2024-01-01 08:00:00', TRUE),
                                                               (4, 'ROLE_FRANCHISE', '2024-01-01 08:00:00', TRUE),
                                                               (5, 'ROLE_DELIVERY', '2024-01-01 08:00:00', FALSE);

-- member 테이블 더미 데이터
INSERT INTO tbl_member (member_code, id, password, name, email, contact, signature_url, created_at, active, position_code) VALUES
                                                                                                                               (1, 'user1', '$2y$10$k9OHiN7N/xWaYJ2rN1ainea0cNpGej3wa5UmcthCdJUea3eOZ3Gsi', 'User One', 'user1@example.com', '010-1111-1111', 'https://example.com/signature1.png', '2024-01-01 08:00:00', TRUE, 1),
                                                                                                                               (2, 'user2', '$2a$12$UDHUtgQv15Wt4sqiOxjM5egbEMLafsl9I5YbBvTGjyIVDPhkxd3IS', 'User Two', 'user2@example.com', '010-2222-2222', 'https://example.com/signature2.png', '2024-01-02 09:00:00', TRUE, 2),
                                                                                                                               (3, 'user3', '$2a$12$UjlXhw1vEw0pE4b2.gOLkeqtJKMDsYrnFDPpG1cABPKcHPdqVn7Rm', 'User Three', 'user3@example.com', '010-3333-3333', 'https://example.com/signature3.png', '2024-01-03 10:00:00', TRUE, 3),
                                                                                                                               (4, 'user4', '$2a$12$uen2wkWG0hIQm/yONUOah.YvDe.yo4GtHoT4Zy0hrXYpo1V2YayHq', 'User Four', 'user4@example.com', '010-4444-4444', NULL, '2024-01-04 11:00:00', FALSE, 4),
                                                                                                                               (5, 'user5', '$2a$12$mEDXqxIpYqeL6s/e3JMGEunhRODSQCHUu1Po0o1vbJXCudc9pdvma', 'User Five', 'user5@example.com', '010-5555-5555', NULL, '2024-01-05 12:00:00', TRUE, null);

-- member_role 테이블 더미 데이터
INSERT INTO tbl_member_role (role_code, member_code, created_at, active) VALUES
                                                                             (1, 1, '2024-01-01 09:00:00', TRUE),
                                                                             (2, 2, '2024-01-02 09:00:00', TRUE),
                                                                             (3, 3, '2024-01-03 09:00:00', TRUE),
                                                                             (4, 4, '2024-01-04 09:00:00', FALSE),
                                                                             (5, 5, '2024-01-05 09:00:00', TRUE),
                                                                             (2, 1, '2024-01-06 09:00:00', TRUE),
                                                                             (3, 2, '2024-01-07 09:00:00', FALSE);






-- notice 테이블 더미 데이터
INSERT INTO tbl_notice (title, content, created_at, active, member_code) VALUES
                                                                             ('Notice 1', 'Content of Notice 1', '2024-01-01 09:00:00', TRUE, 1),
                                                                             ('Notice 2', 'Content of Notice 2', '2024-01-02 10:00:00', TRUE, 1),
                                                                             ('Notice 3', 'Content of Notice 3', '2024-01-03 11:00:00', TRUE, 1),
                                                                             ('Notice 4', 'Content of Notice 4', '2024-01-04 12:00:00', FALSE, 1),
                                                                             ('Notice 5', 'Content of Notice 5', '2024-01-05 13:00:00', TRUE, 1);

-- notice_img 테이블 더미 데이터
INSERT INTO tbl_notice_img (image_url, notice_code) VALUES
                                                        ('https://example.com/notice1.png', 1),
                                                        ('https://example.com/notice2.png', 2),
                                                        ('https://example.com/notice3.png', 3),
                                                        ('https://example.com/notice4.png', 4),
                                                        ('https://example.com/notice5.png', 5);

-- storage 테이블 더미 데이터
INSERT INTO tbl_storage (name, address, contact, active, created_at) VALUES
                                                                         ('Storage 1', '123 Address St, City, Country', '010-1111-1111', TRUE, '2024-01-01 10:00:00'),
                                                                         ('Storage 2', '456 Address St, City, Country', '010-2222-2222', TRUE, '2024-01-02 11:00:00'),
                                                                         ('Storage 3', '789 Address St, City, Country', '010-3333-3333', FALSE, '2024-01-03 12:00:00'),
                                                                         ('Storage 4', '101 Address St, City, Country', '010-4444-4444', TRUE, '2024-01-04 13:00:00'),
                                                                         ('Storage 5', '202 Address St, City, Country', '010-5555-5555', TRUE, '2024-01-05 14:00:00');

-- super_category 테이블 더미 데이터
INSERT INTO tbl_super_category (name, created_at, active) VALUES
                                                              ('Super Category 1', '2024-01-01 08:00:00', TRUE),
                                                              ('Super Category 2', '2024-01-02 09:00:00', TRUE),
                                                              ('Super Category 3', '2024-01-03 10:00:00', TRUE),
                                                              ('Super Category 4', '2024-01-04 11:00:00', TRUE),
                                                              ('Super Category 5', '2024-01-05 12:00:00', FALSE);

-- sub_category 테이블 더미 데이터
INSERT INTO tbl_sub_category (name, created_at, active, super_category_code) VALUES
                                                                                 ('Sub Category 1', '2024-01-01 09:00:00', TRUE, 1),
                                                                                 ('Sub Category 2', '2024-01-02 10:00:00', TRUE, 1),
                                                                                 ('Sub Category 3', '2024-01-03 11:00:00', FALSE, 2),
                                                                                 ('Sub Category 4', '2024-01-04 12:00:00', TRUE, 2),
                                                                                 ('Sub Category 5', '2024-01-05 13:00:00', TRUE, 3);

-- item 테이블 더미 데이터
INSERT INTO tbl_item (name, purchase_price, selling_price, image_url, safety_stock, created_at, active, item_unique_code, category_code) VALUES
                                                                                                                                             ('Item 1', 1000, 1200, 'https://example.com/item1.png', 10, '2024-01-01 09:00:00', TRUE, 'C100', 1),
                                                                                                                                             ('Item 2', 2000, 2200, 'https://example.com/item2.png', 15, '2024-01-02 10:00:00', TRUE, 'C200', 2),
                                                                                                                                             ('Item 3', 3000, 3500, 'https://example.com/item3.png', 20, '2024-01-03 11:00:00', TRUE, 'P100', 3),
                                                                                                                                             ('Item 4', 4000, 4500, 'https://example.com/item4.png', 25, '2024-01-04 12:00:00', FALSE, 'P200', 1),
                                                                                                                                             ('Item 5', 5000, 5500, 'https://example.com/item5.png', 30, '2024-01-05 13:00:00', TRUE,'S100',  2);

-- stock 테이블 더미 데이터
INSERT INTO tbl_stock (	storage_code, item_code, available_stock, out_stock, in_stock, created_at, active) VALUES
                                                                                                                  (1, 1, 100, 20, 30, '2024-01-01 10:00:00', TRUE),
                                                                                                                  (2, 2, 200, 40, 60, '2024-01-02 11:00:00', TRUE),
                                                                                                                  (3, 3, 300, 60, 90, '2024-01-03 12:00:00', FALSE),
                                                                                                                  (4, 4, 400, 80, 120, '2024-01-04 13:00:00', TRUE),
                                                                                                                  (5, 5, 500, 100, 150, '2024-01-05 14:00:00', TRUE);







-- correspondent 테이블 더미 데이터
INSERT INTO tbl_correspondent (name, address, city, province, email, contact, manager_name, active, created_at) VALUES
                                                                                                                    ('Correspondent A', '123 Street', 'City A', 'Province A', 'contactA@example.com', '010-1234-5678', 'Manager A', TRUE, '2024-01-01 09:00:00'),
                                                                                                                    ('Correspondent B', '456 Avenue', 'City B', 'Province B', 'contactB@example.com', '010-2345-6789', 'Manager B', TRUE, '2024-01-02 10:00:00'),
                                                                                                                    ('Correspondent C', '789 Road', 'City C', 'Province C', 'contactC@example.com', '010-3456-7890', 'Manager C', FALSE, '2024-01-03 11:00:00'),
                                                                                                                    ('Correspondent D', '101 Highway', 'City D', 'Province D', 'contactD@example.com', '010-4567-8901', 'Manager D', TRUE, '2024-01-04 12:00:00'),
                                                                                                                    ('Correspondent E', '202 Boulevard', 'City E', 'Province E', 'contactE@example.com', '010-5678-9012', 'Manager E', TRUE, '2024-01-05 13:00:00');

-- correspondent_item 테이블 더미 데이터
INSERT INTO tbl_correspondent_item (correspondent_code, item_code, created_at, active) VALUES
                                                                                           (1, 1, '2024-01-01 10:00:00', TRUE),
                                                                                           (1, 2, '2024-01-02 11:00:00', TRUE),
                                                                                           (2, 3, '2024-01-03 12:00:00', FALSE),
                                                                                           (3, 4, '2024-01-04 13:00:00', TRUE),
                                                                                           (4, 5, '2024-01-05 14:00:00', TRUE);

-- letter_of_purchase 테이블 더미 데이터
INSERT INTO tbl_letter_of_purchase (comment, created_at, approved, ACTIVE, sum_price, correspondent_code, member_code, storage_code) VALUES
                                                                                                                                         ('Purchase Order for Project A', '2024-01-01 08:00:00', 'APPROVED',TRUE, 111111, 1, 1, 1),
                                                                                                                                         ('Restock Order for Item B', '2024-01-02 09:00:00', 'UNCONFIRMED',TRUE, 2222200, 2, 2, 2),
                                                                                                                                         ('Purchase Order for Project C', '2024-01-03 10:00:00', 'UNCONFIRMED',FALSE,  3000000, 3, 3, 3),
                                                                                                                                         ('Urgent Purchase for Item D', '2024-01-04 11:00:00', 'UNCONFIRMED',TRUE, 400000, 4, 4, 4),
                                                                                                                                         ('Reorder for Item E', '2024-01-05 12:00:00', 'APPROVED', TRUE, 500000, 5, 5, 5);

-- letter_of_purchase_approver 테이블 더미 데이터
INSERT INTO tbl_letter_of_purchase_approver (member_code, letter_of_purchase_code, active, approved_at, approved, comment) VALUES
                                                                                                                               (1, 1, TRUE, '2024-01-01 14:00:00', 'UNCONFIRMED', 'Approved by Manager A'),
                                                                                                                               (2, 2, FALSE, NULL, 'APPROVED', 'Pending ApprovED'),
                                                                                                                               (3, 3, TRUE, '2024-01-03 15:00:00', 'REJECTED', 'Approved by Manager C'),
                                                                                                                               (4, 4, FALSE, NULL, 'APPROVED', 'Rejected by Manager D'),
                                                                                                                               (5, 5, TRUE, '2024-01-05 16:00:00', 'REJECTED', 'Approved by Manager E');

-- letter_of_purchase_item 테이블 더미 데이터
INSERT INTO tbl_letter_of_purchase_item (item_code, letter_of_purchase_code, quantity) VALUES
                                                                                           (1, 1, 50),
                                                                                           (2, 1, 100),
                                                                                           (3, 2, 200),
                                                                                           (4, 3, 150),
                                                                                           (5, 4, 300);

-- order_print 테이블 더미 데이터
INSERT INTO tbl_order_print (reason, printed_at, active, seal_code, member_code, letter_of_purchase_code) VALUES
                                                                                                              ('Urgent order for Project A', '2024-01-01 09:00:00', TRUE, 1, 1, 1),
                                                                                                              ('Order reprint due to changes', '2024-01-02 10:00:00', TRUE, 1, 2, 2),
                                                                                                              ('Duplicate for internal records', '2024-01-03 11:00:00', TRUE, 1, 3, 3),
                                                                                                              ('Additional copy for warehouse', '2024-01-04 12:00:00', TRUE, 1, 4, 4),
                                                                                                              ('Verification copy', '2024-01-05 13:00:00', TRUE, 1, 5, 5);







-- Franchise Table Dummy Data
INSERT INTO tbl_franchise (franchise_code, franchise_name, address, city, province, business_number, NAME, contact, created_at, active) VALUES
                                                                                                                                            (1, 'CoffeeHouse A', '123 Main St', 'Seoul', 'Seoul', '111-111-111', '노다민', '010-1234-5678', '2024-01-01 08:00:00', true),
                                                                                                                                            (2, 'CoffeeHouse B', '456 Maple St', 'Busan', 'Busan', '111-111-222', '양현진', '010-2345-6789', '2024-01-02 09:00:00', true),
                                                                                                                                            (3, 'CoffeeHouse C', '789 Oak St', 'Incheon', 'Incheon', '111-111-333', '용길한', '010-3456-7890', '2024-01-03 10:00:00', true),
                                                                                                                                            (4, 'CoffeeHouse D', '101 Pine St', 'Daegu', 'Gyeongsang', '111-111-444', '장호정', '010-4567-8901', '2024-01-04 11:00:00', false),
                                                                                                                                            (5, 'CoffeeHouse E', '202 Cedar St', 'Gwangju', 'Jeolla', '111-111-555', '정준서', '010-5678-9012', '2024-01-05 12:00:00', true);

-- Franchise Member Table Dummy Data
INSERT INTO tbl_franchise_member (member_code, franchise_code, created_at, active) VALUES
                                                                                       (3, 3, '2024-01-12 09:00:00', false),
                                                                                       (4, 4, '2024-01-13 09:30:00', true),
                                                                                       (5, 5, '2024-01-14 10:00:00', true);

-- Orders Table Dummy Data
INSERT INTO tbl_order (order_code, comment, created_at, active, approved, drafter_approved, sum_price, franchise_code,  member_code, delivery_code) VALUES
(1, 'Urgent order', '2024-02-01 08:00:00', true,'APPROVED', 'APPROVE', 100000, 1,  1, 5),
(2, NULL, '2024-02-02 09:00:00', true, 'APPROVED','APPROVE', 100000, 2,  2, 5),
(3, 'Additional items', '2024-02-03 10:00:00', true, 'UNCONFIRMED', 'APPROVE', 100000, 3,  3, 5),
(4, NULL, '2024-02-04 11:00:00', true, 'UNCONFIRMED', 'APPROVE',100000, 1, 1, 5),
(5, 'Replacement order', '2024-02-05 12:00:00', true, 'REJECTED', 'REJECT',100000, 1,  1, 5),
(6, NULL, '2024-02-15 12:00:00', true, 'APPROVED', 'APPROVE',100000, 1,  1, 5),
(7, NULL, '2024-02-16 12:00:00', true, 'APPROVED', 'APPROVE',100000, 1,  1, 5);

-- Order Status History Table Dummy Data
INSERT INTO tbl_order_status_history (order_status_history_code, status, created_at,active, order_code) VALUES
                                                                                                            (1, 'REQUESTED', '2024-02-01 08:05:00',  true, 1),
                                                                                                            (2, 'APPROVED', '2024-02-01 09:00:00', true, 1),
                                                                                                            (3, 'SHIPPING', '2024-02-02 10:00:00', true, 2),
                                                                                                            (4, 'SHIPPED', '2024-02-03 11:00:00',false, 3),
                                                                                                            (5, 'REQUESTED', '2024-02-04 12:00:00', true, 4);

-- Order Approver Table Dummy Data
INSERT INTO tbl_order_approver (member_code, order_code, approved, created_at, comment, active) VALUES
                                                                                                    (1, 1, 'APPROVED', '2024-02-01 08:30:00', 'Approved quickly', true),
                                                                                                    (2, 2, 'UNCONFIRMED', '2024-02-02 09:30:00', 'Needs review', true),
                                                                                                    (3, 3, 'UNCONFIRMED', '2024-02-03 10:30:00', NULL, true),
                                                                                                    (4, 4, 'UNCONFIRMED', NULL, 'Pending Approved', false),
                                                                                                    (5, 5, 'REJECTED', '2024-02-05 12:30:00', 'Approved', true);

-- Order Item Table Dummy Data
INSERT INTO tbl_order_item (order_code, item_code, quantity) VALUES
                                                                 (1, 1, 10),
                                                                 (1, 2, 5),
                                                                 (2, 3, 8),
                                                                 (3, 4, 12),
                                                                 (4, 5, 20);

-- Exchange Table Dummy Data
INSERT INTO tbl_exchange (exchange_code, comment, created_at, active, sum_price, reason, explanation, approved, order_code, member_code, delivery_code) VALUES
(1, '승인합니다', '2024-02-15 08:00:00', true, 100000, 'DAMAGED', '배송중 손상', 'APPROVED', 1,  1, 2),
(2, null, '2024-02-16 08:30:00', true, 300000, 'DEFECTIVE', '불량품 배송됨', 'UNCONFIRMED', 2,  1, 2),
(3, null, '2024-02-18 08:40:00', true, 400000, 'DAMAGED', '박스 파손됨', 'UNCONFIRMED', 3,  1, 2),
(4, null, '2024-02-16 09:00:00', true, 5000000, 'DEFECTIVE', '불량 제품', 'UNCONFIRMED', 4,  2, 3),
(5, null, '2024-02-17 10:00:00', true, 400000, 'OTHER', '옵션 잘못 선택함','UNCONFIRMED', 5,  3, 3),
(6, '승인합니다', '2024-02-18 11:00:00', false, 300000, 'DAMAGED', '박스 파손', 'APPROVED',6,  4, 4),
(7, '반려합니다', '2024-02-19 12:00:00', true, 1000000, 'DEFECTIVE', '유통기한 지남', 'REJECTED', 7,  5, 5);

-- Exchange Status History Table Dummy Data
INSERT INTO tbl_exchange_status_history (exchange_status_history_code, status, created_at, active, exchange_code) VALUES
(1, 'REQUESTED', '2024-02-15 08:05:00', true, 1),
(2, 'APPROVED', '2024-02-15 08:10:00', true, 1),
(3, 'PICKING', '2024-02-15 08:15:00', true, 1),
(4, 'PICKED', '2024-02-15 08:20:00', true, 1),
(5, 'REQUESTED', '2024-02-15 08:25:00', true, 2),
(6, 'APPROVED', '2024-02-15 08:25:00', true, 2),
(7, 'SHIPPING', '2024-02-15 09:00:00',  true, 2),
(8, 'COMPLETED', '2024-02-15 09:05:00',  true, 2),
(9, 'PICKING', '2024-02-16 10:00:00', true, 3),
(10, 'SHIPPING', '2024-02-17 11:00:00', false, 4),
(11, 'REQUESTED', '2024-02-18 12:00:00', true, 5),
(12, 'REQUESTED', '2024-02-18 14:00:00', true, 6),
(13, 'REQUESTED', '2024-02-18 15:00:00', true, 7);

-- Exchange Approver Table Dummy Data
INSERT INTO tbl_exchange_approver (member_code, exchange_code, approved, created_at, comment, active) VALUES
(1, 1, 'APPROVED', '2024-02-15 08:30:00', '승인합니다', true),
(2, 2, 'APPROVED', '2024-02-16 09:30:00', '승인합니다', true),
(3, 3, 'APPROVED', '2024-02-17 10:30:00', NULL, true),
(4, 4, 'UNCONFIRMED', NULL, NULL, false),
(5, 5, 'REJECTED', '2024-02-19 12:30:00', '반려합니다', true),
(5, 6, 'UNCONFIRMED', '2024-02-19 14:30:00', NULL, true),
(5, 7, 'UNCONFIRMED', '2024-02-20 15:30:00', NULL, true);

-- Exchange Image Table Dummy Data
INSERT INTO tbl_exchange_img (exchange_img_code, image_url, exchange_code) VALUES
(1, 'http://example.com/damaged_item.jpg', 1),
(2, 'http://example.com/coffee_spill.jpg', 1),
(3, 'http://example.com/item_broken.jpg', 1),
(4, 'http://example.com/coffee_mug.jpg', 2),
(5, 'http://example.com/coffee_spilled.jpg', 2),
(6, 'http://example.com/damaged_coffee_cup.jpg', 3),
(7, 'http://example.com/exchange_approved.jpg', 4),
(8, 'http://example.com/item_replacement.jpg', 5),
(9, 'http://example.com/item_replacement.jpg', 6),
(10, 'http://example.com/item_replacement.jpg', 7);


-- Exchange Item Table Dummy Data
INSERT INTO tbl_exchange_item (exchange_code, item_code, quantity) VALUES
(1, 1, 10),
(1, 2, 5),
(1, 3, 3),
(2, 4, 6),
(2, 3, 6),
(2, 2, 6),
(2, 1, 6),
(3, 3, 20),
(4, 4, 30),
(5, 5, 2),
(6, 5, 5),
(7, 5, 10);

-- Exchange Stock History Table Dummy Data
INSERT INTO tbl_exchange_stock_history (exchange_stock_history_code, status, manager, comment, created_at, confirmed, active, exchange_code) VALUES
(1, 'TOTAL_INBOUND', '장사원', '전체입고 완료', '2024-02-20 08:00:00','UNREAD', true, 1),
(2, 'TOTAL_DISPOSAL', '용사원', '전체 폐기합니다', '2024-02-21 09:00:00', 'READ', true, 2),
(3, 'PARTIAL_INBOUND', '양사원', '상태 괜찮은 것만 입고', '2024-02-22 10:00:00', 'UNREAD',false, 3),
(4, 'TOTAL_INBOUND', '정사원', '전체 입고합니다', '2024-02-23 11:00:00', 'CONFIRMED',true, 4),
(5, 'TOTAL_DISPOSAL', '노사원', '일괄 폐기합니다', '2024-02-24 12:00:00', 'CONFIRMED',true, 5);

-- Exchange Item Status Table Dummy Data
INSERT INTO tbl_exchange_item_status (exchange_stock_history_code, item_code, quantity, restock_quantity) VALUES
(1, 1, 10, 10),
(2, 2, 5, 0),
(3, 3, 8, 5),
(4, 4, 12, 12),
(5, 5, 20, 0);

-- Returns Table Dummy Data
INSERT INTO tbl_return (return_code, comment, created_at, active, sum_price, reason, explanation, approved, order_code,  member_code, delivery_code) VALUES
                                                                                                                                                         (1, 'Damaged item return', '2024-02-01 08:00:00', true, 11111, 'DAMAGED', 'Item broken on arrival', 'APPROVED', 1,  1, 5),
                                                                                                                                                         (2, 'Defective item return', '2024-02-02 09:00:00', true, 2222, 'DEFECTIVE', 'Item malfunctioning', 'UNCONFIRMED', 2,  2, 5),
                                                                                                                                                         (3, 'Change of mind', '2024-02-03 10:00:00', true, 333, 'MIND_CHANGE', 'Decided to return', 'UNCONFIRMED', 3,  3, 5),
                                                                                                                                                         (4, 'Damaged item return', '2024-02-04 11:00:00', false, 55555555, 'DAMAGED', 'Scratched surface', 'REJECTED', 4,  4, 5),
                                                                                                                                                         (5, 'Other reason', '2024-02-05 12:00:00', true, 66666, 'OTHER', 'No longer needed', 'UNCONFIRMED',5,  5, 5);

-- Return Item Table Dummy Data
INSERT INTO tbl_return_item (item_code, return_code, quantity) VALUES
                                                                   (1, 1, 3),
                                                                   (2, 2, 1),
                                                                   (3, 3, 5),
                                                                   (4, 4, 2),
                                                                   (5, 5, 4);

-- Return Approver Table Dummy Data
INSERT INTO tbl_return_approver (member_code, return_code, approved, created_at, comment, active) VALUES
                                                                                                      (1, 1, 'REJECTED', '2024-02-01 09:00:00', 'Approved without issue', true),
                                                                                                      (2, 2, 'REJECTED', '2024-02-02 10:00:00', 'Needs further review', true),
                                                                                                      (3, 3, 'APPROVED', '2024-02-03 11:00:00', NULL, true),
                                                                                                      (4, 4, 'APPROVED', NULL, 'Waiting for Approved', false),
                                                                                                      (5, 5, 'APPROVED', '2024-02-05 13:00:00', 'Approved with conditions', true);

-- Return Image Table Dummy Data
INSERT INTO tbl_return_img (return_img_code, imag_url, return_code) VALUES
                                                                        (1, 'http://example.com/return_img1.jpg', 1),
                                                                        (2, 'http://example.com/return_img2.jpg', 2),
                                                                        (3, 'http://example.com/return_img3.jpg', 3),
                                                                        (4, 'http://example.com/return_img4.jpg', 4),
                                                                        (5, 'http://example.com/return_img5.jpg', 5);

-- Return Status History Table Dummy Data
INSERT INTO tbl_return_status_history (return_status_history_code, status, created_at, active, return_code) VALUES
                                                                                                                (1, 'REQUESTED', '2024-02-01 08:05:00', true, 1),
                                                                                                                (2, 'APPROVED', '2024-02-01 09:00:00', true, 2),
                                                                                                                (3, 'PICKING', '2024-02-02 10:00:00', true, 3),
                                                                                                                (4, 'PICKED', '2024-02-03 11:00:00', false, 4),
                                                                                                                (5, 'COMPLETED', '2024-02-04 12:00:00', true, 5);

-- Return Refund History Table Dummy Data
INSERT INTO tbl_return_refund_history (return_refund_history_code, status, manager, comment, created_at,confirmed, active, return_code) VALUES
                                                                                                                                            (1, 'TOTAL_REFUND', 'Manager A', 'Refund processed', '2024-02-01 08:30:00', 'UNREAD',true, 1),
                                                                                                                                            (2, 'PARTIAL_REFUND', 'Manager B', 'Partial refund applied', '2024-02-02 09:30:00', 'READ',true, 2),
                                                                                                                                            (3, 'NON_REFUNDABLE', 'Manager C', 'Refund not eligible', '2024-02-03 10:30:00', 'UNREAD',false, 3),
                                                                                                                                            (4, 'TOTAL_REFUND', 'Manager D', 'Full refund issued', '2024-02-04 11:30:00', 'CONFIRMED',true, 4),
                                                                                                                                            (5, 'PARTIAL_REFUND', 'Manager E', 'Partial refund approved', '2024-02-05 12:30:00','CONFIRMED', true, 5);

-- Return Stock History Table Dummy Data
INSERT INTO tbl_return_stock_history (return_stock_history_code, status, manager, comment, created_at, confirmed, active, return_code) VALUES
                                                                                                                                           (1, 'TOTAL_INBOUND', 'Manager F', 'Items fully restocked', '2024-02-01 08:45:00','CONFIRMED', true, 1),
                                                                                                                                           (2, 'PARTIAL_INBOUND', 'Manager G', 'Partial stock returned', '2024-02-02 09:45:00', 'CONFIRMED',TRUE, 2),
                                                                                                                                           (3, 'TOTAL_DISPOSAL', 'Manager H', 'Disposed defective items', '2024-02-03 10:45:00', 'UNREAD',false, 3),
                                                                                                                                           (4, 'TOTAL_INBOUND', 'Manager I', 'Inventory restocked', '2024-02-04 11:45:00', 'READ',true, 4),
                                                                                                                                           (5, 'PARTIAL_INBOUND', 'Manager J', 'Partially restocked', '2024-02-05 12:45:00', 'UNREAD', true, 5);

-- Return Item Status Table Dummy Data
INSERT INTO tbl_return_item_status (item_code, return_stock_history_code, quantity, restock_quantity) VALUES
                                                                                                          (1, 1, 3, 3),
                                                                                                          (2, 2, 1, 1),
                                                                                                          (3, 3, 5, 4),
                                                                                                          (4, 4, 2, 2),
                                                                                                          (5, 5, 4, 3);

-- Refund Item Status Table Dummy Data
INSERT INTO tbl_refund_item_status (return_refund_history_code, item_code, completed) VALUES
                                                                                          (1, 1, true),
                                                                                          (2, 2, false),
                                                                                          (3, 3, true),
                                                                                          (4, 4, false),
                                                                                          (5, 5, true);

-- mandatory_purchase 테이블에 더미 데이터 삽입
INSERT INTO tbl_mandatory_purchase (min_quantity, created_at, active, item_code) VALUES
                                                                                     (10, NOW(), true, 1),
                                                                                     (20, NOW(), true, 2),
                                                                                     (15, NOW(), false, 3),
                                                                                     (25, NOW(), true, 4),
                                                                                     (30, NOW(), false, 5);

-- franchise_mandatory_purchase 테이블에 더미 데이터 삽입
INSERT INTO tbl_franchise_mandatory_purchase (quantity, created_at, active, franchise_code, mandatory_purchase_code) VALUES
                                                                                                                         (5, NOW(), true, 1, 1),
                                                                                                                         (8, NOW(), true, 2, 2),
                                                                                                                         (12, NOW(), false, 3, 3),
                                                                                                                         (20, NOW(), true, 4, 4),
                                                                                                                         (10, NOW(), false, 5, 5);

-- tbl_approval 더미 데이터 삽입
INSERT INTO tbl_approval (kind, sequence, created_at, active, position_code) VALUES
                                                                                 ('PURCHASE', 1, NOW(), TRUE, 2),
                                                                                 ('ORDER', 1, NOW(), TRUE, 2),
                                                                                 ('EXCHANGE', 1, NOW(), FALSE, 2),
                                                                                 ('RETURN', 1, NOW(), TRUE, 2);

-- tbl_purchase_status_history 더미 데이터 삽입
INSERT INTO tbl_purchase_status_history (status, created_at, active, letter_of_purchase_code) VALUES
                                                                                                  ('REQUESTED', NOW(), TRUE, 1),
                                                                                                  ('CANCELED', NOW(), FALSE, 2),
                                                                                                  ('APPROVED', NOW(), TRUE, 3),
                                                                                                  ('REJECTED', NOW(), TRUE, 4),
                                                                                                  ('REQUESTED', NOW(), FALSE, 5);