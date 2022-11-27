import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import '../models/p_hewan_models.dart';
import '../models/p_warna_models.dart';
import '../utils/constants.dart';

class PHewanPage extends StatefulWidget {
  const PHewanPage({super.key});

  @override
  State<PHewanPage> createState() => _PHewanPageState();
}

class _PHewanPageState extends State<PHewanPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;

  List<Hewan>? hewanList;

  static List<String> hewan = [
    'Kucing',
    'Ayam',
    'Sapi',
    'Kepiting',
    'Anjing',
    'Lumba-lumba',
    'Gajah',
    'Kuda',
    'Singa',
    'Babi',
  ];

  static List<String> image = [
    'assets/pengenalan-hewan/cat.png',
    'assets/pengenalan-hewan/chicken.png',
    'assets/pengenalan-hewan/cow.png',
    'assets/pengenalan-hewan/crab.png',
    'assets/pengenalan-hewan/dog.png',
    'assets/pengenalan-hewan/dolphin.png',
    'assets/pengenalan-hewan/elephant.png',
    'assets/pengenalan-hewan/horse.png',
    'assets/pengenalan-hewan/lion.png',
    'assets/pengenalan-hewan/pig.png'
  ];

  final List<Hewan> listHewan =
      List.generate(hewan.length, (index) => Hewan(hewan[index], image[index]));

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
          itemCount: listHewan.length,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {},
          itemBuilder: (context, i) {
            return Stack(
              children: [
                buildBackground(size),
                buildIconBack(),
                buildTitlePage(),
                buildItem(listHewan[i].nama, listHewan[i].image)
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
                  titleItem4.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Kid Games',
                      color: Colors.white),
                ))));
  }

  Widget buildItem(String nama, String image) {
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
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, width: 220,)),
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
