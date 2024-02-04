import 'package:flutter/material.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/models/user.dart';
import 'package:whats_app/presentation/pages/create_group_page.dart';
import 'package:whats_app/presentation/widgets/contact_list_view.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({super.key});

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
  /// A map of a string -> id and a user -> account
  Map<String, User> selectedUsers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.surfaceTint,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("New group"),
            Text("Add members", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            CreateGroupPage(
              users: selectedUsers.values.toList(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedUsers.length,
                    itemBuilder: (context, index) {
                      final user = selectedUsers.values.toList()[index];

                      return Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
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
                                Positioned(
                                  right: -4,
                                  bottom: -4,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: context.colorScheme.background,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.clear_rounded,
                                      size: 15,
                                      color: context.colorScheme.background,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              user.username,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: AnimatedContainer(
              margin: EdgeInsets.only(
                top: selectedUsers.isEmpty ? 0 : 110,
              ),
              duration: const Duration(milliseconds: 300),
              color: context.colorScheme.background,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Contacts on WhatsApp",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ContactListView(
                    onTap: (user) {
                      setState(() {
                        if (selectedUsers.containsKey(user.id)) {
                          selectedUsers.remove(user.id);
                        } else {
                          selectedUsers[user.id] = user;
                        }
                      });
                    },
                    selectedAccounts: selectedUsers,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
