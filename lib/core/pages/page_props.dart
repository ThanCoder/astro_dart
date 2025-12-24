// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_dart/core/widgets/html_widget.dart';

class PageProps {
  final String title;
  final List<HtmlWidget>? headers;
  final List<HtmlWidget>? cssStyles;
  final List<HtmlWidget>? scripts;
  PageProps({
    this.title = 'Untitled',
    this.headers,
    this.cssStyles,
    this.scripts,
  });
}
