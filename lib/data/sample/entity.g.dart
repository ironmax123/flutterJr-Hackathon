// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleEntityImpl _$$SampleEntityImplFromJson(Map<String, dynamic> json) =>
    _$SampleEntityImpl(
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$SampleEntityImplToJson(_$SampleEntityImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
    };
