-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 05, 2024 lúc 09:39 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `task1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `user_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(177, 25, 15, 'Ghế Băng Tựa Gỗ Cao Su Tự nhiên MOHO VLINE 601', 1900000, 2, 'ghean4.jpg'),
(182, 34, 17, 'Hệ tủ bếp MOHO Kitchen Smart Narvik Nhiều Kích Thước', 8490000, 1, 'tub3.webp'),
(188, 34, 18, 'Hệ tủ bếp MOHO Kitchen Smart Narvik Nhiều Kích Thước', 8490000, 1, 'tub3.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(1, 'Bàn Ăn Gỗ', 'banan1.jpg', 1),
(2, 'Ghế', 'ghe1.jpg', 1),
(4, 'Giường Ngủ', 'giuongngu1.jpg', 1),
(6, 'Tủ Quần Áo', 'tuquanao1.webp', 1),
(16, 'Tủ đầu giường', 'tudaugiuong1.webp', 1),
(17, 'Tủ bếp', 'tubep1.webp', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(10, 'sản phẩm tốt', '2024-04-03 17:04:10', 1, 15, 32),
(11, 'Shop có thanh toán online ko', '2024-04-03 18:19:29', 1, 15, 30),
(12, 'Có freeship Hà Nội ko shop', '2024-04-03 18:19:56', 1, 15, 31),
(13, 'Hay quá', '2024-04-03 18:21:28', 1, 15, 29),
(14, 'Thiết kế đẹp', '2024-04-03 18:21:56', 1, 15, 34),
(15, 'Hàng mới', '2024-04-03 19:27:27', 1, 17, 34),
(16, 'giao nhanh', '2024-04-03 19:27:41', 1, 17, 32),
(17, 'giao nhanh', '2024-04-03 19:27:54', 1, 17, 31),
(18, 'Nhiều ưu đãi giá tốt', '2024-04-03 19:28:15', 1, 17, 30),
(19, 'ghế đẹp', '2024-04-03 19:28:34', 1, 17, 28),
(20, 'Thiết kế đẹp', '2024-04-03 19:29:25', 1, 17, 1),
(21, 'Thiết kế phù hợp ', '2024-04-03 19:30:03', 1, 17, 2),
(22, 'Bàn đẹp\r\n', '2024-04-03 23:06:24', 1, 18, 29);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(102, 52, 20, 1, 6000000),
(103, 53, 31, 1, 3490000),
(104, 53, 32, 1, 4900000),
(105, 54, 34, 2, 8490000),
(106, 55, 32, 1, 4900000),
(107, 56, 28, 1, 1290000),
(108, 56, 32, 1, 4900000),
(109, 57, 32, 1, 4900000),
(110, 58, 20, 3, 6000000),
(111, 58, 31, 1, 3490000),
(112, 58, 29, 1, 2000000),
(113, 58, 34, 1, 8490000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(52, 15, '2024-04-03 18:07:23', 6000000, 'HÀ NỘI', '0987654432', 'callll', 4),
(53, 15, '2024-04-03 18:32:35', 8390000, 'HÀ NỘI', '0987654432', 'call trước khi giao hàng', 2),
(54, 17, '2024-04-03 19:26:45', 16980000, 'việt nam', '0961839945', 'giao hàng buổi sáng', 1),
(55, 17, '2024-04-03 19:27:04', 4900000, 'việt nam', '0961839945', '', 3),
(56, 17, '2024-04-03 19:31:19', 6190000, 'việt nam', '0961839945', '', 2),
(57, 18, '2024-04-03 23:05:37', 4900000, 'vvn', '0961582265', '', 4),
(58, 18, '2024-04-04 21:39:22', 31980000, 'vvn', '0961582265', 'Giao buổi chiều ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 17, 'Hệ tủ bếp MOHO Kitchen Premium Ubeda Nhiều Kích Thước', 'tub2.webp', 100, 19816667, 11890000, '2023-11-18 08:22:03', 7, 'Chất liệu chính: \r\n- Cánh tủ: gỗ MFC phủ Melamine, dày 18mm, chuẩn CARB P2 (*)\r\n\r\n- Thân tủ: gỗ MFC phủ foil, dày 18mm, chuẩn CARB P2 (*)\r\n\r\n- Thân tủ chậu rửa: Picomat chống nước, dày 18mm.\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\n\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên', 'Giá đã bao gồm tủ gỗ và mặt đá kim sa.', 1),
(2, 17, 'Hệ tủ bếp MOHO Kitchen Premium Grenaa Nhiều Kích Thước', 'tub1.webp', 100, 19000000, 11890000, '2023-11-18 10:15:54', 5, 'Chất liệu chính: \r\n- Cánh tủ: gỗ MFC phủ Melamine, dày 18mm, chuẩn CARB P2 (*)\r\n\r\n- Thân tủ: gỗ MFC phủ foil, dày 18mm, chuẩn CARB P2 (*)\r\n\r\n- Thân tủ chậu rửa: Picomat chống nước, dày 18mm.\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\n\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên', 'Giá đã bao gồm tủ gỗ và mặt đá kim sa.', 1),
(6, 16, 'Tủ Đầu Giường Gỗ Mây Mắt Cáo MOHO FIJI 401', 'tudg3.webp', 50, 1500000, 1100000, '2023-11-20 22:23:49', 0, 'Chất liệu:\r\n\r\n- Thân tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*)\r\n\r\n- Ngăn kéo: Gỗ cao su và mây mắt cáo tự nhiên\r\n\r\n- Chân tủ: Gỗ cao su tự nhiên\r\n\r\n- Tay nắm: Nhôm mạ màu đồng\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước: Dài 50cm x Rộng 45cm x Cao 50.5cm', 1),
(14, 16, 'Tủ Đầu Giường Gỗ MOHO VIENNA 201', 'tudg2.jpg', 5, 1500000, 1200000, '2023-11-20 22:54:49', 0, 'Chất liệu: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước: Dài 48cm x Rộng 40cm x Cao 50cm', 1),
(15, 16, 'Tủ Đầu Giường Gỗ MOHO MALAGA 302', 'tudg1.jpg', 50, 2000000, 1500000, '2023-11-20 23:05:47', 0, 'Chất liệu: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước: Dài 48cm x Rộng 40cm x Cao 50cm', 1),
(16, 6, 'Tủ Quần Áo Gỗ Thanh Treo MOHO VIENNA Tay Nắm 201 4 Màu', 'tuqa3.webp', 100, 5000000, 3000000, '2023-11-20 23:09:13', 0, 'Chất liệu:\r\n\r\n- Cánh tủ + Thân tủ: Gỗ MFC phủ Melamine chuẩn CARB-P2 (*)\r\n- Lưng tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*)\r\n- Thanh treo: Hợp kim nhôm, chống gỉ sét\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước: Dài 50cm x Rộng 60cm x Cao 2m1', 1),
(17, 6, 'Set Tủ Quần Áo Gỗ MOHO VIENNA 201 3 Cánh Kệ Ngăn 4 Màu', 'tuqa2.jpg', 30, 12000000, 10500000, '2023-11-20 23:12:48', 0, 'Chất liệu:\r\n\r\n- Thân tủ: Gỗ MFC phủ Melamine chuẩn CARB-P2 (*)\r\n\r\n- Cửa tủ + Thân tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*)\r\n\r\n- Thanh treo: Hợp kim nhôm, chống gỉ sét\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước: Dài 150cm x Rộng 60cm x Cao 2m1', 1),
(18, 6, 'Tủ Quần Áo Gỗ 2 Cánh MOHO VIENNA 201 4 Màu', 'tuqa1.webp', 66, 7500000, 6020000, '2023-11-20 23:20:33', 0, 'Chất liệu:\r\n\r\nTủ quần áo VIENNA Tay Nắm:\r\n- Cánh tủ + Thân tủ: Gỗ công nghiệp MFC phủ Melamin chuẩn CARB-P2 (*)\r\n- Lưng tủ: Gỗ công nghiệp MDF phủ Melamin chuẩn CARB-P2 (*)\r\n- Thanh treo: Hợp kim nhôm, chống gỉ sét\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước: Dài 100cm x Rộng 60cm x Cao 2m1', 1),
(20, 4, 'Giường Ngủ Gỗ MOHO VLINE 601 Nhiều Kích Thước', 'giuong4.jpg', 55, 7990000, 6000000, '2023-11-20 23:31:04', 4, 'Chất liệu:\r\n\r\n- Thân giường: Gỗ tràm tự nhiên, Veneer gỗ sồi tự nhiên\r\n\r\n- Chân giường: Gỗ cao su tự nhiên\r\n\r\n- Thanh vạt/ Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước phủ bì: Dài 212cm x Rộng 136/156/176/196cm x Cao đến đầu giường 92cm', 1),
(21, 4, 'Giường Ngủ Gỗ Tràm MOHO MALAGA 302 Nhiều Kích Thước', 'giuong3.jpg', 20, 6000000, 4500000, '2023-11-23 09:54:06', 0, 'Chất liệu:\r\n\r\n- Thân giường: Gỗ tràm tự nhiên\r\n\r\n- Thanh vạt/ Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\n\r\nĐây là sản phẩm Clearance, không áp dụng bảo hành và bảo trì.', 'Kích thước:\r\n\r\n- Dài 200cm x Rộng 120cm/160cm/180cm\r\n\r\n- Cao đến đầu giường 77cm\r\n\r\nKhoảng trống đầu giường cao 17cm', 1),
(23, 4, 'Giường Ngủ Gỗ Tràm MOHO MALAGA 301 V2', 'giuong2.webp', 30, 9000000, 5490000, '2023-11-23 12:19:16', 0, 'Chất liệu:\r\n\r\n- Thân giường: Gỗ tràm tự nhiên\r\n\r\n- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước phủ bì:\r\n\r\n- Dài 206cm x Rộng 166/ 186cm (Phù hợp với nệm 160/180cm x 2m)\r\n\r\n- Cao đến đầu giường 95cm\r\n\r\nKhoảng trống đầu giường cao 17cm', 1),
(24, 4, 'Giường Ngủ Gỗ Tràm MOHO VLINE 601 Nhiều Kích Thước', 'giuong1.jpg', 20, 8000000, 4999000, '2023-11-23 12:20:16', 0, 'Chất liệu:\r\n\r\n- Thân giường: Gỗ tràm tự nhiên, Veneer gỗ tràm tự nhiên\r\n\r\n- Chân giường: Gỗ cao su tự nhiên\r\n\r\n- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'Kích thước phủ bì: Dài 212cm x Rộng 136/156/176/196cm x Cao đến đầu giường 92cm', 1),
(25, 2, 'Ghế Băng Tựa Gỗ Cao Su Tự nhiên MOHO VLINE 601', 'ghean4.jpg', 50, 2890000, 1900000, '2023-11-23 16:21:03', 4, 'Với sản phẩm MOHO Signature, khách hàng chỉ có thể kết hợp với bàn ăn V-line 601. Với sản phẩm cao thông thường, khách hàng có thể ngồi với bất kì loại bàn ăn nào MOHO hiện có.\r\n\r\nChất liệu: Gỗ cao su tự nhiên \r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'Kích thước:\r\n- MOHO Signature: Dài 118cm x Rộng 52,4cm Cao đến đệm ngồi/lưng tựa: 40cm/70cm\r\n\r\n- Cao thông thường: Dài 120cm x Rộng 55,4cm Cao đến đệm ngồi/lưng tựa: 44,5cm/80cm', 1),
(26, 2, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO FYN', 'ghean3.jpg', 30, 2000000, 1500000, '2023-11-23 16:23:55', 0, '                        Chất liệu: Gỗ cao su tự nhiên vải bọc chống thấm nước - chống nhăn, kháng bụi bẩn, nấm mốc\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt                    ', '                        Kích thước: Dài 45cm x Rộng 50cm x Cao đến đệm ngồi/lưng tựa: 46cm/79cm                    ', 1),
(27, 2, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO VLINE 601', 'ghean2.jpg', 30, 1900000, 1200000, '2023-11-23 20:31:17', 0, 'Với sản phẩm MOHO Signature, khách hàng chỉ có thể kết hợp với bàn ăn V-line 601. Với sản phẩm cao thông thường, khách hàng có thể ngồi với bất kì loại bàn ăn nào MOHO hiện có.\r\n\r\nChất liệu: \r\n\r\n- Gỗ cao su tự nhiên\r\n\r\n- Vải bọc polyester chống nhăn, kháng bụi bẩn, nấm mốc\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'Kích thước:\r\n\r\n- MOHO Signature: Dài 50cm x Rộng 56cm x Cao đến đệm ngồi/lưng tựa 37cm/70cm\r\n\r\n- Cao thông thường: Dài 50cm x Rộng 56cm x Cao đến đệm ngồi/lưng tựa 42cm/80cm', 1),
(28, 16, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO ODESSA', 'ghean1.jpg', 40, 1990000, 1290000, '2023-11-29 20:36:43', 6, '                                                Chất liệu: Gỗ cao su tự nhiên\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt                                        ', '                                                Kích thước: Dài 43cm x Rộng 51cm x Cao đến phần ngồi/lưng tựa 43cm/92cm                                        ', 1),
(29, 1, 'Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO VLINE 601 90cm', 'banan5.jpg', 30, 2000000, 2000000, '2023-12-02 20:54:53', 7, 'Chất liệu: Gỗ cao su tự nhiên\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'Kích thước: Dài 90cm x Rộng 75cm x Cao 65cm', 1),
(30, 1, 'Bàn Ăn Gỗ MOHO MILAN 901 Màu Gỗ', 'banan4.webp', 50, 3690000, 2990000, '2023-12-02 20:56:21', 7, 'Chất liệu: \r\n\r\n- Mặt bàn: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ sồi tự nhiên\r\n\r\n- Chân bàn: Gỗ cao su tự nhiên\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'Kích thước:\r\n\r\nDài 160cm x Rộng 85cm x Cao 74cm\r\n\r\nDài 125cm x Rộng 75cm x Cao 74cm', 1),
(31, 1, 'Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO VLINE 601 1m6', 'banan3.jpg', 50, 4590000, 3490000, '2023-12-02 20:59:06', 11, 'Chất liệu: Gỗ cao su tự nhiên\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'Kích thước: Dài 160cm x Rộng 75cm x Cao 65cm', 1),
(32, 1, 'Bàn Ăn Gỗ Cao Su MOHO OSLO 901', 'banan2.jpg', 50, 5000000, 4900000, '2023-12-02 21:00:48', 20, '- Mặt bàn: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ cao su tự nhiên\r\n\r\n- Chân bàn: Gỗ cao su tự nhiên\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\n\r\nChống thấm, cong vênh, trầy xước, mối mọt', '                        Kích thước: Dài 1m4 x Rộng 75cm x Cao 73cm                    ', 1),
(34, 17, 'Hệ tủ bếp MOHO Kitchen Smart Narvik Nhiều Kích Thước', 'tub3.webp', 25, 14150000, 8490000, '2024-04-03 15:22:09', 15, '                        Chất liệu chính: \r\n- Cánh tủ: gỗ MFC phủ Melamine, dày 18mm, chuẩn CARB P2 (*)\r\n\r\n- Thân tủ: gỗ MFC phủ foil, dày 18mm, chuẩn CARB P2 (*)\r\n\r\n- Thân tủ chậu rửa: Picomat chống nước, dày 18mm.\r\n\r\n(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\n\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên                    ', '             Giá đã bao gồm tủ gỗ và mặt đá kim sa.                               ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(15, 'uyen', '$2y$10$xrSvZRBj0wI.5z555nB9eeuo/oiMP7Wj5M.EKx6MVjrUMsA7X2ki2', 'Uyen', '04.jpg', 'uyennttph40927@gmail.com', '0987654432', 'HÀ NỘI', 1, 1),
(17, 'user1', '$2y$10$Q3Z3FxvDTRjLQL2wDv7IE.tKtCd7/9vsbSVYUCaYdcgGcKnoxI8iW', 'user1', 'user-default.png', 'hanoixx99@gmail.com', '0961839945', 'việt nam', 0, 1),
(18, 'hanoi', '$2y$10$t5kwYh38wdSbSmrkMmUJl./tkxqYwxncdLbdxFwPkOeWfz2jRflTC', 'hanoi', 'user-default.png', 'hanoixx99@gmail.com.vn', '0961582265', 'vvn', 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
