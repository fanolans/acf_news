import 'package:acf_news/presentations/pages/login_page.dart';
import 'package:acf_news/presentations/pages/register_page.dart';
import 'package:acf_news/utils/global_functions.dart';
import 'package:acf_news/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});
  static const routeName = '/loginregister';

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GlobalFunctions.screenSize(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 300,
                decoration: const BoxDecoration(
                  color: kColorNavy,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Text(
                      'Welcome',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 14),
                    ),
                    Text(
                      'ACF News',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 48),
                    ),
                  ],
                ),
              ),
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                        labelColor: kColorNavy,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: kColorNavy,
                        // indicator: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(5)),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Login',
                          ),
                          Tab(
                            text: 'Register',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [LoginPage(), RegisterPage()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
