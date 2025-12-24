sealed class CssUnit {
  const CssUnit(); // ⭐ အရေးကြီး
  String get css;
}

class Px extends CssUnit {
  final num value;
  const Px(this.value);
  @override
  String get css => '${value}px';
}

class Em extends CssUnit {
  final num value;
  const Em(this.value);
  @override
  String get css => '${value}em';
}

class Percent extends CssUnit {
  final num value;
  const Percent(this.value);
  @override
  String get css => '$value%';
}

