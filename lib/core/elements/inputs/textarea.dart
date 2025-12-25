import 'package:astro_dart/core/elements/others/tag_element.dart';
import 'package:astro_dart/core/extensions/css/unit_extensions.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';
import 'package:astro_dart/core/widgets/text.dart';

class Textarea extends TagElement {
  final String value;
  final int cols;
  final int rows;
  final int? minlength;
  final int? maxlength;
  final String? placeholder;
  Textarea({
    Map<String, String>? attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    this.cols = 20,
    this.rows = 10,
    this.minlength,
    this.maxlength,
    this.placeholder,
    required this.value,
  }) : super(
         tag: 'textarea',
         child: Text(value),
         style: CssProperty().cssWith(100.percent).addProperty(style),
         attributes: {
           ...{
             'cols': cols.toString(),
             'rows': rows.toString(),
             if (minlength != null) 'minlength': minlength.toString(),
             if (maxlength != null) 'maxlength': maxlength.toString(),
             if (placeholder != null) 'placeholder': placeholder,
           },
           if (attributes != null) ...attributes,
         },
       );
}
