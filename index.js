const express = require('express');
const path = require('path'); // Untuk mengelola path file
const app = express();
const port = 3000;

// Middleware untuk melayani file statis dari folder 'public'
app.use(express.static(path.join(__dirname, 'public')));

// Rute untuk halaman utama
app.get('/', (req, res) => {
  // Menampilkan halaman HTML dengan gambar
  res.send(`
    <html>
      <body>
        <h1>Ini adalah contoh isi halaman index!</h1>
        <img src="/logo_cakap.png" alt="Logo Cakap" />
      </body>
    </html>
  `);
});

// Jalankan aplikasi
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
