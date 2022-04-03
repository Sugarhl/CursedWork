import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.onTap}) : super(key: key);
  final void Function(int value) onTap;

  @override
  State<StatefulWidget> createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  BottomBarItem currentPage = BottomBarItem.recommendations;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = BottomBarItem.recommendations;
                  });
                  widget.onTap.call(BottomBarItem.recommendations.index);
                },
                child: SvgPicture.asset(
                  Assets.recommendations,
                  height: 35,
                  width: 35,
                  color: currentPage == BottomBarItem.recommendations
                      ? AppColors.red
                      : AppColors.light,
                ),
              ),
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = BottomBarItem.statistics;
                  });
                  widget.onTap.call(BottomBarItem.statistics.index);
                },
                child: SvgPicture.asset(
                  Assets.stats,
                  height: 35,
                  width: 35,
                  color: currentPage == BottomBarItem.statistics
                      ? AppColors.red
                      : AppColors.light,
                ),
              ),
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = BottomBarItem.profile;
                  });
                  widget.onTap.call(BottomBarItem.profile.index);
                },
                child: SvgPicture.asset(
                  Assets.user,
                  height: 35,
                  width: 35,
                  color: currentPage == BottomBarItem.profile
                      ? AppColors.red
                      : AppColors.light,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
