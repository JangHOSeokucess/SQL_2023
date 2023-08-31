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


