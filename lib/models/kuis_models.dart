import 'dart:math';

class Kuis {
  final String audioQuestion;
  final String imageQuestion;
  final bool answer;
  Kuis(this.audioQuestion, this.imageQuestion, this.answer);
}

class KuisTebakGambar {
  int indexNumber = 0;

  final List<Kuis> kuisA = [
    Kuis("audio/kuis/pertanyaan1.mp3", 'assets/pengenalan-huruf/HURUF-A.png', true, ),
    Kuis("audio/kuis/pertanyaan2.mp3", 'assets/pengenalan-angka/angka-2.png', false, ),
    Kuis("audio/kuis/pertanyaan3.mp3", 'assets/pengenalan-warna/chocolate.png', false, ),
    Kuis("audio/kuis/pertanyaan4.mp3", 'assets/pengenalan-hewan/cat.png', true, ),
    Kuis("audio/kuis/pertanyaan5.mp3", 'assets/pengenalan-hijaiyyah/hamzah.png', false, ),
    Kuis("audio/kuis/pertanyaan6.mp3", 'assets/pengenalan-warna/purple.png', false, ),
    Kuis("audio/kuis/pertanyaan7.mp3", 'assets/pengenalan-warna/red.png', false, ),
    Kuis("audio/kuis/pertanyaan8.mp3", 'assets/pengenalan-hewan/elephant.png', true, ),
    Kuis("audio/kuis/pertanyaan9.mp3", 'assets/pengenalan-hijaiyyah/sho.png', true, ),
    Kuis("audio/kuis/pertanyaan10.mp3", 'assets/pengenalan-warna/green.png', false, ),
  ];

  final List<Kuis> kuisB = [
    Kuis("audio/kuis/pertanyaan1.mp3", 'assets/pengenalan-huruf/HURUF-B.png', false, ),
    Kuis("audio/kuis/pertanyaan2.mp3", 'assets/pengenalan-angka/angka-1.png', true, ),
    Kuis("audio/kuis/pertanyaan3.mp3", 'assets/pengenalan-warna/blue.png', false, ),
    Kuis("audio/kuis/pertanyaan4.mp3", 'assets/pengenalan-hewan/dog.png', false, ),
    Kuis("audio/kuis/pertanyaan5.mp3", 'assets/pengenalan-hijaiyyah/alif.png', true, ),
    Kuis("audio/kuis/pertanyaan6.mp3", 'assets/pengenalan-warna/blue.png', true, ),
    Kuis("audio/kuis/pertanyaan7.mp3", 'assets/pengenalan-warna/yellow.png', true, ),
    Kuis("audio/kuis/pertanyaan8.mp3", 'assets/pengenalan-hewan/horse.png', false, ),
    Kuis("audio/kuis/pertanyaan9.mp3", 'assets/pengenalan-hijaiyyah/sa.png', false, ),
    Kuis("audio/kuis/pertanyaan10.mp3", 'assets/pengenalan-warna/orange.png', true, ),
  ];

  final List<Kuis> kuisC = [
    Kuis("audio/kuis/pertanyaan1.mp3", 'assets/pengenalan-huruf/HURUF-C.png', false, ),
    Kuis("audio/kuis/pertanyaan2.mp3", 'assets/pengenalan-angka/angka-3.png', false, ),
    Kuis("audio/kuis/pertanyaan3.mp3", 'assets/pengenalan-warna/red.png', true, ),
    Kuis("audio/kuis/pertanyaan4.mp3", 'assets/pengenalan-hewan/lion.png', false, ),
    Kuis("audio/kuis/pertanyaan5.mp3", 'assets/pengenalan-hijaiyyah/lam.png', false, ),
    Kuis("audio/kuis/pertanyaan6.mp3", 'assets/pengenalan-warna/black.png', false, ),
    Kuis("audio/kuis/pertanyaan7.mp3", 'assets/pengenalan-warna/blue.png', false, ),
    Kuis("audio/kuis/pertanyaan8.mp3", 'assets/pengenalan-hewan/pig.png', false, ),
    Kuis("audio/kuis/pertanyaan9.mp3", 'assets/pengenalan-hijaiyyah/sya.png', false, ),
    Kuis("audio/kuis/pertanyaan10.mp3", 'assets/pengenalan-warna/yellow.png', false, ),
  ];

  nextQuestion() {
    if (indexNumber < kuisA.length) {
      indexNumber++;
    }
  }

  String getAudioQuestion() {
    return kuisA[indexNumber].audioQuestion;
  }

  String getQuestion1() {
    return kuisA[indexNumber].imageQuestion;
  }

  String getQuestion2() {
    return kuisB[indexNumber].imageQuestion;
  }

  String getQuestion3() {
    return kuisC[indexNumber].imageQuestion;
  }

  bool getAnswer1() {
    return kuisA[indexNumber].answer;
  }

  bool getAnswer2() {
    return kuisB[indexNumber].answer;
  }

  bool getAnswer3() {
    return kuisC[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber == kuisA.length -1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
