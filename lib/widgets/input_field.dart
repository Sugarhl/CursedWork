import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.label,
    required this.hintText,
    this.controller,
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
    this.capitalization = TextCapitalization.none,
    this.onEditingComplete,
  }) : super(key: key);

  final String label;
  final Rx<String>? errorString;
  final String? hintText;
  final double? height;
  final EdgeInsets? contentPadding;
  final bool focus;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final TextCapitalization? capitalization;
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
                style: AppTextStyles.button1(),
              ),
              const Spacer(),
              if (errorString != null)
                Obx(
                  () => (errorString?.isNotEmpty)!
                      ? Text(
                          (errorString?.value)!,
                          style: AppTextStyles.mainText()
                              .copyWith(color: AppColors.orange),
                        )
                      : const SizedBox.shrink(),
                ),
            ],
          ),
        ),
        Stack(
          children: [
            if (errorString != null)
              Obx(
                () => Container(
                  height: height ?? 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: (errorString?.isNotEmpty)!
                        ? AppColors.orange
                        : AppColors.red,
                  ),
                ),
              ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.5, horizontal: 1.5),
              child: Container(
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
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                    isDense: true,
                    hintText: hintText,
                    hintStyle: AppTextStyles.mainText()
                        .copyWith(color: AppColors.hintText),
                    border: InputBorder.none,
                    suffixIcon: buildDatePicker(context),
                  ),
                  style: AppTextStyles.mainText(),
                  onChanged: onChanged,
                  inputFormatters:
                      datePicker ? [_dateFormatter] : inputFormatters,
                  onEditingComplete: () {
                    final currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if (onEditingComplete != null) {
                      onEditingComplete?.call();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconButton? buildDatePicker(BuildContext context) {
    if (datePicker) {
      return IconButton(
        icon: SvgPicture.asset(
          Assets.calendar,
          width: 17,
          height: 17,
        ),
        padding: const EdgeInsets.only(right: 17, top: 17, bottom: 17),
        splashRadius: 15,
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateBounds.left,
            lastDate: DateBounds.right,
          ).then((date) {
            _date = date!;
            final _day = NumberFormat('00').format(_date.day);
            final _month = NumberFormat('00').format(_date.month);
            final _year = NumberFormat('0000').format(_date.year);
            final dateLabel = '$_day.$_month.$_year';
            controller?.text = dateLabel;
          });
        },
      );
    }
    return null;
  }
}
