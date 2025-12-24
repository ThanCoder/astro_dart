import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/js/js_call.dart';
import 'package:astro_dart/core/js/js_event.dart';
import 'package:astro_dart/core/js/typed_event.dart';

class SimpleTypedEvent<T extends HtmlElement> implements TypedEvent<T> {
  @override
  final String name;

  final void Function(TypedEventContext<T>) _handler;

  SimpleTypedEvent(this.name, this._handler);

  @override
  void handle(TypedEventContext<T> ctx) => _handler(ctx);

  @override
  JsEvent toJsEvent(String eventId) {
    return JsEvent(
      name: name,
      action: JsCall('__astroDispatch("$eventId", this, event)'),
    );
  }
}
