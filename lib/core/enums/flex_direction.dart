enum FlexDirection {
  row('row'),
  column('column'),
  rowReverse('row-reverse'),
  columnReverse('column-reverse');

  final String css;
  const FlexDirection(this.css);
}
