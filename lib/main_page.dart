import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
                      : Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.horoscope.toString()),
                              ],
                            ),
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
