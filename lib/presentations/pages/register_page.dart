import 'package:acf_news/data/model/user_model.dart';
import 'package:acf_news/presentations/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/api/firebase_services.dart';
import '../../utils/global_functions.dart';
import '../../utils/styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPassController = TextEditingController(text: '');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVissiblePassword = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  void clearField() {
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPassController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GlobalFunctions.screenSize(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          width: size.width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong isi email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(16),
                    fillColor: kColorNavy,
                    hintText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorNavy,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffD6D6D6),
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade300,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong isi username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: kColorNavy,
                      hintText: 'Username',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kColorNavy,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xffD6D6D6),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade300,
                          width: 1,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong isi passwrod';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: kColorNavy,
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kColorNavy,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xffD6D6D6),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade300,
                          width: 1,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: confirmPassController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: isVissiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong isi Password';
                    }
                    if (value != passwordController.text) {
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          isVissiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kColorNavy,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            isVissiblePassword = !isVissiblePassword;
                          });
                        },
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: kColorNavy,
                      hintText: 'Confirm Password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kColorNavy,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xffD6D6D6),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade300,
                          width: 1,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 154,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kColorNavy,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      if (GlobalFunctions.validate(
                          context: context, formkey: formKey)) {
                        try {
                          await FirebaseServices.register(
                                  name: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then(
                            (value) {
                              final user = UserACF(
                                id: value.user!.uid,
                                username: usernameController.text,
                                email: value.user!.email!,
                                password: passwordController.text,
                              );

                              mainCollection
                                  .doc(auth.currentUser!.uid)
                                  .set(user.toMap())
                                  .whenComplete(() {
                                clearField();
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message: 'Register Sukses silahkan login',
                                    color: Colors.green);
                                Navigator.pop(context);
                              }).catchError(
                                (e) => print(
                                  e,
                                ),
                              );
                            },
                          );
                        } on FirebaseAuthException catch (e) {
                          print(e.code);
                          if (e.code == 'weak-password') {
                            GlobalFunctions.scaffoldMessage(
                                context: context,
                                message: 'Password terlalu lemah',
                                color: Colors.red);
                          } else if (e.code == 'email-already-in-use') {
                            GlobalFunctions.scaffoldMessage(
                                context: context,
                                message:
                                    'Email Sudah terdaftar coba email lain',
                                color: Colors.red);
                          } else if (e.code == 'invalid-email') {
                            GlobalFunctions.scaffoldMessage(
                                context: context,
                                message:
                                    'Email salah. Masukan Email yang benar',
                                color: Colors.red);
                          } else if (e.code == 'too-many-requests') {
                            GlobalFunctions.scaffoldMessage(
                                context: context,
                                message:
                                    'Terlalu banyak permintaan login tunggu sebentar ...',
                                color: Colors.red);
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                    child: const Text(
                      'Daftar',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                              color: const Color(0xff9E9E9E),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Text(
                        ' Sign In Here'.toUpperCase(),
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
