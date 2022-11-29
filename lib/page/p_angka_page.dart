import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import '../models/p_angka_models.dart';
import '../utils/constants.dart';

class PAngkaPage extends StatefulWidget {
  const PAngkaPage({super.key});

  @override
  State<PAngkaPage> createState() => _PAngkaPageState();
}

class _PAngkaPageState extends State<PAngkaPage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;

  List<Angka>? angkaList;

  static List<String> angka = [
    'assets/pengenalan-angka/angka-1.png',
    'assets/pengenalan-angka/angka-2.png',
    'assets/pengenalan-angka/angka-3.png',
    'assets/pengenalan-angka/angka-4.png',
    'assets/pengenalan-angka/angka-5.png',
    'assets/pengenalan-angka/angka-6.png',
    'assets/pengenalan-angka/angka-7.png',
    'assets/pengenalan-angka/angka-8.png',
    'assets/pengenalan-angka/angka-9.png',
    'assets/pengenalan-angka/angka-10.png',
  ];

  static List<String> assetAudio = [
    "audio/pengenalan-angka/1.mp3",
    "audio/pengenalan-angka/2.mp3",
    "audio/pengenalan-angka/3.mp3",
    "audio/pengenalan-angka/4.mp3",
    "audio/pengenalan-angka/5.mp3",
    "audio/pengenalan-angka/6.mp3",
    "audio/pengenalan-angka/7.mp3",
    "audio/pengenalan-angka/8.mp3",
    "audio/pengenalan-angka/9.mp3",
    "audio/pengenalan-angka/10.mp3"
  ];

  audio(String assetAudio) {
    try {
      assetsAudioPlayer.open(Audio(assetAudio));
    } catch (e) {

    }
  }

  final List<Angka> listAngka =
      List.generate(angka.length, (index) => Angka(angka[index], assetAudio[index]));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: PageView.builder(
          itemCount: listAngka.length,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {},
          itemBuilder: (context, i) {
            audio(listAngka[i].assetAudio);
            return Stack(
              children: [
                buildBackground(size),
                buildIconBack(),
                buildTitlePage(),
                buildItem(listAngka[i].nama)
              ],
            );
          }),
    ));
  }

  Widget buildBackground(Size size) {
    return Image.asset(
      backgroundsItemPage,
      width: size.width,
      height: size.height,
      opacity: AlwaysStoppedAnimation(0.7),
    );
  }

  Widget buildIconBack() {
    return Positioned(
        top: 24,
        left: 24,
        child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/menu'),
            child: Card(
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              shadowColor: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/back.png",
                  width: 40,
                ),
              ),
            )));
  }

  Widget buildTitlePage() {
    return Positioned.fill(
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: const EdgeInsets.fromLTRB(8, 40, 8, 8),
                child: Text(
                  titleItem2.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Kid Games',
                      color: Colors.white),
                ))));
  }

  Widget buildItem(String namaAngka) {
    return Positioned.fill(
      left: 40,
      top: 80,
      right: 40,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () => pageController.previousPage(
                    duration: duration, curve: curve),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.green,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/previous.png",
                      width: 40,
                    ),
                  ),
                )),
            Image.asset(namaAngka, fit: BoxFit.cover,),
            GestureDetector(
                onTap: () =>
                    pageController.nextPage(duration: duration, curve: curve),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.green,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/next.png",
                      width: 40,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
