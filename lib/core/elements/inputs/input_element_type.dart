enum InputElementType {
  text,
  button,
  checkbox,
  color,
  date,
  datetime,
  datetimeLocal,
  email,
  file,
  hidden,
  image,
  month,
  number,
  week,
  url,
  time,
  tel,
  submit,
  search,
  reset,
  range,
  radio,
  password;

  String get value {
    if (this == datetimeLocal) {
      return 'datetime-local';
    }
    return name;
  }
}
