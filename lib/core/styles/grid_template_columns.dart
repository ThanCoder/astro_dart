import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';

sealed class GridTrack {
  const GridTrack();
  String get css;
}

// fixed width (px/em/%)
class GridTrackFixed extends GridTrack {
  final CssUnit value;
  const GridTrackFixed(this.value);

  @override
  String get css => value.css;
}

// fraction (fr)
class GridTrackFraction extends GridTrack {
  final num value;
  const GridTrackFraction(this.value);

  @override
  String get css => '${value}fr';
}

// auto
class GridTrackAuto extends GridTrack {
  const GridTrackAuto();
  @override
  String get css => 'auto';
}

sealed class GridTemplateColumns {
  const GridTemplateColumns();
  String get css;

  // repeat(n, 1fr)
  factory GridTemplateColumns.repeat(int count) = _GridTemplateColumnsRepeat;
}

class _GridTemplateColumnsRepeat extends GridTemplateColumns {
  final int count;
  const _GridTemplateColumnsRepeat(this.count);

  @override
  String get css => 'repeat($count, 1fr)';
}

extension CssGridProperty on CssProperty {
  CssProperty gridTemplateColumns(GridTemplateColumns value) =>
      add('grid-template-columns', value.css);
}
