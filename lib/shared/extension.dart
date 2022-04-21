extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(this);
  }

  bool get isValidPhone {
    final internationalPhoneRegExp = RegExp(r'^\+?[0-9]{11}$');
    final localPhoneRegExp = RegExp(r'^0\d{9}$');
    return internationalPhoneRegExp.hasMatch(this) ||
        localPhoneRegExp.hasMatch(this);
  }

  bool get isValidPostalCode {
    final postalCodeRegExp = RegExp(r'^\d{4,5}$');
    return postalCodeRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }
}
