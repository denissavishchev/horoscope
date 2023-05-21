import 'package:flutter/material.dart';
import 'package:horoscope/start_page.dart';
import 'package:provider/provider.dart';
import 'date_button.dart';
import 'model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final pattern = RegExp(r'[<p><strong></p></strong>]');

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
          body: value.horoscope == null || value.error
              ? SpinKitSpinningLines(color: value.color, size: 150.0)
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
                            height: 20,
                          ),
                          IconButton(
                              onPressed: () {
                                value.initialValues();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return StartPage();
                                }));
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            value.horoscope
                                .toString()
                                .substring(
                                    value.horoscope.toString().indexOf('<p>'),
                                    value.horoscope
                                        .toString()
                                        .indexOf('</strong>'))
                                .replaceAllMapped(pattern, (match) => ''),
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: SingleChildScrollView(
                              child: Text(
                                value.horoscope.toString().substring(
                                    value.horoscope.toString().indexOf('-'),
                                    value.horoscope
                                        .toString()
                                        .indexOf('</p>')),
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DateButton(
                                    date: 'Yesterday',
                                    onTap: () {
                                      value.setDate('daily-yesterday');
                                    },
                                  ),
                                  DateButton(
                                    date: 'Today',
                                    onTap: () {
                                      value.setDate('daily-today');
                                    },
                                  ),
                                  DateButton(
                                    date: 'Tomorrow',
                                    onTap: () {
                                      value.setDate('daily-tomorrow');
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DateButton(
                                    date: 'Week',
                                    onTap: () {
                                      value.setDate('weekly');
                                    },
                                  ),
                                  DateButton(
                                    date: 'Month',
                                    onTap: () {
                                      value.setDate('monthly');
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
        ),
      );
    });
  }
}
