class Kuis {
  final String image;
  final String question;
  final bool answer;
  Kuis(this.image, this.question, this.answer);
}

class KuisTebakGambar {
  int indexNumber = 0;

  final List<Kuis> kuisA = [
    Kuis('assets/A.png', 'Huruf A', true),
    Kuis('assets/1.png', 'Angka 2', false),
    Kuis('assets/pengenalan-warna/red.png', 'Coklat', false),
    Kuis('assets/pengenalan-hewan/cat.png', 'Kucing', true),
    Kuis('assets/pengenalan-hijaiyyah/alif.png', 'Hamzah', false),
    Kuis('assets/pengenalan-warna/blue.png', 'Ungu', false),
    Kuis('assets/pengenalan-warna/yellow.png', 'Merah', false),
    Kuis('assets/pengenalan-hewan/elephant.png', 'Gajah', true),
    Kuis('assets/pengenalan-hijaiyyah/sho.png', 'Sho', true),
    Kuis('assets/pengenalan-warna/orange.png', 'Hijau', false),
  ];

  final List<Kuis> kuisB = [
    Kuis('assets/A.png', 'Huruf B', false),
    Kuis('assets/1.png', 'Angka 1', true),
    Kuis('assets/pengenalan-warna/red.png', 'Biru', false),
    Kuis('assets/pengenalan-hewan/cat.png', 'Anjing', false),
    Kuis('assets/pengenalan-hijaiyyah/alif.png', 'Alif', true),
    Kuis('assets/pengenalan-warna/blue.png', 'Biru', true),
    Kuis('assets/pengenalan-warna/yellow.png', 'Kuning', true),
    Kuis('assets/pengenalan-hewan/elephant.png', 'Kuda', false),
    Kuis('assets/pengenalan-hijaiyyah/sho.png', 'Sa', false),
    Kuis('assets/pengenalan-warna/orange.png', 'Jingga', true),
  ];

  final List<Kuis> kuisC = [
    Kuis('assets/A.png', 'Huruf C', false),
    Kuis('assets/1.png', 'Angka 3', false),
    Kuis('assets/pengenalan-warna/red.png', 'Merah', true),
    Kuis('assets/pengenalan-hewan/cat.png', 'Singa', false),
    Kuis('assets/pengenalan-hijaiyyah/alif.png', 'Lam', false),
    Kuis('assets/pengenalan-warna/blue.png', 'Hitam', false),
    Kuis('assets/pengenalan-warna/yellow.png', 'Biru', false),
    Kuis('assets/pengenalan-hewan/elephant.png', 'Babi', false),
    Kuis('assets/pengenalan-hijaiyyah/sho.png', 'Sya', false),
    Kuis('assets/pengenalan-warna/orange.png', 'Kuning', false),
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
