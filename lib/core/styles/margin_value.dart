import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';

sealed class MarginValue {
  const MarginValue();
  String get css;
}

class Margin extends MarginValue {
  final CssUnit top, right, bottom, left;

  const Margin.all(CssUnit value)
    : top = value,
      right = value,
      bottom = value,
      left = value;

  // only (like EdgeInsets.fromLTRB)
  const Margin.only({
    this.top = const Px(0),
    this.right = const Px(0),
    this.bottom = const Px(0),
    this.left = const Px(0),
  });

  // vertical (Flutter EdgeInsets.symmetric vertical)
  const Margin.vertical(CssUnit value)
    : top = value,
      bottom = value,
      left = const Px(0),
      right = const Px(0);

  // horizontal (Flutter EdgeInsets.symmetric horizontal)
  const Margin.horizontal(CssUnit value)
    : left = value,
      right = value,
      top = const Px(0),
      bottom = const Px(0);

  // symmetric (Flutter EdgeInsets.symmetric)
  const Margin.symmetric({
    CssUnit vertical = const Px(0),
    CssUnit horizontal = const Px(0),
  }) : top = vertical,
       bottom = vertical,
       left = horizontal,
       right = horizontal;

  @override
  String get css => '${top.css} ${right.css} ${bottom.css} ${left.css}';
}

extension MarginCssProperty on CssProperty {
  CssProperty margin(Margin value) => add('margin', value.css);
}
