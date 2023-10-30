use master
go

create database news1
go
drop database news1
go
use news1
go

CREATE TABLE NguoiDung (
    UserID varchar(10) not null primary key,
    vaitro varchar(10) NOT NULL,
    hovaten nvarchar(50) NOT NULL,
    CONSTRAINT UQ_hovaten UNIQUE (hovaten)  -- Add a unique constraint to hovaten
);
-- Create the 'dangnhap' table
CREATE TABLE KhachHang (
	
    username varchar(50) Not null,
    password varchar(50) NOT NULL,
    hovaten nvarchar(50) NOT NULL,
    
);
-- Thêm cột CustomerID với tính năng tự tăng kiểu int
ALTER TABLE KhachHang
ADD CustomerID int IDENTITY(1,1) PRIMARY KEY;

CREATE TABLE ADMIN (
	AdminID varchar(10) primary key,
    username varchar(50) not null,
    password varchar(50) NOT NULL,
    vaitro varchar(10) NOT NULL,
    hovaten nvarchar(50) NOT NULL,
   
);
-- Create the 'baiviet' table
CREATE TABLE baiviet (
    id int PRIMARY KEY,
    tenbaiviet nvarchar(max) NOT NULL,
    tentacgia nvarchar(50) NOT NULL,
    ngaydang smalldatetime NOT NULL,
    luotthich int,
    linkbaiviet nvarchar(256) NOT NULL,
    linkfolderhinhanh nvarchar(256) NOT NULL,
    CONSTRAINT FK_baiviet_dangnhap FOREIGN KEY (tentacgia) REFERENCES NguoiDung(hovaten),
    
);

use news1
go

-- Create a foreign key in KhachHang table referencing NguoiDung's UserID
ALTER TABLE KhachHang
ADD CONSTRAINT FK_KhachHang_NguoiDung
FOREIGN KEY (CustomerID)
REFERENCES NguoiDung(UserID);

-- Create a foreign key in ADMIN table referencing NguoiDung's UserID
ALTER TABLE ADMIN
ADD CONSTRAINT FK_ADMIN_NguoiDung
FOREIGN KEY (AdminID)
REFERENCES NguoiDung(UserID);

use master
go

drop database news1
go
drop table NguoiDung
go
INSERT INTO NguoiDung (UserID, vaitro, hovaten)
VALUES
('user666', 'Admin', N'Albert AnhDung'),
   ('user1', 'User', N'Nguyễn Văn A'),
   ('user2', 'User', N'Trần Thị B'),
   ('user3', 'User', N'Phạm Văn C'),
   ('user4', 'User', N'Lê Thị D'),
   ('user5', 'User', N'Huỳnh Văn E');


-- Thêm bản ghi mới mà không cần cung cấp giá trị cho CustomerID
INSERT INTO KhachHang (username, password, hovaten)
VALUES ('dungg', '712003', N'Albert AnhDung'),
	   ('khoi', '2003', N'Luong Nguyen Khoi');


INSERT INTO KhachHang (username, password, hovaten)
VALUES ('dungdz', 'dung', N'Nguyen Tien Dung');
	   
   select * from KhachHang