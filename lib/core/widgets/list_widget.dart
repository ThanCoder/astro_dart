import 'package:astro_dart/core/widgets/html_widget.dart';

class ListWidget extends HtmlWidget {
  final List<HtmlWidget> list;
  ListWidget({required this.list});

  @override
  String render() {
    final res = list.map((e) => e.render()).join('\n');
    return res;
  }
}
