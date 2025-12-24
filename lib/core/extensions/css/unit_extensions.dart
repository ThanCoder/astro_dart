import 'package:astro_dart/core/styles/css_unit.dart';

extension DoubleUnitExtensions on double {
  CssUnit get px => Px(this);
  CssUnit get em => Em(this);
  CssUnit get percent => Percent(this);
}

extension IntUnitExtensions on int {
  CssUnit get px => Px(this);
  CssUnit get em => Em(this);
  CssUnit get percent => Percent(this);
}
