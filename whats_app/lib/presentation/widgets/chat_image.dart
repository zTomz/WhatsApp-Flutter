import 'dart:io';

import 'package:flutter/material.dart';

class ChatImage extends StatelessWidget {
  final double size;
  final String? image;

  const ChatImage({
    super.key,
    this.size = 50,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.only(top: 12),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[600],
      ),
      child: image != null
          ? Image.file(
              File(image!)) // TODO: If database is public, change to network
          : Icon(
              Icons.group_rounded,
              size: size,
              color: Colors.grey[400],
            ),
    );
  }
}
