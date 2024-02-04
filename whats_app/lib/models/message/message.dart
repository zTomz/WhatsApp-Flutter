import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final DateTime created;
  final DateTime updated;
  final String collectionId;
  final String collectionName;
  final String chat;
  final String from;
  final List<String> images;
  final String message;
  final String status;

  Message({
    required this.id,
    required this.created,
    required this.updated,
    required this.collectionId,
    required this.collectionName,
    required this.chat,
    required this.from,
    required this.images,
    required this.message,
    required this.status,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() => toJson().toString();
}
