select custid,(select address
            from customer cs
            where cs.custid=od.custid)"address",
                sum(saleprice)"total"

        from orders od
        group by od.custid;
--orders 테이블과 customer 테이블을 조인하여 각 고객의 주소와 총 판매액을 조회하시오.        
SELECT od.custid, cs.address AS "address", SUM(od.saleprice) AS "total"
FROM orders od
JOIN customer cs ON cs.custid = od.custid
GROUP BY od.custid;
        
select cs.name.s
from    (select custid,avg(saleprice)s
            from orders
            group by custid)od,customercs
where      cs.csutid =od.custid;
--orders 테이블에서 각 고객의 평균 판매액과 해당 고객의 이름을 조회하시오.
SELECT cs.name AS "name"
FROM (
    SELECT custid, AVG(saleprice) AS s
    FROM orders
    GROUP BY custid
) od, customer cs
WHERE cs.custid = od.custid;


select sum(saleprice)"total"
from    orders od
where exists   (select *
                from customer cs
                where custid <=3 AND cs.custid=od.custid);
--orders 테이블에서 주문한 상품 중 custid가 3 이하인 고객들의 총 판매액을 조회하시오
SELECT SUM(od.saleprice) AS "total"
FROM orders od
WHERE EXISTS (
    SELECT *
    FROM customer cs
    WHERE cs.custid <= 3 AND cs.custid = od.custid
);

--뷰 : 물리적인 하드디스크에 저장된 테이블이 있고 가상으로 만들어 놓는 것을 테이블이라고 함.
 
--create view 뷰이름 [(열이름[...n])]
--as select

select * from book;

--책이름에 정석이라는 단어가 포함된 결과행을 출력하시오.
select * from book
where bookname like '%정석';

create view v_book

as select * from book
where bookname like '%정석';

select * from customer;

--주소에 서울이라는 단어가 포함된
create view vw_customer
as select * from customer
where address like '%서울%';

select * from vw_customer;
--주문 테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성하시오.
create view vw_orders(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select od.orderid,od.custid, cs.name,
            od.bookid, bk.bookname, od.saleprice, od.orderdate
from orders od, customer cs , book bk
where od.custid =cs.custid and od.bookid =bk.bookid;
-- 김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오.
select * from vw_orders;                                                 

select orderid,bookname,saleprice
from vw_orders
where name ='김연아';
--기존의 뷰를 수정한다.
create or replace view vw_customer (custid, name, address)
as select custid,name,address
from customer
where address like '%영국%';

select *
from vw_customer;
--뷰 삭제
drop view vw_customer;
-- 판매가격이 20000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오.
create view highorders(도서번호,도서이름, 고객이름,출판사, 판매가격)
as select o.bookid ,b.bookname,c.name,b.publisher, o.saleprice
from book b, orders o , customer c

where b.bookid =o.bookid and o.custid = c.custid and saleprice >=20000;
--생성한 뷰를 이용하여 판매된 도서의 이ㅡㅁ과 고객의 이름을 출력하는 SQL 문을 작성하시오.
select 도서이름, 고객이름
from highorders;

--3

--pl-sql 의 문법과 사용방법을 알아본다.
--자바 프로그램과 데이터베이스를 연동하는 방법을 알아본다.


--insertbook 프로시저 실행

exec insertbook(13,'스포츠과학','마당과학서적', 25000);
     
select * from book;

exec bookinsertorupdate (14,'스포츠 즐거움','마당과학서적',30000);

exec bookinsertorupdate (14,'스포츠 즐거움','마당과학서적',20000);

set serveroutput on;
declare
    averageval number;
begin
    averageprice(averageval);
    dbms_output.put_line('책값 평균:' ||averageval);
end;