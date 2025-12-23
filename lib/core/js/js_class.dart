import 'package:astro_dart/core/widgets/html_widget.dart';

class JsClass extends HtmlWidget {
  final String name;
  final String body;
  final String? initCommand;

  ///```dart
  /// final counterJs = JsClass('Counter', '''
  /// constructor() {
  ///   this.count = 0;
  /// }
  /// inc(name) {
  ///   this.count++;
  ///   console.log(`\${this.count} \${name}`);
  /// }
  /// ''', initCommand: 'const counter = new Counter()');
  ///```
  ///
  JsClass(this.name, this.body, {this.initCommand});

  @override
  String render() =>
      '''
<script>
  class $name {
  $body
  }

\n
$initCommand
</script>
''';
}
