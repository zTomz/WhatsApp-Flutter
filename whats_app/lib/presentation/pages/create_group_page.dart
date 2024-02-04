import 'package:flutter/material.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/models/user.dart';
import 'package:whats_app/pocketbase/pocketbase_app.dart';
import 'package:whats_app/presentation/pages/navigation_page.dart';

class CreateGroupPage extends StatefulWidget {
  final List<User> users;
  const CreateGroupPage({
    super.key,
    required this.users,
  });

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.surfaceTint,
        title: const Text("New group"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await PocketBaseApp().createChat(
            titleController.text,
            widget.users,
          );

          if (context.mounted) {
            context.push(const NavigationPage());
          }
        },
        child: const Icon(Icons.done_rounded),
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: context.colorScheme.secondary,
            child: Row(
              children: [
                IconButton.filled(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.grey,
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: "Group name (optional)",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.emoji_emotions_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: context.colorScheme.secondary,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: ListTile(
                    title: const Text("Disappearing messages"),
                    subtitle: const Text("Off"),
                    trailing: const Icon(Icons.timelapse_rounded),
                    onTap: () {},
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: ListTile(
                    title: const Text("Group permission"),
                    trailing: const Icon(Icons.settings_rounded),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 7.5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Members: ${widget.users.length}",
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 7.5),
          GridView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true, // You won't see infinite size error
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: widget.users.length,
            itemBuilder: (context, index) {
              final user = widget.users[index];

              return Column(
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
                  const SizedBox(height: 10),
                  Text(
                    user.username,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
