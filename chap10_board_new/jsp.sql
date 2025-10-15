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
    INTO board VALUES (1, '작성자1', '제목1', '내용1', 0, 1, 0, SYSDATE-19, '1234', '192.168.0.1', 0, NULL, 0)
    INTO board VALUES (2, '작성자2', '제목2', '내용2', 0, 2, 0, SYSDATE-18, '1234', '192.168.0.2', 0, NULL, 0)
    INTO board VALUES (3, '작성자3', '제목3', '내용3', 0, 3, 0, SYSDATE-17, '1234', '192.168.0.3', 0, NULL, 0)
    INTO board VALUES (4, '작성자4', '제목4', '내용4', 0, 4, 0, SYSDATE-16, '1234', '192.168.0.4', 0, NULL, 0)
    INTO board VALUES (5, '작성자5', '제목5', '내용5', 0, 5, 0, SYSDATE-15, '1234', '192.168.0.5', 0, NULL, 0)
    INTO board VALUES (6, '작성자6', '제목6', '내용6', 0, 6, 0, SYSDATE-14, '1234', '192.168.0.6', 0, NULL, 0)
    INTO board VALUES (7, '작성자7', '제목7', '내용7', 0, 7, 0, SYSDATE-13, '1234', '192.168.0.7', 0, NULL, 0)
    INTO board VALUES (8, '작성자8', '제목8', '내용8', 0, 8, 0, SYSDATE-12, '1234', '192.168.0.8', 0, NULL, 0)
    INTO board VALUES (9, '작성자9', '제목9', '내용9', 0, 9, 0, SYSDATE-11, '1234', '192.168.0.9', 0, NULL, 0)
    INTO board VALUES (10, '작성자10', '제목10', '내용10', 0, 10, 0, SYSDATE-10, '1234', '192.168.0.10', 0, NULL, 0)
SELECT * FROM DUAL;

ALTER TABLE board
MODIFY count NUMBER DEFAULT 0;
create sequence SEQ_BOARD;
