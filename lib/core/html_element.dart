// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

abstract class HtmlElement extends HtmlWidget {
  final HtmlWidget child;

  final CssProperty? scopedStyle;

  /// Auto-generated unique scoped class
  late final String scopedId;

  /// Optional HTML id attribute
  final String? id;

  /// Other arbitrary HTML attributes
  final Map<String, String>? attributes;

  /// Optional user-defined custom class
  final String? customClass;

  HtmlElement({
    required this.child,
    this.scopedStyle,
    this.id,
    this.attributes,
    this.customClass,
  }) {
    // scoped style id generate
    // Generate unique scoped class if scopedStyle exists
    if (scopedStyle != null && scopedStyle!.map.isNotEmpty) {
      scopedId = ScopeId.next();
      CssCollector.add(CssStyle.scoped('.$scopedId', scopedStyle!).render());
    } else {
      scopedId = '';
    }
  }

  /// Render class/id/other attributes
  String get attrStr {
    final buffer = StringBuffer();

    // Classes: scoped + custom
    final classes = [
      if (scopedId.isNotEmpty) scopedId,
      if (customClass != null) customClass,
    ];
    if (classes.isNotEmpty) buffer.write(' class="${classes.join(' ')}"');

    // id
    if (id != null) buffer.write(' id="$id"');

    // Other attributes
    if (attributes != null) {
      attributes!.forEach((key, value) {
        buffer.write(' $key="$value"');
      });
    }
    return buffer.toString();
  }
}
