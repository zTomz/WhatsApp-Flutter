import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/models/user.dart';
import 'package:whats_app/pocketbase/pocketbase_app.dart';

class ContactListView extends StatelessWidget {
  final void Function(User user) onTap;

  /// A map of a string -> id and a User -> account
  final Map<String, User> selectedAccounts;

  const ContactListView({
    super.key,
    required this.onTap,
    required this.selectedAccounts,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecordModel>>(
      future: pocketbase.collection('users').getFullList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No contacts found"),
          );
        }

        List<User> users = [];

        for (var contact in snapshot.data!) {
          users.add(User.fromJson(contact.toJson()));
        }

        return Column(
          children: users
              .map(
                (user) => ListTile(
                  onTap: () {
                    onTap(user);
                  },
                  minVerticalPadding: 20,
                  leading: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.only(top: 12.5),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[600],
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          size: 45,
                          color: Colors.grey[400],
                        ),
                      ),
                      if (selectedAccounts.containsKey(user.id))
                        Positioned(
                          right: -4,
                          bottom: -4,
                          child: Container(
                            width: 24,
                            height: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: context.colorScheme.background,
                              ),
                            ),
                            child: Icon(
                              Icons.done_rounded,
                              size: 15,
                              color: context.colorScheme.background,
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(
                    user.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
