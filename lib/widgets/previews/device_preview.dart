import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/device_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DevicePreview extends StatefulWidget {
  const DevicePreview({Key? key, required this.device, this.onTap})
      : super(key: key);

  const DevicePreview.plus({Key? key, required this.onTap, this.device})
      : super(key: key);
  final DeviceModel? device;
  final VoidCallback? onTap;

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
      child: (widget.device == null) ? buildPlus() : buildNormal(),
    );
  }

  Widget buildNormal() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.light,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15),
          child: Text(
            (widget.device?.name)!,
            style: AppTextStyles.button2().copyWith(
              color: AppColors.dark,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPlus() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, right: 15),
          child: Center(
            child: SvgPicture.asset(
              Assets.plus,
              height: 30,
              width: 30,
              color: AppColors.light,
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
    _animationController.forward();
  }

  void onTapCancel() {
    _animationController.forward();
  }
}
