import 'package:flutter/material.dart';
import 'package:horoscope/main_page.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class SignTile extends StatelessWidget {
  final String imagePath;
  final int index;

  const SignTile({super.key, required this.imagePath, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          value.sign = index + 1;
          value.frameImage();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainPage();
          }));
        },
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                    offset: const Offset(0.8, 0.8),
                  ),
                ],
              ),
              child: Image.asset('assets/images/$imagePath.png'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                imagePath.substring(2),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    });
  }
}
