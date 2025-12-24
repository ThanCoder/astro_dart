import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/widgets/text.dart';

class Button extends HtmlElement {
  final String text;

  Button({
    required this.text,
    super.onEvent,
    super.attributes,
    super.customClass,
    super.id,
    super.style,
  }) : super(child: Text(text));

  @override
  String render() {
    return '<button $getEventSelector$attrStr>$text</button>';
  }
}
