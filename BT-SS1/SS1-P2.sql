create database quanlymonhoc;
use quanlymonhoc;
create table monhoc(
    monhoc_mamon varchar(50) primary key,
    monhooc_name varchar(100) not null unique,
    monhoc_number int not null
);