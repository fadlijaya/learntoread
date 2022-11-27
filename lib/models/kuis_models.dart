class Kuis {
  final String image;
  final String question;
  final bool answer;
  Kuis(this.image, this.question, this.answer);
}

class KuisTebakGambar {
  int indexNumber = 0;

  final List<Kuis> kuisA = [
    Kuis('assets/kuis/A.png', 'Huruf A', true),
    Kuis('assets/kuis/1.png', 'Angka 2', false),
    Kuis('assets/kuis/red.png', 'Coklat', false),
    Kuis('assets/kuis/cat.png', 'Kucing', true),
    Kuis('assets/kuis/alif.png', 'Hamzah', false),
    Kuis('assets/kuis/blue.png', 'Ungu', false),
    Kuis('assets/kuis/yellow.png', 'Merah', false),
    Kuis('assets/kuis/elephant.png', 'Gajah', true),
    Kuis('assets/kuis/sho.png', 'Sho', true),
    Kuis('assets/kuis/orange.png', 'Hijau', false),
  ];

  final List<Kuis> kuisB = [
    Kuis('assets/A.png', 'Huruf B', false),
    Kuis('assets/1.png', 'Angka 1', true),
    Kuis('assets/kuis/red.png', 'Biru', false),
    Kuis('assets/kuis/cat.png', 'Anjing', false),
    Kuis('assets/kuis/alif.png', 'Alif', true),
    Kuis('assets/kuis/blue.png', 'Biru', true),
    Kuis('assets/kuis/yellow.png', 'Kuning', true),
    Kuis('assets/kuis/elephant.png', 'Kuda', false),
    Kuis('assets/kuis/sho.png', 'Sa', false),
    Kuis('assets/kuis/orange.png', 'Jingga', true),
  ];

  final List<Kuis> kuisC = [
    Kuis('assets/A.png', 'Huruf C', false),
    Kuis('assets/1.png', 'Angka 3', false),
    Kuis('assets/kuis/red.png', 'Merah', true),
    Kuis('assets/kuis/cat.png', 'Singa', false),
    Kuis('assets/kuis/alif.png', 'Lam', false),
    Kuis('assets/kuis/blue.png', 'Hitam', false),
    Kuis('assets/kuis/yellow.png', 'Biru', false),
    Kuis('assets/kuis/elephant.png', 'Babi', false),
    Kuis('assets/kuis/sho.png', 'Sya', false),
    Kuis('assets/kuis/orange.png', 'Kuning', false),
  ];

  nextQuestion() {
    if (indexNumber <= kuisA.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return kuisA[indexNumber].image;
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
