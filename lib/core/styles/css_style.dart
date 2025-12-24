// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/enums/align_items.dart';
import 'package:astro_dart/core/enums/display.dart';
import 'package:astro_dart/core/enums/flex_direction.dart';
import 'package:astro_dart/core/enums/justify_content.dart';
import 'package:astro_dart/core/styles/border_radius.dart';
import 'package:astro_dart/core/styles/border_value.dart';
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/styles/css_color.dart';
import 'package:astro_dart/core/styles/css_unit.dart';
import 'package:astro_dart/core/styles/margin_value.dart';
import 'package:astro_dart/core/styles/padding_value.dart';
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
  String render() => css;

  String get css {
    final prop = cssProperty.map.entries
        .map((e) => '  ${e.key}: ${e.value};')
        .join('\n');
    return '''
$selector {
$prop
}
''';
  }
}

class CssProperty {
  CssProperty color(CssColor value) => add('color', value.css);
  CssProperty backgroundColor(CssColor value) =>
      add('background-color', value.css);
  CssProperty padding(Padding value) => add('padding', value.css);
  CssProperty borderRadius(BorderRadius value) =>
      add('border-radius', value.css);
  CssProperty fontSize(CssUnit value) => add('font-size', value.css);
  CssProperty display(Display value) => add('display', value.css);
  CssProperty justifyContent(JustifyContent value) =>
      add('justify-content', value.css);
  CssProperty alignItems(AlignItems value) => add('align-items', value.css);
  CssProperty flexDirection(FlexDirection value) =>
      add('flex-direction', value.css);
  CssProperty border(BorderValue value) => add('border', value.css);
  CssProperty margin(Margin value) => add('margin', value.css);
  // CssProperty display(String value) => add('display', value);
  //add
  CssProperty add(String name, String value) {
    _map[name] = value;
    return this;
  }

  static CssProperty fromMap(Map<String, String> map) {
    return CssProperty()..addMap(map);
  }

  final Map<String, String> _map = {};

  void addMap(Map<String, String> map) {
    _map.addAll(map);
  }

  void clear() {
    _map.clear();
  }

  Map<String, String> get map => _map;
}
