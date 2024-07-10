create database c_book_sys;

use c_book_sys;

create table customers
(
	id int primary key auto_increment,
    first_name varchar(45),
    last_name varchar(45) not null,
    email varchar(45) not null unique
);

insert into customers
(id, first_name, last_name, email)
values
(1, "Pulak", "Tandon", "xyz@gmail.com"),
(2, "Rohan","Khandelwal", "qwe@gmail.com"),
(3, "Shubham", "Agarwal", "poi@gmail.com"),
(4, "Divanshu", "Jaiswal", "mnb@gmail.com"),
(5, "Shashwat", "Pandey", "asd@gmail.com"),
(6, "Kinshuk", "Agarwal", "jhg@gmail.com"),
(7, "Amit", "Gupta", "lkj2gmail.com");

create table bookings
(
	id int auto_increment,
    screening_id int not null,
    customer_id int,
    primary key(id), 
    foreign key (customer_id) references customers(id),
    foreign key(screening_id) references screenings(id)
);

insert into bookings
(id, screening_id, customer_id )
values
(1, 214450, 987021),
(2, 213452, 897863),
(3, 321324, 839563),
(4, 876321, 323223),
(5, 982321, 234232),
(6, 341211, 876421),
(7, 238742, 543813);
	
create table reserved_seat
(
	id int auto_increment,
    booking_id int not null,
    seat_id int not null,
    primary key(id),
    foreign key (booking_id) references bookings(id),
    foreign key (seat_id) references seats(id)
);

insert into reserved_seat
(id, booking_id, seat_id)
values
(1, 987021, 13),
(2, 897863, 6),
(3, 839563, 15),
(4, 323223, 11),
(5, 234232, 4),
(6, 876421, 8),
(7, 543813, 5);

create table seats
(
	id int auto_increment,
    room_id int not null,
    number int not null,
    seat_row char(1) not null,
    primary key(id),
    foreign key (room_id) references rooms(room_id)
);

insert into seats
(id, room_id, number, seat_row)
values
(1, 987021, 13),
(2, 897863, 6),
(3, 839563, 15),
(4, 323223, 11),
(5, 234232, 4),
(6, 876421, 8),
(7, 543813, 5);

create table rooms
(
	id int primary key auto_increment, 
    name varchar(45) not null,
    no_seats int not null
);

insert into rooms
(id, name, no_seats)
values
(1, "Pulak Tandon", 15),
(2, "Rohan Khandelwal", 17),
(3, "Shubham Agarwal", 9),
(4, "Divanshu Jaiswal", 5),
(5, "Shashwat Pandey", 8),
(6, "Kinshuk Agarwal", 19),
(7, "Amit Gupta", 2);

create table screenings
(
	id int auto_increment,
    film_id int not null,
    room_id int not null,
    start_time date not null,
    primary key(id),
    foreign key (room_id) references rooms(id),
    foreign key (film_id) references films(id)
);

insert into screenings
(id, film_id, room_id, start_time)
values
(1, 254637, 968473, 2023-02-21),   
(2, 847262, 836476, 2023-03-23),
(3, 746352, 982625, 2023-01-03),
(4, 872572, 783625, 2023-01-17),
(5, 632936, 562464, 2023-02-13),
(6, 363527, 736242, 2023-02-29),
(7, 239172, 655243, 2023-03-31);

create table films
(
	id int auto_increment,
    name varchar(45) not null unique,
    length_min int not null,
    primary key(id)
);

insert into films
(id, name, length_min)
values
(1, 254637, 23),   
(2, 847262, 84),
(3, 746352, 67),
(4, 872572, 75),
(5, 632936, 99),
(6, 363527, 102),
(7, 239172, 132);

