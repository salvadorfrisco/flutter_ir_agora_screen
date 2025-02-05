import 'package:flutter/material.dart';

class LowercaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LowercaseText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toLowerCase(),
      style: style,
      textAlign: textAlign,
    );
  }
}
