abstract class HtmlWidget {
  String render();
}

class EmptyWidget extends HtmlWidget {
  @override
  String render() => '';
}
