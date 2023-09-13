use QuanLyBanHang;
Create table Oders(
oID int primary key,
cID int,
oDate timestamp default current_timestamp,
oTatalPrice float
);
create table Product(
pID int primary key,
pName varchar(50) not null,
pPice float
);
create table OrderDetail(
oID int,
pID int,
foreign key (oID) references Oders(oID),
foreign key (pID) references Product(pID)
);
alter table OrderDetail MODIFY oQTY int;