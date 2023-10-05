CREATE OR REPLACE PROCEDURE BOOKINSERTORUPDATE(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int)

AS
mycount number; -- number Çü º¯¼ö
BEGIN
    select count(*) into mycount from book
    where bookname like mybookname;
    if mycount!=0 then 
    update book set price = myprice
    where bookname like mybookname;
    else
     insert into book(bookid, bookname, publisher , price)
     values(mybookid,mybookname,mypublisher,myprice);
    end if;
end;
