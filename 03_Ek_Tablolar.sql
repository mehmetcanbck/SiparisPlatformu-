USE SiparisPlatformu;
GO

-- 7. KURYELER TABLOSU
-- Sistemde çalışan kuryelerin bilgilerini tutar.
CREATE TABLE Kuryeler (
    KuryeID INT PRIMARY KEY IDENTITY(1,1),
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Telefon VARCHAR(15) NOT NULL,
    AracPlakasi VARCHAR(20),
    AktifMi BIT DEFAULT 1
);

-- 8. TESLİMATLAR TABLOSU
-- Hangi siparişi hangi kuryenin taşıdığını ve teslimat durumunu tutar.
CREATE TABLE Teslimatlar (
    TeslimatID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL UNIQUE, -- Bir siparişin sadece bir teslimat kaydı olur
    KuryeID INT NOT NULL,
    YolaCikisZamani DATETIME,
    TeslimEdilmeZamani DATETIME,
    TeslimatDurumu VARCHAR(50) DEFAULT 'Kuryeye Verildi', -- Örn: Kuryeye Verildi, Yolda, Teslim Edildi
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
    FOREIGN KEY (KuryeID) REFERENCES Kuryeler(KuryeID)
);

-- 9. ÖDEMELER TABLOSU
-- Siparişlerin ödeme detaylarını tutar.
CREATE TABLE Odemeler (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL UNIQUE, -- Bir siparişin tek bir genel ödeme kaydı olur
    OdemeYontemi VARCHAR(50) NOT NULL, -- Örn: Kredi Kartı, Nakit, Yemek Kartı
    OdemeTarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    Tutar DECIMAL(10,2) NOT NULL,
    OdemeDurumu VARCHAR(50) DEFAULT 'Tamamlandı', -- Örn: Bekliyor, Tamamlandı, İptal Edildi
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);

-- 10. DEĞERLENDİRMELER (YORUMLAR) TABLOSU
-- Kullanıcıların sipariş verdikten sonra restoranlara yaptıkları puanlama ve yorumları tutar.
CREATE TABLE Degerlendirmeler (
    DegerlendirmeID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT NOT NULL,
    RestoranID INT NOT NULL,
    SiparisID INT NOT NULL UNIQUE, -- Bir siparişe sadece bir kere yorum yapılabilir
    Puan INT CHECK (Puan >= 1 AND Puan <= 5), -- Kısıtlama (Constraint): Puan 1 ile 5 arasında olmalı
    Yorum VARCHAR(500),
    DegerlendirmeTarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID),
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);
