import 'package:astro_dart/core/html_element.dart';

class H1 extends HtmlElement {
  H1({
    required super.child,
    super.id,
    super.customClass,
    super.scopedStyle,
    super.attributes,
  });

  @override
  String render() {
    return '<h1$attrStr>${child.render()}</h1>';
  }
}
