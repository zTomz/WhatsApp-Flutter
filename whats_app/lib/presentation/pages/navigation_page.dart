import 'package:flutter/material.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/presentation/pages/calls_page.dart';
import 'package:whats_app/presentation/pages/chats_page.dart';
import 'package:whats_app/presentation/pages/community_page.dart';
import 'package:whats_app/presentation/pages/updates_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    super.key,
  });

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPage = 1;
  List<Widget> pages = const [
    CommunityPage(),
    ChatsPage(),
    UpdatesPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        currentPage: currentPage,
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
      body: pages[currentPage],
    );
  }
}

// TODO: Tab bar, doesnt work correctly (margin left)
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final void Function(int page) onPageChanged;

  const CustomAppBar({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surfaceTint,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  "WhatsApp",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 23,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  color: context.colorScheme.onBackground,
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  color: context.colorScheme.onBackground,
                  icon: const Icon(Icons.search_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  color: context.colorScheme.onBackground,
                  icon: const Icon(Icons.more_vert_rounded),
                ),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    onPageChanged(0);
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.groups_rounded,
                      color: currentPage == 0
                          ? context.colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                ),
                buildTab("Chats", 1, context),
                buildTab("Updates", 2, context),
                buildTab("Calls", 3, context),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                width: currentPage == 0
                    ? 55
                    : (MediaQuery.of(context).size.width - 50) / 3 - 5,
                height: 2,
                margin: EdgeInsets.only(
                  left: currentPage == 0 ? 0 : 118.0 * currentPage - 60,
                ),
                duration: const Duration(milliseconds: 200),
                color: context.colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildTab(String text, int page, BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          onPageChanged(page);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: currentPage == page
                  ? context.colorScheme.primary
                  : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
