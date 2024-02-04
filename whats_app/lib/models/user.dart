import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final DateTime created;
  final DateTime updated;
  final String collectionId;
  final String collectionName;
  final String avatar;
  final String email;
  final bool emailVisibility;
  final String username;
  final bool verified;

  User({
    required this.id,
    required this.created,
    required this.updated,
    required this.collectionId,
    required this.collectionName,
    required this.avatar,
    required this.email,
    required this.emailVisibility,
    required this.username,
    required this.verified,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => toJson().toString();
}
