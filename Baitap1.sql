create database demo_2;
use demo_2;
-- 1. Tạo bảng Product gồm các thông tin sau:
    -- Product_Id - mã sản phẩm - char(5) - khóa chính
    -- Product_Name - tên sản phẩm - varchar(100) - not null - unique
    -- Price - float - có giá trị >0
    -- Descriptions - text - not null
    -- Product_status - bit - mặc định là 1
Create table Product(
product_id char(5) primary key,
product_Name varchar(100) not null unique,
price float check(Price>0),
descriptions text not null,
product_status bit(1)
);
-- 2. Tạo bảng Order - hóa đơn gồm các thông tin sau
    -- Order_id - Mã hóa đơn - int - tự tăng
    -- Created - Ngày tạo - date - mặc định là ngày hiện tại
    -- Total_amount - float
    -- Order_Status: bit mặc định là 
create table Orders(
order_id int primary key auto_increment,
date_cur TIMESTAMP default CURRENT_TIMESTAMP,
total_amount float,
order_Status bit(1)
);
-- 3. Tạo bảng Order-Detail - Hóa đơn chi tiết gồm các thông tin sau:
    -- Order_id - Mã hóa đơn - khóa ngoại của bảng Order
    -- Product_id - mã sản phẩm - khóa ngoại của bảng product
    -- (Order_id,Product_id) xác định khóa chính của bảng Order_Detail
    -- Price - Giá sản phẩm lúc mua - float
    -- Quantity - Số lượng sản phẩm mua - int
    -- Amount - Thành tiền - tính tự động bằng công thức: price * quantity
create table Order_Detail(
order_id int,
product_id char(5),
price float,
quantity int,
amount float as (price * quantity ),
foreign key(order_id) references Orders(order_id),
foreign key (product_id) references Product(product_id)

);
RENAME database demo_2 TO baitap_1;