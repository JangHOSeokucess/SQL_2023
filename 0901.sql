select * from book;
--book 테이블에서 과학이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색하시오.

select * 
from book
where price >= 15000 and bookname like '%과학%';

--book 테이블에서 출판사가 굿스포츠 또는 어크로스인 도서를 검색하시오

select *
from book
where publisher in('굿스포츠','어크로스');
-- 다른 느낌은로
select* 
from book
where publisher = '굿스포츠' or publisher = '어크로스';
--book테이블에서 도서명순으로 검색하시오.
select *
from book
order by bookname;
-- book 테이블에서 도서번호순으로 검색하시오.
select* from book order by bookid;

-- book 테이블에서 가격순으로 검색하고 같은 가격이면 이름순으로 검색하시오.

select * from book order by price,bookname;

-- book 테이블에서 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색하시오.

select * 
from book
order by price desc , publisher asc;

--orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오.
--집계함수 사용

select*
from orders;

select sum(saleprice) as 총판매금액 from orders;

--2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오

select sum(saleprice) as  총매출 from orders where custid=2;

--orders 테이블에서 고객번호가 11인 도서의 총 판매액을 구하시오

select sum(saleprice) as 총판매액 from orders where custid =1;

--고객이 주문한 도서의 총 판매액 ,평균값 , 최저가 ,최고가를 구하시오.

select sum(saleprice) as total,
       avg(saleprice) as average,
       min(saleprice) as minimum,
       max(saleprice) as maximu
       from orders;
       
-- orders 테이블에서 판매한 도서의 개수를 구하시오.
select count(*)
from orders;
-- orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오
select count(*) from orders where saleprice >= 13000;
-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오.
select count(*) from orders where custid =1 or custid = 3;

--고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.,
-- 그룹화(부분합): group by
select custid , count (*) as 도서수량 , sum(saleprice) as 총액

from orders

group by custid;

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단 , 두권 이상 구매한 고객만 구한다.

select custid, count(*)  as 도서수량
from orders
where saleprice >=7000
group by custid
having count(*) >=2
order by custid ;

-- 마당서점의 고객이 요구하는 다음 질문에 대해  sql 문을 작성하시오

-- 도서번호가 1인 도서의 이름
select *
from book
where bookid =1;

--가격이 20,000원 이상인 도서의 이름

select *
from book
where bookprcie>=20000;

--이석호의 총 구매액 (이석호의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) 
from orders
where custid=1;

--이한울이 구매한 도서의 수 (이한울의 고객번호는 1번으로 놓고 작성)

select count('이한울')
from orders
where custid =1;

--1 
select bookname from book where bookid = 1;

--2
select bookname from book where price >= 20000;

--3 
select sum(saleprice) from orders where custid = 1;

--4
select count(*) from orders where custid =1;

--1
select count(*) from book;

--2
select count(distinct publisher) 출판사 from book;

--3
select name, address from customer;

--4
SELECT orderid FROM orders WHERE orderdate BETWEEN '2023-07-04' AND '2023-07-07';

--5
SELECT orderid FROM orders WHERE orderdate not BETWEEN '2023-07-04' AND '2023-07-07';

--6
select name, address from customer where name like '%김%';

--7
select name, address from customer where name like '%김%' and name like '%아%';
