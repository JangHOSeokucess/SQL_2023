create or replace procedure insertbook(
    mybookid in NUMBER,
    mybookname in varchar,
    mypublisher in varchar2,
    myprice in number)
    as
    begin insert into book(bookid,bookname,publisher,price)
    values(mybookid,mybookname,mypublisher,myprice);
    end;
    
    --begin end  ºí·Ï´À³¦
    
     