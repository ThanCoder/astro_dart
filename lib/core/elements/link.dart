// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/elements/html_element.dart';

class Link extends HtmlElement {
  final String text;
  final String href;
  final LinkTarget? target;
  Link({
    super.id,
    super.customClass,
    Map<String, String>? attributes,
    super.style,
    super.onEvent,
    required this.text,
    required this.href,
    this.target,
  }) : super(
         attributes: {
           if (attributes != null) ...attributes,
           if (target != null) ...{'target': target.value},
         },
       );
  @override
  String render() {
    return '<a href="$href" $getEventSelector$attrStr>$text</a>';
  }
}

enum LinkTarget {
  blank("_blank"),
  self("_self"),
  parent("_parent"),
  top("_top");

  final String value;
  const LinkTarget(this.value);
}
