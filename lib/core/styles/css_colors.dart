import 'package:astro_dart/core/enums/css_named_color.dart';
import 'package:astro_dart/core/styles/css_color.dart';

class CssColors {
  const CssColors._();

  static const red = CssMaterialColor({
    50: '#ffebee',
    100: '#ffcdd2',
    200: '#ef9a9a',
    300: '#e57373',
    400: '#ef5350',
    500: '#f44336',
    600: '#e53935',
    700: '#d32f2f',
    800: '#c62828',
    900: '#b71c1c',
  });

  static const redAccent = CssMaterialColor({
    100: '#FF8A80',
    200: '#FF5252',
    400: '#FF1744',
    700: '#D50000',
  });

  static const pink = CssMaterialColor({
    50: '#FCE4EC',
    100: '#F8BBD0',
    200: '#F48FB1',
    300: '#F06292',
    400: '#EC407A',
    500: ' #E91E63',
    600: '#D81B60',
    700: '#C2185B',
    800: '#AD1457',
    900: '#880E4F',
  });

  static const black = NamedColor(name: CssNamedColor.black);
  static const white = NamedColor(name: CssNamedColor.white);
  static const blue = NamedColor(name: CssNamedColor.blue);
  static const gray = NamedColor(name: CssNamedColor.gray);
  static const green = NamedColor(name: CssNamedColor.green);
  static const yellow = NamedColor(name: CssNamedColor.yellow);

  static const transparent = NamedColor(name: CssNamedColor.transparent);
  static CssColor namedColor(CssNamedColor name) => NamedColor(name: name);
  static CssColor hexColor(int value) => HexColor(value);
  // rgb
  static CssColor rgbColor({required int r, required int g, required int b}) =>
      RbgColor(r: r, g: g, b: b);
  static CssColor rgbaColor({
    required int r,
    required int g,
    required int b,
    required double a,
  }) => RbgColor.a(r: r, g: g, b: b, a: a);

  //hls
  static CssColor hlsColor({required int h, required int s, required int l}) =>
      HslColor(h: h, s: s, l: l);
  static CssColor hlsaColor({
    required int h,
    required int s,
    required int l,
    double? a,
  }) => HslColor.a(h: h, s: s, l: l, a: a);
}
