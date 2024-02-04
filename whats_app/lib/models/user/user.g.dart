// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      emailVisibility: json['emailVisibility'] as bool,
      username: json['username'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'avatar': instance.avatar,
      'email': instance.email,
      'emailVisibility': instance.emailVisibility,
      'username': instance.username,
      'verified': instance.verified,
    };
