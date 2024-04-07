class Question {
  final String imagePath; // Path gambar yang terkait dengan pertanyaan.
  final String questionText; // Teks pertanyaan.
  final List<String> answerOptions; // Opsi jawaban yang tersedia.
  final String correctAnswer; // Jawaban yang benar.

  Question(this.imagePath, this.questionText, this.answerOptions,
      this.correctAnswer); // Konstruktor untuk inisialisasi pertanyaan.
}
