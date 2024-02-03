import 'package:flutter/material.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/pocketbase/pocketbase_app.dart';
import 'package:whats_app/presentation/pages/calls_page.dart';
import 'package:whats_app/presentation/pages/chats_page.dart';
import 'package:whats_app/presentation/pages/community_page.dart';
import 'package:whats_app/presentation/pages/navigation_page.dart';
import 'package:whats_app/presentation/pages/updates_page.dart';
import 'package:whats_app/presentation/widgets/input_field.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isSignIn = true;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController(text: "test@mail.com");
    passwordController = TextEditingController(text: "12345678");
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSignIn ? "Login" : "Create Account"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSignIn = !isSignIn;
              });
            },
            tooltip: "Switch to ${isSignIn ? "create account" : "sign in"}",
            icon: const Icon(Icons.person_2_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              controller: emailController,
              hintText: "Email or username",
              icon: const Icon(Icons.email_rounded),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            InputField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
              icon: const Icon(Icons.password_rounded),
            ),
            const SizedBox(height: 10),
            if (!isSignIn)
              InputField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true,
                icon: const Icon(Icons.password_rounded),
              ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!isSignIn) {
                        await PocketBaseApp().createAccount(
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                        );
                      } else {
                        await PocketBaseApp().authWithPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      }

                      if (context.mounted) {
                        context.push(
                          NavigationPage(
                            pages: const [
                              CommunityPage(),
                              ChatsPage(),
                              UpdatesPage(),
                              CallsPage(),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(isSignIn ? "Login" : "Create Account"),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: Text(
                  isSignIn
                      ? "Create an account instead"
                      : "Login to an existing account",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
