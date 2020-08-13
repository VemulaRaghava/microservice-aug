
CREATE TABLE customer (
  customer_id integer NOT NULL,
  customer_name varchar(10) NOT NULL,
  password varchar(20) DEFAULT NULL,
  last_login date DEFAULT NULL,
  mobile_no varchar(15) DEFAULT NULL,
  email_id varchar(50) NOT NULL,   
  CONSTRAINT pk_custid PRIMARY KEY (customer_id)  
);
      
CREATE TABLE investment
(
  investment_id integer NOT NULL,
  investment_type varchar(20) NOT NULL,
  investment_name varchar(20),
  rate_of_interest double precision NOT NULL,
  investment_amount double precision,
  investment_period integer,
  customer_id integer NOT NULL,
  CONSTRAINT pk_investment_id PRIMARY KEY (investment_id), 
  CONSTRAINT customer_customerid_fkey FOREIGN KEY (customer_id)
  REFERENCES customer (customer_id)    
);

    
CREATE TABLE investment_transaction
(
    sno numeric(16) NOT NULL,
    scheme_name varchar(100),
    folio_no numeric(16),
    quantity numeric(10),
    avg_cost numeric(10, 2),
    cost_of_current_holding numeric(10, 2),
    nav numeric(10, 2),
    current_value numeric(10, 2),
    unrealised_loss_gain numeric(10, 2),
    unrealised_loss_gain_percent numeric(5, 2),
    value_date date,
    PRIMARY KEY (sno)
);

INSERT INTO customer (customer_id, customer_name, password, last_login, mobile_no, email_id) VALUES
(556677,	'Raja',	'capg123',	NULL,	NULL, 'a@a.com');

INSERT INTO customer (customer_id, customer_name, password, last_login, mobile_no, email_id) VALUES
(556678, 'Mahesh', 'capg123',	NULL,	NULL, 'b@b.com');

INSERT INTO investment (investment_id, investment_type, investment_name, rate_of_interest, investment_amount, investment_period, customer_id) VALUES
(2000,	'FD',	'Fixed Deposite', 7.45,	5000, 1,	556677);

INSERT INTO investment (investment_id, investment_type, investment_name, rate_of_interest, investment_amount, investment_period, customer_id) VALUES
(2001,	'Recurring Deposit', 'Term Deposit', 8.00,	10000,	2,	556677);

INSERT INTO investment (investment_id, investment_type, investment_name, rate_of_interest, investment_amount, investment_period, customer_id) VALUES
(2002,	'Recurring Deposit', 'Term Deposit', 8.00,	10000,	2,	556678);

INSERT INTO investment_transaction ( scheme_name, cost_of_current_holding, sno, unrealised_loss_gain, avg_cost, nav, folio_no, current_value, unrealised_loss_gain_percent, quantity) VALUES ( 'Mutual Fund', '123234', '1', '45678.56', '15.23', '120', '2000', '45678.56', '13', '1500');	
UPDATE investment_transaction SET value_date = '2017-02-02' WHERE sno = 1;	