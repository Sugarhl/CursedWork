import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    this.text = 'Продолжить',
    required this.onTap,
    required this.unlocked,
    Key? key,
    this.height = 50,
  }) : super(key: key);

  final String text;
  final double height;
  final VoidCallback onTap;
  final bool unlocked;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
  late AnimationController _animationController;

  double get scale => 1 - _animationController.value;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0,
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
        if (widget.unlocked) {
          widget.onTap.call();
        }
      },
      onTapCancel: onTapCancel,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      child: Transform.scale(
        scale: scale,
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.unlocked
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
            child: Text(
              widget.text,
              style: AppTextStyles.button1().copyWith(
                color: widget.unlocked ? AppColors.white : AppColors.red,
              ),
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
    if (widget.unlocked) {
      _animationController.forward();
    }
  }

  void onTapCancel() {
    _animationController.forward();
  }
}
