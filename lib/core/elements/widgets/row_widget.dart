import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/enums/align_items.dart';
import 'package:astro_dart/core/enums/display.dart';
import 'package:astro_dart/core/enums/justify_content.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class RowWidget extends HtmlElement {
  final List<HtmlWidget> children;
  final JustifyContent justify; // start, center, end, space-between ...
  final AlignItems align; // start, center, end ...
  RowWidget({
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    required this.children,
    this.justify = JustifyContent.start,
    this.align = AlignItems.start,
  }) : super(
         child: EmptyWidget(),
         style: CssProperty()
           ..display(Display.flex)
           ..justifyContent(justify)
           ..alignItems(align).addProperty(style),
       );

  @override
  String render() {
    final childrenHtml = children.map((c) => c.render()).join('\n');
    return '<div $attrStr>$childrenHtml</div>';
  }

  //return '<div style="display:flex; justify-content:$justify; align-items:$align;">$childrenHtml</div>';
}
