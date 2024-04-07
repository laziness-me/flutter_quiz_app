import 'package:flutter/material.dart';
import 'quiz_page.dart';

void main() => runApp(MyApp()); // Fungsi main yang memulai aplikasi dengan menjalankan MyApp.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Quiz', // Judul aplikasi yang akan ditampilkan.
      theme: ThemeData( // Mengatur warna.
        primaryColor: Color(0xFF5F7161), // Warna utama aplikasi.
        hintColor: Color(0xFF6D8B74),
        scaffoldBackgroundColor: Color(0xFFEFEAD8), // Warna latar belakang scaffold.
      ),
      home: HomePage(), // Mengatur halaman awal aplikasi ke HomePage.
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 230), // Menambahkan ruang kosong untuk mendorong konten ke bawah.
            Text('Animal Quiz', // Menampilkan teks "Animal Quiz".
                style: TextStyle(
                    fontSize: 40, // Ukuran font teks.
                    fontWeight: FontWeight.bold, // Ketebalan font teks.
                    color: Color(0xFFD0C9C0))), // Warna teks "Animal Quiz".
            SizedBox(height: 20), // Menambahkan ruang kosong di antara teks dan tombol.
            ElevatedButton( // Membuat tombol diaktifkan yang akan menavigasi ke halaman kuis.
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QuizPage())), // Mengatur aksi ketika tombol ditekan untuk menavigasi ke halaman kuis.
              child: Text('Play', style: TextStyle(fontSize: 24)), // Teks yang ditampilkan pada tombol "Play".
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD0C9C0), // Warna latar belakang tombol Play.
                foregroundColor: Color(0xFF5F7161), // Warna teks tombol Play.
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding tombol.
                shape: RoundedRectangleBorder( // Bentuk tombol.
                    borderRadius: BorderRadius.circular(20)), // Mengatur sudut bulat tombol.
              ),
            ),
            Spacer(), // Menambahkan ruang kosong yang fleksibel di antara tombol dan teks kredit.
            Container(
              alignment: Alignment.bottomLeft, // Penataan teks kredit ke pojok kiri bawah.
              padding: EdgeInsets.all(20), // Padding untuk teks kredit.
              child: Text(
                  'CREDIT by\nAlbi_076\nFarah_092\nSalsa_094\nUNESA MIc 2022', // Teks kredit.
                  style: TextStyle(
                      fontSize: 12, // Ukuran font teks kredit.
                      fontStyle: FontStyle.italic, // Gaya font teks kredit.
                      color: Color(0xFFD0C9C0))), // Warna teks kredit.
            ),
          ],
        ),
      ),
    );
  }
}