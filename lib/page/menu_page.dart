import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learntoread/page/kuis_page.dart';
import 'package:learntoread/page/p_angka_page.dart';
import 'package:learntoread/page/p_huruf_page.dart';
import 'package:learntoread/page/p_warna_page.dart';
import 'package:wakelock/wakelock.dart';

import '../utils/constants.dart';
import 'p_hewan_page.dart';
import 'p_hijaiyah_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
        child: Stack(
          children: [buildBackground(size), buildTitlePage(), buildIconExit(), buildItem()],
        ),
      ),
    );
  }

  Widget buildBackground(Size size) {
    return Image.asset(
      backgroundsMenu,
      width: size.width,
      height: size.height,
    );
  }

  Widget buildTitlePage() {
    return Positioned.fill(
        left: 24,
        top: 24,
        bottom: 0,
        child: Text(
          titleApp.toUpperCase(),
          style: const TextStyle(fontSize: 60, fontFamily: 'Kid Games'),
        ));
  }

  Widget buildIconExit() {
    return Positioned(
        top: 24,
        right: 24,
        child: GestureDetector(
            onTap: () => SystemNavigator.pop(), child: Image.asset("assets/log-out.png", width: 36,)));
  }

  Widget buildItem() {
    return Positioned.fill(
      top: 90,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2.15,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PHurufPage())),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon1.png",
                      width: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titleItem1,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PAngkaPage())),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon2.jpg",
                      width: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titleItem2,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PWarnaPage())),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon3.jpg",
                      width: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titleItem3,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PHewanPage())),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon4.png",
                      width: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titleItem4,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PHijaiyahPage())),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon5.jpg",
                      width: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titleItem5,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => KuisPage())),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon6.png",
                      width: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titleItem6,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
