// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/elements/html_element.dart';

class Img extends HtmlElement {
  final String src;
  final String alt;
  Img({
    super.id,
    super.attributes,
    super.customClass,
    super.readOnly,
    super.disabled,
    super.onEvent,
    super.style,
    required this.src,
    this.alt = 'img',
  });
  @override
  String render() {
    return '<img src="$src" alt="$alt" $attrStr />';
  }
}
