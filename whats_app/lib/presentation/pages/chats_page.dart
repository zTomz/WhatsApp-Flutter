import 'package:flutter/material.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/presentation/pages/select_contact_page.dart';

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
    );
  }
}
