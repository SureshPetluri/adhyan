import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(this.data,
      {super.key,
      this.fontSize = 14,
      this.overFlow = TextOverflow.ellipsis,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal});

  final String data;
  final double fontSize;
  final Color color;
  final TextOverflow overFlow;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,

      style: TextStyle(
        overflow: overFlow,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      // softWrap: false,
      overflow: TextOverflow.fade,
      textScaler: const TextScaler.linear(1.0),
    );
  }
}
