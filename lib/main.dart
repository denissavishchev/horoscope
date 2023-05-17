import 'package:flutter/material.dart';
import 'package:horoscope/model.dart';
import 'package:horoscope/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Data(),
          builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              home: StartPage());
          });

  }
}
