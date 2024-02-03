import 'package:flutter/material.dart';
import 'package:whats_app/extensions/theme_extension.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Stack(
              alignment: Alignment.center,
              children: [
                const Placeholder(
                  fallbackHeight: 250,
                  fallbackWidth: double.infinity,
                ),
                Text(
                  "Community image",
                  style: context.textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Stay connected with a community",
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you're added to will appear here.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {},
              icon: const Text("See example communities"),
              label: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.background,
                    ),
                    child: const Text("Start your community"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
