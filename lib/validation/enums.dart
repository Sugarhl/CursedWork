part of 'package:cursed_work/validation/fields.dart';

enum NicknameError { empty, size, unique }
enum DateError { empty, format }
enum EmailError { empty, format }
enum NameError { empty }
enum NumberError { empty, format, less, more }
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

String getNameErrorMessage(NameError? error) {
  switch (error) {
    case null:
      return '';
    case NameError.empty:
      return 'Пустое поле ';
  }
}

String getPasswordErrorMessage(PasswordError? error) {
  switch (error) {
    case null:
      return '';
    case PasswordError.empty:
      return 'Введите пароль';
    case PasswordError.uppercase:
      return 'Нет больших букв';
    case PasswordError.digits:
      return 'Нет цифр';
    case PasswordError.lowercase:
      return 'Нет маленьких букв';
    case PasswordError.specialCharacters:
      return 'Нет специальных символов';
    case PasswordError.size:
      return 'Слишком короткий';
  }
}

String getDateErrorMessage(DateError? error) {
  switch (error) {
    case null:
      return '';
    case DateError.empty:
      return 'Введите дату';
    case DateError.format:
      return 'Неверный формат';
  }
}

String getHeightErrorMessage(NumberError? error) {
  switch (error) {
    case null:
      return '';
    case NumberError.empty:
      return 'Введите рост';
    case NumberError.format:
      return 'Неверный формат';
    case NumberError.less:
      return 'Недопустимое значение';
    case NumberError.more:
      return 'Недопустимое значение';
  }
}

String getWeightErrorMessage(NumberError? error) {
  switch (error) {
    case null:
      return '';
    case NumberError.empty:
      return 'Введите вес';
    case NumberError.format:
      return 'Неверный формат';
    case NumberError.less:
      return 'Недопустимое значение';
    case NumberError.more:
      return 'Недопустимое значение';
  }
}
