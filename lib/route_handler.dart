import 'package:astro_dart/core/elements/button.dart';
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/elements/h1.dart';
import 'package:astro_dart/core/html5_page.dart';
import 'package:astro_dart/core/js/js_class.dart';
import 'package:astro_dart/core/js/js_call.dart';
import 'package:astro_dart/core/widgets/list_widget.dart';
import 'package:astro_dart/core/text.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

final routers = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  // clear
  ScopeId.setInit();
  CssCollector.clear();

  final html = Html5Page(
    title: 'Astro Home Page',
    cssStyles: [
      CssStyle.global(
        '*',
        CssProperty()
          ..add('padding', '0px')
          ..add('margin', '0px')
          ..add('background', 'grey'),
      ),
    ],
    body: ListWidget(
      list: [
        H1(
          scopedStyle: CssProperty()..add('color', 'red'),
          child: Text('hello from html5 one'),
        ),
        H1(
          scopedStyle: CssProperty()..add('color', 'blue'),
          child: Text('hello from html5 two'),
        ),
        H1(
          scopedStyle: CssProperty()..add('color', 'yellow'),
          child: Text('hello from html5 Three'),
        ),
        Button(
          text: 'I am button',
          onClick: JsCall('counter.inc(\'hello than\')'),
        ),
      ],
    ),
  ).render();
  return Response.ok(html, headers: {'content-type': 'text/html'});
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}
