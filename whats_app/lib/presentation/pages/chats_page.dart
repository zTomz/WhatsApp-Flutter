import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/models/chat/chat.dart';
import 'package:whats_app/pocketbase/pocketbase_app.dart';
import 'package:whats_app/presentation/pages/chat_page.dart';
import 'package:whats_app/presentation/pages/select_contact_page.dart';
import 'package:whats_app/presentation/widgets/chat_image.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            const SelectContactPage(),
          );
        },
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.background,
        child: const Icon(Icons.message_rounded),
      ),
      body: FutureBuilder<List<RecordModel>>(
        future: pocketbase.collection('chats').getFullList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Chat> chats = [];

          for (var chat in snapshot.data!) {
            chats.add(Chat.fromJson(chat.toJson()));
          }

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];

              return ListTile(
                leading: ChatImage(
                  image: chat.image.isEmpty ? null : chat.image,
                ),
                title: Text(chat.name),
                subtitle: Text(
                  chat.messages.isEmpty
                      ? "No messages"
                      : "Here should be a message",
                ),
                onTap: () {
                  context.push(ChatPage(chat: chat));
                },
              );
            },
          );
        },
      ),
    );
  }
}
