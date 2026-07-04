use company;
create table accounts(
account_id int primary key,
account_holder varchar(100),
balance decimal(10,2)
);

insert into accounts(account_id,account_holder,balance)
values
(1,'alice',5000.00);

select *from accounts;

start transaction;

update accounts set balance=balance-1000 where account_id=1;

## successfully all transaction is completed
commit;

## some error or wrong to delete the data so run the rollback
rollback;