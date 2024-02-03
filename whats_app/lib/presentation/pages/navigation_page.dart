import 'package:flutter/material.dart';
import 'package:whats_app/extensions/theme_extension.dart';

class NavigationPage extends StatefulWidget {
  /// List of 4 pages
  final List<Widget> pages;

  const NavigationPage({
    super.key,
    required this.pages,
  }) : assert(pages.length == 4, 'Must have 4 pages');

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPage = 0;

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
      body: widget.pages[currentPage],
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
                  style: context.textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                ),
                IconButton(
                  onPressed: () {},
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
                      color:
                          currentPage == 0 ? context.colorScheme.primary : null,
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
              color: currentPage == page ? context.colorScheme.primary : null,
            ),
          ),
        ),
      ),
    );
  }
}
