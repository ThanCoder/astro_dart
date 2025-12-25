import 'package:astro_dart/core/styles/css_property.dart';

enum FlexDirection {
  row('row'),
  column('column'),
  rowReverse('row-reverse'),
  columnReverse('column-reverse');

  final String css;
  const FlexDirection(this.css);
}

extension FlexDirectionCssProperty on CssProperty {
  CssProperty flexDirection(FlexDirection value) =>
      add('flex-direction', value.css);
}
