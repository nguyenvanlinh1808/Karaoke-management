use master;
go
if exists (Select * from sysdatabases where name like 'KaraokeMangement')
begin
	drop database KaraokeMangement
end
create database KaraokeMangement;
go
use KaraokeMangement;
go

create table ChucVu (
	MaCV varchar(10) primary key,
	TenCV nvarchar(50) NOT NULL,
)

create table NhanVien (
	MaNV varchar(10) primary key,
	TenDN varchar(50) NOT NULL,
	MatKhau varchar(50) NOT NULL,
	HoTen nvarchar(200) NOT NULL,
	GioiTinh nvarchar(20) NOT NULL,
	NgaySinh datetime NOT NULL,
	DiaChi nvarchar(200),
	DienThoai varchar(15),
	MaCV varchar(10) foreign key references ChucVu,
	MucLuong money NOT NULL,
	CaLV int NOT NULL,
	MoTa nvarchar(1000) default '',
)

create table NhaCungCap (
	MaNCC varchar(10) primary key,
	TenNCC nvarchar(500) NOT NULL,
	SoDT varchar(20) NOT NULL,
	DiaChi nvarchar(1000) NOT NULL,	
	MoTa nvarchar(1000) default '',
)

create table LoaiSP (
	MaLSP varchar(10) primary key ,
	TenLSP nvarchar(100) NOT NULL,
	MoTa nvarchar(1000) default '',
)

create table DonViTinh (
	MaDVT varchar(10) primary key,
	TenDVT nvarchar(100) NOT NULL,
	MoTa nvarchar(1000) default '',
)

create table SanPham (
	MaSP varchar(10) primary key,
	MaLSP varchar(10) foreign key references LoaiSP,
	MaDVT varchar(10) foreign key references DonViTinh,
	TenSP nvarchar(100) NOT NULL,
	MoTa nvarchar(1000) default '',
	GiaMua money default '0',
	GiaBan money NULL default '0',
	TongSP int default 0,
	NgaySX datetime NULL,
	HanSD datetime NULL,
	SoLuongKho int default 0,
	SoLuongQuay int default 0,		
)

create table HoaDon (
	MaHD varchar(10) primary key,
	MaNV varchar(10) foreign key references NhanVien,
	TongTien money default '0',
	ThoiDiemLap datetime default getdate(),
	TinhTrang int default 0, --0: Chua co khach, 1: Co khach nhung chua thanh toan, 2: Da thanh toan
	MoTa nvarchar(1000) default '',
)

create table HoaDonCT (
	MaHDCT int identity(1,1) primary key,
	MaHD varchar(10) foreign key references HoaDon,
	MaSP varchar(10) foreign key references SanPham,	
	SoLuongMua int default 0,	
	MoTa nvarchar(1000) default '',
)

create table KiemKe (
	MaKK varchar(10) primary key,
	MaNV varchar(10) foreign key references NhanVien,
	ThoiDiemLap datetime default getdate(),
	TinhTrang int default 0,
	MoTa nvarchar(1000) default '',
)

create table KiemKeCT (
	MaKKCT int identity(1,1) primary key,
	MaKK varchar(10) foreign key references KiemKe,
	MaSP varchar(10) foreign key references SanPham,
	SoLuongTon int default 0,
	TinhTrang int default 0,
	MoTa nvarchar(1000) default '',
)

create table PhieuNhap (
	MaPN varchar(10) primary key,
	MaNV varchar(10) foreign key references NhanVien,
	TongTien money default '0',
	ThoiDiemLap datetime default getdate(),
	TinhTrang int default 0,
	MoTa nvarchar(1000) default '',
)

create table PhieuNhapCT (
	MaPNCT int identity(1,1) primary key,
	MaPN varchar(10) foreign key references PhieuNhap,
	MaNCC varchar(10) foreign key references NhaCungCap,
	MaSP varchar(10) foreign key references SanPham,
	SoLuongNhap int default 0,
	MoTa nvarchar(1000) default '',
)

create table ThongTinCH (
	MaTTCH varchar(10) primary key,
	TenCH nvarchar(1000) default '',
	ThongTin nvarchar(1000) default '',
	LuuY nvarchar(1000) default '',
	LienHe nvarchar(1000) default '',
)

create table LoaiTin (
	MaLT varchar(10) primary key,
	TenLT nvarchar(500) NOT NULL,
	MoTa nvarchar(1000) default '',
)

create table TinTuc (
	MaTT varchar(10) primary key,
	MaLT varchar(10) foreign key references LoaiTin,
	TieuDe nvarchar(500) default '',
	TacGia nvarchar(100) default '',
	NoiDung nvarchar(1000) default '',
	NgayDang datetime default getdate(),
	MoTa nvarchar(1000) default '',
)