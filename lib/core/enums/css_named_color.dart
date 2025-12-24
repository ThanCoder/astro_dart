enum CssNamedColor {
  black('black'),
  white('white'),
  red('red'),
  green('green'),
  blue('blue'),
  yellow('yellow'),
  cyan('cyan'),
  magenta('magenta'),

  gray('gray'),
  lightGray('lightgray'),
  darkGray('darkgray'),

  orange('orange'),
  pink('pink'),
  purple('purple'),
  brown('brown'),

  teal('teal'),
  navy('navy'),
  olive('olive'),
  maroon('maroon'),

  aliceBlue('aliceblue'),
  antiqueWhite('antiquewhite'),
  aqua('aqua'),
  aquamarine('aquamarine'),
  azure('azure'),
  beige('beige'),
  bisque('bisque'),
  blanchedAlmond('blanchedalmond'),
  blueViolet('blueviolet'),

  transparent('transparent');

  final String css;
  const CssNamedColor(this.css);
}
