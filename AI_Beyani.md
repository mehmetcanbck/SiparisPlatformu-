# Yapay Zeka (AI) Kullanım Beyanı ve Dürüstlük Raporu

Bu belge, "Çevrimiçi Yemek Sipariş Platformu Veritabanı Tasarımı" projesinin geliştirilmesi sırasında yapay zeka araçlarının nasıl kullanıldığını şeffaf bir şekilde açıklamak amacıyla hazırlanmıştır.

## Kullanılan Araç
**Gemini** (Yapay Zeka Kodlama Asistanı)

## Hangi Aşamalarda Kullanıldı?
Proje süresince yapay zeka bir "kod yazıcı" olmaktan ziyade bir "mentör" ve "kılavuz" olarak kullanılmış, tüm adımlar tartışılarak ilerlenmiştir:

1. **Planlama ve Veritabanı Şeması Tasarımı:** Projenin başlangıcında, hangi tabloların oluşturulması gerektiği ve bu tablolar arasındaki ilişkilerin (Primary Key, Foreign Key) nasıl kurulacağı konusunda fikir alışverişi yapılmıştır.
2. **SQL Kodlarının Yazımı:** Kararlaştırılan tabloların T-SQL sözdizimine uygun olarak oluşturulmasında (CREATE TABLE, veri tipleri, kısıtlamalar) yapay zekadan sözdizimi (syntax) desteği alınmıştır.
3. **Örnek Veri Üretimi:** Tablolar arası ilişkilerin doğru çalıştığını test edebilmek amacıyla eklenecek olan tutarlı test verilerinin (INSERT INTO) hazırlanmasında destek alınmıştır.
4. **İleri Düzey SQL Nesneleri:** View (Görünüm) ve Trigger (Tetikleyici) gibi karmaşık veritabanı nesnelerinin mantığı yapay zeka ile tartışılarak öğrenilmiş ve ardından projeye uygun senaryolar kodlanmıştır.
5. **Versiyon Kontrolü (GitHub):** Yazılan kodların versiyonlanması ve aşama aşama GitHub'a yüklenmesi (git commit, push) adımlarında yapay zekadan terminal komutları konusunda rehberlik alınmıştır.

## Öğrenme ve Özgünlük Bildirimi
Proje dosyasındaki tüm kodların mantığı, tabloların neden birbiriyle ilişkili olduğu, View ve Trigger'ların nasıl çalıştığı tarafımca tamamen kavranmış ve tüm kodlar SSMS üzerinde tarafımca çalıştırılarak test edilmiştir. Yapay zeka, doğrudan projeyi teslim almak için değil, Veritabanı Yönetim Sistemleri (VTYS) konusundaki öğrenme sürecimi hızlandırmak ve doğru endüstri standartlarını uygulamak için bir asistan olarak kullanılmıştır. İşbu sebeple proje süreçlerine ve kodların içeriğine tamamen hakim olduğumu beyan ederim.
