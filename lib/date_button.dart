import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
   const DateButton({Key? key, required this.date, required this.onTap,}) : super(key: key);

   final String date;
   final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(date));
  }
}