import 'package:pocketbase/pocketbase.dart';

PocketBase pocketbase = PocketBase('http://10.0.2.2:8090');

class PocketBaseApp {
  static Future<RecordAuth?> authWithPassword(
    String email,
    String password,
  ) async {
    return await pocketbase.collection('users').authWithPassword(
          email,
          password,
        );
  }

  static Future<RecordModel> createAccount(
      String email, String password, String confirmPassword) async {
    final body = <String, dynamic>{
      "username": email.split("@").first,
      "email": email,
      "password": password,
      "passwordConfirm": confirmPassword,
    };

    return await pocketbase.collection('users').create(
          body: body,
        );
  }
}
