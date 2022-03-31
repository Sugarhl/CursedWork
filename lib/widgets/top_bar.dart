import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    this.leftLabel = 'Назад',
    this.centerLabel = '',
    required this.leftAction,
    this.rightAction,
    Key? key,
    this.centerStyle,
    this.rightWidget,
    this.disableCurve = false,
  }) : super(key: key);

  final String leftLabel;
  final String centerLabel;
  final VoidCallback? leftAction;
  final VoidCallback? rightAction;

  final TextStyle? centerStyle;
  final Widget? rightWidget;
  final bool disableCurve;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 52,
      child: Column(
        children: [
          const SizedBox(height: 13),
          Stack(
            children: [
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: leftAction,
                    child: SizedBox(
                      child: Row(
                        children: [
                          if (!disableCurve)
                            SizedBox(
                              width: 9,
                              height: 15.59,
                              child: SvgPicture.asset(
                                'assets/backward_mark.svg',
                                color: AppColors.light,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          if (!disableCurve) const SizedBox(width: 10.68),
                          Text(
                            leftLabel,
                            style: AppTextStyles.button2(),
                          ),
                          const SizedBox(width: 10)
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: rightAction,
                    child: rightWidget ?? const SizedBox.shrink(),
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    centerLabel,
                    style: centerStyle ?? AppTextStyles.button2(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
