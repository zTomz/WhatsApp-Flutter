import 'package:flutter/material.dart';
import 'package:whats_app/extensions/theme_extension.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? icon;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.keyboardType,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 15),
          ],
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
