// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendEntityImpl _$$FriendEntityImplFromJson(Map<String, dynamic> json) =>
    _$FriendEntityImpl(
      id: json['id'] as String,
      friends:
          (json['friends'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$$FriendEntityImplToJson(_$FriendEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'friends': instance.friends,
    };
