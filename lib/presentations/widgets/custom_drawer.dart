import 'dart:io';

import 'package:acf_news/presentations/widgets/platform_widget.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/provider/preferences_provider.dart';
import '../../data/provider/scheduling_provider.dart';
import '../../utils/constants.dart';
import '../pages/bookmark_page.dart';
import '../pages/other_page.dart';
import 'custom_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Drawer(
      child: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return Drawer(
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
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
              ListTile(
                leading: const Icon(Icons.notifications_active),
                title: const Text('Notification'),
                trailing: Consumer<SchedulingProvider>(
                  builder: (context, scheduled, _) {
                    return Switch.adaptive(
                      value: provider.isDailyNewsActive,
                      onChanged: (value) async {
                        if (Platform.isIOS) {
                          customDialog(context);
                        } else {
                          scheduled.scheduledNews(value);
                          provider.enableDailyNews(value);
                        }
                      },
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode_outlined),
                title: const Text('Dark Mode'),
                trailing: Consumer<PreferencesProvider>(
                    builder: (context, provider, child) {
                  return Switch.adaptive(
                    value: provider.isDarkTheme,
                    onChanged: (value) {
                      provider.enableDarkTheme(value);
                    },
                  );
                }),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
