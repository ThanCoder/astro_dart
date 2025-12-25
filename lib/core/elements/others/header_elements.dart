import 'package:astro_dart/core/elements/others/tag_element.dart';

class H1 extends TagElement {
  H1({
    super.id,
    super.customClass,
    super.style,
    super.onEvent,
    super.attributes,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h1');
}

class H2 extends TagElement {
  H2({
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h2');
}

class H3 extends TagElement {
  H3({
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h3');
}

class H4 extends TagElement {
  H4({
    super.id,
    super.customClass,
    super.style,
    super.attributes,
    super.onEvent,
    super.readOnly,
    super.disabled,
    required super.child,
  }) : super(tag: 'h4');
}
