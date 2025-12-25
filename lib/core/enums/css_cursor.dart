import 'package:astro_dart/core/styles/css_property.dart';

enum CssCursor {
  auto('auto'),
  default_('default'),
  pointer('pointer'),
  move('move'),
  text('text'),
  wait('wait'),
  help('help'),
  notAllowed('not-allowed'),
  crosshair('crosshair'),
  grab('grab'),
  grabbing('grabbing'),
  zoomIn('zoom-in'),
  zoomOut('zoom-out');

  final String css;
  const CssCursor(this.css);
}

extension CssCursorProperty on CssProperty {
  CssProperty cursor(CssCursor value) => add('cursor', value.css);
}
