class ScopeId {
  static int _id = 0;
  static String next() => 's_${_id++}';
  static void setInit() => _id = 0;
}

enum CssScopeType { global, scoped }
