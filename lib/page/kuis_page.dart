import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learntoread/models/kuis_models.dart';
import 'package:learntoread/utils/constants.dart';
import 'package:wakelock/wakelock.dart';

KuisTebakGambar kuisTebakGambar = KuisTebakGambar();

class KuisPage extends StatefulWidget {
  const KuisPage({super.key});

  @override
  State<KuisPage> createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  late Timer timer;
  int maxSeconds = 120;
  int skor = 0;
  double rating = 0;

  cekJawaban(bool userPilihJawaban) {
    bool jawabanBenar1 = kuisTebakGambar.getAnswer1();
    bool jawabanBenar2 = kuisTebakGambar.getAnswer2();
    bool jawabanBenar3 = kuisTebakGambar.getAnswer3();
    setState(() {
      if (kuisTebakGambar.isFinished() == true) {
        Future.delayed(const Duration(seconds: 1), () {
          endQuiz();
        });
        stopTimer();
        kuisTebakGambar.reset();
      } else {
        if (userPilihJawaban == jawabanBenar1 || jawabanBenar2 || jawabanBenar3) {
          Fluttertoast.showToast(
              msg: 'Benar',
              fontSize: 24.0,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.green);
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

        Future.delayed(Duration(seconds: 1), () => kuisTebakGambar.nextQuestion());
      }
    });
  }

  endQuiz() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Stack(
              children: [
                SvgPicture.asset("assets/frame-kuis.svg", width: 240,),
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
                            return Icon(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text("Total Nilai", style: TextStyle(fontSize: 20),),
                      ),
                      Text(
                        "$skor",
                        style: TextStyle(fontSize: 60),
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
                            onTap: () => Navigator.pushNamed(context, '/menu'),
                            child: SvgPicture.asset("assets/button-menu.svg", width: 60,)),
                        SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/kuis'),
                            child: SvgPicture.asset("assets/button-ulangi.svg", width: 60,))
                      ],
                    ))
              ],
            ),
          );
        });
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [buildBackground(), buildListItem(size)],
        ),
      ),
    );
  }

  Widget buildBackground() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          backgroundsMenu,
          fit: BoxFit.cover,
        ),
      ),
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
          child: Image.asset("assets/back.png", width: 40,)),
    );
  }

  Widget buildTimer() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(top: 24, left: 60),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/timer.png", width: 24,),
          Text(
            '$maxSeconds',
            style: TextStyle(fontSize: 24, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget buildSkor() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(top: 24, right: 60),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.green),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/accept.png", width: 24,),
          Text(
            '$skor',
            style: TextStyle(fontSize: 24, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget buildListItem(Size size) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
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
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Image.asset(
                        kuisTebakGambar.getImage(),
                        width: 140,
                        height: 140,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        checkingAnswer(kuisTebakGambar.getQuestion1(), kuisTebakGambar.getAnswer1()),
                        checkingAnswer(kuisTebakGambar.getQuestion2(), kuisTebakGambar.getAnswer2()),
                        checkingAnswer(kuisTebakGambar.getQuestion3(), kuisTebakGambar.getAnswer3()),
                      ],
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.orange, width: 5),
          color: Colors.white),
      child: TextButton(
          onPressed: () => cekJawaban(trueOrFalse),
          child: Text(
            correctOrWrong,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
