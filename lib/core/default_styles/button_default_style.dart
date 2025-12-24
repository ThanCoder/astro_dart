import 'package:astro_dart/core/styles/css_style.dart';

final buttonDefaultStyle = CssStyle.global(
  'button,input[type="submit"]',
  CssProperty.fromMap({
    'border': 'none',
    'color': 'white',
    'background-color': 'teal',
    'border-radius': '3px',
    'font-size': '1.3em',
    'padding': '0.2em 0.3em',
  }),
);

final buttonDefaultHoverStyle = CssStyle.global(
  'button:hover,input[type="submit"]:hover',
  CssProperty.fromMap({
    'background-color': 'rgb(4, 104, 104)',
    'cursor': 'pointer',
  }),
);
