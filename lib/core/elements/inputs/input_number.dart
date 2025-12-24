import 'package:astro_dart/core/elements/inputs/input_element.dart';
import 'package:astro_dart/core/elements/inputs/input_element_type.dart';

class InputNumber extends InputElement {
  InputNumber({
    super.customClass,
    super.id,
    super.onEvent,
    super.style,
    super.placeHolder,
    super.attributes,
  }) : super(type: InputElementType.number);
}
