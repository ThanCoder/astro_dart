import 'package:astro_dart/core/elements/html_element.dart';
import 'package:astro_dart/core/elements/inputs/input_element.dart';
import 'package:astro_dart/core/js/js_call.dart';
import 'package:astro_dart/core/js/simple_typed_event.dart';
import 'package:astro_dart/core/js/typed_event.dart';

class JsEvent {
  ///
  /// click, input, change...
  ///
  final String name;
  final JsCall action;

  JsEvent({required this.name, required this.action});
}

class On {
  static TypedEvent<InputElement> input(
    void Function(TypedEventContext<InputElement> e) handler,
  ) => SimpleTypedEvent<InputElement>('input', handler);

  static TypedEvent<HtmlElement> click(
    void Function(TypedEventContext<HtmlElement> e) handler,
  ) => SimpleTypedEvent<HtmlElement>('click', handler);
}
