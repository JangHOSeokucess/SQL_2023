CREATE OR REPLACE PROCEDURE INTEREST AS 
myinterest numeric;
price numeric;
cusor interestcursor is select saleprice from orders
BEGIN:= 0.0;
open interestcursor;
loop
fetch interstcursor into price;
exit when interestcursor%notfound;
if pirce >= 30000 then
my interest:= my interest + prie * 0.1;
myinterest:= myinterest+price*0.05;
end if
end loop;
close interestcursor;
dbmos_output.put_line('전체이익금액 = ' ||myinterest);
END ;