drop table member;
select * from member;
alter table member rename column e_name to m_name;
ALTER TABLE member MODIFY(address VARCHAR2(200));
delete from member where m_no=19;
alter table cs rename column cs_date to cs_reg_date;
insert into cs values (2, 'test','test', 'test', '210506', 1, 'n', 1, 1);
insert into member values (1, 'test', 'test', 'test', 'test', 'test', 'test', sysdate, 'test', sysdate, 'n');
insert into admin values (1, 'master', 'master', 'master');
select * from cs;

create table cs(
    cs_no number primary key,
    cs_title varchar2(20),
    cs_content varchar2(2000),
    cs_writer varchar2(20),
    cs_date date,
    cs_view number,
    cs_del char(1),
    m_no number references member(m_no),
    admin_no number references admin(admin_no)
);

create table Member ( — 회원
    m_no number primary key, — 회원번호
    m_id varchar2(20), — 회원아이디
    m_pass varchar2(20), — 회원비밀번호
    m_nick varchar2(20), — 회원닉네임
    m_email varchar2(20), — 회원이메일
    m_name varchar2(20), — 회원이름
    tel varchar2(20), — 회원전화번호
    birth date, — 회원생년월일
    address varchar2(20), — 회원주소
    reg_date date, — 회원가입일
    del char(1) — 회원삭제여부
);

create table admin( — 관리자
    admin_no number primary key, — 관리자번호
    admin_id varchar2(20), — 관리자아이디
    admin_pass varchar2(20), — 관리자비밀번호
    admin_nick varchar2(20) — 관리자닉네임
);

create table notice( — 공지사항
    no_no number primary key, — 공지사항 글번호
    no_title varchar2(20), — 공지사항 제목
    no_content varchar2(4000), — 공지사항 내용
    no_date date, — 공지사항 작성일
    no_view number, — 공지사항 조회수
    no_del char(1), — 공지사항 삭제여부
    admin_no number references admin(admin_no) — 공지사항 관리자번호
);

create table cs( — 고객문의
    cs_no number primary key, — 고객문의 글번호
    cs_title varchar2(20), — 고객문의 제목
    cs_content varchar2(2000), — 고객문의 내용
    cs_writer varchar2(20), — 고객문의 작성자
    cs_reg_date date, — 고객문의 작성일
    cs_view number, — 고객문의 조회수
    cs_del char(1), — 고객문의 삭제여부
    ref number, — 고객문의 참조번호
    ref_step number, — 고객문의 답글순서
    ref_level number, — 고객문의 들여쓰기 레벨
    m_no number references member(m_no), — 고객문의 회원번호
    admin_no number references admin(admin_no) — 고객문의 관리자 번호
);

create table project( — 프로젝트
    p_no number primary key, — 프로젝트 번호
    cate_code number, — 카테고리 코드
    p_name varchar2(20), — 프로젝트명
    p_content varchar2(4000), — 프로젝트 내용
    p_writer varchar2(20), — 프로젝트 작성자
    s_date date, — 프로젝트 시작일자
    d_date date, — 프로젝트 종료일자
    goal_money number, — 프로젝트 목표금액
    p_view number, — 프로젝트 조회수
    p_del varchar2(5), — 프로젝트 삭제여부
    reg_date date, — 프로젝트 작성일자
    cur_money number — 프로젝트 현재달성금액
);

create table category( — 카테고리
    cate_code number primary key, — 카테고리 코드
    cate_name varchar(20) — 카테고리 이름
);

create table mypick( — 마이픽
    m_no number references member(m_no) primary key, — 마이픽한 회원번호
    p_no number references project(p_no) — 마이픽한 프로젝트번호
);

create table reply( — 댓글
    reply_no number primary key, — 댓글번호
    reply_content varchar2(400), — 댓글내용
    reply_date date, — 댓글 작성일
    ref number, — 댓글 참조번호
    ref_step number, — 댓글순서
    ref_level number, — 댓글 들여쓰기 레벨
    m_no number references member(m_no), — 댓글 작성자
    p_no number references project(p_no) — 댓글단 프로젝트 번호
);

create table support( — 후원
    sup_no number primary key, — 후원번호
    m_no number references member(m_no), — 후원한 회원번호
    sup_address varchar2(100), — 배송지
    sup_tel varchar2(20), — 배송받을 번호
    sup_date date — 후원날짜
);

drop table support_detail;
drop table options;
create table options( -- 옵션
    opt_code number primary key, -- 옵션코드
    opt_name varchar2(20), -- 옵션명
    opt_price number, -- 옵션 가격
    p_no number references project(p_no) -- 프로젝트번호
);
create table support_detail( -- 후원내역
    supd_no number primary key, -- 후원내역번호
    count number, -- 후원내역 수량
    opt_code number references options(opt_code), -- 후원내역의 옵션코드
    sup_no number references support(sup_no) -- 후원내역의 후원번호
);

create sequence seq_member
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle
	
	
	select count(*) from notice;
	select * from admin;
	
select * from admin;
insert into ADMIN values(2,'admin2','1111','admin2');
select * from project;

ALTER TABLE project RENAME COLUMN d_date TO e_date;
desc project;
select * from member;
select * from mypick;
insert into mypick values(3,1);
