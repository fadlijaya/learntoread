import 'package:flutter/material.dart';
import 'package:learntoread/page/kuis_page.dart';
import 'package:learntoread/utils/constants.dart';
import 'package:splash_view/splash_view.dart';

import 'page/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edu Kids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/menu': (_) => const MenuPage(),
        '/kuis': (_) => const KuisPage()
      },
      home: SplashView(
        done: Done(MenuPage(), animationDuration: Duration(seconds: 2), curve: Curves.easeInOut),
        logo: Image.asset(assetLogoAppSplashScreen, width: 90,),
        title: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: Text(titleApp.toUpperCase(), style: TextStyle(color: Colors.green, fontSize: 20, fontFamily: 'Kid Games'),),
        ),
        backgroundColor: Colors.white,
        loadingIndicator: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.green,),
      ),
    );
  }
}

