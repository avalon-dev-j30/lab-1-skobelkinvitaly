create table UserInfo
(
user_info_id int not null primary key,
name varchar (30),
surname varchar (30)
);

insert into UserInfo (user_info_id, name, surname)
values (1, 'Ivan','Ivanov'),
       (2, 'Petr','Petrov'),
       (3, 'Sidor','Sidorov');

create table Roles
(
role_id int not null unique,
name varchar(30) not null primary key
);

insert into Roles (role_id, name)
values(1, 'Студент'),
      (2, 'Пенсионер'),
      (3, 'Автомеханик');

create table Users 
(
  user_id int not null unique,
  email varchar (50) not null primary key,
  password varchar (20) not null
);

alter table Users
add info int;
alter table Users 
add roles int;
alter table Users
add constraint fk_user_info foreign key (info)
                             references Roles (role_id);
alter table Users
add constraint fk_user_role foreign key (roles)
                            references UserInfo (user_info_id);

insert into Users (user_id, email, password)
values(1, 'ivanov@mail.ru','qwerty'),
      (2, 'petrov@yandex.ru','123456'),
      (3, 'sidorov@rambler.ru','abcdef');


create table Product
(
product_id int not null unique,
code varchar(4) not null primary key,
title varchar(30) not null,
initial_price double not null,
retail_value double not null
);

alter table Product
add supplier int;

alter table Product
add constraint fk_supplier foreign key (supplier)
                           references Supplier(supplier_id); 

insert into Product (product_id, code, title, initial_price, retail_value)
values (1, '1201','Винт М5х10 оцинк.',3.24,3.50),
       (2, '1202','Гайка М3 нерж.', 0.25, 0.40),
       (3, '1203','Шайба стопорная ф10', 0.78, 1.00);

create table Supplier
(
supplier_id int unique,
name varchar(30) not null primary key,
address varchar(100),
phone varchar(20) not null,
representative varchar(100) 
);

insert into Supplier(name,address,phone,representative)
values ('Bosch','Невский пр. д.54','(812)452-34-88','ИП Иванов И.И.'),
       ('ABB','Лиговский пр. д.114','(812)392-37-48','ООО "Немецкий крепёж'),
       ('HILTI','Просвещения пр. д.50','(812)652-07-33','АО "Сатурн');


create table Order2Product
(
orderNumber int,
product int
);


create table Orders
(
order_id int not null primary key,
created date not null
);

alter table Orders
add order_user int;

alter table Orders
add constraint fk_order_user foreign key (order_user)
                             references users(user_id);

insert into Orders (order_id, created)
values (1, '2019-05-08'),
       (2, '2019-04-28'),
       (3, '2019-03-08');

alter table Order2Product
add constraint uk_order_id foreign key (orderNumber)
                           references Orders(order_id);

alter table Order2Product
add constraint uk_product foreign key (product)
                          references Product(product_id);