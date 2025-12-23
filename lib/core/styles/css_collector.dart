class CssCollector {
  static final _styles = <String>[];

  static void add(String css) => _styles.add(css);
  static void clear() => _styles.clear();

  static String renderAll() => _styles.join('\n');
}

class ScopeId {
  static int _id = 0;
  static String next() => 's_${_id++}';
  static void setInit() => _id = 0;
}

enum CssScopeType { global, scoped }
