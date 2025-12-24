import 'package:astro_dart/core/default_styles/button_default_style.dart';
import 'package:astro_dart/core/elements/button.dart';
import 'package:astro_dart/core/elements/column_element.dart';
import 'package:astro_dart/core/elements/grid_element.dart';
import 'package:astro_dart/core/elements/inputs/input_form.dart';
import 'package:astro_dart/core/elements/inputs/input_submit.dart';
import 'package:astro_dart/core/elements/inputs/input_text.dart';
import 'package:astro_dart/core/elements/link.dart';
import 'package:astro_dart/core/elements/row_element.dart';
import 'package:astro_dart/core/enums/css_named_color.dart';
import 'package:astro_dart/core/extensions/css/unit_extensions.dart';
import 'package:astro_dart/core/pages/html5_page.dart';
import 'package:astro_dart/core/pages/page_props.dart';
import 'package:astro_dart/core/styles/border_radius.dart';
import 'package:astro_dart/core/styles/border_value.dart';
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/styles/css_color.dart';
import 'package:astro_dart/core/styles/css_colors.dart';
import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/elements/header_elements.dart';
import 'package:astro_dart/core/styles/grid_template_columns.dart';
import 'package:astro_dart/core/styles/margin_value.dart';
import 'package:astro_dart/core/styles/padding_value.dart';
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

    body: ColumnElement(
      // gap: 2.em,
      children: [
        H1(
          style: CssProperty()
              .border(
                Border.all(
                  color: NamedColor(name: CssNamedColor.green),
                  width: 3.px,
                ),
              )
              .borderRadius(BorderRadius.all(4.px))
              .padding(Padding.all(.4.em))
              .color(NamedColor(name: CssNamedColor.blue))
              .margin(Margin.only(bottom: 3.em)),
          child: Text('hello from html5 one'),
        ),

        Button(
          text: 'call log',
          style: CssProperty()
            ..padding(Padding.symmetric(vertical: 1.em, horizontal: 1.2.em)),
        ),

        Link(text: 'link text', href: '#', target: LinkTarget.blank),

        GridElement(
          gap: 1.em,
          columns: GridTemplateColumns.repeat(3),
          children: [
            Button(text: 'btn one'),
            Button(text: 'btn two'),
            Button(text: 'btn three'),
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
