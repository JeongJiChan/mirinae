select * from member;
alter table member rename column e_name to m_name;
ALTER TABLE member MODIFY(address VARCHAR2(200));
delete from member where m_no=5;
drop table cs;
insert into admin values (1234, 'master', 1, 'master');
select * from admin;
select * from support;
create table Member ( 
    m_no number primary key, 
    m_id varchar2(20), 
    m_pass varchar2(20), 
    m_nick varchar2(20), 
    m_email varchar2(20),
    m_name varchar2(20), 
    tel varchar2(20), 
    birth date, 
    address varchar2(20), 
    address_d varchar2(20),
    reg_date date,
    del char(1) 
);
create table mypick(
    m_no number references member(m_no) primary key, 
    p_no number references project(p_no) 
);
select * from mypick;
select * from member;

create table admin( 
    admin_no number primary key, 
    admin_id varchar2(20), 
    admin_pass varchar2(20),
    admin_nick varchar2(20) 
);
select * from admin;

create table notice( 
    no_no number primary key,
    no_title varchar2(20),
    no_content varchar2(4000),
    no_date date,
    no_view number, 
    no_del char(1),
    admin_no number references admin(admin_no)
);

create table cs( 
    cs_no number primary key, 
    cs_title varchar2(20), 
    cs_content varchar2(2000),
    cs_writer varchar2(20),
    cs_reg_date date,
    cs_view number,
    cs_del char(1), 
    cs_ref number,
    cs_re_step number,
    cs_re_level number,
    m_no number references member(m_no),
    admin_no number references admin(admin_no) 
);

select * from cs;
delete from cs where CS_TITLE='dsfa'
INSERT INTO cs VALUES(seq_test.NEXTVAL,'test','test합니다','jmg','210403', 0, 'n',1,1);

create table project( — 프로젝트
    p_no number primary key, — 프로젝트 번호
    cate_code number, — 카테고리 코드
    p_name varchar2(20), — 프로젝트명
    p_content varchar2(4000), — 프로젝트 내용
    p_writer varchar2(20), — 프로젝트 작성자
    s_date date, — 프로젝트 시작일자
    e_date date, — 프로젝트 종료일자
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
delete from support where sup_name = '정민권'
create table support( — 후원
    sup_no number primary key, — 후원번호
    m_no number references member(m_no), — 후원한 회원번호
    sup_address varchar2(100), — 배송지
    sup_tel varchar2(20), — 배송받을 번호
    sup_date date — 후원날짜
);
select * from support;
select * from support_detail
delete from support
ALTER TABLE support DROP COLUMN sup_name;
ALTER TABLE support DROP COLUMN sup_date;
ALTER TABLE support DROP COLUMN sup_tel;
alter table support add address_d varchar2(20);
ALTER TABLE support add sup_name varchar2(20);
ALTER TABLE support add sup_date date;
ALTER TABLE support add sup_tel varchar2(20);
ALTER TABLE support add p_name varchar2(20);
ALTER TABLE support add del char(1) default 'n';
ALTER TABLE support_detail add del char(1) default 'n';

create table options( — 옵션
    opt_code varchar2(10) primary key, — 옵션코드
    opt_name varchar2(20), — 옵션명
    opt_price number, — 옵션 가격
    p_no number references project(p_no) — 프로젝트번호
);

create table support_detail( — 후원내역
    supd_no number primary key, — 후원내역번호
    count number, — 후원내역 수량
    opt_code varchar2(10) references options(opt_code), — 후원내역의 옵션코드
    sup_no number references support(sup_no) — 후원내역의 후원번호
);

create sequence seq_member
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle
	nocache;
	
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

