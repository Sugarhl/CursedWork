import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({
    required this.gender,
    required this.onTap,
    required this.active,
    Key? key,
  }) : super(key: key);

  final Gender gender;
  final VoidCallback onTap;
  final bool active;

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  double get scale => 1 - _animationController.value;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.active) {
          widget.onTap.call();
        }
      },
      onTapCancel: onTapCancel,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      child: Transform.scale(
        scale: scale,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: widget.active
                ? AppColors.red
                : AppColors.light.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.5),
                offset: const Offset(0, 3),
                blurRadius: 2,
              )
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              widget.gender == Gender.male ? Assets.male : Assets.female,
              color: widget.active ? AppColors.light : AppColors.red,
            ),
          ),
        ),
      ),
    );
  }

  void onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void onTapDown(TapDownDetails details) {
    if (!widget.active) {
      _animationController.forward();
    }
  }

  void onTapCancel() {
    _animationController.forward();
  }
}
