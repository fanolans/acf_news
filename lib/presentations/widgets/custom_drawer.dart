import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../pages/bookmark_page.dart';
import '../pages/other_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: kColorSecondary),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                '${assetImages}circle-avatar.png',
              ),
            ),
            accountName: Text(
              'Farrel Nolan Syahdony',
            ),
            accountEmail: Text(
              'mailenolan@gmail.com',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Account'),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_added_rounded),
            title: const Text('My Bookmarks'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, BookmarkPage.routeName);
            },
          ),
          const ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notification'),
          ),
          const ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text('Dark Mode'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, OtherPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, OtherPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
