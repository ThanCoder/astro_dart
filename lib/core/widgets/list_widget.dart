import 'package:astro_dart/core/widgets/html_widget.dart';

class ListWidget extends HtmlWidget {
  final List<HtmlWidget> children;
  ListWidget({required this.children});

  @override
  String render() {
    final res = children.map((e) => e.render()).join('\n');
    return res;
  }
}
