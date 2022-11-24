import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import '../models/p_warna_models.dart';
import '../utils/constants.dart';

class PWarnaPage extends StatefulWidget {
  const PWarnaPage({super.key});

  @override
  State<PWarnaPage> createState() => _PWarnaPageState();
}

class _PWarnaPageState extends State<PWarnaPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;

  List<Warna>? warnaList;

  static List<String> warna = [
    'Warna Kuning',
    'Warna Hitam',
    'Warna Biru',
    'Warna Coklat',
    'Warna Pink',
    'Warna Hijau',
    'Warna Abu-abu',
    'Warna Jingga',
    'Warna Ungu',
    'Warna Merah',
    'Warna Putih'
  ];

  static List<String> image = [
    'assets/pengenalan-warna/yellow.png',
    'assets/pengenalan-warna/black.png',
    'assets/pengenalan-warna/blue.png',
    'assets/pengenalan-warna/chocolate.png',
    'assets/pengenalan-warna/cream.png',
    'assets/pengenalan-warna/green.png',
    'assets/pengenalan-warna/grey.png',
    'assets/pengenalan-warna/orange.png',
    'assets/pengenalan-warna/purple.png',
    'assets/pengenalan-warna/red.png',
    'assets/pengenalan-warna/white.png'
  ];

  final List<Warna> listWarna =
      List.generate(warna.length, (index) => Warna(warna[index], image[index]));

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
          itemCount: listWarna.length,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {},
          itemBuilder: (context, i) {
            return Stack(
              children: [
                buildBackground(size),
                buildIconBack(),
                buildTitlePage(),
                buildItem(listWarna[i].nama, listWarna[i].image)
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
                  titleItem3.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Kid Games',
                      color: Colors.green),
                ))));
  }

  Widget buildItem(String nama, String image) {
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
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(image, width: 240,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        nama,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
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
