
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

CREATE TABLE tbl_order_item (
	order_code	INT	NOT NULL,
	item_code	INT	NOT NULL,
	quantity	INT	NOT NULL
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

CREATE TABLE tbl_order_status_history (
	order_status_history_code	INT	NOT NULL,
	status	ENUM('REQUESTED', 'CANCELED', 'APPROVED', 'REJECTED',  'SHIPPING', 'SHIPPED')	NOT NULL	COMMENT '주문요청, 주문취소, 주문승인,  주문 반려, 배송중, 배송완료',
	created_at	DATETIME	NOT NULL,
	active	BOOLEAN	NOT NULL,
	order_code	INT	NOT NULL
);

-- unique, auto_increment 추가

ALTER TABLE tbl_item
MODIFY COLUMN item_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_item ADD CONSTRAINT PK_TBL_ITEM PRIMARY KEY (
	item_code
);


ALTER TABLE tbl_order_item ADD CONSTRAINT PK_TBL_ORDER_ITEM PRIMARY KEY (
	order_code,
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


ALTER TABLE tbl_order ADD CONSTRAINT PK_TBL_ORDER PRIMARY KEY (
	order_code
);

ALTER TABLE tbl_order
MODIFY COLUMN order_code INT NOT NULL UNIQUE AUTO_INCREMENT;


ALTER TABLE tbl_franchise
MODIFY COLUMN franchise_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_franchise ADD CONSTRAINT PK_TBL_FRANCHISE PRIMARY KEY (
	franchise_code
);

ALTER TABLE tbl_order ADD CONSTRAINT FK_tbl_franchise_TO_tbl_order_1 FOREIGN KEY (
	franchise_code
)
REFERENCES tbl_franchise (
	franchise_code
);


ALTER TABLE tbl_order_status_history
MODIFY COLUMN order_status_history_code INT NOT NULL UNIQUE AUTO_INCREMENT;

ALTER TABLE tbl_order_status_history ADD CONSTRAINT PK_TBL_ORDER_STATUS_HISTORY PRIMARY KEY (
	order_status_history_code
);

ALTER TABLE tbl_order_status_history ADD CONSTRAINT FK_tbl_order_TO_tbl_order_status_history_1 FOREIGN KEY (
	order_code
)
REFERENCES tbl_order (
	order_code
);