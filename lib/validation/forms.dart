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
