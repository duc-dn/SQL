CREATE DATABASE QLBENHVIEN
USE QLBENHVIEN


CREATE TABLE BENHVIEN
(
MABV CHAR(10) PRIMARY KEY NOT NULL,
TENBV NVARCHAR(20) NOT NULL
)

CREATE TABLE KHOAKHAM
(
MAKHOA CHAR(10) PRIMARY KEY NOT NULL,
TENKHOA NVARCHAR(20) NOT NULL, 
SOBENHNHAN INT NOT NULL,
MABV CHAR(10) NOT NULL,
CONSTRAINT FK1 FOREIGN KEY(MABV) REFERENCES BENHVIEN(MABV)
)

CREATE TABLE BENHNHAN
(
MABN CHAR(10) NOT NULL PRIMARY KEY,
HOTEN NVARCHAR(20) NOT NULL,
NGAYSINH DATETIME NOT NULL, 
GIOITINH BIT NOT NULL,
SONGAYNV INT NOT NULL,
MAKHOA CHAR(10) NOT NULL,
CONSTRAINT FK2 FOREIGN KEY(MAKHOA) REFERENCES KHOAKHAM(MAKHOA)
)

INSERT INTO BENHVIEN VALUES
('BM', N'BẠCH MAI'),
('VD', N'VIỆT ĐỨC')

INSERT INTO KHOAKHAM VALUES
('HS', N'HỒI SỨC', 200, 'BM'),
('TM', N'TIM MẠCH', 140, 'VD')

INSERT INTO BENHNHAN VALUES
('BN7', N'NGUYỄN THỊ F', '2/22/2000', '1', 22, 'TM'),
('BN1', N'NGUYỄN VĂN A', '3/12/2001', '1', 21, 'HS'),
('BN2', N'NGUYỄN THỊ B', '3/11/1999', '0', 10, 'HS'),
('BN3', N'NGUYỄN VĂN C', '3/1/2010', '1', 29, 'TM'),
('BN4', N'NGUYỄN VĂN D', '3/10/2009', '1', 10, 'HS'),
('BN5', N'NGUYỄN THỊ E', '3/12/2006', '0', 21, 'TM'),
('BN6', N'NGUYỄN TẤN T', '2/22/2002', '0', 10, 'HS')


---------------------------------------------------
-- câu 2: Đưa ra những bệnh nhân có tuổi cao nhất gồm: MaBN, HoTen, Tuoi

SELECT MABN, HOTEN, (YEAR(GETDATE()) - YEAR(NGAYSINH)) AS 'TUỔI'
FROM BENHNHAN
WHERE YEAR(NGAYSINH) = (SELECT MIN(YEAR(NGAYSINH)) FROM BENHNHAN)

--------------------------------------------------------
-- CÂU 3: Viết hàm với tham số truyền vào là MaBN, hàm trả về một bảng gồm các thông
-- tin: MaBN, HoTen, NgaySinh, GioiTinh(là Nam hoặc Nữ), TenKhoa, TenBV

CREATE FUNCTION CAU3(@MABN CHAR(10))
RETURNS @DANHSACH TABLE(MABN CHAR(10), HOTEN NVARCHAR(20), GIOITINH NVARCHAR(10), TENKHOA NVARCHAR(20), TENBV NVARCHAR(20))
AS
BEGIN
	INSERT INTO @DANHSACH
	SELECT MABN, HOTEN, (CASE GIOITINH WHEN 0 THEN N'NAM' WHEN 1 THEN N'NỮ' END), TENKHOA, TENBV
	FROM BENHVIEN INNER JOIN KHOAKHAM ON BENHVIEN.MABV = KHOAKHAM.MABV
				  INNER JOIN BENHNHAN ON KHOAKHAM.MAKHOA = BENHNHAN.MAKHOA
	WHERE MABN = @MABN
	RETURN
END

SELECT * FROM CAU3('BN1')

----------------------------------------------------
-- Câu 4: Tạo một proc xóa một khoa bất kỳ với MaKhoa nhập từ bàn phím, nếu khoa
-- chưa tồn tại thì đưa ra thông báo
CREATE PROC SP_XOA_KHOA(@MAKHOA CHAR(10))
AS
BEGIN
	IF(NOT EXISTS(SELECT * FROM KHOAKHAM WHERE MAKHOA = @MAKHOA))
		PRINT(@MAKHOA + 'CHUA TON TAI')
	ELSE
		DELETE FROM KHOAKHAM WHERE MAKHOA = @MAKHOA
END

SELECT * FROM KHOAKHAM
EXEC SP_XOA_KHOA 'KT'
----------------------------------------------------
-- CÂU 5: Hãy tạo Trigger để tự động tăng số bệnh nhân trong bảng KhoaKham, mỗi khi thêm mới dữ liệu cho 
-- BenhNhan, Nếu số bệnh nhân trong 1 khoa khám > 100 thì không cho thêm và đưa ra cảnh báo



