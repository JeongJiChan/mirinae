create table member ( -- 회원 테이블
    m_no number primary key, -- 회원번호
    m_id varchar2(20), -- 아이디
    m_pass varchar2(20), -- 비밀번호
    m_nick varchar2(20), -- 닉네임
    m_email varchar2(20), -- 이메일
    m_name varchar2(20), -- 이름
    tel varchar2(20), -- 전화번호
    birth date, -- 생년월일
    address varchar2(200), -- 주소
    address_d varchar2(20), -- 상세주소
    reg_date date, -- 가입일
    del char(1) -- 탈퇴여부
);

create table admin( -- 관리자 테이블
    admin_no number primary key, -- 관리자번호
    admin_id varchar2(20), -- 관리자id
    admin_pass varchar2(20), -- 관리자 비밀번호
    admin_nick varchar2(20) -- 관리자 닉네임
);

create table notice( -- 공지사항 테이블
    no_no number primary key, -- 공지사항 글번호
    no_title varchar2(100), -- 공지사항 제목
    no_content varchar2(4000), -- 공지사항 내용
    no_date date, -- 공지사항 작성일
    no_view number, -- 공지사항 조회수
    no_del char(1), -- 공지사항 삭제여부
    admin_no number references admin(admin_no) -- 관리자번호
);

create table cs(  -- 고객문의 테이블
    cs_no number primary key, -- 고객문의 글번호
    cs_title varchar2(20), -- 고객문의 제목
    cs_content varchar2(2000), -- 고객문의 내용
    cs_writer varchar2(20), -- 고객문의 작성자
    cs_reg_date date, -- 고객문의 작성일
    cs_view number, -- 고객문의 조회수
    cs_del char(1), -- 고객문의 삭제여부
    cs_ref number, -- 고객문의 답글그룹
    cs_re_step number, -- 고객문의 답글 들여쓰기
    cs_re_level number, -- 고객문의 답글 순서
    m_no number references member(m_no), -- 회원번호
    admin_no number references admin(admin_no) -- 관리자번호
);

create table project( -- 프로젝트 테이블
    p_no number primary key, -- 프로젝트 번호
    cate_code number, -- 카테고리 코드 번호
    p_name varchar2(40), -- 프로젝트 이름
    p_content varchar2(4000), -- 프로젝트 내용
    p_writer varchar2(20), -- 프로젝트 작성자
    s_date date, -- 프로젝트 시작일자
    e_date date, -- 프로젝트 종료일자
    goal_money number, -- 프로젝트 목표금액
    p_view number, -- 프로젝트 조회수
    p_del varchar2(5), -- 프로젝트 삭제여부
    reg_date date, -- 프로젝트 작성일자
    cur_money number, -- 프로젝트 현재달성금액
   	m_id varchar2(20) references member(m_id) -- id
);

create table category( -- 카테고리 테이블
    cate_code number primary key, -- 카테고리 코드번호
    cate_name varchar(20) -- 카테고리 이름
);

create table mypick( -- 마이픽 테이블
    my_no number primary key, -- 마이픽넘버
	m_no number references member(m_no), -- 회원번호
    p_no number references project(p_no) -- 프로젝트번호
);

create table support( -- 후원 테이블
    sup_no number primary key, -- 후원번호
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

