enum JustifyContent {
  start,
  center,
  end,
  spaceBetween,
  spaceAround,
  spaceEvenly;

  String get css {
    switch (this) {
      case JustifyContent.start:
        return 'flex-start';
      case JustifyContent.center:
        return 'center';
      case JustifyContent.end:
        return 'flex-end';
      case JustifyContent.spaceBetween:
        return 'space-between';
      case JustifyContent.spaceAround:
        return 'space-around';
      case JustifyContent.spaceEvenly:
        return 'space-evenly';
    }
  }
}
