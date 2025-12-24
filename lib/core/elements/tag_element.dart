import 'package:astro_dart/core/elements/html_element.dart';

class TagElement extends HtmlElement {
  final String tag;
  TagElement({
    super.id,
    super.customClass,
    super.attributes,
    super.style,
    super.onEvent,
    required this.tag,
    required super.child,
  });

  @override
  String render() {
    return '<$tag $getEventSelector$attrStr>${child?.render()}</$tag>';
  }
}
