import 'package:flutter/material.dart';
import 'question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> _questions = [ // Daftar pertanyaan dan jawabannya.
    Question('assets/dog.jpeg', 'What animal is this?',
        ['Dog', 'Cat', 'Bird', 'Fish'], 'Dog'), // Pertanyaan 1.
    Question('assets/lion.jpeg', 'What animal is this?',
        ['Elephant', 'Lion', 'Tiger', 'Bear'], 'Lion'), // Pertanyaan 2.
    Question('assets/panda.jpeg', 'What animal is this?',
        ['Panda', 'Giraffe', 'Kangaroo', 'Zebra'], 'Panda'), // Pertanyaan 3.
    Question('assets/duck.jpeg', 'What animal is this?',
        ['Duck', 'Chicken', 'Goose', 'Turkey'], 'Duck'), // Pertanyaan 4.
    Question('assets/wolf.jpeg', 'What animal is this?',
        ['Wolf', 'Fox', 'Coyote', 'Jackal'], 'Wolf'), // Pertanyaan 5.
    Question('assets/elephant.jpeg', 'What animal is this?',
        ['Snake', 'Elephant', 'Dragon', 'Giraffe'], 'Elephant'), // Pertanyaan 6.
    Question('assets/bull.jpeg', 'What animal is this?',
        ['Bull', 'Cow', 'Buffalo', 'Ox'], 'Bull'), // Pertanyaan 7.
    Question('assets/bear.jpeg', 'What animal is this?',
        ['Bear', 'Polar Bear', 'Grizzly Bear', 'Brown Bear'], 'Bear'), // Pertanyaan 8.
    Question('assets/dragon.jpeg', 'What animal is this?',
        ['Dinosaur', 'Serpent', 'Dragon', 'Wyvern'], 'Dragon'), // Pertanyaan 9.
    Question('assets/optimus_prime.jpeg', 'What animal is this?',
        ['Robot', 'Alien', 'Optimus Prime', 'Cyborg'], 'Optimus Prime'), // Pertanyaan 10.
  ];

  int _questionIndex = 0; // Index pertanyaan yang sedang ditampilkan.
  int _correctAnswers = 0; // Jumlah jawaban yang benar.
  int _incorrectAnswers = 0; // Jumlah jawaban yang salah.

  void _answerQuestion(String answer) {
    setState(() {
      if (_questions[_questionIndex].correctAnswer == answer) { // Periksa apakah jawaban benar.
        _correctAnswers++; // Tambah jumlah jawaban yang benar.
      } else {
        _incorrectAnswers++; // Tambah jumlah jawaban yang salah.
      }

      if (_questionIndex < _questions.length - 1) { // Periksa apakah masih ada pertanyaan tersisa.
        _questionIndex++; // Tampilkan pertanyaan berikutnya.
      } else {
        showDialog( // Tampilkan dialog dengan hasil kuis.
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Quiz Results'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Correct Answers: $_correctAnswers'), // Tampilkan jumlah jawaban yang benar.
                  Text('Incorrect Answers: $_incorrectAnswers'), // Tampilkan jumlah jawaban yang salah.
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() { // Reset kuis untuk memulai ulang.
                      _questionIndex = 0;
                      _correctAnswers = 0;
                      _incorrectAnswers = 0;
                    });
                  },
                  child: Text('Restart Quiz'), // Tombol untuk memulai ulang kuis.
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD0C9C0), // Warna latar belakang appbar.
        title: Text('Animal Quiz'), // Judul appbar.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _questions[_questionIndex].imagePath, // Tampilkan gambar sesuai pertanyaan yang sedang ditampilkan.
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              _questions[_questionIndex].questionText, // Tampilkan teks pertanyaan.
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: _questions[_questionIndex].answerOptions.map((option) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextButton(
                      onPressed: () => _answerQuestion(option), // Jawab pertanyaan dengan opsi yang dipilih.
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFD0C9C0)), // Warna latar belakang tombol jawaban.
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF5F7161)), // Warna teks tombol jawaban.
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Atur sudut bulat tombol.
                          ),
                        ),
                      ),
                      child: Text(option), // Tampilkan opsi jawaban.
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
