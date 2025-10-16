create or replace sequence seq_vote start with 1;



create table board(
num number primary key,
name varchar2(20), 
subject varchar2(50),
content varchar2(4000), 
pos number,
ref number,
depth number,
regdate date,
pass varchar2(20),
ip varchar2(50),
count number,
filename varchar2(50),
filesize number
);

-- 테이블 자체에 대한 주석 추가
COMMENT ON TABLE board IS '답변형 게시판 테이블';

-- 각 컬럼에 대한 주석 추가
COMMENT ON COLUMN board.num IS '게시번호를 저장하는 컬럼';
COMMENT ON COLUMN board.name IS '작성자 이름을 저장하는 칼럼';
COMMENT ON COLUMN board.subject IS '제목을 저장하는 칼럼';
COMMENT ON COLUMN board.content IS '본문 내용을 저장하는 칼럼';
COMMENT ON COLUMN board.pos IS '상대적 위치값을 저장하여 화면에 순서대로 보여주는 역할의 칼럼';
COMMENT ON COLUMN board.ref IS '답변글일 경우 소속된 부모글을 가리키는 번호를 저장하는 칼럼';
COMMENT ON COLUMN board.depth IS '답변글의 깊이를 저장하는 칼럼';
COMMENT ON COLUMN board.regdate IS '작성된 날짜를 저장하는 칼럼';
COMMENT ON COLUMN board.pass IS '작성자의 패스워드를 저장하는 칼럼';
COMMENT ON COLUMN board.ip IS '작성자의 IP주소를 저장하는 칼럼';
COMMENT ON COLUMN board.count IS '게시물의 조회수를 저장하는 칼럼';
COMMENT ON COLUMN board.filename IS '업로드된 파일의 이름을 저장하는 칼럼';
COMMENT ON COLUMN board.filesize IS '업로드된 파일의 크기를 저장하는 칼럼';

INSERT ALL
INSERT INTO board VALUES (15, '작성자15', '게시판 제목입니다 15', '게시판 내용입니다 15', 0, 15, 0, SYSDATE-20, '1234', '192.168.0.1', 0, NULL, 0);
SELECT * FROM DUAL;

INSERT INTO board VALUES (16, '작성자16', '게시판 제목입니다 16', '게시판 내용입니다 16', 0, 16, 0, SYSDATE-19, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (17, '작성자17', '게시판 제목입니다 17', '게시판 내용입니다 17', 0, 17, 0, SYSDATE-19, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (18, '작성자18', '게시판 제목입니다 18', '게시판 내용입니다 18', 0, 18, 0, SYSDATE-18, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (19, '작성자19', '게시판 제목입니다 19', '게시판 내용입니다 19', 0, 19, 0, SYSDATE-18, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (20, '작성자20', '게시판 제목입니다 20', '게시판 내용입니다 20', 0, 20, 0, SYSDATE-17, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (21, '작성자21', '게시판 제목입니다 21', '게시판 내용입니다 21', 0, 21, 0, SYSDATE-17, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (22, '작성자22', '게시판 제목입니다 22', '게시판 내용입니다 22', 0, 22, 0, SYSDATE-16, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (23, '작성자23', '게시판 제목입니다 23', '게시판 내용입니다 23', 0, 23, 0, SYSDATE-16, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (24, '작성자24', '게시판 제목입니다 24', '게시판 내용입니다 24', 0, 24, 0, SYSDATE-15, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (25, '작성자25', '게시판 제목입니다 25', '게시판 내용입니다 25', 0, 25, 0, SYSDATE-15, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (26, '작성자26', '게시판 제목입니다 26', '게시판 내용입니다 26', 0, 26, 0, SYSDATE-14, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (27, '작성자27', '게시판 제목입니다 27', '게시판 내용입니다 27', 0, 27, 0, SYSDATE-14, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (28, '작성자28', '게시판 제목입니다 28', '게시판 내용입니다 28', 0, 28, 0, SYSDATE-13, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (29, '작성자29', '게시판 제목입니다 29', '게시판 내용입니다 29', 0, 29, 0, SYSDATE-13, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (30, '작성자30', '게시판 제목입니다 30', '게시판 내용입니다 30', 0, 30, 0, SYSDATE-12, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (31, '작성자31', '게시판 제목입니다 31', '게시판 내용입니다 31', 0, 31, 0, SYSDATE-12, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (32, '작성자32', '게시판 제목입니다 32', '게시판 내용입니다 32', 0, 32, 0, SYSDATE-11, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (33, '작성자33', '게시판 제목입니다 33', '게시판 내용입니다 33', 0, 33, 0, SYSDATE-11, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (34, '작성자34', '게시판 제목입니다 34', '게시판 내용입니다 34', 0, 34, 0, SYSDATE-10, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (35, '작성자35', '게시판 제목입니다 35', '게시판 내용입니다 35', 0, 35, 0, SYSDATE-10, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (36, '작성자36', '게시판 제목입니다 36', '게시판 내용입니다 36', 0, 36, 0, SYSDATE-9, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (37, '작성자37', '게시판 제목입니다 37', '게시판 내용입니다 37', 0, 37, 0, SYSDATE-9, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (38, '작성자38', '게시판 제목입니다 38', '게시판 내용입니다 38', 0, 38, 0, SYSDATE-8, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (39, '작성자39', '게시판 제목입니다 39', '게시판 내용입니다 39', 0, 39, 0, SYSDATE-8, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (40, '작성자40', '게시판 제목입니다 40', '게시판 내용입니다 40', 0, 40, 0, SYSDATE-7, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (41, '작성자41', '게시판 제목입니다 41', '게시판 내용입니다 41', 0, 41, 0, SYSDATE-7, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (42, '작성자42', '게시판 제목입니다 42', '게시판 내용입니다 42', 0, 42, 0, SYSDATE-6, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (43, '작성자43', '게시판 제목입니다 43', '게시판 내용입니다 43', 0, 43, 0, SYSDATE-6, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (44, '작성자44', '게시판 제목입니다 44', '게시판 내용입니다 44', 0, 44, 0, SYSDATE-5, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (45, '작성자45', '게시판 제목입니다 45', '게시판 내용입니다 45', 0, 45, 0, SYSDATE-5, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (46, '작성자46', '게시판 제목입니다 46', '게시판 내용입니다 46', 0, 46, 0, SYSDATE-4, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (47, '작성자47', '게시판 제목입니다 47', '게시판 내용입니다 47', 0, 47, 0, SYSDATE-4, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (48, '작성자48', '게시판 제목입니다 48', '게시판 내용입니다 48', 0, 48, 0, SYSDATE-3, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (49, '작성자49', '게시판 제목입니다 49', '게시판 내용입니다 49', 0, 49, 0, SYSDATE-3, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (50, '작성자50', '게시판 제목입니다 50', '게시판 내용입니다 50', 0, 50, 0, SYSDATE-2, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (51, '작성자51', '게시판 제목입니다 51', '게시판 내용입니다 51', 0, 51, 0, SYSDATE-2, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (52, '작성자52', '게시판 제목입니다 52', '게시판 내용입니다 52', 0, 52, 0, SYSDATE-1, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (53, '작성자53', '게시판 제목입니다 53', '게시판 내용입니다 53', 0, 53, 0, SYSDATE-1, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (54, '작성자54', '게시판 제목입니다 54', '게시판 내용입니다 54', 0, 54, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (55, '작성자55', '게시판 제목입니다 55', '게시판 내용입니다 55', 0, 55, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (56, '작성자56', '게시판 제목입니다 56', '게시판 내용입니다 56', 0, 56, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (57, '작성자57', '게시판 제목입니다 57', '게시판 내용입니다 57', 0, 57, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (58, '작성자58', '게시판 제목입니다 58', '게시판 내용입니다 58', 0, 58, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (59, '작성자59', '게시판 제목입니다 59', '게시판 내용입니다 59', 0, 59, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (60, '작성자60', '게시판 제목입니다 60', '게시판 내용입니다 60', 0, 60, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (61, '작성자61', '게시판 제목입니다 61', '게시판 내용입니다 61', 0, 61, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (62, '작성자62', '게시판 제목입니다 62', '게시판 내용입니다 62', 0, 62, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (63, '작성자63', '게시판 제목입니다 63', '게시판 내용입니다 63', 0, 63, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
INSERT INTO board VALUES (64, '작성자64', '게시판 제목입니다 64', '게시판 내용입니다 64', 0, 64, 0, SYSDATE, '1234', '192.168.0.1', 0, NULL, 0);
SELECT * FROM DUAL;

    ALTER TABLE board
MODIFY count NUMBER DEFAULT 0;
create sequence SEQ_BOARD;

-- board_seq.NEXTVAL 이 자동으로 다음 번호를 가져옵니다. (예: 65)
INSERT INTO board 
VALUES (15, '작성자15', '게

시판 제목입니다 15', '게시판 내용입니다 15', 0, board_seq.CURRVAL, 0, SYSDATE-20, '1234', '192.168.0.1', 0, NULL, 0);


UPDATE board
SET 
    name = '작성자15',
    subject = '게시판 제목입니다 15',
    content = '게시판 내용입니다 15',
    ref = 15,
    pos = 0,
    reg_date = SYSDATE-20,
    password = '1234',
    ip = '192.168.0.1',
    -- ... 다른 컬럼들도 필요에 따라 추가 ...
WHERE
    num = 15; -- 첫 번째 컬럼명이 board_id라고 가정