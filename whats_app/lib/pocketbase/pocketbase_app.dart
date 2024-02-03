import 'package:pocketbase/pocketbase.dart';
import 'package:whats_app/models/user.dart';

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

    getUser();

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

    getUser();

    return recordModel;
  }

  void getUser() {
    final user = pocketbase.authStore.model as RecordModel;
    currentUser = User(
      id: user.getStringValue("id"),
      username: user.getDataValue("username"),
      email: user.getStringValue("email"),
      avatar: user.getStringValue("avatar"),
    );
  }
}
