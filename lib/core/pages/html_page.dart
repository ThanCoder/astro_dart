import 'package:astro_dart/core/elements/column_element.dart';
import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/elements/inputs/input_form.dart';
import 'package:astro_dart/core/elements/row_element.dart';
import 'package:astro_dart/core/pages/page_props.dart';
import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';
import 'package:astro_dart/core/widgets/list_widget.dart';

abstract class HtmlPage extends HtmlWidget {
  final PageProps pageProps;
  final HtmlWidget body;
  HtmlPage({required this.pageProps, required this.body});

  void _collectCsss(HtmlWidget widget, List<CssStyle> outCss) {
    if (widget is CssStyle) {
      outCss.add(widget);
    }
    if (widget is HtmlElement && widget.child != null) {
      if (widget.getScopedStyle != null) {
        outCss.add(widget.getScopedStyle!);
      }
      // loop
      _collectCsss(widget.child!, outCss);
    }
    if (widget is ListWidget) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
    if (widget is ColumnElement) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
    if (widget is RowElement) {
      for (final item in widget.children) {
        _collectCsss(item, outCss);
      }
    }
  }

  void _collectEvents(HtmlWidget widget, List<HtmlWidget> out) {
    if (widget is HtmlElement && widget.child != null) {
      if (widget.bindings.isNotEmpty) {
        out.addAll(widget.bindings);
      }
      _collectEvents(widget.child!, out);
    }

    if (widget is ListWidget) {
      for (final w in widget.children) {
        _collectEvents(w, out);
      }
    }
    if (widget is InputForm) {
      for (final w in widget.children) {
        _collectEvents(w, out);
      }
    }
    if (widget is ColumnElement) {
      for (final item in widget.children) {
        _collectEvents(item, out);
      }
    }
    if (widget is RowElement) {
      for (final item in widget.children) {
        _collectEvents(item, out);
      }
    }
  }

  String get getJSScript {
    final events = <HtmlWidget>[];
    _collectEvents(body, events);

    return events.map((e) => e.render()).join('\n');
  }

  String get getScopedCss {
    final styles = <CssStyle>[];
    _collectCsss(body, styles);
    return styles.map((e) => e.css).join('\n');
  }

  @override
  String render() {
    final headerTags = (pageProps.headers ?? [])
        .map((e) => e.render())
        .join('\n');
    final cssStyleTags = (pageProps.cssStyles ?? [])
        .map((e) => e.render())
        .join('\n');
    final scriptTags = (pageProps.scripts ?? [])
        .map((e) => e.render())
        .join('\n');
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageProps.title}</title>
    $headerTags

    <style>
    $cssStyleTags
    $getScopedCss
    </style>
</head>
<body>

    ${body.render()}

    $scriptTags
    ${getJSScript.isEmpty ? '' : '<script>$getJSScript</script>'}
</body>
</html>
''';
  }
}
