class CssProperty {
  // CssProperty display(String value) => add('display', value);
  final Map<String, String> _map = {};
  final Map<String, CssProperty> pseudos = {};

  //add
  CssProperty add(String name, String value) {
    _map[name] = value;
    return this;
  }

  CssProperty addProperty(CssProperty? property) {
    if (property == null) return this;
    _map.addAll(property.map);
    pseudos.addAll(property.pseudos);
    return this;
  }

  static CssProperty fromMap(Map<String, String> map) {
    return CssProperty()..addMap(map);
  }

  void addMap(Map<String, String> map) {
    _map.addAll(map);
  }

  void clear() {
    _map.clear();
    pseudos.clear();
  }

  Map<String, String> get map => _map;
}
