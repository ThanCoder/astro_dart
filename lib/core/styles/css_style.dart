// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class CssStyle extends HtmlWidget {
  final CssScopeType scopeType;
  final String selector;
  final CssProperty cssProperty;

  CssStyle.global(this.selector, this.cssProperty)
    : scopeType = CssScopeType.global;

  CssStyle.scoped(this.selector, this.cssProperty)
    : scopeType = CssScopeType.scoped;

  @override
  String render() {
    // final selector = scopeType == CssScopeType.global ? '' : '.${scopeClass!}';

    final body = cssProperty.map.entries
        .map((e) => '  ${e.key}: ${e.value};')
        .join('\n');

    return '''
$selector {
$body
}
''';
  }
}

class CssProperty {
  static CssProperty fromMap(Map<String, String> map) {
    return CssProperty()..addMap(map);
  }

  final Map<String, String> _map = {};

  void add(String name, String value) {
    _map[name] = value;
  }

  void addMap(Map<String, String> _map) {
    _map.addAll(map);
  }

  void clear() {
    _map.clear();
  }

  Map<String, String> get map => _map;
}
