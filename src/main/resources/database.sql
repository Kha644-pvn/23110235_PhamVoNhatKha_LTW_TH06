-- Tạo database
CREATE DATABASE GraphQLShop;
GO
USE GraphQLShop;
GO

-- Bảng Users
CREATE TABLE Users (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    fullname NVARCHAR(100),
    email NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(100),
    phone NVARCHAR(20)
);
GO

-- Bảng Categories
CREATE TABLE Categories (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    images NVARCHAR(255)
);
GO

-- Bảng Products
CREATE TABLE Products (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(200),
    quantity INT,
    description NVARCHAR(MAX),
    price FLOAT,
    user_id BIGINT,
    category_id BIGINT,
    CONSTRAINT FK_Products_Users FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE SET NULL,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE SET NULL
);
GO

-- Bảng trung gian User-Categories (ManyToMany)
CREATE TABLE user_categories (
    user_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, category_id),
    CONSTRAINT FK_UserCategories_Users FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    CONSTRAINT FK_UserCategories_Categories FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE
);
GO
INSERT INTO Users (fullname, email, password, phone)
VALUES 
(N'Phạm Võ Nhất Kha', 'kha@gmail.com', '123456', '0123456789'),
(N'Nguyễn Văn A', 'a@gmail.com', '123456', '0987654321'),
(N'Lê Thị B', 'b@gmail.com', '123456', '0909123456');


INSERT INTO Categories (name, images)
VALUES
(N'Điện thoại', 'phone.jpg'),
(N'Laptop', 'laptop.jpg'),
(N'Phụ kiện', 'accessories.jpg');

INSERT INTO Products (title, quantity, description, price, user_id, category_id)
VALUES
(N'iPhone 15 Pro', 10, N'Điện thoại cao cấp Apple', 29990000, 1, 1),
(N'Samsung Galaxy S24', 15, N'Flagship mới nhất của Samsung', 24990000, 2, 1),
(N'Macbook Air M3', 8, N'Laptop siêu nhẹ, pin trâu', 32990000, 1, 2),
(N'Dell XPS 13', 5, N'Ultrabook cao cấp, màn hình đẹp', 28990000, 2, 2),
(N'Tai nghe Bluetooth', 50, N'Phụ kiện không dây tiện lợi', 599000, 3, 3),
(N'Chuột Logitech M331', 40, N'Chuột không dây chính hãng', 399000, 3, 3);

INSERT INTO user_categories (user_id, category_id)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 3);

