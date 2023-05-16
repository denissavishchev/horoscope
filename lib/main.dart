import 'package:flutter/material.dart';
import 'package:horoscope/model.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Data(),
          builder: (context, child) => const MainPage()),
    );
  }
}
