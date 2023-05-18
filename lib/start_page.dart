import 'package:flutter/material.dart';
import 'package:horoscope/sign_tile.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  List signs = [
    '01Aries',
    '02Taurus',
    '03Gemini',
    '04Cancer',
    '05Leo',
    '06Virgo',
    '07Libra',
    '08Scorpio',
    '09Sagittarius',
    '10Capricorn',
    '11Aquarius',
    '12Pisces',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 550,
            color: Colors.white60,
            child: GridView.builder(
                itemCount: signs.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8
                    ),
                itemBuilder: (context, index) {
                  return SignTile(
                    imagePath: signs[index], index: index,
                  );
                }),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
