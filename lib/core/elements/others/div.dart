import 'package:astro_dart/core/elements/others/tag_element.dart';

class Div extends TagElement {
  Div({
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'div');
}
