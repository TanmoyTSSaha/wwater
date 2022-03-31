import 'package:flutter/material.dart';

//These are constants.

const wPrimaryColor = Color(0xFF0059D4);
const wSecondaryColor = Color(0xFF006BFF);

const double height10 = 10;

//These are pre-built BigText and SmallText

class bigText extends StatelessWidget {
  String text;
  double size;
  Color textColor;
  bigText({
    Key? key,
    required this.text,
    this.size = 30,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }
}

class smallText extends StatelessWidget {
  String text;
  double size;
  Color textColor;
  smallText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
      ),
    );
  }
}
