import 'package:pocketbase/pocketbase.dart';
import 'package:whats_app/models/user/user.dart';

PocketBase pocketbase = PocketBase('http://10.0.2.2:8090');

class PocketBaseApp {
  static final PocketBaseApp _singleton = PocketBaseApp._();
  factory PocketBaseApp() => _singleton;
  PocketBaseApp._();

  User? currentUser;

  Future<RecordAuth?> authWithPassword(
    String email,
    String password,
  ) async {
    final recordAuth = await pocketbase.collection('users').authWithPassword(
          email,
          password,
        );

    return recordAuth;
  }

  Future<RecordModel> createAccount(
      String email, String password, String confirmPassword) async {
    final body = <String, dynamic>{
      "username": email.split("@").first,
      "email": email,
      "password": password,
      "passwordConfirm": confirmPassword,
    };

    final recordModel = await pocketbase.collection('users').create(
          body: body,
        );

    return recordModel;
  }

  Future<void> createChat(String name, List<User> users) async {
    final body = <String, dynamic>{
      "name": name,
      "participants": users.map((user) => user.id).toList(),
    };

    // ignore: unused_local_variable
    final record = await pocketbase.collection('chats').create(body: body);
  }
}
