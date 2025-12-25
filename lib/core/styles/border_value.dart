import 'package:astro_dart/core/enums/css_named_color.dart';
import 'package:astro_dart/core/styles/css_color.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';

enum BorderStyle {
  none('none'),
  solid('solid'),
  dashed('dashed'),
  dotted('dotted'),
  double_('double');

  final String css;
  const BorderStyle(this.css);
}

sealed class BorderValue {
  const BorderValue();
  String get css;
}

class Border extends BorderValue {
  final CssUnit width;
  final BorderStyle style;
  final CssColor color;

  const Border.all({
    this.color = const NamedColor(name: CssNamedColor.black),
    this.style = BorderStyle.solid,
    this.width = const Px(1),
  });

  @override
  String get css => '${width.css} ${style.css} ${color.css}';
}

extension BorderCssProperty on CssProperty {
  CssProperty border(BorderValue value) => add('border', value.css);
}
