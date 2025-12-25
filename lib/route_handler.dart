import 'package:astro_dart/core/default_styles/button_default_style.dart';
import 'package:astro_dart/core/elements/others/header_elements.dart';
import 'package:astro_dart/core/elements/others/img.dart';
import 'package:astro_dart/core/elements/inputs/textarea.dart';
import 'package:astro_dart/core/elements/widgets/button.dart';
import 'package:astro_dart/core/elements/widgets/card.dart';
import 'package:astro_dart/core/elements/widgets/column_widget.dart';
import 'package:astro_dart/core/elements/widgets/grid_widget.dart';
import 'package:astro_dart/core/elements/others/link.dart';
import 'package:astro_dart/core/elements/widgets/select.dart';
import 'package:astro_dart/core/enums/css_cursor.dart';
import 'package:astro_dart/core/enums/text_align.dart';
import 'package:astro_dart/core/extensions/css/unit_extensions.dart';
import 'package:astro_dart/core/pages/html5_page.dart';
import 'package:astro_dart/core/pages/page_props.dart';
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/styles/css_color.dart';
import 'package:astro_dart/core/styles/css_colors.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_pseudo.dart';
import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/styles/css_unit.dart';
import 'package:astro_dart/core/styles/grid_template_columns.dart';
import 'package:astro_dart/core/widgets/text.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

final routers = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  // clear
  ScopeId.setInit();
  final html = Html5Page(
    pageProps: PageProps(
      title: 'Astro Home Page',
      cssStyles: [
        buttonDefaultStyle,
        buttonDefaultHoverStyle,
        CssStyle.global(
          '*',
          CssProperty().add('padding', '0px').add('margin', '0px'),
        ),
        CssStyle.global(
          'body',
          CssProperty()
              .backgroundColor(CssColors.hexColor(0x202020))
              .add('color', 'white'),
        ),
      ],
    ),

    body: ColumnWidget(
      gap: 10.px,
      children: [
        Link(text: 'link text', href: '#', target: LinkTarget.blank),

        Card(
          child: Text('i am card widget'),
          style: CssProperty()
              .textAlign(TextAlign.end)
              .hover(
                (s) =>
                    s.backgroundColor(CssColors.red).cursor(CssCursor.pointer),
              ),
        ),

        // OptionWidget(text: H1(child: Text('option label'))),
        Select(
          options: List.generate(
            10,
            (index) => Option(value: '$index', text: 'text $index'),
          ),
        ),

        Img(
          style: CssProperty().cssWith(100.px).cssHeight(130.px),
          src:
              'https://ee6af7a6-fd01-4668-9534-7359a6b3034b.mdnplay.dev/shared-assets/images/examples/surfer.jpg',
        ),

        Textarea(
          value: 'i am value',
          placeholder: 'i am placeholder',
          disabled: true,
        ),

        GridWidget(
          gap: 1.em,
          columns: GridTemplateColumns.repeat(3),
          children: [
            Button(text: 'btn one'),
            Button(text: 'btn two', style: CssProperty().color(CssColors.red)),
          ],
        ),
      ],
    ),
  );
  // print(html.render());
  return Response.ok(html.render(), headers: {'content-type': 'text/html'});
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}
