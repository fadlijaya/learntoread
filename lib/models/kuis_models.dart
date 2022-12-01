class Kuis {
  final String image;
  final String audioQuestion;
  final String question;
  final bool answer;
  Kuis(this.image, this.audioQuestion, this.question, this.answer);
}

class KuisTebakGambar {
  int indexNumber = 0;

  final List<Kuis> kuisA = [
    Kuis('assets/kuis/A.png', "audio/kuis/pertanyaan1.mp3", 'Huruf A', true, ),
    Kuis('assets/kuis/1.png', "audio/kuis/pertanyaan2.mp3", 'Angka 2', false, ),
    Kuis('assets/kuis/red.png', "audio/kuis/pertanyaan3.mp3", 'Coklat', false, ),
    Kuis('assets/kuis/cat.png', "audio/kuis/pertanyaan4.mp3", 'Kucing', true, ),
    Kuis('assets/kuis/alif.png', "audio/kuis/pertanyaan5.mp3", 'Hamzah', false, ),
    Kuis('assets/kuis/blue.png', "audio/kuis/pertanyaan6.mp3", 'Ungu', false, ),
    Kuis('assets/kuis/yellow.png', "audio/kuis/pertanyaan7.mp3", 'Merah', false, ),
    Kuis('assets/kuis/elephant.png', "audio/kuis/pertanyaan8.mp3", 'Gajah', true, ),
    Kuis('assets/kuis/sho.png', "audio/kuis/pertanyaan9.mp3", 'Sho', true, ),
    Kuis('assets/kuis/orange.png', "audio/kuis/pertanyaan10.mp3", 'Hijau', false, ),
  ];

  final List<Kuis> kuisB = [
    Kuis('assets/A.png', "audio/kuis/pertanyaan1.mp3", 'Huruf B', false, ),
    Kuis('assets/1.png', "audio/kuis/pertanyaan2.mp3", 'Angka 1', true, ),
    Kuis('assets/kuis/red.png', "audio/kuis/pertanyaan3.mp3", 'Biru', false, ),
    Kuis('assets/kuis/cat.png', "audio/kuis/pertanyaan4.mp3", 'Anjing', false, ),
    Kuis('assets/kuis/alif.png', "audio/kuis/pertanyaan5.mp3", 'Alif', true, ),
    Kuis('assets/kuis/blue.png', "audio/kuis/pertanyaan6.mp3", 'Biru', true, ),
    Kuis('assets/kuis/yellow.png', "audio/kuis/pertanyaan7.mp3", 'Kuning', true, ),
    Kuis('assets/kuis/elephant.png', "audio/kuis/pertanyaan8.mp3", 'Kuda', false, ),
    Kuis('assets/kuis/sho.png', "audio/kuis/pertanyaan9.mp3", 'Sa', false, ),
    Kuis('assets/kuis/orange.png', "audio/kuis/pertanyaan10.mp3", 'Jingga', true, ),
  ];

  final List<Kuis> kuisC = [
    Kuis('assets/A.png', "audio/kuis/pertanyaan1.mp3", 'Huruf C', false, ),
    Kuis('assets/1.png', "audio/kuis/pertanyaan2.mp3", 'Angka 3', false, ),
    Kuis('assets/kuis/red.png', "audio/kuis/pertanyaan3.mp3", 'Merah', true, ),
    Kuis('assets/kuis/cat.png', "audio/kuis/pertanyaan4.mp3", 'Singa', false, ),
    Kuis('assets/kuis/alif.png', "audio/kuis/pertanyaan5.mp3", 'Lam', false, ),
    Kuis('assets/kuis/blue.png', "audio/kuis/pertanyaan6.mp3", 'Hitam', false, ),
    Kuis('assets/kuis/yellow.png', "audio/kuis/pertanyaan7.mp3", 'Biru', false, ),
    Kuis('assets/kuis/elephant.png', "audio/kuis/pertanyaan8.mp3", 'Babi', false, ),
    Kuis('assets/kuis/sho.png', "audio/kuis/pertanyaan9.mp3", 'Sya', false, ),
    Kuis('assets/kuis/orange.png', "audio/kuis/pertanyaan10.mp3", 'Kuning', false, ),
  ];

  nextQuestion() {
    if (indexNumber <= kuisA.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return kuisA[indexNumber].image;
  }

  String getAudioQuestion() {
    return kuisA[indexNumber].audioQuestion;
  }

  String getQuestion1() {
    return kuisA[indexNumber].question;
  }

  String getQuestion2() {
    return kuisB[indexNumber].question;
  }

  String getQuestion3() {
    return kuisC[indexNumber].question;
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
    if (indexNumber >= kuisA.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
