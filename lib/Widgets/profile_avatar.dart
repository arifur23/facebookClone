import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../data/data.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({super.key, required this.imageUrl,  this.isActive = false,  this.hasBorder = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
            backgroundColor: Colors.grey[200],
          ),
        ),
        isActive ?
        Positioned(
          bottom: 0.0,
            right: 0.0,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Palette.online,
                border: Border.all(width: 2.0, color: Colors.white)
              ),
            )
        ) : const SizedBox.shrink()
      ],
    );
  }
}
