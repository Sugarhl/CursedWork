import 'package:cursed_work/validation/fields.dart';
import 'package:formz/formz.dart';

class AccountForm with FormzMixin {
  AccountForm({
    required String email,
    required String nickname,
  }) {
    this.email = Email.dirty(value: email);
    this.nickname = Nickname.dirty(value: nickname);
  }

  late final Email email;
  late final Nickname nickname;

  @override
  List<FormzInput> get inputs => [email, nickname];
}

class PersonalForm with FormzMixin {
  PersonalForm({
    required String name,
    required String surname,
    required String date,
  }) {
    this.name = Name.dirty(value: name);
    this.surname = Name.dirty(value: surname);
    this.date = Date.dirty(value: date);
  }

  late final Date date;
  late final Name name;
  late final Name surname;

  @override
  List<FormzInput> get inputs => [date, name, surname];
}

class BiometicsForm with FormzMixin {
  BiometicsForm({
    required String height,
    required String weight,
  }) {
    this.height = Height.dirty(value: height);
    this.weight = Weight.dirty(value: weight);
  }

  late final Height height;
  late final Weight weight;

  @override
  List<FormzInput> get inputs => [height, weight];
}

class SettingsForm with FormzMixin {
  SettingsForm({
    required String name,
    required String surname,
    required String date,
    required String height,
    required String weight,
  }) {
    this.name = Name.dirty(value: name);
    this.surname = Name.dirty(value: surname);
    this.date = Date.dirty(value: date);
    this.height = Height.dirty(value: height);
    this.weight = Weight.dirty(value: weight);
  }

  late final Date date;
  late final Name name;
  late final Name surname;
  late final Height height;
  late final Weight weight;

  @override
  List<FormzInput> get inputs => [height, weight, date, name, surname];
}
