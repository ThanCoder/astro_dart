import 'package:astro_dart/core/html_element.dart';
import 'package:astro_dart/core/js/js_call.dart';
import 'package:astro_dart/core/text.dart';

class Button extends HtmlElement {
  final String text;
  final JsCall? onClick;
  Button({required this.text, this.onClick}) : super(child: Text(text));

  @override
  String render() {
    final onClickAttr = onClick != null
        ? ' onclick="${onClick!.expression}"'
        : '';

    return '<button$onClickAttr>$text</button>';
  }
}
