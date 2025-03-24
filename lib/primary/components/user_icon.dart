import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// ユーザーアイコン
///
/// [imageUrl] 画像URL
/// [width] 幅
/// [heigt] 高さ
/// [onTap] タップ時の処理 なにも処理しない場合null
///
///使用方法：
///
/// ```dart
/// PrimaryUserIcon(
///  imageUrl: imageUrl, //画像のURL
///     width: 48,
///    heigt: 48,
///   onTap: () {
///   // タップ時の処理
///   },
/// )
/// ```
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
              ? Icon(Icons.account_circle, size: width)
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
