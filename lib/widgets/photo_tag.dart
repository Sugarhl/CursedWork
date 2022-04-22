import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoPreviewTagTiny extends StatelessWidget {
  const PhotoPreviewTagTiny({
    Key? key,
    required this.path,
    required this.onTap,
    this.borderRadius = 22,
    this.height,
    this.width,
  }) : super(key: key);

  final void Function() onTap;
  final String path;
  final double? height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        radius: 0,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(path),
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoViewGallery extends StatelessWidget {
  const PhotoViewGallery({
    Key? key,
    required this.images,
    this.height = 130,
    // this.width = 300,
    this.spacing = 5,
    this.padding = EdgeInsets.zero,
    this.showPhotoLabel = true,
    this.onPhotoClicked,
  }) : super(key: key);

  final List<String> images;
  final double height;

  final EdgeInsets padding;

  final double spacing;
  final bool showPhotoLabel;

  final void Function(int)? onPhotoClicked;

  @override
  Widget build(BuildContext context) {
    Widget gallery;
    if (images.length == 1) {
      gallery = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PhotoPreviewTagTiny(
              path: images[0],
              borderRadius: 5,
              onTap: () {
                onPhotoClicked?.call(0);
              },
            ),
          )
        ],
      );
    } else if (images.length == 2) {
      gallery = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PhotoPreviewTagTiny(
              borderRadius: 5,
              path: images[0],
              onTap: () {
                onPhotoClicked?.call(0);
              },
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: PhotoPreviewTagTiny(
              borderRadius: 5,
              path: images[1],
              onTap: () {
                onPhotoClicked?.call(1);
              },
            ),
          ),
        ],
      );
    } else {
      final countMessagge =
          images.length > 3 ? '+${images.length - 3} фотографий' : '';
      gallery = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: PhotoPreviewTagTiny(
              borderRadius: 5,
              path: images[0],
              onTap: () {
                onPhotoClicked?.call(0);
              },
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: PhotoPreviewTagTiny(
                    borderRadius: 5,
                    path: images[1],
                    onTap: () {
                      onPhotoClicked?.call(1);
                    },
                  ),
                ),
                SizedBox(height: spacing),
                Expanded(
                  child: Stack(
                    children: [
                      PhotoPreviewTagTiny(
                        borderRadius: 5,
                        path: images[2],
                        onTap: () {
                          onPhotoClicked?.call(2);
                        },
                      ),
                      Positioned.fill(
                        child: Visibility(
                          visible: showPhotoLabel && images.length > 3,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: showPhotoLabel && images.length > 3,
                        child: Center(
                          child: Text(
                            countMessagge,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 26 / 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        child: gallery,
      ),
    );
  }
}
