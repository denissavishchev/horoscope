import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    Key? key,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  final String date;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, value, child) {
      return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          curve: Curves.easeInQuint,
          duration: const Duration(milliseconds: 350),
          width: 100,
          height: 40,
          decoration: BoxDecoration(
              gradient: buttons.toString() != 'Buttons.${date.toLowerCase()}'
                  ? LinearGradient(
                      colors: [value.color, value.color.withOpacity(0.2)],
                      stops: const [0.1, 0.8],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)
                  : null,
              color: buttons.toString() == 'Buttons.${date.toLowerCase()}'
                  ? Colors.transparent
                  : value.color.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border:
                  Border.all(color: Colors.white.withOpacity(0.7), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: buttons.toString() != 'Buttons.${date.toLowerCase()}'
                      ? value.color.withOpacity(0.7)
                      : Colors.transparent,
                  blurRadius: 8,
                  offset: const Offset(-3, -2),
                ),
              ]),
          child: Center(
            child: Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      );
    });
  }
}
