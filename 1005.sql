select custid,(select address
            from customer cs
            where cs.custid=od.custid)"address",
                sum(saleprice)"total"

        from orders od
        group by od.custid;
--orders ���̺�� customer ���̺��� �����Ͽ� �� ���� �ּҿ� �� �Ǹž��� ��ȸ�Ͻÿ�.        
SELECT od.custid, cs.address AS "address", SUM(od.saleprice) AS "total"
FROM orders od
JOIN customer cs ON cs.custid = od.custid
GROUP BY od.custid;
        
select cs.name.s
from    (select custid,avg(saleprice)s
            from orders
            group by custid)od,customercs
where      cs.csutid =od.custid;
--orders ���̺��� �� ���� ��� �Ǹžװ� �ش� ���� �̸��� ��ȸ�Ͻÿ�.
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
--orders ���̺��� �ֹ��� ��ǰ �� custid�� 3 ������ ������ �� �Ǹž��� ��ȸ�Ͻÿ�
SELECT SUM(od.saleprice) AS "total"
FROM orders od
WHERE EXISTS (
    SELECT *
    FROM customer cs
    WHERE cs.custid <= 3 AND cs.custid = od.custid
);

--�� : �������� �ϵ��ũ�� ����� ���̺��� �ְ� �������� ����� ���� ���� ���̺��̶�� ��.
 
--create view ���̸� [(���̸�[...n])]
--as select

select * from book;

--å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * from book
where bookname like '%����';

create view v_book

as select * from book
where bookname like '%����';

select * from customer;

--�ּҿ� �����̶�� �ܾ ���Ե�
create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;
--�ֹ� ���̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 �����Ͻÿ�.
create view vw_orders(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select od.orderid,od.custid, cs.name,
            od.bookid, bk.bookname, od.saleprice, od.orderdate
from orders od, customer cs , book bk
where od.custid =cs.custid and od.bookid =bk.bookid;
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.
select * from vw_orders;                                                 

select orderid,bookname,saleprice
from vw_orders
where name ='�迬��';
--������ �並 �����Ѵ�.
create or replace view vw_customer (custid, name, address)
as select custid,name,address
from customer
where address like '%����%';

select *
from vw_customer;
--�� ����
drop view vw_customer;
-- �ǸŰ����� 20000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.
create view highorders(������ȣ,�����̸�, ���̸�,���ǻ�, �ǸŰ���)
as select o.bookid ,b.bookname,c.name,b.publisher, o.saleprice
from book b, orders o , customer c

where b.bookid =o.bookid and o.custid = c.custid and saleprice >=20000;
--������ �並 �̿��Ͽ� �Ǹŵ� ������ �̤Ѥ��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
select �����̸�, ���̸�
from highorders;

--3

--pl-sql �� ������ ������� �˾ƺ���.
--�ڹ� ���α׷��� �����ͺ��̽��� �����ϴ� ����� �˾ƺ���.


--insertbook ���ν��� ����

exec insertbook(13,'����������','������м���', 25000);
     
select * from book;

exec bookinsertorupdate (14,'������ ��ſ�','������м���',30000);

exec bookinsertorupdate (14,'������ ��ſ�','������м���',20000);

set serveroutput on;
declare
    averageval number;
begin
    averageprice(averageval);
    dbms_output.put_line('å�� ���:' ||averageval);
end;