import 'package:astro_dart/core/elements/inputs/input_element.dart';
import 'package:astro_dart/core/elements/inputs/input_element_type.dart';

class InputSubmit extends InputElement {
  final String text;
  InputSubmit(
    this.text, {
    super.customClass,
    super.id,
    super.onEvent,
    super.style,
    super.placeHolder,
    Map<String, dynamic>? attributes,
  }) : super(
         type: InputElementType.submit,
         attributes: {
           if (attributes != null) ...attributes,
           ...{'value': text},
         },
       );
}
