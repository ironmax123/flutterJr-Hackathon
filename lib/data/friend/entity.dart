import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class FriendEntity with _$FriendEntity {
  const factory FriendEntity({
    required String id,
  }) = _FriendEntity;

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      _$FriendEntityFromJson(json);
}
