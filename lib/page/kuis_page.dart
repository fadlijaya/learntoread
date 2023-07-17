import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learntoread/models/kuis_models.dart';
import 'package:learntoread/utils/constants.dart';

KuisTebakGambar kuisTebakGambar = KuisTebakGambar();

class KuisPage extends StatefulWidget {
  const KuisPage({super.key});

  @override
  State<KuisPage> createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  late Timer timer;
  int maxSeconds = 120;
  int skor = 0;
  double rating = 0;
  bool isPlaying = true;

  cekJawaban(bool userPilihJawaban) {
    //bool jawabanBenar1 = kuisTebakGambar.getAnswer1();
    //bool jawabanBenar2 = kuisTebakGambar.getAnswer2();
    //bool jawabanBenar3 = kuisTebakGambar.getAnswer3();
    setState(() {
      if (userPilihJawaban == true) {
        Fluttertoast.showToast(
            msg: 'Benar',
            fontSize: 24.0,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green);
        assetsAudioPlayer.open(Audio("audio/kuis/benar.mp3"));
        setState(() {
          skor = skor + 10;
          rating = rating + 0.5;
        });
      } else {
        Fluttertoast.showToast(
            msg: 'Salah',
            fontSize: 24.0,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red);
        assetsAudioPlayer.open(Audio("audio/kuis/salah.mp3"));
        if (skor == 0) {
          setState(() {
            skor = skor - 0;
          });
        } else {
          setState(() {
            skor = skor - 5;
            rating = rating - 0.25;
          });
        }
      }

      if (kuisTebakGambar.isFinished() == true) {
        Future.delayed(const Duration(seconds: 2), () {
          endQuiz();
          stopTimer();
          kuisTebakGambar.reset();
        });
      } else {
        Future.delayed(
            const Duration(seconds: 1), () => kuisTebakGambar.nextQuestion());
      }
    });

    /*setState(() {
      if (kuisTebakGambar.isFinished() == true) {
        Future.delayed(const Duration(seconds: 1), () {
          endQuiz();
          stopTimer();
          kuisTebakGambar.reset();
        });
      } else {
        if (userPilihJawaban == true) {
          Fluttertoast.showToast(
              msg: 'Benar',
              fontSize: 24.0,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.green);
          assetsAudioPlayer.open(Audio("audio/kuis/benar.mp3"));
          setState(() {
            skor = skor + 10;
            rating = rating + 0.5;
          });
        } else {
          Fluttertoast.showToast(
              msg: 'Salah',
              fontSize: 24.0,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red);
          assetsAudioPlayer.open(Audio("audio/kuis/salah.mp3"));
          if (skor == 0) {
            setState(() {
              skor = skor - 0;
            });
          } else {
            setState(() {
              skor = skor - 5;
              rating = rating - 0.25;
            });
          }
        }

        Future.delayed(
            const Duration(seconds: 1), () => kuisTebakGambar.nextQuestion());
      }
    });*/
  }

  endQuiz() {
    assetsAudioPlayer.open(
      Audio("audio/congrats.mp3"),
      loopMode: LoopMode.single,
      showNotification: false,
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Stack(
              children: [
                SvgPicture.asset(
                  "assets/frame-kuis.svg",
                  width: 240,
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    child: Column(
                      children: [
                        RatingBar.builder(
                          initialRating: rating,
                          minRating: 0,
                          maxRating: 5,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return const Icon(
                              Icons.star,
                              color: Colors.orange,
                            );
                          },
                          onRatingUpdate: (rating) {
                            Text("$rating");
                          },
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Total Nilai",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        "$skor",
                        style: const TextStyle(fontSize: 60),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                assetsAudioPlayer.stop();
                              });
                              Navigator.pushNamed(context, '/menu');
                            },
                            child: SvgPicture.asset(
                              "assets/button-menu.svg",
                              width: 60,
                            )),
                        const SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                assetsAudioPlayer.stop();
                              });
                              Navigator.pushNamed(context, '/kuis');
                              kuisTebakGambar.reset();
                            },
                            child: SvgPicture.asset(
                              "assets/button-ulangi.svg",
                              width: 60,
                            ))
                      ],
                    ))
              ],
            ),
          );
        });
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (maxSeconds > 0) {
        if (!mounted) return;
        setState(() {
          maxSeconds--;
        });
      } else {
        stopTimer();
        endQuiz();
      }
    });
  }

  stopTimer() {
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startTimer();
    }
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
          children: [buildBackground(size), buildListItem(size)],
        ),
      ),
    );
  }

  Widget buildBackground(Size size) {
    return Image.asset(
      backgroundsKuisPage,
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
      opacity: const AlwaysStoppedAnimation(0.7),
    );
  }

  Widget buildIconBack() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24),
      child: GestureDetector(
          onTap: () {
            stopTimer();
            Navigator.pushNamed(context, '/menu');
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 5,
            shadowColor: Colors.black,
            child: Container(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/back.png",
                  width: 40,
                )),
          )),
    );
  }

  Widget buildTimer() {
    return Card(
      margin: const EdgeInsets.only(top: 24, left: 60),
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 7,
      shadowColor: Colors.black,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/timer.png",
              width: 24,
            ),
            Text(
              '$maxSeconds',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSkor() {
    return Card(
      margin: const EdgeInsets.only(top: 24, right: 60),
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 7,
      shadowColor: Colors.black,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/accept.png",
              width: 24,
            ),
            Text(
              '$skor',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListItem(Size size) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildIconBack(),
              buildTimer(),
              const Spacer(),
              buildSkor()
            ],
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AudioWidget.assets(
                      play: isPlaying,
                      path: kuisTebakGambar.getAudioQuestion(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          checkingAnswer(
                            kuisTebakGambar.getQuestion1(),
                            kuisTebakGambar.getAnswer1(),
                          ),
                          checkingAnswer(
                            kuisTebakGambar.getQuestion2(),
                            kuisTebakGambar.getAnswer2(),
                          ),
                          checkingAnswer(
                            kuisTebakGambar.getQuestion3(),
                            kuisTebakGambar.getAnswer3(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget checkingAnswer(String correctOrWrong, bool trueOrFalse) {
    return TextButton(
        onPressed: () => cekJawaban(trueOrFalse),
        child: Image.asset(correctOrWrong, width: 160,));
  }
}
