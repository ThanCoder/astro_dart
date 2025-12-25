import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';

sealed class PaddingValue {
  const PaddingValue();
  String get css;
}

class Padding extends PaddingValue {
  final CssUnit top, right, bottom, left;

  const Padding.all(CssUnit value)
    : top = value,
      right = value,
      bottom = value,
      left = value;

  // only (like EdgeInsets.fromLTRB)
  const Padding.only({
    this.top = const Px(0),
    this.right = const Px(0),
    this.bottom = const Px(0),
    this.left = const Px(0),
  });

  // vertical (Flutter EdgeInsets.symmetric vertical)
  const Padding.vertical(CssUnit value)
    : top = value,
      bottom = value,
      left = const Px(0),
      right = const Px(0);

  // horizontal (Flutter EdgeInsets.symmetric horizontal)
  const Padding.horizontal(CssUnit value)
    : left = value,
      right = value,
      top = const Px(0),
      bottom = const Px(0);

  // symmetric (Flutter EdgeInsets.symmetric)
  const Padding.symmetric({
    CssUnit vertical = const Px(0),
    CssUnit horizontal = const Px(0),
  }) : top = vertical,
       bottom = vertical,
       left = horizontal,
       right = horizontal;

  @override
  String get css => '${top.css} ${right.css} ${bottom.css} ${left.css}';
}

extension PaddingCssProperty on CssProperty {
  CssProperty padding(Padding value) => add('padding', value.css);
}
