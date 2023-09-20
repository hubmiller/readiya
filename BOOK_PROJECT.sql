-- 고객 테이블 생성
create table book_customer(
    id   varchar2(200) not null,
    password  varchar2(200) not null,
    name   varchar2(200) not null,
    age   varchar2(20) not null,
    gender varchar2(20) not null,
    bitrh    varchar2(1000) not null,
    phone varchar2(1000) not null,
    address varchar2(1000),
    email varchar2(500),
    primary key (id)
);
commit;

-- 고객 테이블 데이터 삽입
insert into book_customer values('admin', '1234', '홍길동', '26', '남', '2004-05-21', '010-6451-8465', '대구시 달서구', 'hgd@gmail.com');

select * from book_customer;

select * from book_customer where id = 'min' and password = '1111';

-- 국가 테이블 생성
create table readiya_nation(
    nationId   varchar2(2) primary key,
    nationName varchar2(50)
);
 
-- 국가 테이블 데이터 삽입
insert into readiya_nation values ('01', '국내');
insert into readiya_nation values ('02', '국외');
 
-- 작가 테이블 시퀀스 생성
create sequence seq_author;

-- 작가 테이블 생성
create table readiya_author(
    authorId     number(10,0) primary key,
    authorName   varchar2(50),
    nationId     varchar2(50),
    authorIntro  long,
    foreign key (nationId) references readiya_nation(nationId)
);

-- 작가 테이블 데이터 삽입
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '유홍준', '01', '작가 소개입니다' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '김난도', '01', '작가 소개입니다' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '폴크루그먼', '02', '작가 소개입니다' );

commit;

select * from readiya_nation;
select * from readiya_author;

-- 작가 테이블 수정
alter table readiya_author add regDate date default sysdate;
alter table readiya_author add updateDate date default sysdate;

delete from readiya_author;

drop sequence seq_author;

create sequence seq_author;
 
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '유홍준', '01', '작가 소개입니다' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '김난도', '01', '작가 소개입니다' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '폴크루그먼', '02', '작가 소개입니다' );
 
select * from readiya_author order by authorId desc;

commit;

select * from USER_INDEXES;

-- 재귀 복사
insert into readiya_author(authorId, authorName, nationId)(select seq_author.nextval, authorName, nationId from readiya_author);
commit;

select authorId, authorName, nationId, authorIntro, regDate, updateDate
from
    (select /*+ index_desc(readiya_author pk_author) */ rownum as rn, authorId, authorName, nationId, authorIntro, regDate, updateDate from readiya_author where rownum <= 20)
where rn > 10;

-- 상품 테이블 
create table readiya_book(
    bookId         number         primary key,             -- 상품 아이디
    bookName       varchar2(50)   not null,                -- 상품 이름
    authorId       number,                                 -- 작가 아이디
    publeYear      Date           not null,                -- 출판일
    publisher      varchar2(70)   not null,                -- 출판사
    cateCode       varchar2(30),                           -- 카테고리 코드
    bookPrice      number         not null,                -- 상품 가격
    bookStock      number         not null,                -- 상품 재고
    bookDiscount   number(2,2),                            -- 할인율
    bookIntro      clob,                                   -- 상품 소개
    bookContents   clob,                                   -- 상품 내용(목차)
    regDate        date           default sysdate,         -- 등록 날짜
    updateDate     date           default sysdate          -- 수정 날짜
);

drop sequence seq_book;
create sequence seq_book;

-- 카테고리 테이블
create table readiya_bcate(
    tier        number(1)       not null,                  -- 카테고리 등급
    cateName    varchar2(30)    not null,                  -- 카테고리 이름
    cateCode    varchar2(30)    not null,                  -- 카테고리 코드
    cateParent  varchar2(30),                              -- 상위 카테고리
    primary key(cateCode),
    foreign key(cateParent) references readiya_bcate(cateCode) 
);

insert into readiya_bcate(tier, cateName, cateCode) values (1, '국내', '100000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '소설', '101000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '한국소설', '101001','101000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '영미소설', '101002','101000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '일본소설', '101003','101000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '시/에세이', '102000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '한국시', '102001','102000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '해외시', '102002','102000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '경제/경영', '103000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '경영일반', '103001','103000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '경영이론', '103002','103000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '경제일반', '103003','103000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '경제이론', '103004','103000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '자기계발', '104000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '성공/처세', '104001','104000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '자기능력계발', '104002','104000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '인간관계', '104003','104000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '인문', '105000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '심리학', '105001','105000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '교육학', '105002','105000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '철학', '105003','105000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '역사/문화', '106000','100000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '역사일반', '106001','106000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '세계사', '106002','106000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '한국사', '106003','106000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '과학', '107000','100000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '과학이론', '107001','107000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '수학', '107002','107000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '물리학', '107003','107000');
insert into readiya_bcate(tier, cateName, cateCode) values (1, '국외', '200000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '문학', '201000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '소설', '201001','201000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '시', '201002','201000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '희곡', '201003','201000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '인문/사회', '202000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '교양', '202001','202000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '철학', '202002','202000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '경제/경영', '203000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '경제학', '203001','203000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '경영학', '203002','203000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '투자', '203003','203000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '과학/기술', '204000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '교양과학', '204001','204000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '물리학', '204002','204000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '수학', '204003','204000');
        
commit;

select * from readiya_bcate;

select * from readiya_book;

select * from readiya_author;

delete from readiya_author where nationId is NULL;

-- 외래키 추가
alter table readiya_book add foreign key (authorId) references readiya_author(authorId);
alter table readiya_book add foreign key (cateCode) references readiya_bcate(cateCode);

select authorId from readiya_author minus select authorId from readiya_book;
select cateCode from readiya_bcate minus select cateCode from readiya_book;

--재귀 복사
insert into readiya_book(bookId, bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount, bookIntro, bookContents)
(select seq_book.nextval, bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount, bookIntro, bookContents from readiya_book);

commit; 

select * from USER_INDEXES;

delete from readiya_book where bookId = '7';

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'READIYA_BOOK';
commit;

delete from readiya_book;


select authorId from readiya_author; order by authorId;

select authorId from readiya_book order by bookId;     

select * from readiya_book where bookId = '169';
commit;

alter table readiya_book add bookContents varchar2(2000);
alter table readiya_book modify bookDiscount varchar2(2000);
commit;

delete readiya_book where bookname='태블릿테스트';

select * from book_customer;

-- 장바구니 테이블 생성
create table readiya_cart(
    cartId       number         primary key,
    id           varchar2(50),
    bookId       number,
    bookCount    number,
    foreign key (id) references book_customer(id),
    foreign key (bookId) references readiya_book(bookId)
);

create sequence seq_cart;

-- 유니크 제약조건 걸기
alter table readiya_cart add unique (id, bookId);

drop table readiya_cart;
drop sequence seq_cart;

select * from readiya_cart;

-- 자유게시판 테이블 생성
create table readiya_board(
    bno   number
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    constraint pk_board PRIMARY key(bno)
);
 
 create sequence seq_board;
