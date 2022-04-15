part of 'package:cursed_work/validation/fields.dart';

enum NicknameError { empty, size, unique }
enum DateError { empty, format, unique }
enum EmailError { empty, format }
enum PasswordError {
  empty,
  uppercase,
  digits,
  lowercase,
  specialCharacters,
  size
}

String getNicknameErrorMessage(NicknameError? error) {
  switch (error) {
    case null:
      return '';
    case NicknameError.empty:
      return 'Укажите никнейм';
    case NicknameError.size:
      return 'Слишком короткий логин';
    case NicknameError.unique:
      return 'Этот логин уже занят';
  }
}

String getEmailErrorMessage(EmailError? error) {
  switch (error) {
    case null:
      return '';
    case EmailError.format:
      return 'Неверный формат почты';
    case EmailError.empty:
      return '';
  }
}
