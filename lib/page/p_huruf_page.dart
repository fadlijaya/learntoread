import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learntoread/models/p_huruf_models.dart';
import 'package:wakelock/wakelock.dart';

import '../utils/constants.dart';

class PHurufPage extends StatefulWidget {
  const PHurufPage({super.key});

  @override
  State<PHurufPage> createState() => _PHurufPageState();
}

class _PHurufPageState extends State<PHurufPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;

  List<Huruf>? hurufList;

  static List<String> huruf = [
    'assets/pengenalan-huruf/HURUF-A.png',
    'assets/pengenalan-huruf/HURUF-B.png',
    'assets/pengenalan-huruf/HURUF-C.png',
    'assets/pengenalan-huruf/HURUF-D.png',
    'assets/pengenalan-huruf/HURUF-E.png',
    'assets/pengenalan-huruf/HURUF-F.png',
    'assets/pengenalan-huruf/HURUF-G.png',
    'assets/pengenalan-huruf/HURUF-H.png',
    'assets/pengenalan-huruf/HURUF-I.png',
    'assets/pengenalan-huruf/HURUF-J.png',
    'assets/pengenalan-huruf/HURUF-K.png',
    'assets/pengenalan-huruf/HURUF-L.png',
    'assets/pengenalan-huruf/HURUF-M.png',
    'assets/pengenalan-huruf/HURUF-N.png',
    'assets/pengenalan-huruf/HURUF-O.png',
    'assets/pengenalan-huruf/HURUF-P.png',
    'assets/pengenalan-huruf/HURUF-Q.png',
    'assets/pengenalan-huruf/HURUF-R.png',
    'assets/pengenalan-huruf/HURUF-S.png',
    'assets/pengenalan-huruf/HURUF-T.png',
    'assets/pengenalan-huruf/HURUF-U.png',
    'assets/pengenalan-huruf/HURUF-V.png',
    'assets/pengenalan-huruf/HURUF-W.png',
    'assets/pengenalan-huruf/HURUF-X.png',
    'assets/pengenalan-huruf/HURUF-Y.png',
    'assets/pengenalan-huruf/HURUF-Z.png',
  ];

  final List<Huruf> listHuruf =
      List.generate(huruf.length, (index) => Huruf(huruf[index]));

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
          itemCount: listHuruf.length,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {},
          itemBuilder: (context, i) {
            return Stack(
              children: [
                buildBackground(size),
                buildIconBack(),
                buildTitlePage(),
                buildItem(listHuruf[i].nama)
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
                  titleItem1.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Kid Games',
                      color: Colors.white),
                ))));
  }

  Widget buildItem(String namaHuruf) {
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
                    borderRadius: BorderRadius.circular(8),
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
            Image.asset(namaHuruf, fit: BoxFit.cover,),
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
