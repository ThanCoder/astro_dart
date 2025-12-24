import 'package:astro_dart/core/widgets/html_widget.dart';

class Text extends HtmlWidget {
  final String text;
  Text(this.text);
  @override
  String render() {
    return text;
  }
}
