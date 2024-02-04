import 'package:flutter/material.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/models/chat/chat.dart';
import 'package:whats_app/presentation/widgets/chat_image.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;

  const ChatPage({
    super.key,
    required this.chat,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();

    messageController = TextEditingController();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        chat: widget.chat,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.red,
                );
              },
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final span = TextSpan(
                text: messageController.text,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1,
                ),
              );
              final tp = TextPainter(
                text: span,
                maxLines: 6,
                textDirection: TextDirection.ltr,
              );
              tp.layout(
                maxWidth: constraints.maxWidth,
              ); // equals the parent screen width

              return Container(
                height: tp.height + 30,
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: context.colorScheme.surfaceTint,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.emoji_emotions_rounded),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: messageController,
                                  minLines: 1,
                                  maxLines: 6,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    height: 1,
                                  ),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "Message",
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file_rounded),
                            ),
                            if (messageController.text.isEmpty)
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt_rounded),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton.filled(
                      onPressed: () {
                        if (messageController.text.isEmpty) return;
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: context.colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      padding: const EdgeInsets.all(12),
                      icon: Icon(
                        messageController.text.isEmpty
                            ? Icons.mic_rounded
                            : Icons.send_rounded,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Chat chat;

  const ChatAppBar({
    super.key,
    required this.chat,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surfaceTint,
      height: 100,
      child: SafeArea(
        child: Row(
          children: [
            MaterialButton(
              onPressed: () {
                context.pop();
              },
              padding: const EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180),
              ),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(width: 10),
                  ChatImage(
                    size: 40,
                    image: chat.image.isEmpty ? null : chat.image,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      chat.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
