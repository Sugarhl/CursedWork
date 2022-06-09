import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DevicePreview extends StatefulWidget {
  const DevicePreview(
      {Key? key, required this.channel, this.onTap, required this.subscribe})
      : super(key: key);

  final String channel;
  final VoidCallback? onTap;
  final bool subscribe;

  @override
  State<StatefulWidget> createState() {
    return DevicePreviewState();
  }
}

class DevicePreviewState extends State<DevicePreview>
    with TickerProviderStateMixin {
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
      onTap: widget.onTap,
      onTapCancel: onTapCancel,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      child: buildNormal(),
    );
  }

  bool active = false;

  Widget buildNormal() {
    return GestureDetector(
      onTap: () {
        context.navigateTo(const FeedRouter());
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.light,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 25),
          child: Row(
            children: [
              Text(
                widget.channel,
                style: AppTextStyles.heading2().copyWith(
                  color: AppColors.dark,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.navigateTo(CreatePostRouter(channel: 'channel'));
                },
                child: SvgPicture.asset(
                  Assets.plus,
                  height: 30,
                  width: 30,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    active = !active;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: active
                        ? AppColors.red
                        : AppColors.light.withOpacity(0.3),
                    border: Border.all(color: AppColors.red, width: 2),
                  ),
                  child: Text(
                    active ? 'Подписаться' : 'Отписаться',
                    style: AppTextStyles.bigText().copyWith(
                      fontWeight: FontWeight.w600,
                      color: active ? AppColors.light : AppColors.dark,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }

  void onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void onTapCancel() {
    _animationController.forward();
  }
}
