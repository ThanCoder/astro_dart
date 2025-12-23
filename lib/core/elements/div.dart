import 'package:astro_dart/core/html_element.dart';

class Div extends HtmlElement {
  Div({required super.child});

  @override
  String render() {
    return '<div>${child.render()}</div>';
  }
}
