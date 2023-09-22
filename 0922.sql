-- abs(-15) 절대값 출력
select abs(-15)
from dual;
-- 결과: 15

-- 값보다 큰 정수 중 가장 작은 수
select ceil(15.7)
from dual;
-- 결과: 16

-- 값보다 작은 정수 중 가장 큰 수[실수를 무조건 버림(음수일 경우는 제외)].
select floor(15.7)
from dual;
-- 결과: 15

select cos(3.14159)
from dual;
-- 결과: -1 (3.14159 라디안에 대한 코사인 값)

select log (10,100) 
from dual;
-- 결과: 2 (밑이 10인 로그에서 100을 사용한 로그 값)

select mod(11,4)
from dual;
-- 결과: 3 (11을 4로 나눈 나머지)

select power(3,2)
from dual;
-- 결과: 9 (3의 제곱)

select round(15.7)
from dual;
-- 결과: 16 (반올림한 값)

select sign(-15)
from dual;
-- 결과: -1 (-1은 음수를 나타내는 부호값)

select trunc(15.7)
from dual;
-- 결과: 15 (정수 부분만 남기고 나머지는 버림)

select chr(67)
from dual;
-- 결과: C ('C'에 해당하는 문자 출력)

select concat('happy','birthday')
from dual; 
 --결과 : happybirthday ('happy'와 'birthday'를 연결한 문자열 출력) 

 select lower('BIRTHDAY')
 from DUAL; 
 --결과 : birthday ('BIRTHDAY'를 소문자로 변환하여 출력) 

 select lpad('page1',15,'*.')
 from DUAL; 
 --결과 : ********page1 ('page1'을 왼쪽으로 '*' 문자로 채워서 총 길이가 15가 되도록 출력) 

 select ltrim('page1','ae')
 from DUAL; 
 --결과 : pg1 ('page1'에서 왼쪽에 있는 'a'와 'e' 문자를 제거하고 출력) 

 select replace('jack','j','BL')
 from DUAL; 
 --결과 : BLack ('jack'에서 첫 번째 'j'를 'BL'로 대체하여 출력) 

 select rpad('page1',15,'*.')
 from DUAL; 
 --결과 : page1********** ('page1'을 오른쪽으로 '*' 문자로 채워서 총 길이가 15가 되도록 출력) 

 select rtrim('page1','ae')
 from DUAL; 
 --결과 : pag ('page1'에서 오른쪽에 있는 'a', 'e' 문자를 제거하고 출력)  
 
 --null 값에 대한 연산과 집계 함수
 
 select price +100
 from book
 where bookid =3;
 
 select sum(price), avg(price), count(*),count(price)
 from book;
 
 select sum(price),avg(price),count(*)
 from book
 where bookid>=4;
 
 --  고객의 이름과 전화번호를 출력하시오.(단, 전화번호가 없는 고객은 '연락처 없음' 으로출력)
 
 select name 이름, phone 전화번호 from customer;
 select name 이름, nvl(phone,'연락처없음') 전화번호 from customer;
 
 -- 고객목록에서 고객번호, 이름,전화번호를 앞의 두명만 출력하시오
 select rownum 순번 , custid , name , phone 
 from customer;
  select rownum 순번 , custid , name , phone 
 from customer
 where rownum<=2;
 
 -- book 테이블을 생성하고 nulld에 관한 다음 sql 문에 답하시오
 
create table mybook(
    bookid number not null primary key,
    price number
);

--데이터 행 삽입

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook(bookid) values(3);

select * from mybook;

-- mybook 전체를 가져옴
select *
from mybook;
-- null 값을 0으로 출력함
select bookid, nvl(price,0)
from mybook;
--null 값의 값 전체를 불러옴
select * 
from mybook
where price is null;
-- where 부분이 출력이 안됨
select *
from mybook;
--where price = ";
-- 프라이스의 값이 100원 씩 올라서 출력 됨.
select bookid,price+100
from mybook;
--4 이상의 개수를 출력하려해서 출력이 안되고 널값의 평균과 총합이라서 출력이 안된다.
select sum(price),avg(price),count(*)
from mybook
where bookid>=4;
-- 합과 가격의 평균을 말해준다 널값은 
select sum(price), avg(price)
from mybook;
-- 전부 다 나옴
select *
from book;
--순번이 5이하인 값이 나옴
select *
from book
where rownum <=5;
-- 5이하 출력 price 중점으로
select *
from book
where rownum <=5
order by price;
--정렬된 상태에서 5개
select *
from (select * from book order by price)b
where rownum <=5;
--(5) 5번은 3번하고 결과가 같다.
select *
from (select *from book where rownum<=5)b
order by price;
--(6) 5번 3번하고 결과가 같다.
select *
from (select * from book where rownum <=5 order by price)b;

--평균판매금액 이하의 주문에 대해 주문번호와 금액을 출력하시오.
select orderid saleprice from orders;

select orderid saleprice from orders
where saleprice<=(select avg(saleprice)
                    from orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호,금액을 보이시오
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액
from orders 주문번호
where saleprice> (select avg(saleprice)
                from orders so
                where md.custid =so.custid);
                
-- 서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오.

select sum(saleprice) 총판매금액 from orders;
--  서울에 거주하는 사람의 고객번호
select custid from customer 
where address like '%서울';

select sum(saleprice) 총판매금액 from orders
where custid not in (select custid from customer 
where address like '%서울%');

--3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid,saleprice from orders;

select orderid 주문번호,saleprice 판매가격
from orders 주무번호
where saleprice>all(select saleprice
                    from orders
                    where custid ='3');
                    
--eexists 연산자로 서울에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오

select sum(saleprice) "total"
from orders mo
where exists (select * from customer c
where address like '%서울%' and mo.custid =c.custid);

--고객별 판매금액의 합계를 출력하시오(고객명,판매합계)
select custid , sum(saleprice)  
from orders o group by custid;
--고객별 판매금액의 합계를 출력하시오(고객명,판매합계)
select (select name
        from customer cs
        where cs.custid =od.custid)"name",sum(saleprice)"total"
    from orders od
    group by od.custid;
-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set o.bookname = (select bookname from book b where b.bookid = o.bookid);

--고객 번호가 2 이하인 고객의 판매금액을 출력하시오. (고객이름과 고객 별 판매액출력 값)
select custid 고객번호, name 이름 from customer
where custid<=2;

--고객 번호가 2이하인 고객의 판매금액을 출력하시오.(고객이름과 고객별 판매액 출력)
select name 고객이름, sum(saleprice) 판매총액
from (select custid , name from customer
where custid<=2) c, orders o
where c.custid=o.custid
group by name;

-- 각 고객별 주소와 판매 총액을 출력하는 쿼리
select custid,
       (select address from customer cs where cs.custid = od.custid) as "address",
       sum(saleprice) as "total"
from orders od
group by od.custid;

-- 각 고객의 평균 판매가격과 이름을 출력하는 쿼리
select cs.name, s
from (select custid, avg(saleprice) as s from orders group by custid) od, customer cs
where cs.custid = od.custid;

-- 고객 ID가 3 이하인 경우에 대해 주문의 판매 가격 합계를 출력하는 쿼리
select sum(saleprice) as "total"
from orders od
where exists (
    select *
    from customer cs
    where custid <= 3 and cs.custid = od.custid);
-- 5-2 부터 하면됨 부속질의
commit;
