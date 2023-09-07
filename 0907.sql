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
insert into customer values(6,'김재윤','과천' , '000-5000-001');

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
    
    --book 테이블에서 도서명이 축구의 역사인 행을 검색하시오.
    select bookname, publisher
    from book
    where bookname LIKE ' 축구의 역사';
    
    select bookname, publisher
    from book
    where bookname like '%축구%';
    
    --book 테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오.
    
    select * from book
    where bookname like '%한울%';
    
    --book 테이블에서 도서명에 과학이라는 문자열로 끝나는 행을 검색하시오.
    select * from book
    where bookname like '%과학';
    
    --book 테이블에서 도서명에 '의' 자 앞에 임의의 3글자가 포함된 문자열을 갖는 행을 검색하시오
    
    select * from book
    where bookname like '___의';
    
    select * from book where bookname Like '_구%';
    
    select *
    from book
    where bookname Like '%축구%' and price >=20000;
    
    select *
    from book
    where publisher= '굿스포츠' or publisher = '대한미디어';
    
    select * 
    from customer , orders;
    
    
    
    
    
    
    
    
    
    
    -- 동등조인(equi Join)
    -- 여러개의 테이블을 연결할 때 특정 컬럼의 값이 같은 행들만 검색할 때 사용
    -- 고객과 고객의 주문에 관한 데이터를 모두 출력하시오
    
    select * from customer, orders
    where customer.custid = orders.custid;
    
    --고객과 고객의 주문에 관한 데이터를 모두 고객번호순으로 출력하시오
    
    select * from custtomer, orders
    where customer.custid = orders.custid
    order by customer.custid desc;
    
    select name , saleprice
    from customer, orders
    where customer.custid = orders.custid;
    
    select name, sum(saleprice)
    from customer, orders
    where customer.custid = orders.custid
    group by customer.name
    order by customer.name;
    
    -- 고객의 이름, 주문한 도서 판매가격을 검색하시오.
    
    select name , saleprice 
    from customer, orders
    where cutomer.custid = orders.custid;
    
    -- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
    
    select name, sum(saleprice)
    from customer, orders
    where customer.custid = orders.custid
    group by customer.name
    order by customer.name;
    
    --고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
    
    select customer.name, book.bookname
    from customer.orders.book
    where customer.custid =orders.custid and orders.bookid = book.bookid;
    
    --3개의 테이블에 대한 동등 조인
    
    select name, bookname from custoemr c, book b, orders o
    where c.custid = o.custid and o.bookid = b.bookdid
    order by name;
    
    --도서가격이 16000원인 도서를 주문한 고객이름과 도서이름을 출력하시오
    
    select name,bookname from customer c , book b, orders o
    where c.custid = o.custid and o.bookid =b.bookid and price = 18000;
    
    --도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
    
    select customer.name ,saleprice
    from customer left outer join orders
                on customer.custid=orders.custid;
    
    -- 외부조인(outer join)
    -- 동등조인을 하게 되면 값이 동등하지 않은 행은 무시되지만
    -- 외부조인을 하게되면 기준이 되는 테이블의 값이 동등하지 않은 데이터 행도 포함하여 출력해준다.
    
    --도서를 구매하지 않은 고객도 포함하여 고객이름과 주문한 도서의 판매가격을 출력하시오.
    
    select name, saleprice from customer c left outer join orders ;.
    o
        on c.custid = o.custid;
        
    -- sub query(부속 질의)
    -- main query 내에 있는 query
    
    -- 도서가격이 가장 비싼 도서이름을 출력하시오
    select max(price)
    from book;
    -- 도서 가격이 가장 비싼 데이터행
    select bookname
    from book
    where price <=8000;
    -- 도서가격이 가장 싼 도서의 이름과 가격을 출력하시오
    select bookname, price
    from book
    where price = (select min(price) from book);
    
    --도서를 구매한 적이 있는 고객의 이름을 검색하시오
    select name
    from customer
    where custid in (select custid from orders);
    --sub query : 주문한 적이 있는 고객
    select distinct custid from orders;
    --소금에서 출판한 도서를 구매한 고객의 이름을 출력하시오
    
    select name from customer;
    select boodid, bookanme from book
    where publisher = '소금';
    --도서를 구매한 사람의 고객번호
    select distinct custid from orders;
    --소금에서 출판한 도서를 구매한 고객의 이름을 보이시오.
    
    select name
    from customer
    where custid in(select custid
                 from orders
                 where bookid in(select bookid
                                from book
                                where publisher = '소금'));
    
    --예은이 코드
    
    select distinct custid
    from orders;
    
    select name
    from customer c, orders o, book b
    where o.bookid = b.bookid and c.custid =o.custid and
    b.publisher = '삼호미디어';
    
    