CREATE TABLE S_USERS
(
    user_id    NVARCHAR2(20)    NOT NULL, 
    user_pw    NVARCHAR2(20)    NOT NULL, 
    name       NVARCHAR2(20)    NOT NULL, 
    email      NVARCHAR2(40)    NOT NULL, 
    grade      NVARCHAR2(5)     NOT NULL, 
    CONSTRAINT S_USERS_PK PRIMARY KEY (user_id)
)
/
COMMENT ON TABLE S_USERS IS '회원'
/
COMMENT ON COLUMN S_USERS.user_id IS '회원ID'
/
COMMENT ON COLUMN S_USERS.user_pw IS '회원PW'
/
COMMENT ON COLUMN S_USERS.name IS '회원이름'
/
COMMENT ON COLUMN S_USERS.email IS '회원이메일'
/
COMMENT ON COLUMN S_USERS.grade IS '회원등급'
/
--=========================================================================
CREATE TABLE L_ORDERS
(
    order_no            INT              NOT NULL, 
    book_no             INT              NOT NULL, 
    order_state         NVARCHAR2(5)     NOT NULL, 
    book_condition      NVARCHAR2(5)     NOT NULL, 
    seller_id           NVARCHAR2(20)    NOT NULL, 
    application_date    DATE             NOT NULL, 
    confirm_date        DATE             NULL, 
    buyer_id            NVARCHAR2(20)    NULL, 
    sold_date           DATE             NULL, 
    CONSTRAINT L_ORDERS_PK PRIMARY KEY (order_no)
)
/

CREATE SEQUENCE L_ORDERS_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER L_ORDERS_AI_TRG
BEFORE INSERT ON L_ORDERS 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT L_ORDERS_SEQ.NEXTVAL
    INTO :NEW.order_no
    FROM DUAL;
END;
/

COMMENT ON TABLE L_ORDERS IS '주문'
/
COMMENT ON COLUMN L_ORDERS.order_no IS '주문번호'
/
COMMENT ON COLUMN L_ORDERS.book_no IS '도서번호'
/
COMMENT ON COLUMN L_ORDERS.order_state IS '주문상태'
/
COMMENT ON COLUMN L_ORDERS.book_condition IS '책상태'
/
COMMENT ON COLUMN L_ORDERS.seller_id IS '판매자'
/
COMMENT ON COLUMN L_ORDERS.application_date IS '판매신청일자'
/
COMMENT ON COLUMN L_ORDERS.confirm_date IS '신청처리일자'
/
COMMENT ON COLUMN L_ORDERS.buyer_id IS '구매자'
/
COMMENT ON COLUMN L_ORDERS.sold_date IS '구매일자'
/
--==========================================================================
CREATE TABLE S_CODE
(
    code    NVARCHAR2(5)     NOT NULL, 
    name    NVARCHAR2(20)    NOT NULL, 
    type    NVARCHAR2(2)     NOT NULL, 
    CONSTRAINT S_CODE_PK PRIMARY KEY (code)
)
/

COMMENT ON TABLE S_CODE IS '기초 코드'
/

COMMENT ON COLUMN S_CODE.code IS '코드'
/

COMMENT ON COLUMN S_CODE.name IS '코드명'
/

COMMENT ON COLUMN S_CODE.type IS '구분'
/
--==========================================================================
CREATE TABLE L_DIBS
(
    dibs_no    INT              NOT NULL, 
    user_id    NVARCHAR2(20)    NOT NULL, 
    book_id    INT              NOT NULL, 
    CONSTRAINT L_DIBS_PK PRIMARY KEY (dibs_no)
)
/

CREATE SEQUENCE L_DIBS_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER L_DIBS_AI_TRG
BEFORE INSERT ON L_DIBS 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT L_DIBS_SEQ.NEXTVAL
    INTO :NEW.dibs_no
    FROM DUAL;
END;
/

--DROP TRIGGER L_DIBS_AI_TRG;
/

--DROP SEQUENCE L_DIBS_SEQ;
/

COMMENT ON TABLE L_DIBS IS '찜 도서'
/

COMMENT ON COLUMN L_DIBS.dibs_no IS '찜번호'
/

COMMENT ON COLUMN L_DIBS.user_id IS '회원ID'
/

COMMENT ON COLUMN L_DIBS.book_id IS '도서번호'
/

--==========================================================================
CREATE TABLE L_BOOKS
(
    book_no        INT               NOT NULL, 
    title          NVARCHAR2(100)    NOT NULL, 
    author         NVARCHAR2(100)    NOT NULL, 
    publisher      NVARCHAR2(100)    NOT NULL, 
    sales_count    NUMBER(18, 0)     NOT NULL, 
    image          NVARCHAR2(200)    NULL, 
    CONSTRAINT L_BOOKS_PK PRIMARY KEY (book_no)
)
/

CREATE SEQUENCE L_BOOKS_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER L_BOOKS_AI_TRG
BEFORE INSERT ON L_BOOKS 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT L_BOOKS_SEQ.NEXTVAL
    INTO :NEW.book_no
    FROM DUAL;
END;
/

--DROP TRIGGER L_BOOKS_AI_TRG;
/

--DROP SEQUENCE L_BOOKS_SEQ;
/

COMMENT ON TABLE L_BOOKS IS '도서'
/

COMMENT ON COLUMN L_BOOKS.book_no IS '도서번호'
/

COMMENT ON COLUMN L_BOOKS.title IS '도서제목'
/

COMMENT ON COLUMN L_BOOKS.author IS '저자'
/

COMMENT ON COLUMN L_BOOKS.publisher IS '출판사'
/

COMMENT ON COLUMN L_BOOKS.sales_count IS '도서정가'
/

COMMENT ON COLUMN L_BOOKS.image IS '이미지경로'
/
--==========================================================================

--==========================================================================

--==========================================================================

--==========================================================================

--==========================================================================