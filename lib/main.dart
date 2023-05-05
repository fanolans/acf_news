import 'dart:io';

import 'package:acf_news/data/api/api_service.dart';
import 'package:acf_news/presentations/pages/account_page.dart';
import 'package:acf_news/presentations/pages/article_detail_page.dart';
import 'package:acf_news/presentations/pages/article_web_view.dart';
import 'package:acf_news/presentations/pages/bookmark_page.dart';
import 'package:acf_news/presentations/pages/home_page.dart';
import 'package:acf_news/presentations/pages/login_register_page.dart';
import 'package:acf_news/presentations/pages/other_page.dart';
import 'package:acf_news/presentations/pages/register_page.dart';
import 'package:acf_news/presentations/pages/search_page.dart';
import 'package:acf_news/presentations/pages/login_page.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/firebase_services.dart';
import 'data/database/database_helper.dart';
import 'data/model/article_model.dart';
import 'data/preferences/preferences_helper.dart';
import 'data/provider/database_provider.dart';
import 'data/provider/news_provider.dart';
import 'data/provider/preferences_provider.dart';
import 'data/provider/scheduling_provider.dart';
import 'data/provider/search_provider.dart';
import 'utils/background_service.dart';
import 'utils/navigation.dart';
import 'utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await Firebase.initializeApp();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsProvider(
            apiService: ApiServices(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SchedulingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(
            apiService: ApiServices(),
          ),
        ),
      ],
      child: StreamBuilder<User?>(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            return Consumer<PreferencesProvider>(
              builder: (context, provider, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'News App',
                  theme: provider.themeData,
                  builder: (context, child) {
                    return CupertinoTheme(
                      data: CupertinoThemeData(
                        brightness: provider.isDarkTheme
                            ? Brightness.dark
                            : Brightness.light,
                      ),
                      child: Material(
                        child: child,
                      ),
                    );
                  },
                  navigatorKey: navigatorKey,
                  initialRoute: LoginRegisterPage.routeName,
                  routes: {
                    LoginPage.routeName: (context) => const LoginPage(),
                    RegisterPage.routeName: (context) => const RegisterPage(),
                    LoginRegisterPage.routeName: (context) =>
                        const LoginRegisterPage(),
                    HomePage.routeName: (context) => const HomePage(),
                    SearchPage.routeName: (context) => const SearchPage(),
                    AccountPage.routeName: (context) => const AccountPage(),
                    OtherPage.routeName: (context) => const OtherPage(),
                    BookmarkPage.routeName: (context) => const BookmarkPage(),
                    ArticleDetailPage.routeName: (context) => ArticleDetailPage(
                          article: ModalRoute.of(context)?.settings.arguments
                              as Article,
                        ),
                    ArticleWebView.routeName: (context) => ArticleWebView(
                          url: ModalRoute.of(context)?.settings.arguments
                              as String,
                        ),
                  },
                );
              },
            );
          }),
    );
  }
}
