# 🍴 Foodies App

Foodies App adalah aplikasi sederhana untuk menampilkan daftar pilihan restoran menggunakan **Dicoding Restaurant API**:  
👉 https://restaurant-api.dicoding.dev  

Aplikasi ini dikembangkan sebagai bagian dari **submission pertama** untuk kelas fundamental Flutter.

---

## ✨ Fitur Utama

1. **Splash Screen**
   - Halaman awal saat aplikasi diluncurkan.
   - Terdapat tombol **Continue** untuk masuk ke Main Screen.

2. **Main Screen dengan Bottom Navigation**
   - **Home** → Menampilkan daftar restoran.
   - **Bookmarks** → (Masih placeholder, fitur belum diimplementasikan).
   - **Settings** → (Masih placeholder, fitur belum diimplementasikan).

3. **Home Screen**
   - Menggunakan `ListView.builder` untuk menampilkan daftar restoran.
   - Data restoran diambil dari endpoint:  
     ```
     https://restaurant-api.dicoding.dev/list
     ```
   - Setiap restoran ditampilkan dalam bentuk **Card**.

4. **Detail Screen**
   - Ditampilkan setelah pengguna memilih restoran dari daftar (via `GestureDetector.onTap`).
   - Informasi yang ditampilkan:
     - Nama restoran
     - Deskripsi
     - Menu makanan (`foods`)
     - Menu minuman (`drinks`)
     - Daftar customer review
   - Data detail diambil dari endpoint:  
     ```
     https://restaurant-api.dicoding.dev/detail/{id}
     ```

5. **Tambah Customer Review**
   - Pengguna dapat menambahkan review pada restoran.
   - Review dikirim menggunakan metode **POST** ke endpoint:  
     ```
     https://restaurant-api.dicoding.dev/review
     ```

---

## 🛠️ Teknologi yang Digunakan
- **Flutter** (Dart)
- **HTTP package** untuk request API
- **Stateful & Stateless Widgets**
- **ListView.builder**
- **GestureDetector** untuk navigasi

---

## 📌 Status Pengerjaan
- Fokus pengerjaan masih di **Home Screen** & **Detail Screen**.
- Fitur **Bookmarks** dan **Settings** masih belum diimplementasikan penuh.
- Aplikasi sudah mendukung **fetching data** & **posting review**.

---

## 🚀 Cara Menjalankan
1. Clone repository ini:
   ```bash
   git clone https://github.com/sandeeffendi/foodie-mobile-app
