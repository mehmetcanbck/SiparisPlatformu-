USE SiparisPlatformu;
GO

-- 4. YEMEKLER TABLOSU
-- Yemeklerin restoran ve kategori ile ilişkisini tutar (Foreign Key içerir).
CREATE TABLE Yemekler (
    YemekID INT PRIMARY KEY IDENTITY(1,1),
    RestoranID INT NOT NULL,
    KategoriID INT NOT NULL,
    YemekAdi VARCHAR(100) NOT NULL,
    Fiyat DECIMAL(10,2) NOT NULL,
    Aciklama VARCHAR(255),
    AktifMi BIT DEFAULT 1,
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID),
    FOREIGN KEY (KategoriID) REFERENCES Kategoriler(KategoriID)
);

-- 5. SİPARİŞLER TABLOSU
-- Hangi kullanıcının hangi restorandan ne zaman sipariş verdiğini tutar.
CREATE TABLE Siparisler (
    SiparisID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT NOT NULL,
    RestoranID INT NOT NULL,
    SiparisTarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    ToplamTutar DECIMAL(10,2) NOT NULL,
    SiparisDurumu VARCHAR(50) DEFAULT 'Hazırlanıyor', -- Örn: Bekliyor, Hazırlanıyor, Yolda, Teslim Edildi, İptal
    TeslimatAdresi VARCHAR(255) NOT NULL,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);

-- 6. SİPARİŞ DETAYLARI TABLOSU
-- Bir siparişin içinde hangi yemekten kaç adet olduğunu tutar.
-- Siparişler ve Yemekler tabloları arasındaki "Çoka-Çok" (Many-to-Many) ilişkiyi çözer.
CREATE TABLE SiparisDetaylari (
    SiparisDetayID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    YemekID INT NOT NULL,
    Adet INT NOT NULL,
    BirimFiyat DECIMAL(10,2) NOT NULL, -- Sipariş verildiği andaki fiyatın kaydedilmesi önemlidir (fiyat sonradan değişse bile siparişteki fiyat sabit kalmalı)
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
    FOREIGN KEY (YemekID) REFERENCES Yemekler(YemekID)
);
