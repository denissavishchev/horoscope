import 'package:flutter/material.dart';
import 'package:horoscope/constants.dart';
import 'package:horoscope/start_page.dart';
import 'package:provider/provider.dart';
import 'date_button.dart';
import 'model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key, required this.imageName}) : super(key: key);

  final pattern = RegExp(r'[<p><strong></p></strong>&b;]');
  final patternText = RegExp(r'<br>');
  String imageName = '';

  @override
  Widget build(BuildContext context) {
    context.read<Data>().fetchData;
    return Consumer<Data>(builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/${value.image}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await value.initialValues();
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return StartPage();
                                  }));
                        },
                        icon: const Icon(
                          Icons.backspace_outlined,
                          color: Colors.white,
                        )),
                    Text(
                      imageName.substring(2),
                      style: headerStyle.copyWith(fontSize: 38),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              value.horoscope == null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                    child: Center(child: SpinKitSpinningLines(color: value.color, size: 150.0)),
                  )
                  : value.error
                      ? Text(
                          'Something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(value.horoscope.toString().substring(
                                              value.horoscope.toString().indexOf('<p>'),
                                              value.horoscope.toString().indexOf('</strong>'))
                                          .replaceAllMapped(pattern, (match) => '')
                                      .replaceAll('-', ' - '),
                                      style: textStyle,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(value.day == 'monthly'
                                           ? value.horoscope.toString().substring(
                                            value.horoscope.toString().indexOf('Standout days'),
                                            value.horoscope.toString().indexOf('Challenging days'))
                                        .replaceAll('<br>', '')
                                        : '', style: textStyle.copyWith(fontSize: 16)),
                                        Text(value.day == 'monthly'
                                            ? value.horoscope.toString().substring(
                                            value.horoscope.toString().indexOf('Challenging days'),
                                            value.horoscope.toString().indexOf('</p>'))
                                            .replaceAll('<br>', '')
                                            : '', style: textStyle.copyWith(fontSize: 16)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                child: SingleChildScrollView(
                                  child: Text(value.day == 'monthly'
                                      ? value.horoscope.toString().substring(
                                      value.horoscope.toString().indexOf(' -'),
                                      value.horoscope
                                          .toString()
                                          .indexOf('<a style'))
                                      .replaceAllMapped(patternText, (match) => '')
                                      + value.horoscope.toString().substring(
                                          value.horoscope.toString().indexOf('</a>'),
                                          value.horoscope
                                              .toString()
                                              .indexOf('Standout days'))
                                          .replaceAllMapped(patternText, (match) => '')
                                  .replaceAll('</a>', ' ')
                                    : value.horoscope.toString().substring(
                                        value.horoscope.toString().indexOf(' -'),
                                        value.horoscope
                                            .toString()
                                            .indexOf('</p>'))
                                        .replaceAllMapped(patternText, (match) => ''),
                                    style: textStyle.copyWith(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DateButton(
                                date: 'Yesterday',
                                onTap: () {
                                  value.setButtons(Buttons.yesterday);
                                  value.setDate('daily-yesterday');
                                },
                              ),
                              DateButton(
                                date: 'Today',
                                onTap: () {
                                  value.setButtons(Buttons.today);
                                  value.setDate('daily-today');
                                },
                              ),
                              DateButton(
                                date: 'Tomorrow',
                                onTap: () {
                                  value.setButtons(Buttons.tomorrow);
                                  value.setDate('daily-tomorrow');
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DateButton(
                                date: 'Week',
                                onTap: () {
                                  value.setButtons(Buttons.week);
                                  value.setDate('weekly');
                                },
                              ),
                              DateButton(
                                date: 'Month',
                                onTap: () {
                                  value.setButtons(Buttons.month);
                                  value.setDate('monthly');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
