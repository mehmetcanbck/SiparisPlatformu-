USE SiparisPlatformu;
GO

-- !!! DİKKAT: KAYIT EKLEME (INSERT) İŞLEMİNDE SIRALAMA ÇOK ÖNEMLİDİR !!!
-- Önce başka tablolara bağımlılığı olmayan (Foreign Key içermeyen) ana tablolar doldurulmalıdır.

-- 1. KATEGORİLER (Bağımsız tablo)
INSERT INTO Kategoriler (KategoriAdi, Aciklama) VALUES 
('Burger', 'Hamburger ve patates menüleri'),
('Pizza', 'İtalyan usulü pizzalar'),
('Kebap', 'Geleneksel Türk kebapları');

-- 2. RESTORANLAR (Bağımsız tablo)
INSERT INTO Restoranlar (RestoranAdi, Adres, Telefon, MinimumPaketTutari, AcilisSaati, KapanisSaati) VALUES
('Burger King', 'Kadıköy Meydan', '02161112233', 100.00, '10:00', '02:00'),
('Kebapçı Celal', 'Üsküdar Sahil', '02162223344', 150.00, '11:00', '23:00'),
('Pizza Hut', 'Beşiktaş', '02123334455', 120.00, '10:30', '01:00');

-- 3. KULLANICILAR (Bağımsız tablo)
INSERT INTO Kullanicilar (Ad, Soyad, Email, SifreHash, Telefon) VALUES
('Ahmet', 'Yılmaz', 'ahmet@email.com', 'hash123', '05321112233'),
('Ayşe', 'Kaya', 'ayse@email.com', 'hash456', '05332223344');

-- 4. KURYELER (Bağımsız tablo)
INSERT INTO Kuryeler (Ad, Soyad, Telefon, AracPlakasi) VALUES
('Mehmet', 'Can', '05441112233', '34ABC123'),
('Ali', 'Veli', '05442223344', '34XYZ789');

-- 5. YEMEKLER (Kategori ve Restoran ID'lerine bağımlı)
INSERT INTO Yemekler (RestoranID, KategoriID, YemekAdi, Fiyat, Aciklama) VALUES
(1, 1, 'Whopper Menü', 150.00, 'Patates ve içecek ile'), -- ID 1: Restoran=Burger King, Kategori=Burger
(2, 3, 'Adana Dürüm', 120.00, 'Bol acılı'),            -- ID 2: Restoran=Kebapçı Celal, Kategori=Kebap
(3, 2, 'Karışık Pizza', 180.00, 'Orta boy');          -- ID 3: Restoran=Pizza Hut, Kategori=Pizza

-- 6. SİPARİŞLER (Kullanıcı ve Restoran ID'lerine bağımlı)
INSERT INTO Siparisler (KullaniciID, RestoranID, ToplamTutar, SiparisDurumu, TeslimatAdresi) VALUES
(1, 1, 150.00, 'Teslim Edildi', 'Kadıköy Moda Mahallesi'), -- Ahmet, Burger King'den sipariş verdi
(2, 2, 240.00, 'Yolda', 'Üsküdar Mimar Sinan Mahallesi');   -- Ayşe, Kebapçı Celal'den sipariş verdi

-- 7. SİPARİŞ DETAYLARI (Sipariş ve Yemek ID'lerine bağımlı)
INSERT INTO SiparisDetaylari (SiparisID, YemekID, Adet, BirimFiyat) VALUES
(1, 1, 1, 150.00), -- 1. Siparişte 1 adet Whopper Menü
(2, 2, 2, 120.00); -- 2. Siparişte 2 adet Adana Dürüm (120TL x 2 adet = 240TL Toplam Tutar)

-- 8. TESLİMATLAR (Sipariş ve Kurye ID'lerine bağımlı)
INSERT INTO Teslimatlar (SiparisID, KuryeID, TeslimatDurumu) VALUES
(1, 1, 'Teslim Edildi'), -- 1. Siparişi Kurye 1 (Mehmet) teslim etti
(2, 2, 'Yolda');         -- 2. Siparişi Kurye 2 (Ali) taşıyor

-- 9. ÖDEMELER (Sipariş ID'ye bağımlı)
INSERT INTO Odemeler (SiparisID, OdemeYontemi, Tutar, OdemeDurumu) VALUES
(1, 'Kredi Kartı', 150.00, 'Tamamlandı'),
(2, 'Nakit', 240.00, 'Bekliyor');

-- 10. DEĞERLENDİRMELER (Kullanıcı, Restoran ve Sipariş ID'lerine bağımlı)
INSERT INTO Degerlendirmeler (KullaniciID, RestoranID, SiparisID, Puan, Yorum) VALUES
(1, 1, 1, 5, 'Çok hızlı geldi, sıcak ve lezzetliydi. Teşekkürler.');
