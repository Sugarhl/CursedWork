import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Avatar extends StatelessWidget {
  Avatar({
    Key? key,
    required this.size,
    this.url,
  }) : super(key: key);

  final double size;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.white10,
          child: SizedBox(
            width: size,
            height: size,
            child: ClipOval(
              child: url != null && url!.isNotEmpty
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: size,
                      height: size,
                      placeholder: (context, url) => Container(
                        color: Colors.white.withOpacity(0.1),
                      ),
                      errorWidget: (context, url, e) => Container(
                        color: Colors.white.withOpacity(0.1),
                      ),
                      imageUrl: url!,
                    )
                  : SvgPicture.asset(
                      'assets/placeholder.svg',
                      width: size,
                      height: size,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
