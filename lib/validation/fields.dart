import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

part 'package:cursed_work/validation/enums.dart';

class Nickname extends FormzInput<String, NicknameError> {
  const Nickname.pure() : super.pure('');

  const Nickname.dirty({String value = ''}) : super.dirty(value);

  @override
  NicknameError? validator(String value) {
    if (value.isEmpty) {
      return NicknameError.empty;
    }
    if (value.length < 3) {
      return NicknameError.size;
    }
    return null;
  }
}

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');

  const Email.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailError? validator(String value) {
    if (value.isEmpty) {
      return EmailError.empty;
    }
    return EmailValidator.validate(value) ? null : EmailError.format;
  }
}

class Name extends FormzInput<String, NameError> {
  const Name.pure() : super.pure('');

  const Name.dirty({String value = ''}) : super.dirty(value);

  @override
  NameError? validator(String value) {
    return value.isEmpty ? NameError.empty : null;
  }
}

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  const Password.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    }
    if (value.length < 6) {
      return PasswordError.size;
    }
    final hasUppercase = value.contains(RegExp('[A-Z]'));
    if (!hasUppercase) {
      return PasswordError.uppercase;
    }
    final hasDigits = value.contains(RegExp('[0-9]'));
    if (!hasDigits) {
      return PasswordError.digits;
    }
    final hasLowercase = value.contains(RegExp('[a-z]'));
    if (!hasLowercase) {
      return PasswordError.lowercase;
    }
    // final hasSpecialCharacters =
    //     value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'));
    // if (!hasSpecialCharacters) {
    //   return PasswordError.specialCharacters;
    // }
    return null;
  }
}

class Date extends FormzInput<String, DateError> {
  const Date.pure() : super.pure('');

  const Date.dirty({String value = ''}) : super.dirty(value);

  @override
  DateError? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    final format = DateFormat('dd.MM.yyyy');
    DateTime date;
    try {
      date = format.parse(value);
    } on Exception {
      return DateError.format;
    }
    if (format.format(date) != value) {
      return DateError.format;
    }
    return null;
  }
}

class Height extends FormzInput<String, NumberError> {
  const Height.pure() : super.pure('');

  const Height.dirty({String value = ''}) : super.dirty(value);

  @override
  NumberError? validator(String value) {
    var height = 1;
    try {
      height = int.parse(value);
    } on Exception {
      return NumberError.format;
    }
    return null;
  }
}

class Weight extends FormzInput<String, NumberError> {
  const Weight.pure() : super.pure('');

  const Weight.dirty({String value = ''}) : super.dirty(value);

  @override
  NumberError? validator(String value) {
    var weight = 1;
    try {
      weight = int.parse(value);
    } on Exception {
      return NumberError.format;
    }
    return null;
  }
}
