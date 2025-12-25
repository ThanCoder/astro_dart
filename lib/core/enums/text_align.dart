import 'package:astro_dart/core/styles/css_property.dart';

enum TextAlign {
  start('start'),
  end('end'),
  left('left'),
  right('right'),
  center('center'),
  justify('justify'),
  matchParent('match-parent'),
  mozCenter('-moz-center'),
  webkitCenter('-webkit-center'),
  inherit('inherit'),
  initial('initial'),
  revert('revert'),
  revertLayer('revert-layer'),
  unset('unset');

  final String css;
  const TextAlign(this.css);
}

extension TextAlignCssProperty on CssProperty {
  CssProperty textAlign(TextAlign value) => add('text-align', value.css);
}
/*
/* Keyword values */
text-align: start;
text-align: end;
text-align: left;
text-align: right;
text-align: center;
text-align: justify;
text-align: match-parent;

/* Block alignment values (Non-standard syntax) */
text-align: -moz-center;
text-align: -webkit-center;

/* Global values */
text-align: inherit;
text-align: initial;
text-align: revert;
text-align: revert-layer;
text-align: unset;
*/