import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarAdder extends StatelessWidget {
  const AvatarAdder({
    Key? key,
    this.progress,
    this.onPressed,
    required this.size,
    required this.localPath,
    this.remotePath,
    required this.loading,
  }) : super(key: key);

  final double? progress;
  final double size;
  final String localPath;
  final String? remotePath;
  final bool loading;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final back = Container(color: AppColors.light);
    return Container(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: ClipOval(
              child: loading
                  ? localPath.isNotEmpty
                      ? Image.file(
                          File(localPath),
                          fit: BoxFit.cover,
                        )
                      : back
                  : (remotePath != null)
                      ? CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context, url) => back,
                          errorWidget: (context, url, e) => back,
                          imageUrl: remotePath!,
                        )
                      : back,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: AppColors.light.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SvgPicture.asset(
                      'assets/camera_plus.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
