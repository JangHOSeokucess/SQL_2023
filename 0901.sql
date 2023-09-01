select * from book;
--book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.

select * 
from book
where price >= 15000 and bookname like '%����%';

--book ���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�

select *
from book
where publisher in('�½�����','��ũ�ν�');
-- �ٸ� ��������
select* 
from book
where publisher = '�½�����' or publisher = '��ũ�ν�';
--book���̺��� ����������� �˻��Ͻÿ�.
select *
from book
order by bookname;
-- book ���̺��� ������ȣ������ �˻��Ͻÿ�.
select* from book order by bookid;

-- book ���̺��� ���ݼ����� �˻��ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.

select * from book order by price,bookname;

-- book ���̺��� ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ �˻��Ͻÿ�.

select * 
from book
order by price desc , publisher asc;

--orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
--�����Լ� ���

select*
from orders;

select sum(saleprice) as ���Ǹűݾ� from orders;

--2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�

select sum(saleprice) as  �Ѹ��� from orders where custid=2;

--orders ���̺��� ����ȣ�� 11�� ������ �� �Ǹž��� ���Ͻÿ�

select sum(saleprice) as ���Ǹž� from orders where custid =1;

--���� �ֹ��� ������ �� �Ǹž� ,��հ� , ������ ,�ְ��� ���Ͻÿ�.

select sum(saleprice) as total,
       avg(saleprice) as average,
       min(saleprice) as minimum,
       max(saleprice) as maximu
       from orders;
       
-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*)
from orders;
-- orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�
select count(*) from orders where saleprice >= 13000;
-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
select count(*) from orders where custid =1 or custid = 3;

--������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.,
-- �׷�ȭ(�κ���): group by
select custid , count (*) as �������� , sum(saleprice) as �Ѿ�

from orders

group by custid;

-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. �� , �α� �̻� ������ ���� ���Ѵ�.

select custid, count(*)  as ��������
from orders
where saleprice >=7000
group by custid
having count(*) >=2
order by custid ;

-- ���缭���� ���� �䱸�ϴ� ���� ������ ����  sql ���� �ۼ��Ͻÿ�

-- ������ȣ�� 1�� ������ �̸�
select *
from book
where bookid =1;

--������ 20,000�� �̻��� ������ �̸�

select *
from book
where bookprcie>=20000;

--�̼�ȣ�� �� ���ž� (�̼�ȣ�� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) 
from orders
where custid=1;

--���ѿ��� ������ ������ �� (���ѿ��� ����ȣ�� 1������ ���� �ۼ�)

select count('���ѿ�')
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
select count(distinct publisher) ���ǻ� from book;

--3
select name, address from customer;

--4
SELECT orderid FROM orders WHERE orderdate BETWEEN '2023-07-04' AND '2023-07-07';

--5
SELECT orderid FROM orders WHERE orderdate not BETWEEN '2023-07-04' AND '2023-07-07';

--6
select name, address from customer where name like '%��%';

--7
select name, address from customer where name like '%��%' and name like '%��%';
