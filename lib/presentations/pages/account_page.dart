import 'dart:async';

import 'package:acf_news/data/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../data/api/firebase_services.dart';
import '../../utils/constants.dart';
import '../../utils/global_functions.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const routeName = '/account_page';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  FirebaseServices firebaseServices = FirebaseServices();

  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  bool isObscure = true;

  _updateDialog(
      {required BuildContext context,
      required String title,
      required String status,
      required String hintField,
      required UserACF? user,
      required TextEditingController controller}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: hintField),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () async {
                switch (status) {
                  case 'edit-username':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: controller.text,
                            email: user.email,
                            password: user.password)
                        .then(
                      (value) {
                        GlobalFunctions.scaffoldMessage(
                            context: context,
                            message: 'Data Berhasil diperbarui',
                            color: Colors.green);
                        Navigator.pop(context);
                      },
                    );
                    break;
                  case 'edit-umkmname':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: user.username,
                            email: user.email,
                            password: user.password)
                        .then(
                      (value) {
                        GlobalFunctions.scaffoldMessage(
                            context: context,
                            message: 'Data Berhasil diperbarui',
                            color: Colors.green);
                        Navigator.pop(context);
                      },
                    );
                    break;
                  case 'edit-email':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: user.username,
                            email: controller.text,
                            password: user.password)
                        .then(
                      (value) {
                        GlobalFunctions.scaffoldMessage(
                            context: context,
                            message: 'Data Berhasil diperbarui',
                            color: Colors.green);
                        Navigator.pop(context);
                      },
                    );
                    break;

                  case 'edit-password':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: user.username,
                            email: user.email,
                            password: controller.text)
                        .then(
                      (value) {
                        GlobalFunctions.scaffoldMessage(
                            context: context,
                            message: 'Data Berhasil diperbarui',
                            color: Colors.green);
                        Navigator.pop(context);
                      },
                    );
                    break;
                  default:
                }
                ;
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      firebaseServices.fetchUSer(uid: auth.currentUser!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Information Account',
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: StreamBuilder<UserACF>(
          stream: firebaseServices.streamUserData.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Account',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Center(
                    child: Image.asset(
                      '${assetImages}circle-avatar.png',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              status: 'edit-username',
                              user: snapshot.data,
                              context: context,
                              controller: _usernameTextFieldController,
                              hintField: snapshot.data!.username,
                              title: 'Insert new username'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.username,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              status: 'edit-email',
                              user: snapshot.data,
                              context: context,
                              controller: _emailTextFieldController,
                              hintField: snapshot.data!.email,
                              title: 'Insert new email'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.email,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              status: 'edit-password',
                              user: snapshot.data,
                              context: context,
                              controller: _passwordTextFieldController,
                              hintField:
                                  isObscure == true ? '********' : '********',
                              title: 'Insert new password'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  isObscure == true
                                      ? '********'
                                      : snapshot.data!.password,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
