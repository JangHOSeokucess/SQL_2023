-- 도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) primary key,
    bookname  varchar2(40),
    publisher varchar2(40),
    price varchar2(8)
);

-- 고객정보 Customer 테이블
create table customer(
    custid NUMBER(2) primary key, 
    name varchar2(10),
    address varchar2(40),
    phone varchar2(40)
    );
-- 주문정보 Orders 테이블
create table Orders(
    orderid NUMBER(2) PRIMARY key,
    custid NUMBER(2) REFERENCES  customer(custid),
    bookid NUMBER(2) REFERENCES  Book(bookid),
    saleprice varchar(40),
    orderdate varchar(40)
);
--수입도서정보 imported_book 테이블
 create table Imported_book(
    bookid NUMBER(2) ,
    bookname  varchar2(40),
    publisher varchar2(40),
    price varchar2(8)
);

-- Book 테이블에 10권의 도서 정보를 추가하세요

insert into  Book values(1,'신재상', '굿스포츠', 7000);
insert into  Book values(2,'나예은', '굿스포츠', 7000);
insert into  Book values(3,'박민주', '굿스포츠', 7000);
insert into  Book values(4,'장호석', '굿스포츠', 7000);
insert into  Book values(5,'장현환', '굿스포츠', 7000);
insert into  Book values(6,'이석호', '굿스포츠', 7000);
insert into  Book values(7,'이한울', '굿스포츠', 7000);
insert into  Book values(8,'이지석', '굿스포츠', 7000);
insert into  Book values(9,'김재윤', '굿스포츠', 7000);
insert into  Book values(10,'유승호', '굿스포츠', 7000);

--Customer 테이블에 고객정보 5명 추가

insert into customer values(1,'이한울','양구' , '000-5000-001');
insert into customer values(2,'나예은','전주' , '000-5000-001');
insert into customer values(3,'이지석','구미' , '000-5000-001');
insert into customer values(4,'박민주','용인' , '000-5000-001');
insert into customer values(5,'장호석','광주' , '000-5000-001');

insert into orders values (1,1,1,6000,TO_DATE('2023-01-13', 'yyyy-mm-dd'));
insert into orders values (2,1,3,21000,TO_DATE('2023-02-02', 'yyyy-mm-dd'));
insert into orders values (3,2,5,8000,TO_DATE('2023-03-11', 'yyyy-mm-dd'));
insert into orders values (4,3,6,6000,TO_DATE('2023-04-23', 'yyyy-mm-dd'));
insert into orders values (5,4,7,20000,TO_DATE('2023-05-30', 'yyyy-mm-dd'));
insert into orders values (6,1,2,12000,TO_DATE('2023-06-29', 'yyyy-mm-dd'));
insert into orders values (7,4,8,13000,TO_DATE('2023-07-05', 'yyyy-mm-dd'));
insert into orders values (8,3,10,12000,TO_DATE('2023-08-06', 'yyyy-mm-dd'));
insert into orders values (9,2,10,000,TO_DATE('2023-09-11', 'yyyy-mm-dd'));
insert into orders values (10,3,8,13000,TO_DATE('2023-10-17', 'yyyy-mm-dd'));

insert into imported_book values(21, 'zen golf' , 'person' , 12000);
insert into imported_book values(22, 'soccer skills' , 'Hu man Kinetics' , 15000);

select publisher , price From book
where bookname like '굿스포츠'; 

select name, phone from customer
    where name = '이지석';

select * from customer
    where name = '이한울';
    
    select  bookname , price 
    from  book;
    -- book 테이블에서 도서명과 가격을 검색하시오.
    select price ,bookname
    from book;
    -- book 테이블에서 가격과 도서명을 검색하시오.
    
    -- book 테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오.
    
    select * from book;
    -- book 테이블에서 모든 출판사를 검색하시오.
    
    select distinct publisher from book;
    
    select * 
    from book 
    where price<20000;
    
    select * 
    from book 
    where price between 10000 and 20000;
    
    select * 
    from book 
    where price >= 10000 and price <= 20000;
    --book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검색하시오.
    select * from book where publisher In('굿스포츠','해냄','웅진지식하우스');
    -- 단 in 연산자를 사용하시오.
    
    --book 테이블에서 출판사가 굿스포츠 해냄, 웅진 지식하우스인 도서를 검색하시오.
    -- 단 in 연산자를 사용하지 마시오. (비교연산자와 or 연산자 사용)
    
    select * 
    from book
    where publisher = '굿스포츠' or publisher = '웅진지식하우스' or publisher = '해냄' ;    
    
    --book  테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스가 아닌 도서를 검색하시오.
    --단 not in 연산자를 가지고 해보시오.
    
    select * from book
    where publisher not in ('굿스포츠', '해냄', '웅진지식하우스');
    --book 테이블에서 출판사가 굿스포츠 , 해냄, 웅진지식하우스가 아닌 도서를 검색하시오.
    -- 단 not in 연산자를 사용하지 마시오.(비교연산자 or 연산자 사용)
    
    select * from book
    where publisher <> '굿스포츠' and publisher <>'해냄' and publisher <> '웅진지식하우스';
    