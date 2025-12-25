import 'package:astro_dart/core/styles/css_property.dart';

enum AlignItems {
  start,
  center,
  end,
  stretch;

  String get css => switch (this) {
    AlignItems.start => 'flex-start',
    AlignItems.center => 'center',
    AlignItems.end => 'flex-end',
    AlignItems.stretch => 'stretch',
  };
}

extension AlignItemsCssProperty on CssProperty {
  CssProperty alignItems(AlignItems value) => add('align-items', value.css);
}
