import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required String postId,
    required String userId,
    required String? imageUrl,
    required DateTime created_at,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
