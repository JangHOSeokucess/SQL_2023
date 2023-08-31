-- �������� Book ���̺�
create table Book(
    bookid NUMBER(2) primary key,
    bookname  varchar2(40),
    publisher varchar2(40),
    price varchar2(8)
);

-- ������ Customer ���̺�
create table customer(
    custid NUMBER(2) primary key, 
    name varchar2(10),
    address varchar2(40),
    phone varchar2(40)
    );
-- �ֹ����� Orders ���̺�
create table Orders(
    orderid NUMBER(2) PRIMARY key,
    custid NUMBER(2) REFERENCES  customer(custid),
    bookid NUMBER(2) REFERENCES  Book(bookid),
    saleprice varchar(40),
    orderdate varchar(40)
);
--���Ե������� imported_book ���̺�
 create table Imported_book(
    bookid NUMBER(2) ,
    bookname  varchar2(40),
    publisher varchar2(40),
    price varchar2(8)
);

-- Book ���̺� 10���� ���� ������ �߰��ϼ���

insert into  Book values(1,'�����', '�½�����', 7000);
insert into  Book values(2,'������', '�½�����', 7000);
insert into  Book values(3,'�ڹ���', '�½�����', 7000);
insert into  Book values(4,'��ȣ��', '�½�����', 7000);
insert into  Book values(5,'����ȯ', '�½�����', 7000);
insert into  Book values(6,'�̼�ȣ', '�½�����', 7000);
insert into  Book values(7,'���ѿ�', '�½�����', 7000);
insert into  Book values(8,'������', '�½�����', 7000);
insert into  Book values(9,'������', '�½�����', 7000);
insert into  Book values(10,'����ȣ', '�½�����', 7000);

--Customer ���̺� ������ 5�� �߰�

insert into customer values(1,'���ѿ�','�籸' , '000-5000-001');
insert into customer values(2,'������','����' , '000-5000-001');
insert into customer values(3,'������','����' , '000-5000-001');
insert into customer values(4,'�ڹ���','����' , '000-5000-001');
insert into customer values(5,'��ȣ��','����' , '000-5000-001');

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
where bookname like '�½�����'; 

select name, phone from customer
    where name = '������';

select * from customer
    where name = '���ѿ�';
    
    select  bookname , price 
    from  book;
    -- book ���̺��� ������� ������ �˻��Ͻÿ�.
    select price ,bookname
    from book;
    -- book ���̺��� ���ݰ� �������� �˻��Ͻÿ�.
    
    -- book ���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�.
    
    select * from book;
    -- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
    
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
    --book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� ������ �˻��Ͻÿ�.
    select * from book where publisher In('�½�����','�س�','���������Ͽ콺');
    -- �� in �����ڸ� ����Ͻÿ�.
    
    --book ���̺��� ���ǻ簡 �½����� �س�, ���� �����Ͽ콺�� ������ �˻��Ͻÿ�.
    -- �� in �����ڸ� ������� ���ÿ�. (�񱳿����ڿ� or ������ ���)
    
    select * 
    from book
    where publisher = '�½�����' or publisher = '���������Ͽ콺' or publisher = '�س�' ;    
    
    --book  ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� �ƴ� ������ �˻��Ͻÿ�.
    --�� not in �����ڸ� ������ �غ��ÿ�.
    
    select * from book
    where publisher not in ('�½�����', '�س�', '���������Ͽ콺');
    --book ���̺��� ���ǻ簡 �½����� , �س�, ���������Ͽ콺�� �ƴ� ������ �˻��Ͻÿ�.
    -- �� not in �����ڸ� ������� ���ÿ�.(�񱳿����� or ������ ���)
    
    select * from book
    where publisher <> '�½�����' and publisher <>'�س�' and publisher <> '���������Ͽ콺';
    