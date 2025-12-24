import 'package:astro_dart/core/elements/tag_element.dart';

class Div extends TagElement {
  Div({
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    required super.child,
  }) : super(tag: 'div');
}
