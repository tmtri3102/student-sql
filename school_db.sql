use school_db;
create table HocSinh(
                        MaHS varchar(20) primary key,
                        TenHS varchar(50) not null,
                        NgaySinh datetime,
                        Lop varchar(20),
                        GT varchar(20)
);
create table GiaoVien(
                         MaGV varchar(20) primary key,
                         TenGV varchar(50),
                         SDT varchar(10)
);
create table MonHoc(
                       MaMH varchar(20) primary key,
                       TenMH varchar(50),
                       MaGV varchar(20),
                       foreign key (MaGV) references GiaoVien(MaGV)
);


create table BangDiem(
                         MaHS varchar(20),
                         MaMH varchar(50),
                         MaGV varchar(20),
                         primary key (MaHS, MaMH),
                         foreign key (MaHS) references HocSinh(MaHS),
                         foreign key (MaMH) references MonHoc(MaMH)
);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);
alter table BangDiem add NgayKT datetime;


