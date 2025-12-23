import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class Html5Page extends HtmlWidget {
  final String title;
  final HtmlWidget body;
  final List<HtmlWidget>? headers;
  final List<HtmlWidget>? cssStyles;
  final List<HtmlWidget>? scripts;
  Html5Page({
    this.title = 'Untitled',
    required this.body,
    this.headers,
    this.cssStyles,
    this.scripts,
  });

  @override
  String render() {
    final headerTags = (headers ?? []).map((e) => e.render()).join('\n');
    final cssStyleTags = (cssStyles ?? []).map((e) => e.render()).join('\n');
    final scriptTags = (scripts ?? []).map((e) => e.render()).join('\n');
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    $headerTags

    <style>
    $cssStyleTags
    ${CssCollector.renderAll()}
    </style>
</head>
<body>

    ${body.render()}

    $scriptTags

</body>
</html>
''';
  }
}
