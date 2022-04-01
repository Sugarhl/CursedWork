import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';

class PostMenu extends PopupMenuEntry<SettingsMenuAction> {
  const PostMenu({Key? key, this.height = 40, required this.onLogout})
      : super(key: key);

  final void Function() onLogout;

  // final void Function()? onRemove;

  @override
  final double height;

  @override
  bool represents(SettingsMenuAction? value) =>
      value == SettingsMenuAction.logout;

  @override
  State<StatefulWidget> createState() => _PostMenuState();
}

class _PostMenuState extends State<PostMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: widget.onLogout,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              'Выйти из учетной записи',
              style: AppTextStyles.button2(),
            ),
          ),
        ),
      ],
    );
  }
}
