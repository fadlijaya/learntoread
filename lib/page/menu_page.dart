import 'package:assets_audio_player/assets_audio_player.dart';
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
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool _isPlaying = true;

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
        child: Stack(
          children: [
            buildBackground(),
            buildTitlePage(),
            buildAudio(),
            buildIconExit(),
            buildItem()
          ],
        ),
      ),
    );
  }

  Widget buildBackground() {
    return Image.asset(
      backgroundsMenu,
      width: double.maxFinite,
      fit: BoxFit.cover,
      opacity: AlwaysStoppedAnimation(0.7),
    );
  }

  Widget buildTitlePage() {
    return Positioned.fill(
        left: 16,
        top: 24,
        bottom: 0,
        child: Text(
          titleApp.toUpperCase(),
          style: const TextStyle(fontSize: 48, fontFamily: 'Kid Games', color: Colors.green),
        ));
  }

  Widget buildAudio() {
    return Positioned(
        top: 24,
        right: 90,
        child: AudioWidget.assets(
            play: _isPlaying,
            path: "audio/backsound.mp3",
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              },
              child: Image.asset(
                _isPlaying ? "assets/enable.png" : "assets/disable.png",
                width: 36,
              ),
            )));
  }

  Widget buildIconExit() {
    return Positioned(
        top: 24,
        right: 24,
        child: GestureDetector(
            onTap: () => SystemNavigator.pop(),
            child: Image.asset(
              "assets/log-out.png",
              width: 36,
            )));
  }

  Widget buildItem() {
    return Positioned.fill(
      top: 90,
      left: 16,
      right: 16,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2.15,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = false;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PHurufPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.red,
                elevation: 7,
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icon1.png",
                        width: 120,
                      ),
                      Flexible(child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(titleItem1.toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: 'Kid Games', fontSize: 12),),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = false;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PAngkaPage())); 
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Colors.yellow,
                elevation: 7,
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icon2.png",
                        width: 90,
                      ),
                       Flexible(child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(titleItem2.toUpperCase(), style: TextStyle(color: Colors.orange, fontFamily: 'Kid Games', fontSize: 12),),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                 _isPlaying = false;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PWarnaPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Colors.green,
                elevation: 7,
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icon3.png",
                        width: 112,
                      ),
                      Flexible(child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(titleItem3.toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: 'Kid Games', fontSize: 12),),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = false;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PHewanPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Colors.blue,
                elevation: 7,
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icon4.png",
                        width: 90,
                      ),
                      Flexible(child: Text(titleItem4.toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: 'Kid Games', fontSize: 12),))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = false;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PHijaiyahPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Colors.pink,
                elevation: 7,
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icon5.png",
                        width: 80,
                      ),
                      Flexible(child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(titleItem5.toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: 'Kid Games', fontSize: 12),),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = false;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const KuisPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Colors.orange,
                elevation: 7, 
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icon6.png",
                        width: 60,
                      ),
                      Flexible(child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(titleItem6.toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: 'Kid Games', fontSize: 12),),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
