create table sorttype
    (sorttype_name      varchar(15),
    primary key (sorttype_name)
    );

create table item
    (item_id        varchar(10),
     item_name      varchar(15),
     price      numeric(5,0),
     sorttype_name      varchar(15),
     stock      numeric(4,0),
     primary key (item_id),
     foreign key (sorttype_name) references sorttype (sorttype_name)
    );
create table customer
    (customer_id    varchar(10), 
     customer_name  varchar(20), 
     customer_phone varchar(20), 
     customer_address varchar(20),
     primary key (customer_id)
    );

create table basket
    (basket_id      varchar(10),
    customer_id varchar(10),
     primary key (basket_id),
     foreign key (customer_id) references customer (customer_id)
    );

create table buy
    (   buy_id  varchar(10), 
        basket_id   varchar(10),
     buy_date varchar(15), 
     point_use numeric(5,0),
     primary key (buy_id),
    foreign key (basket_id) references basket (basket_id)
    );

create table refund
    (refund_id      varchar(5), 
     buy_id         varchar(10), 
     primary key (refund_id, buy_id),
     foreign key (buy_id) references buy (buy_id)
        on delete set null
    );


create table review
    (review_id varchar(10),
    buy_id  varchar(10),
    item_id     varchar(10),
     customer_id    varchar(10), 

     rate numeric(1,0),
     review_text varchar(50),
     primary key (review_id),
     foreign key (item_id) references item (item_id),
     foreign key (customer_id) references customer (customer_id),
     foreign key (buy_id) references buy (buy_id)
    );

create table item_in_basket
    (item_id        varchar(10) NULL,
     basket_id      varchar(10),
     item_amount numeric(3,0),
     primary key (basket_id, item_id),
     foreign key (basket_id) references basket (basket_id),
     foreign key (item_id) references item (item_id)
    );
    
create table customer_basket
    (basket_id      varchar(10),
     customer_id    varchar(10), 
     buy_id varchar(10), 
     primary key (basket_id, customer_id, buy_id),
     foreign key (customer_id) references customer (customer_id),
     foreign key (buy_id) references buy (buy_id)
    );
