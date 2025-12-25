import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/extensions/css/unit_extensions.dart';
import 'package:astro_dart/core/styles/border_radius.dart';
import 'package:astro_dart/core/styles/border_value.dart';
import 'package:astro_dart/core/styles/css_color.dart';
import 'package:astro_dart/core/styles/css_colors.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_pseudo.dart';
import 'package:astro_dart/core/styles/css_unit.dart';
import 'package:astro_dart/core/styles/padding_value.dart';

class Select extends HtmlElement {
  final List<Option> options;
  Select({
    CssProperty? style,
    super.id,
    super.attributes,
    super.customClass,
    this.options = const [],
  }) : super(
         child: null,
         style: CssProperty()
             .cssWith(200.px)
             .padding(Padding.all(8.px))
             .border(Border.all(width: 1.px, color: CssColors.gray))
             .borderRadius(BorderRadius.all(4.px))
             .backgroundColor(CssColors.white)
             .hover((s) => s.backgroundColor(CssColors.pink.shade600))
             .addProperty(style),
       );

  @override
  String render() {
    final buffer = StringBuffer();
    buffer.write('<select$attrStr>');
    for (var o in options) {
      buffer.write(o.render());
    }
    buffer.write('</select>');
    return buffer.toString();
  }
}

class Option extends HtmlElement {
  final String value;
  final String text;
  Option({required this.value, required this.text}) : super(child: null);

  @override
  String render() => '<option value="$value">$text</option>';
}
