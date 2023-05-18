import 'package:flutter/material.dart';
import 'package:horoscope/start_page.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final pattern = RegExp(r'[<p><strong></p></strong>]');

  @override
  Widget build(BuildContext context) {
    context.read<Data>().fetchData;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(
          child: Consumer<Data>(
            builder: (context, value, child) {
              return value.horoscope == null || value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.white,
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
                              Text(value.horoscope
                                  .toString()
                                  .substring(
                                      value.horoscope.toString().indexOf('<p>'),
                                      value.horoscope
                                          .toString()
                                          .indexOf('</strong>'))
                                  .replaceAllMapped(pattern, (match) => ''),
                                style: const TextStyle(fontSize: 22),),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: SingleChildScrollView(
                                  child: Text(value.horoscope
                                      .toString()
                                      .substring(
                                          value.horoscope
                                              .toString()
                                              .indexOf('-'),
                                          value.horoscope
                                              .toString()
                                              .indexOf('</p>')),
                                    style: const TextStyle(fontSize: 18),),
                                ),
                              ),
                            ],
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
