import 'package:astro_dart/core/js/js_event.dart';
import 'package:astro_dart/core/js/js_event_binding.dart';
import 'package:astro_dart/core/styles/css_collector.dart';
import 'package:astro_dart/core/styles/css_property.dart';
import 'package:astro_dart/core/styles/css_style.dart';
import 'package:astro_dart/core/widgets/html_widget.dart';

abstract class HtmlElement extends HtmlWidget {
  final HtmlWidget? child;

  final CssProperty? style;

  /// Auto-generated unique scoped class
  late final String scopedId;

  /// Optional HTML id attribute
  final String? id;

  /// Other arbitrary HTML attributes
  final Map<String, String>? attributes;

  /// Optional user-defined custom class
  final String? customClass;

  CssStyle? _scopedStyle;

  final List<JsEvent> onEvent;

  late final List<JsEventBinding> _bindings;
  late final String _eventId;
  final bool readOnly;
  final bool disabled;

  HtmlElement({
    this.child,
    this.style,
    this.id,
    this.attributes,
    this.customClass,
    this.readOnly = false,
    this.disabled = false,
    this.onEvent = const [],
  }) {
    // scoped style id generate
    // Generate unique scoped class if scopedStyle exists
    if (style != null) {
      scopedId = ScopeId.next();
      _scopedStyle = CssStyle.scoped('.$scopedId', style!);
    } else {
      scopedId = '';
    }

    _eventId = 'astro_ele_${ScopeId.next()}';

    // register events
    _bindings = onEvent
        .map((e) => JsEventBinding(selector: '[$getEventSelector]', event: e))
        .toList();
  }

  /// event
  List<JsEventBinding> get bindings => _bindings;
  String get getEventSelector =>
      onEvent.isNotEmpty ? 'data-eid="$_eventId"' : '';

  CssStyle? get getScopedStyle => _scopedStyle;

  /// Render class/id/other attributes
  String get attrStr {
    final buffer = StringBuffer();
    // event
    if (getEventSelector.isEmpty) {
      buffer.write(getEventSelector);
    }

    // Classes: scoped + custom
    final classes = [
      if (scopedId.isNotEmpty) scopedId,
      if (customClass != null) customClass,
    ];
    if (classes.isNotEmpty) buffer.write(' class="${classes.join(' ')}"');

    // id
    if (id != null) buffer.write(' id="$id"');

    // default attributes
    final allAttributes = attributes ?? {};
    // set default
    if (readOnly) {
      allAttributes['readonly'] = 'true';
    }
    if (disabled) {
      allAttributes['disabled'] = 'true';
    }

    // Other attributes
    if (attributes != null) {
      allAttributes.addAll(attributes!);
    }

    allAttributes.forEach((key, value) {
      buffer.write(' $key="$value"');
    });
    return buffer.toString();
  }
}
