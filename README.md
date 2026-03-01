# 📦 AIR-Bot (Automated Inventory Restocker)
> Transformasi Digital Mutasi Barang Gudang Terintegrasi via Telegram Bot & Cloud Database.

Bot ini diciptakan untuk menyelesaikan masalah klasik di bagian IT Support / Inventaris: **Pencatatan manual yang lambat, rentan selisih (human-error), dan tidak memiliki jejak audit (*log*) yang jelas.**

---

## 🧠 Konsep Dasar: Bagaimana Ini Bekerja?
Bagi Anda yang belum pernah menggunakan sistem otomasi (seperti n8n), bayangkan bot ini seperti sebuah **Pabrik Cerdas** dengan 3 divisi utama:

1. 📱 **Telegram (Sang Kurir Bot):** Bertugas mendengarkan perintah dari staf. Contoh: Staf mengetik `/restock I001 5`.
2. ⚙️ **n8n (Sang Manajer Cerdas):** Ini adalah "otak" dari aplikasi ini. Alih-alih langsung mencatat, ia melakukan **3 lapis pengecekan keamanan (Validasi)** secara instan:
   - *"Apakah orang ini staf resmi kita?"*
   - *"Apakah barang dengan kode I001 itu ada di katalog?"*
   - *"Apakah stok di gudang cukup untuk dikurangi 5 buah?"*
3. 📊 **Google Sheets (Sang Kepala Gudang):** Jika semua syarat dari Sang Manajer terpenuhi, barulah buku besar (database) diubah secara otomatis, dan bukti transaksi (*log*) dicetak secara *real-time*.

---

## ✨ Fitur Unggulan (Logical Flow)

Proyek ini tidak hanya sekadar memindahkan data, tetapi memiliki logika pengkondisian tingkat lanjut (Fail-Fast Logic):

- **🛡️ Sistem Keamanan ID (Auth):** Menolak perintah dari akun Telegram yang tidak terdaftar di database.
- **🧮 Auto-Kalkulasi:** Menghitung pengurangan stok gudang dan penambahan stok user tanpa formula manual di Spreadsheet.
- **🔄 Smart Branching (Update/Append):** Bot tahu kapan harus membuat "baris catatan baru" (jika staf baru pertama kali mengambil barang) atau "memperbarui baris lama" (jika staf sudah pernah mengambil barang tersebut).
- **📝 Audit Trail Permanen:** Setiap pergerakan barang dicatat detail di lembar `LOG_TRANSAKSI` (Waktu, Tipe, User, Item, Qty).

---

## 🗺️ Arsitektur Alur Kerja (Workflow)

```text
[User di Telegram] 
       │ 
       ▼ 
(Tulis: /restock I001 5) 
       │
       ▼
[⚙️ MESIN n8n BERPIKIR]
  ├─ 1. Cek User terdaftar? ──(Tidak)──> ❌ Balas: "Anda tidak terdaftar"
  │    (Ya)
  ├─ 2. Cek Item ada? ────────(Tidak)──> ❌ Balas: "Item tidak ditemukan"
  │    (Ya)
  ├─ 3. Cek Stok Cukup? ──────(Tidak)──> ❌ Balas: "Stok gudang kurang!"
  │    (Ya)
  ▼
[💾 EKSEKUSI DATABASE - Google Sheets]
  ├─ Kurangi Stok Gudang Induk
  ├─ Tambah Stok di Tangan User (Update / Buat Baris Baru)
  └─ Catat Log Mutasi di Riwayat
       │
       ▼
[✅ KONFIRMASI] 
Kirim pesan sukses ke User via Telegram beserta sisa kuantitas.

🚀 Cara Reproduksi / Menjalankan Project Ini
Proyek ini dibangun menggunakan arsitektur Low-Code Node-Based. Anda tidak perlu mengetik ribuan baris kode, cukup lakukan ini:

Persiapan
1. Install n8n secara lokal atau gunakan n8n Cloud.
2. Siapkan Telegram Bot Token (via BotFather).
3. Siapkan Google Service Account JSON (untuk akses Google Sheets API).

Instalasi Workflow
1. Unduh file restock-bot-v1.json dari repositori ini.
2. Buka antarmuka n8n Anda.
3. Buka Workflow baru, klik menu di ujung kanan atas (titik tiga) lalu pilih Import from File...
4. Masukkan kredensial Telegram dan Google Sheets Anda ke dalam node yang membutuhkan (terdapat tanda seru jika belum diatur).
5. Ubah ID Google Sheets di setiap node sesuai dengan URL spreadsheet milik Anda.
6. Klik Activate, dan Bot siap digunakan!
