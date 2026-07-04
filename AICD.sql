-- ACID
-- atomicity
-- saving 199 debit  2.credit to netflix 199
-- pass                fail

-- consistency
-- before the transaction:
-- trade account : $500
-- murtual funds : $300
-- transaction : transfer $100 from trade account to murtual funds

-- after the transaction:
-- trade account : $400
-- murtual funds : $400
-- total : $ 800

-- isolation
-- person A is transferring $100.
-- person B is transferring $200.alter

-- durability
-- even if the database crashes immediately after when it comes back online the transaction your account balances