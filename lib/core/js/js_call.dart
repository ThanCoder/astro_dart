class JsCall {
  final String expression;
  JsCall(this.expression);

  factory JsCall.callDartDispatch() {
    return JsCall('__dartDispatch("btn_1", this, event)');
  }
}

class JsCallAlert extends JsCall {
  final String text;
  JsCallAlert(this.text) : super('window.alert(\'$text\')');
}

class JsCallConsole extends JsCall {
  final String text;

  JsCallConsole.log(this.text) : super('console.log(\'$text\')');
  JsCallConsole.assertLog(this.text) : super('console.assert(\'$text\')');
  JsCallConsole.clear({this.text = ''}) : super('console.clear()');
  JsCallConsole.debug(this.text) : super('console.debug(\'$text\')');
  JsCallConsole.error(this.text) : super('console.error(\'$text\')');
  JsCallConsole.warn(this.text) : super('console.warn(\'$text\')');
  JsCallConsole.info(this.text) : super('console.info(\'$text\')');
}
