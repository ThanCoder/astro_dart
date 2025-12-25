import 'package:astro_dart/core/elements/html_element.dart';

class TagElement extends HtmlElement {
  final String tag;
  TagElement({
    super.id,
    super.customClass,
    super.attributes,
    super.style,
    super.onEvent,
    super.child,
    super.readOnly,
    super.disabled,
    required this.tag,
  });

  @override
  String render() {
    return '<$tag $attrStr>${child?.render()}</$tag>';
  }
}
