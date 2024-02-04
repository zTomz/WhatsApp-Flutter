import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final String id;
  final DateTime created;
  final DateTime updated;
  final String collectionId;
  final String collectionName;
  final String description;
  final String image;
  final List<String> messages;
  final String name;
  final List<String> participants;

  Chat({
    required this.id,
    required this.created,
    required this.updated,
    required this.collectionId,
    required this.collectionName,
    required this.description,
    required this.image,
    required this.messages,
    required this.name,
    required this.participants,
  });

  
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);

  @override
  String toString() => toJson().toString();
}
