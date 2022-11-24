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
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;

  List<Angka>? angkaList;

  static List<String> angka = [
    '1 2 3',
    '4 5 6',
    '7 8 9',
    '10 11 12',
    '13 14 15',
    '16 17 18',
    '19 20',
  ];

  final List<Angka> listAngka =
      List.generate(angka.length, (index) => Angka(angka[index]));

  Future setLandscape() async {
    // hide overlays statusbar
    // ignore: deprecated_member_use
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable(); // keep device awake
  }

  @override
  void initState() {
    setLandscape();
    super.initState();
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
      backgroundsMenu,
      width: size.width,
      height: size.height,
      opacity: AlwaysStoppedAnimation(0.2),
    );
  }

  Widget buildIconBack() {
    return Positioned(
        top: 24,
        left: 24,
        child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/menu'),
            child: Image.asset(
              "assets/back.png",
              width: 40,
            )));
  }

  Widget buildTitlePage() {
    return Positioned.fill(
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  titleItem2.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Kid Games',
                      color: Colors.red),
                ))));
  }

  Widget buildItem(String namaAngka) {
    return Positioned.fill(
      left: 0,
      top: 100,
      bottom: 0,
      child: Column(
        children: [
          Row(
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white, border: Border.all(color: Colors.blue, width: 5)),
                child: Text(
                  namaAngka,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 160, fontWeight: FontWeight.bold),
                ),
              ),
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
          )
        ],
      ),
    );
  }
}
