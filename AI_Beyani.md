# Yapay Zeka (AI) Kullanım Beyanı

Bu doküman, Veritabanı Yönetim Sistemleri (VTYS) 1. Dönem Projesi kapsamında geliştirilen "Çevrimiçi Yemek Sipariş Platformu" için yapay zeka araçlarının nasıl kullanıldığını şeffaf bir şekilde açıklamaktadır.

Proje geliştirme sürecinde yapay zeka, kodu doğrudan üretip teslim etmek amacıyla değil, bir **öğretmen ve rehber** olarak kullanılmıştır.

## Hangi Aşamalarda ve Nasıl Kullanıldı?

1. **Veritabanı Tasarımı ve ER Diyagramı Mantığı:** 
   Temel tabloların (Kullanıcı, Restoran, Kategori) belirlenmesi ve bu tablolara bağlı ilişkili tabloların (Yemekler, Siparişler) aralarındaki yabancı anahtar (Foreign Key) bağlantılarının nasıl kurulması gerektiği konusunda fikir alışverişi yapılmıştır.

2. **"Askıda Yemek" Sisteminin Kurgulanması (Özgün Tasarım):** 
   Projenin özel gereksinimlerinden biri olan Askıda Yemek sisteminin veritabanına en doğru şekilde nasıl entegre edileceği tartışılmıştır. Sistemin "Siparişler" tablosuna bir sütun olarak eklenmesi yerine, normalizasyon kurallarına uygun olarak ayrı bir `AskidaYemekler` tablosu halinde tasarlanması kararlaştırılmıştır.

3. **Özgünlük Doğrulamasına (Sözlü Sınav) Hazırlık:** 
   Geliştirilen her tablonun ne işe yaradığı, neden o veri tiplerinin (örn: VARCHAR, DECIMAL) veya kısıtlamaların (UNIQUE, NOT NULL, DEFAULT) seçildiği yapay zeka ile tartışılarak tam anlamıyla öğrenilmiştir. 

## Sonuç
Yazılan tüm SQL kodları tarafımca anlaşılarak projenin gereksinimlerine göre uyarlanmış, adım adım test edilmiş ve versiyon kontrolü (Git) kullanılarak parça parça GitHub'a yüklenmiştir. Final sınavı ve sözlü mülakat için tasarımın tüm detaylarına hakim olunmuştur.
