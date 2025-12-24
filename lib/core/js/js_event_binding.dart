import 'package:astro_dart/core/js/js_event.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

class JsEventBinding extends HtmlWidget {
  final String selector;
  final JsEvent event;

  JsEventBinding({required this.selector, required this.event});

  @override
  String render() {
    return '''
document.querySelector('$selector')?.addEventListener('${event.name}', function(e) {
    ${event.action.expression};
  });
''';
  }
}
