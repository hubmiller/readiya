-- �� ���̺� ����
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

-- �� ���̺� ������ ����
insert into book_customer values('admin', '1234', 'ȫ�浿', '26', '��', '2004-05-21', '010-6451-8465', '�뱸�� �޼���', 'hgd@gmail.com');

select * from book_customer;

select * from book_customer where id = 'min' and password = '1111';

-- ���� ���̺� ����
create table readiya_nation(
    nationId   varchar2(2) primary key,
    nationName varchar2(50)
);
 
-- ���� ���̺� ������ ����
insert into readiya_nation values ('01', '����');
insert into readiya_nation values ('02', '����');
 
-- �۰� ���̺� ������ ����
create sequence seq_author;

-- �۰� ���̺� ����
create table readiya_author(
    authorId     number(10,0) primary key,
    authorName   varchar2(50),
    nationId     varchar2(50),
    authorIntro  long,
    foreign key (nationId) references readiya_nation(nationId)
);

-- �۰� ���̺� ������ ����
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '��ȫ��', '01', '�۰� �Ұ��Դϴ�' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '�賭��', '01', '�۰� �Ұ��Դϴ�' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '��ũ��׸�', '02', '�۰� �Ұ��Դϴ�' );

commit;

select * from readiya_nation;
select * from readiya_author;

-- �۰� ���̺� ����
alter table readiya_author add regDate date default sysdate;
alter table readiya_author add updateDate date default sysdate;

delete from readiya_author;

drop sequence seq_author;

create sequence seq_author;
 
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '��ȫ��', '01', '�۰� �Ұ��Դϴ�' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '�賭��', '01', '�۰� �Ұ��Դϴ�' );
insert into readiya_author(authorId, authorName, nationId, authorIntro) values(seq_author.nextval, '��ũ��׸�', '02', '�۰� �Ұ��Դϴ�' );
 
select * from readiya_author order by authorId desc;

commit;

select * from USER_INDEXES;

-- ��� ����
insert into readiya_author(authorId, authorName, nationId)(select seq_author.nextval, authorName, nationId from readiya_author);
commit;

select authorId, authorName, nationId, authorIntro, regDate, updateDate
from
    (select /*+ index_desc(readiya_author pk_author) */ rownum as rn, authorId, authorName, nationId, authorIntro, regDate, updateDate from readiya_author where rownum <= 20)
where rn > 10;

-- ��ǰ ���̺� 
create table readiya_book(
    bookId         number         primary key,             -- ��ǰ ���̵�
    bookName       varchar2(50)   not null,                -- ��ǰ �̸�
    authorId       number,                                 -- �۰� ���̵�
    publeYear      Date           not null,                -- ������
    publisher      varchar2(70)   not null,                -- ���ǻ�
    cateCode       varchar2(30),                           -- ī�װ� �ڵ�
    bookPrice      number         not null,                -- ��ǰ ����
    bookStock      number         not null,                -- ��ǰ ���
    bookDiscount   number(2,2),                            -- ������
    bookIntro      clob,                                   -- ��ǰ �Ұ�
    bookContents   clob,                                   -- ��ǰ ����(����)
    regDate        date           default sysdate,         -- ��� ��¥
    updateDate     date           default sysdate          -- ���� ��¥
);

drop sequence seq_book;
create sequence seq_book;

-- ī�װ� ���̺�
create table readiya_bcate(
    tier        number(1)       not null,                  -- ī�װ� ���
    cateName    varchar2(30)    not null,                  -- ī�װ� �̸�
    cateCode    varchar2(30)    not null,                  -- ī�װ� �ڵ�
    cateParent  varchar2(30),                              -- ���� ī�װ�
    primary key(cateCode),
    foreign key(cateParent) references readiya_bcate(cateCode) 
);

insert into readiya_bcate(tier, cateName, cateCode) values (1, '����', '100000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '�Ҽ�', '101000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ��Ҽ�', '101001','101000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '���̼Ҽ�', '101002','101000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�Ϻ��Ҽ�', '101003','101000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '��/������', '102000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ���', '102001','102000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ؿܽ�', '102002','102000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '����/�濵', '103000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵�Ϲ�', '103001','103000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵�̷�', '103002','103000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�����Ϲ�', '103003','103000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�����̷�', '103004','103000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '�ڱ���', '104000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '����/ó��', '104001','104000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ڱ�ɷ°��', '104002','104000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ΰ�����', '104003','104000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '�ι�', '105000','100000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ɸ���', '105001','105000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '105002','105000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, 'ö��', '105003','105000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '����/��ȭ', '106000','100000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�����Ϲ�', '106001','106000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�����', '106002','106000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ���', '106003','106000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '����', '107000','100000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�����̷�', '107001','107000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '107002','107000');
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '107003','107000');
insert into readiya_bcate(tier, cateName, cateCode) values (1, '����', '200000');
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '����', '201000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�Ҽ�', '201001','201000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '��', '201002','201000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '���', '201003','201000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '�ι�/��ȸ', '202000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '202001','202000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, 'ö��', '202002','202000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '����/�濵', '203000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '203001','203000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵��', '203002','203000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '203003','203000');    
    insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (2, '����/���', '204000','200000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '�������', '204001','204000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '204002','204000');    
        insert into readiya_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '204003','204000');
        
commit;

select * from readiya_bcate;

select * from readiya_book;

select * from readiya_author;

delete from readiya_author where nationId is NULL;

-- �ܷ�Ű �߰�
alter table readiya_book add foreign key (authorId) references readiya_author(authorId);
alter table readiya_book add foreign key (cateCode) references readiya_bcate(cateCode);

select authorId from readiya_author minus select authorId from readiya_book;
select cateCode from readiya_bcate minus select cateCode from readiya_book;

--��� ����
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

delete readiya_book where bookname='�º��׽�Ʈ';

select * from book_customer;

-- ��ٱ��� ���̺� ����
create table readiya_cart(
    cartId       number         primary key,
    id           varchar2(50),
    bookId       number,
    bookCount    number,
    foreign key (id) references book_customer(id),
    foreign key (bookId) references readiya_book(bookId)
);

create sequence seq_cart;

-- ����ũ �������� �ɱ�
alter table readiya_cart add unique (id, bookId);

drop table readiya_cart;
drop sequence seq_cart;

select * from readiya_cart;

-- �����Խ��� ���̺� ����
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
