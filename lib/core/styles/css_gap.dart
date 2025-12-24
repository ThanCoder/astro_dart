import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/styles/css_unit.dart';

sealed class CssGap {
  const CssGap();
  String get css; // final CSS value
}

// single value (shorthand: gap: 10px;)
class Gap extends CssGap {
  final CssUnit value;
  const Gap(this.value);

  @override
  String get css => value.css;
}

// row + column separate
class RowColumnGap extends CssGap {
  final CssUnit row;
  final CssUnit column;

  const RowColumnGap({required this.row, required this.column});

  @override
  String get css => '$row $column';
}

extension CssGapProperty on CssProperty {
  // shorthand: gap
  CssProperty gap(CssUnit value) => add('gap', value.css);

  // row-gap
  CssProperty rowGap(CssUnit value) => add('row-gap', value.css);

  // column-gap
  CssProperty columnGap(CssUnit value) => add('column-gap', value.css);
}
