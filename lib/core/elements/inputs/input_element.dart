import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/elements/inputs/input_element_type.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class InputElement extends HtmlElement {
  final InputElementType type;
  final String? placeHolder;
  InputElement({
    this.placeHolder,
    Map<String, String>? attributes,
    super.id,
    super.customClass,
    super.style,
    super.onEvent,
    required this.type,
  }) : super(
         child: EmptyWidget(),
         attributes: {
           if (attributes != null) ...attributes,
           if (placeHolder != null) ...{'placeholder': placeHolder},
         },
       );

  @override
  String render() {
    return '<input type="${type.value}" $attrStr/>';
  }
}
