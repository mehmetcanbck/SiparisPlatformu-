USE SiparisPlatformu;
GO

-- ==========================================
-- BÖLÜM 1: GÖRÜNÜMLER (VIEWS)
-- ==========================================
-- Amaç: Karmaşık sorguları (JOIN'leri) kaydedip, sanki tek bir tabloymuş gibi kolayca çağırabilmek.

-- VIEW 1: Sipariş Detaylı Raporu (JOIN kullanımı)
-- Müşterinin adını, restoranın adını ve sipariş tutarını tek bir sanal tabloda birleştirir.
CREATE VIEW vw_MusteriSiparisRaporu AS
SELECT 
    S.SiparisID,
    K.Ad + ' ' + K.Soyad AS MusteriAdSoyad,
    R.RestoranAdi,
    S.SiparisTarihi,
    S.ToplamTutar,
    S.SiparisDurumu
FROM 
    Siparisler S
INNER JOIN Kullanicilar K ON S.KullaniciID = K.KullaniciID
INNER JOIN Restoranlar R ON S.RestoranID = R.RestoranID;
GO

-- VIEW 2: Restoran Satış İstatistikleri (GROUP BY ve JOIN kullanımı)
-- Hangi restoranın toplam kaç sipariş aldığını ve toplam ne kadar ciro yaptığını gösterir.
CREATE VIEW vw_RestoranSatisIstatistikleri AS
SELECT 
    R.RestoranAdi,
    COUNT(S.SiparisID) AS ToplamSiparisSayisi,
    SUM(S.ToplamTutar) AS ToplamCiro
FROM 
    Restoranlar R
LEFT JOIN Siparisler S ON R.RestoranID = S.RestoranID
GROUP BY 
    R.RestoranAdi;
GO

-- ==========================================
-- BÖLÜM 2: TETİKLEYİCİLER (TRIGGERS)
-- ==========================================
-- Amaç: Bir tabloda ekleme, silme veya güncelleme yapıldığında OTOMATİK olarak başka bir işlem başlatmak.

-- Trigger için önce bir Log (Kayıt) tablosu oluşturalım:
CREATE TABLE SiparisDurumLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT,
    EskiDurum VARCHAR(50),
    YeniDurum VARCHAR(50),
    DegisimTarihi DATETIME DEFAULT CURRENT_TIMESTAMP
);
GO

-- TRIGGER 1: Sipariş Durumu Güncellendiğinde Log Tutan Tetikleyici
-- Kurye "Teslim Edildi"ye bastığında arka planda otomatik olarak çalışan güvenlik kamerası gibidir.
CREATE TRIGGER trg_SiparisDurumTakip
ON Siparisler
AFTER UPDATE
AS
BEGIN
    -- Sadece SiparisDurumu kolonu güncellendiyse çalışsın
    IF UPDATE(SiparisDurumu)
    BEGIN
        INSERT INTO SiparisDurumLog (SiparisID, EskiDurum, YeniDurum)
        SELECT 
            i.SiparisID, 
            d.SiparisDurumu, -- deleted: Güncelleme öncesi eski veri
            i.SiparisDurumu  -- inserted: Güncelleme sonrası yeni veri
        FROM inserted i
        INNER JOIN deleted d ON i.SiparisID = d.SiparisID
        WHERE i.SiparisDurumu <> d.SiparisDurumu; -- Sadece gerçekten değiştiyse kaydet
    END
END;
GO

-- ==========================================
-- BÖLÜM 3: İLERİ DÜZEY ANALİTİK SORGULAR (Örnekler)
-- ==========================================

-- ÖRNEK SORGU: En çok sipariş edilen 3 yemeği ve kaç kez sipariş edildiklerini bul (Sınavda sorulabilecek favori sorulardan)
/*
SELECT TOP 3
    Y.YemekAdi,
    SUM(SD.Adet) AS ToplamSatisAdedi
FROM SiparisDetaylari SD
INNER JOIN Yemekler Y ON SD.YemekID = Y.YemekID
GROUP BY Y.YemekAdi
ORDER BY ToplamSatisAdedi DESC;
*/
