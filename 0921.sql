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
    
    create table NewBook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price   number);
    
    create table newbook2(
    booid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(booid));
    
    create table newbook3(
    bookid number   primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
    
    --고객정보(newcustomer 테이블)
    -- custid(기본키), name , address , phone
    --그냥 캐릭터와 가변형 캐릭터의 차이점 : 40바이트를 다 써야함. 남는공간 공백문자
    create table newcustomer(
    custid number   primary key,
    name varchar2(40),
    address varchar2(40),
    phone   varchar2(30));
    -- orders 기본키
    -- custid(not null, newcustomer custid 참조해서 외래키 , 연쇄삭제)
    -- bookid( not null, newbook3 bookid 참조해서 외래키 , 연쇄삭제)
    -- saleprice
    --orderdate(date 형)
    create table neworders(
    orderid number primary key,
    custid  number  not null,
    bookid  number  not null,
    saleprice   number,
    orderdate   date,
    foreign key(custid) 
    references newcustomer(custid) 
    on delete cascade);
    
    --외래키 제약조건을 명시할 때는 반드시 참조되는 테이블(부모 릴레이션)이 존재해야 함
    -- 참조되는 테이블의 기본키여야 함
    -- 외래키 지정시 on delete 또는 on update 옵션은 참조되는 테이블의 튜플이 삭제되거나 수정될 때 취할 수 있는 동작을 지정
    --no action 은 어떠한 동작도 취하지 않음
    
    --alter 문은 생성된 테이블의 속성과 속성에 관한 제약을 변경하며, 기본키 및 외래키를 변경함
    --add, drop 은 속성을 추가하거나 제거할 때 사용
    --modifty는 속성의기본값을 설정하거나 삭제할 때 사용
    --add<제약이름> , drop <제약이름> 은 제약사항을 추가하거나 삭제할 때 사용
    
    --alter 문의 기본 문법
    --[add 속성이름 데이터타입]
    --[drop column 속성이름]
    --[alter column 속성이름 데이터타입]
    --[alter column 속성이름 pnull i not null]]
    --[add primary key(속성이름)]
    --[[add \ drop ] 제약이름]
    --기존의 newbook 테이블을 삭제하고 새 테이블 작성
    create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar(20),
    price number);
    
    
    --newbook 테이블에 varchar2(13)의 자료형을 가진 isbn 속성을 추가하시오
    alter table newbook
    add isbn varchar(13);
    --newbook 테이블의 isbn 속성의 데이터 타입을 number형으로 변경하시오
    alter table newbook
    modify isbn number;
    --newbook 테이블의 isbn 속성을 삭제하시오.
    alter table newbook
    drop column isbn;
    --newbook 테이블의 bookid 속성에 not null 제약조건을 적용하시오.
    alter table newbook 
    modify bookid number not null;
    --newbook 테이블의 bookid 속성을 기본키로 변경하시오. not null 제약조건
    alter table newbook 
    add primary key(bookid);
    
    --bookid 컬럼의 기본키 추가
    
    alter table newbook
    add primary key(booid);
    
    --테이블 삭제
    drop talbe newbook;
    
    -- DML(select(데이터 선택) ,insert(데이터 삽입) , update(데이터 수정) , delete(데이터 삭제) )
    
    -- insert 문은 테이블에 새로운 투플을 삽입하는 명령임
    
    --insert 문의 기본 문법
    
    --insert into 테이블이름[{속성리스트}]
    --values(값리스트);
    --insert 1번: 속성리스트 생략
insert into book
values(11,'개미','해냄',12000);

--insert 2번: 속성(컬럼)리스트 명시

insert into book(bookid,bookname,publisher,price)
values(12,'라임오렌지나무','좋은책', 12000);

--insert 3번: 컬럼의 순서를 변경
insert into book(bookid,price,publisher,bookname)
values(13,28000,'부자나라','부의 습관');


--insert 4번: 특정 컬럼의 값을 생략
insert into book (bookid,price,bookname)
values(14,10000,'아침명상');
    
-- 테이블구조가 같은 다른 테이블의 데이터행 삽입하는 방법

insert into book (bookid, bookname,price,publisher)
select bookid,bookname, price , publisher
from imported_book;
-- update: 데이터 변경
-- 고객번호가 5번인 고객의 주소를 대한민국 부산 변경하시오.

select * from customer;
update customer
set address = '대한민국 부산'
where custid = 5;

--customer 테이블에서 이지석 고객의 주소를 이한울 고객의 주소로 변경하시오

update customer
set address = (select address
               from customer
               where name = '이한울')
where name = '이지석';

-- 이지석 고객의 전화번호를 이한울 고객의 전화번호와 동일하게 변경하시오

update customer
set phone = (select phone
             from customer
             where name = '이한울')
where name = '이지석';

-- 모든 고객을 삭제하시오

delete from customer;

select * from orders;

--이지석 고객을 삭제하시오.

delete from customer

where name = '이지석';

rollback;

commit;

--나예은이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

--두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

--전체 고객의 30%이상이 구매한 도서

--박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름을 출력하시오.

--박지성이 구매한 도서의 출판사  이름을 출력하시오.
select publisher from customer cs, orders os,book bs
where cs.custid=os.custid and os.bookid =bookid =bs.bookid
and name like '이지석';

select name from
from customer cs, orders os , book bs
where cs.custid=os.custid and os.bookid =bookid =bs.bookid
and name not like '이지석'
and publisher in(
            select publisher 
            from customer cs, orders os,book bs
            where cs.custid=os.custid and os.bookid =bookid =bs.bookid
                \ and name like '이지석');
                
--두개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름을 출력하시오.

select name from customer cm
where( select count(distinct publisher) from customer c, orders o , book b
where c.custid = o.custid and o.bookid = b.bookid
and name like cm.name)>=2;

--전체 고객의 30% 이상이 구매한 도서
select bookname from book bm
where(select count((b.bookid) from book b, orders o
        where b.bookid = o.bookid and b.bookid =bm.bookid)
        >= (select count(*) from customer)*0.3;

--새로운 도서('스포츠 세계' , '대한 미디어', 10000원) 이  마당서점에 입고 되었다.
이럴 경우 필요한 데이터가 무엇인지 알아본다

--만약 삽입이 되지 않는다면 부족한 데이터가 있는지 확인해 본다.
insert into book values(11,'스포츠세계','대한미디어',10000);

--'데이원' 에서 출판한 도서를 삭제하시오.
delete from book
where publisher like '데이원';
select * from book;

--'해냄' 에서 출판한 도서를 삭제하시오.

-- 만약 삭제가 되지 않는다면 오류메시지를 확인해 보세요.

delete from book
where publisher like '해냄' ;
--무결성 제약조건이 위배되었습니다 -- orders 테이블의 자식 레코드가 발견되었습니다
-- 따라서 '해냄' 출판사의 도서정보는 삭제할 수 없다.

--출판사'대한미디어'를 '대한출판사' 로 이름을 바꾸시오

update book                                                                         
set publisher '대한미디어'
where publisher '대한출판사';

-- 요약 sql/ 데이터 정의어(dll) / 데이터 조작어(dml) / where조건 /집계 함수 / group by / having / 조인 / 부속질의 / 동등조인/ 상관 부속질의/ 투플 변수/ 집합연산 / exists / create / alter / drop / insert /update / deleter

--ABS 함수 : 절댓값을 구하는 함수 : 078과 +78의 절댓값을 구하시오
SELECT ABS(-78),ABS(+78)
FROM DUAL;

--ROUND 함수: 반올림한 값을 구하는 함수
--5.657를 소숫점에서 반올림한 값을 구하시오
SELECT ROUND(5.657,1)
FROM DUAL;

--고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오.
SELECT custid "고객번호" , ROUND(avg(saleprice)/COUNT(*), -2 ),"평균금액"
FROM   Orders
GROUP BY   custid;
--도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 출력하시오.
-- 실제 book테이블의 원본데이터를 변경하면 안됩니다.

select bookid,replace( bookname,'과학','수학') bookname, publisher,price from book;
select * from book;

--length: 글자의 수를 세어주는 함수 (단위가 byte 가 아닌 문자 단위)
-- 해냄에서 출판한 도서의 제목과 제목의 글자 수를 확인하시오

select bookname "제목" , Length(bookname) " 글자수"
lengthb(bookname)"바이트수"
from bo0ok
where publisher like  '해냄';

--고객중에서 같은 성씨를 가진 사람이 몇명인지 성씨별 인원수를 출력하시오.

select substr(name,1,1) "성씨", count(*) "인원수"
from customer 
group by substr(name,1,1);

-- 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.

select orderid "주문번호" ,orderdate "주문일", orderdate+10 "확정"
from  orders
order by orderid;    


--2023sus 8월 28일에 주문받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오.
--단, 주문일은 "yyyy년 mm월 dd일과 같은 format 으로 표시하시오.

select orderid 주문번호, orderdate 주문일, cusdid 고객번호, bookid 도서번호
from orders
where 
and orderdate = to_date(;202030824','yyyymmdd');

--2023sus 8월 28일에 주문받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오.
--단, 주문일은 "yyyy년 mm월 dd일과 같은 format 으로 표시하시오.

select orderid 주문번호, orderdate 주문일, cusdid 고객번호,name 고객명, bookname 도서명
from orders o, customer c, book b
where c.custid = o.custid and b.bookid = o.bookid
and orderdate = to_date(;202030824','yyyymmdd');

--sysdatetime : 오라클의 현재 날짜와 시간을 반환하는 함수

--db서버의 설정된 날짜와 시간 요일을 출력하시오.
-- 실제 반환된 날짜와 형식을 지정한"(년도 4자리/날짜2자리/간략한 요일,시:분:초) 날짜와 시간 2가지를 모두 출력하시오.

select sysdate 원래반환된값, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') 지정형식날짜및시간 from dual;







                