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
