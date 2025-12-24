// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/styles/css_unit.dart';

sealed class BorderRadiusValue {
  const BorderRadiusValue();

  String get css;
}

class Radius extends BorderRadiusValue {
  final CssUnit value;
  Radius({required this.value});

  @override
  String get css => value.css;
}

class BorderRadius extends BorderRadiusValue {
  final CssUnit topLeft;
  final CssUnit topRight;
  final CssUnit bottomRight;
  final CssUnit bottomLeft;

  const BorderRadius.all(CssUnit value)
    : topLeft = value,
      topRight = value,
      bottomLeft = value,
      bottomRight = value;

  const BorderRadius.only({
    required this.topLeft,
    required this.topRight,
    required this.bottomRight,
    required this.bottomLeft,
  });

  @override
  String get css =>
      '${topLeft.css} ${topRight.css} ${bottomRight.css} ${bottomLeft.css}';
}
