import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/enums/align_items.dart';
import 'package:astro_dart/core/enums/display.dart';
import 'package:astro_dart/core/enums/flex_direction.dart';
import 'package:astro_dart/core/enums/justify_content.dart';
import 'package:astro_dart/core/styles/css_gap.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_unit.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class ColumnWidget extends HtmlElement {
  final List<HtmlWidget> children;
  final JustifyContent justify;
  final AlignItems align;
  final FlexDirection flexDirection;
  final CssUnit gap;
  ColumnWidget({
    super.attributes,
    super.customClass,
    super.id,
    super.onEvent,
    super.readOnly,
    super.disabled,
    CssProperty? style,
    this.justify = JustifyContent.start,
    this.align = AlignItems.start,
    this.flexDirection = FlexDirection.column,
    this.gap = const Px(0),
    required this.children,
  }) : super(
         child: EmptyWidget(),
         style: CssProperty()
             .display(Display.flex)
             .justifyContent(justify)
             .alignItems(align)
             .flexDirection(flexDirection)
             .gap(gap)
             .addProperty(style),
       );

  @override
  String render() {
    final childrenHtml = children.map((c) => c.render()).join('\n');
    return '<div $attrStr>$childrenHtml</div>';
  }
}

// return '<div style="display:flex; flex-direction:column; justify-content:$justify; align-items:$align;">$childrenHtml</div>';
