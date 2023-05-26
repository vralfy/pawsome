import 'package:flutter/material.dart';
import 'package:p6_ui/padding/padding.dart';
import 'package:p6_ui/widget.dart';

class Headline1 extends P6StatelessWidget {
  final String text;
  final double fontSizeFactor;
  final bool bold;

  const Headline1({
    Key? key,
    this.text = 'h1',
    this.fontSizeFactor = 1.4,
    this.bold = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: Text(
        tr(text),
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: configuration.fontSize * fontSizeFactor,
        ),
      ),
    );
  }
}

class Headline2 extends Headline1 {
  const Headline2({
    Key? key,
    text = 'h2',
  }) : super(key: key, text: text, fontSizeFactor: 1.2);
}

class Headline3 extends Headline1 {
  const Headline3({
    Key? key,
    text = 'h3',
  }) : super(key: key, text: text, fontSizeFactor: 1.15);
}

class Headline4 extends Headline1 {
  const Headline4({
    Key? key,
    text = 'h4',
  }) : super(key: key, text: text, fontSizeFactor: 1.1, bold: false);
}

class Headline5 extends Headline1 {
  const Headline5({
    Key? key,
    text = 'h5',
  }) : super(key: key, text: text, fontSizeFactor: 1.05, bold: false);
}

class Headline6 extends Headline1 {
  const Headline6({
    Key? key,
    text = 'h6',
  }) : super(key: key, text: text, fontSizeFactor: 1.0, bold: false);
}
