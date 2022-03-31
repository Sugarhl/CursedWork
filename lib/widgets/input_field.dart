import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.label,
    required this.hintText,
    required this.controller,
    this.focus = false,
    this.onChanged,
    Key? key,
    this.height,
    this.contentPadding,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.datePicker = false,
    this.errorString,
  }) : super(key: key);

  final String label;
  final String? errorString;
  final String? hintText;
  final double? height;
  final EdgeInsets? contentPadding;
  final bool focus;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool datePicker;

  DateTime _date = DateTime.now();
  final _dateFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {'#': RegExp('[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Row(
            children: [
              Text(
                label,
                style: AppTextStyles.button1().copyWith(color: AppColors.light),
              ),
              const Spacer(),
              if (errorString != null)
                Text(
                  errorString!,
                  style:
                      AppTextStyles.button1().copyWith(color: AppColors.orange),
                ),
            ],
          ),
        ),
        Container(
          height: height ?? 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.light,
          ),
          child: TextField(
            enabled: enabled,
            autofocus: focus,
            controller: controller,
            cursorColor: AppColors.black,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              isDense: true,
              hintText: hintText,
              hintStyle:
                  AppTextStyles.mainText().copyWith(color: AppColors.hintText),
              border: InputBorder.none,
              suffixIcon: buildDatePicker(context),
            ),
            style: AppTextStyles.mainText(),
            onChanged: onChanged,
            inputFormatters: datePicker ? [_dateFormatter] : inputFormatters,
            onEditingComplete: () {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus && !focus) {
                currentFocus.unfocus();
              }
            },
          ),
        ),
      ],
    );
  }

  IconButton? buildDatePicker(BuildContext context) {
    if (datePicker) {
      return IconButton(
        icon: SvgPicture.asset(
          'assets/calendar.svg',
          width: 17,
          height: 17,
        ),
        padding: const EdgeInsets.only(right: 17, top: 17, bottom: 17),
        splashRadius: 15,
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: leftBound,
            lastDate: rightBound,
          ).then((date) {
            _date = date!;
            final _day = NumberFormat('00').format(_date.day);
            final _month = NumberFormat('00').format(_date.month);
            final _year = NumberFormat('0000').format(_date.year);
            final dateLabel = '$_day.$_month.$_year';
            controller.text = dateLabel;
          });
        },
      );
    }
    return null;
  }
}