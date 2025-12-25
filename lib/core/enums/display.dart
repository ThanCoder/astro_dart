import 'package:astro_dart/core/styles/css_property.dart';

enum Display {
  block('block'),
  inline('inline'),
  flex('flex'),
  grid('grid'),
  none('none');

  final String css;
  const Display(this.css);
}

extension DisplayCssProperty on CssProperty {
  CssProperty display(Display value) => add('display', value.css);
}
