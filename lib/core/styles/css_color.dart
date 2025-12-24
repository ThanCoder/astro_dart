import 'package:astro_dart/core/enums/css_named_color.dart';

sealed class CssColor {
  const CssColor();
  String get css;
}

class NamedColor extends CssColor {
  final CssNamedColor name;
  const NamedColor({required this.name});
  @override
  String get css => name.css;
}

class RbgColor extends CssColor {
  final int r, g, b;
  final double? a; // 0.0 - 1.0

  const RbgColor({required this.r, required this.g, required this.b})
    : a = null;
  const RbgColor.a({
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });
  @override
  String get css {
    if (a == null) {
      return 'rgb($r, $g, $b)';
    }
    return 'rgba($r, $g, $b, $a)';
  }
}

class HexColor extends CssColor {
  final int value; // 0xRRGGBB

  const HexColor(this.value);

  @override
  String get css => '#${value.toRadixString(16).padLeft(6, '0')}';
}

class HslColor extends CssColor {
  final int h; // 0-360
  final int s; // 0-100
  final int l; // 0-100
  final double? a;

  const HslColor({required this.h, required this.s, required this.l})
    : a = null;
  const HslColor.a({required this.h, required this.s, required this.l, this.a});

  @override
  String get css {
    if (a == null) {
      return 'hsl($h, $s%, $l%)';
    }
    return 'hsla($h, $s%, $l%, $a)';
  }
}

class CssMaterialColor extends CssColor {
  final Map<int, String> shades;
  final int _shade;

  const CssMaterialColor(this.shades, [this._shade = 500]);

  CssMaterialColor shade(int value) => CssMaterialColor(shades, value);

  CssMaterialColor get shade50 => shade(50);
  CssMaterialColor get shade100 => shade(100);
  CssMaterialColor get shade200 => shade(200);
  CssMaterialColor get shade300 => shade(300);
  CssMaterialColor get shade400 => shade(400);
  CssMaterialColor get shade500 => shade(500);
  CssMaterialColor get shade600 => shade(600);
  CssMaterialColor get shade700 => shade(700);
  CssMaterialColor get shade800 => shade(800);
  CssMaterialColor get shade900 => shade(900);

  @override
  String get css => shades[_shade]!;
}
