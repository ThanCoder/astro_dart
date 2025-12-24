import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/js/typed_event.dart';
import 'package:astro_dart/core/styles/css_collector.dart';

class EventRegistry {
  static final _events = <String, TypedEvent>{};

  static String register(TypedEvent event) {
    final id = ScopeId.next();
    _events[id] = event;
    return id;
  }

  static void dispatch(String id, HtmlElement element, dynamic rawEvent) {
    final event = _events[id];
    if (event == null) return;

    event.handle(TypedEventContext(element, rawEvent));
  }
}
