CREATE DATABASE NCC
GO
USE NCC  
GO

-- TAO BANG
CREATE TABLE NHACUNGCAP
(
    MaNhaCC nvarchar(8) not null primary key,
    TenNhaCC nvarchar(50) not null,
    DiaChi nvarchar(30) not null,
    SoDT varchar(15) null,
    MaSoThue nvarchar(15) not null
)
GO 

CREATE TABLE LOAIDICHVU
(
    MaLoaiDV nvarchar(6) not null primary key,
    TenLoaiDV nvarchar(50) not null
)
GO 

CREATE TABLE MUCPHI
(
    MaMP nvarchar(5) not null primary key,
    DonGia nvarchar(7) not null,
    MoTa nvarchar(30) null
)
GO

CREATE TABLE DONGXE
(
    DongXe nvarchar(15) not null primary key,
    HangXe nvarchar(10) not null,
    SoChoNgoi int not null
)
GO

CREATE TABLE DANGKYCUNGCAP
(
    MaDKCC nvarchar(7) not null primary key,
    MaNhaCC nvarchar(8) not null,
    MaLoaiDV nvarchar(6) not null,
    DongXe nvarchar(15) not null,
    MaMP nvarchar(5) not null,
    NgayBatDauCungCap datetime not null,
    SoLuongXeDangKy int null
)
GO

-- TAO KHOA NGOAI
ALTER TABLE DANGKYCUNGCAP ADD NgayKetThucCungCap DATETIME NOT NULL
GO

ALTER TABLE DANGKYCUNGCAP
ADD CONSTRAINT FK_MaNhaCC FOREIGN KEY (MaNhaCC) REFERENCES NHACUNGCAP (MaNhaCC)
GO

ALTER TABLE DANGKYCUNGCAP
ADD CONSTRAINT FK_MaLoaiDV FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV)
GO 

ALTER TABLE DANGKYCUNGCAP
ADD CONSTRAINT FK_DongXe FOREIGN KEY (DongXe) REFERENCES DONGXE(DongXe)
GO 

ALTER TABLE DANGKYCUNGCAP
ADD CONSTRAINT FK_MaMP FOREIGN KEY (MaMP) REFERENCES MUCPHI(MaMP)
GO 

-- INERT DU LIEU VAO CAC BANG
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC001', N'Cty TNHH Toàn Phát', 'Hai Chau', '051133999888', '568941')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC002', N'Cty Cổ Phần Đông Du', 'Lien Chieu', '051133999889', '456789')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC003', N'Ông Nguyễn Văn A', 'Hoa Thuan', '051133999890', '321456')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC004', N'Cty Cổ Phần Toàn Cầu Xanh', 'Hai Chau', '05113658945', '513364')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC005', N'Cty TNHH AMA', 'Thanh Khe', '051103875466', '546546')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC006', N'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469', '524545')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC007', N'Cty TNHH Phan Thành', 'Thanh Khe', '05113987456', '113021')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC008', N'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456', '121230')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC009', N'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987121', '533654')
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC010', N'Cty Cổ Phần Rạng đông', 'Lien Chieu', '05113569654', '187864')
 
 
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV) Values ('DV01', N'Dịch vụ xe taxi')
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV) Values ('DV02', N'Dịch vụ xe buýt công cộng theo tuyến cố định')
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV) Values ('DV03', N'Dịch vụ cho thuê xe theo hợp đồng')
 
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP01', '10000', N'Áp dụng từ ngày 1/2015')
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP02', '15000', N'Áp dụng từ ngày 2/2015')
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP03', '20000', N'Áp dụng từ ngày 1/2010')
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP04', '25000', N'Áp dụng từ ngày 2/2011')
 
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Hiace', 'Toyota', 16)
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Vios', 'Toyota', 5)
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Escape', 'Ford', 5)
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Cerato', 'KIA', 7)
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Forte', 'KIA', 5)
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Starex', 'Huyndai', 7)
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Grand-i10', 'Huyndai', 7)
 
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015/11/20', '2016/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015/11/20', '2017/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017/11/20', '2018/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015/11/20', '2019/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019/11/20', '2020/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016/11/10', '2021/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015/11/30', '2016/01/25')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016/02/28', '2016/08/15')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016/04/27', '2017/04/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2016/11/21', '2016/02/22')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016/12/25', '2017/02/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016/04/14', '2017/12/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015/12/21', '2016/12/21')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016/05/20', '2016/12/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018/04/24', '2019/11/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016/06/22', '2016/12/21')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016/09/30', '2019/09/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK018', 'NCC008', 'DV03', 'Espace', 'MP04', '2017/12/13', '2018/09/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK019', 'NCC003', 'DV03', 'Espace', 'MP03', '2016/01/24', '2016/12/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016/05/03', '2017/10/21')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015/01/30', '2016/12/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016/07/25', '2017/12/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017/11/30', '2018/05/20')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017/12/23', '2019/11/30')
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016/08/24', '2017/10/25')

-- DU LIEU CUA CAC BANG SAU KHI CHEN
SELECT * FROM NHACUNGCAP
SELECT * FROM DANGKYCUNGCAP
SELECT * FROM MUCPHI
SELECT * FROM DONGXE
SELECT * FROM LOAIDICHVU


--------------------------------------------------------------------------------
-- CÂU 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
SELECT * FROM DONGXE WHERE SoChoNgoi > 5

-- CÂU 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
-- thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
-- thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
SELECT NCC.MaNhaCC, NCC.TenNhaCC, NCC.DiaChi
FROM NHACUNGCAP AS NCC 
	 JOIN DANGKYCUNGCAP AS DKCC ON NCC.MaNhaCC = DKCC.MaNhaCC
	 JOIN DONGXE AS DX ON DKCC.DongXe = DX.DongXe
	 JOIN MUCPHI AS MP ON DKCC.MaMP = MP.MaMP
WHERE (DX.HangXe = 'Toyota' AND MP.DonGia = 15000) 
OR (DX.HangXe = 'KIA' AND MP.DonGia = 20000)

-- CÂU 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
-- cấp và giảm dần theo mã số thuế
SELECT * FROM NHACUNGCAP 
ORDER BY TenNhaCC ASC, MaSoThue DESC


-- CÂU 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”
SELECT NCC.MaNhaCC, NCC.TenNhaCC, COUNT(NCC.MaNhaCC) AS "SO LAN DKCCPT"
FROM NHACUNGCAP AS NCC JOIN DANGKYCUNGCAP AS DKCC
	 ON NCC.MaNhaCC = DKCC.MaNhaCC
WHERE DKCC.NgayBatDauCungCap = '11/20/2015'
GROUP BY NCC.MaNhaCC, NCC.TenNhaCC


-- CÂU 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
-- chỉ được liệt kê một lần
SELECT HangXe FROM DONGXE
GROUP BY HangXe

-- CÂU 8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
-- HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
-- tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
-- tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra
SELECT DK.MaDKCC, NCC.MaNhaCC, NCC.TenNhaCC, NCC.DiaChi, NCC.MaSoThue, LDV.MaLoaiDV, 
MP.DonGia, DX.HangXe, DK.NgayBatDauCungCap, DK.NgayKetThucCungCap
FROM DANGKYCUNGCAP AS DK INNER JOIN NHACUNGCAP AS NCC ON DK.MaNhaCC = NCC.MaNhaCC
	 JOIN LOAIDICHVU AS LDV ON DK.MaLoaiDV = LDV.MaLoaiDV
	 JOIN DONGXE AS DX ON DK.DongXe = DX.DongXe
	 JOIN MUCPHI AS MP ON MP.MaMP = DK.MaMP

 


-- CÂU 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
-- thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”
-- CÁCH 1:
SELECT NCC.MaNhaCC, NCC.TenNhaCC, NCC.SoDT
FROM DANGKYCUNGCAP AS DKCC INNER JOIN DONGXE AS DX ON DKCC.DongXe = DX.DongXe
	 JOIN NHACUNGCAP AS NCC ON DKCC.MaNhaCC = NCC.MaNhaCC
WHERE DX.DongXe = 'Hiace' OR DX.DongXe = 'Cerato'
GROUP BY NCC.MaNhaCC, NCC.TenNhaCC, NCC.SoDT

-- CÁCH 2
SELECT *
FROM NHACUNGCAP NCC 
WHERE NCC.MaNhaCC in (
SELECT DK.MaNhaCC
FROM DANGKYCUNGCAP DK
WHERE DK.DongXe = 'Hiace' or DK.DongXe = 'Cerato')

-- CÂU 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
-- phương tiện lần nào cả
SELECT * 
FROM NHACUNGCAP AS NCC
WHERE NCC.MaNhaCC NOT IN (
	SELECT DK.MaNhaCC FROM DANGKYCUNGCAP AS DK
)