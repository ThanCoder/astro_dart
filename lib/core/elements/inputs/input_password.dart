import 'package:astro_dart/core/elements/inputs/input_element.dart';
import 'package:astro_dart/core/elements/inputs/input_element_type.dart';

class InputPassword extends InputElement {
  InputPassword({
    super.customClass,
    super.id,
    super.onEvent,
    super.style,
    super.placeHolder,
    super.attributes,
  }) : super(type: InputElementType.password);
}
