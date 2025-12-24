import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/js/js_event.dart';

abstract class TypedEvent<T extends HtmlElement> {
  String get name;

  /// Dart-side handler
  void handle(TypedEventContext<T> ctx);

  /// Convert to existing JsEvent
  JsEvent toJsEvent(String eventId);
}

class TypedEventContext<T extends HtmlElement> {
  final T element;
  final dynamic rawEvent;

  TypedEventContext(this.element, this.rawEvent);

  String? get value {
    if (rawEvent?.target != null) {
      return rawEvent.target.value;
    }
    return null;
  }
}
