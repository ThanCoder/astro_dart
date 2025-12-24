enum Display {
  block('block'),
  inline('inline'),
  flex('flex'),
  grid('grid'),
  none('none');

  final String css;
  const Display(this.css);
}
