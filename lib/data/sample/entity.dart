import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class SampleEntity with _$SampleEntity {
  const factory SampleEntity({
    required String postId,
    required String userId,
    required String? imageUrl,
  }) = _SampleEntity;

  factory SampleEntity.fromJson(Map<String, dynamic> json) =>
      _$SampleEntityFromJson(json);
}
