import 'package:flutter/material.dart';

const kAccent = Color(0xFFD03433); // blue: 0xFF428DFC
const kRadius = 20.0;
const kIconGrey = Color(0xFF9AA0A6);
Color kTextGrey = Colors.grey[700];
const kThemeColor = Colors.white;
const kThemeColorInverted = Colors.black;

ThemeData appTheme = ThemeData(
  canvasColor: Colors.transparent,
);

Container kDismissBackground(Alignment alignment) {
  return Container(
    color: Colors.redAccent,
    alignment: alignment,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'REMOVE',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
