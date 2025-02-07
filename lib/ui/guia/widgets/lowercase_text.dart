import 'package:flutter/material.dart';

class LowercaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool? softWrap;

  const LowercaseText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toLowerCase(),
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
