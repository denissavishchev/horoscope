import 'package:flutter/material.dart';
import 'package:horoscope/main_page.dart';

import 'model.dart';

class SignTile extends StatelessWidget {
  final String imagePath;
  final int index;

  const SignTile({super.key, required this.imagePath, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        sign = index + 1;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      },
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Image.asset('assets/images/$imagePath.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Text(imagePath.substring(2),
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
