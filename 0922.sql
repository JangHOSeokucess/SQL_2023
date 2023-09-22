-- abs(-15) ���밪 ���
select abs(-15)
from dual;
-- ���: 15

-- ������ ū ���� �� ���� ���� ��
select ceil(15.7)
from dual;
-- ���: 16

-- ������ ���� ���� �� ���� ū ��[�Ǽ��� ������ ����(������ ���� ����)].
select floor(15.7)
from dual;
-- ���: 15

select cos(3.14159)
from dual;
-- ���: -1 (3.14159 ���ȿ� ���� �ڻ��� ��)

select log (10,100) 
from dual;
-- ���: 2 (���� 10�� �α׿��� 100�� ����� �α� ��)

select mod(11,4)
from dual;
-- ���: 3 (11�� 4�� ���� ������)

select power(3,2)
from dual;
-- ���: 9 (3�� ����)

select round(15.7)
from dual;
-- ���: 16 (�ݿø��� ��)

select sign(-15)
from dual;
-- ���: -1 (-1�� ������ ��Ÿ���� ��ȣ��)

select trunc(15.7)
from dual;
-- ���: 15 (���� �κи� ����� �������� ����)

select chr(67)
from dual;
-- ���: C ('C'�� �ش��ϴ� ���� ���)

select concat('happy','birthday')
from dual; 
 --��� : happybirthday ('happy'�� 'birthday'�� ������ ���ڿ� ���) 

 select lower('BIRTHDAY')
 from DUAL; 
 --��� : birthday ('BIRTHDAY'�� �ҹ��ڷ� ��ȯ�Ͽ� ���) 

 select lpad('page1',15,'*.')
 from DUAL; 
 --��� : ********page1 ('page1'�� �������� '*' ���ڷ� ä���� �� ���̰� 15�� �ǵ��� ���) 

 select ltrim('page1','ae')
 from DUAL; 
 --��� : pg1 ('page1'���� ���ʿ� �ִ� 'a'�� 'e' ���ڸ� �����ϰ� ���) 

 select replace('jack','j','BL')
 from DUAL; 
 --��� : BLack ('jack'���� ù ��° 'j'�� 'BL'�� ��ü�Ͽ� ���) 

 select rpad('page1',15,'*.')
 from DUAL; 
 --��� : page1********** ('page1'�� ���������� '*' ���ڷ� ä���� �� ���̰� 15�� �ǵ��� ���) 

 select rtrim('page1','ae')
 from DUAL; 
 --��� : pag ('page1'���� �����ʿ� �ִ� 'a', 'e' ���ڸ� �����ϰ� ���)  
 
 --null ���� ���� ����� ���� �Լ�
 
 select price +100
 from book
 where bookid =3;
 
 select sum(price), avg(price), count(*),count(price)
 from book;
 
 select sum(price),avg(price),count(*)
 from book
 where bookid>=4;
 
 --  ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��, ��ȭ��ȣ�� ���� ���� '����ó ����' �������)
 
 select name �̸�, phone ��ȭ��ȣ from customer;
 select name �̸�, nvl(phone,'����ó����') ��ȭ��ȣ from customer;
 
 -- ����Ͽ��� ����ȣ, �̸�,��ȭ��ȣ�� ���� �θ� ����Ͻÿ�
 select rownum ���� , custid , name , phone 
 from customer;
  select rownum ���� , custid , name , phone 
 from customer
 where rownum<=2;
 
 -- book ���̺��� �����ϰ� nulld�� ���� ���� sql ���� ���Ͻÿ�
 
create table mybook(
    bookid number not null primary key,
    price number
);

--������ �� ����

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook(bookid) values(3);

select * from mybook;

-- mybook ��ü�� ������
select *
from mybook;
-- null ���� 0���� �����
select bookid, nvl(price,0)
from mybook;
--null ���� �� ��ü�� �ҷ���
select * 
from mybook
where price is null;
-- where �κ��� ����� �ȵ�
select *
from mybook;
--where price = ";
-- �����̽��� ���� 100�� �� �ö� ��� ��.
select bookid,price+100
from mybook;
--4 �̻��� ������ ����Ϸ��ؼ� ����� �ȵǰ� �ΰ��� ��հ� �����̶� ����� �ȵȴ�.
select sum(price),avg(price),count(*)
from mybook
where bookid>=4;
-- �հ� ������ ����� �����ش� �ΰ��� 
select sum(price), avg(price)
from mybook;
-- ���� �� ����
select *
from book;
--������ 5������ ���� ����
select *
from book
where rownum <=5;
-- 5���� ��� price ��������
select *
from book
where rownum <=5
order by price;
--���ĵ� ���¿��� 5��
select *
from (select * from book order by price)b
where rownum <=5;
--(5) 5���� 3���ϰ� ����� ����.
select *
from (select *from book where rownum<=5)b
order by price;
--(6) 5�� 3���ϰ� ����� ����.
select *
from (select * from book where rownum <=5 order by price)b;

--����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid saleprice from orders;

select orderid saleprice from orders
where saleprice<=(select avg(saleprice)
                    from orders);

-- �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ,�ݾ��� ���̽ÿ�
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ�
from orders �ֹ���ȣ
where saleprice> (select avg(saleprice)
                from orders so
                where md.custid =so.custid);
                
-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.

select sum(saleprice) ���Ǹűݾ� from orders;
--  ���￡ �����ϴ� ����� ����ȣ
select custid from customer 
where address like '%����';

select sum(saleprice) ���Ǹűݾ� from orders
where custid not in (select custid from customer 
where address like '%����%');

--3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid,saleprice from orders;

select orderid �ֹ���ȣ,saleprice �ǸŰ���
from orders �ֹ���ȣ
where saleprice>all(select saleprice
                    from orders
                    where custid ='3');
                    
--eexists �����ڷ� ���￡ �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�

select sum(saleprice) "total"
from orders mo
where exists (select * from customer c
where address like '%����%' and mo.custid =c.custid);

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�(����,�Ǹ��հ�)
select custid , sum(saleprice)  
from orders o group by custid;
--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�(����,�Ǹ��հ�)
select (select name
        from customer cs
        where cs.custid =od.custid)"name",sum(saleprice)"total"
    from orders od
    group by od.custid;
-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set o.bookname = (select bookname from book b where b.bookid = o.bookid);

--�� ��ȣ�� 2 ������ ���� �Ǹűݾ��� ����Ͻÿ�. (���̸��� �� �� �Ǹž���� ��)
select custid ����ȣ, name �̸� from customer
where custid<=2;

--�� ��ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�.(���̸��� ���� �Ǹž� ���)
select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from (select custid , name from customer
where custid<=2) c, orders o
where c.custid=o.custid
group by name;

-- �� ���� �ּҿ� �Ǹ� �Ѿ��� ����ϴ� ����
select custid,
       (select address from customer cs where cs.custid = od.custid) as "address",
       sum(saleprice) as "total"
from orders od
group by od.custid;

-- �� ���� ��� �ǸŰ��ݰ� �̸��� ����ϴ� ����
select cs.name, s
from (select custid, avg(saleprice) as s from orders group by custid) od, customer cs
where cs.custid = od.custid;

-- �� ID�� 3 ������ ��쿡 ���� �ֹ��� �Ǹ� ���� �հ踦 ����ϴ� ����
select sum(saleprice) as "total"
from orders od
where exists (
    select *
    from customer cs
    where custid <= 3 and cs.custid = od.custid);
-- 5-2 ���� �ϸ�� �μ�����
commit;
