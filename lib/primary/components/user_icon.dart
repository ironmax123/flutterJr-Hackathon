import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PrimaryUserIcon extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double heigt;
  final GestureTapCallback? onTap;
  const PrimaryUserIcon({
    super.key,
    required this.imageUrl,
    this.width = 48,
    this.heigt = 48,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(27),
      child: Material(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(27),
          child: imageUrl == "null" || imageUrl.isEmpty
              ? const Icon(Icons.account_circle, size: 48)
              : CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: width,
                  height: heigt,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
