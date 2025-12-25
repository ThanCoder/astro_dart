import 'package:astro_dart/core/elements/html_element.dart';

class Button extends HtmlElement {
  final String text;

  Button({
    required this.text,
    super.onEvent,
    super.attributes,
    super.customClass,
    super.id,
    super.style,
    super.readOnly,
    super.disabled,
  }) : super();

  @override
  String render() {
    return '<button $attrStr>$text</button>';
  }
}
