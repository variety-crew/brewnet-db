
CREATE TABLE tbl_member (
	member_code	INT	NOT NULL,
	id	VARCHAR(255)	NOT NULL,
	password	VARCHAR(255)	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	email	VARCHAR(255)	NOT NULL,
	contact	VARCHAR(255)	NOT NULL,
	signature_url	VARCHAR(500)	NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	position_code	INT	NULL
);

CREATE TABLE tbl_role (
	role_code	INT	NOT NULL,
	role	ENUM('ROLE_MASTER', 'ROLE_GENERAL_ADMIN', 'ROLE_RESPONSIBLE_ADMIN', 'ROLE_FRANCHISE', 'ROLE_DELIVERY')	NOT NULL	COMMENT '마스터, 일반 관리자, 책임 관리자, 가맹점, 배송기사)',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_member_role (
	role_code	INT	NOT NULL,
	member_code	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_storage (
	storage_code	INT	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	address	VARCHAR(255)	NOT NULL,
	contact	VARCHAR(255)	NOT NULL,
	active	BOOLEAN	NOT NULL,
	created_at	DATETIME	NOT NULL
);

CREATE TABLE tbl_correspondent (
	correspondent_code	INT	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	address	VARCHAR(255)	NOT NULL,
	city	VARCHAR(255)	NULL,
	province	VARCHAR(255)	NULL,
	email	VARCHAR(255)	NULL,
	contact	VARCHAR(255)	NULL,
	manager_name	VARCHAR(255)	NULL,
	active	BOOLEAN	NOT NULL,
	created_at	DATETIME	NOT NULL
);

CREATE TABLE tbl_position (
	position_code	INT	NOT NULL,
	name	ENUM('STAFF', 'ASSISTANT_MANAGER', 'MANAGER', 'CEO')	NOT NULL	COMMENT '사원, 대리, 과장, 대표이사',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_correspondent_item (
	correspondent_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_item (
	item_code	INT	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	purchase_price	INT	NOT NULL,
	selling_price	INT	NOT NULL,
	image_url	VARCHAR(500)	NULL,
	safety_stock	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	item_unique_code	VARCHAR(255)	NOT NULL,
	category_code	INT	NOT NULL
);

CREATE TABLE tbl_stock (
	storage_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	available_stock	INT	NOT NULL,
	out_stock	INT	NOT NULL,
	in_stock	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_order_item (
	order_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	quantity	INT	NOT NULL
);

CREATE TABLE tbl_letter_of_purchase_item (
	item_code	INT	NOT NULL,
	letter_of_purchase_code	INT	NOT NULL	COMMENT '구매품의서는 발주서의 모든 정보를 포함함',
	quantity	INT	NOT NULL
);

CREATE TABLE tbl_letter_of_purchase (
	letter_of_purchase_code	INT	NOT NULL	COMMENT '구매품의서는 발주서의 모든 정보를 포함함',
	comment	VARCHAR(255)	NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL,
	sum_price	INT	NOT NULL,
	correspondent_code	INT	NOT NULL,
	member_code	INT	NOT NULL,
	storage_code	INT	NOT NULL
);

CREATE TABLE tbl_company (
	company_code	INT	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	business_number	VARCHAR(255)	NOT NULL,
	corporate_number	VARCHAR(255)	NULL,
	ceo_name	VARCHAR(255)	NOT NULL,
	address	VARCHAR(255)	NOT NULL,
	type_of_business	VARCHAR(255)	NOT NULL,
	contact	VARCHAR(255)	NOT NULL,
	date_of_establishment	VARCHAR(255)	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_franchise (
	franchise_code	INT	NOT NULL,
	franchise_name	VARCHAR(255)	NOT NULL,
	address	VARCHAR(255)	NOT NULL,
	city	VARCHAR(255)	NOT NULL,
	province	VARCHAR(255)	NOT NULL,
	contact	VARCHAR(255)	NOT NULL,
	business_number	VARCHAR(255)	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_franchise_member (
	franchise_member_code	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	member_code	INT	NOT NULL,
	franchise_code	INT	NOT NULL
);

CREATE TABLE tbl_order (
	order_code	INT	NOT NULL,
	comment	VARCHAR(255)	NULL	COMMENT '누가 작성하는가? -> 주문담당자',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL	COMMENT '결재 확인되지 않음, 결재 승인, 결재 반려',
	drafter_approved	ENUM('APPROVE', 'REJECT')	NULL	COMMENT '승인, 반려',
	sum_price	INT	NOT NULL,
	franchise_code	INT	NOT NULL,
	member_code	INT	NULL,
	delivery_code	INT	NULL
);

CREATE TABLE tbl_exchange (
	exchange_code	INT	NOT NULL,
	comment	VARCHAR(255)	NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	reason	ENUM('DAMAGED','DEFECTIVE','OTHER')	NOT NULL	COMMENT '파손,품질불량,기타',
	explanation	VARCHAR(255)	NOT NULL,
	approved	ENUM('UNCONFIRMED', 'APPROVED', 'REJECTED')	NOT NULL,
	order_code	INT	NOT NULL,
	member_code	INT	NULL,
	delivery_code	INT	NULL,
	drafter_approved	ENUM('APPROVE', 'REJECT')	NULL	COMMENT '승인, 반려',
	sum_price	INT	NOT NULL
);

CREATE TABLE tbl_return (
	return_code	INT	NOT NULL,
	comment	VARCHAR(255)	NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	reason	ENUM('DAMAGED','DEFECTIVE','MIND_CHANGE','OTHER')	NOT NULL	COMMENT '파손, 품질불량, 단순변심, 기타',
	explanation	VARCHAR(255)	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL,
	order_code	INT	NOT NULL,
	member_code	INT	NULL,
	delivery_code	INT	NULL,
	drafter_approved	ENUM('APPROVE', 'REJECT')	NULL,
	sum_price	INT	NOT NULL
);

CREATE TABLE tbl_return_item (
	item_code	INT	NOT NULL,
	return_code	INT	NOT NULL,
	quantity	INT	NOT NULL
);

CREATE TABLE tbl_exchange_item (
	exchange_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	quantity	INT	NOT NULL
);

CREATE TABLE tbl_return_status_history (
	return_status_history_code	INT	NOT NULL,
	status	ENUM('REQUESTED', 'CANCELED', 'APPROVED', 'REJECTED', 'PICKING', 'PICKED','COMPLETED')	NOT NULL	COMMENT '반품요청, 반품취소, 반품승인, 반품반려, 수거중, 수거완료, 반품완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	return_code	INT	NOT NULL
);

CREATE TABLE tbl_order_status_history (
	order_status_history_code	INT	NOT NULL,
	status	ENUM('REQUESTED', 'CANCELED', 'APPROVED', 'REJECTED',  'SHIPPING', 'SHIPPED')	NOT NULL	COMMENT '주문요청, 주문취소, 주문승인,  주문 반려, 배송중, 배송완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	order_code	INT	NOT NULL
);

CREATE TABLE tbl_exchange_status_history (
	exchange_status_history_code	INT	NOT NULL,
	status	ENUM('REQUESTED', 'CANCELED', 'APPROVED', 'REJECTED', 'PICKING','PICKED','SHIPPING','SHIPPED','COMPLETED')	NOT NULL	COMMENT '교환요청, 교환취소, 교환승인, 교환 반려, 수거중, 수거완료, 배송중, 배송완료,교환완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	exchange_code	INT	NOT NULL
);

CREATE TABLE tbl_seal (
	seal_code	INT	NOT NULL,
	image_url	VARCHAR(500)	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	company_code	INT	NOT NULL
);

CREATE TABLE tbl_order_print (
	order_print_code	INT	NOT NULL,
	reason	VARCHAR(500)	NOT NULL,
	printed_at	DATETIME	NOT NULL	COMMENT '생성일시와 같은 말',
	active	BOOLEAN	NOT NULL,
	seal_code	INT	NOT NULL,
	member_code	INT	NOT NULL,
	letter_of_purchase_code	INT	NOT NULL	COMMENT '구매품의서는 발주서의 모든 정보를 포함함'
);

CREATE TABLE tbl_exchange_approver (
	member_code	INT	NOT NULL,
	exchange_code	INT	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL	COMMENT '승인, 미확인, 반려',
	created_at	DATETIME	NULL,
	comment	VARCHAR(255)	NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_order_approver (
	member_code	INT	NOT NULL,
	order_code	INT	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL	COMMENT '승인, 미확인, 반려',
	created_at	DATETIME	NULL,
	comment	VARCHAR(255)	NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_return_approver (
	member_code	INT	NOT NULL,
	return_code	INT	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL	COMMENT '승인, 미확인, 반려',
	created_at	DATETIME	NULL,
	comment	VARCHAR(255)	NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_letter_of_purchase_approver (
	member_code	INT	NOT NULL,
	letter_of_purchase_code	INT	NOT NULL,
	approved	ENUM('APPROVED', 'UNCONFIRMED', 'REJECTED')	NOT NULL	COMMENT '승인, 미확인, 반려',
	approved_at	DATETIME	NULL,
	active	BOOLEAN	NOT NULL,
	comment	VARCHAR(255)	NULL
);

CREATE TABLE tbl_exchange_img (
	exchange_img_code	INT	NOT NULL,
	image_url	VARCHAR(500)	NOT NULL,
	exchange_code	INT	NOT NULL
);

CREATE TABLE tbl_return_img (
	return_img_code	INT	NOT NULL,
	imag_url	VARCHAR(500)	NOT NULL,
	return_code	INT	NOT NULL
);

CREATE TABLE tbl_notice (
	notice_code	INT	NOT NULL,
	title	VARCHAR(255)	NOT NULL,
	content	VARCHAR(1024)	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	member_code	INT	NOT NULL
);

CREATE TABLE tbl_notice_img (
	notice_img_code	INT	NOT NULL,
	image_url	VARCHAR(500)	NOT NULL,
	notice_code	INT	NOT NULL
);

CREATE TABLE tbl_sub_category (
	sub_category_code	INT	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	super_category_code	INT	NOT NULL
);

CREATE TABLE tbl_super_category (
	super_category_code	INT	NOT NULL,
	name	VARCHAR(255)	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_return_refund_history (
	return_refund_history_code	INT	NOT NULL,
	status	ENUM('TOTAL_REFUND', 'PARTIAL_REFUND', 'NON_REFUNDABLE')	NOT NULL	COMMENT '전체환불, 부분환불, 환불불가',
	manager	VARCHAR(255)	NOT NULL,
	comment	VARCHAR(255)	NULL,
	confirmed	ENUM('UNREAD', 'READ', 'CONFIRMED')	NOT NULL	COMMENT '안읽음, 읽음, 처리완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	return_code	INT	NOT NULL
);

CREATE TABLE tbl_return_stock_history (
	return_stock_history_code	INT	NOT NULL,
	status	ENUM('TOTAL_INBOUND', 'PARTIAL_INBOUND', 'TOTAL_DISPOSAL')	NOT NULL	COMMENT '전체입고, 부분입고, 전체폐기',
	manager	VARCHAR(255)	NOT NULL,
	comment	VARCHAR(255)	NULL,
	confirmed	ENUM('UNREAD', 'READ', 'CONFIRMED')	NOT NULL	COMMENT '안읽음, 읽음, 처리완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	return_code	INT	NOT NULL
);

CREATE TABLE tbl_return_item_status (
	item_code	INT	NOT NULL,
	return_stock_history_code	INT	NOT NULL,
	quantity	INT	NOT NULL,
	restock_quantity	INT	NOT NULL
);

CREATE TABLE tbl_exchange_item_status (
	exchange_stock_history_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	quantity	INT	NOT NULL,
	restock_quantity	INT	NOT NULL
);

CREATE TABLE tbl_exchange_stock_history (
	exchange_stock_history_code	INT	NOT NULL,
	status	ENUM('TOTAL_INBOUND', 'TOTAL_DISPOSAL', 'PARTIAL_INBOUND')	NOT NULL	COMMENT '전체입고,전체폐기, 부분입고',
	manager	VARCHAR(255)	NOT NULL,
	comment	VARCHAR(255)	NULL,
	confirmed	ENUM('UNREAD', 'READ', 'CONFIRMED')	NOT NULL	COMMENT '안읽음, 읽음, 처리완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	exchange_code	INT	NOT NULL
);

CREATE TABLE tbl_refund_item_status (
	return_refund_history_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	completed	BOOLEAN	NOT NULL
);

CREATE TABLE tbl_mandatory_purchase (
	mandatory_purchase_code	INT	NOT NULL,
	min_quantity	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	item_code	INT	NOT NULL
);

CREATE TABLE tbl_franchise_mandatory_purchase (
	franchise_mandatory_purchase_code	INT	NOT NULL,
	quantity	INT	NOT NULL,
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	franchise_code	INT	NOT NULL,
	mandatory_purchase_code	INT	NOT NULL
);

CREATE TABLE tbl_approval (
	approval_code	INT	NOT NULL,
	kind	ENUM('PURCHASE', 'ORDER', 'EXCHANGE', 'RETURN')	NOT NULL,
	sequence	INT	NOT NULL	COMMENT '현재는 기안자 1명, 결재자 1명으로 순번은 1고정',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	position_code	INT	NOT NULL
);

CREATE TABLE tbl_purchase_status_history (
	purchase_status_history_code	INT	NOT NULL,
	status	ENUM('REQUESTED', 'CANCELED', 'APPROVED', 'REJECTED')	NOT NULL	COMMENT '결재요청, 결재요청취소, 발주승인,  발주반려',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	letter_of_purchase_code	INT	NOT NULL	COMMENT '구매품의서는 발주서의 모든 정보를 포함함'
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

ALTER TABLE tbl_storage ADD CONSTRAINT PK_TBL_STORAGE PRIMARY KEY (
	storage_code
);

ALTER TABLE tbl_correspondent ADD CONSTRAINT PK_TBL_CORRESPONDENT PRIMARY KEY (
	correspondent_code
);

ALTER TABLE tbl_position ADD CONSTRAINT PK_TBL_POSITION PRIMARY KEY (
	position_code
);

ALTER TABLE tbl_correspondent_item ADD CONSTRAINT PK_TBL_CORRESPONDENT_ITEM PRIMARY KEY (
	correspondent_code,
	item_code
);

ALTER TABLE tbl_item ADD CONSTRAINT PK_TBL_ITEM PRIMARY KEY (
	item_code
);

ALTER TABLE tbl_stock ADD CONSTRAINT PK_TBL_STOCK PRIMARY KEY (
	storage_code,
	item_code
);

ALTER TABLE tbl_order_item ADD CONSTRAINT PK_TBL_ORDER_ITEM PRIMARY KEY (
	order_code,
	item_code
);

ALTER TABLE tbl_letter_of_purchase_item ADD CONSTRAINT PK_TBL_LETTER_OF_PURCHASE_ITEM PRIMARY KEY (
	item_code,
	letter_of_purchase_code
);

ALTER TABLE tbl_letter_of_purchase ADD CONSTRAINT PK_TBL_LETTER_OF_PURCHASE PRIMARY KEY (
	letter_of_purchase_code
);

ALTER TABLE tbl_company ADD CONSTRAINT PK_TBL_COMPANY PRIMARY KEY (
	company_code
);

ALTER TABLE tbl_franchise ADD CONSTRAINT PK_TBL_FRANCHISE PRIMARY KEY (
	franchise_code
);

ALTER TABLE tbl_franchise_member ADD CONSTRAINT PK_TBL_FRANCHISE_MEMBER PRIMARY KEY (
	franchise_member_code
);

ALTER TABLE tbl_order ADD CONSTRAINT PK_TBL_ORDER PRIMARY KEY (
	order_code
);

ALTER TABLE tbl_exchange ADD CONSTRAINT PK_TBL_EXCHANGE PRIMARY KEY (
	exchange_code
);

ALTER TABLE tbl_return ADD CONSTRAINT PK_TBL_RETURN PRIMARY KEY (
	return_code
);

ALTER TABLE tbl_return_item ADD CONSTRAINT PK_TBL_RETURN_ITEM PRIMARY KEY (
	item_code,
	return_code
);

ALTER TABLE tbl_exchange_item ADD CONSTRAINT PK_TBL_EXCHANGE_ITEM PRIMARY KEY (
	exchange_code,
	item_code
);

ALTER TABLE tbl_return_status_history ADD CONSTRAINT PK_TBL_RETURN_STATUS_HISTORY PRIMARY KEY (
	return_status_history_code
);

ALTER TABLE tbl_order_status_history ADD CONSTRAINT PK_TBL_ORDER_STATUS_HISTORY PRIMARY KEY (
	order_status_history_code
);

ALTER TABLE tbl_exchange_status_history ADD CONSTRAINT PK_TBL_EXCHANGE_STATUS_HISTORY PRIMARY KEY (
	exchange_status_history_code
);

ALTER TABLE tbl_seal ADD CONSTRAINT PK_TBL_SEAL PRIMARY KEY (
	seal_code
);

ALTER TABLE tbl_order_print ADD CONSTRAINT PK_TBL_ORDER_PRINT PRIMARY KEY (
	order_print_code
);

ALTER TABLE tbl_exchange_approver ADD CONSTRAINT PK_TBL_EXCHANGE_APPROVER PRIMARY KEY (
	member_code,
	exchange_code
);

ALTER TABLE tbl_order_approver ADD CONSTRAINT PK_TBL_ORDER_APPROVER PRIMARY KEY (
	member_code,
	order_code
);

ALTER TABLE tbl_return_approver ADD CONSTRAINT PK_TBL_RETURN_APPROVER PRIMARY KEY (
	member_code,
	return_code
);

ALTER TABLE tbl_letter_of_purchase_approver ADD CONSTRAINT PK_TBL_LETTER_OF_PURCHASE_APPROVER PRIMARY KEY (
	member_code,
	letter_of_purchase_code
);

ALTER TABLE tbl_exchange_img ADD CONSTRAINT PK_TBL_EXCHANGE_IMG PRIMARY KEY (
	exchange_img_code
);

ALTER TABLE tbl_return_img ADD CONSTRAINT PK_TBL_RETURN_IMG PRIMARY KEY (
	return_img_code
);

ALTER TABLE tbl_notice ADD CONSTRAINT PK_TBL_NOTICE PRIMARY KEY (
	notice_code
);

ALTER TABLE tbl_notice_img ADD CONSTRAINT PK_TBL_NOTICE_IMG PRIMARY KEY (
	notice_img_code
);

ALTER TABLE tbl_sub_category ADD CONSTRAINT PK_TBL_SUB_CATEGORY PRIMARY KEY (
	sub_category_code
);

ALTER TABLE tbl_super_category ADD CONSTRAINT PK_TBL_SUPER_CATEGORY PRIMARY KEY (
	super_category_code
);

ALTER TABLE tbl_return_refund_history ADD CONSTRAINT PK_TBL_RETURN_REFUND_HISTORY PRIMARY KEY (
	return_refund_history_code
);

ALTER TABLE tbl_return_stock_history ADD CONSTRAINT PK_TBL_RETURN_STOCK_HISTORY PRIMARY KEY (
	return_stock_history_code
);

ALTER TABLE tbl_return_item_status ADD CONSTRAINT PK_TBL_RETURN_ITEM_STATUS PRIMARY KEY (
	item_code,
	return_stock_history_code
);

ALTER TABLE tbl_exchange_item_status ADD CONSTRAINT PK_TBL_EXCHANGE_ITEM_STATUS PRIMARY KEY (
	exchange_stock_history_code,
	item_code
);

ALTER TABLE tbl_exchange_stock_history ADD CONSTRAINT PK_TBL_EXCHANGE_STOCK_HISTORY PRIMARY KEY (
	exchange_stock_history_code
);

ALTER TABLE tbl_refund_item_status ADD CONSTRAINT PK_TBL_REFUND_ITEM_STATUS PRIMARY KEY (
	return_refund_history_code,
	item_code
);

ALTER TABLE tbl_mandatory_purchase ADD CONSTRAINT PK_TBL_MANDATORY_PURCHASE PRIMARY KEY (
	mandatory_purchase_code
);

ALTER TABLE tbl_franchise_mandatory_purchase ADD CONSTRAINT PK_TBL_FRANCHISE_MANDATORY_PURCHASE PRIMARY KEY (
	franchise_mandatory_purchase_code
);

ALTER TABLE tbl_approval ADD CONSTRAINT PK_TBL_APPROVAL PRIMARY KEY (
	approval_code
);

ALTER TABLE tbl_purchase_status_history ADD CONSTRAINT PK_TBL_PURCHASE_STATUS_HISTORY PRIMARY KEY (
	purchase_status_history_code
);

ALTER TABLE tbl_member ADD CONSTRAINT FK_tbl_position_TO_tbl_member_1 FOREIGN KEY (
	position_code
)
REFERENCES tbl_position (
	position_code
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

ALTER TABLE tbl_correspondent_item ADD CONSTRAINT FK_tbl_correspondent_TO_tbl_correspondent_item_1 FOREIGN KEY (
	correspondent_code
)
REFERENCES tbl_correspondent (
	correspondent_code
);

ALTER TABLE tbl_correspondent_item ADD CONSTRAINT FK_tbl_item_TO_tbl_correspondent_item_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_item ADD CONSTRAINT FK_tbl_sub_category_TO_tbl_item_1 FOREIGN KEY (
	category_code
)
REFERENCES tbl_sub_category (
	sub_category_code
);

ALTER TABLE tbl_stock ADD CONSTRAINT FK_tbl_storage_TO_tbl_stock_1 FOREIGN KEY (
	storage_code
)
REFERENCES tbl_storage (
	storage_code
);

ALTER TABLE tbl_stock ADD CONSTRAINT FK_tbl_item_TO_tbl_stock_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_order_item ADD CONSTRAINT FK_tbl_order_TO_tbl_order_item_1 FOREIGN KEY (
	order_code
)
REFERENCES tbl_order (
	order_code
);

ALTER TABLE tbl_order_item ADD CONSTRAINT FK_tbl_item_TO_tbl_order_item_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_letter_of_purchase_item ADD CONSTRAINT FK_tbl_item_TO_tbl_letter_of_purchase_item_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_letter_of_purchase_item ADD CONSTRAINT FK_tbl_letter_of_purchase_TO_tbl_letter_of_purchase_item_1 FOREIGN KEY (
	letter_of_purchase_code
)
REFERENCES tbl_letter_of_purchase (
	letter_of_purchase_code
);

ALTER TABLE tbl_letter_of_purchase ADD CONSTRAINT FK_tbl_correspondent_TO_tbl_letter_of_purchase_1 FOREIGN KEY (
	correspondent_code
)
REFERENCES tbl_correspondent (
	correspondent_code
);

ALTER TABLE tbl_letter_of_purchase ADD CONSTRAINT FK_tbl_member_TO_tbl_letter_of_purchase_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_letter_of_purchase ADD CONSTRAINT FK_tbl_storage_TO_tbl_letter_of_purchase_1 FOREIGN KEY (
	storage_code
)
REFERENCES tbl_storage (
	storage_code
);

ALTER TABLE tbl_franchise_member ADD CONSTRAINT FK_tbl_member_TO_tbl_franchise_member_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_franchise_member ADD CONSTRAINT FK_tbl_franchise_TO_tbl_franchise_member_1 FOREIGN KEY (
	franchise_code
)
REFERENCES tbl_franchise (
	franchise_code
);

ALTER TABLE tbl_order ADD CONSTRAINT FK_tbl_franchise_TO_tbl_order_1 FOREIGN KEY (
	franchise_code
)
REFERENCES tbl_franchise (
	franchise_code
);

ALTER TABLE tbl_order ADD CONSTRAINT FK_tbl_member_TO_tbl_order_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_order ADD CONSTRAINT FK_tbl_member_TO_tbl_order_2 FOREIGN KEY (
	delivery_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_exchange ADD CONSTRAINT FK_tbl_order_TO_tbl_exchange_1 FOREIGN KEY (
	order_code
)
REFERENCES tbl_order (
	order_code
);

ALTER TABLE tbl_exchange ADD CONSTRAINT FK_tbl_member_TO_tbl_exchange_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_exchange ADD CONSTRAINT FK_tbl_member_TO_tbl_exchange_2 FOREIGN KEY (
	delivery_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_return ADD CONSTRAINT FK_tbl_order_TO_tbl_return_1 FOREIGN KEY (
	order_code
)
REFERENCES tbl_order (
	order_code
);

ALTER TABLE tbl_return ADD CONSTRAINT FK_tbl_member_TO_tbl_return_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_return ADD CONSTRAINT FK_tbl_member_TO_tbl_return_2 FOREIGN KEY (
	delivery_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_return_item ADD CONSTRAINT FK_tbl_item_TO_tbl_return_item_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_return_item ADD CONSTRAINT FK_tbl_return_TO_tbl_return_item_1 FOREIGN KEY (
	return_code
)
REFERENCES tbl_return (
	return_code
);

ALTER TABLE tbl_exchange_item ADD CONSTRAINT FK_tbl_exchange_TO_tbl_exchange_item_1 FOREIGN KEY (
	exchange_code
)
REFERENCES tbl_exchange (
	exchange_code
);

ALTER TABLE tbl_exchange_item ADD CONSTRAINT FK_tbl_item_TO_tbl_exchange_item_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_return_status_history ADD CONSTRAINT FK_tbl_return_TO_tbl_return_status_history_1 FOREIGN KEY (
	return_code
)
REFERENCES tbl_return (
	return_code
);

ALTER TABLE tbl_order_status_history ADD CONSTRAINT FK_tbl_order_TO_tbl_order_status_history_1 FOREIGN KEY (
	order_code
)
REFERENCES tbl_order (
	order_code
);

ALTER TABLE tbl_exchange_status_history ADD CONSTRAINT FK_tbl_exchange_TO_tbl_exchange_status_history_1 FOREIGN KEY (
	exchange_code
)
REFERENCES tbl_exchange (
	exchange_code
);

ALTER TABLE tbl_seal ADD CONSTRAINT FK_tbl_company_TO_tbl_seal_1 FOREIGN KEY (
	company_code
)
REFERENCES tbl_company (
	company_code
);

ALTER TABLE tbl_order_print ADD CONSTRAINT FK_tbl_seal_TO_tbl_order_print_1 FOREIGN KEY (
	seal_code
)
REFERENCES tbl_seal (
	seal_code
);

ALTER TABLE tbl_order_print ADD CONSTRAINT FK_tbl_member_TO_tbl_order_print_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_order_print ADD CONSTRAINT FK_tbl_letter_of_purchase_TO_tbl_order_print_1 FOREIGN KEY (
	letter_of_purchase_code
)
REFERENCES tbl_letter_of_purchase (
	letter_of_purchase_code
);

ALTER TABLE tbl_exchange_approver ADD CONSTRAINT FK_tbl_member_TO_tbl_exchange_approver_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_exchange_approver ADD CONSTRAINT FK_tbl_exchange_TO_tbl_exchange_approver_1 FOREIGN KEY (
	exchange_code
)
REFERENCES tbl_exchange (
	exchange_code
);

ALTER TABLE tbl_order_approver ADD CONSTRAINT FK_tbl_member_TO_tbl_order_approver_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_order_approver ADD CONSTRAINT FK_tbl_order_TO_tbl_order_approver_1 FOREIGN KEY (
	order_code
)
REFERENCES tbl_order (
	order_code
);

ALTER TABLE tbl_return_approver ADD CONSTRAINT FK_tbl_member_TO_tbl_return_approver_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_return_approver ADD CONSTRAINT FK_tbl_return_TO_tbl_return_approver_1 FOREIGN KEY (
	return_code
)
REFERENCES tbl_return (
	return_code
);

ALTER TABLE tbl_letter_of_purchase_approver ADD CONSTRAINT FK_tbl_member_TO_tbl_letter_of_purchase_approver_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_letter_of_purchase_approver ADD CONSTRAINT FK_tbl_letter_of_purchase_TO_tbl_letter_of_purchase_approver_1 FOREIGN KEY (
	letter_of_purchase_code
)
REFERENCES tbl_letter_of_purchase (
	letter_of_purchase_code
);

ALTER TABLE tbl_exchange_img ADD CONSTRAINT FK_tbl_exchange_TO_tbl_exchange_img_1 FOREIGN KEY (
	exchange_code
)
REFERENCES tbl_exchange (
	exchange_code
);

ALTER TABLE tbl_return_img ADD CONSTRAINT FK_tbl_return_TO_tbl_return_img_1 FOREIGN KEY (
	return_code
)
REFERENCES tbl_return (
	return_code
);

ALTER TABLE tbl_notice ADD CONSTRAINT FK_tbl_member_TO_tbl_notice_1 FOREIGN KEY (
	member_code
)
REFERENCES tbl_member (
	member_code
);

ALTER TABLE tbl_notice_img ADD CONSTRAINT FK_tbl_notice_TO_tbl_notice_img_1 FOREIGN KEY (
	notice_code
)
REFERENCES tbl_notice (
	notice_code
);

ALTER TABLE tbl_sub_category ADD CONSTRAINT FK_tbl_super_category_TO_tbl_sub_category_1 FOREIGN KEY (
	super_category_code
)
REFERENCES tbl_super_category (
	super_category_code
);

ALTER TABLE tbl_return_refund_history ADD CONSTRAINT FK_tbl_return_TO_tbl_return_refund_history_1 FOREIGN KEY (
	return_code
)
REFERENCES tbl_return (
	return_code
);

ALTER TABLE tbl_return_stock_history ADD CONSTRAINT FK_tbl_return_TO_tbl_return_stock_history_1 FOREIGN KEY (
	return_code
)
REFERENCES tbl_return (
	return_code
);

ALTER TABLE tbl_return_item_status ADD CONSTRAINT FK_tbl_item_TO_tbl_return_item_status_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_return_item_status ADD CONSTRAINT FK_tbl_return_stock_history_TO_tbl_return_item_status_1 FOREIGN KEY (
	return_stock_history_code
)
REFERENCES tbl_return_stock_history (
	return_stock_history_code
);

ALTER TABLE tbl_exchange_item_status ADD CONSTRAINT FK_tbl_exchange_stock_history_TO_tbl_exchange_item_status_1 FOREIGN KEY (
	exchange_stock_history_code
)
REFERENCES tbl_exchange_stock_history (
	exchange_stock_history_code
);

ALTER TABLE tbl_exchange_item_status ADD CONSTRAINT FK_tbl_item_TO_tbl_exchange_item_status_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_exchange_stock_history ADD CONSTRAINT FK_tbl_exchange_TO_tbl_exchange_stock_history_1 FOREIGN KEY (
	exchange_code
)
REFERENCES tbl_exchange (
	exchange_code
);

ALTER TABLE tbl_refund_item_status ADD CONSTRAINT FK_tbl_return_refund_history_TO_tbl_refund_item_status_1 FOREIGN KEY (
	return_refund_history_code
)
REFERENCES tbl_return_refund_history (
	return_refund_history_code
);

ALTER TABLE tbl_refund_item_status ADD CONSTRAINT FK_tbl_item_TO_tbl_refund_item_status_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_mandatory_purchase ADD CONSTRAINT FK_tbl_item_TO_tbl_mandatory_purchase_1 FOREIGN KEY (
	item_code
)
REFERENCES tbl_item (
	item_code
);

ALTER TABLE tbl_franchise_mandatory_purchase ADD CONSTRAINT FK_tbl_franchise_TO_tbl_franchise_mandatory_purchase_1 FOREIGN KEY (
	franchise_code
)
REFERENCES tbl_franchise (
	franchise_code
);

ALTER TABLE tbl_franchise_mandatory_purchase ADD CONSTRAINT FK_tbl_mandatory_purchase_TO_tbl_franchise_mandatory_purchase_1 FOREIGN KEY (
	mandatory_purchase_code
)
REFERENCES tbl_mandatory_purchase (
	mandatory_purchase_code
);

ALTER TABLE tbl_approval ADD CONSTRAINT FK_tbl_position_TO_tbl_approval_1 FOREIGN KEY (
	position_code
)
REFERENCES tbl_position (
	position_code
);

ALTER TABLE tbl_purchase_status_history ADD CONSTRAINT FK_tbl_letter_of_purchase_TO_tbl_purchase_status_history_1 FOREIGN KEY (
	letter_of_purchase_code
)
REFERENCES tbl_letter_of_purchase (
	letter_of_purchase_code
);


-- unique, auto_increment 추가
ALTER TABLE tbl_member
MODIFY COLUMN member_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_role
MODIFY COLUMN role_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_storage
MODIFY COLUMN storage_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_correspondent
MODIFY COLUMN correspondent_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_position
MODIFY COLUMN position_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_item
MODIFY COLUMN item_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_letter_of_purchase
MODIFY COLUMN letter_of_purchase_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_company
MODIFY COLUMN company_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_franchise
MODIFY COLUMN franchise_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_order
MODIFY COLUMN order_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_exchange
MODIFY COLUMN exchange_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_return
MODIFY COLUMN return_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_return_status_history
MODIFY COLUMN return_status_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_order_status_history
MODIFY COLUMN order_status_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_exchange_status_history
MODIFY COLUMN exchange_status_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_seal
MODIFY COLUMN seal_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_order_print
MODIFY COLUMN order_print_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_exchange_img
MODIFY COLUMN exchange_img_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_return_img
MODIFY COLUMN return_img_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_notice
MODIFY COLUMN notice_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_notice_img
MODIFY COLUMN notice_img_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_sub_category
MODIFY COLUMN sub_category_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_super_category
MODIFY COLUMN super_category_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_return_refund_history
MODIFY COLUMN return_refund_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_return_stock_history
MODIFY COLUMN return_stock_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_exchange_stock_history
MODIFY COLUMN exchange_stock_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_mandatory_purchase
MODIFY COLUMN mandatory_purchase_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_franchise_mandatory_purchase
MODIFY COLUMN franchise_mandatory_purchase_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_approval
MODIFY COLUMN approval_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_purchase_status_history
MODIFY COLUMN purchase_status_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_franchise_member
MODIFY COLUMN franchise_member_code INT NOT NULL UNIQUE AUTO_INCREMENT;
