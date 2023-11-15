class RegexPattern {
  static final RegExp containsMayus = RegExp(
    r'[A-Z]',
  );
  static final RegExp containsMinus = RegExp(
    r'[a-z]',
  );
  static final RegExp containsNumbers = RegExp(
    r'[0-9]',
  );
  static final RegExp containsSymbols = RegExp(
    r'[?@#]',
  );
}
