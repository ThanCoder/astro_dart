import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/enums/align_items.dart';
import 'package:astro_dart/core/enums/display.dart';
import 'package:astro_dart/core/enums/justify_content.dart';
import 'package:astro_dart/core/styles/css_gap.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';
import 'package:astro_dart/core/styles/grid_template_columns.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class GridWidget extends HtmlElement {
  final List<HtmlWidget> children;
  final GridTemplateColumns columns;
  final CssUnit gap;
  final JustifyContent justify;
  final AlignItems align;
  GridWidget({
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    this.gap = const Px(0),
    this.justify = JustifyContent.start,
    this.align = AlignItems.start,
    required this.columns,
    required this.children,
  }) : super(
         child: EmptyWidget(),
         style: CssProperty()
             .display(Display.grid)
             .gridTemplateColumns(columns)
             .gap(gap)
             .alignItems(align)
             .justifyContent(justify)
             .addProperty(style),
       );

  @override
  String render() {
    final childrenHtml = children.map((c) => c.render()).join('');
    return '<div $attrStr>$childrenHtml</div>';
  }
}
