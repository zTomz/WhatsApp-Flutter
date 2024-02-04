import 'package:flutter/material.dart';
import 'package:whats_app/extensions/navigation_extension.dart';
import 'package:whats_app/extensions/theme_extension.dart';
import 'package:whats_app/pocketbase/pocketbase_app.dart';
import 'package:whats_app/presentation/pages/new_group_page.dart';
import 'package:whats_app/presentation/widgets/contact_list_view.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.surfaceTint,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select contact"),
            FutureBuilder<int>(
              future: pocketbase
                  .collection("users")
                  .getFullList()
                  .then((value) => value.length),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text(
                    "Loading...",
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                }

                return Text(
                  "${snapshot.data} contacts",
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
          ],
        ),
        actions: [
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
      body: ListView(
        children: [
          const SizedBox(height: 5),
          ListTile(
            onTap: () {
              context.push(const NewGroupPage());
            },
            minVerticalPadding: 20,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primary,
              ),
              child: const Icon(Icons.group_rounded),
            ),
            title: const Text(
              "New group",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minVerticalPadding: 20,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primary,
              ),
              child: const Icon(Icons.person_add_rounded),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_rounded),
            ),
            title: const Text(
              "New contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minVerticalPadding: 20,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primary,
              ),
              child: const Icon(Icons.groups_rounded),
            ),
            title: const Text(
              "New community",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
            onTap: (user) {},
            selectedAccounts: const {},
          ),
        ],
      ),
    );
  }
}
