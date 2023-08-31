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


