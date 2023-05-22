import 'package:flutter/material.dart';
import 'package:horoscope/sign_tile.dart';

import 'constants.dart';

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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 80,
                child: Center(child: Text('Trust?',
                  style: headerStyle)),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 550,
                child: GridView.builder(
                    itemCount: signs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10
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
        ),
      ),
    );
  }
}
