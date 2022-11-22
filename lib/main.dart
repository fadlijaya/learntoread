import 'package:flutter/material.dart';
import 'package:learntoread/page/kuis_page.dart';

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
        '/menu': (_) => MenuPage(),
        '/kuis': (_) => KuisPage()
      },
      home: const MenuPage(),
    );
  }
}