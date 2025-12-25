import 'package:astro_dart/core/styles/css_property.dart';

extension CssPseudoExtensions on CssProperty {
  CssProperty _pseudo(String name, void Function(CssProperty s) build) {
    final p = CssProperty();
    build(p);
    pseudos[':$name'] = p;
    return this;
  }

  // pseudo
  CssProperty hover(void Function(CssProperty s) build) {
    return _pseudo('hover', build);
  }

  CssProperty active(void Function(CssProperty s) build) {
    return _pseudo('active', build);
  }

  CssProperty focus(void Function(CssProperty s) build) {
    return _pseudo('focus', build);
  }

  CssProperty focusVisible(void Function(CssProperty s) build) {
    return _pseudo('focusVisible', build);
  }

  CssProperty focusWithin(void Function(CssProperty s) build) {
    return _pseudo('focusWithin', build);
  }

  CssProperty visited(void Function(CssProperty s) build) {
    return _pseudo('visited', build);
  }

  CssProperty disabled(void Function(CssProperty s) build) {
    return _pseudo('disabled', build);
  }

  CssProperty checked(void Function(CssProperty s) build) {
    return _pseudo('checked', build);
  }

  CssProperty enabled(void Function(CssProperty s) build) {
    return _pseudo('enabled', build);
  }

  CssProperty firstChild(void Function(CssProperty s) build) {
    return _pseudo('first-child', build);
  }

  CssProperty lastChild(void Function(CssProperty s) build) {
    return _pseudo('last-child', build);
  }

  ///
  ///The :`nth-child()` CSS pseudo-class matches elements based on the indexes of the elements in the child list of their parents. In other words, the :nth-child() selector selects child elements according to their position among all the sibling elements within a parent element.
  ///
  CssProperty nthChild(String selector, void Function(CssProperty s) build) {
    return _pseudo('nth-child($selector)', build);
  }

  ///
  /// ### 🧱 7️⃣ Pseudo-elements
  ///
  CssProperty before(void Function(CssProperty s) build) {
    return _pseudo(':before', build);
  }

  CssProperty after(void Function(CssProperty s) build) {
    return _pseudo(':after', build);
  }

  CssProperty placeholder(void Function(CssProperty s) build) {
    return _pseudo(':placeholder', build);
  }

  CssProperty selection(void Function(CssProperty s) build) {
    return _pseudo(':selection', build);
  }

  CssProperty content(void Function(CssProperty s) build) {
    return _pseudo(':content', build);
  }

  ///
  /// ### 🚫 5️⃣ Negation / Matching
  ///
  CssProperty not(String selector, void Function(CssProperty s) build) {
    return _pseudo('not($selector)', build);
  }

  CssProperty is_(String selector, void Function(CssProperty s) build) {
    return _pseudo('is($selector)', build);
  }

  CssProperty where(String selector, void Function(CssProperty s) build) {
    return _pseudo('where($selector)', build);
  }

  ///
  /// ### 🎭 6️⃣ User / Browser environment
  ///
  CssProperty hoverCapable(void Function(CssProperty s) build) {
    // handled later with @media (hover: hover)
    return this;
  }

  CssProperty target(void Function(CssProperty s) build) =>
      _pseudo('target', build);

  CssProperty root(void Function(CssProperty s) build) =>
      _pseudo('root', build);
}
