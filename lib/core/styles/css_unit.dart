import 'package:astro_dart/core/styles/css_property.dart';

sealed class CssUnit {
  const CssUnit(); // ⭐ အရေးကြီး
  String get css;
}

class Px extends CssUnit {
  final num value;
  const Px(this.value);
  @override
  String get css => '${value}px';
}

class Em extends CssUnit {
  final num value;
  const Em(this.value);
  @override
  String get css => '${value}em';
}

class Percent extends CssUnit {
  final num value;
  const Percent(this.value);
  @override
  String get css => '$value%';
}

extension CssUinitProperty on CssProperty {
  CssProperty fontSize(CssUnit value) => add('font-size', value.css);
  CssProperty cssWith(CssUnit value) => add('width', value.css);
  CssProperty cssHeight(CssUnit value) => add('height', value.css);
  CssProperty cssMaxWith(CssUnit value) => add('max-width', value.css);
  CssProperty cssMaxHeight(CssUnit value) => add('max-height', value.css);
  CssProperty cssMinWith(CssUnit value) => add('min-width', value.css);
  CssProperty cssMinHeight(CssUnit value) => add('min-height', value.css);
}
