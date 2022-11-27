import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learntoread/models/p_hijaiyah_models.dart';
import 'package:wakelock/wakelock.dart';

import '../utils/constants.dart';

class PHijaiyahPage extends StatefulWidget {
  const PHijaiyahPage({super.key});

  @override
  State<PHijaiyahPage> createState() => _PHijaiyahPageState();
}

class _PHijaiyahPageState extends State<PHijaiyahPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;

  List<Hijaiyah>? hijaiyahList;

  static List<String> nama = [
    'Alif',
    'Ba',
    'Ta',
    'Tsa',
    'Jim',
    'Ha',
    'Kho',
    'Dal',
    'Dzal',
    'Ro',
    'Za',
    'Sin',
    'Syin',
    'Shod',
    'Dho',
    'Tho',
    'Dzo',
    'Ain',
    'Ghain',
    'Fa',
    'Qof',
    'Kaf',
    'Lam',
    'Mim',
    'Nun',
    'Wa',
    'Hha',
    'Lam Alif',
    'Hamzah',
    'Ya'
  ];

  static List<String> image = [
    'assets/pengenalan-hijaiyyah/alif.png',
    'assets/pengenalan-hijaiyyah/ba.png',
    'assets/pengenalan-hijaiyyah/ta.png',
    'assets/pengenalan-hijaiyyah/tsa.png',
    'assets/pengenalan-hijaiyyah/ja.png',
    'assets/pengenalan-hijaiyyah/ha.png',
    'assets/pengenalan-hijaiyyah/kha.png',
    'assets/pengenalan-hijaiyyah/da.png',
    'assets/pengenalan-hijaiyyah/dza.png',
    'assets/pengenalan-hijaiyyah/ra.png',
    'assets/pengenalan-hijaiyyah/za.png',
    'assets/pengenalan-hijaiyyah/sa.png',
    'assets/pengenalan-hijaiyyah/sya.png',
    'assets/pengenalan-hijaiyyah/sho.png',
    'assets/pengenalan-hijaiyyah/dho.png',
    'assets/pengenalan-hijaiyyah/tho.png',
    'assets/pengenalan-hijaiyyah/zho.png',
    'assets/pengenalan-hijaiyyah/ain.png',
    'assets/pengenalan-hijaiyyah/ghain.png',
    'assets/pengenalan-hijaiyyah/fa.png',
    'assets/pengenalan-hijaiyyah/qho.png',
    'assets/pengenalan-hijaiyyah/ka.png',
    'assets/pengenalan-hijaiyyah/la.png',
    'assets/pengenalan-hijaiyyah/mim.png',
    'assets/pengenalan-hijaiyyah/nun.png',
    'assets/pengenalan-hijaiyyah/wa.png',
    'assets/pengenalan-hijaiyyah/him.png',
    'assets/pengenalan-hijaiyyah/lam.png',
    'assets/pengenalan-hijaiyyah/hamzah.png',
    'assets/pengenalan-hijaiyyah/ya.png',
  ];

  final List<Hijaiyah> listHijaiyah = List.generate(
      nama.length, (index) => Hijaiyah(nama[index], image[index]));

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
          itemCount: listHijaiyah.length,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {},
          itemBuilder: (context, i) {
            return Stack(
              children: [
                buildBackground(size),
                buildIconBack(),
                buildTitlePage(),
                buildItem(listHijaiyah[i].nama, listHijaiyah[i].image)
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
                borderRadius: BorderRadius.circular(8)
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
                  titleItem5.toUpperCase(),
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
                      borderRadius: BorderRadius.circular(8)),
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
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.green,
                  child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/next.png",
                        width: 40,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
