extension StringExt on String {
  bool get isValidName {
    final RegExp nameRegExp = RegExp(r"[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final RegExp passwordRegExp =
        RegExp(r'^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&? "]).*$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final RegExp phoneRegExp = RegExp(r"^[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPin {
    final RegExp phoneRegExp = RegExp(r"^[0-9]{4}$");
    return phoneRegExp.hasMatch(this);
  }
}
